import java.util.*;

import static spark.Spark.*;
import static util.Rendering.render;

public class Application {
    public static void main(String[] args)
    {
        port(8080);
        final AuthResponse[] status = { AuthResponse.LOGGED_OUT };

        staticFiles.location("/static");

        get("/", (req, res) -> {
            Map<String, Object> model = new HashMap<>();
            model.put("resp", status[0]);
            return render(model, "velocity/login.vm");
        });

        get("/votenow", (req, res) -> {
            if (status[0] == AuthResponse.LOGGED_IN) {
                Map<String, Object> model = new HashMap<>();
                model.put("resp", status[0]);
                return render(model, "velocity/votenow.vm");
            } else {
                res.redirect("/");
                return "";
            }
        });

        post("/auth",(req, res) -> {
            String username = req.queryParams("username");
            String password = req.queryParams("password");

            if (username.equals("voter") && password.equals("voterpassword")) {
                status[0] = AuthResponse.LOGGED_IN;
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
