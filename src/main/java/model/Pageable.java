package model;

public class Pageable {
    private String kw;
    private int authorType;
    private int categoryType;
    private int singerType;
    private int page;
    private int limit;
    private int total;

    public Pageable() {
    }

    public Pageable(String kw, int authorType, int categoryType, int singerType, int page, int limit, int total) {
        this.kw = kw;
        this.authorType = authorType;
        this.categoryType = categoryType;
        this.singerType = singerType;
        this.page = page;
        this.limit = limit;
        this.total = total;
    }

    public String getKw() {
        return kw;
    }

    public void setKw(String kw) {
        this.kw = kw;
    }

    public int getAuthorType() {
        return authorType;
    }

    public void setAuthorType(int authorType) {
        this.authorType = authorType;
    }

    public int getCategoryType() {
        return categoryType;
    }

    public void setCategoryType(int categoryType) {
        this.categoryType = categoryType;
    }

    public int getSingerType() {
        return singerType;
    }

    public void setSingerType(int singerType) {
        this.singerType = singerType;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
}

