package controller;

import dao.LikeDAO;
import model.Like;
import model.User;
import service.UserService;
import utils.PasswordEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;


@WebServlet(name = "loginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    UserService userService = new UserService();
    LikeDAO likeDAO = new LikeDAO();


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        User user = userService.findByUsername(username);
        HttpSession session = req.getSession();
        if(user != null && PasswordEncoder.isValidPassword(password, user.getPassword())){
            List<Like> likes = likeDAO.findUserLike(user.getId());


            session.setAttribute("likes", likes);
            session.setAttribute("role", user.getRole().getName());
            session.setAttribute("user",user);
            if (user.getRole().getId() == 1){
                resp.sendRedirect("/songs");
                return;
            }
            resp.sendRedirect("/home?action=userLogin");
            return;
        }
        session.setAttribute("error", "Login Failed. Please check the username or password!");
        resp.sendRedirect("/login");
    }

    private void showLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/JSPLogin-Register/login.jsp")
                .forward(req,resp);
    }



    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.getRequestDispatcher("/WEB-INF/JSPLogin-Register/login.jsp")
                .forward(req,resp);
    }


}
