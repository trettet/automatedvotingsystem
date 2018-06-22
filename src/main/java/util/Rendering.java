package util;

import spark.ModelAndView;
import spark.template.velocity.*;
import java.util.Map;

public class Rendering {
    // declare this in a util-class
    public static String render(Map<String, Object> model, String templatePath) {
        return new VelocityTemplateEngine().render(new ModelAndView(model, templatePath));
    }
}
