package ua.com.discounttime.config.hibernate;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

public class HibernateSessionFactory {

    private static SessionFactory sessionFactory;

    public HibernateSessionFactory() {
    }

    public SessionFactory getSessionFactory(){
        if (sessionFactory != null){
            try {
                Configuration configuration = new Configuration().configure();


                StandardServiceRegistryBuilder serviceRegistryBuilder = new StandardServiceRegistryBuilder()
                        .applySettings(configuration.getProperties());
                sessionFactory = configuration.buildSessionFactory(serviceRegistryBuilder.build());
            }catch (Exception e){
                throw  new ExceptionInInitializerError("Initial SessionFactory error! " + e);
            }
        }
        return sessionFactory;
    }
}
