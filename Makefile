NAME = libasm.a

SRCS =	SRCS/ft_strlen.s \
		SRCS/ft_strcpy.s \
		SRCS/ft_strcmp.s \
		SRCS/ft_write.s \
		SRCS/ft_read.s \
		SRCS/ft_strdup.s \

SRCS_BONUS =	SRCS_BONUS/ft_atoi_base_bonus.s \
				SRCS_BONUS/ft_list_size.s \
				SRCS_BONUS/ft_list_push_front.s \
				SRCS_BONUS/ft_list_sort.s \
				SRCS_BONUS/ft_list_remove_if.s \

OBJ = $(patsubst SRCS/%.s,OBJS/%.o,$(SRCS))

OBJ_BONUS = $(patsubst SRCS_BONUS/%.s,OBJS_BONUS/%.o,$(SRCS_BONUS))

FLAGS = -f elf64

all: $(NAME)

$(NAME): $(OBJ)
	ar rcs $@ $^

OBJS/%.o: SRCS/%.s
	mkdir -p OBJS
	nasm $(FLAGS) $< -o $@

OBJS_BONUS/%.o: SRCS_BONUS/%.s
	mkdir -p OBJS_BONUS
	nasm $(FLAGS) $< -o $@

clean:
	rm -rf OBJS OBJS_BONUS

fclean: clean
	rm -rf $(NAME)
	rm -rf a.out

re: fclean all

test: re bonus
	cc main.c $(NAME)
	@clear
	./a.out

debug: re bonus
	cc -g main.c $(NAME) -o a.out
	valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes ./a.out

bonus: all $(OBJ_BONUS)
	ar rcs $(NAME) $(OBJ) $(OBJ_BONUS)

.SILENT: all clean fclean re
.PHONY: all clean fclean re