#!/bin/bash -e
# JAVA_HOME can be passed as argument if not set
if [ ! -d $JAVA_HOME ]; then
	JAVA_HOME=${1}
fi

KEYSTORE=$JAVA_HOME/jre/lib/security/cacerts
if [ ! -f "$KEYSTORE" ]; then
	echo "Keystore not found in '$KEYSTORE'"
	exit 1
fi
cp $KEYSTORE $KEYSTORE.`date +"%Y%m%d%H%m%S"`

wget https://letsencrypt.org/certs/letsencryptauthorityx1.der
wget https://letsencrypt.org/certs/letsencryptauthorityx2.der
wget https://letsencrypt.org/certs/lets-encrypt-x1-cross-signed.der
wget https://letsencrypt.org/certs/lets-encrypt-x2-cross-signed.der
wget https://letsencrypt.org/certs/lets-encrypt-x3-cross-signed.der
wget https://letsencrypt.org/certs/lets-encrypt-x4-cross-signed.der

# to be idempotent
keytool -delete -alias isrgrootx1 -keystore $KEYSTORE -storepass changeit 2> /dev/null || true
keytool -delete -alias isrgrootx2 -keystore $KEYSTORE -storepass changeit 2> /dev/null || true
keytool -delete -alias letsencryptauthorityx1 -keystore $KEYSTORE -storepass changeit 2> /dev/null || true
keytool -delete -alias letsencryptauthorityx2 -keystore $KEYSTORE -storepass changeit 2> /dev/null || true
keytool -delete -alias letsencryptauthorityx3 -keystore $KEYSTORE -storepass changeit 2> /dev/null || true
keytool -delete -alias letsencryptauthorityx4 -keystore $KEYSTORE -storepass changeit 2> /dev/null || true

keytool -trustcacerts -keystore $KEYSTORE -storepass changeit -noprompt -importcert -alias isrgrootx1 -file letsencryptauthorityx1.der
keytool -trustcacerts -keystore $KEYSTORE -storepass changeit -noprompt -importcert -alias isrgrootx2 -file letsencryptauthorityx2.der
keytool -trustcacerts -keystore $KEYSTORE -storepass changeit -noprompt -importcert -alias letsencryptauthorityx1 -file lets-encrypt-x1-cross-signed.der
keytool -trustcacerts -keystore $KEYSTORE -storepass changeit -noprompt -importcert -alias letsencryptauthorityx2 -file lets-encrypt-x2-cross-signed.der
keytool -trustcacerts -keystore $KEYSTORE -storepass changeit -noprompt -importcert -alias letsencryptauthorityx3 -file lets-encrypt-x3-cross-signed.der
keytool -trustcacerts -keystore $KEYSTORE -storepass changeit -noprompt -importcert -alias letsencryptauthorityx4 -file lets-encrypt-x4-cross-signed.der

rm -f letsencryptauthorityx1.der letsencryptauthorityx2.der lets-encrypt-x1-cross-signed.der lets-encrypt-x2-cross-signed.der lets-encrypt-x3-cross-signed.der lets-encrypt-x4-cross-signed.der
