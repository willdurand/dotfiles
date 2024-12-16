# GPG manual

## Using an offline GnuPG master key

---

**IMPORTANT:** this section is a markdown dump of
https://incenp.org/notes/2015/using-an-offline-gnupg-master-key.html, I did NOT
write this content but I needed a backup.

---

OpenPGP subkeys have many benefits (well summarized on this [Debian wiki page][1]), one ofthem being that if you have both an encryption subkey and a signingsubkey (at least), you don't need your master private key for your dailyusage of OpenPGP—you will only need it for signing someone else's key orto modify your own key (adding or revoking User IDs, adding or revokingsubkeys, updating the preferences, etc.).

Consequently, your private master key can be put offline most of thetime, and brought back to your computer only on those few occasionswhere it is required.

There are already [many][2][pages][3]on the web describing how to do that. However, most of them, if not allof them, predate the recent release of GnuPG 2.1, so I thought an updateon that topic would be worthwhile.

### How to remove the master private key from your keyring

#### Step 1: Back up the original keyring

Let's assume you have the following private keyring:

    $ gpg2 --list-secret-keys
    /home/alice/.gnupg/pubring.kbx
    ------------------------------
    sec   rsa4096/CB2F38F25B491A54 2014-12-31 [SC] [expires: 2017-12-30]
    uid               [ultimate] Alice <alice@example.org>
    ssb   rsa2048/04BB7F8FDEC5E5D9 2014-12-31 [S] [expires: 2015-12-31]
    ssb   rsa2048/BBB6B86627C2D43A 2014-12-31 [E] [expires: 2015-12-31]

Export the private master key and its private subkeys:

    $ gpg2 --armor --output alice-private-keys.asc --export-secret-key alice@example.org

Store the exported private keys in a secure place (not on yourcomputer). You may also print a hardcopy with a tool like [Paperkey][4]:

    $ gpg2 --export-secret-key alice@example.org | paperkey | lpr

#### Step 2: Remove the private master key from the keyring

The "classic" method for doing that is to export your private subkeys, then delete all your private keys (the master private key and the private subkeys), and import back the private subkeys (because GnuPG prior to version 2.1 had no option to delete the master key only).

With GnuPG 2.1 however, there is a more direct method. First, find the _keygrip_ of your master key:

    $ gpg2 --list-secret-keys --with-keygrip
    /home/alice/.gnupg/pubring.kbx
    ------------------------------
    sec   rsa4096/CB2F38F25B491A54 2014-12-31 [SC] [expires: 2017-12-30]
    Keygrip = D4DF0C35D3E22FA6AC37DA2E54FB03F73616A3CB
    uid               [ultimate] Alice <alice@example.org>
    ssb   rsa2048/04BB7F8FDEC5E5D9 2014-12-31 [S] [expires: 2015-12-31]
    Keygrip = 21B2EDF018D7CAF0B45644FDB753DD42307C4425
    ssb   rsa2048/BBB6B86627C2D43A 2014-12-31 [E] [expires: 2015-12-31]
    Keygrip = 2E149DA9C5E46E0DECC6A17EFD8B5FB1DF1E1BAB

Then send a `DELETE_KEY` command to the GnuPG Agent:

    $ gpg-connect-agent "DELETE_KEY D4DF0C35D3E22FA6AC37DA2E54FB03F73616A3CB" /bye

Confirm that you want to delete the key when the agent ask you so.

For reference, the "classic" method (which still works with GnuPG2.1) is as follows:

First, export the subkeys:

    $ gpg2 --armor --output private-subkeys.asc --export-secret-subkeys alice@example.org

Then delete the private master key and its subkeys:

    $ gpg2 --delete-secret-key alice@example.org

    sec  rsa4096/CB2F38F25B491A54 2014-12-31 Alice <alice@example.org>

    Delete this key from the keyring? (y/N) y
    This is a secret key! - really delete? (y/N) y

Then import back the subkeys you have just exported:

    $ gpg2 --import private-subkeys.asc
    gpg: key CB2F38F25B491A54: "Alice <alice@example.org>" not changed
    gpg: key CB2F38F25B491A54: secret key imported
    gpg: Total number processed: 4
    gpg:              unchanged: 1
    gpg:       secret keys read: 4
    gpg:   secret keys imported: 2

#### Step 3: Ensure that the private master key has been removed

List the contents of your private keyring again:

    $ gpg2 --list-secret-keys
    /home/alice/.gnupg/pubring.kbx
    ------------------------------
    sec#  rsa4096/CB2F38F25B491A54 2014-12-31 [SC] [expires: 2017-12-30]
    uid               [ultimate] Alice <alice@example.org>
    ssb   rsa2048/04BB7F8FDEC5E5D9 2014-12-31 [S] [expires: 2015-12-31]
    ssb   rsa2048/BBB6B86627C2D43A 2014-12-31 [E] [expires: 2015-12-31]
    ssb   rsa2048/7D2233B8833E70AF 2014-12-31 [A] [expires: 2015-12-31]

