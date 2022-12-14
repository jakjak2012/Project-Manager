package com.jacob.beltreview.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.jacob.beltreview.models.Project;
import com.jacob.beltreview.services.ProjectService;

@Controller 
public class HomeController {
	
	@Autowired
	private ProjectService projectService;
	
	@GetMapping("/dashboard")
	public String dashboard(HttpSession session, Model model) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		model.addAttribute("projectList", projectService.allProjects());
		return "dashboard.jsp";
	}
	
	// Create
	// 1. show the form
	@GetMapping("/projects/new")
	public String newProjectForm(@ModelAttribute("project")Project project, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		return "newProject.jsp";
	}
	
	// 2. process form
	@PostMapping("/projects/new")
	public String processCreate(@Valid @ModelAttribute("project")Project project,
			BindingResult result, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		if(result.hasErrors()) {
			return "newProject.jsp";
		}
		else {
			projectService.createProject(project);
			return "redirect:/dashboard";
		}
	}
	
	// one project
	@GetMapping("/projects/{id}")
	public String projectDetails(@PathVariable("id")Long id, Model model, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		Project project = projectService.oneProject(id);
		model.addAttribute("project", project);
		return "oneProject.jsp";
	}
	
	// edit project
	// 1. show the form
	@GetMapping("/projects/edit/{id}")
	public String editProjectForm(@PathVariable("id")Long id, Model model, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		Project project = projectService.oneProject(id);
		model.addAttribute("project", project);
		return "editProject.jsp";
	}
	
	// 2. process
	@PutMapping("/projects/edit/{id}")
	public String processEditProject(@Valid @ModelAttribute("project")Project project,
			BindingResult result, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		if(result.hasErrors()) {
			return "editProject.jsp";
		}
		else {
			projectService.editProject(project);
			return "redirect:/dashboard";
		}
	
	}
	
	// delete
	@DeleteMapping("/projects/delete/{id}")
	public String deleteProject(@PathVariable("id")Long id, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		projectService.deleteProject(id);
		return "redirect:/dashboard";
	}
}
