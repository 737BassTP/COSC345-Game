/**
* @file quiz.c
* @brief Implements quiz.h
*/

#include "everything.h"

#include <stdbool.h>

//quiz
// Define the quiz question and answers
const char* quizHeader = "INSERT NAME HERE";//Name of person we are talking to
const char* quizInfo = "";//"correct or false"
const char* quizInfoHolder ="";//does nothing currently
const char* quizQuestion = "What is the capital of France?";//default question
const char* answerA = "A) Paris";//default answer a
const char* answerB = "B) London";//default answer b
const char* answerC = "C) Berlin";//default answer c
int correctAnswer = 0;//current number relating to the correct answer.
int userAnswer = 0;//user input for the quiz (1,2,3), 0 is default.
bool quizOn = false;//if a quiz is active (rendering)

int quizQNum = 1;//question counter for quiz (ends at 4 for three question quiz)

bool quiz2Called = false;//boolean to see if the player has completed quiz 2 etc
bool quiz3Called = false;
bool quizLoopOn = false;//are we going through the quiz loop in main
int usedQuestions[100] = {0}; // Array to keep track of used question numbers (for random question)
int usedQuestionCount = 0;    // Variable to keep track of the number of used questions (so we dont get the same random question)
// Function to check if a question number has been used before
int isQuestionUsed(int questionNumber) {
    for (int i = 0; i < usedQuestionCount; i++)
	{
        if (usedQuestions[i] == questionNumber)
		{
            return 1; // Question number is already in the usedQuestions list
        }
    }
    return 0; // Question number has not been used before
}
void updateQuizDataFromRandomLine(const char *filename,const char **quizQuestion,const char **answerA,const char **answerB,const char **answerC,int *userAnswer,int *correctAnswer,const char **quizInfoHolder) 
{
    FILE *file = fopen(filename, "r");
    if (file == NULL) 
	{
        printf("Error opening the file.\n");
        return;
    }

    // Count the number of lines in the file
    int lineCount = 0;
    char ch;
    while ((ch = fgetc(file)) != EOF) 
	{
        if (ch == '\n') 
		{
            lineCount++;
        }
    }
    // Reset the file pointer to the beginning
    rewind(file);

    // Generate a random line number
    srand(time(NULL));
    int randomLine;

    // Keep generating random line numbers until we get a line that hasn't been used before
    do
	{
        randomLine = rand() % lineCount;
    }
	while (isQuestionUsed(randomLine));

    // Add the question number to the list of used questions
    usedQuestions[usedQuestionCount] = randomLine;
    usedQuestionCount++;

    // Read and process lines until we reach the randomly selected line
    char line[1024];
    for (int i = 0; i <= randomLine; i++) 
	{
        if (fgets(line, sizeof(line), file))
		{
            char *token;
            const char *delim = ";";
            token = strtok(line, delim);
            while (token != NULL)
			{
                char varName[256], varValue[768];
                if (sscanf(token, "%[^=]=%[^\n]", varName, varValue) == 2)
				{
                    if (strcmp(varName, "quizQuestion") == 0)
					{
                        *quizQuestion = strdup(varValue);
                    }
					else if (strcmp(varName, "answerA") == 0)
					{
                        *answerA = strdup(varValue);
                    }
					else if (strcmp(varName, "answerB") == 0)
					{
                        *answerB = strdup(varValue);
                    }
					else if (strcmp(varName, "answerC") == 0)
					{
                        *answerC = strdup(varValue);
                    }
					else if (strcmp(varName, "userAnswer") == 0)
					{
                        *userAnswer = atoi(varValue);
                    }
					else if (strcmp(varName, "correctAnswer") == 0)
					{
                        *correctAnswer = atoi(varValue);
                    }
					else if (strcmp(varName, "quizInfoHolder") == 0)
					{
                        *quizInfoHolder = strdup(varValue);
                    } 
                }
                token = strtok(NULL, delim);
            }
        }
    }
    fclose(file);
}

