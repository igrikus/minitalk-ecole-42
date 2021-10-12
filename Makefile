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

CC = gcc
CFLAGS = -Wall -Wextra -Werror -g

#---------------------------RULES-----------------------------

all: $(CLIENT) $(SERVER)

#-------------CLIENT RULES-------------
$(CLIENT): $(CLIENT_OBJ)
	$(CC) -o $(CLIENT) $(CLIENT_OBJ)

$(CLIENT_OBJ): $(OBJ_DIR)%.o: $(SRC_DIR)%.c $(HEADER)
	$(CC) $(CFLAGS) -c -I $(HEADER) -o $@ $<


#-------------SERVER RULES-------------
$(SERVER): $(SERVER_OBJ)
	$(CC) -o $(SERVER) $(SERVER_OBJ)

$(SERVER_OBJ): $(OBJ_DIR)%.o: $(SRC_DIR)%.c $(HEADER)
	$(CC) $(CFLAGS) -c -I $(HEADER) -o $@ $<


#-------------GENERAL RULES-------------
clean:
ifeq ($(OS),Windows_NT)
	@del $(subst /,\,$(CLIENT_OBJ))
	@del $(subst /,\,$(SERVER_OBJ))
else
	@rm -f $(CLIENT_OBJ) $(SERVER_OBJ)
endif

fclean: clean
ifeq ($(OS),Windows_NT)
	@del $(CLIENT).exe $(SERVER).exe
else
	@rm -f $(CLIENT) $(SERVER)
endif

re: fclean all

.PHONY: all clean fclean re
