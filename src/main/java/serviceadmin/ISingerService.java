package serviceadmin;



import model.Singer;

import java.util.List;

public interface ISingerService {
    List<Singer> findAll();
    Singer findById(int id);
}
