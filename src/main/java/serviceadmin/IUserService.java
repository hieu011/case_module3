package serviceadmin;



import model.User;

import java.util.List;

public interface IUserService {
    List<User> findAll();
    User findById(int id);
    void update(int id, User user);
    void remove(int id);
}

