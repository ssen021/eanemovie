package com.induk.cinema.util;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class Criteria {
    private int page;
    private int perPageNum;

    public Criteria() {
        this.page = 1;
        this.perPageNum = 6;
    }

    public int getPageStart() {
        return (page-1)*perPageNum;
    }

    public void setPage(int page) {
        if(page <= 0) {
            this.page = 1;
        } else {
            this.page = page;
        }
    }

    public void setPerPageNum(int perPageNum) {
        int cnt = this.perPageNum;
        if (perPageNum != cnt) {
            this.perPageNum = cnt;
        } else {
            this.perPageNum = perPageNum;
        }
    }
}
