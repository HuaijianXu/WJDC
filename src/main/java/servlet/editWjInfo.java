package servlet;

import bean.Dcwj;
import dao.DcwjDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class editWjInfo extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String message = request.getParameter("message");
        int wjid = Integer.parseInt(request.getParameter("wjid"));
        Dcwj dcwj = new Dcwj();
        dcwj.setWjid(wjid);
        Dcwj newDcwj = DcwjDao.getDocById(dcwj);
        request.setAttribute("wj", newDcwj);
        request.setAttribute("message",message);
        request.getRequestDispatcher("templete/editWj.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
