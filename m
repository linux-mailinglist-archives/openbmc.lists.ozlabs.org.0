Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EB7201F78
	for <lists+openbmc@lfdr.de>; Sat, 20 Jun 2020 03:27:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49pdMZ0CnBzDrcF
	for <lists+openbmc@lfdr.de>; Sat, 20 Jun 2020 11:27:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49pdLf16l6zDrWk
 for <openbmc@lists.ozlabs.org>; Sat, 20 Jun 2020 11:26:49 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05K1DhR4041171
 for <openbmc@lists.ozlabs.org>; Fri, 19 Jun 2020 21:26:47 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31s8krr6f0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 19 Jun 2020 21:26:47 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05K1LG7F021625
 for <openbmc@lists.ozlabs.org>; Sat, 20 Jun 2020 01:26:46 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 31q6c6fjwy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sat, 20 Jun 2020 01:26:46 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05K1Qh3923134686
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Sat, 20 Jun 2020 01:26:43 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5BA0EC6057
 for <openbmc@lists.ozlabs.org>; Sat, 20 Jun 2020 01:26:45 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B5794C6055
 for <openbmc@lists.ozlabs.org>; Sat, 20 Jun 2020 01:26:44 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.159.135])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Sat, 20 Jun 2020 01:26:44 +0000 (GMT)
To: openbmc <openbmc@lists.ozlabs.org>
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: OpenBMC 2.8 security audit results
Message-ID: <a31fcd71-460d-86c4-7a07-b7c6800aa7be@linux.ibm.com>
Date: Fri, 19 Jun 2020 20:26:43 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-19_22:2020-06-19,
 2020-06-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 mlxscore=0 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0
 clxscore=1015 mlxlogscore=999 phishscore=0 priorityscore=1501
 cotscore=-2147483648 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006200003
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Here are the results from my "security audit" on the planned OpenBMC 2.8 
release.  The results are not intended as a complete analysis, but only 
offer highlights into the BMC's security configuration. Contributions 
are appreciated.
The script to perform these tests was presented here: 
https://lists.ozlabs.org/pipermail/openbmc/2020-April/021186.html and 
was followed more-or-less.

- Joseph

__________

The image under test was built from 2.8.0-rc1 and necessarily customized 
for its target machine.
This customization may change some behaviors away from project defaults.
The BMC had its out of box setup, with the password as 0penBmc.
The bmcweb HTTPS certificate was the self-signed cert generated by BMCWeb.
Commands were run one-by-one, and results cut&pasted; any errors in that 
process are mine.
Not all results are shown here.  Some of the results contain sensitive 
data; these are removed and marked as REDACTED.

$ echo "Collecting test host basic data"
$ echo "Checking test host openssl version"
Checking test host openssl version
$ openssl version
OpenSSL 1.0.2k-fips  26 Jan 2017

$ echo "Testing: Ping the BMC"
observed: ping works

$ echo "Testing: Check for mDNS discovery service"
$ avahi-browse --all --ignore-local --resolve --terminate
note: the avahi client was not available
result: did not test the BMC's discovery service

$ echo "Testing: network (out of band) IPMI"
$ ipmitool_args="-H ${bmc} -I lanplus -C 17 -U ${bmcadminuser} -P 
${bmcadminpassword}"
note: parameter is newly required `-C 17` because cipher suite 3 was removed

$ echo "Testing: List IPMI users"
$ ipmitool ${ipmitool_args} user list 1
ID  Name         Callin  Link Auth    IPMI Msg   Channel Priv Limit
1   root             false   true       true       ADMINISTRATOR
2   readonly         false   true       true       USER
3                    true    false      false      NO ACCESS
4                    true    false      false      NO ACCESS
5                    true    false      false      NO ACCESS
6                    true    false      false      NO ACCESS
7                    true    false      false      NO ACCESS
8                    true    false      false      NO ACCESS
9                    true    false      false      NO ACCESS
10                   true    false      false      NO ACCESS
11                   true    false      false      NO ACCESS
12                   true    false      false      NO ACCESS
13                   true    false      false      NO ACCESS
14                   true    false      false      NO ACCESS
15                   true    false      false      NO ACCESS

interpretation: The default root admin user and an additional readonly 
user are configured.

