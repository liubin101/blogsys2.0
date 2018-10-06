package com.lb.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lb.entity.Article;
import com.lb.entity.ArticleExample;
import com.lb.entity.custom.ArticleCustom;
import com.lb.mapper.ArticleMapper;
import com.lb.mapper.custom.ArticleMapperCustom;
import com.lb.service.AdminService;
import com.lb.utils.PageBean;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class AdminServiceImpl implements AdminService {
    @Autowired
    private ArticleMapperCustom articleMapperCustom;
    @Autowired
    private ArticleMapper articleMapper;

    @Override
    public PageBean showCheckArticles(PageBean pageBean) throws Exception {
        PageHelper.startPage(pageBean.getPageNow(),pageBean.getPageSize());
        List<ArticleCustom> list=articleMapperCustom.findCheckArticles();
        PageInfo<ArticleCustom> pageInfo=new PageInfo<>(list);
        pageBean.setTotal(pageInfo.getTotal());
        pageBean.setPages(pageInfo.getPages());
        pageBean.setList(pageInfo.getList());
        return pageBean;
    }

    @Override
    public void checkArticleOk(long artId) throws Exception {
        Article article=new Article();
        article.setIschecked((short)1);
        ArticleExample articleExample=new ArticleExample();
        ArticleExample.Criteria criteria=articleExample.createCriteria();
        criteria.andIdEqualTo(artId);
        articleMapper.updateByExampleSelective(article,articleExample);
    }

    @Override
    public void checkArticleNo(long artId) throws Exception {
        articleMapper.deleteByPrimaryKey(artId);
    }
}
