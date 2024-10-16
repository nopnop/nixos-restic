# nixos-restic


```
# Create a new snapshot:

backup

# Check:

restic check
restic snapshots

```


## Restore a workstation

1. Install nix & personnal collections (especially gpg). Restart session to have gpg+ssh agent running
1. Clone pass: `git clone git@github.com:nopnop/nixos-pass.git ~/.password-store`
2. Clone restic: `git clone git@github.com:nopnop/nixos-restic.git`
3. List snapshot and pick one to restore:
   ```
   nix develop
   restic snapshots
   restir restore <snapshotid> --target /
   ```

