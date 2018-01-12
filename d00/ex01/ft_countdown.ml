(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_countdown.ml                                    :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/06/15 09:19:27 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/06/15 15:27:23 by byoung-w         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec down i =
  if i >= 0 then
	begin
	  print_int i;
	  print_char '\n';
	  down (i - 1)
	end

let rec ft_countdown i =
	if i <= 0 then
		down 0
	else
		down i

let test_function i =
	ft_countdown i

let () =
	test_function (-42);
	test_function (-1);
	test_function 0;
	test_function 1;
	test_function 42
