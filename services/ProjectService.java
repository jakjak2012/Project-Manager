package com.jacob.beltreview.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jacob.beltreview.models.Project;
import com.jacob.beltreview.repositories.ProjectRepository;

@Service
public class ProjectService {
	@Autowired
	private ProjectRepository projectRepo;
	
	// find all
	public List<Project> allProjects(){
		return projectRepo.findAll();
	}
		
	// create
	public Project createProject(Project project) {
		return projectRepo.save(project);
	}
	
	// update
	public Project editProject(Project project) {
		return projectRepo.save(project);
	}
	
	// find one
	public Project oneProject(Long id) {
		Optional<Project> optionalProject = projectRepo.findById(id);
		if(optionalProject.isPresent()) {
			return optionalProject.get();
		}
		else {
			return null;
		}
	}
	
	// delete
	public void deleteProject(Long id) {
		projectRepo.deleteById(id);
	}
}
