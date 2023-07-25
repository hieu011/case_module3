package serviceadmin;


import model.Singer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SingerServiceMySQL implements ISingerService {
    private static final String SELECT_ALL_SINGER_TYPES = "SELECT * FROM singer;";
    private static final String FIND_BY_ID = "SELECT * FROM singer where id = ?;";

    private String jdbcURL = "jdbc:mysql://localhost:3306/music_md3";
    private String jdbcUsername = "root";
    private String jdbcPassword = "vanhieu0112";

    @Override
    public List<Singer> findAll() {
        List<Singer> singers = new ArrayList<>();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_SINGER_TYPES);

            System.out.println("findAll: " + preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int idCate = rs.getInt("id");
                String name = rs.getString("name");
                Singer singer = new Singer(idCate, name);

                singers.add(singer);
            }
            connection.close();
        } catch (SQLException sqlException) {
            printSQLException(sqlException);
        }
        return singers;
    }

    @Override
    public Singer findById(int id) {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);
            preparedStatement.setInt(1, id);

            System.out.println("findById: " + preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int idCate = rs.getInt("id");
                String name = rs.getString("name");
                Singer singer = new Singer(idCate, name);
                return singer;
            }
        } catch (SQLException sqlException) {
            printSQLException(sqlException);
        }
        return null;
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
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
