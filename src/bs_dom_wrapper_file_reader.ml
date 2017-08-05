(* Implement FileReader FFI *)
module Progress_event = Bs_webapi.Dom.ProgressEvent
module File = Bs_dom_wrapper_file

type file_reader
type t = file_reader Dom.eventTarget_like
include Bs_webapi.Dom.EventTarget.Impl(struct type nonrec t = t end)

(* Constructors *)
external create: unit -> t = "FileReader" [@@bs.new]

(* property *)
external result: t -> string = "result" [@@bs.get]

(* method *)
external readAsDataURL: File.t -> unit = "" [@@bs.send.pipe:t]

(* Events *)
external setOnload: t -> (Progress_event.t -> unit) -> unit = "onload" [@@bs.set]
