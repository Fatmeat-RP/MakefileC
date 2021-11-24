NAME		=	<Name of the file/librairies>
CC			=	gcc
FLAGS		=	-Wall -Wextra -Werror

SRCS		=	<all src file>

BONUS		=	<all bonus file>

OBJS		=	$(SRCS:.c=.o)

BONUS_OBJS	=	$(BONUS:.c=.o)

all			:	$(NAME)

$(NAME)		:	$(OBJS)
			ar rcs $(NAME) ${OBJS}

%.o			:	%.c	libft.h
			$(CC) $(FLAGS) -c $< -o ${<:.c=.o}

clean		:
			rm -f $(OBJS) $(BONUS_OBJS)

fclean		:	clean asmclean
			rm -f $(NAME)

asm			:
			cc -S $(SRCS)

asmclean	:
			rm -f *.s

bonus		:	all $(BONUS_OBJS)
			ar rcs $(NAME) ${BONUS_OBJS}

curlparrot	:
			curl parrot.live

re			:	fclean all

.PHONY: all re clean asm fclean asmclean curlparrot bonus
