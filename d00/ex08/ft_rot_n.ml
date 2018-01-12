(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_rot_n.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/06/15 12:03:19 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/06/15 18:07:50 by byoung-w         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let delta = int_of_char 'z' - int_of_char 'a' + 1

let rec looplower c =
	if c > int_of_char 'z' then
		looplower (c - delta)
	else
		c

let rec loopupper c =
	if c > int_of_char 'Z' then
		loopupper (c - delta)
	else
		c

let is_lower c =
	c >= 'a' && c <= 'z'

let is_upper c =
	c >= 'A' && c <= 'Z'

let rot i c =
	if is_lower c then
		char_of_int (looplower (int_of_char c + i))
	else if is_upper c then
		char_of_int (loopupper (int_of_char c + i))
	else
		c

let ft_rot_n i s =
	String.map (rot i) s

let testone i s =
	Printf.printf "Test rot%-3d \"%s\"=>\"%s\"	\n%!" i s (ft_rot_n i s)

let () =
	testone 0 "";
	testone 0 "NBzlk qnbjr !";
	testone 0 "abcdefghijklmnopqrstuvwxyz";
	testone 0 "0123456789";
	testone 0 "Damned !";
	testone 1 "";
	testone 1 "NBzlk qnbjr !";
	testone 1 "abcdefghijklmnopqrstuvwxyz";
	testone 1 "0123456789";
	testone 1 "Damned !";
	testone 26 "";
	testone 26 "NBzlk qnbjr !";
	testone 26 "abcdefghijklmnopqrstuvwxyz";
	testone 26 "0123456789";
	testone 26 "Damned !";
	testone 42 "";
	testone 42 "NBzlk qnbjr !";
	testone 42 "abcdefghijklmnopqrstuvwxyz";
	testone 42 "0123456789";
	testone 42 "Damned !";
