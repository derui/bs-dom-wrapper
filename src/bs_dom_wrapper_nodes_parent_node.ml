(* Declare ParentNode FFI. *)
module type TYPE = sig
  type t
end

module Make(T:TYPE) = struct
  (* properties *)
  external children: T.t -> Dom.htmlCollection = "" [@@bs.get]
  external firstElementChild: T.t -> Dom.element option = "" [@@bs.get] [@@bs.return null_to_opt]
  external lastElementChild: T.t -> Dom.element option = "" [@@bs.get] [@@bs.return null_to_opt]
  external childElementCount: T.t -> int = "" [@@bs.get]

  (* methods *)
  external querySelector: string -> Dom.element option = "" [@@bs.send.pipe:T.t] [@@bs.return null_to_opt]
  external querySelectorAll: string -> Dom.htmlCollection = "" [@@bs.send.pipe:T.t] 
end

(* This module declares only functor. *)
