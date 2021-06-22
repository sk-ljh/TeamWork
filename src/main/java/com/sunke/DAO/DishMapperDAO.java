package com.sunke.DAO;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.our.pojo.*;

public interface DishMapperDAO {
			public List<Dishs> ListDishsAll();
			public List<String> reCate();
}