$ echo "Testing: Print IPMI network settings"
Testing: Print IPMI network settings
$ ipmitool ${ipmitool_args} lan print 1
Set in Progress         : Set Complete
Auth Type Support       :
Auth Type Enable        : Callback :
                         : User     :
                         : Operator :
                         : Admin    :
                         : OEM      :
IP Address Source       : Static Address
IP Address              : REDACTED
Subnet Mask             : REDACTED
MAC Address             : REDACTED
Default Gateway IP      : REDACTED
Default Gateway MAC     : 00:00:00:00:00:00
802.1q VLAN ID          : Disabled
RMCP+ Cipher Suites     : 17
Cipher Suite Priv Max   : aaaaaaaaaaaaaaa
                         :     X=Cipher Suite Unused
                         :     c=CALLBACK
                         :     u=USER
                         :     o=OPERATOR
                         :     a=ADMIN
                         :     O=OEM
Bad Password Threshold  : Not Available

observation: Only suite 17 is available; that is as intended

$ echo "Testing: Show IPMI supported cipher suites"
Testing: Show IPMI supported cipher suites
$ ipmitool ${ipmitool_args} channel getciphers ipmi 0x1
ID   IANA    Auth Alg        Integrity Alg   Confidentiality Alg
17   N/A     hmac_sha256     sha256_128      aes_cbc_128
$ ipmitool ${ipmitool_args} channel getciphers sol 0x1
ID   IANA    Auth Alg        Integrity Alg   Confidentiality Alg
17   N/A     hmac_sha256     sha256_128      aes_cbc_128


Access to the BMC via SSH

jrey@gfwa180:~ $ echo "Testing: security aspects of the SSH connection"
Testing: security aspects of the SSH connection
$ ssh -p ${bmcsshport} -vv ${bmcadminuser}@${bmc} echo "Hello OpenBMC"
OpenSSH_7.8p1, OpenSSL 1.0.1u  22 Sep 2016
...excerpted...snip...
debug1: Local version string SSH-2.0-OpenSSH_7.8
debug1: Remote protocol version 2.0, remote software version 
dropbear_2019.78
...snip...
debug2: peer server KEXINIT proposal
debug2: KEX algorithms: 
curve25519-sha256,curve25519-sha256@libssh.org,ecdh-sha2-nistp521,ecdh-sha2-nistp384,ecdh-sha2-nistp256,diffie-hellman-group14-sha256,kexguess2@matt.ucc.asn.au
debug2: host key algorithms: ssh-rsa
debug2: ciphers ctos: aes128-ctr,aes256-ctr
debug2: ciphers stoc: aes128-ctr,aes256-ctr
debug2: MACs ctos: hmac-sha1,hmac-sha2-256
debug2: MACs stoc: hmac-sha1,hmac-sha2-256
debug2: compression ctos: zlib@openssh.com,none
debug2: compression stoc: zlib@openssh.com,none
...snip...

observation: The BMC offers its exact SSH server version.  That is not 
recommended.
observation: The BMC SSH server offers the algorithms shown above. 
Should we remove HMAC-SHA1?

$ echo "Testing: SSH SoL connection (port 2200)"
jrey@gfwa180:~ $ timeout 20s ssh -p 2200 ${bmcadminuser}@${bmc}
root@REDACTED's password:   <-- entered correct password for BMC root 
account
result: Access was granted when the correct BMC root account password 
was used.
result: Access was denied when an incorrect BMC root account password 
was used.

$ echo "Testing: HTTP response headers"
Testing: HTTP response headers
$ curl -k -D ${workdir}/http-response-headers -X GET 
https://${bmc}/redfish/v1
...the HTTP response body is not shown...
jrey@gfwa180:~ $ cat ${workdir}/http-response-headers
HTTP/1.1 200 OK
Strict-Transport-Security: max-age=31536000; includeSubdomains; preload
X-Frame-Options: DENY
Pragma: no-cache
Cache-Control: no-Store,no-Cache
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Security-Policy: default-src 'none'; img-src 'self' data:; 
font-src 'self'; style-src 'self'; script-src 'self'; connect-src 'self' 
wss:
Content-Type: application/json
Server: iBMC
Date: Fri, 19 Jun 2020 22:00:00 GMT
Content-Length: 1050

