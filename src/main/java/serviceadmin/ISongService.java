package serviceadmin;



import model.Pageable;
import model.Song;

import java.util.List;

public interface ISongService {

    List<Song> findAll();

    void save(Song song);

    Song findById(int id);

    void update(int id, Song song);

    void remove(int id);

    List<Song> findSong(Pageable pageable);
}
