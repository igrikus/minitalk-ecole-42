#include "../includes/minitalk.h"

void	ft_get_char(int sig)
{
	static char		ascii = '\0';
	static int		count = 0;

	if (sig == SIGUSR1)
		ascii += (1 << count);
	count++;
	if (count == 8)
	{
		ft_putchar(ascii);
		ascii = 0;
		count = 0;
	}
}

int	main(void)
{
	int	pid;

	pid = getpid();
	ft_putendl("Server is ready");
	ft_putstr("Process ID: ");
	ft_putnbr(pid);
	ft_putchar('\n');
	signal(SIGUSR1, ft_get_char);
	signal(SIGUSR2, ft_get_char);
	while (42)
		usleep(100);
}
