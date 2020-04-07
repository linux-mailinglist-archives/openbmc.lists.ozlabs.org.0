Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 875D41A17B1
	for <lists+openbmc@lfdr.de>; Wed,  8 Apr 2020 00:06:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xhLc6QrhzDqQ4
	for <lists+openbmc@lfdr.de>; Wed,  8 Apr 2020 08:06:00 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xhKh3lv1zDqKj
 for <openbmc@lists.ozlabs.org>; Wed,  8 Apr 2020 08:05:12 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 037M4Lsj088297
 for <openbmc@lists.ozlabs.org>; Tue, 7 Apr 2020 18:05:09 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3091yk82gk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 07 Apr 2020 18:05:09 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 037M4C2U022248
 for <openbmc@lists.ozlabs.org>; Tue, 7 Apr 2020 22:05:08 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04dal.us.ibm.com with ESMTP id 3091mdr4x2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 07 Apr 2020 22:05:08 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 037M57eT8848072
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 7 Apr 2020 22:05:07 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F10E112063
 for <openbmc@lists.ozlabs.org>; Tue,  7 Apr 2020 22:05:07 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EFC3F112062
 for <openbmc@lists.ozlabs.org>; Tue,  7 Apr 2020 22:05:06 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.171.253])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Tue,  7 Apr 2020 22:05:06 +0000 (GMT)
To: openbmc <openbmc@lists.ozlabs.org>
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: BMC network security audit tools
Message-ID: <eae5b3f6-8e08-699c-d2d3-3d6e9bcdbfe3@linux.ibm.com>
Date: Tue, 7 Apr 2020 17:05:06 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-07_09:2020-04-07,
 2020-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004070171
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

OpenBMC Community,

Here are the BMC network security audit tools as discussed in the 
Security Working Group meeting 2020-03-04.

I intend to merge this into the [OpenBMC tools repo][] and use it for 
the Security Working Group's input to the [Release Process][]. I would 
be happy if these checks were sharpened and added to a dynamic scanner 
(but I have no plans to do that myself).

- Joseph

_____

Purpose: Provide shell scripts to expose security aspects of an 
operational OpenBMC system from the point of view of an agent on the 
BMC's management network trying to get access.  The intended use is to 
provide information needed to audit the BMC's interfaces, not to perform 
a security test.  For example, the script detects if the BMC rejects TLS 
1.1 and accepts TLS 1.2.  The primary value the scripts provide is a 
starting point for what to look at, how to get the information, and 
where to learn more.

Two scripts are provided.

The first script runs on a system that has access to the BMC's 
management network; it uses that access to probe the BMC's network 
interfaces.  The BMC should be configured for its intended operating 
environment, ideally following the [security implementation guidance][] 
provided to its users.  For example, IP address configured, certificates 
added, default passwords changed, etc.

The second script runs on the BMC's shell, typically via SSH.   The idea 
is to log into the BMC as each kind of BMC user (root, Operator, etc.) 
and run the script.  You'll need root access to get all the details, and 
users with less authority to validate access controls.

The scripts were developed using Linux and the bash shell with the 
intent to use the portable subset (no bashisms).
They are not fully automated, and can be run piecemeal as your 
investigation requires.
Finally, if you share the results of running this, please redact 
sensitive information (such as specific hostnames, usernames, versions, 
etc.) that reveal details of your private environment.

[security implementation guidance]: 
https://en.wikipedia.org/wiki/Security_Technical_Implementation_Guide
[OpenBMC tools repo]: github.com/openbmc/openbmc-tools
[Release Process]: 
https://github.com/openbmc/docs/blob/master/release/release-process.md

_____

# Set up shell variables to represent the test host and BMC environment
# where the "test host" is a system that has network access to BMC.
# Please customize these for your environment.

# Test host environment: What directory to use when commands need to 
write files to the test host's file system?
workdir=/tmp
workdir=.

