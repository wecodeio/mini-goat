package io.wecode.miniGoat.controllers;

import java.util.LinkedList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/noticias")
public class NoticiasController {

	List<String> comentarios = new LinkedList<String>();

	@RequestMapping("/leer")
	public ModelAndView leer(@RequestParam("id") Integer idNoticia)
			throws Exception {

		ModelMap mapa = new ModelMap();

		mapa.addAttribute("comentarios", this.comentarios);

		return new ModelAndView("noticias/leer", mapa);
	}

	@RequestMapping("/comentar")
	public ModelAndView comentar(@RequestParam("id") Integer idNoticia,
			@RequestParam("comentario") String comentario) throws Exception {

		this.comentarios.add(comentario);

		return leer(idNoticia);
	}

}
