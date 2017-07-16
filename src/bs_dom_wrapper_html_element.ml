(* Declare HTMLElement FFI. *)

module type TYPE = sig
  type t
end

module Make(T:TYPE) = struct

  (* properties *)
  external contentEditable: T.t -> string = "" [@@bs.get]
  external setContentEditable: T.t -> string -> unit = "contentEditable" [@@bs.set]
  external isContentEditable: T.t -> bool = "" [@@bs.get]

  external dir: T.t -> string = "" [@@bs.get]
  external setDir: T.t -> string -> unit = "dir" [@@bs.set]
  external draggable: T.t -> bool = "" [@@bs.get]
  external setDraggable: T.t -> bool -> unit = "draggable" [@@bs.set]

  external hidden: T.t -> bool = "" [@@bs.get]
  external setHidden: T.t -> bool -> unit = "hidden" [@@bs.set]
  external lang: T.t -> string = "" [@@bs.get]
  external setLang: T.t -> string -> unit = "lang" [@@bs.set]
  external offsetHeight: T.t -> float = "" [@@bs.get]
  external offsetLeft: T.t -> float = "" [@@bs.get]
  external offsetParent: T.t -> float = "" [@@bs.get]
  external offsetTop: T.t -> float = "" [@@bs.get]
  external offsetWidth: T.t -> float = "" [@@bs.get]

  external spellcheck: T.t -> bool = "" [@@bs.get]
  external setSpellcheck: T.t -> bool -> unit = "spellcheck" [@@bs.set]

  external style: T.t -> Dom.cssStyleDeclaration = "" [@@bs.get]
  external setStyle: T.t -> Dom.cssStyleDeclaration -> unit = "style" [@@bs.set]

  external tabIndex: T.t -> int = "" [@@bs.get]
  external setTabIndex: T.t -> int -> unit = "tagIndex" [@@bs.set]
  external title: T.t -> string = "" [@@bs.get]
  external setTitle: T.t -> string -> unit = "title" [@@bs.set]

  (* methods *)
  external blur: unit = "" [@@bs.send.pipe: T.t]
  external click: unit = "" [@@bs.send.pipe: T.t]
  external focus: unit = "" [@@bs.send.pipe: T.t]
  external forceSpellCheck: unit = "" [@@bs.send.pipe: T.t]

(* not implemented list for HTMLElement
   - dataset
   - contextMenu
   - dropzone
   - item*
   - properties
 *)

end

include Bs_dom_wrapper_nodes_event_target.Make(struct type t = Dom.htmlElement end)
include Bs_dom_wrapper_nodes_node.Make(struct type t = Dom.htmlElement end)
include Bs_dom_wrapper_nodes_element.Make(struct type t = Dom.htmlElement end)
include Make(struct type t = Dom.htmlElement end)