No matter which method above you have used, you should see the`#` symbol after the `sec` keyword, confirming that the private master key is not usable.

If you want to be really sure, try to do something that requires the private master key, such as adding a new dummy User ID to your keyring:

    $ gpg2 --edit-key alice@example.org
    Secret key is available.

    pub  rsa4096/CB2F38F25B491A54
         created: 2014-12-31  expires: 2017-12-30  usage: SC
         trust: ultimate      validity: ultimate
    sub  rsa2048/04BB7F8FDEC5E5D9
         created: 2014-12-31  expires: 2015-12-31  usage: S
    sub  rsa2048/BBB6B86627C2D43A
         created: 2014-12-31  expires: 2015-12-31  usage: E
    sub  rsa2048/7D2233B8833E70AF
         created: 2014-12-31  expires: 2015-12-31  usage: A
    [ultimate] (1). Alice <alice@example.org>

    gpg> adduid
    Real name: Dummy
    Email address: dummy@example.org
    Comment:
    You selected this USER-ID:
        "Dummy <dummy@example.org>"

    Change (N)ame, (C)omment, (E)mail or (O)kay/(Q)uit? O
    gpg: signing failed: No secret key
    gpg: signing failed: No secret key

    gpg> quit

Note the `signing failed: No secret key` messages.

### How to use the offline master key

There are several ways to make GnuPG temporarily use the offline master key. The method I am currently using goes along the following lines.

Let's assume you have stored the `alice-private-keys.asc`file (generated in step 1 above) on a USB stick, and that, when the stick is mounted, the file is available at a location such as`/run/media/alice/mystick/alice-private-keys.asc`.

Create a temporary directory to use as a temporary GnuPG home:

    $ mkdir ~/gpgtmp
    $ chmod 0700 ~/gpgtmp

Import your complete private keyring on that directory from your backup file:

    $ gpg2 --homedir ~/gpgtmp --import /run/media/alice/mystick/alice-private-keys.asc
    gpg: keybox 'gpgtmp/pubring.kbx' created
    gpg: gpgtmp/trustdb.gpg: trustdb created
    gpg: key 5B491A54: public key "Alice <alice@example.org>" imported
    gpg: key 5B491A54: secret key imported
    gpg: Total number processed: 4
    gpg:               imported: 1
    gpg:       secret keys read: 4
    gpg:   secret keys imported: 3

You may now unmount your USB stick and put it back in its safe place.

Now edit the key you want to sign. Use the temporary directory asGnuPG home, but add the public keyring from your normal GnuPG home directory:

    $ gpg2 --homedir ~/gpgtmp --keyring ~/.gnupg/pubring.kbx --edit-key bob@example.com

If you were using GnuPG 2.0 prior to GnuPG 2.1, your public keyring is probably still in the "legacy" format and will be called`pubring.gpg` instead of `pubring.kbx`.

When you have finished, terminate the GnuPG Agent which was started in the temporary directory, and wipe out that directory:

    $ gpg-connect-agent --homedir ~/gpgtmp KILLAGENT /bye
    $ rm -rf ~/gpgtmp

A drawback of this method is that since you are not using your normal GnuPG's home directory, any configuration file in that directory will be ignored. If that is a concern, you may copy or symlink your`$GNUPGHOME/gpg.conf` file into the temporary directory before invoking GnuPG.

I strongly suggest using a small script to automatize the above commands—such as this one (footnote #1):

    #!/bin/bash

    # The DOS label of your USB stick
    LABEL=mystick

    # The pathname to the file containing your private keys
    # on that stick
    KEYFILE=alice-private-keys.asc

    # Identify the device file corresponding to your USB stick
    device=$(/sbin/findfs LABEL=$LABEL)

    if [ -n "$device" ]; then
        # Mount the stick
        udisksctl mount --block-device $device

        # Create temporary GnuPG home directory
        tmpdir=$(mktemp -d -p $XDG_RUNTIME_DIR gpg.XXXXXX)

        # Import the private keys
        gpg2 --homedir $tmpdir --import /run/media/$USER/$LABEL/$KEYFILE

        # Unmount the stick
        udisksctl unmount --block-device $device

        # Launch GnuPG from the temporary directory,
        # with the default public keyring
        # and with any arguments given to us on the command line
        gpg2 --homedir $tmpdir --keyring ${GNUPGHOME:-$HOME/.gnupg}/pubring.kbx $@

        # Cleaning up
        [ -f $tmpdir/S.gpg-agent ] && gpg-connect-agent --homedir $tmpdir KILLAGENT /bye
        rm -rf $tmpdir
    fi

Updated 2018-03-30: Thanks to Geoffroy for pointing out that the call to _findfs_ in the above script was incorrect. He also suggested `/sbin/blkid -L $LABEL` as a possible replacement for _findfs_.

### Some further thoughts

#### Splitting the master key in parts

If you don't like the idea to keep your offline master key on a single USB stick (footnote #2) you may want to use a _N-of-M secret sharing scheme_ to split the backup file in _M_ parts, in such a way that _N_ parts at least are needed to reconstruct the file.

For example, using [libgfshare][5]'simplementation of [Shamir'sSecret Sharing Scheme][6]:

    $ gfsplit -n 2 -m 3 alice-private-keys.asc

