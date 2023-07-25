package serviceadmin;


import model.Author;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AuthorServiceMySQL implements IAuthorService {

    private static final String SELECT_ALL_AUTHOR_TYPES = "SELECT * FROM author;";
    private static final String FIND_BY_ID = "SELECT * FROM author where id = ?;";

    private String jdbcURL = "jdbc:mysql://localhost:3306/music_md3";
    private String jdbcUsername = "root";
    private String jdbcPassword = "vanhieu0112";


    @Override
    public List<Author> findAll() {
        List<Author> authors = new ArrayList<>();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_AUTHOR_TYPES);

            System.out.println("findAll: " + preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int idCate = rs.getInt("id");
                String name = rs.getString("name");
                Author author = new Author(idCate, name);

                authors.add(author);
            }
        } catch (SQLException sqlException) {
            printSQLException(sqlException);
        }
        return authors;
    }
    @Override
    public Author findById(int id) {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);
            preparedStatement.setInt(1, id);

            System.out.println("findById: " + preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int idCate = rs.getInt("id");
                String name = rs.getString("name");
                Author author = new Author(idCate, name);
                return author;
            }
        } catch (SQLException sqlException) {
            printSQLException(sqlException);

        }
        return null;
    }
    @Override
    public void update(int id, Author author) {
        try{
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE `author` SET `name` = ? WHERE (`id` = ?);");

            preparedStatement.setString(1, author.getName());
            preparedStatement.setInt(2, id);

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
            PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM `author` WHERE (`id` = ?);");
            preparedStatement.setLong(1,id);

            System.out.println("Remove " + preparedStatement);
            preparedStatement.executeUpdate();

            connection.close();
        } catch (SQLException exception){
            printSQLException(exception);
        }
    }
    @Override
    public void save(Author author)  {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO `author` (`name`) VALUES (?);");

            preparedStatement.setString(1, author.getName());

            System.out.println("SaveAuthor: " + preparedStatement);
            preparedStatement.executeUpdate();

            connection.close();
        } catch (SQLException exception) {
            printSQLException(exception);
        }
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

