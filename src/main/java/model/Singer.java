package model;

public class Singer {
    private int id;
    private String name;

    private String image_singer;

    public Singer(int id, String name,String image_singer) {
        this.id = id;
        this.name = name;
        this.image_singer = image_singer;
    }

    public String getImage_singer() {
        return image_singer;
    }

    public void setImage_singer(String image_singer) {
        this.image_singer = image_singer;
    }

    public Singer(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
