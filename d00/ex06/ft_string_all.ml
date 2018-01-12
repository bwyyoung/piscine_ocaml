(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_string_all.ml                                   :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/06/15 10:34:29 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/06/15 11:04:11 by byoung-w         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec callback f s i =
	if i >= 0 then
	begin
		if f (String.get s i) then
		callback (f) s (i - 1)
		else
		false
	end
	else
	true

let ft_string_all f s =
	callback (f) s (String.length s - 1)

let is_lower c =
	c >= 'a' && c <= 'z'
let is_upper c =
	c >= 'A' && c <= 'Z'
let is_digit c =
	c >= '0' && c <= '9'

let testone f fname s =
	Printf.printf "Test with ['%s' * \"%s\"]: %B\n" fname s (ft_string_all f s)

let () =
	testone is_lower "is_lower" "";
	testone is_lower "is_lower" "a";
	testone is_lower "is_lower" "ab";
	testone is_lower "is_lower" "12";
	testone is_lower "is_lower" "YZ";
	testone is_lower "is_lower" "ab1";
	testone is_lower "is_lower" "abcAabc";
	testone is_digit "is_digit" "";
	testone is_digit "is_digit" "a";
	testone is_digit "is_digit" "ab";
	testone is_digit "is_digit" "12";
	testone is_digit "is_digit" "YZ";
	testone is_digit "is_digit" "ab1";
	testone is_digit "is_digit" "abcAabc";
	testone is_upper "is_upper" "";
	testone is_upper "is_upper" "a";
	testone is_upper "is_upper" "ab";
	testone is_upper "is_upper" "12";
	testone is_upper "is_upper" "YZ";
	testone is_upper "is_upper" "ab1";
	testone is_upper "is_upper" "abcAabc"