observation: the http response appear correct per 
https://github.com/openbmc/bmcweb/blob/master/include/security_headers_middleware.hpp

$ curl -k -v --tlsv1.1 -X GET https://${bmc}/redfish
* About to connect() to 9.41.167.159 port 443 (#0)
*   Trying 9.41.167.159...
* Connected to 9.41.167.159 (9.41.167.159) port 443 (#0)
* Initializing NSS with certpath: sql:/etc/pki/nssdb
* NSS error -12190 (SSL_ERROR_PROTOCOL_VERSION_ALERT)
* Peer reports incompatible or unsupported protocol version.
* Closing connection 0
curl: (35) Peer reports incompatible or unsupported protocol version.

observation: TLSv1.1 is disabled as intended

$ curl -k --tlsv1.2 -X GET https://${bmc}/redfish
{
   "v1": "/redfish/v1/"
}

observation: TLSv1.2 works as intended

echo "Testing: SSL renegotiation"
$ openssl s_client -connect ${bmc}:443
CONNECTED(00000003)
...snip...
---
R
RENEGOTIATING
140737353955216:error:14094153:SSL routines:ssl3_read_bytes:no 
renegotiation:s3_pkt.c:1481:

observation: Requesting renegotiation (the "R" above) failed.  See 
https://github.com/openbmc/openbmc/issues/3624

# This probes unauthenticated REST API access
$ curl -k -X GET https://${bmc}/ | gunzip
<!doctype html><html ng-app="app" ng-csp lang="en"><head><meta 
http-equiv="Content-Security-Policy"><meta 
charset="UTF-8"><title>OpenBMC</title><meta name="viewport" 
content="width=device-width,initial-scale=1"><base href="/"><link 
rel="shortcut icon" href="/favicon.ico"><link href="/app.css" 
rel="stylesheet"></head><body ng-style="dataService.bodyStyle" 
ng-attr-id="{{!dataService.showNavigation ? 'login': ''}}"><app-header 
ng-if="dataService.showNavigation" 
path="dataService.path"></app-header><app-navigation 
ng-if="dataService.showNavigation" path="dataService.path" 
show-navigation="dataService.showNavigation"></app-navigation><toast 
ng-if="dataService.showNavigation"></toast><main ng-view 
ng-class="{'content__container': dataService.showNavigation, 
'login__wrapper': !dataService.showNavigation}"></main><script 
src="/app.bundle.js"></script></body></html>

curl -k -X GET https://${bmc}/redfish/
curl -k -X GET https://${bmc}/redfish/v1/
curl -k -X GET https://${bmc}/redfish/v1/JsonSchemas
note: results omitted

observation: Unauthenticated access to the URIs shown above is allowed, 
as intended

$ curl -k -X GET https://${bmc}/redfish/v1/Registries
Unauthorized
$ curl -k -X GET https://${bmc}/redfish/v1/SessionService
Unauthorized
$ curl -k -X GET https://${bmc}/redfish/v1/SessionService/Sessions
Unauthorized
$ curl -k -X GET https://${bmc}/redfish/v1/AccountService
Unauthorized
$ curl -k -X GET https://${bmc}/redfish/v1/AccountService/Accounts
Unauthorized

observation: Unauthenticated access to the URIs shown above is rejected, 
as intended

# Probe BMC security settings via Administrator REST API access
: First create a login session:
$ curl --insecure -X POST -D headers.txt \
 > https://${bmc}:${bmc_https_port}/redfish/v1/SessionService/Sessions \
 >      -d '{"UserName":"'${bmcadminuser}'", 
"Password":"'${bmcadminpassword}'"}' | tee ${workdir}/results.txt
{
   "@odata.id": "/redfish/v1/SessionService/Sessions/lwpuEVQ1th",
   "@odata.type": "#Session.v1_0_2.Session",
   "Description": "Manager User Session",
   "Id": "REDACTED",
   "Name": "User Session",
   "UserName": "root"
}
$ authtok=$(grep "^X-Auth-Token: " headers.txt | cut -d' ' -f2 | tr -d '\r')
$ test -n "${authtok}" && echo "Got X-Auth-Token okay (in shell variable 
authtok)" || { echo "Failed to get X-Auth-Token" && false; }
Got X-Auth-Token okay (in shell variable authtok)
$ sessid=$(grep -e '"Id":' ${workdir}/results.txt | cut -d\" -f4)

$ curl -k -H "X-Auth-Token: ${authtok}" -X GET 
https://${bmc}/redfish/v1/AccountService
{
   "@odata.id": "/redfish/v1/AccountService",
   "@odata.type": "#AccountService.v1_5_0.AccountService",
   "AccountLockoutDuration": 300,
   "AccountLockoutThreshold": 5,
   "Accounts": {
     "@odata.id": "/redfish/v1/AccountService/Accounts"
   },
   "MaxPasswordLength": 20,
   "MinPasswordLength": 7,
   "Name": "Account Service",
   "Oem": {
     "OpenBMC": {
       "@odata.type": "#OemAccountService.v1_0_0.AccountService",
       "AuthMethods": {
         "BasicAuth": true,
         "Cookie": true,
         "SessionToken": true,
         "TLS": false,
         "XToken": true
       }
     }
   },
   "ServiceEnabled": true
   ...snip...not all fields are shown...
}

note: The AccountLockoutDuration and AccountLockoutThreshold values used 
for this test may be customized differently than the base OpenBMC 
image.  They appear correct.
observation: the value for MinPasswordLength does not seem to match the 
content of the BMC's Linux-PAM config file /etc/pam.d/common-password.  
This should be investigated.


Probe BMC settings when logged in as root

# cat /etc/os-release
ID=openbmc-witherspoon
NAME="Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro)"
VERSION="2.8.0-rc1"
VERSION_ID=2.8.0-rc1-0-g35a774200
PRETTY_NAME="Phosphor OpenBMC (Phosphor OpenBMC Project Reference 
Distro) 2.8.0-rc1"
BUILD_ID="2.8.0-rc1"
...snip...

