# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nwattana <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/02 03:36:49 by nwattana          #+#    #+#              #
#    Updated: 2022/10/23 11:52:18 by nwattana         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME= push_swap

NSRC= ./src/push_swap.c

ACT= ./src/act/action.c ./src/act/action2.c \
	 ./src/act/l_action.c ./src/act/action3.c
PROG= ./src/prog/program.c

DEB= ./src/prog/d_prog.c ./src/put_aint.c
CONT = ./src/content/content.c \
	   ./src/content/content2.c

INPUT=	./src/input/input.c ./src/input/input2.c
SORT = ./src/main_sort.c ./src/issort.c

SMALL= ./src/small/dosort_small.c \
		./src/small/dosort_small2.c \
	   	./src/small/small.c \
	   	./src/small/small2.c

MED = ./src/med/medium.c \
	  ./src/med/assign_ch.c\
	  ./src/med/ms_init.c\
	  ./src/med/chunk.c\
	  ./src/med/a_to_b.c\
	  ./src/med/move_top.c\
	  ./src/med/b_to_a.c\
	  ./src/sort_3.c

SRC=$(PROG)	$(INPUT) $(DEB) $(CONT) \
	$(ACT) $(SORT) $(SMALL) \
	$(MED) 

CC = clang
CFLAG = -Wall -Wextra -Werror
ILIB = -iquote ./printf/includes\
	   -iquote ./printf/libft\
	   -iquote ./includes

LIB = ./printf/libftprintf.a

RED=\033[31m
GREEN=\033[32m
MAGENTA=\033[1;35m
ENDC=\033[39m

all: ps

ps: lib
	$(CC) $(CFLAG) $(ILIB) $(SRC) $(NSRC) $(LIB) -o $(NAME)

maintest:
	@printf "$(RED)=======================MAINTEST=======================$(ENDC)\n"
	@make -C ./printf
	@$(CC) $(CFLAG) $(ILIB) main_test.c $(LIB) -o test_main

greeting: 
	@clear
	@printf "====================================================\n"
	@printf "====================================================\n"
	@printf "\t$(RED)HELLO!!$(ENDC) Welcome To $(MAGENTA)$(NAME)$(ENDC)\n"
	@printf "====================================================\n"
	@printf "====================================================\n"
	@git log --oneline --graph --all -n10
	@printf "====================================================\n"
	@printf "You are on\n" 
	@git branch

testlib: lib
	@printf "====================================================\n"
	@make -C ./printf
	@$(CC) $(CFLAG) $(CLIB) testlib.c $(LIB) -o test_lib
	@printf "$(RED)=======================RESULT=======================$(ENDC)\n"
	@./out
	@printf "====================================================\n"
	@-rm out

testps:
	ARG="5 4 3 1 2"; ./push_swap_test $(ARG) | ./checker_Mac $(ARG)

lib:
	make -C ./printf

clean:
	make -C ./printf clean

fclean: clean
	make -C ./printf fclean
	rm -rf $(NAME)

re: fclean all

.PHONY: all maintest greeting testlib ps
