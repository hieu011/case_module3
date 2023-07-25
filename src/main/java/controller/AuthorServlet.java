package controller;



import model.Author;
import serviceadmin.AuthorServiceMySQL;
import serviceadmin.IAuthorService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
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

@WebServlet(name = "AuthorServlet", urlPatterns = "/authors")
public class AuthorServlet extends HttpServlet {
    private IAuthorService authorService = new AuthorServiceMySQL();

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
                showCreateAuthor(req, resp);
                break;
            case "edit":
                showEditAuthor(req, resp);
                break;
            case "delete":
                deleteAuthor(req, resp);
                break;
            default:
                showListAuthor(req, resp);
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
                saveAuthor(req, resp);
                break;
            case "edit":
                updateAuthor(req, resp);
                break;
        }
    }

    private void showCreateAuthor(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Author> authors = authorService.findAll();
        req.setAttribute("authors", authors);

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/song/AddAuthor.jsp");
        requestDispatcher.forward(req, resp);
    }

    private void deleteAuthor(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt((req.getParameter("id")));
        authorService.remove(id);

        req.getSession().setAttribute("messageDeleteAuthor", "Xóa thành công");
        resp.sendRedirect("/authors");
    }

    private void showEditAuthor(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt((req.getParameter("id")));

        Author author = authorService.findById(id);
        req.setAttribute("author", author);

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/song/EditAuthor.jsp");
        requestDispatcher.forward(req, resp);
    }

    private void showListAuthor(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Author> authorList = authorService.findAll();
        req.setAttribute("authors", authorList);

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/song/Author.jsp");
        requestDispatcher.forward(req, resp);
    }

    private void updateAuthor(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");

        Author author = authorService.findById(id);

        author.setName(name);

        authorService.update(id, author);

        req.getSession().setAttribute("messageEditAuthor", "Sửa thành công");
        resp.sendRedirect("/authors");
    }

    private void saveAuthor(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");

        List<Author> authors = authorService.findAll();


        boolean check = true;
//        if (name == null || name.trim().isEmpty()) {
//            req.setAttribute("errorAuthor1", "Tên tác giả không được để trống!");
//            check = false;
//            resp.sendRedirect("/authors?action=create");
//        } else {
//            for (int i = 0; i < authors.size(); i++) {
//                if (name.equals(authors.get(i).getName())) {
//                    req.setAttribute("errorAuthor2", "Tên tác giả không được trùng lặp!");
//                    check = false;
//                    break;
//                }
//            }
//            resp.sendRedirect("/authors?action=create");
//        }
//        if (check == true) {
            Author author = new Author(name);
            authorService.save(author);

            req.getSession().setAttribute("messageAddAuthor", "Thêm thành công");
//        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/authors");
//        requestDispatcher.forward(req, resp);
            resp.sendRedirect("/authors");
        }
    }




















