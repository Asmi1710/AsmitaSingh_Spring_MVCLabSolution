package com.greatlearning.javafsd.studentmanagement.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.greatlearning.javafsd.studentmanagement.entity.Student;
import com.greatlearning.javafsd.studentmanagement.service.StudentService;


// this is the controller method which accepts the request from the client and sends the response
@Controller
@RequestMapping("/student")
public class StudentController {
	
	@Autowired
	private StudentService studentService;
	
	
	// this method creates a student object by fetching existing data from database
	// used for updating information regarding student
	@RequestMapping ("/begin-update")
	public String handleBeginUpdate (
			@RequestParam("studentId") int theId, 
			Model theModel) {
		
		Student student = studentService.findById(theId);
		theModel.addAttribute("student", student);
		
		return "student-details";
		
	}

	// this method creates a new student object
	// used for adding new student to the database
	@RequestMapping ("/begin-add")
	public String handleBeginAdd (Model theModel) {
		
		Student student = new Student();
		theModel.addAttribute("student", student);
		
		return "student-details";
		
	}
	
	// this method adds/updates student info in the database
	@PostMapping("/save")
	public String handleSave(
			@RequestParam("id") int theId,
			@RequestParam("firstName") String firstName,
			@RequestParam("lastName") String lastName,
			@RequestParam("department") String department,
			@RequestParam("country") String country ) {
		Student student;
		
		if (theId!=0) {
			
			// Update student (this is update scenario)
			student = studentService.findById(theId);
			student.setFirstName(firstName);
			student.setLastName(lastName);
			student.setDepartment(department);
			student.setCountry(country);
		} else // this is add student scenario
			student = new Student (firstName,lastName,department,country);
			studentService.save(student);
			return "redirect:/students/list";
	}
	
	// this method is used to delete the info regarding selected student
	
	@RequestMapping ("/delete")
	public String handleDelete(
			@RequestParam("studentId") int theId) {
		
		studentService.deleteById(theId);
		return "redirect:/students/list";
	}
}
