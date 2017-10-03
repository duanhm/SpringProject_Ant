package com.dhm.ejb.biz;

import javax.ejb.EJBException;
import javax.ejb.SessionBean;
import javax.ejb.SessionContext;
import java.rmi.RemoteException;

public class HelloWorldBean implements SessionBean {

    /**
     * serialVersionUID
     */
    private static final long serialVersionUID = -5822535492791212079L;

    public String SayHello(String name) throws RemoteException {
        return name + "说：你好!";
    }

    public void ejbCreate() {
        System.out.println("HelloWorldBean: ejbCreate() is called!");
    }

    @Override
    public void ejbActivate() throws EJBException, RemoteException {
        // TODO Auto-generated method stub

    }

    @Override
    public void ejbPassivate() throws EJBException, RemoteException {
        // TODO Auto-generated method stub

    }

    @Override
    public void ejbRemove() throws EJBException, RemoteException {
        // TODO Auto-generated method stub

    }

    @Override
    public void setSessionContext(SessionContext paramSessionContext)
            throws EJBException, RemoteException {
        // TODO Auto-generated method stub

    }


}