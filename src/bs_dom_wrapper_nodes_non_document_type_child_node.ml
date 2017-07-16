(*
  Declare NonDocumentChildNode FFI.
  This module provides only functor.
 *)
module type TYPE = sig
  type t
end

module Make(T:TYPE) = struct
  (* properties *)
  external previousElementSibling: T.t -> Dom.element option = "" [@@bs.get] [@@bs.return null_to_opt]
  external nextElementSibling: T.t -> Dom.element option = "" [@@bs.get] [@@bs.return null_to_opt]
end
