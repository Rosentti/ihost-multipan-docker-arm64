#!/usr/bin/with-contenv bash
# ==============================================================================
# Disable OTBR if not enabled
# ==============================================================================
source /etc/bashlog/log.sh;

if [ $OTBR_ENABLE -eq 0 ]; then
    rm /etc/s6-overlay/s6-rc.d/user/contents.d/otbr-agent
    rm /etc/s6-overlay/s6-rc.d/user/contents.d/otbr-web
    log 'info' "The otbr-agent is disabled."
else
    log 'info' "REST API port is exposed, starting otbr-agent."
    if [ $OTBR_WEB_ENABLE -eq 0 ]; then
        rm /etc/s6-overlay/s6-rc.d/user/contents.d/otbr-web
        log 'info' "The otbr-web is disabled."
    else
        log 'info' "Web UI port is exposed, starting otbr-web."
    fi
fi
