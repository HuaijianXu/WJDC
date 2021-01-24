package servlet;

import bean.Dcwj;
import dao.DcwjDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class checkDoc extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String type = request.getParameter("type");
        DcwjDao dcwjDao = new DcwjDao();
        ArrayList<Dcwj> list = null;
        String message = request.getParameter("message");
        if (type.equals("all"))
        {
            list = dcwjDao.getDoces("all");
            request.setAttribute("list", list);
            request.setAttribute("message",message);
            request.getRequestDispatcher("templete/xssh.jsp").forward(request, response);
        }
        if (type.equals("checked"))
        {
            list = dcwjDao.getDoces("checked");
            request.setAttribute("list", list);
            request.setAttribute("message",message);
            request.getRequestDispatcher("templete/xssh.jsp").forward(request, response);
        }
        if (type.equals("notchecked"))
        {
            list = dcwjDao.getDoces("notchecked");
            request.setAttribute("list", list);
            request.setAttribute("message",message);
            request.getRequestDispatcher("templete/xssh.jsp").forward(request, response);
        }
        if (type.equals("fchecked"))
        {
            list = dcwjDao.getDoces("fchecked");
            request.setAttribute("list", list);
            request.setAttribute("message",message);
            request.getRequestDispatcher("templete/bmsh.jsp").forward(request, response);
        }
        if (type.equals("notfchecked"))
        {
            list = dcwjDao.getDoces("notfchecked");
            request.setAttribute("list", list);
            request.setAttribute("message",message);
            request.getRequestDispatcher("templete/bmsh.jsp").forward(request, response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
