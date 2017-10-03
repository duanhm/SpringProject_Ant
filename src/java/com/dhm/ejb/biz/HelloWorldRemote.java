package com.dhm.ejb.biz;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;


public interface HelloWorldRemote extends EJBObject {
    public String SayHello(String name) throws RemoteException;
}
