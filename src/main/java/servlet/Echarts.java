package servlet;

import bean.Tool;
import com.google.gson.Gson;
import dao.DcwjDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

public class Echarts extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        String method = request.getParameter("method");
        HttpSession session = request.getSession();
        String sql = (String) session.getAttribute("sql");
        ArrayList<Tool> list = DcwjDao.listAll(method,sql);
        Gson gson = new Gson();
        String json = gson.toJson(list);
        response.getWriter().write(json);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
