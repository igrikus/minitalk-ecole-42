/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bdamian <bdamian@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/10/13 20:17:36 by bdamian           #+#    #+#             */
/*   Updated: 2021/10/13 20:17:41 by bdamian          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../includes/minitalk.h"

void	send_char(int pid, char character)
{
	int	bit;
	int	bit_count;

	bit_count = 0;
	while (bit_count < 8)
	{
		bit = (character >> bit_count) & 1;
		if (bit == 1)
			bit = kill(pid, SIGUSR1);
		else
			bit = kill(pid, SIGUSR2);
		if (bit == -1)
		{
			ft_putendl("!SIGNAL ERROR!");
			exit(1);
		}
		bit_count++;
		usleep(200);
	}
}

int	main(int argc, char **argv)
{
	int		pid;
	char	*str;

	if (argc != 3)
	{
		ft_putendl("Usage: ./client <pid> \"<string>\"");
		return (1);
	}
	str = argv[2];
	pid = ft_atoi(argv[1]);
	if (pid < 0)
		ft_putendl("WRONG PID :(");
	else
	{
		while (*str)
			send_char(pid, *(str++));
		send_char(pid, '\n');
	}
}
