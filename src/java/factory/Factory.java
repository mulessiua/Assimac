
package factory;


public abstract class Factory {

    public abstract Object newElement();
    public abstract Object read(Object primaryKey);
    public abstract Object insert(Object o);
    public abstract int update(Object o);
    public abstract int delete(Object o);
    public abstract java.util.List selectAll();
   
}
