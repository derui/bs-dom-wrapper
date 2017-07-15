(* Implement File FFI *)

type t
include Bs_dom_wrapper_blob.Make(struct type nonrec t = t end)

(* Interface for File *)
external name: t -> string = "" [@@bs.get]
