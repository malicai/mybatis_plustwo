package mybatis_plus.handler;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.logging.Logger;

@Slf4j
@Component
public class MyMetaObjectHandler implements MetaObjectHandler {
    /**
     * 插入时自动填充
     * @param metaObject
     */
    private static Log log = LogFactory.getLog(MyMetaObjectHandler.class);
    @Override
    public void insertFill(MetaObject metaObject) {
        log.info("insert自动填充");
        //第一个参数：实体属性名（不是数据库表的列名）
        //第二个参数：数据类型和实体属性一致
        //第三个参数：元数据对象
        this.setFieldValByName("createTime", new Date(), metaObject);
        this.setFieldValByName("updateTime", new Date(), metaObject);
    }

    /**
     * 修改时自动填充
     * @param metaObject
     */
    @Override
    public void updateFill(MetaObject metaObject) {
        log.info("update自动填充");
        this.setFieldValByName("updateTime", new Date(), metaObject);
    }

    private void setFieldValByName(String updateTime, Date date, MetaObject metaObject) {
    }

}
