/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   push_swap.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: nwattana <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/09/02 06:18:59 by nwattana          #+#    #+#             */
/*   Updated: 2022/09/03 15:34:51 by nwattana         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "pushswap.h"

int	main(int argc, char *argv[])
{
	t_prog	*prog;

	prog = prog_init();
	if (argc == 1 || (argc == 2 &&\
			ft_strlen(argv[1]) == 0) || !prog)
	{
		ft_printf("Something fail\n");
	}
	else
	{
		get_input(argc, argv, prog);
		ft_printf("Hello Do pushswap\n");
	}

	dump_p(prog);
	prog_free(prog);
	return (0);
}
