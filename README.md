# somelines.vim

Vim plugin to split long one line command into some lines for documentation.

## usage

On target line,

```vim
:Sisl "Sisl is abbreviation of `SplitIntoSomeLines`.
```

### example

#### input

```
oneline-long-command split --example --parameter many --format somelines plugin
```

#### output

```
oneline-long-command split \
--example \
--parameter many \
--format somelines \
plugin
```
