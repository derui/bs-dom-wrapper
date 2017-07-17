(* Implement File FFI *)

type t
external t: t = "URL" [@@bs.val]

(* method *)
external createObjectURL: 'a -> string = "" [@@bs.send.pipe:t]
