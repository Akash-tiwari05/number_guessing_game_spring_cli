package com.example.numbergame;

import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

@Component
public class GameRunner implements CommandLineRunner {

    private final GameService gameService;

    public GameRunner(GameService gameService){
        this.gameService = gameService;
    }

    @Override
    public void run(String... args) throws Exception {
        gameService.start();
    }
}
