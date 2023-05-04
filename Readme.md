# Disable Build Where They Stand

Disables placing blocks at places where they would collide with a player (or entity).

## About

Depends on [`modlib`](https://github.com/appgurueu/modlib). Licensed under the MIT License. Written by Lars Mueller aka LMD or appguru(eu).

## Usage

Enable & probably configure it.

## Configuration

Uses the new modlib configuration system.

<!--modlib:conf:2-->
### `entities`

Check for entities

* Type: boolean
* Default: `true`

### `nodes`

Check for nodes

* Type: boolean
* Default: `true`

### `players`

Check for players

* Type: boolean
* Default: `true`

### `search_radius`

Search radius for entities & players

* Type: number
* Default: `10`
* &gt; `0`
* &lt;= `100`

### `test`

Enable debug mode (visualization of boxes)

* Type: boolean
* Default: `false`
<!--modlib:conf-->
