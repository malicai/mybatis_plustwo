package mybatis_plus.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import mybatis_plus.entity.User;
import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper extends BaseMapper<User> {
}
