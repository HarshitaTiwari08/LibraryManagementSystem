package com.lms.serviceImpl;

import java.util.Date;
import java.util.List;

import com.lms.dao.BookDao;
import com.lms.daoImpl.BookDaoImpl;
import com.lms.pojo.Book;
import com.lms.pojo.BookIssued;
import com.lms.service.BookService;

public class BookServiceImpl implements BookService {
	
	BookDao bookDao = new BookDaoImpl();

	@Override
	public boolean addBook(Book book) {
		return bookDao.addBook(book);
	}

	@Override
	public boolean updateBook(Book book) {
		// TODO Auto-generated method stub
		return bookDao.updateBook(book);
	}

	@Override
	public List<Book> getAllBookList() {
		// TODO Auto-generated method stub
		return bookDao.getAllBookList();
	}

	@Override
	public List<Book> getAllBookByStatus(String status) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Book getBookById(long bookId) {
		// TODO Auto-generated method stub
		return bookDao.getBookById(bookId);
	}

	@Override
	public List<Book> getAllAvailableBookList() {
		return bookDao.getAllAvailableBookList();
	}

	@Override
	public boolean assignBook(BookIssued bookIssued) {
		bookIssued.setIssueDate(new Date());
		bookIssued.setStatus("ISSUED");
		
		boolean assignFlag = false;
		Book book = bookDao.getBookById(bookIssued.getBook().getBookId());
		if(book != null) {
			int availableCopies = book.getAvailableCopies() - 1;
			
			boolean updateflag = bookDao.updateAvailableBook(bookIssued.getBook().getBookId(), availableCopies);
			
			if(updateflag) {
				assignFlag = bookDao.assignBook(bookIssued);
				
				if(!assignFlag) {
					Book book1 = bookDao.getBookById(bookIssued.getBook().getBookId());
					int newAvailableCopies = book1.getAvailableCopies() + 1;
					bookDao.updateAvailableBook(bookIssued.getBook().getBookId(), newAvailableCopies);
				}
			}
		}
		
		return assignFlag;
	}

	@Override
	public List<BookIssued> getAllIssuedBookList() {
		return bookDao.getAllIssuedBookList();
	}

	@Override
	public BookIssued getIssuedBookById(long issueId) {
		return bookDao.getIssuedBookById(issueId);
	}

	@Override
	public boolean updateBookReturn(BookIssued bookIssued) {
		bookIssued.setStatus("RETURN");
		
		BookIssued bookIssued2 = bookDao.getIssuedBookById(bookIssued.getIssueId());
		boolean returnflag = false;
		
		if(bookIssued2 != null) {
			int availableCopies = bookIssued2.getBook().getAvailableCopies() + 1;
			
			boolean updateflag = bookDao.updateAvailableBook(bookIssued2.getBook().getBookId(), availableCopies);
			if(updateflag) {
				 returnflag = bookDao.updateBookReturn(bookIssued);
				
				 if(!returnflag) {
					 BookIssued bookIssued3 = bookDao.getIssuedBookById(bookIssued.getIssueId());
					 int newAvailableCopies = bookIssued3.getBook().getAvailableCopies() - 1;
					 bookDao.updateAvailableBook(bookIssued3.getBook().getBookId(), newAvailableCopies);
				 }
			}
		}
		
		return returnflag;
	}

	@Override
	public List<BookIssued> getIssuedBookListForDashboard() {
		return bookDao.getIssuedBookListForDashboard();
	}

	
}
