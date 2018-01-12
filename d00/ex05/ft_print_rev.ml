(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_print_rev.ml                                    :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/06/15 10:19:45 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/06/15 10:32:31 by byoung-w         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec callback s i =
	if i >= 0 then
	begin
		print_char (String.get s i);
		callback s (i - 1)
	end

let ft_print_rev s =
	callback s (String.length s - 1);
	print_char '\n'

let testone s =
	ft_print_rev s

let () =
	testone "";
	testone "a";
	testone "aA";
	testone "abc";
	testone "hello world";
	testone "where is Brian"
