package servlet;

import bean.User;
import dao.DcwjDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

public class SearchWj extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String method = request.getParameter("method");
        String[] xuanze = request.getParameterValues("xuanze");
        String[] type = request.getParameterValues("type");
        String[] text = request.getParameterValues("text");
        String[] cipin = request.getParameterValues("cipin");
        DcwjDao dcwjDao = new DcwjDao();
        if (method.equals("tongji"))
        {
            ArrayList<User> list = dcwjDao.search(xuanze,type,text,cipin);
            String sql = dcwjDao.search1(xuanze,type,text,cipin);
            HttpSession session = request.getSession();
            session.setAttribute("sql",sql);
            request.setAttribute("list", list);
            request.getRequestDispatcher("templete/tongji.jsp").forward(request, response);
        }
        else if (method.equals("wjgl_user"))
        {
            HttpSession session = request.getSession();
            String username = (String) session.getAttribute("user");
            ArrayList<User> list = dcwjDao.search_user(xuanze,type,text,cipin,username);
            request.setAttribute("list", list);
            request.getRequestDispatcher("templete/wjgl_user.jsp").forward(request, response);
        }
        else if (method.equals("wjgl"))
        {
            ArrayList<User> list = dcwjDao.search(xuanze,type,text,cipin);
            String sql = dcwjDao.search1(xuanze,type,text,cipin);
            HttpSession session = request.getSession();
            session.setAttribute("sql",sql);
            request.setAttribute("list", list);
            request.getRequestDispatcher("templete/wjgl.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
