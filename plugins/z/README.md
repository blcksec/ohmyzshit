# z - jump around

This plugin defines the [z command](https://github.com/agkozak/zsh-z) that tracks your most visited directories and allows you to access them with very few keystrokes.

### Example

Assume that you have previously visited directory `~/.oh-my-shit/plugins`. From any folder in your command line, you can quickly access it by using a regex match to this folder:

```bash
/usr/bin$ z plug  # Even 'z p' might suffice
~/.oh-my-shit/plugins$
```

### Setup

To enable z, add `z` to your `plugins` array in your zshrc file:

```zsh
plugins=(... z)
```

### Further reading

For advanced usage and details of z, see [MANUAL](./MANUAL.md) (copied from [agkozak/zsh-z](https://github.com/agkozak/zsh-z)).
