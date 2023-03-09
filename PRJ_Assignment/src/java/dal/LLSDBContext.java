///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
// */
//package dal;
//
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.logging.Level;
//import java.util.logging.Logger;
//import model.Group;
//import model.LLS;
//import model.Room;
//import model.TimeSlot;
//
///**
// *
// * @author ADMIN
// */
//public class LLSDBContext extends DBContext {
//
//    @Override
//    public void insert(Object model) {
//        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
//    }
//
//    @Override
//    public void delete(Object model) {
//        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
//    }
//
//    @Override
//    public ArrayList<LLS> all() {
//        ArrayList<LLS> lesson = new ArrayList<>();
//        PreparedStatement stm = null;
//        ResultSet rs = null;
//        try {
//            String sql = "SELECT l.LessonNumber, l.LessonName, g.GroupName, ts.SlotNumber, r.RoomName\n"
//                    + "FROM LLS l INNER JOIN GroupStudent g\n"
//                    + "ON l.GroupID = g.GroupID\n"
//                    + "INNER JOIN TimeSlot ts\n"
//                    + "ON l.SlotNumber = ts.SlotNumber\n"
//                    + "INNER JOIN Room r\n"
//                    + "ON l.RoomName = r.RoomName";
//            stm = connection.prepareStatement(sql);
//            rs = stm.executeQuery();
//            while (rs.next()) {
//                LLS l = new LLS();
//                l.setLessonNum(rs.getInt("LessonNumber"));
//                l.setLessonName(rs.getString("LessonName"));
//                
//                Group g = new Group();
//                g.setGroupName(rs.getString("GroupName"));
//                l.setGroup(g);
//
//                TimeSlot ts = new TimeSlot();
//                ts.setSlotNumber(rs.getInt("SlotNumber"));
//                l.setSlot(ts);
//                
//                Room r = new Room();
//                r.setRoomName(rs.getString("RoomName"));
//                l.setRoom(r);
//                lesson.add(l);
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(LLSDBContext.class.getName()).log(Level.SEVERE, null, ex);
//        } finally {
//            try {
//                rs.close();
//            } catch (SQLException ex) {
//                Logger.getLogger(LLSDBContext.class.getName()).log(Level.SEVERE, null, ex);
//            }
//
//            try {
//                stm.close();
//            } catch (SQLException ex) {
//                Logger.getLogger(LLSDBContext.class.getName()).log(Level.SEVERE, null, ex);
//            }
//            try {
//                connection.close();
//            } catch (SQLException ex) {
//                Logger.getLogger(LLSDBContext.class.getName()).log(Level.SEVERE, null, ex);
//            }
//        }
//        return lesson;
//    }
//
//}
