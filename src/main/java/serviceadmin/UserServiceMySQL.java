package serviceadmin;


import model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class UserServiceMySQL implements IUserService {
    private static final String FIND_ALL_USER = "SELECT u.id, u.user_name as username, u.password as password \n" +
            "FROM user as u\n" +
            "WHERE u.id_role = 2;";
    private static final String FIND_BY_ID = "SELECT u.id, u.user_name as username, u.password as password \n" +
            "FROM user as u\n" +
            "WHERE u.id_role = ?;";

    private String jdbcURL = "jdbc:mysql://localhost:3306/music_md3";
    private String jdbcUsername = "root";
    private String jdbcPassword = "vanhieu0112";


    @Override
    public List<User> findAll() {
        List<User> users = new ArrayList<>();

        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL_USER);

            System.out.println("findAllUser:" + preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("username");
                String password = rs.getString("password");
//                String role = rs.getString("user_role");

                User user = new User(id, name, password);
                users.add(user);
            }
            connection.close();
        } catch (SQLException exception) {
            printSQLException(exception);
        }
        return users;
    }

    @Override
    public User findById(int id) {
        try{
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);

            preparedStatement.setInt(1, id);

            System.out.println("FindByID: " + preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int idUser = rs.getInt("id");
                String name = rs.getString("username");
                String password = rs.getString("password");
//                String role = rs.getString("role");

                return new User(idUser, name, password);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void update(int id, User user) {
        try{
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE `user` SET `user_name` = ?, password = ? WHERE (`id` = ?);\n");

            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setInt(3, id);

            System.out.println("update: " + preparedStatement);
            preparedStatement.executeUpdate();
            connection.close();
        }catch (SQLException exception) {
            printSQLException(exception);
        }
    }

    @Override
    public void remove(int id) {
        try{
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM `user` WHERE (`id` = ?);");
            preparedStatement.setLong(1,id);

            System.out.println("RemoveUser " + preparedStatement);
            preparedStatement.executeUpdate();

            connection.close();
        } catch (SQLException exception){
            printSQLException(exception);
        }
    }


    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }
    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }

}