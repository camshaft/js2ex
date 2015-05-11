js2ex
=====

Just a crazy idea...

## Installation

```sh
$ npm i acorn
$ mix deps.get
```

## Hacking

```
iex(1)> Js2Ex.from_file("./playground.js", [])
{{:module, JS.Playground,
  <<70, 79, 82, 49, 0, 0, 10, 112, 66, 69, 65, 77, 69, 120, 68, 99, 0, 0, 1, 92, 131, 104, 2, 100, 0, 14, 101, 108, 105, 120, 105, 114, 95, 100, 111, 99, 115, 95, 118, 49, 108, 0, 0, 0, 2, 104, ...>>
  }, []}
iex(2)> JS.Playground.hello("Joe")
"Hello, Joe"
```