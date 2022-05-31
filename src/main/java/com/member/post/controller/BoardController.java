package com.member.post.controller;

import com.member.post.dto.BoardDTO;
import com.member.post.dto.PageDTO;
import com.member.post.service.BoardService;
import com.member.post.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/board")


public class BoardController {
    @Autowired private BoardService boardService;
    @Autowired private CommentService commentService;
    @GetMapping("/save")
    public String saveForm(){

        return "board/save";
    }


    @PostMapping("/save")
    public String save(@ModelAttribute BoardDTO boardDTO,Model model) throws IOException {
        System.out.println("boardDTO = " + boardDTO + ", model = " + model);
      boardService.save(boardDTO);
        List<BoardDTO> boardDTOList= boardService.findAll();
        model.addAttribute("findList",boardDTOList);
    return "redirect:/board/paging";
    }

    @GetMapping("/findAll")
    public String findAll(Model model){
       List<BoardDTO> boardDTOList= boardService.findAll();
       model.addAttribute("findList",boardDTOList);
        return "board/findAll";
    }
    @GetMapping("/paging")
    public String paging(@RequestParam(value="page",required = false,defaultValue = "1")int page,Model model){
        List<BoardDTO>boardDTOList=boardService.pagingList(page);
        PageDTO pageDTO=boardService.paging(page);
        model.addAttribute("boardList",boardDTOList);
        model.addAttribute("paging",pageDTO);
        return "board/pagingList";
    }
    @GetMapping("/detail")
    public String detail(@RequestParam("id")Long id, Model model,
                         @RequestParam(value="page",required=false,defaultValue = "1")int page){

        BoardDTO boardDTO=boardService.detail(id);
        model.addAttribute("page",page);
        model.addAttribute("UserDb",boardDTO);

        model.addAttribute("commentList", commentService.findAll(id));
        return "board/detail";
    }
    @GetMapping("/updateForm")
        public String updateForm (@RequestParam("id")Long id,Model model){
       BoardDTO boardDTO= boardService.updateForm(id);
       model.addAttribute("findById",boardDTO);
    return "board/updateForm";
    }
    @PostMapping("update")
    public String update(@ModelAttribute BoardDTO boardDTO){
        boardService.update(boardDTO);
        return "redirect:/board/detail?id="+boardDTO.getId();
    }
    @GetMapping("/delete")
    public String delete(@RequestParam("id")Long id){
        boardService.delete(id);
        return "redirect:/board/detail?id="+id;
    }
    @GetMapping("/search")
    public String search(@RequestParam("searchType") String searchType, @RequestParam("q")String q,Model model){

        model.addAttribute("findList",boardService.search(q,searchType));
    return "board/findAll";
    }
}
