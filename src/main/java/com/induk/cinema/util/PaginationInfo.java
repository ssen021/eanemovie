package com.induk.cinema.util;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class PaginationInfo {
    /** 페이징 계산에 필요한 파라미터들이 담긴 클래스 */
    @JsonIgnore
    private CurrentPage currentPage;

    /** 전체 데이터 개수 */
    private int totalRecordCount;

    /** 전체 페이지 개수 */
    private int totalPageCount;

    /** 페이지 리스트의 첫 페이지 번호 */
    private int firstPage;

    /** 페이지 리스트의 마지막 페이지 번호 */
    private int lastPage;

    /** SQL의 조건절에 사용되는 첫 RNUM */
    private int firstRecordIndex;

    /** SQL의 조건절에 사용되는 마지막 RNUM */
    private int lastRecordIndex;

    /** 이전 페이지 존재 여부 */
    private boolean hasPreviousPage;

    /** 다음 페이지 존재 여부 */
    private boolean hasNextPage;

    public PaginationInfo(CurrentPage currentPage) {
        if (currentPage.getCurrentPageNo() < 1) {
            currentPage.setCurrentPageNo(1);
        }
        if (currentPage.getRecordsPerPage() < 1 || currentPage.getRecordsPerPage() > 100) {
            currentPage.setRecordsPerPage(10);
        }
        if (currentPage.getPageSize() < 1 || currentPage.getPageSize() > 100) {
            currentPage.setPageSize(10);
        }

        this.currentPage = currentPage;
    }

    public void setTotalRecordCount(int totalRecordCount) {
        this.totalRecordCount = totalRecordCount;

        if (totalRecordCount > 0) {
            calculation();
        }
    }

    private void calculation() {

        /* 전체 페이지 수 (현재 페이지 번호가 전체 페이지 수보다 크면 현재 페이지 번호에 전체 페이지 수를 저장) */
        totalPageCount = ((totalRecordCount - 1) / currentPage.getRecordsPerPage()) + 1;
        if (currentPage.getCurrentPageNo() > totalPageCount) {
            currentPage.setCurrentPageNo(totalPageCount);
        }

        /* 페이지 리스트의 첫 페이지 번호 */
        firstPage = ((currentPage.getCurrentPageNo() - 1) / currentPage.getPageSize()) * currentPage.getPageSize() + 1;

        /* 페이지 리스트의 마지막 페이지 번호 (마지막 페이지가 전체 페이지 수보다 크면 마지막 페이지에 전체 페이지 수를 저장) */
        lastPage = firstPage + currentPage.getPageSize() - 1;

        if (lastPage > totalPageCount) {
            lastPage = totalPageCount;
        }

        /* SQL의 조건절에 사용되는 첫 RNUM */
        firstRecordIndex = (currentPage.getCurrentPageNo() - 1) * currentPage.getRecordsPerPage();

        /* SQL의 조건절에 사용되는 마지막 RNUM */
        lastRecordIndex = currentPage.getCurrentPageNo() * currentPage.getRecordsPerPage();

        /* 이전 페이지 존재 여부 */
        hasPreviousPage = firstPage != 1;

        /* 다음 페이지 존재 여부 */
        hasNextPage = (lastPage * currentPage.getRecordsPerPage()) < totalRecordCount;
    }
}