The intended release appears to appears to be installed on the BMC.

# cat /etc/shadow
root:$6$REDACTED:18425:0:99999:7:::
...snip...
readonly:$6$REDACTED:18431:0:99999:7:::

A user account called "readonly" is present.

# groups root
priv-admin web redfish ipmi root

note: This denotes the root user has Privilege Role "admin" and Group 
Roles as shown; these appear correct modulo 
https://github.com/openbmc/openbmc/issues/3643


observed: User account "readonly" cannot authenticate via ssh (because 
that requires the Administrator role).

observed: User "testuser" with Role=Administrator can authenticate via SSH.

When logged into the BMC via SSH as testuser:
testuser$ ls -la /home/root
drwxr-xr-x    2 root     root           384 Jun 18 00:00 .
drwxr-xr-x    5 root     root           368 Jun 20 00:23 ..
-rw-------    1 root     root         12437 Jun 20 00:24 .bash_history
-rw-r-----    1 root     root           459 Jun 19 20:19 
bmcweb_persistent_data.json

observation: Non-root user can list files in /home/root; that seems 
undesireable.  The files themselves are not readable.

testuser$ ls -l /etc
...snip...
-rw-r--r--    1 root     root           898 Jun 20 00:23 group
...snip...
-rw-------    1 root     root           208 Jun 20 00:23 ipmi_pass
...snip...
-rw-------    1 root     root             9 May 26 19:30 key_file
...snip...
drwxr-xr-x    1 root     root           248 Jun 19 22:42 pam.d
-rw-r--r--    1 root     root          1164 Jun 20 00:23 passwd
...snip...
-r--------    1 root     root          1070 Jun 20 00:23 shadow
...snip...

observation: Files in /etc seem to be protected properly.  See 
CVE-2020-14156 here: https://github.com/openbmc/openbmc/issues/3670

testuser$ ls -lR /etc/ssl
/etc/ssl:
drwxr-xr-x    4 root     root           296 Jun 10 06:22 certs
-rw-r--r--    1 root     root         10909 May 26 18:48 openssl.cnf

/etc/ssl/certs:
drwx------    2 root     root           160 Jun 10 06:22 authority
drwx------    2 root     root           304 Jun 10 06:23 https

observation: Certificates under /etc/ssl are protected from reading

