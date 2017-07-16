
module Event_type = struct
  type t =
    DOMContentLoaded
  | Submit

  let to_string = function
    | DOMContentLoaded -> "DOMContentLoaded"
    | Submit -> "submit"
end
