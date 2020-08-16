package ua.com.discounttime.config.hibernate;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import ua.com.discounttime.repository.entity.*;
import ua.com.discounttime.repository.entity.views.FullItemInfoView;
import ua.com.discounttime.repository.entity.views.ItemInfoView;

public class HibernateSessionFactory {

    private static SessionFactory sessionFactory;

    public HibernateSessionFactory() {
    }

    public SessionFactory getSessionFactory(){
        if (sessionFactory != null){
            try {
                Configuration configuration = new Configuration().configure();
                configuration.addAnnotatedClass(Brand.class);
                configuration.addAnnotatedClass(Category.class);
                configuration.addAnnotatedClass(Collection.class);
                configuration.addAnnotatedClass(Item.class);
                configuration.addAnnotatedClass(ItemSize.class);
                configuration.addAnnotatedClass(Size.class);
                configuration.addAnnotatedClass(Type.class);
                configuration.addAnnotatedClass(FullItemInfoView.class);
                configuration.addAnnotatedClass(ItemInfoView.class);

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