This will produce three files of the form`alice-private-keys.asc.NNN`, any two of which will be needed to reconstruct the original file. You may then store each of them on a different support.

#### Another method: Manipulating GnuPG Agent's key files directly

Currently (with GnuPG 2.1), GnuPG Agent stores each private key in a separate file `$GNUPGHOME/private-keys-v1.d/NNN…NNN.key`,where _NNN…NNN_ is the 20-bytes long keygrip of the key.

This allows a different and much simpler method to put the master private key offline, and bringing it back only when needed.

Back up the private key and delete it from the private keyring in a single step simply by moving the corresponding file from the`$GNUPGHOME/private-keys-v1.d` directory (once you know its keygrip):

    $ mv ~/.gnupg/private-keys-v1.d/D4DF0C35D3E22FA6AC37DA2E54FB03F73616A3CB.key /run/media/alice/mystick/

To use the master key when needed, copy or symlink it from your storage device back into the private keys directory, perform the operation requiring the master key, then delete the file or symlink. No more need to use a temporary GnuPG home directory.

A few remarks regarding this method:

- the private key is stored in its protected form, so it is as well protected using this method as it was using the`\--export-secret-key` option above;
- GnuPG Agent only caches the passphrase protecting the key, never the key itself—it reads the key from file every time the key is required, which means that as soon as the key file is removed from the agent's directory, the key is no longer available;
- a possible cause of concern is that this method depends on what may be considered as implementation details of GnuPG Agent, which may very well change in future GnuPG versions—by contrast the first method above only depends on GnuPG's public interface.

### Footnotes

1. ↑ My own script is actually a bit more complicated, but it boils down to the same logic.
2. ↑ Keep in mind, however, that your exported private key is not unprotected: with GnuPG's default settings, the key is encrypted with a 128-bit AES key, which is itself derived by*n* iterations of SHA1 on your passphrase—with _n_ automatically defined so that the entire computation takes about 100ms.

## Change expiration

    $ mkdir ~/gpgtmp
    $ chmod 0700 ~/gpgtmp
    $ gpg --homedir ~/gpgtmp --import /path/to/master-key/C1274F3B.private.gpg-key
    $ gpg --no-default-keyring --homedir ~/gpgtmp --keyring ~/.gnupg/pubring.kbx --edit-key will@drnd.me
    gpg (GnuPG/MacGPG2) 2.2.24; Copyright (C) 2020 Free Software Foundation,
    Inc.
    This is free software: you are free to change and redistribute it.
    There is NO WARRANTY, to the extent permitted by law.

    Secret key is available.

    [...]

    gpg> expire  # use 1y
    [...]

    gpg> key 1
    [...]

    gpg> expire  # use 1y
    [...]

    gpg> key 2
    [...]

    gpg> expire  # use 1y
    [...]

    gpg> key 3
    [...]

    gpg> expire  # use 1y
    [...]

    gpg> save
    $ /opt/homebrew/bin/gpg-connect-agent --homedir ~/gpgtmp KILLAGENT /bye
    OK closing connection
    $ rm -rf gpgtmp

As of 2024, I should have a primary key with 4 sub-keys: 1 signing sub-key per
machine, and 1 encryption key.

## Change primary

When editing the keyring `~/.gnupg/pubring.kbx`:

    gpg> uid <index of will@drnd.me>
    gpg> primary
    gpg> save


## Import key on different machine

On main computer:

1. Export the key:

    ```
    $ gpg --list-secret-keys <email>
    $ gpg --export-secret-keys <key id> > private.key
    # OR:
    $ gpg --export-secret-subkeys '<subkey id>!' > private-subkey.key
    ```

2. Encrypt and transfer `private.key` to the other machine.

On the other machine:

1. Decrypt received file to retrieve the original `private.key` file
2. Import the key:

    ```
    $ gpg --import private.key
    ```

3. Delete `private.key`


[1]: https://wiki.debian.org/Subkeys
[2]: https://alexcabal.com/creating-the-perfect-gpg-keypair/
[3]: http://wiki.fsfe.org/Card_howtos/Card_with_subkeys_using_backups#Removing_the_master_key_from_the_keyring
[4]: http://www.jabberwocky.com/software/paperkey/
[5]: http://www.digital-scurf.org/software/libgfshare
[6]: http://dl.acm.org/citation.cfm?doid=359168.359176
