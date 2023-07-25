package controller;

import model.*;
import serviceadmin.*;
import utils.ValidateUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "SongServlet", urlPatterns = "/songs")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB

public class SongServlet extends HttpServlet {
    private ICategoryService categoryService = new CategoryServiceMySQL();
    private ISongService songService = new SongServiceMySQL();
    private IAuthorService authorService = new AuthorServiceMySQL();
    private ISingerService singerService = new SingerServiceMySQL();
    private static final long serialVersionUID = 1L;


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //localhost:8080/customers          // show list
        //localhost:8080/customers?action=create
        //localhost:8080/customers?action=edit&id=2
        //localhost:8080/customers?action=delete&id=2
        //localhost:8080/customers?action=advavd            // show list
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreate(req, resp);
                break;
            case "edit":
                showEdit(req, resp);
                break;
            case "delete":
                deleteSong(req, resp);
                break;
            default:
                showList(req, resp);
        }
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                saveSong(req, resp);
                break;
            case "edit":
                updateSong(req, resp);
                break;
        }
    }
    private void deleteSong(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt((req.getParameter("id")));
        songService.remove(id);

        req.getSession().setAttribute("messageDelete", "Xóa thành công");
        resp.sendRedirect("/songs");
    }
    private void showEdit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int idSong = Integer.parseInt((req.getParameter("id")));

        Song song = songService.findById(idSong);
        req.setAttribute("song", song);

        List<Category> categories = categoryService.findAll();
        req.setAttribute("categories", categories);

        List<Author> authors = authorService.findAll();
        req.setAttribute("authors", authors);

        List<Singer> singers = singerService.findAll();
        req.setAttribute("singers", singers);

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/song/EditMusic.jsp");
        requestDispatcher.forward(req, resp);
    }
    private void showList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Pageable pageable = new Pageable();
        readPageable(req, pageable);

        songService.findSong(pageable);

        List<Song> songList = songService.findSong(pageable);
        req.setAttribute("songs", songList);
        req.setAttribute("pageable",pageable);

        List<Category> categories = categoryService.findAll();
        req.setAttribute("categories", categories);

