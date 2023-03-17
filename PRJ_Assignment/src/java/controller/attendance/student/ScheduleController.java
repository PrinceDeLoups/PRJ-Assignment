/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.attendance.student;

import controller.authentication.BaseRequiredAuthenticatedController;
import dal.CampusDBContext;
import dal.LecturerDBContext;
import dal.SlotDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import model.Account;
import model.Campus;
import model.Lecturer;
import model.TimeSlot;
import util.DateTimeHelper;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "ScheduleController", urlPatterns = {"/schedule"})
public class ScheduleController extends BaseRequiredAuthenticatedController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        LocalDateTime now = LocalDateTime.now();
        LocalDateTime monday = now;
        while (monday.getDayOfWeek() != DayOfWeek.MONDAY) {
            monday = monday.minusDays(1);
        }
        LocalDate then = LocalDate.from(monday.plusDays(6));
        int id = (int) request.getSession().getAttribute("id");
        String raw_from = request.getParameter("from");
        String raw_to = request.getParameter("to");

        LecturerDBContext lecdb = new LecturerDBContext();
        ArrayList<Lecturer> lec = lecdb.getStdCode(id);
        request.setAttribute("lec", lec);
        Lecturer currentLec = lec.get(0);

        CampusDBContext camp = new CampusDBContext();
        ArrayList<Campus> camps = camp.search(id);
        request.setAttribute("camps", camps);
        Date from;
        Date to;
        if (raw_from != null && raw_to != null) {
            from = Date.valueOf(raw_from);
            to = Date.valueOf(raw_to);
        } else {
            from = Date.valueOf(monday.format(DateTimeFormatter.ISO_DATE));
            to = Date.valueOf(then);
        }
        SlotDBContext timeDB = new SlotDBContext();
        ArrayList<TimeSlot> slots = timeDB.all();
        request.setAttribute("slots", slots);

        ArrayList<Date> dates = DateTimeHelper.getListDate(from, to);
        request.setAttribute("dates", dates);

        LecturerDBContext lectureDB = new LecturerDBContext();
        model.Lecturer lecturer = lectureDB.getTimeTable(currentLec.getId(), from, to);
        request.setAttribute("l", lecturer);

        request.getRequestDispatcher("view/attendance/schedule.jsp").forward(request, response);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        processRequest(request, response);
    }

}
