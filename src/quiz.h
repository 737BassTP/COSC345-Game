/**
* @file quiz.h
* @brief Defines quiz behaviour.
*/

#ifndef quiz_h
#define quiz_h

#include "everything.h"

#include <stdbool.h>


//quiz
// Define the quiz question and answers
const char* quizHeader;//Name of person we are talking to
const char* quizInfo;//"correct or false"
const char* quizInfoHolder;//does nothing currently
const char* quizQuestion;//default question
const char* answerA;//default answer a
const char* answerB;//default answer b
const char* answerC;//default answer c
int correctAnswer;//current number relating to the correct answer.
int userAnswer;//user input for the quiz (1,2,3), 0 is default.
bool quizOn;//if a quiz is active (rendering)

int quizQNum;//question counter for quiz (ends at 4 for three question quiz)

bool quiz2Called;//boolean to see if the player has completed quiz 2 etc
bool quiz3Called;
bool quizLoopOn;//are we going through the quiz loop in main
int usedQuestions[100]; // Array to keep track of used question numbers (for random question)
int usedQuestionCount;    // Variable to keep track of the number of used questions (so we dont get the same random question)
// Function to check if a question number has been used before
int isQuestionUsed(int questionNumber);
void updateQuizDataFromRandomLine(const char *filename,const char **quizQuestion,const char **answerA,const char **answerB,const char **answerC,int *userAnswer,int *correctAnswer,const char **quizInfoHolder);



#endif