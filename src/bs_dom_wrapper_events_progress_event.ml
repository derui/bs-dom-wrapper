type base = Dom._progressEvent
type t = Dom.progressEvent

include Bs_dom_wrapper_events_event.Make(struct type nonrec t = t end)

(* define constructor for this event *)
external make: string -> t = "ProgressEvent" [@@bs.new]
external make_with_option: string -> 'a Js.t -> t = "ProgressEvent" [@@bs.new]

(* Define getter for this event *)
external lengthComputable: t -> bool = "" [@@bs.get]
external loaded: t -> bool = "" [@@bs.get]
external total: t -> int = "" [@@bs.get]
