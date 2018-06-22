package controllers;

import org.json.JSONArray;

import java.sql.SQLException;
import java.util.*;
import java.util.concurrent.atomic.AtomicReference;

import static spark.Spark.*;
import static util.Rendering.render;

public class Application {
    public static void main(String[] args)
    {
        port(8080);
        final AuthResponse[] status = { AuthResponse.LOGGED_OUT };

        AtomicReference<VoteController> vc = new AtomicReference<>();
        final AtomicReference<Map<String, Voter>> voters = new AtomicReference<>();

        final String[] currentVoter = {""};

        staticFiles.location("/static");

        get("/", (req, res) -> {
            Map<String, Object> model = new HashMap<>();
            model.put("resp", status[0]);
            return render(model, "velocity/login.vm");
        });

        get("/votenow", (req, res) -> {
            if (status[0] == AuthResponse.LOGGED_IN) {
                Map<String, Object> model = new HashMap<>();
                try {
                    Map<Integer, Candidate> pres = DBConn.query(CandidateType.PRESIDENT),
                                            vp = DBConn.query(CandidateType.VICEPRESIDENT),
                                            sen = DBConn.query(CandidateType.SENATOR),
                                            rep = DBConn.query(CandidateType.DISTRICTREP),
                                            gov = DBConn.query(CandidateType.GOVERNOR),
                                            mayor = DBConn.query(CandidateType.MAYOR);

                    vc.set(new VoteController(pres, vp, sen, rep, gov, mayor));

                    model.put("presidents", pres);
                    model.put("vicepresidents", vp);
                    model.put("senators", sen);
                    model.put("reps", rep);
                    model.put("govs", gov);
                    model.put("mayors", mayor);
                } catch (SQLException ex) {
                    System.out.println("DB Connection Error");
                    System.out.println(ex.getMessage());
                }
                return render(model, "velocity/votenow.vm");
            } else {
                res.redirect("/");
                return "";
            }
        });

        post("/processvote", (req, res)-> {
            try {
                Voter v = voters.get().get(currentVoter[0]);
                v.stamp();

                int pres = Integer.parseInt(req.queryParams("pres"));
                int gov = Integer.parseInt(req.queryParams("gov"));
                int mayor = Integer.parseInt(req.queryParams("mayor"));

                JSONArray sen = new JSONArray(req.queryParams("sen"));
                JSONArray rep = new JSONArray(req.queryParams("rep"));

                vc.get().vote(v, pres, CandidateType.PRESIDENT);
                vc.get().vote(v, gov, CandidateType.GOVERNOR);
                vc.get().vote(v, mayor, CandidateType.MAYOR);

                for (Object elem : sen.toList()) {
                    vc.get().vote(v, (int) elem, CandidateType.SENATOR);
                }

                for (Object elem : rep.toList()) {
                    vc.get().vote(v, (int) elem, CandidateType.DISTRICTREP);
                }

                res.redirect("/results");
            } catch (Exception ex) {
                System.out.println("Error");
                System.out.println(ex.getMessage());
            }

            return "";
        });

        post("/auth",(req, res) -> {
            String username = req.queryParams("username");
            String password = req.queryParams("password");

            try {
                voters.set(DBConn.getVoters());
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
            }

            if (voters.get().get(username) != null && password.equals("voterspassword")) {
                status[0] = AuthResponse.LOGGED_IN;
                currentVoter[0] = username;
                res.redirect("/votenow");
            } else {
                status[0] = AuthResponse.INVALID;
                res.redirect("/");
            }

            return "";
        });
    }

    private enum AuthResponse {
        LOGGED_IN,
        INVALID,
        LOGGED_OUT
    }
}
