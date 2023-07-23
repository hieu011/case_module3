package controller;

import model.Role;
import model.User;
import service.RoleService;
import service.UserService;
import utils.PasswordEncoder;
import utils.ValidateUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    UserService userService = new UserService();
    PasswordEncoder passwordEncoder = new PasswordEncoder();
    RoleService roleService = new RoleService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/JSPLogin-Register/register.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        boolean redirect = false;
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String rePass = req.getParameter("re_password");
        session.setAttribute("nameinput",username);
        if(!ValidateUtils.isUsernameValid(username)){
            redirect = true;
            session.setAttribute("wrongUsername","Tên bắt đầu bằng kí tự,không chứa các kí tự đặc biệt,có một ký tự @ ngăn cách");
        }
        if(!ValidateUtils.isPasswordValid(password)){
            redirect = true;
            session.setAttribute("wrongPassword","Mật khẩu tối thiểu tám ký tự, ít nhất một chữ hoa, một chữ thường, một số và một ký tự đặc biệt");
        }

        if (userService.checkExist(username)) {
            redirect = true;
            session.setAttribute("existUser","Tên người dùng đã tồn tại!");
        }
        if (!password.equals(rePass)) {
            redirect = true; // Password không trùng khớp, cần chuyển hướng đến "/signup"
            session.setAttribute("wrongRepass","Mật khẩu nhập lại không trùng khớp!");
        }
        if(redirect == false){
            Role role = roleService.findById(2);
            String passencoded = passwordEncoder.encode(password);
            User user = new User(username, passencoded, role);
            userService.createUser(user);

            session.setAttribute("role", user.getRole().getName());
            session.setAttribute("user", user);
        }
            resp.sendRedirect("/register");
    }
}




