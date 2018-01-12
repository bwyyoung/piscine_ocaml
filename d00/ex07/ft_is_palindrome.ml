(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_is_palindrome.ml                                :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/06/15 11:27:13 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/06/16 17:37:58 by byoung-w         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec callback s i j =
	if i < j then
	begin
		if String.get s i <> String.get s j then
		false
		else
		callback s (i + 1) (j - 1)
	end
	else
	true

let ft_is_palindrome s =
	callback s 0 (String.length s - 1)

let testone s =
	Printf.printf "Test [%s] = %B\n%!" s (ft_is_palindrome s)

let () =
	testone "";
	testone "a";
	testone "ab";
	testone "aba";
	testone "abab";
	testone "ababa";
	testone "aa";
	testone "abba";
	testone "abbab";
	testone "abbaba";
	testone "abbabba";
