(* Declare Document FFI. *)
(* Not implemented all deprecated properties and methods *)
module type TYPE = sig
  type t
end

module Types = Bs_dom_wrapper_nodes_types

module Make(T:TYPE) = struct
  (* properties *)
  external characterSet: T.t -> string = "" [@@bs.get]
  external doctype: T.t -> string = "" [@@bs.get]
  external documentElement: T.t -> Dom.element = "" [@@bs.get]
  external documentURI: T.t -> string = "" [@@bs.get]
  external hidden: T.t -> bool = "" [@@bs.get]
  external implementation: T.t -> Dom.domImplementation = "" [@@bs.get]
  external lastStyleSheetSet: T.t -> string = "" [@@bs.get]
  external preferredStyleSheetSet: T.t -> string = "" [@@bs.get]
  external selectStyleSheetSet: T.t -> string = "" [@@bs.get]
  external setSelectStyleSheetSet: T.t -> string -> unit = "" [@@bs.set]
  external styleSheets: T.t -> Dom.cssStyleSheet array = "" [@@bs.get]
  external styleSheetSets: T.t -> string array = "" [@@bs.get]
  external visibilityState: T.t -> string = "" [@@bs.get]
  let visibilityState t =
    visibilityState t |> Types.Visibility_state.of_string

  external activeElement: T.t -> Dom.element option = "" [@@bs.get] [@@bs.return null_to_opt]
  external body: T.t -> Dom.element = "" [@@bs.get]
  external setBody: T.t -> Dom.element -> unit = "" [@@bs.set]
  external cookie: T.t -> string = "" [@@bs.get]
  external setCookie: T.t -> string -> unit = "" [@@bs.set]
  external defaultView: T.t -> Dom.window = "" [@@bs.get]
  external designMode: T.t -> string = "" [@@bs.get]
  let designMode t = designMode t |> Types.Design_mode.of_string

  external setDesignMode: T.t -> string -> unit = "" [@@bs.set]
  let setDesignMode t v =
    let mode = Types.Design_mode.to_string v in setDesignMode t mode

  external dir: T.t -> string = "" [@@bs.get]
  let dir t = dir t |> Types.Dir.of_string
  external setDir: T.t -> string -> unit = "" [@@bs.set]
  let setDir t v = let v = Types.Dir.to_string v in setDir t v

  external domain: T.t -> string = "" [@@bs.get]
  external setDomain: T.t -> string -> unit = "" [@@bs.set]

  external embeds: T.t -> Dom.htmlCollection = "" [@@bs.get]
  external forms: T.t -> Dom.htmlCollection = "" [@@bs.get]
  external images: T.t -> Dom.htmlCollection = "" [@@bs.get]
  external links: T.t -> Dom.htmlCollection = "" [@@bs.get]

  external head: T.t -> Dom.element option = "" [@@bs.get] [@@bs.return null_to_opt]
  external lastModified: T.t -> string = "" [@@bs.get]
  external location: T.t -> Dom.location = "" [@@bs.get]
  external readyState: T.t -> string = "" [@@bs.get]
  let readyState t = readyState t |> Types.Ready_state.of_string

  external referrer: T.t -> string = "" [@@bs.get]
  external title: T.t -> string = "" [@@bs.get]
  external setTitle: T.t -> string -> unit = "" [@@bs.set]
  external url: T.t -> string = "" [@@bs.get]                                   

  (* methods *)
  external adoptNode: 'a Dom.node_like -> unit = "" [@@bs.send.pipe:T.t]
  external enableStyleSheetsForSet: string -> unit = "" [@@bs.send.pipe:T.t]
  external getElementsByClassName: string -> Dom.htmlCollection = "" [@@bs.send.pipe:T.t]
  external getElementsByTagName: string -> Dom.htmlCollection = "" [@@bs.send.pipe:T.t]
  external getElementsByTagNameNS: string -> string -> Dom.htmlCollection = "" [@@bs.send.pipe:T.t]
  external getElementById: string -> Dom.element option = "" [@@bs.send.pipe:T.t] [@@bs.return null_to_opt]
end

type t = Dom.document
include Bs_dom_wrapper_nodes_event_target.Make(struct type t = Dom.document end)
include Bs_dom_wrapper_nodes_node.Make(struct type t = Dom.document end)
include Bs_dom_wrapper_nodes_parent_node.Make(struct type t = Dom.document end)
include Make(struct type t = Dom.document end)
