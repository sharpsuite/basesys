# basesys
A base system that boots using SharpInit into a shell and little else.

## How to use

After initializing an auxiliary partition using [initenv](https://github.com/sharpsuite/initenv), populate `vars.sh` with information that pertains to your setup, and run generate-symlinks.sh (once) and push-to-aux.sh (whenever, to sync up the contents of target-root and $SHARPINIT_PATH with the auxiliary partition). The result should be a bootable system that drops you into a shell. The root account is `root:root`, and the user account is `user:test`.
