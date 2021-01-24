package servlet;

import bean.User;
import dao.JgDao;
import dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class register_do extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String gzdw = request.getParameter("gzdw");
        String name = request.getParameter("name");
        String sfzh = request.getParameter("sfzh");
        String txdz = request.getParameter("txdz");
        String yzbm = request.getParameter("yzbm");
        String gddh = request.getParameter("gddh");
        String yddh = request.getParameter("yddh");
        String dzxx = request.getParameter("dzxx");
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setJgmc(gzdw);
        user.setSfzh(sfzh);
        user.setName(name);
        user.setTxdz(txdz);
        user.setYzbm(yzbm);
        user.setGddh(gddh);
        user.setYddh(yddh);
        user.setDzxx(dzxx);
        if (UserDao.addUser(user))
            response.getWriter().write("yes");
        else
            response.getWriter().write("no");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
