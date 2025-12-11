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
    public void run(String... args) {
        // Detect if running in Docker without interactive input
        if (System.console() == null) {
            System.out.println("No interactive console detected. Running inside Docker or non-interactive environment.");
            System.out.println("Skipping CLI game. To play manually, run the container with: docker run -it ...");
            return;
        }

        // Normal interactive mode (local terminal or docker -it)
        gameService.start();
    }
}
