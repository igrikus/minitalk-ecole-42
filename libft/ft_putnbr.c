/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_putnbr.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bdamian <bdamian@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/10/12 19:23:01 by bdamian           #+#    #+#             */
/*   Updated: 2021/10/13 20:19:32 by                  ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static int	get_number_len(int nb)
{
	int	length;

	length = 0;
	while (nb != 0)
	{
		length++;
		nb /= 10;
	}
	return (length);
}

static void	print_result(char *digits, int temp_len)
{
	int	counter;

	counter = 0;
	while (counter < temp_len)
		ft_putchar(digits[counter++]);
}

static void	make_job(int n)
{
	int		num_len;
	int		temp_len;
	char	digits[10];

	num_len = get_number_len(n);
	temp_len = num_len;
	while (n != 0)
	{
		digits[--num_len] = (char)(n % 10 + '0');
		n /= 10;
	}
	print_result(digits, temp_len);
}

void	ft_putnbr(int n)
{
	if (n == 0)
	{
		write(STDOUT_FILENO, "0", 1);
		return ;
	}
	if (n == -2147483648)
	{
		write(STDOUT_FILENO, "-2147483648", 11);
		return ;
	}
	if (n < 0)
	{
		write(STDOUT_FILENO, "-", 1);
		n = n + (-2 * n);
	}
	make_job(n);
}
