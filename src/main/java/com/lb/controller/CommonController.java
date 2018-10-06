package com.lb.controller;


import com.lb.entity.Article;
import com.lb.service.ArticleService;
import com.lb.service.UserService;
import com.lb.utils.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class CommonController {
    @Autowired
    private ArticleService articleService;
    @Autowired
    private UserService userService;

    @RequestMapping("/")
    public String goIndex(Model model){
        return "redirect:/1";
    }

    @RequestMapping("/{pageNow}")
    public String goIndex(@PathVariable Integer pageNow, Model model)throws Exception{
        PageBean pageBean=new PageBean();
        pageBean.setPageNow(pageNow);
        pageBean.setPageSize(10);
        pageBean=articleService.showAllArticles(pageBean);
        model.addAttribute("pageBean",pageBean);
        List<Article> rankArts=articleService.showRankArticles(10);
        model.addAttribute("rankArts",rankArts);
        return "common/index";
    }

    @RequestMapping("/classes/{artclassIndex}/{pageNow}")
    public String showByClasses(@PathVariable int artclassIndex,@PathVariable Integer pageNow,Model model)throws Exception{
        PageBean pageBean=new PageBean();
        pageBean.setPageNow(pageNow);
        pageBean.setPageSize(10);
        String artclass="";
        switch (artclassIndex){
            case 0:
                artclass="娱乐";
                break;
            case 1:
                artclass="文史";
                break;
            case 2:
                artclass="教育";
                break;
            case 3:
                artclass="体育";
                break;
            case 4:
                artclass="美食";
                break;
            case 5:
                artclass="旅游";
                break;
            case 6:
                artclass="新闻";
                break;
            case 7:
                artclass="其他";
                break;
        }
        pageBean=articleService.showArticlesByClass(pageBean,artclass);
        model.addAttribute("pageBean",pageBean);
        List<Article> rankArts=articleService.showRankArticles(10);
        model.addAttribute("rankArts",rankArts);
        model.addAttribute("artclassIndex",artclassIndex);
        return "common/searchArticle";
    }

    @RequestMapping("/searchArticle/{title}/{pageNow}")
    public String searchArticle(@PathVariable String title,@PathVariable Integer pageNow,Model model)throws Exception{
        PageBean pageBean=new PageBean();
        pageBean.setPageNow(pageNow);
        pageBean.setPageSize(10);
        pageBean=articleService.searchArticleByTitle(pageBean,title);
        model.addAttribute("pageBean",pageBean);
        List<Article> rankArts=articleService.showRankArticles(10);
        model.addAttribute("rankArts",rankArts);
        return "common/searchArticle";
    }

    @RequestMapping("/go/{url}")
    public String goUrl(@PathVariable String url){
        return "common/"+url;
    }
}
