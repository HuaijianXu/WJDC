package servlet;

import dao.DcwjDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class deleteWj extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int wjid = Integer.parseInt(request.getParameter("wjid"));
        if(DcwjDao.delete_wj(wjid))
            response.getWriter().write("yes");
        else
            response.getWriter().write("no");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
