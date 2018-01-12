(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_power.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/06/15 09:37:46 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/06/15 09:51:31 by byoung-w         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec callback a b acc =
	if b <= 0 then
	acc
	else
	callback a (b - 1) (acc * a)

let ft_power a b =
	callback a b 1

let testone a b =
	Printf.printf "Test with [%d^%d] = %d\n" a b (ft_power a b)

let () =
	testone 0 1;
	testone 0 2;
	testone 0 3;
	testone 1 0;
	testone 1 1;
	testone 1 2;
	testone 1 3;
	testone 2 0;
	testone 2 1;
	testone 2 2;
	testone 2 3;
	testone 3 0;
	testone 3 1;
	testone 3 2;
	testone 3 3;
	testone 4 0;
	testone 4 1;
	testone 4 2;
	testone 4 3
