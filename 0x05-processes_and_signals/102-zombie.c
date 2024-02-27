#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>

/**
 * infinite_while - Creates an infinite loop
 *
 * Return: Always returns 0.
 */
int infinite_while(void)
{
    while (1)
    {
        sleep(1);
    }
    return (0);
}

/**
 * main - Entry point
 *
 * Return: Always returns 0.
 */
int main(void)
{
    pid_t child_pid;
    int i;

    for (i = 0; i < 5; i++)
    {
        child_pid = fork(); // Create a child process
        if (child_pid == 0) // Child process
        {
            printf("Zombie process created, PID: %d\n", getpid());
            exit(0); // Child exits immediately, becoming a zombie
        }
        else if (child_pid < 0) // Error handling
        {
            perror("Error");
            return (1);
        }
    }

    infinite_while(); // Infinite loop to keep the parent process running

    return (0);
}