# Access to the BMC
bmc=192.168.123.132  # Change me!
bmcsshport=22
bmcadminuser=root
bmcadminpassword=0penBmc

# Collect data from the test host
# This section has details about the test host used to connect to the 
BMC.  The test host matters due to the versions of the commands used to 
connect to the BMC.

echo "Collecting test host basic data"
hostname
date
uname -a
cat /etc/os-release

echo "Collecting test host user info"
whoami

echo "Checking test host ipmitool version"
ipmitool -V

echo "Checking test host openssl version"
openssl version
ciphers=`openssl ciphers | tr : ' '`
echo $ciphers

# Ping
echo "Testing: Ping the BMC"
ping ${bmc} -c1

# mDNS discovery - or substitute your favorite mDNS discovery tool
echo "Testing: Check for mDNS discovery service"
avahi-browse --all --ignore-local --resolve --terminate

# IPMI
echo "Testing: network (out of band) IPMI"
ipmitool_args="-H ${bmc} -I lanplus -U ${bmcadminuser} -P 
${bmcadminpassword}"

echo "Testing: List IPMI users"
ipmitool ${ipmitool_args} user list 1
: Look for users and their privilege

echo "Testing: Print IPMI network settings"
ipmitool ${ipmitool_args} lan print 1
: Look for RMCP+ cipher suites, for example

echo "Testing: Show IPMI supported cipher suites"
ipmitool ${ipmitool_args} channel getciphers ipmi 0x1
ipmitool ${ipmitool_args} channel getciphers sol 0x1
: Look for supported algorithms
: See https://github.com/openbmc/phosphor-net-ipmid files: 
auth_algo.hpp, integrity_algo.hpp
: See https://github.com/openbmc/meta-phosphor file: 
recipes-phosphor/ipmi/phosphor-ipmi-config/cipher_list.json

# Secure Shell (SSH)

echo "Testing: security aspects of the SSH connection"
ssh -p ${bmcsshport} -vv ${bmcadminuser}@${bmc} echo "Hello OpenBMC"
: Supply the password if needed
: Look for debug data that shows items like: KEX algorithms, ciphers, 
and MACs.
: See 
https://github.com/openbmc/openbmc/blob/master/poky/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch

echo "Testing: SSH SoL connection (port 2200)"
timeout 20s ssh -p 2200 ${bmcadminuser}@${bmc}
: Supply the password if needed
: If the host console is active, look for a login prompt or shell prompt
: Expect the connection to be unresponsive when the host is not up.
: Note the command above (timeout) disconnects after the themeout period.

# HTTP (port 80)
echo "Testing: HTTP"
curl -k -D ${workdir}/http-response-headers -X GET http://${bmc}/redfish/v1
echo $?
: Look for error ("Connection refused") or look at response headers:
cat ${workdir}/http-response-headers

# HTTPS
echo "Testing: HTTP response headers"
curl -k -D ${workdir}/http-response-headers -X GET https://${bmc}/redfish/v1
echo $?
cat ${workdir}/http-response-headers
: Validate HTTP response headers: Content-Security-Policy, etc.
: See https://github.com/openbmc/bmcweb file: 
include/security_headers_middleware.hpp

echo "Testing: HTTPS supported ciphers"
# What is the right way to determine supported HTTPS ciphers?
curl -k -v --tlsv1.1 -X GET https://${bmc}/redfish
curl -k -v --tlsv1.2 -X GET https://${bmc}/redfish
: Validate tlsv1.1 reports SSL_ERROR_PROTOCOL_VERSION_ALERT and drops
: Validate tlsv1.2 connects
: See https://github.com/openbmc/bmcweb file: include/ssl_key_handler.hpp

# SSL renegotiation
echo "Testing: SSL renegotiation"
openssl s_client -connect 127.0.0.1:2443
: Note this may report: Secure Renegotiation IS supported
: To renegotiate: type the capital-R letter and press enter
: Validate the RENEGOTIATING response indicates error, no renegotiation
: See https://github.com/openbmc/openbmc/issues/3624

