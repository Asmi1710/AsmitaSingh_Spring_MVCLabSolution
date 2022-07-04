package com.greatlearning.javafsd.studentmanagement.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.greatlearning.javafsd.studentmanagement.entity.Student;
import com.greatlearning.javafsd.studentmanagement.service.StudentService;

//this is the controller method which accepts the request from the client and sends the response
@Controller
@RequestMapping ("/students")
public class StudentsController {

	@Autowired
	private StudentService studentService;
	
	
	// this method is used to display the list of all students saved in the database
	@RequestMapping ("/list")
	public String handleListStudents (Model theModel) {
		
		List <Student > students = studentService.listAll();
		
		theModel.addAttribute("students", students);
		
		return "students-listing";
	}
}
