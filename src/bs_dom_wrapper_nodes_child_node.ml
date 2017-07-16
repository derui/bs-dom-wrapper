(*
  Declare ChildNode FFI.
  This module provides only functor.
 *)
module type TYPE = sig
  type t
end

module Make(T:TYPE) = struct
  (* methods *)
  external remove: unit = "" [@@bs.send.pipe:T.t]
  external before: 'a Dom.node_like -> unit = "" [@@bs.send.pipe:T.t]
  external after: 'a Dom.node_like -> unit = "" [@@bs.send.pipe:T.t]
  external replaceWith: 'a Dom.node_like -> unit = "" [@@bs.send.pipe:T.t]
end
