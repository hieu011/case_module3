package controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import model.Song;
import service.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;




@WebServlet(name = "homeServlet",urlPatterns = "/home")
public class HomeServlet extends HttpServlet {
    AuthorService authorService = new AuthorService();
    UserService userService = new UserService();
    SingerService singerService = new SingerService();
    CategoryService categoryService = new CategoryService();
    SongService songService = new SongService();
    List<Song> songSelected = new ArrayList<>();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action = req.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "logout":
                logout(req,resp);
                break;
            case "userLogin":
                userLogin(req,resp);
                break;
            default:
                processRequest(req,resp);
        }
    }

    private void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        Pageable pageable = new Pageable();
//        HttpSession session = req.getSession();
//        if(session.getAttribute("user") == null){
//            session.setAttribute("user",userService.findByUsername("guest@gmail.com"));
//        }
//        req.setAttribute("authors", authorService.findAll());
//        req.setAttribute("singers", singerService.findAll());
//        req.setAttribute("categories", categoryService.findAll());
//        req.setAttribute("leaderboard", songService.showLeaderboard());
//        req.setAttribute("songsJSON",convertListToJson(songService.showLeaderboard()));
        List<Song> songs = songService.findAll();
        req.setAttribute("songs",songs);

        Gson gson = new Gson();
        req.setAttribute("json_songs", gson.toJson(songs).toString());

        req.getRequestDispatcher("/WEB-INF/JSPhome/home.jsp").forward(req,resp);
    }

    private void logout(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        session.invalidate();
        resp.sendRedirect("/home");
    }
    private void userLogin(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        if(req.getParameter("songselect") != null){
            int idMusicSelect = Integer.parseInt(req.getParameter("songselect"));
            Song songSelect = songService.findByID(idMusicSelect);
            songSelected.add(songSelect);
            Gson gsonSongSelect = new Gson();
            req.setAttribute("songSelected",gsonSongSelect.toJson(songSelected).toString());
        };
        List<Song> songs = songService.findAll();
        req.setAttribute("songs",songs);

        Gson gson = new Gson();
        req.setAttribute("json_songs", gson.toJson(songs).toString());

        req.getRequestDispatcher("/WEB-INF/JSPhome/home.jsp").forward(req,resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
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
