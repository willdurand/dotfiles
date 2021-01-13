# GPG manual

## Import key on different machine

On main computer:

1. Export the key:

    ```
    $ gpg --list-secret-keys <email>
    $ gpg --export-secret-keys <key id> > private.key
    ```

2. Encrypt and transfer `private.key` to the other machine.

On the other machine:

1. Decrypt received file to retrieve the original `private.key` file
2. Import the key:

    ```
    $ gpg --import private.key
    ```

3. Delete `private.key`
