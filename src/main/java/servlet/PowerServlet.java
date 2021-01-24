package servlet;

import bean.Power;
import com.google.gson.Gson;
import dao.PowerDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class PowerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        PowerDao powerDao = new PowerDao();
        HttpSession session = request.getSession();
        String user = (String) session.getAttribute("user");
        int powerid = powerDao.getPowerID(user);
        List<Power> list = powerDao.getPower(powerid);
        Gson gson = new Gson();
        String json = gson.toJson(list);
        response.getWriter().write(json);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
