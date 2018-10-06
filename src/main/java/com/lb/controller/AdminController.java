package com.lb.controller;

import com.lb.entity.Article;
import com.lb.entity.Users;
import com.lb.service.AdminService;
import com.lb.service.ArticleService;
import com.lb.service.UserService;
import com.lb.utils.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;
    @Autowired
    private ArticleService articleService;
    @Autowired
    private UserService userService;

    @RequestMapping("/showCheckArticles/{pageNow}")
    public String showCheckArticles(@PathVariable int pageNow, Model model)throws Exception{
        PageBean pageBean=new PageBean();
        pageBean.setPageNow(pageNow);
        pageBean.setPageSize(15);
        pageBean=adminService.showCheckArticles(pageBean);
        model.addAttribute("pageBean",pageBean);
        return "admin/adminPage";
    }

    @RequestMapping("/checkArticleOk/{artId}")
    public String checkArticleOk(@PathVariable long artId)throws Exception{
        adminService.checkArticleOk(artId);
        return "redirect:/admin/showCheckArticles/1";
    }

    @RequestMapping("/checkArticleNo/{artId}")
    public String checkArticleNo(@PathVariable long artId)throws Exception{
        Article article=articleService.findArticleById(artId);
        Users users=userService.findUserById(article.getUserid());
        long articlenum=users.getArticlenum()-1;
        adminService.checkArticleNo(artId);
        userService.updArticleNum(articlenum,users.getId());
        return "redirect:/admin/showCheckArticles/1";
    }
}
