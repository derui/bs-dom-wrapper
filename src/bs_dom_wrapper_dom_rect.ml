(* Implement File FFI *)

type t = Dom.domRect

(* properties *)
(* properties that are x and y do not have compatibility on cross browser. *)
external x: t -> int = "" [@@bs.get]
external y: t -> int = "" [@@bs.get]

external width: t -> int = "" [@@bs.get]
external height: t -> int = "" [@@bs.get]
external top: t -> int = "" [@@bs.get]
external right: t -> int = "" [@@bs.get]
external bottom: t -> int = "" [@@bs.get]
external left: t -> int = "" [@@bs.get]

external setX: t -> int -> unit = "" [@@bs.set]
external setY: t -> int -> unit = "" [@@bs.set]
external setWidth: t -> int -> unit = "" [@@bs.set]
external setHeight: t -> int -> unit = "" [@@bs.set]
external setTop: t -> int -> unit = "" [@@bs.set]
external setRight: t -> int -> unit = "" [@@bs.set]
external setBottom: t -> int -> unit = "" [@@bs.set]
external setLeft: t -> int -> unit = "" [@@bs.set]

external make: int -> int -> int -> int -> t = "DOMRect" [@@bs.new]
