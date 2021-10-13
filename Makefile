#-------------------------VARIABLES---------------------------
CLIENT = client
SERVER = server

SRC_DIR = src/

CLIENT_FILE = client.c
SERVER_FILE = server.c

OBJ_DIR = obj/

CLIENT_OBJ_FILE = $(patsubst %.c,%.o,$(CLIENT_FILE))
CLIENT_OBJ = $(addprefix $(OBJ_DIR), $(CLIENT_OBJ_FILE))

SERVER_OBJ_FILE = $(patsubst %.c,%.o,$(SERVER_FILE))
SERVER_OBJ = $(addprefix $(OBJ_DIR), $(SERVER_OBJ_FILE))

HEADER = includes/minitalk.h

LIBFT_DIR = libft

CC = gcc
CFLAGS = -Wall -Wextra -Werror -g

#---------------------------RULES-----------------------------

all: $(CLIENT) $(SERVER)

#-------------CLIENT RULES-------------
$(CLIENT): $(CLIENT_OBJ)
	@$(MAKE) -C $(LIBFT_DIR)
	$(CC) -o $(CLIENT) $(CLIENT_OBJ) -L $(LIBFT_DIR) -lft

$(CLIENT_OBJ): $(OBJ_DIR)%.o: $(SRC_DIR)%.c $(HEADER)
	$(CC) $(CFLAGS) -c -I $(HEADER) -o $@ $<


#-------------SERVER RULES-------------
$(SERVER): $(SERVER_OBJ)
	@$(MAKE) -C $(LIBFT_DIR)
	$(CC) -o $(SERVER) $(SERVER_OBJ) -L $(LIBFT_DIR) -lft

$(SERVER_OBJ): $(OBJ_DIR)%.o: $(SRC_DIR)%.c $(HEADER)
	$(CC) $(CFLAGS) -c -I $(HEADER) -o $@ $<


#-------------GENERAL RULES-------------
clean:
	@$(MAKE) clean -C $(LIBFT_DIR)
ifeq ($(OS),Windows_NT)
	@del $(subst /,\,$(CLIENT_OBJ))
	@del $(subst /,\,$(SERVER_OBJ))
else
	@rm -f $(CLIENT_OBJ) $(SERVER_OBJ)
endif

fclean: clean
	@$(MAKE) fclean -C libft
ifeq ($(OS),Windows_NT)
	@del $(CLIENT).exe $(SERVER).exe
else
	@rm -f $(CLIENT) $(SERVER)
endif

re: fclean all

.PHONY: all clean fclean re
