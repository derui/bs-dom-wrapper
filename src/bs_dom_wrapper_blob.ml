module type TYPE = sig
  type t
end

(* Functor to implement Blob object.
   Currently this functor does not implement all events declare on Blob object.
 *)
module Make(T:TYPE) = struct

  (* Constructors *)
  external make: 'a Js.t -> T.t = "Blob" [@@bs.new]
  external makeWithOption: 'a Js.t -> 'a Js.t -> T.t = "Blob" [@@bs.new]

  (* properties *)
  external size: T.t -> int = "" [@@bs.get]
  external _type: T.t -> string = "" [@@bs.get]

  (* method *)
  external slice: T.t = "" [@@bs.send.pipe:T.t]
  external sliceWithStart: int -> T.t = "" [@@bs.send.pipe:T.t]
  external sliceRange: int -> int -> T.t = "" [@@bs.send.pipe:T.t]
  external slideWithContentType: int -> int -> string -> T.t = "" [@@bs.send.pipe:T.t]

end

type t
include Make(struct type nonrec t = t end)
