(* HTMLElement wrapper and accessor from bs-webapi-incubator *)
(*
MIT License

Copyright (c) 2017 reasonml-community

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
 *)

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
  external setDraggable: T.t -> Js.boolean -> unit = "draggable" [@@bs.set]

  external hidden: T.t -> bool = "" [@@bs.get]
  external setHidden: T.t -> Js.boolean -> unit = "hidden" [@@bs.set]
  external lang: T.t -> string = "" [@@bs.get]
  external setLang: T.t -> string -> unit = "lang" [@@bs.set]
  external offsetHeight: T.t -> float = "" [@@bs.get]
  external offsetLeft: T.t -> float = "" [@@bs.get]
  external offsetParent: T.t -> float = "" [@@bs.get]
  external offsetTop: T.t -> float = "" [@@bs.get]
  external offsetWidth: T.t -> float = "" [@@bs.get]

  external spellcheck: T.t -> bool = "" [@@bs.get]
  external setSpellcheck: T.t -> Js.boolean -> unit = "spellcheck" [@@bs.set]

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
