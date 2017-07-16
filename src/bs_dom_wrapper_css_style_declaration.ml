(* Implement File FFI *)

type t = Dom.cssStyleDeclaration

(* Interface for File *)
external cssText: t -> string = "" [@@bs.get]
external setCssText: t -> string -> unit = "cssText" [@@bs.set]
external length: t -> int = "" [@@bs.get]

(* parentRule does not implement that why Dom stdlib does not declare
   CSSRule.
 *)
external getPropertyPriority: string -> string = "" [@@bs.send.pipe:t]
external getPropertyValue: string -> string = "" [@@bs.send.pipe:t]
external item: int -> string = "" [@@bs.send.pipe:t]
external removeProperty: string -> unit = "" [@@bs.send.pipe:t]
external setProperty: string -> string -> string -> unit = "" [@@bs.send.pipe:t]
