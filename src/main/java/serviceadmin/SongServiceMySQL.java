package serviceadmin;


import model.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SongServiceMySQL implements ISongService{

//    private IAuthorService authorService;
//    private ISingerService singerService;

    private static final String FIND_ALL_SONGS = "SELECT s.*, au.id as id_author, au.name as name_author, ct.id as id_cate, ct.name as name_cate, sg.id as id_singer, sg.name as name_singer " +
            "FROM song as s join author as au ON s.id_author = au.id join category as ct ON s.id_category = ct.id join singer as sg ON s.id_singer = sg.id order by id;";
    private static final String FIND_BY_ID = "SELECT s.*, au.id as id_author, au.name as name_author, ct.id as id_cate, ct.name name_cate, sg.id as id_singer, sg.name as name_singer\n" +
            "FROM song as s join author as au ON s.id_author = au.id \n" +
            "join category as ct ON s.id_category = ct.id\n" +
            "join singer as sg ON s.id_singer = sg.id where s.id  = ?;";

    private static final String SQL_FILTER_SONGS = "SELECT s.*, au.id as id_author, au.name as name_author, ct.id as id_cate, ct.name as name_cate, sg.id as id_singer, sg.name as name_singer " +
            "FROM song as s " +
            "join author as au ON s.id_author = au.id " +
            "join category as ct ON s.id_category = ct.id " +
            "join singer as sg ON s.id_singer = sg.id " +
            "WHERE (s.name like ? ) %s " +
            "ORDER BY id " +
            "LIMIT ?,?;";

    private static final String SQL_FILTER_SONGS_COUNT = "SELECT count(*) as total " +
            "FROM song as s " +
            "join category as ct ON s.id_category = ct.id " +
            "WHERE (s.name like ? ) %s ";

    private String jdbcURL = "jdbc:mysql://localhost:3306/music_md3";
    private String jdbcUsername = "root";
    private String jdbcPassword = "vanhieu0112";

//    public SongServiceMySQL(){
//        authorService = new AuthorServiceMySQL();
//    }

    @Override
    public List<Song> findAll() {
        List<Song> songs = new ArrayList<>();

        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL_SONGS);

            System.out.println("findAll:" + preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");

                int idAuthor = rs.getInt("id_author");
                String nameAuthor = rs.getString("name_author");
                Author author = new Author(idAuthor, nameAuthor);

                int idCate = rs.getInt("id_cate");
                String nameCate = rs.getString("name_cate");
                Category category = new Category(idCate, nameCate);

                int idSinger = rs.getInt("id_singer");
                String nameSinger = rs.getString("name_singer");
                Singer singer = new Singer(idSinger, nameSinger);

                String song1 = rs.getString("link_song");
                String image = rs.getString("link_image");

                Song song = new Song(id, name, author, category, singer, image, song1);
                songs.add(song);
            }
            connection.close();
        } catch (SQLException exception) {
            printSQLException(exception);
        }
        return songs;
    }

    @Override
    public void save(Song song)  {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO `song` (`name`, `id_author`, `id_category`, `id_singer`, `link_image`, `link_song`) VALUES (?, ?, ?, ?, ?, ?);");

            preparedStatement.setString(1, song.getName());
            preparedStatement.setInt(2, song.getAuthor().getId());
            preparedStatement.setInt(3, song.getCategory().getId());
            preparedStatement.setInt(4, song.getSinger().getId());
            preparedStatement.setString(5, song.getImage());
            preparedStatement.setString(6, song.getSong());

            System.out.println("Save: " + preparedStatement);
            preparedStatement.executeUpdate();

            connection.close();
        } catch (SQLException exception) {
            printSQLException(exception);
        }
    }

    @Override
    public Song findById(int id) {
        try{
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);

            preparedStatement.setLong(1, id);

            System.out.println("FindByID: " + preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int idSong = rs.getInt("id");

                String name = rs.getString("name");

                int idAuthor = rs.getInt("id_author");
                String nameAuthor = rs.getString("name_author");
                Author author = new Author(idAuthor, nameAuthor);

                int idCate = rs.getInt("id_cate");
                String nameCate = rs.getString("name_cate");
                Category category = new Category(idCate, nameCate);

                int idSinger = rs.getInt("id_singer");
                String nameSinger = rs.getString("name_singer");
                Singer singer = new Singer(idSinger, nameSinger);

                String image = rs.getString("link_image");
                String song = rs.getString("link_song");

                return new Song(idSong, name, author, category, singer, song, image);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    @Override
    public void update(int id, Song song) {
        try{
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE `song` SET `name` = ?, `id_author` = ?, `id_category` = ?, `id_singer` = ?, `link_image` = ?, `link_song` = ? WHERE (`id` = ?);\n");

            preparedStatement.setString(1, song.getName());
            preparedStatement.setInt(2,song.getAuthor().getId());
            preparedStatement.setInt(3,song.getCategory().getId());
            preparedStatement.setInt(4,song.getSinger().getId());
            preparedStatement.setString(5, song.getImage());
            preparedStatement.setString(6, song.getSong());

            preparedStatement.setInt(7, id);

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
            PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM `song` WHERE (`id` = ?);");
            preparedStatement.setLong(1,id);

            System.out.println("Remove " + preparedStatement);
            preparedStatement.executeUpdate();

            connection.close();
        } catch (SQLException exception){
            printSQLException(exception);
        }
    }

    @Override
    public List<Song> findSong(Pageable pageable) {
        List<Song> songs = new ArrayList<>();
        try {
            Connection connection = getConnection();

            // Lấy danh sách dữ liệu
            String strCategoryType = "";
            if (pageable.getCategoryType() != -1) {
                strCategoryType = "and s.id_category = " + pageable.getCategoryType();
            }
            String fmSQL_FILTER = String.format(SQL_FILTER_SONGS, strCategoryType);
            PreparedStatement ps = connection.prepareStatement(fmSQL_FILTER);
            ps.setString(1, "%" + pageable.getKw() + "%");

            ps.setInt(2, (pageable.getPage() - 1)*pageable.getLimit());
            ps.setInt(3, pageable.getLimit());

            System.out.println("findSong: " + ps);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Song song = getSongFromResultSet(rs);
                songs.add(song);
            }

            // Thực hiện đoạn này để tính tổng số dòng
            fmSQL_FILTER = String.format(SQL_FILTER_SONGS_COUNT, strCategoryType);
            ps = connection.prepareStatement(fmSQL_FILTER);
            ps.setString(1, "%" + pageable.getKw() + "%");

            System.out.println("findCustomers Filter count row: " + ps);
            rs = ps.executeQuery();
            while (rs.next()) {
                int total = rs.getInt("total");
                //-- 8 dong/3 => 2,7 => 3
                pageable.setTotal((int) Math.ceil((total*1.0)/pageable.getLimit()));
            }
        } catch (SQLException sqlException) {
            printSQLException(sqlException);
        }
        return songs;
    }
    private Song getSongFromResultSet(ResultSet rs) throws SQLException {
        int id = rs.getInt("id");

        String name = rs.getString("name");

        int idAuthor = rs.getInt("id_author");
        String nameAuthor = rs.getString("name_author");
        Author author = new Author(idAuthor, nameAuthor);

        int idCate = rs.getInt("id_cate");
        String nameCate = rs.getString("name_cate");
        Category category = new Category(idCate, nameCate);

        int idSinger = rs.getInt("id_singer");
        String nameSinger = rs.getString("name_singer");
        Singer singer = new Singer(idSinger, nameSinger);

        String image = rs.getString("link_image");
        String song1 = rs.getString("link_song");

        Song song = new Song(id, name, author,category, singer,song1,image);
        song.setCategory(category);

        return song;
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
