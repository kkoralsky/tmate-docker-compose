setup
=====

1. pull images

    ```
    docker-compose pull
    ```

1. generate keys

    ```
    $ mkdir -p keys && ./create_keys.sh
    ```

1. run migrations

    ```
    $ docker-compose up -d postgres
    $ docker-compose run master ./bin/tmate console

    # run comand twice
    % Mix.Task.rerun("ecto.migrate", ["-r", Tmate.Repo, "--migrations-path", "./lib/tmate-0.1.1/priv/repo/migrations"])
    % Mix.Task.rerun("ecto.migrate", ["-r", Tmate.Repo, "--migrations-path", "./lib/tmate-0.1.1/priv/repo/migrations"])

    Ctrl+c
    ```

1. launch services

    ```
    $ docker-compose up -d
    $ docker-compose logs -f
    ```

1. configure tmate on the client:
  in your `~/.tmux.conf` add: 

    ```
    set -g tmate-server-host <external fqdn>
    set -g tmate-server-port 22
    set -g tmate-server-rsa-fingerprint "<finerprint of generated RSA key>"
    set -g tmate-server-ed25519-fingerprint "<finerprint of generated ED25519 key>"
    ```

    you can get fingerprints like:

        $ ssh-keygen -l -E sha256 -f  keys/ssh_host_ed25519_key.pub
