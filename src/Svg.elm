module Svg exposing
  ( Svg, Attribute, text, node, map
  , svg, foreignObject
  , circle, ellipse, image, line, path, polygon, polyline, rect, use
  , animate, animateColor, animateMotion, animateTransform, mpath, set
  , desc, metadata, title
  , a, defs, g, marker, mask, pattern, switch, symbol
  , altGlyph, altGlyphDef, altGlyphItem, glyph, glyphRef, textPath, text_
  , tref, tspan
  , font
  , linearGradient, radialGradient, stop
  , feBlend, feColorMatrix, feComponentTransfer, feComposite
  , feConvolveMatrix, feDiffuseLighting, feDisplacementMap, feFlood, feFuncA
  , feFuncB, feFuncG, feFuncR, feGaussianBlur, feImage, feMerge, feMergeNode
  , feMorphology, feOffset, feSpecularLighting, feTile, feTurbulence
  , feDistantLight, fePointLight, feSpotLight
  , clipPath, colorProfile, cursor, filter, style, view
  )

{-|

# SVG Nodes
@docs Svg, Attribute, text, node, map

# HTML Embedding
@docs svg, foreignObject

# Graphics elements
@docs circle, ellipse, image, line, path, polygon, polyline, rect, use

# Animation elements
@docs animate, animateColor, animateMotion, animateTransform, mpath, set

# Descriptive elements
@docs desc, metadata, title

# Containers
@docs a, defs, g, marker, mask, pattern, switch, symbol

# Text
@docs altGlyph, altGlyphDef, altGlyphItem, glyph, glyphRef, textPath, text_,
  tref, tspan

# Fonts
@docs font

# Gradients
@docs linearGradient, radialGradient, stop

# Filters
@docs feBlend, feColorMatrix, feComponentTransfer, feComposite,
  feConvolveMatrix, feDiffuseLighting, feDisplacementMap, feFlood, feFuncA,
  feFuncB, feFuncG, feFuncR, feGaussianBlur, feImage, feMerge, feMergeNode,
  feMorphology, feOffset, feSpecularLighting, feTile, feTurbulence

# Light source elements
@docs feDistantLight, fePointLight, feSpotLight

# Miscellaneous
@docs clipPath, colorProfile, cursor, filter, style, view
-}


import Elm.Kernel.Svg
import Html
import VirtualDom
import Json.Encode as Json



-- PRIMITIVES


{-| The core building block to create SVG. This library is filled with helper
functions to create these `Svg` values.

This is backed by `VirtualDom.Node` in `evancz/virtual-dom`, but you do not
need to know any details about that to use this library!
-}
type alias Svg msg =
  VirtualDom.Node msg


{-| Set attributes on your `Svg`.
-}
type alias Attribute msg =
  VirtualDom.Attribute msg


{-| Create any SVG node. To create a `<rect>` helper function, you would write:

    rect : List (Attribute msg) -> List (Svg msg) -> Svg msg
    rect attributes children =
        node "rect" attributes children

You should always be able to use the helper functions already defined in this
library though!
-}
node : String -> List (Attribute msg) -> List (Svg msg) -> Svg msg
node =
  VirtualDom.nodeNS "http://www.w3.org/2000/svg"


{-| A simple text node, no tags at all.

Warning: not to be confused with `text_` which produces the SVG `<text>` tag!
-}
text : String -> Svg msg
text =
  VirtualDom.text


{-| Transform the messages produced by some `Svg`.
-}
map : (a -> msg) -> Svg a -> Svg msg
map =
  VirtualDom.map



-- HELPERS


trustedNode : String -> List (Attribute msg) -> List (Svg msg) -> Svg msg
trustedNode =
  Elm.Kernel.Svg.nodeNS "http://www.w3.org/2000/svg"



-- TAGS


{-| The root `<svg>` node for any SVG scene. This example shows a scene
containing a rounded rectangle:

    import Html
    import Svg exposing (..)
    import Svg.Attributes exposing (..)

    roundRect : Html.Html msg
    roundRect =
        svg
          [ width "120", height "120", viewBox "0 0 120 120" ]
          [ rect [ x "10", y "10", width "100", height "100", rx "15", ry "15" ] [] ]
-}
svg : List (Html.Attribute msg) -> List (Svg msg) -> Html.Html msg
svg =
  trustedNode "svg"


{-|-}
foreignObject : List (Attribute msg) -> List (Html.Html msg) -> Svg msg
foreignObject =
  trustedNode "foreignObject"


-- Animation elements


{-|-}
animate : List (Attribute msg) -> List (Svg msg) -> Svg msg
animate =
  trustedNode "animate"


{-|-}
animateColor : List (Attribute msg) -> List (Svg msg) -> Svg msg
animateColor =
  trustedNode "animateColor"


{-|-}
animateMotion : List (Attribute msg) -> List (Svg msg) -> Svg msg
animateMotion =
  trustedNode "animateMotion"


