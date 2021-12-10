# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: acarle-m <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/11/04 18:24:58 by acarle-m          #+#    #+#              #
#    Updated: 2021/12/01 20:52:59 by acarle-m         ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

NAME		=	$(BUILDDIR)libftprintf.a

CC			=	gcc

FLAGS		=	-Wall -Wextra -Werror

OBJSDIR	=	objs/

BUILDDIR	=	build/

SRCSDIR	=	srcs/

LIB		=	libft/libft.a

OBJS		=	$(SRCS:$(SRCSDIR)%.c=$(OBJSDIR)%.o)

SRCS		=  $(wildcard $(SRCSDIR)*.c)

HEADER	=	-I include -I libft

all			:	$(NAME)

$(NAME)	:	$(OBJS)
		mkdir -p $(BUILDDIR)
		make bonus -C libft
		ar rcs $(NAME) $(OBJS) $(LIB)

$(OBJS): $(OBJSDIR)%.o : $(SRCSDIR)%.c
		mkdir -p $(OBJSDIR)
		$(CC) $(FLAGS) ${HEADER} -c $< -o $@

clean		:
		make clean -C libft
		rm -rf $(BONUS) $(OBjSDIR)

fclean		:	clean
		make fclean -C libft
		rm -rf $(BUILDDIR)

re			:	fclean all

.PHONY: all re clean fclean
