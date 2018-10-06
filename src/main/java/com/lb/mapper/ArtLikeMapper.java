package com.lb.mapper;

import com.lb.entity.ArtLike;
import com.lb.entity.ArtLikeExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ArtLikeMapper {
    long countByExample(ArtLikeExample example);

    int deleteByExample(ArtLikeExample example);

    int deleteByPrimaryKey(Long id);

    int insert(ArtLike record);

    int insertSelective(ArtLike record);

    List<ArtLike> selectByExample(ArtLikeExample example);

    ArtLike selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") ArtLike record, @Param("example") ArtLikeExample example);

    int updateByExample(@Param("record") ArtLike record, @Param("example") ArtLikeExample example);

    int updateByPrimaryKeySelective(ArtLike record);

    int updateByPrimaryKey(ArtLike record);
}