{-|-}
animateTransform : List (Attribute msg) -> List (Svg msg) -> Svg msg
animateTransform =
  trustedNode "animateTransform"


{-|-}
mpath : List (Attribute msg) -> List (Svg msg) -> Svg msg
mpath =
  trustedNode "mpath"


{-|-}
set : List (Attribute msg) -> List (Svg msg) -> Svg msg
set =
  trustedNode "set"



-- Container elements


{-| The SVG Anchor Element defines a hyperlink.
-}
a : List (Attribute msg) -> List (Svg msg) -> Svg msg
a =
  trustedNode "a"


{-|-}
defs : List (Attribute msg) -> List (Svg msg) -> Svg msg
defs =
  trustedNode "defs"


{-|-}
g : List (Attribute msg) -> List (Svg msg) -> Svg msg
g =
  trustedNode "g"


{-|-}
marker : List (Attribute msg) -> List (Svg msg) -> Svg msg
marker =
  trustedNode "marker"


{-|-}
mask : List (Attribute msg) -> List (Svg msg) -> Svg msg
mask =
  trustedNode "mask"


{-|-}
pattern : List (Attribute msg) -> List (Svg msg) -> Svg msg
pattern =
  trustedNode "pattern"


{-|-}
switch : List (Attribute msg) -> List (Svg msg) -> Svg msg
switch =
  trustedNode "switch"


{-|-}
symbol : List (Attribute msg) -> List (Svg msg) -> Svg msg
symbol =
  trustedNode "symbol"



-- Descriptive elements


{-|-}
desc : List (Attribute msg) -> List (Svg msg) -> Svg msg
desc =
  trustedNode "desc"


{-|-}
metadata : List (Attribute msg) -> List (Svg msg) -> Svg msg
metadata =
  trustedNode "metadata"


{-|-}
title : List (Attribute msg) -> List (Svg msg) -> Svg msg
title =
  trustedNode "title"



-- Filter primitive elements


{-|-}
feBlend : List (Attribute msg) -> List (Svg msg) -> Svg msg
feBlend =
  trustedNode "feBlend"


{-|-}
feColorMatrix : List (Attribute msg) -> List (Svg msg) -> Svg msg
feColorMatrix =
  trustedNode "feColorMatrix"


{-|-}
feComponentTransfer : List (Attribute msg) -> List (Svg msg) -> Svg msg
feComponentTransfer =
  trustedNode "feComponentTransfer"


{-|-}
feComposite : List (Attribute msg) -> List (Svg msg) -> Svg msg
feComposite =
  trustedNode "feComposite"


{-|-}
feConvolveMatrix : List (Attribute msg) -> List (Svg msg) -> Svg msg
feConvolveMatrix =
  trustedNode "feConvolveMatrix"


{-|-}
feDiffuseLighting : List (Attribute msg) -> List (Svg msg) -> Svg msg
feDiffuseLighting =
  trustedNode "feDiffuseLighting"


{-|-}
feDisplacementMap : List (Attribute msg) -> List (Svg msg) -> Svg msg
feDisplacementMap =
  trustedNode "feDisplacementMap"


{-|-}
feFlood : List (Attribute msg) -> List (Svg msg) -> Svg msg
feFlood =
  trustedNode "feFlood"


{-|-}
feFuncA : List (Attribute msg) -> List (Svg msg) -> Svg msg
feFuncA =
  trustedNode "feFuncA"


{-|-}
feFuncB : List (Attribute msg) -> List (Svg msg) -> Svg msg
feFuncB =
  trustedNode "feFuncB"


{-|-}
feFuncG : List (Attribute msg) -> List (Svg msg) -> Svg msg
feFuncG =
  trustedNode "feFuncG"


{-|-}
feFuncR : List (Attribute msg) -> List (Svg msg) -> Svg msg
feFuncR =
  trustedNode "feFuncR"


{-|-}
feGaussianBlur : List (Attribute msg) -> List (Svg msg) -> Svg msg
feGaussianBlur =
  trustedNode "feGaussianBlur"


{-|-}
feImage : List (Attribute msg) -> List (Svg msg) -> Svg msg
feImage =
  trustedNode "feImage"


{-|-}
feMerge : List (Attribute msg) -> List (Svg msg) -> Svg msg
feMerge =
  trustedNode "feMerge"


{-|-}
feMergeNode : List (Attribute msg) -> List (Svg msg) -> Svg msg
feMergeNode =
  trustedNode "feMergeNode"


{-|-}
feMorphology : List (Attribute msg) -> List (Svg msg) -> Svg msg
feMorphology =
  trustedNode "feMorphology"


{-|-}
feOffset : List (Attribute msg) -> List (Svg msg) -> Svg msg
feOffset =
  trustedNode "feOffset"


{-|-}
feSpecularLighting : List (Attribute msg) -> List (Svg msg) -> Svg msg
feSpecularLighting =
  trustedNode "feSpecularLighting"


{-|-}
feTile : List (Attribute msg) -> List (Svg msg) -> Svg msg
feTile =
  trustedNode "feTile"


