# 🎮 Number Guessing Game — Spring Boot (Gradle)

A fun and interactive **Number Guessing Game** built using **Spring Boot**. The computer randomly selects a number between **1 and 100**, and the user must guess it within a limited number of attempts based on the selected difficulty. This project showcases Spring Boot fundamentals, service-layer logic, and CLI interaction using `CommandLineRunner`.

---

## 🧩 Features

* Random number between **1 and 100**
* Three difficulty levels:

  * **Easy** → 10 chances
  * **Medium** → 5 chances
  * **Hard** → 3 chances
* Feedback after each guess:

  * "Greater than your guess"
  * "Less than your guess"
* Tracks total attempts
* Game ends when:

  * User guesses correctly
  * User runs out of chances
* Optional enhancements implemented (if included):

  * Replay system
  * Timer to measure guessing duration
  * Hint system
  * High score tracking

---

## 📂 Project Structure

```
src/
 └── main/
      ├── java/
      │    └── com.yourname.numbergame/
      │         ├── NumberGuessingGameApplication.java
      │         ├── service/
      │         │      └── GameService.java
      │         └── model/
      └── resources/
           └── application.properties
```

---

## 🚀 Technologies Used

* **Java 17+**
* **Spring Boot**
* **Gradle Build Tool**
* **CommandLineRunner** for CLI Interaction

---

## ⚙️ Gradle Dependencies (`build.gradle`)

```
plugins {
    id 'java'
    id 'org.springframework.boot' version '3.2.0'
    id 'io.spring.dependency-management' version '1.1.3'
}

group = 'com.example'
version = '0.0.1-SNAPSHOT'

java {
    sourceCompatibility = '17'
}

dependencies {
    implementation 'org.springframework.boot:spring-boot-starter'
    testImplementation 'org.springframework.boot:spring-boot-starter-test'
}
```

---

## ▶️ How to Run the Game

### Using Gradle

```
./gradlew bootRun
```

### Using Java

```
java -jar build/libs/number-guessing-game-0.0.1-SNAPSHOT.jar
```

---

## 📝 Game Flow

1. Game prints a welcome message.
2. User selects difficulty level.
3. The game assigns attempts based on difficulty.
4. User enters guesses one by one.
5. Game provides feedback:

   * "Higher than your guess"
   * "Lower than your guess"
6. Game finishes when:

   * User guesses correctly → Display attempts used.
   * User runs out of attempts → Display correct number.
7. User may play again (if feature added).

---

## 📌 Sample Output

```
Welcome to the Number Guessing Game!
Select difficulty:
1. Easy (10 chances)
2. Medium (5 chances)
3. Hard (3 chances)
Enter choice: 2

Great! You selected Medium difficulty.

Enter your guess: 50
Incorrect! The number is less than 50.

Enter your guess: 25
Incorrect! The number is greater than 25.

Enter your guess: 30
Congratulations! You guessed the number in 3 attempts!
```

---

## 🛠️ Future Enhancements

* Add hint system
* Add persistent high score tracking
* Build REST API version of the game
* Add Web UI using React or Thymeleaf
* Add colored terminal output

---

## 🤝 Contributing

1. Fork the repository
2. Create a branch: `git checkout -b feature-name`
3. Commit changes: `git commit -m "Describe feature"`
4. Push branch: `git push origin feature-name`
5. Create a Pull Request
