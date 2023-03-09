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
import model.Group;
import model.Lecturer;
import model.Room;
import model.Session;
import model.TimeSlot;

/**
 *
 * @author ADMIN
 */
public class SessionDBContext extends DBContext {

    @Override
    public void insert(Object model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Session> all() {
        ArrayList<Session> session = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT se.sesid, r.rid, r.rname, t.tid, t.description,l.lid, l.lname, g.gid, g.gname, se.[date]\n"
                    + "FROM Session se INNER JOIN Room r\n"
                    + "ON se.rid = r.rid\n"
                    + "INNER JOIN TimeSlot t\n"
                    + "ON se.tid = t.tid"
                    + "INNER JOIN Lecturer l"
                    + "ON se.lid = l.lid"
                    + "INNER JOIN Group g"
                    + "ON se.gid = g.gid";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Session se = new Session();
                se.setSesid(rs.getInt("sesid"));

                Room r = new Room();
                r.setRid(rs.getInt("rid"));
                r.setRname(rs.getString("rname"));
                se.setRoom(r);

                TimeSlot t = new TimeSlot();
                t.setTid(rs.getInt("tid"));
                t.setDescription(rs.getString("description"));
                se.setTimeslot(t);
                
                Lecturer l = new Lecturer();
                l.setLid(rs.getInt("lid"));
                l.setLname(rs.getString("lname"));
                se.setLecturer(l);
                
                Group g = new Group();
                g.setGid(rs.getInt("gid"));
                g.setGname(rs.getString("gname"));
                se.setGroup(g);
                
                se.setDates(rs.getDate("[date]"));

                session.add(se);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }

            try {
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return session;
    }

}
