## Converts points on linear graph [such as (-5.6, 60.5)] to pixels on screen
#                                                      
#  Made by Earl Kennedy                               
#  https://github.com/Mnenmenth                        

from math import round
type
    Coordinate* = ref object of RootObj
        ## Coordinate. Used for units in graph
        x*: float
        y*: float

proc newCoordinate*(x, y: float): Coordinate =
    ## Creates new coordinate using x and y
    Coordinate(x: x, y: y)

proc newCoordinate*(t: tuple[x: float, y: float]): Coordinate =
    ## Creates new coordinate using tuple
    newCoordinate(t.x, t.y)

method astuple*(c: Coordinate): tuple[x: float, y: float] {.base.} =
    ## Returns coordinate as tuple
    (c.x, c.y)

method `+`*(c, c1: Coordinate): Coordinate {.base.} =
    ## Returns new coordinate containing addition
    newCoordinate(c.x + c1.x, c.y + c1.y)

method `+=`*(c, c1: Coordinate) {.base.} =
    ## Adds coordinates and modifies first coordinate
    c.x += c1.x
    c.y += c1.y

method `-`*(c, c1: Coordinate): Coordinate {.base.} =
    ## Returns new coordinate containing subtraction
    newCoordinate(c.x - c1.x, c.y - c1.y)

method `-=`*(c, c1: Coordinate) {.base.} =
    ## Subtracts coordinates and modifies first coordinate
    c.x -= c1.x
    c.y -= c1.y

method `*`*(c, c1: Coordinate): Coordinate {.base.} =
    ## Returns new coordinate containing multiplication
    newCoordinate(c.x * c1.x, c.y * c1.y)

method `*=`*(c, c1: Coordinate) {.base.} =
    ## Multiples coordinates and modifies first coordinate
    c.x *= c1.x
    c.y *= c1.y

method `/`*(c, c1: Coordinate): Coordinate {.base.} =
    ## Returns new coordinate containing division
    newCoordinate(c.x / c1.x, c.y / c1.y)

method `/=`*(c, c1: Coordinate) {.base.} =
    ## Divides coordinates and modifies first coordinate
    c.x /= c1.x
    c.y /= c1.y

type
    Point* = ref object of RootObj
        ## Point. Used for pixels in graph
        x*: int
        y*: int

proc newPoint*(x, y: int): Point =
    ## Creates new point using x and y
    Point(x: x, y: y)

proc newPoint*(t: tuple[x: int, y: int]): Point =
    ## Creates new point using tuple
    newPoint(t.x, t.y)

method astuple*(p: Point): tuple[x: int, y: int] {.base.} =
    ## Returns point as tuple
    (p.x, p.y)

method `+`*(p, p1: Point): Point {.base.} =
    ## Returns new point containing addition
    newPoint(p.x + p1.x, p.y + p1.y)

method `+=`*(p, p1: Point) {.base.} =
    ## Adds points and modifies first point
    p.x += p1.x
    p.y += p1.y

method `-`*(p, p1: Point): Point {.base.} =
    ## Returns new point containing subtraction
    newPoint(p.x - p1.x, p.y - p1.y)

method `-=`*(p, p1: Point) {.base.} =
    ## Subtracts points and modifies first point
    p.x -= p1.x
    p.y -= p1.y

method `*`*(p, p1: Point): Point {.base.} =
    ## Returns new point containing multiplication
    newPoint(p.x * p1.x, p.y * p1.y)

method `*=`*(p, p1: Point) {.base.} =
    ## Multiplies points and modifies first point
    p.x *= p1.x
    p.y *= p1.y

method `/`*(p, p1: Point): Point {.base.} =
    ## Returns new point containing the division.
    ## Warning! Numbers may be inaccurate due to rounding and integer conversion
    newPoint(round(p.x / p1.x).int, round(p.y / p1.y).int)

method `/=`*(p, p1: Point) {.base.} =
    ## Divides two points and modifies first point
    ## Warning! Numbers may be inaccurate due to rounding and integer conversion
    p.x = round(p.x / p1.x).int
    p.y = round(p.y / p1.y).int

type
    Dimension* = ref object of RootObj
        ## Dimension. Used for parent width and height in graph
        width*: int
        height*: int

proc newDimension*(width, height: int): Dimension =
    ## Creates new dimension using width and height
    Dimension(width: width, height: height)

