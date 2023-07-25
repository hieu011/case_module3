package controller;


import model.User;
import serviceadmin.IUserService;
import serviceadmin.UserServiceMySQL;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet(name = "UserServlet", urlPatterns = "/users")
public class UserServlet extends HttpServlet {
    private IUserService userService = new UserServiceMySQL();

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
            case "edit":
                showEditUser(req, resp);
                break;
            case "delete":
                deleteUser(req, resp);
                break;
            default:
                showListUser(req, resp);
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
            case "edit":
                updateUser(req, resp);
                break;
        }
    }

    private void deleteUser(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt((req.getParameter("id")));
        userService.remove(id);

        req.getSession().setAttribute("messageDeleteUser", "Xóa thành công");
        resp.sendRedirect("/users");
    }

    private void showEditUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt((req.getParameter("id")));

        User user = userService.findById(id);
        req.setAttribute("user", user);

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/song/EditUser.jsp");
        requestDispatcher.forward(req, resp);
    }

    private void showListUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<User> userList = userService.findAll();
        req.setAttribute("users", userList);

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/song/User.jsp");
        requestDispatcher.forward(req, resp);
    }

    private void updateUser(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("username");
        String password = req.getParameter("password");

        User user = userService.findById(id);

        user.setUsername(name);
        user.setPassword(password);

        userService.update(id, user);

        req.getSession().setAttribute("messageEdit", "Sửa thành công");
        resp.sendRedirect("/users");            // Dùng respone để sendRedirect
    }

}
