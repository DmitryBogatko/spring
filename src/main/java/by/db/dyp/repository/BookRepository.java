package by.db.dyp.repository;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import by.db.dyp.domain.Book;

import java.util.List;

/**
 * Created by vas on 15.10.2015.
 */
@Repository
@Transactional
public class BookRepository {

    @Autowired
    private SessionFactory sessionFactory;

    public void addBook(Book book){
        this.sessionFactory.getCurrentSession().save(book);
    }

    public List<Book> listAll(){
        return this.sessionFactory
                .getCurrentSession()
                .createQuery("from Book")
                .list();
    }

    public void removeBook(Integer id){
        Book contact = (Book) this.sessionFactory.getCurrentSession().load(
                Book.class, id);
        if(null != contact){
            this.sessionFactory.getCurrentSession().delete(contact);
        }
    }
}
