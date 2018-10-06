package com.lb.service;

import com.lb.utils.PageBean;

public interface AdminService {
    public PageBean showCheckArticles(PageBean pageBean)throws Exception;

    public void checkArticleOk(long artId)throws Exception;

    public void checkArticleNo(long artId)throws Exception;
}
