package serviceadmin;




import model.Author;

import java.util.List;

public interface IAuthorService {
    List<Author> findAll();
    Author findById(int id);
    void remove(int id);
    void update(int id, Author author);
    void save(Author author);

}
