NAME = libft.a

SOURCE = ft_atoi.c ft_putendl.c ft_putnbr.c ft_putstr.c ft_putchar.c

OBJ = $(patsubst %.c,%.o,$(SOURCE))

D_FILES = $(patsubst %.c,%.d,$(SOURCE) $(SOURCE_BONUS))

FLAGS = -Wall -Wextra -Werror

all: $(NAME)

$(NAME): $(OBJ)
	ar rcs $(NAME) $?

%.o: %.c
	gcc $(FLAGS) -c $< -o $@ -MD

include $(wildcard $(D_FILES))

clean:
ifeq ($(OS), Windows_NT)
	@del $(OBJ) $(D_FILES)
else
	@rm -f $(OBJ) $(D_FILES)
endif

fclean: clean
ifeq ($(OS),Windows_NT)
	@del $(NAME)
else
	@rm -f $(NAME)
endif

re: fclean all

.PHONY: all clean fclean re bonus
