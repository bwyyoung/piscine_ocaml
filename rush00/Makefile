# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/09/20 11:00:05 by byoung-w          #+#    #+#              #
#    Updated: 2017/09/20 12:00:10 by byoung-w         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME := tic-tac-tic-tac-toe

DIR_OBJ := bin
SRCS := \
		Tools.ml Cellmaster.ml Player.ml \
		Board.ml MainBoard.ml \
		Graphics.ml AI.ml \
		Game.ml main.ml
DIR_SRC := ./

OBJ_BYT := $(addprefix $(DIR_OBJ)/,$(SRCS:.ml=.cmo))
OBJ_OPT := $(addprefix $(DIR_OBJ)/,$(SRCS:.ml=.cmx))
OBJ_INC := $(addprefix $(DIR_OBJ)/,$(SRCS:.ml=.cmi))


FLAGS := -I $(DIR_OBJ) -I ~/.opam/system/lib/curses
LIBS := -cclib -L$$HOME/.opam/system/lib/curses

all: $(DIR_OBJ) $(NAME)

$(NAME): $(DIR_OBJ)/$(NAME).byt $(DIR_OBJ)/$(NAME).opt
	@ln -sf $(DIR_OBJ)/$(NAME).opt $@
	@echo "Done"

byt: $(DIR_OBJ)/$(NAME).byt
$(DIR_OBJ)/$(NAME).byt: $(OBJ_INC) $(OBJ_BYT)
	@ocamlc $(LIBS) -g -o $@ ~/.opam/system/lib/curses/curses.cma $(OBJ_BYT)
	@ln -sf $(DIR_OBJ)/$(NAME).byt $(NAME)
	@echo "$@"

opt: $(DIR_OBJ)/$(NAME).opt
$(DIR_OBJ)/$(NAME).opt: $(OBJ_INC) $(OBJ_OPT)
	@ocamlopt $(LIBS) -o $@ ~/.opam/system/lib/curses/curses.cmxa $(OBJ_OPT)
	@ln -sf $(DIR_OBJ)/$(NAME).opt $(NAME)
	@echo "$@"

.depend: Makefile
	@ocamldep -I $(DIR_SRC) $(addprefix $(DIR_SRC)/,$(SRCS)) | sed -E 's/$(DIR_SRC)/$(DIR_OBJ)/g' > .depend

$(OBJ_BYT): $(DIR_OBJ)/%.cmo: $(DIR_SRC)/%.ml
	@ocamlc -g $(FLAGS) -o $@ -c $<
	@echo "$<"

$(OBJ_OPT): $(DIR_OBJ)/%.cmx: $(DIR_SRC)/%.ml
	@ocamlopt $(FLAGS) -o $@ -c $<
	@echo "$<"

$(OBJ_INC): $(DIR_OBJ)/%.cmi: $(DIR_SRC)/%.mli
	@ocamlopt -I $(DIR_OBJ) -o $@ -c $<
	@echo "$<"

$(DIR_OBJ):
	@mkdir -p $@

clean:
	@rm -f $(OBJ_BYT) $(OBJ_OPT) $(OBJ_INC)

fclean: clean
	@rm -f $(NAME) $(DIR_OBJ)/$(NAME).opt $(DIR_OBJ)/$(NAME).byt

re: fclean all

.PHONY: all clean fclean re

-include .depend
