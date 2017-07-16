(* Implement FileReader FFI *)
module Events = Bs_dom_wrapper_events
module File = Bs_dom_wrapper_file

type file_reader
type t = file_reader Dom.eventTarget_like
include Bs_dom_wrapper_nodes_event_target.Make(struct type nonrec t = t end)

(* Constructors *)
external create: unit -> t = "FileReader" [@@bs.new]

(* property *)
external result: t -> string = "result" [@@bs.get]

(* method *)
external readAsDataURL: File.t -> unit = "" [@@bs.send.pipe:t]

(* Events *)
external setOnload: t -> (Events.Progress_event.t -> unit) -> unit = "onload" [@@bs.set]
