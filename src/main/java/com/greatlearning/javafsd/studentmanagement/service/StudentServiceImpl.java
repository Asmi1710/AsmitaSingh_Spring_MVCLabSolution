package com.greatlearning.javafsd.studentmanagement.service;

import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.greatlearning.javafsd.studentmanagement.entity.Student;

// this class implements the methods/services in StudentService interface
@Repository
public class StudentServiceImpl implements StudentService {

	private Session session;
	
	
	// this creates a session or opens an existing session  
	@Autowired
	StudentServiceImpl (SessionFactory sessionFactory){
		try {
			session = sessionFactory.getCurrentSession();
		}
		catch (HibernateException e) {
			session = sessionFactory.openSession();
		}
	}
	
	
	// this method lists all the details of students from the table
	@Transactional
	public List<Student> listAll(){
		Transaction transaction = session.beginTransaction();
		
		List <Student> students
			= session.createQuery ("from student_entity").list();
		
		transaction.commit();
		return students;
	}
	
	
	// this method finds a student from the database table based on his id
	@Transactional 
	public Student findById (int id) {
		Student student = new Student();
		
		Transaction transaction = session.beginTransaction();
		student =session.get(Student.class, id);
		transaction.commit();
		
		return student;
	}
	
	// this method is used to save/update any specific student's details in the database table
	
	@Transactional
	public void save(Student student) {
		
		Transaction transaction = session.beginTransaction();
		
		session.saveOrUpdate(student);
		transaction.commit();
	}
	
	// this method deletes entry of a student based on id given as input
	
	@Transactional 
	public void deleteById (int id) {
		Transaction transaction = session.beginTransaction();

		Student student = session.get(Student.class, id);

		session.delete(student);

		transaction.commit();
	}
}
