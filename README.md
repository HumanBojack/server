# Configs
This repository contains configuration files for various services.

## Additional configurations
### Docker
In order to use the advanced grafana dashboard filtering regarding the logs, you will need to add the following configuration to the docker daemon.

Edit the docker daemon (`/etc/docker/daemon.json`) to include the following:
(If the file does not exist, create it)
```json
{
  "log-opts": {
    "tag": "{{.ImageName}}|{{.Name}}|{{.ImageFullID}}|{{.FullID}}"
  }
}
```
Then restart the docker daemon:
```bash
sudo systemctl restart docker
```

### Secrets
You will need various informations to run all the services. These are stored in the `secrets/` directory.

#### `secrets/acme.json`
This file is generated by Traefik when you first run the stack.
It should contain your ACME (Automatic Certificate Management Environment) configuration for SSL certificates. It should be in JSON format.

#### `secrets/minecraft.env`
This file should contain environment variables for your Minecraft server. It should have the following format:

```
RCON_PASSWORD=value
WHITELIST=value
```

#### `secrets/porkbun.env`
This file should contain environment variables for the Porkbun DNS API. It should have the following format:

```
PORKBUN_API_KEY=value
PORKBUN_SECRET_API_KEY=value
```

#### `secrets/postgres.env`
This file should contain environment variables for your PostgreSQL database. It should have the following format:

```
POSTGRES_USER=value
POSTGRES_PASSWORD=value
POSTGRES_DB=value
```

#### `secrets/usersfile.txt`
This file should contain the users for Traefik basic authentication. It should have the following format:

```
username:bcrypt_hashed_password
other_username:bcrypt_hashed_password
```
