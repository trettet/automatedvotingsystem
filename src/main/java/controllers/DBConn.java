package controllers;

import java.sql.*;
import java.text.MessageFormat;
import java.util.HashMap;
import java.util.Map;

public class DBConn {
    private final static String host;
    private final static String dbName;
    private final static String username;
    private final static String password;
    private final static int port;

    static {
        host = "localhost";
        dbName = "avs";
        username = "root";
        password = "";
        port = 3306;
    }

    private static String getConnectionString()
    {
        return String.format("jdbc:mysql://%s/%s" +
                "?useUnicode=true&useJDBCCompliantTimezoneShift=true" +
                "&useLegacyDatetimeCode=false&serverTimezone=UTC",
                host, dbName);
    }

    private static Connection getConnection() throws SQLException
    {
        return DriverManager.getConnection(getConnectionString(), username, password);
    }

    public static Map<Integer, Candidate> query(CandidateType type) throws SQLException
    {
        Map<Integer, Candidate> ret = new HashMap<>();

        Connection conn = getConnection();
        String candidateStr = "";

        switch (type) {
            case PRESIDENT:
                candidateStr = "presidents";
                break;
            case VICEPRESIDENT:
                candidateStr = "vicepresidents";
                break;
            case SENATOR:
                candidateStr = "senators";
                break;
            case DISTRICTREP:
                candidateStr = "districtreps";
                break;
            case GOVERNOR:
                candidateStr = "governors";
                break;
            case MAYOR:
                candidateStr = "mayors";
                break;
        }

        String query = MessageFormat.format(
                "SELECT {0}.id, {0}.name, parties.name, parties.color FROM {0} " +
                "INNER JOIN parties ON {0}.party_id = parties.id", candidateStr);
        System.out.println(query);
        PreparedStatement stmt = conn.prepareStatement(query);

        ResultSet res = stmt.executeQuery();

        while (res.next()) {
            ret.put(res.getInt(1), new Candidate(res.getString(2), type,
                    new Party(res.getString(3), res.getString(4))));
        }

        conn.close();

        return ret;
    }

    public static Map<String, Voter> getVoters() throws SQLException
    {
        Map<String, Voter> ret = new HashMap<>();

        Connection conn = getConnection();

        String query = "SELECT username, name FROM voters ORDER BY name ASC";
        PreparedStatement stmt = conn.prepareStatement(query);

        ResultSet res = stmt.executeQuery();

        while (res.next()) {
            ret.put(res.getString(1), new Voter(res.getString(2)));
        }

        conn.close();

        return ret;
    }

}
