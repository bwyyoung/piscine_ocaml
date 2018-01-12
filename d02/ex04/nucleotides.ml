(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   nucleotides.ml                                     :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/06/17 18:36:13 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/06/17 18:45:57 by byoung-w         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type phosphate = string
type deoxyribose = string
type nucleobase = A | T | C | G | None
type nucleotide = phosphate * deoxyribose * nucleobase

let generate_nucleotide c: nucleotide =
	match c with
	| 'A'						-> "phosphate", "deoxyribose", A
	| 'T'						-> "phosphate", "deoxyribose", T
	| 'C'						-> "phosphate", "deoxyribose", C
	| 'G'						-> "phosphate", "deoxyribose", G
	| _							-> "phosphate", "deoxyribose", None
