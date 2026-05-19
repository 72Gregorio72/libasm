#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
#include <stdlib.h>

typedef struct s_list
{
	void *data;
	struct s_list *next;
} t_list;

extern int ft_strlen(char *);
extern char *ft_strcpy(char *, char *);
extern int ft_strcmp(char *, char *);
extern int ft_write(int, const void *, int);
extern int ft_read(int, void *, int);
extern char *ft_strdup(char *);
extern int ft_atoi_base(char *, char *);
extern int ft_list_size(t_list *begin_list);
extern void ft_list_push_front(t_list **begin_list, void *data);

// void read_test() {
// 	int fd = open("file.txt", O_RDWR | O_CREAT, S_IRUSR | S_IWUSR);
// 	char buf[100];
// 	printf(": |%d|\n", ft_read(fd, buf, 100));
// 	printf("errno: |%d|\n", errno);
// 	close(fd);
// 	fd = open("file.txt", O_RDWR | O_CREAT, S_IRUSR | S_IWUSR);
// 	printf(": |%zd|\n", read(fd, buf, 100));
// 	printf("errno: |%d|\n", errno);
// }

// void write_test() {
// 	int fd = open("file.txt", O_RDWR | O_CREAT, S_IRUSR | S_IWUSR);
// 	printf(": |%d|\n", ft_write(6, "ciao", 4));
// 	printf("errno: |%d|\n", errno);
// 	printf(": |%zd|\n", write(6, "ciao", 4));
// 	printf("errno: |%d|\n", errno);
// }

// void strdup_test() {
// 	char *str = ft_strdup("askjdhaskjdh");
// 	printf("|%s|\n", str);
// 	free(str);
// 	str = strdup("askjdhaskjdh");
// 	printf("|%s|\n", str);
// 	free(str);
// }

// void atoi_base_test() {
// 	char *str = "   -1A";
// 	char *base = "0123456789ABCDEF";
// 	int result = ft_atoi_base(str, base);
// 	printf("Result: %d\n", result);
// }

void add_front(t_list **begin_list, void *data) {
	t_list *new_node = malloc(sizeof(t_list));
	if (!new_node)
		return;
	new_node->data = data;
	new_node->next = *begin_list;
	*begin_list = new_node;
}

void print_list(t_list *list) {
	while (list) {
		printf("%s\n", (char *)list->data);
		list = list->next;
	}
}

void list_size_test() {
	t_list *list = NULL;
	add_front(&list, "node 1");
	add_front(&list, "node 2");
	add_front(&list, "node 3");
	print_list(list);
	printf("Size: %d\n", ft_list_size(list));
}

void free_list(t_list *list) {
	while (list) {
		t_list *temp = list;
		list = list->next;
		free(temp);
	}
}

void list_push_front_test() {
	t_list *list = NULL;
	ft_list_push_front(&list, "node 1");
	ft_list_push_front(&list, "node 2");
	ft_list_push_front(&list, "node 3");
	print_list(list);
	free_list(list);
}

int main() {
	list_push_front_test();
    return 0;
}