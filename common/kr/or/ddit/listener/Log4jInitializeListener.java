package kr.or.ddit.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextAttributeEvent;
import javax.servlet.ServletContextAttributeListener;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import kr.or.ddit.utiles.Log4jInitializeClazz;

public class Log4jInitializeListener implements ServletContextAttributeListener, ServletContextListener {

   @Override
   public void contextDestroyed(ServletContextEvent event) {
	   
      ServletContext application = event.getServletContext();
      
   }

   @Override
   public void contextInitialized(ServletContextEvent arg0) {
	   
      Log4jInitializeClazz.init();
      
   }

   
   
   @Override
   public void attributeAdded(ServletContextAttributeEvent arg0) {
   }

   @Override
   public void attributeRemoved(ServletContextAttributeEvent arg0) {
   }

   @Override
   public void attributeReplaced(ServletContextAttributeEvent arg0) {
   }
}