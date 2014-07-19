package io.wecode.miniGoat.controllers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/usuarios")
public class UsuariosController {

	@RequestMapping("/listado")
	public ModelAndView listado(@RequestParam("filtro") String filtro)
			throws Exception {

		ModelMap mapa = new ModelMap();
		mapa.addAttribute("filtro", filtro);

		List<String> usuarios = new LinkedList<String>();

		Class.forName("org.postgresql.Driver");
		String url = "jdbc:postgresql://localhost:5432/mini-goat";
		Connection conn = DriverManager.getConnection(url, "mini-goat", "mini-goat");

		Statement stmt = conn.createStatement();
		ResultSet rs;

		rs = stmt.executeQuery("select * from usuarios where username = '"
				+ filtro + "'");

		while (rs.next()) {
			usuarios.add(rs.getString("username"));
		}
		conn.close();

		mapa.addAttribute("usuarios", usuarios);

		return new ModelAndView("usuarios/listado", mapa);
	}

}
