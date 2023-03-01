/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.LLS;
import model.Participate;
import model.Student;

/**
 *
 * @author ADMIN
 */
public class ParticipateDBContext extends DBContext {

    @Override
    public void insert(Object model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Object model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Participate> all() {
        ArrayList<Participate> attendance = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT p.Status, p.TimeRecord, s.StudentID, l.LessonNumber\n"
                    + "FROM Participate p INNER JOIN Student s\n"
                    + "ON p.StudentID = s.StudentID\n"
                    + "INNER JOIN LLS l\n"
                    + "ON p.LessonNumber = l.LessonNumber\n";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Participate p = new Participate();
                if (rs.getString("Status").equalsIgnoreCase("true")) {
                    p.setStatus("Attended");
                } else if (rs.getString("Status").equalsIgnoreCase("false")) {
                    p.setStatus("Absent");
                } else {
                    p.setStatus(rs.getString("Status"));
                }
                p.setTimeRecord(rs.getString("TimeRecord"));

                Student s = new Student();
                s.setId(rs.getString("StudentID"));
                p.setStu(s);

                LLS l = new LLS();
                l.setLessonNum(rs.getInt("LessonNumber"));
                p.setLesson(l);
                attendance.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ParticipateDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(ParticipateDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }

            try {
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(ParticipateDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(ParticipateDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return attendance;
    }

}
