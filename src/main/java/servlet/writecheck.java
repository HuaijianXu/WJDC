package servlet;

import dao.DcwjDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class writecheck extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        int wjid = Integer.parseInt(request.getParameter("wjid"));
        String suggest = request.getParameter("suggest");
        //0不同意，1同意
        int result = Integer.parseInt(request.getParameter("result"));
        DcwjDao dcwjDao = new DcwjDao();
        String message;
        if (dcwjDao.check(wjid,suggest,result))
        {
            message="提交成功";
        }
        else
        {
            message="提交失败";
        }
        request.getRequestDispatcher("checkDoc?type=notchecked&message="+message).forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