{-|-}
feTurbulence : List (Attribute msg) -> List (Svg msg) -> Svg msg
feTurbulence =
  trustedNode "feTurbulence"



-- Font elements


{-|-}
font : List (Attribute msg) -> List (Svg msg) -> Svg msg
font =
  trustedNode "font"



-- Gradient elements


{-|-}
linearGradient : List (Attribute msg) -> List (Svg msg) -> Svg msg
linearGradient =
  trustedNode "linearGradient"


{-|-}
radialGradient : List (Attribute msg) -> List (Svg msg) -> Svg msg
radialGradient =
  trustedNode "radialGradient"


{-|-}
stop : List (Attribute msg) -> List (Svg msg) -> Svg msg
stop =
  trustedNode "stop"



-- Graphics elements


{-| The circle element is an SVG basic shape, used to create circles based on
a center point and a radius.

    circle [ cx "60", cy "60", r "50" ] []
-}
circle : List (Attribute msg) -> List (Svg msg) -> Svg msg
circle =
  trustedNode "circle"


{-|-}
ellipse : List (Attribute msg) -> List (Svg msg) -> Svg msg
ellipse =
  trustedNode "ellipse"


{-|-}
image : List (Attribute msg) -> List (Svg msg) -> Svg msg
image =
  trustedNode "image"


{-|-}
line : List (Attribute msg) -> List (Svg msg) -> Svg msg
line =
  trustedNode "line"


{-|-}
path : List (Attribute msg) -> List (Svg msg) -> Svg msg
path =
  trustedNode "path"


{-|-}
polygon : List (Attribute msg) -> List (Svg msg) -> Svg msg
polygon =
  trustedNode "polygon"


{-| The polyline element is an SVG basic shape, used to create a series of
straight lines connecting several points. Typically a polyline is used to
create open shapes.

    polyline [ fill "none", stroke "black", points "20,100 40,60 70,80 100,20" ] []
-}
polyline : List (Attribute msg) -> List (Svg msg) -> Svg msg
polyline =
  trustedNode "polyline"


{-|-}
rect : List (Attribute msg) -> List (Svg msg) -> Svg msg
rect =
  trustedNode "rect"


{-|-}
use : List (Attribute msg) -> List (Svg msg) -> Svg msg
use =
  trustedNode "use"



-- Light source elements


{-|-}
feDistantLight : List (Attribute msg) -> List (Svg msg) -> Svg msg
feDistantLight =
  trustedNode "feDistantLight"


{-|-}
fePointLight : List (Attribute msg) -> List (Svg msg) -> Svg msg
fePointLight =
  trustedNode "fePointLight"


{-|-}
feSpotLight : List (Attribute msg) -> List (Svg msg) -> Svg msg
feSpotLight =
  trustedNode "feSpotLight"


-- Text content elements


{-|-}
altGlyph : List (Attribute msg) -> List (Svg msg) -> Svg msg
altGlyph =
  trustedNode "altGlyph"


{-|-}
altGlyphDef : List (Attribute msg) -> List (Svg msg) -> Svg msg
altGlyphDef =
  trustedNode "altGlyphDef"


{-|-}
altGlyphItem : List (Attribute msg) -> List (Svg msg) -> Svg msg
altGlyphItem =
  trustedNode "altGlyphItem"


{-|-}
glyph : List (Attribute msg) -> List (Svg msg) -> Svg msg
glyph =
  trustedNode "glyph"


{-|-}
glyphRef : List (Attribute msg) -> List (Svg msg) -> Svg msg
glyphRef =
  trustedNode "glyphRef"


{-|-}
textPath : List (Attribute msg) -> List (Svg msg) -> Svg msg
textPath =
  trustedNode "textPath"


{-|-}
text_ : List (Attribute msg) -> List (Svg msg) -> Svg msg
text_ =
  trustedNode "text"


{-|-}
tref : List (Attribute msg) -> List (Svg msg) -> Svg msg
tref =
  trustedNode "tref"


{-|-}
tspan : List (Attribute msg) -> List (Svg msg) -> Svg msg
tspan =
  trustedNode "tspan"


-- Uncategorized elements


{-|-}
clipPath : List (Attribute msg) -> List (Svg msg) -> Svg msg
clipPath =
  trustedNode "clipPath"


{-|-}
colorProfile : List (Attribute msg) -> List (Svg msg) -> Svg msg
colorProfile =
  trustedNode "colorProfile"


{-|-}
cursor : List (Attribute msg) -> List (Svg msg) -> Svg msg
cursor =
  trustedNode "cursor"


{-|-}
filter : List (Attribute msg) -> List (Svg msg) -> Svg msg
filter =
  trustedNode "filter"


{-|-}
style : List (Attribute msg) -> List (Svg msg) -> Svg msg
style =
  trustedNode "style"


{-|-}
view : List (Attribute msg) -> List (Svg msg) -> Svg msg
view =
  trustedNode "view"


