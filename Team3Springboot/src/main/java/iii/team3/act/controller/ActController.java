package iii.team3.act.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import iii.team3.act.entity.ActMain;
import iii.team3.act.service.ActService;

@Controller
@RequestMapping("/actMain")
public class ActController {

	@Autowired
	private ActService actService;

	@GetMapping(value = "/list")
	public String listActs(Model theModel) {

		List<ActMain> theActMains = actService.getActMains();

		theModel.addAttribute("actMains", theActMains);

		return "view/list-actMains";
	}

	@GetMapping("/showFormForAdd")
	public String showFormForAdd(Model theModel) {

		ActMain theActMain = new ActMain();

		theModel.addAttribute("actMain", theActMain);

		return "view/actMain-form";
	}

	@PostMapping(path = "/saveActMain")
	public String saveActMain(@ModelAttribute("actMain") ActMain theActMain) {

		actService.saveActMain(theActMain);

		return "redirect:/actMain/list";
	}

	@GetMapping("/showFormForUpdate")
	public String showFormForUpdate(@RequestParam("actMainId") int theId, Model theModel) {

		ActMain theActMain = actService.getActMain(theId);

		theModel.addAttribute("actMain", theActMain);

		return "view/actMain-form";

	}

	@GetMapping("/delete")
	public String deleteActMain(@RequestParam("actMainId") int theId) {

		actService.deleteActMain(theId);

		return "redirect:/actMain/list";
	}

}