# BMC unauthenticated access
# This probes what you can and cannot access when not authenticated
curl -k -X GET https://${bmc}/ | gunzip
: The unzip command assumes Content-Encoding: gzip

curl -k -X GET https://${bmc}/redfish/
curl -k -X GET https://${bmc}/redfish/v1/
curl -k -X GET https://${bmc}/redfish/v1/JsonSchemas
: Validate access is allowed to the URIs above

curl -k -X GET https://${bmc}/redfish/v1/Registries
curl -k -X GET https://${bmc}/redfish/v1/SessionService
curl -k -X GET https://${bmc}/redfish/v1/SessionService/Sessions
curl -k -X GET https://${bmc}/redfish/v1/AccountService
curl -k -X GET https://${bmc}/redfish/v1/AccountService/Accounts
: Validate access is NOT allowed and we get: Unauthorized

# Probe BMC security settings
: Use admin login to probe security settings.  First create a login session:
curl --insecure -X POST -D headers.txt \
https://${bmc}:${bmc_https_port}/redfish/v1/SessionService/Sessions \
     -d '{"UserName":"'${bmcadminuser}'", 
"Password":"'${bmcadminpassword}'"}' | tee ${workdir}/results.txt
authtok=$(grep "^X-Auth-Token: " headers.txt | cut -d' ' -f2 | tr -d '\r')
test -n "${authtok}" && echo "Got X-Auth-Token okay (in shell variable 
authtok)" || { echo "Failed to get X-Auth-Token" && false; }
sessid=$(grep -e '"Id":' ${workdir}/results.txt | cut -d\" -f4)
echo "sessid='${sessid}'"
: then use the session (authtok) below.

curl -k -H "X-Auth-Token: ${authtok}" -X GET 
https://${bmc}/xyz/openbmc_project/software/attr/FieldModeEnabled
: Validate data (boolean)
curl -k -H "X-Auth-Token: ${authtok}" -X GET 
https://${bmc}/redfish/v1/AccountService property
: Validate AccountLockoutDuration, AccountLockoutThreshold,
:   LDAP.ServiceEnabled, Oem.OpenBMC.AuthMethods
 
_____

# Run these commands on the BMC's shell, for example via SSH.
# This should be repeated for several BMC users:
#  - root
#  - A non-root Administrator user
#  - An Operator user
#  - A ReadOnly user
# Create testuser id, authorize that id to use ssh, and ssh into the BMC.
# May need to run this on the bmc to grant SOMEUSER access to SSH:
#   sudo usermod --append --group ssh SOMEUSER

echo "BMC check: get basic information"
hostname
date
uname -a
cat /etc/os-release

echo "BMC check: username and group membership"
whoami
groups
: Validate groups.  Note the group prefixed with "priv-" denotes the 
privilege role.
: See 
https://github.com/openbmc/docs/blob/master/architecture/user_management.md#supported-privilege-roles
: 
https://github.com/openbmc/docs/blob/master/architecture/user_management.md#supported-group-roles
: For example, a result of "priv-admin ssh redfish" indicates a 
privilege role of admin and authorized to the ssh and redfish groups.

echo "BMC check: access to files in /home/root"
ls -lR /home/root

echo "BMC check: access to files in /var/log"
ls -l /var/log

echo "BMC check: access to files in /etc"
ls -l /etc
head -3 /etc/shadow
ls -l /etc/certs
ls /home/root/
ls -lR /etc/ssl
: Validate file permissions and acces to files

echo "BMC check: Validate PAM config"
ls -R /etc/pam.d
(cd /etc/pam.d; ls | xargs tail -n +1)
: Validate contents of PAM config files

# What other checks and tests are needed?
# Is there a test for randomness and entropy?

