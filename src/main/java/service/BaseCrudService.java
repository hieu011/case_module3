package service;

import java.util.List;

public interface BaseCrudService<T> {
    void create(T t);
    void edit(T t);
    T delete(int id);
    List<T> findAll();
    T findById(int id);
}
