package servlet;

import bean.Dcwj;
import dao.DcwjDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

public class queryWjdc extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String type=request.getParameter("type");
        DcwjDao dcwjDao = new DcwjDao();
        if(type.equals("all"))
        {
            ArrayList<Dcwj> list= dcwjDao.getDoces("all");
            request.setAttribute("list", list);
            request.getRequestDispatcher("templete/wjgl.jsp").forward(request, response);
        }
        else if(type.equals("user"))
        {
            String message = request.getParameter("message");
            HttpSession session = request.getSession();
            String username = (String) session.getAttribute("user");
            ArrayList<Dcwj> list= dcwjDao.getDoces(username);
            request.setAttribute("list", list);
            request.setAttribute("message",message);
            request.getRequestDispatcher("templete/wjgl_user.jsp").forward(request, response);
        }
        else if(type.equals("tongji"))
        {
            ArrayList<Dcwj> list= dcwjDao.getDoces("all");
            request.setAttribute("list", list);
            HttpSession session = request.getSession();
            session.setAttribute("sql","");
            request.getRequestDispatcher("templete/tongji.jsp").forward(request, response);
        }
        else
        {
            String value=request.getParameter("value");
            ArrayList<Dcwj> list=dcwjDao.getDocesByCase(type,value);
            request.setAttribute("list", list);
            request.getRequestDispatcher("templete/mywj.jsp").forward(request, response);
        }
    }
    protected void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
