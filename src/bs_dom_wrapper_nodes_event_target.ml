(* EventTarget is interface, and does not be provided constructor from browser. *)

(* The type interface for functor *)
module type TYPE = sig
  type t
end

(* Make Event_target interface.  *)
module Make(T:TYPE) = struct
  external asEventTarget: T.t -> Dom.eventTarget = "%identity"

  external addEventListener: string -> (Dom.event -> unit) -> unit = "addEventListener" [@@bs.send.pipe:T.t]
  external removeEventListener: string -> (Dom.event -> unit) -> unit = "removeEventListener" [@@bs.send.pipe:T.t]
  external dispatchEvent: Dom.event -> unit = "dispatchEvent" [@@bs.send.pipe:T.t]
end

type t = Dom.eventTarget
include Make(struct type nonrec t = t end)

