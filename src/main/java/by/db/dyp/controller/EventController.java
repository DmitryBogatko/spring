package by.db.dyp.controller;

import by.db.dyp.domain.Book;
import by.db.dyp.domain.Event;
import by.db.dyp.repository.BookRepository;
import by.db.dyp.repository.EventRepository;
import by.db.dyp.validation.BookValidator;
import by.db.dyp.validation.EventValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * Created by vas on 15.10.2015.
 */
@Controller
public class EventController {

    private EventRepository eventRepository;

    private EventValidator eventValidator;

    @Autowired
    public EventController(EventRepository eventRepository, EventValidator eventValidator){
        this.eventRepository = eventRepository;
        this.eventValidator = eventValidator;
    }

    @RequestMapping(value = "/doyouplan", method = RequestMethod.GET)
    public String getEvents(Model model){
        List<Event> events = this.eventRepository.listAll();
        model.addAttribute("event",events);
        return "events";

    }

    @RequestMapping(value = "addEvent", method = RequestMethod.GET)
    @PreAuthorize("isAuthenticated()")
    public String addEvent(Model model){
        model.addAttribute("event", new Event());
        return "addEvent";
    }

    @RequestMapping(value = "addEvent", method = RequestMethod.POST)
    @PreAuthorize("isAuthenticated()")
    public String addEvent(@ModelAttribute("event") Event event, BindingResult bindingResult){
        this.eventValidator.validate(event, bindingResult);
        if (bindingResult.hasErrors()){
           return "addEvent";
        }

        this.eventRepository.addEvent(event);
        return "redirect:/";
    }

    @RequestMapping(value = "deleteEvent/{id}", method = RequestMethod.GET)
    @PreAuthorize("hasRole('admin')")
    public String deleteEvent(@PathVariable Integer id){
        this.eventRepository.removeEvent(id);
        return "redirect:/";
    }
}