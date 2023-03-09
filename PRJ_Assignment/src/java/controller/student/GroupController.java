/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.student;

import dal.CourseDBContext;
import dal.DBContext;
import dal.GroupDBContext;
import dal.StudentDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Course;
import model.Group;
import model.Student;

/**
 *
 * @author ADMIN
 */
public class GroupController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        processRequest(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        processRequest(req, resp);

    }

    private void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        StudentDBContext db = new StudentDBContext();
//        ArrayList<Student> students = db.search(raw_course, raw_class);
//        req.setAttribute("students", students);
        DBContext<Course> cb = new CourseDBContext();
        ArrayList<Course> courses = cb.all();
        req.setAttribute("courses", courses);

        DBContext<Group> gb = new GroupDBContext();
        ArrayList<Group> groups = gb.all();
        req.setAttribute("groups", groups);
        String raw_course = req.getParameter("course");
        String raw_classe = req.getParameter("class");
        if (raw_course != null && raw_classe != null) {
            int course = Integer.parseInt(raw_course);
            int classe = Integer.parseInt(raw_classe);
            ArrayList<Student> students = db.search(course, classe);
            req.setAttribute("students", students);
        }
        req.getRequestDispatcher("../view/student/group.jsp").forward(req, resp);

    }
}
