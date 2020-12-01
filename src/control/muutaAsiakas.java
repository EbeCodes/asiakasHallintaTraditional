package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Asiakas;
import model.dao.Dao;

@WebServlet("/muutaasiakas")
public class muutaAsiakas extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public muutaAsiakas() {
        super();
        System.out.println("muutaAsiakas()");
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("muutaAsiakas.doGet()");
		String asiakas_id = request.getParameter("asiakas_id");
		Dao dao = new Dao();
		Asiakas asiakas = dao.etsiAsiakas(asiakas_id);
		request.setAttribute("asiakas", asiakas);			
		String jsp = "/muutaasiakas.jsp";
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(jsp);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("muutaAsiakas.doPost()");
		Asiakas asiakas = new Asiakas();
		asiakas.setAsiakas_id(Integer.parseInt(request.getParameter("asiakas_id")));
		asiakas.setEtunimi(request.getParameter("etunimi"));
		asiakas.setSukunimi(request.getParameter("sukunimi"));
		asiakas.setPuhelin(request.getParameter("puhelin"));
		asiakas.setSposti(request.getParameter("sposti"));
		Dao dao = new Dao();
		dao.muutaAsiakas(asiakas);
		//Haetaan muutetun asiakkaan tiedot sähköpostin avulla listalle
		response.sendRedirect("haeasiakkaat?hakusana=" + asiakas.getSposti());
	}

}
