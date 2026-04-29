NAME = libasm.a

SRCS =	SRCS/ft_strlen.s \
		SRCS/ft_strcpy.s \
		SRCS/ft_strcmp.s \
		SRCS/ft_write.s \
		SRCS/ft_read.s \
		SRCS/ft_strdup.s \

SRCS_BONUS = 

OBJ = $(patsubst SRCS/%.s,OBJS/%.o,$(SRCS))

OBJ_BONUS = $(patsubst SRCS/%.s,OBJS/%.o,$(SRCS_BONUS))

FLAGS = -f elf64

all: $(NAME)

$(NAME): $(OBJ)
	ar rcs $@ $^

OBJS/%.o: SRCS/%.s
	mkdir -p OBJS
	nasm $(FLAGS) $< -o $@

clean:
	rm -rf OBJS

fclean: clean
	rm -rf $(NAME)
	rm a.out

re: fclean all

test: re
	cc main.c $(NAME)
	@clear
	./a.out

bonus:: all $(OBJ_BONUS)
	ar rcs $(NAME) $(OBJ) $(OBJ_BONUS)

.SILENT: all clean fclean re
.PHONY: all clean fclean re