proc newDimension*(t: tuple[width: int, height: int]): Dimension =
    ## Creates new dimension using tuple
    newDimension(t.width, t.height)

method astuple*(d: Dimension): tuple[width: int, height: int] {.base.} =
    ## Returns dimension as tuple
    (d.width, d.height)

method `+`*(d, d1: Dimension): Dimension {.base.} =
    ## Returns new Dimension containing addition
    newDimension(d.width + d1.width, d.height + d1.height)

method `+=`*(d, d1: Dimension) {.base.} =
    ## Adds Dimensions and modifies first Dimension
    d.width += d1.width
    d.height += d1.height

method `-`*(d, d1: Dimension): Dimension {.base.} =
    ## Returns new Dimension containing subtraction
    newDimension(d.width - d1.width, d.height - d1.height)

method `-=`*(d, d1: Dimension) {.base.} =
    ## Subtracts Dimensions and modifies first Dimension
    d.width -= d1.width
    d.height -= d1.height

method `*`*(d, d1: Dimension): Dimension {.base.} =
    ## Returns new Dimension containing multidlication
    newDimension(d.width * d1.width, d.height * d1.height)

method `*=`*(d, d1: Dimension) {.base.} =
    ## Multidlies Dimensions and modifies first Dimension
    d.width *= d1.width
    d.height *= d1.height

method `/`*(d, d1: Dimension): Dimension {.base.} =
    ## Returns new Dimension containing the division.
    ## Warning! Numbers may be inaccurate due to rounding and integer conversion
    newDimension(round(d.width / d1.width).int, round(d.height / d1.height).int)

method `/=`*(d, d1: Dimension) {.base.} =
    ## Divides two Dimensions and modifies first Dimension
    ## Warning! Numbers may be inaccurate due to rounding and integer conversion
    d.width = round(d.width / d1.width).int
    d.height = round(d.height / d1.height).int

type
    Graph* = ref object of RootObj
        ## Graph. Used for converting coordinate units to pixel points and vice versa
        parentDim*: Dimension
        xmax*: int
        xmin*: int
        ymax*: int
        ymin*: int

proc newGraph*(parentDim: Dimension, xmax, xmin, ymax, ymin: int): Graph =
    ## Creates new graph
    Graph(parentDim: parentDim, xmax: xmax, xmin: xmin, ymax: ymax, ymin: ymin)

method xunits(graph: Graph): float {.base.} =
    ## The amount of integers on the x axis
    float((if graph.xmax < 0: -graph.xmax else: graph.xmax) + (if graph.xmin < 0: -graph.xmin else: graph.xmin))

method xtick(graph: Graph): float {.base.} =
    ## The amount of pixels between each integer on x axis
    float(graph.parentDim.width)/graph.xunits()

method yunits(graph: Graph): float {.base.} =
    ## The amount of integers on y axis
    float((if graph.ymax < 0: -graph.ymax else: graph.ymax) + (if graph.ymin < 0: -graph.ymin else: graph.ymin))

method ytick(graph: Graph): float {.base.} =
    ## The amount of pixels between each integer on y axis
    float(graph.parentDim.height)/graph.yunits()

method coordinateToPixelPoint*(g: Graph, c: Coordinate): Point {.base.} =
    ## Converts coordinate unit point to pixel point
    Point(
        x: int(round(c.x + float(if g.xmin < 0: -g.xmin else: g.xmin)) * g.xtick()), 
        y: int(round(-c.y + float(if g.ymin < 0: -g.ymin else: g.ymin)) * g.ytick())
        )

method c2p*(g: Graph, c: Coordinate): Point {.base.} = 
    ## Alias for coordinateToPixelPoint
    g.coordinateToPixelPoint(c)

method pixelPointToCoordinate*(g: Graph, p: Point): Coordinate {.base.} =
    ## Converts pixel point to coordinate unit point
    Coordinate(
        x: float(p.x) / g.xtick() - float(if g.xmin < 0: -g.xmin else: g.xmin),
        y: float(p.y) / g.ytick() - float(if g.ymin < 0: -g.ymin else: g.ymin)
    )

method p2c*(g: Graph, p: Point): Coordinate {.base.} =
    ## Alias for pixelPointToCoordinate
    g.pixelPointToCoordinate(p)
