package com.member.post.service;

import com.member.post.controller.BoardController;
import com.member.post.dto.BoardDTO;
import com.member.post.dto.PageDTO;
import com.member.post.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardService {
    @Autowired private BoardRepository boardRepository;
    public void save(BoardDTO boardDTO) throws IOException {
        System.out.println("boardDTO = " + boardDTO);
        if(boardDTO.getBoardProfile()==null){
        MultipartFile boardFile = boardDTO.getBoardProfile();
        String boardFileName = boardFile.getOriginalFilename();
        boardFileName = System.currentTimeMillis() + "-" + boardFileName;
        boardDTO.setBoardProfileName(boardFileName);
        String savePath = "C:\\Spring_img\\" + boardFileName;

        if (!boardFile.isEmpty()) {
            boardFile.transferTo(new File(savePath));
            boardRepository.save(boardDTO);
        }
        }else{ boardRepository.save(boardDTO);}

    }
    public List<BoardDTO> findAll() {
       List<BoardDTO> boardDTOList =  boardRepository.findAll();
      return boardDTOList;
    }
    private static final int PAGE_LIMIT=2;
    private static final int BLOCK_LIMIT=2;
    public List<BoardDTO> pagingList(int page){
        int pagingStart=(page-1)* PAGE_LIMIT;
        Map<String, Integer>pagingParam= new HashMap<>();
        pagingParam.put("start",pagingStart);
        pagingParam.put("limit",PAGE_LIMIT);
        List<BoardDTO> pagingList = boardRepository.pagingList(pagingParam);
        return pagingList;
    }
    public PageDTO paging(int page){
        int boardCount = boardRepository.boardCount();
        int maxPage=(int) (Math.ceil((double)boardCount/PAGE_LIMIT));
        int startPage = (((int) (Math.ceil((double)page/BLOCK_LIMIT)))-1)*BLOCK_LIMIT+1;
        int endPage= startPage + BLOCK_LIMIT-1;
        if(endPage>maxPage){
            endPage=maxPage;
        }
        PageDTO paging = new PageDTO();
        paging.setPage(page);
        paging.setStartPage(startPage);
        paging.setEndPage(endPage);
        paging.setMaxPage(maxPage);
        return paging;
    }

    public BoardDTO detail(Long id) {return boardRepository.detail(id);
    }

    public BoardDTO updateForm(Long id) {
      return   boardRepository.updateForm(id);
    }

    public void update(BoardDTO boardDTO) {
        boardRepository.update(boardDTO);
    }

    public void delete(Long id) {
        boardRepository.delete(id);
    }


    public List<BoardDTO> search(String q, String searchType) {
       Map<String,String> searchParam= new HashMap<>();
       searchParam.put("type",searchType);
       searchParam.put("q",q);
       List<BoardDTO> searchList= boardRepository.search(searchParam);
       return searchList;
    }
}
