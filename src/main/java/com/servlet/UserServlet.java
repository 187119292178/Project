package com.servlet;

import com.dat.UserDAD;
import com.qojo.Collection;
import com.qojo.Userinfo;
import com.util.DButil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/user.do")
public class UserServlet extends HttpServlet {

    private UserDAD userDAD = new UserDAD();


    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8;");

        String p = request.getParameter("p");

        if ("addcollection".equals(p)){

            doAddCollection(request,response);
        }
        if ("login".equals(p)){

            doLogin(request ,response);
        }


    }

    private void doLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Userinfo userinfo= userDAD.login(username,password);

        if (userinfo==null){
            response.getWriter().println("<script>alert('登录失败!');location='login.jsp';</script>");
            return;

        }

        HttpSession session = request.getSession();
        session.setAttribute("userinfo" , userinfo);
        response.sendRedirect("goods.do?p=fenye");



    }

    private void doAddCollection(HttpServletRequest request, HttpServletResponse response) throws IOException {


        Userinfo userinfo = (Userinfo) request.getSession().getAttribute("userinfo");

        if (userinfo==null){
            response.getWriter().println("<script>alert('请先登录');location='login.jsp';</script>");
            return;
        }

        String goodsid = request.getParameter("goodsid");
        String username =userinfo.getUsername();

        List<Collection> list = userDAD.check(username ,goodsid);

        if (list.size()>0){

            response.getWriter().println("<script>alert('已级收藏');location ='goods.do?p=findby&goodsid="+goodsid+"';</script>");
            return;
        }

        userDAD.addcollection(username ,goodsid);
        response.sendRedirect("goods.do?p=findbyid&goodsid"+goodsid);


    }
}
