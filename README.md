# mynumber.el

Validate [マイナンバー](http://law.e-gov.go.jp/announce/H26SE155.html)


## Usage

#### `(mynumber-validate "your my number")`

Validate my number


## Example

``` lisp
(mynumber-validate "123456789018") ;; => valid
(mynumber-validate "123456789014") ;; => invalid
```


## See Also

- [Ruby implementation](http://qiita.com/qube81/items/fa6ef94d3c8615b0ce64)
- [Go implementation](https://github.com/koron/go-mynumber)
- [Vim implementation](https://github.com/mattn/vim-mynumber)
