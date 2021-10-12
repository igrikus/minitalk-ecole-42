#include "../includes/minitalk.h"

int main(int argc, char **argv)
{
	int	pid;

	if (argc != 3)
	{
		ft_putendl("Usage: ./client <pid> \"<string>\"");
		return (1);
	}
	pid = ft_atoi(argv[1]);
	if (pid < 0)
		ft_putendl("WRONG PID :(");
	else
		printf("draft\n");
}
