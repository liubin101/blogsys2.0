package com.lb.mapper.custom;

import com.lb.entity.Article;
import com.lb.entity.custom.ArticleCustom;

import java.util.List;
import java.util.Map;

public interface ArticleMapperCustom {
    List<ArticleCustom> findAllArticles()throws Exception;

    void updateLooknumById(Map map)throws Exception;

    void updateCommentsnumById(Map map)throws Exception;

    void updateLikenumById(Map map)throws Exception;

    List<ArticleCustom> findAllArticlesByClass(String artclass)throws Exception;

    List<ArticleCustom> searchAllArticlesByTitle(String title)throws Exception;

    List<ArticleCustom> findCheckArticles()throws Exception;

    List<Article> showRankArticles(int rankSize)throws Exception;
}
