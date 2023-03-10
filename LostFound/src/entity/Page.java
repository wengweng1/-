package entity;

public class Page {
    //传递的参数或配置的值
    private int currentPage;//当前页编号，第1页编号1，第2页编号2,...
    private int pageSize;//每页记录数（每页展示多少条数据）,通常每页展示5,10,15,20,...条记录
    //查询数据库
    private Integer total;//总记录数
    //计算
    private int totalPage;//总页数
    private int beginPageIndex;//每页开始索引
    boolean hasPre;//是否有上一页
    boolean hasNext;//是否有下一页
    public Page() {
    }
    public Page(int currentPage, int pageSize, int total) {
        this.currentPage = currentPage;
        this.pageSize = pageSize;
        this.total = total;
        this.totalPage = (int)Math.ceil((double)total/pageSize);//计算总页数
        this.beginPageIndex = (currentPage-1)*pageSize;//计算每页开始索引
        this.hasPre=(beginPageIndex==0)?false:true;//是否有上一页
        int last;//最后一页开始索引
        if(total%pageSize==0){
            last=total-pageSize;
        }else{
            last=total-total%pageSize;
        }
        last=last<0?0:last;
        this.hasNext=(beginPageIndex==last)?false:true;//是否有下一页
    }
    //是否有上一页
    public boolean isHasPre() {
        if(beginPageIndex==0) return false;
        else return true;
    }
    //是否有下一页
    public boolean isHasNext() {
        int last;//最后一页开始索引
        if(total%pageSize==0){
            last=total-pageSize;
        }else{
            last=total-total%pageSize;
        }
        last=last<0?0:last;
        if(beginPageIndex==last)
            return false;
        else
            return true;
    }
    public int getCurrentPage() {
        return currentPage;
    }
    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }
    public int getPageSize() {
        return pageSize;
    }
    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
    public Integer getTotal() {
        return total;
    }
    public void setTotal(Integer total) {
        this.total = total;
    }
    public int getBeginPageIndex() {
        return beginPageIndex;
    }
    public void setBeginPageIndex(int beginPageIndex) {
        this.beginPageIndex = beginPageIndex;
    }
    public int getTotalPage() {
        return totalPage;
    }
    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }
    public void setHasPre(boolean hasPre) {
        this.hasPre = hasPre;
    }
    public void setHasNext(boolean hasNext) {
        this.hasNext = hasNext;
    }
}
