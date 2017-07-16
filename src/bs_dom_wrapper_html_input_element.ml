
module Types = Bs_dom_wrapper_html_types

type input
type t = input Dom.htmlElement_like

include Bs_dom_wrapper_nodes_event_target.Make(struct type nonrec t = t end)
include Bs_dom_wrapper_nodes_node.Make(struct type nonrec t = t end)
include Bs_dom_wrapper_nodes_element.Make(struct type nonrec t = t end)
include Bs_dom_wrapper_html_element.Make(struct type nonrec t = t end)

(* properties *)
external name: t -> string = "" [@@bs.get]
external setName: t -> string -> unit = "name" [@@bs.set]
external _type: t -> string = "" [@@bs.get]
let _type t = _type t |> Types.Input_type.of_string

external setType: t -> string -> unit = "type" [@@bs.set]
let setType t v = let _type = Types.Input_type.to_string v in setType t _type

external disabled: t -> bool = "" [@@bs.get]
external setDisabled: t -> Js.boolean -> unit = "disabled" [@@bs.set]

external autofocus: t -> bool = "" [@@bs.get]
external setAutofocus: t -> Js.boolean -> unit = "autofocus" [@@bs.set]
external required: t -> bool = "" [@@bs.get]
external setRequired: t -> Js.boolean -> unit = "required" [@@bs.set]

external value: t -> string = "" [@@bs.get]
external setValue: t -> string -> unit = "value" [@@bs.set]

(* properties that apply only to elements of type "checkbox" or "radio" *)
external checked: t -> bool = "" [@@bs.get]
external setChecked: t -> Js.boolean -> unit = "checked" [@@bs.set]
external defaultChecked: t -> bool = "" [@@bs.get]
external setDefaultChecked: t -> Js.boolean -> unit = "defaultChecked" [@@bs.set]
external indeterminate: t -> bool = "" [@@bs.get]
external setIndeterminate: t -> Js.boolean -> unit = "indeterminate" [@@bs.set]

(* not yet categorized *)
external multiple: t -> bool = "" [@@bs.get]
external setMultiple: t -> Js.boolean -> unit = "multiple" [@@bs.set]
external files: t -> Bs_dom_wrapper_file.t array = "" [@@bs.get]
