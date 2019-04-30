package vgu.group1.examregister;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Time;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Utils {
    public static JSONObject convertOne(ResultSet rs, String[] fieldNames) throws SQLException, JSONException {
        if (!rs.next())
            return null;

        ResultSetMetaData rsmd = rs.getMetaData();
        int numColumns = rsmd.getColumnCount();
        JSONObject obj = new JSONObject();

        for (int i = 1; i < numColumns + 1; i++) {
            String fieldName = fieldNames[i - 1];
            int columnType = rsmd.getColumnType(i);

            if (columnType == java.sql.Types.ARRAY) {
                obj.put(fieldName, rs.getArray(i));
            } else if (columnType == java.sql.Types.BIGINT) {
                obj.put(fieldName, rs.getInt(i));
            } else if (columnType == java.sql.Types.BOOLEAN) {
                obj.put(fieldName, rs.getBoolean(i));
            } else if (columnType == java.sql.Types.BLOB) {
                obj.put(fieldName, rs.getBlob(i));
            } else if (columnType == java.sql.Types.DOUBLE) {
                obj.put(fieldName, rs.getDouble(i));
            } else if (columnType == java.sql.Types.FLOAT) {
                obj.put(fieldName, rs.getFloat(i));
            } else if (columnType == java.sql.Types.INTEGER) {
                obj.put(fieldName, rs.getInt(i));
            } else if (columnType == java.sql.Types.NVARCHAR) {
                obj.put(fieldName, rs.getNString(i));
            } else if (columnType == java.sql.Types.VARCHAR) {
                obj.put(fieldName, rs.getString(i));
            } else if (columnType == java.sql.Types.TINYINT) {
                obj.put(fieldName, rs.getInt(i));
            } else if (columnType == java.sql.Types.SMALLINT) {
                obj.put(fieldName, rs.getInt(i));
            } else if (columnType == java.sql.Types.DATE) {
                obj.put(fieldName, rs.getString(i));
            } else if (columnType == java.sql.Types.TIME) {
                obj.put(fieldName, rs.getString(i));
            } else if (columnType == java.sql.Types.TIMESTAMP) {
                obj.put(fieldName, rs.getTimestamp(i));
            } else {
                obj.put(fieldName, rs.getObject(i));
            }
        }
        return obj;
    }

    public static JSONObject convertOne(ResultSet rs) throws SQLException, JSONException {
        return convertOne(rs, getFieldNames(rs));
    }

    public static JSONArray convertAll(ResultSet rs, String[] fieldNames) throws SQLException, JSONException {
        JSONArray jsonArray = new JSONArray();
        if (rs.next()) {
            rs.previous();
            while (!rs.isLast())
                jsonArray.put(convertOne(rs, fieldNames));
        }
        return jsonArray;
    }

    public static JSONArray convertAll(ResultSet rs) throws SQLException, JSONException {
        return convertAll(rs, getFieldNames(rs));
    }

    private static String[] getFieldNames(ResultSet rs) throws SQLException, JSONException {
        ResultSetMetaData rsmd = rs.getMetaData();
        int columnCount = rsmd.getColumnCount();
        String[] fieldNames = new String[columnCount];
        for (int i = 0; i < columnCount; i++) {
            fieldNames[i] = rsmd.getColumnName(i + 1);
        }
        return fieldNames;
    }

//    public static java.sql.Date convertStringtoDate(String dateIn) throws ParseException {
//        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
//        java.util.Date d = formatter.parse(dateIn);
//        java.sql.Date dateOut = new java.sql.Date(d.getTime());
//        return dateOut;
//    }
//
//    public static Time convertStringtoTime(String timeIn) throws ParseException {
//        SimpleDateFormat formatter = new SimpleDateFormat("HH:mm:ss");
//        long t = formatter.parse(timeIn).getTime();
//        Time timeOut = new Time(t);
//        return timeOut;
//    }
}

