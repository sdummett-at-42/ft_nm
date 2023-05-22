#include "ft_nm.h"

int main(int ac, char **av) {
	if (ac != 2) {
		printf("You must pass an executable, an object file or a library\n");
		return 0;
	}

	int fd = open(av[1], O_RDONLY);
	if (fd == -1) {
		perror(av[1]);
		return 0;
	}

	struct stat sb;

	if (fstat(fd, &sb) == -1) {
		perror("couldnt get file size");
		return 0;
	}
	printf("File size of '%s' is %d bytes\n", av[1], sb.st_size);

	void *f = mmap(NULL, sb.st_size, PROT_READ, MAP_PRIVATE, fd, 0);
	//if (f == -1) {
	//	perror("mmap");
	//	return 0;
	//}

	debug_elf_header(*(Elf64_Ehdr *)(f + 0)) ;
	unsigned int offset = 22040; // 22040 is an arbitray value that match the offset of the 1st entry of shdr in this program compiled
	printf("shoff = %d\n", offset);

	printf("//=====================================//\n");
	for (int i = 0; i < 31; i++) { // 31 is an arbitrary value that match the number of shdr of this program compiled
		printf("[%d]\n", i);
		debug_elf_section(*(Elf64_Shdr *)(f + offset + (i * 64)));
		printf("//=====================================//\n");
	}

	munmap(f, sb.st_size);
	close(fd);
	return 0;
}
