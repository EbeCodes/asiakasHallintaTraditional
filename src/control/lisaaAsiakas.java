package control;
import model.Asiakas;
import model.dao.Dao;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lisaaasiakas")
public class lisaaAsiakas extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public lisaaAsiakas() {
        super();
        System.out.println("lisaaAsiakas()");
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("lisaaAsiakas.doGet()");
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("lisaaAsiakas.doPost()");
		Asiakas asiakas = new Asiakas();
		asiakas.setEtunimi(request.getParameter("etunimi"));
		asiakas.setSukunimi(request.getParameter("sukunimi"));
		asiakas.setPuhelin(request.getParameter("puhelin"));
		asiakas.setSposti(request.getParameter("sposti"));
		Dao dao = new Dao();
		dao.lisaaAsiakas(asiakas);
		//Haetaan lisätyn asiakkaan tiedot sähköpostin avulla listalle
		response.sendRedirect("haeasiakkaat?hakusana=" + asiakas.getSposti());
	}
}
