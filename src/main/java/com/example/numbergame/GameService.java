package com.example.numbergame;


import org.springframework.stereotype.Service;

import java.util.Random;
import java.util.Scanner;

@Service
public class GameService {

    private final Random random = new Random();

    private final Scanner sc = new Scanner(System.in);

    public void start(){

        System.out.println("Welcome to the Number Guessing Game!");

        boolean playAgain = true;

        while (playAgain){
            playSingleRound();

            System.out.print("Do you want to play again? (y/n): ");
            playAgain = sc.next().equals("y");
        }
        System.out.println("Thanks for playing! Goodbye!");

    }

    void playSingleRound() {
        int secretNumber = random.nextInt(100) + 1;

        System.out.println("I'm thinking of a number between 1 and 100.");
        System.out.println("""
            Please select the difficulty level:
            1. Easy (10 chances)
            2. Medium (5 chances)
            3. Hard (3 chances)
            """);

        int maxChance = switch (sc.nextInt()) {
            case 1 -> 10;
            case 2 -> 5;
            case 3 -> 3;
            default -> 5;
        };

        System.out.println("Great! You have " + maxChance + " chances.");
        System.out.println("Let's start the game!");

        for (int attempt = 1; attempt <= maxChance; attempt++) {
            System.out.print("Enter your guess: ");
            int guess = sc.nextInt();

            if (guess == secretNumber) {
                System.out.println("🎉 Congratulations! You guessed the correct number in "
                        + attempt + " attempts.");
                return;
            } else if (guess < secretNumber) {
                System.out.println("Incorrect! The number is greater than " + guess + ".");
            } else {
                System.out.println("Incorrect! The number is less than " + guess + ".");
            }
        }

        System.out.println("You ran out of chances! The correct number was: " + secretNumber);
    }

}