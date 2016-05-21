package by.db.dyp.repository;

import by.db.dyp.domain.Event;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by vas on 15.10.2015.
 */
@Repository
@Transactional
public class EventRepository {

    @Autowired
    private SessionFactory sessionFactory;

    public void addEvent(Event event){
        this.sessionFactory.getCurrentSession().save(event);
    }

    public List<Event> listAll(){
        return this.sessionFactory
                .getCurrentSession()
                .createQuery("from Event")
                .list();
    }

    public void removeEvent(Integer id){
        Event contact = (Event) this.sessionFactory.getCurrentSession().load(
                Event.class, id);
        if(null != contact){
            this.sessionFactory.getCurrentSession().delete(contact);
        }
    }
}
