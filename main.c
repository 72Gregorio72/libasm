#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
#include <stdlib.h>

extern int ft_strlen(char *);
extern char *ft_strcpy(char *, char *);
extern int ft_strcmp(char *, char *);
extern int ft_write(int, const void *, int);
extern int ft_read(int, void *, int);
extern char *ft_strdup(char *);
extern int ft_atoi_base(char *, char *);

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

int main() {
	printf("|%d|\n", ft_atoi_base("---101010", "0123456789"));
    return 0;
}