//        List<Song> songList = songService.findAll();
//        req.setAttribute("songs", songList);

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/song/Admin.jsp");
        requestDispatcher.forward(req, resp);
    }
    private void readPageable(HttpServletRequest req, Pageable pageable) {
        String kw = "";
        if (req.getParameter("kw") != null) {
            kw = req.getParameter("kw");
        }
        pageable.setKw(kw);

        int categoryType = -1;
        if (req.getParameter("category-type") != null) {
            categoryType = Integer.parseInt(req.getParameter("category-type"));
        }
        pageable.setCategoryType(categoryType);

        int page = 1;
        if (req.getParameter("page") != null) {
            page = Integer.parseInt(req.getParameter("page"));
        }
        pageable.setPage(page);

        int limit = 5;
        if (req.getParameter("limit") != null) {
            limit = Integer.parseInt(req.getParameter("limit"));
        }
        pageable.setLimit(limit);
    }
    private void showCreate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Category> categories = categoryService.findAll();
        req.setAttribute("categories", categories);

        List<Author> authors = authorService.findAll();
        req.setAttribute("authors", authors);

        List<Singer> singers = singerService.findAll();
        req.setAttribute("singers", singers);


        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/song/AddMusic.jsp");
        requestDispatcher.forward(req, resp);
    }
    private void updateSong(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        int id = Integer.parseInt((req.getParameter("id")));
        String name = req.getParameter("name");

        int idAuthor = Integer.parseInt(req.getParameter("author"));
        Author author = authorService.findById(idAuthor);

        int idCate = Integer.parseInt(req.getParameter("category"));
        Category category = categoryService.findById(idCate);

        int idSinger = Integer.parseInt(req.getParameter("singer"));
        Singer singer = singerService.findById(idSinger);


        String pathServerImage = getServletContext().getRealPath("/") + "assets\\image-song";
        String pathProjectImage  = "D:\\case-study-module3\\MusicHouse_MD3\\src\\main\\webapp\\assets\\image-song";

        String pathServerSong = getServletContext().getRealPath("/") + "assets\\songs";
        String pathProjectSong  = "D:\\case-study-module3\\MusicHouse_MD3\\src\\main\\webapp\\assets\\songs";

        String dbImageUrl = null;
        String dbSongUrl = null;
        for (Part part : req.getParts()) {
            String fileName = extractFileName(part);

            if(!fileName.equals("")){
                fileName = new File(fileName).getName();
                if(part.getContentType().equals("image/jpeg")){
                    part.write(pathProjectImage + File.separator + fileName);
                    dbImageUrl = "/assets/image-song" + File.separator + fileName;
                    dbImageUrl = dbImageUrl.replace("\\","/");
                    part.write(pathServerImage + File.separator + fileName);
                }else{
                    dbSongUrl = "/assets/songs" + File.separator + fileName;;
                    dbSongUrl = dbSongUrl.replace("\\","/");
                    FileOutputStream fileOutputStreamPathServer  = new FileOutputStream(pathServerSong + File.separator + fileName);
                    FileOutputStream fileOutputStreamPathProject  = new FileOutputStream(pathProjectSong + File.separator + fileName);

                    InputStream inputStream = part.getInputStream();
                    int fByte= -1;
                    while ((fByte = inputStream.read()) != -1) {
                        fileOutputStreamPathServer.write(fByte);
                        fileOutputStreamPathProject.write(fByte);
                    }
                    fileOutputStreamPathServer.close();
                    fileOutputStreamPathProject.close();
                    inputStream.close();
                }
            }
        }

        Song song = songService.findById(id);
        song.setName(name);
        song.setAuthor(author);
        song.setCategory(category);
        song.setSinger(singer);

        if (dbImageUrl != null) {
            song.setImage(dbImageUrl);
        }
        if (dbSongUrl != null) {
            song.setSong(dbSongUrl);
        }

//        song.setImage(dbImageUrl);
//        song.setSong(dbSongUrl);

        songService.update(id, song);

        req.getSession().setAttribute("messageEdit", "Sửa thành công");
        resp.sendRedirect("/songs");
    }
    private void saveSong(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<String> errors = new ArrayList<>();
        Song song = new Song();

        String name = req.getParameter("name");
        if (!ValidateUtils.isSongValid(name)) {
            errors.add("Tên bài hát không hợp lệ, phải nằm trong khoảng 50 ký tự!");
            req.setAttribute("errorName", "Tên bài hát không hợp lệ, phải nằm trong khoảng 50 ký tự!");
        } else {
            song.setName(name);
        }

        int idAuthor = Integer.parseInt(req.getParameter("author"));
        Author author = authorService.findById(idAuthor);
//        String nameAuthor = req.getParameter("author");
//        int authorLength = authorService.findAll().size();
//        Author author = new Author(authorLength+1, nameAuthor);

        int idCate = Integer.parseInt(req.getParameter("category"));
        Category category = categoryService.findById(idCate);

        int idSinger = Integer.parseInt(req.getParameter("singer"));
        Singer singer = singerService.findById(idSinger);

//        String nameSinger = req.getParameter("singer");
//        int singerLength = singerService.findAll().size();
//        Singer singer = new Singer(singerLength+1, nameSinger);

        String pathServerImage = getServletContext().getRealPath("/") + "assets\\image-song";
        String pathProjectImage  = "D:\\case-study-module3\\MusicHouse_MD3\\src\\main\\webapp\\assets\\image-song";

        String pathServerSong = getServletContext().getRealPath("/") + "assets\\songs";
        String pathProjectSong  = "D:\\case-study-module3\\MusicHouse_MD3\\src\\main\\webapp\\assets\\songs";

        String dbImageUrl = null;
        String dbSongUrl = null;

        for (Part part : req.getParts()) {
            String fileName = extractFileName(part);

            if(!fileName.equals("")){
                fileName = new File(fileName).getName();

                if(part.getContentType().equals("image/jpeg")){
                    part.write(pathProjectImage + File.separator + fileName);
                    dbImageUrl = "/assets/image-song" + File.separator + fileName;
                    dbImageUrl = dbImageUrl.replace("\\","/");
                    part.write(pathServerImage + File.separator + fileName);
                }else{
                    dbSongUrl = "/assets/songs" + File.separator + fileName;;
                    dbSongUrl = dbSongUrl.replace("\\","/");
                    FileOutputStream fileOutputStreamPathServer  = new FileOutputStream(pathServerSong + File.separator + fileName);
                    FileOutputStream fileOutputStreamPathProject  = new FileOutputStream(pathProjectSong + File.separator + fileName);

                    InputStream inputStream = part.getInputStream();
                    int fByte= -1;
                    while ((fByte = inputStream.read()) != -1) {
                        fileOutputStreamPathServer.write(fByte);
                        fileOutputStreamPathProject.write(fByte);
                    }
                    fileOutputStreamPathServer.close();
                    fileOutputStreamPathProject.close();
                    inputStream.close();
                }
            }
        }

        song.setAuthor(author);
        song.setCategory(category);
        song.setSinger(singer);
        if (dbImageUrl == null) {
            req.setAttribute("errorImage", "File ảnh không được để trống!");
        } else {
            song.setImage(dbImageUrl);
        }
        if (dbImageUrl == null) {
            req.setAttribute("errorSong", "File nhạc không được để trống!");
        } else {
            song.setSong(dbSongUrl);
        }
        songService.save(song);

        if(!errors.isEmpty()) {
            req.setAttribute("errors", errors);
            req.setAttribute("song", song);

            List<Category> categories = categoryService.findAll();
            req.setAttribute("categories", categories);

            List<Author> authors = authorService.findAll();
            req.setAttribute("authors", authors);

            List<Singer> singers = singerService.findAll();
            req.setAttribute("singers", singers);

            req.getRequestDispatcher("/song/AddMusic.jsp").forward(req,resp);
        } else {
            req.getSession().setAttribute("messageAdd", "Thêm thành công");
        }
        resp.sendRedirect("/songs");

//        song.setImage("/assets/image-song/" + image);
//        song.setSong("/assets/songs/" + song1);
//        song.setCategory(category);

//        req.getSession().setAttribute("messageAdd", "Thêm thành công");
//        resp.sendRedirect("/songs");
    }
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
    public File getFolderUpload() {
        File folderUpload = new File(System.getProperty("user.home") + "/Uploads");
        if (!folderUpload.exists()) {
            folderUpload.mkdirs();
        }
        return folderUpload;
    }

}
