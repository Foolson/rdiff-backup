useradd --no-log-init -m -s /bin/bash -d "/home/${SSH_USER}" "${SSH_USER}"
usermod -p '*' "${SSH_USER}"
mkdir -p "/home/${SSH_USER}/.ssh"
mkdir "/home/${SSH_USER}/backup"
echo "${AUTHORIZED_KEYS}" > "/home/${SSH_USER}/.ssh/authorized_keys"
chown -R "${SSH_USER}":"${SSH_USER}" "/home/${SSH_USER}"
chmod 700 "/home/${SSH_USER}/.ssh"
chmod 600 "/home/${SSH_USER}/.ssh/authorized_keys"
chown "${SSH_USER}":"${SSH_USER}" /backup

exec "$@"
