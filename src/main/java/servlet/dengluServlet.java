package servlet;

import bean.User;
import dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class dengluServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String username = request.getParameter("user");
        String password = request.getParameter("pwd");
        UserDao userDao = new UserDao();
        if (!userDao.login(username,password)){
            request.setAttribute("message", "用户名密码错误或该用户已被禁用");
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }
        else{
            User user = userDao.getUserInfo(username);
            HttpSession session = request.getSession();
            session.setAttribute("user",username);
            session.setAttribute("password",password);
            session.setAttribute("jgmc",user.getJgmc());
            session.setAttribute("sfzh",user.getSfzh());
            session.setAttribute("dzxx",user.getDzxx());
            session.setAttribute("gddh",user.getGddh());
            session.setAttribute("yddh",user.getYddh());
            session.setAttribute("name",user.getName());
            session.setAttribute("txdz",user.getTxdz());
            session.setAttribute("yzbm",user.getYzbm());
            session.setAttribute("powerid",1);
            request.getRequestDispatcher("main.html").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
