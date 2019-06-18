package top.yzlin.jx3strategystation.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import top.yzlin.jx3strategystation.dao.GameDataDAO;
import top.yzlin.jx3strategystation.entity.game.MenPai;
import top.yzlin.jx3strategystation.entity.game.XinFa;

import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)
public class GameDataService {
    private final GameDataDAO gameDataDAO;

    public GameDataService(GameDataDAO gameDataDAO) {
        this.gameDataDAO = gameDataDAO;
    }

    public List<MenPai> findMenPaiList() {
        return gameDataDAO.findMenPaiList();
    }

    public List<String> findMenPaiNameList() {
        return gameDataDAO.findMenPaiNameList();
    }

    public List<XinFa> findMenPaiXinFasByXinFaName(String xinFaName) {
        return gameDataDAO.findMenPaiXinFasByXinFaName(xinFaName);
    }

    public List<String> findMenPaiXinFaNamesByXinFaName(String xinFaName) {
        return gameDataDAO.findMenPaiXinFaNamesByXinFaName(xinFaName);
    }
}
