package servlet;

import bean.Dcwj;
import dao.DcwjDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class dofCheck extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id= Integer.parseInt(request.getParameter("id"));
        Dcwj dcwj = new Dcwj();
        dcwj.setWjid(id);
        dcwj = DcwjDao.getDocById(dcwj);
        request.setAttribute("doc", dcwj);
        request.getRequestDispatcher("templete/writefcheck.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
