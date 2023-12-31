package controller;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import dao.LikeDAO;
import dao.SongDAO;

import dto.Pageable;
import model.*;
import service.*;

import model.Song;
import service.SongService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
import java.util.Objects;


@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 10
)
@WebServlet(name = "SongUserServlet", urlPatterns = "/list_songs")


public class SongAdminServlet extends HttpServlet {
    private int TOTAL_ITEMS = 12;
    SongService songService = new SongService();
    AuthorService authorService = new AuthorService();
    HistoryService historyService = new HistoryService();
    CategoryService categoryService = new CategoryService();
    SingerService singerService = new SingerService();
    SongDAO songDAO = new SongDAO();
    LikeDAO likeDAO = new LikeDAO();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            default:
                showSong(req,resp);
        }
    }

    private void showSong(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String search = req.getParameter("search");
        int page = 1;
        if(req.getParameter("page") != null){
            page = Integer.parseInt(req.getParameter("page"));
        }
//        String sortBy = req.getParameter("sortBy");
//        if(sortBy == null){
//            sortBy = "asc";
//        }
        String nameField = req.getParameter("nameField");
        if(nameField == null){
            nameField = "song.id";
        }
        int filterAuthor = 0;
        if (req.getParameter("author") != null && !Objects.equals(req.getParameter("author"), "")) {
            filterAuthor = Integer.parseInt(req.getParameter("author"));
        }

        int filterSinger = 0;
        if (req.getParameter("singer") != null && !Objects.equals(req.getParameter("singer"), "")) {
            filterSinger = Integer.parseInt(req.getParameter("singer"));
        }

        int filterCategory = 0;
        if (req.getParameter("category") != null && !Objects.equals(req.getParameter("category"), "")) {
            filterCategory = Integer.parseInt(req.getParameter("category"));
        }

        Pageable pageable = new Pageable(search,page,TOTAL_ITEMS,nameField,filterAuthor,filterSinger,filterCategory);
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        List<Like> likes = likeDAO.findUserLike(user.getId());
        List<History> histories = historyService.findAll();
        List<Song> songs = songDAO.showFilter(pageable, filterAuthor, filterSinger, filterCategory);
        req.setAttribute("likes",likes);
        req.setAttribute("authors",authorService.findAll());
//        req.setAttribute("singers",singerService.findAll());
        req.setAttribute("categories",categoryService.findAll());
        req.setAttribute("pageable", pageable);
        req.setAttribute("songs", songs);

        req.setAttribute("histories", histories);
        req.setAttribute("songsJSON",convertListToJson(songService.findAll()));

        req.getRequestDispatcher("/JSPhomeUser/songs.jsp").forward(req,resp);


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            default:
                showSong(req,resp);
        }
    }

    public static String convertListToJson(List<?> list) {
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            return objectMapper.writeValueAsString(list);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return null;
    }
}
