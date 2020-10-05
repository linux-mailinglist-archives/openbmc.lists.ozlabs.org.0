Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C24283339
	for <lists+openbmc@lfdr.de>; Mon,  5 Oct 2020 11:30:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C4b0w0FFHzDqDm
	for <lists+openbmc@lfdr.de>; Mon,  5 Oct 2020 20:30:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=in.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=gkeishin@in.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=in.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Aplis9Ve; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C4b001kg0zDqDf
 for <openbmc@lists.ozlabs.org>; Mon,  5 Oct 2020 20:29:15 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09592X4n103137
 for <openbmc@lists.ozlabs.org>; Mon, 5 Oct 2020 05:29:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : to : cc :
 from : date : references : content-type : message-id : mime-version :
 subject; s=pp1; bh=6p7TwyGcBaR3nSGQxNQj/M1dI4b8z3DcZQHd6uAXk+c=;
 b=Aplis9VeFbiegraFVN6Lqz11MPZxwnuCVW8+z1LhgpHwRE8080ZlSRYo3DGOJe6LXxXh
 ah2qLiuO+dCfaO7IBCMY3lT+NTL2Ox1TqfNuMGxTjdOqscVsfw9pjBxYp2dYNMFIjuL0
 ppGehW5x8Rv/vIsIcgg1N9b7I4bGlqtga184NDAKAjuC6fUQryK8UfZQ8p3XguAvDcmh
 WD9UbkQOMyxgygW4OG/EHMQxR9xejMMvOYj4iWIbGRAtHRhvqVRv94gNP77EXZ6NBKeY
 A0E0t0Ngp3Rci4jHqDSQnJtKZdpgERXonwmiGRD+ThD2a/T4YYCIePsph3AXYeOCxOvz GQ== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.75])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33yxjdvcsg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 05 Oct 2020 05:29:12 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <gkeishin@in.ibm.com>;
 Mon, 5 Oct 2020 09:29:11 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
 by smtp.notes.na.collabserv.com (10.106.227.123) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 5 Oct 2020 09:29:10 -0000
Received: from us1a3-mail113.a3.dal06.isc4sb.com ([10.146.6.4])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2020100509290933-219068 ;
 Mon, 5 Oct 2020 09:29:09 +0000 
In-Reply-To: <SG2PR04MB30938A1CCFE5499A7B017852E10C0@SG2PR04MB3093.apcprd04.prod.outlook.com>
To: Jayashree D <jayashree-d@hcl.com>
From: "George Keishing" <gkeishin@in.ibm.com>
Date: Mon, 5 Oct 2020 14:59:03 +0530
References: <SG2PR04MB30932185827E6DCADD02F422E1240@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <SG2PR04MB3093E7C8F543D9AD318B4653E1230@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <68131600080119@mail.yandex-team.ru>
 <SG2PR04MB309303A2C979A689DE8B67CFE1200@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <18221600180837@mail.yandex-team.ru>
 <SG2PR04MB3093A564F0482CE5FF12BA42E1210@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <20200917154534.GI6152@heinlein>
 <SG2PR04MB30932DB1D5C88B0447DBC7F7E13F0@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <SG2PR04MB30930AE9AE508E17FB788D66E1360@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <SG2PR04MB30938A1CCFE5499A7B017852E10C0@SG2PR04MB3093.apcprd04.prod.outlook.com>
X-KeepSent: 9260DEF9:CE15534B-002585F8:00334FE5;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 10.0.1 November 29, 2018
X-LLNOutbound: False
X-Disclaimed: 54471
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=8FBB0F6BDFA0C9758f9e8a93df938690918c8FBB0F6BDFA0C975"
x-cbid: 20100509-6875-0000-0000-000003A98CEB
X-IBM-SpamModules-Scores: BY=0.033805; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.421136; ST=0; TS=0; UL=0; ISC=; MB=0.253527
X-IBM-SpamModules-Versions: BY=3.00013955; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01444640; UDB=6.00776488; IPR=6.01227342; 
 MB=3.00034391; MTD=3.00000008; XFM=3.00000015; UTC=2020-10-05 09:29:10
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-10-05 04:14:08 - 6.00011917
x-cbparentid: 20100509-6876-0000-0000-000025289449
Message-Id: <OF9260DEF9.CE15534B-ON002585F8.00334FE5-652585F8.0034197D@notes.na.collabserv.com>
X-Proofpoint-UnRewURL: 16 URL's were un-rewritten
MIME-Version: 1.0
Subject: RE: Connection issue in OpenBMC image
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-05_06:2020-10-02,
 2020-10-05 signatures=0
X-Proofpoint-Spam-Reason: orgsafe
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "geissonator@yahoo.com" <geissonator@yahoo.com>,
 openbmc <openbmc-bounces+gkeishin=in.ibm.com@lists.ozlabs.org>,
 Konstantin Klubnichkin <kitsok@yandex-team.ru>,
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0__=8FBB0F6BDFA0C9758f9e8a93df938690918c8FBB0F6BDFA0C975
Content-type: multipart/alternative; 
	Boundary="1__=8FBB0F6BDFA0C9758f9e8a93df938690918c8FBB0F6BDFA0C975"


--1__=8FBB0F6BDFA0C9758f9e8a93df938690918c8FBB0F6BDFA0C975
Content-type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable


Jayashree,

Couple places where it checks for the SSH to BMC and SOL as well, that
should catch those in your HW test CI environment

Example:

https://github.com/openbmc/openbmc-test-automation/blob/master/test_lists/H=
W_CI#L2
Test_SSH_And_IPMI_Connections

https://github.com/openbmc/openbmc-test-automation/blob/master/test_lists/H=
W_CI#L4
-i Verify_Redfish_Host_PowerOn
-i Verify_Redfish_Host_PowerOff

Here SOL connection done as part of the above setup/teardown
https://github.com/openbmc/openbmc-test-automation/blob/master/redfish/syst=
ems/test_power_operations.robot#L87
https://github.com/openbmc/openbmc-test-automation/blob/master/redfish/syst=
ems/test_power_operations.robot#L95



Those tests are currently running in upstream community HW Jenkins test CI.
So it would have caught those SSH related for generic ports in general and
you can use similar in your environment.

Thanks and Regards,
   George Keishing





From:	Jayashree D <jayashree-d@hcl.com>
To:	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Cc:	George Keishing <gkeishin@in.ibm.com>, "geissonator@yahoo.com"
            <geissonator@yahoo.com>, Vijay Khemka <vijaykhemka@fb.com>,
            Konstantin Klubnichkin <kitsok@yandex-team.ru>
Date:	05-10-2020 02:09 PM
Subject:	[EXTERNAL] RE: Connection issue in OpenBMC image
Sent by:	"openbmc" <openbmc-bounces
            +gkeishin=3Din.ibm.com@lists.ozlabs.org>



Classification: HCL Internal

Regarding SSH connection, an issue has been created in openbmc and I also
see others having this same issue.
From the comments, I have run "dropbear -E -p 5022" in the target
(UART-console) and tried to connect the target using "ssh -p 5022 <ip>" and
ssh connection established.
But, reboot and systemctl commands hangs.

Issue -
https://github.com/openbmc/openbmc/issues/3701


root@tiogapass:~# dropbear -E -p 5022
[348] Jan 01 00:06:48 Failed loading /etc/dropbear/dropbear_dss_host_key
[348] Jan 01 00:06:48 Failed loading /etc/dropbear/dropbear_ecdsa_host_key
[348] Jan 01 00:06:48 Failed
loading /etc/dropbear/dropbear_ed25519_host_key
[349] Jan 01 00:06:48 Running in background

[root@odc ~]# ssh -p 5022 root@10.0.128.108 root@10.0.128.108's password:
root@tiogapass:~#

Hi George,

We are facing connection issue in accessing the target after flashing the
latest image.
In openbmc-test-automation, whether any test cases are present in CI to
identify these issues ?
Please let us know your comments on this.

Regards,
Jayashree

-----Original Message-----
From: Jayashree D
Sent: Friday, September 25, 2020 10:29 AM
To: openbmc@lists.ozlabs.org
Cc: Konstantin Klubnichkin <kitsok@yandex-team.ru>; Vijay Khemka
<vijaykhemka@fb.com>; geissonator@yahoo.com; joel@jms.id.au; Patrick
Williams <patrick@stwcx.xyz>
Subject: RE: Connection issue in OpenBMC image

Classification: HCL Internal

Hi Team,

In the latest openbmc build, after image upgradation in the target, not
able to connect the target through SSH but able to ping the IP Address.

After analysing the latest commits, reverted the below commit in the latest
build and checked by flashing the image. Now the target is connecting
through SSH. Please help us on fixing this issue.

Commit Link -
https://github.com/openbmc/openbmc/commit/635e0e4637e40ba03f69204265427550f=
d404f4c



Observation on UART-console after flashing latest image without any
changes:

1. reboot command is not working.
2. systemctl status <service_name> is not providing any status. ( Failed to
get properties: Connection timed out) 3. I tried "ssh -vvv <ip>" and logs
are attached for working and non-working image.
4. From controller, I tried to upgrade image using redfish and image is
being copied and following logs shown.
root@tiogapass:~# journalctl | grep image Jan 01 00:00:37 tiogapass
phosphor-image-updater[246]: Error in mapper GetSubTreePath Jan 01 10:43:59
tiogapass phosphor-image-updater[246]: BMC image activating - BMC reboots
are disabled.

5. Using Rest API command,

[root@odc ]# curl -k -H "X-Auth-Token: $token" -H "Content-Type:
application/json" -X PUT -d
'{"data":"xyz.openbmc_project.Software.Activation.RequestedActivations.Acti=
ve"}'

https://$%7Bbmc%7D/xyz/openbmc_project/software/a77348be/attr/RequestedActi=
vation

{
  "data": {
    "description": "org.freedesktop.DBus.Error.NoReply"
  },
  "message": "Method call timed out",
  "status": "error"
}


Regards,
Jayashree

-----Original Message-----
From: Jayashree D
Sent: Friday, September 18, 2020 3:18 PM
To: Patrick Williams <patrick@stwcx.xyz>; openbmc@lists.ozlabs.org
Cc: Konstantin Klubnichkin <kitsok@yandex-team.ru>
Subject: RE: Connection issue in OpenBMC image

Classification: HCL Internal

Hello Patrick,

I saw the post about dropbear, but that commit was updated on July16 and my
target is connecting till August last week image. I don't think that will
be an issue. Also on working image, I tried with 'ssh -vvv ' and I got
below information.

OpenSSH_7.4p1, OpenSSL 1.0.2k-fips  26 Jan 2017
debug1: Reading configuration data /etc/ssh/ssh_config
debug1: /etc/ssh/ssh_config line 58: Applying options for *
debug2: resolving "10.0.128.108" port 22
debug2: ssh_connect_direct: needpriv 0
debug1: Connecting to 10.0.128.108 [10.0.128.108] port 22.
debug1: Connection established.
debug1: permanently_set_uid: 0/0
debug1: key_load_public: No such file or directory
debug1: identity file /root/.ssh/id_rsa type -1
debug1: key_load_public: No such file or directory
debug1: identity file /root/.ssh/id_rsa-cert type -1
debug1: key_load_public: No such file or directory
debug1: identity file /root/.ssh/id_dsa type -1
debug1: key_load_public: No such file or directory
debug1: identity file /root/.ssh/id_dsa-cert type -1
debug1: key_load_public: No such file or directory
debug1: identity file /root/.ssh/id_ecdsa type -1
debug1: key_load_public: No such file or directory
debug1: identity file /root/.ssh/id_ecdsa-cert type -1
debug1: key_load_public: No such file or directory
debug1: identity file /root/.ssh/id_ed25519 type -1
debug1: key_load_public: No such file or directory
debug1: identity file /root/.ssh/id_ed25519-cert type -1
debug1: Enabling compatibility mode for protocol 2.0
debug1: Local version string SSH-2.0-OpenSSH_7.4
debug1: Remote protocol version 2.0, remote software version
dropbear_2020.80
debug1: no match: dropbear_2020.80
debug2: fd 3 setting O_NONBLOCK
debug1: Authenticating to 10.0.128.108:22 as 'root'
debug3: hostkeys_foreach: reading file "/root/.ssh/known_hosts"
debug3: record_hostkey: found key type RSA in
file /root/.ssh/known_hosts:68
debug3: load_hostkeys: loaded 1 keys from 10.0.128.108
debug3: order_hostkeyalgs: prefer hostkeyalgs:
ssh-rsa-cert-v01@openssh.com,rsa-sha2-512,rsa-sha2-256,ssh-rsa
debug3: send packet: type 20
debug1: SSH2_MSG_KEXINIT sent
debug3: receive packet: type 20
debug1: SSH2_MSG_KEXINIT received
debug2: local client KEXINIT proposal
debug2: KEX algorithms:
curve25519-sha256,curve25519-sha256@libssh.org,ecdh-sha2-nistp256,ecdh-sha2=
-nistp384,ecdh-sha2-nistp521,diffie-hellman-group-exchange-sha256,diffie-he=
llman-group16-sha512,diffie-hellman-group18-sha512,diffie-hellman-group-exc=
hange-sha1,diffie-hellman-group14-sha256,diffie-hellman-group14-sha1,diffie=
-hellman-group1-sha1,ext-info-c

debug2: host key algorithms:
ssh-rsa-cert-v01@openssh.com,rsa-sha2-512,rsa-sha2-256,ssh-rsa,ecdsa-sha2-n=
istp256-cert-v01@openssh.com,ecdsa-sha2-nistp384-cert-v01@openssh.com,ecdsa=
-sha2-nistp521-cert-v01@openssh.com,ssh-ed25519-cert-v01@openssh.com,ssh-ds=
s-cert-v01@openssh.com,ecdsa-sha2-nistp256,ecdsa-sha2-nistp384,ecdsa-sha2-n=
istp521,ssh-ed25519,ssh-dss

debug2: ciphers ctos:
chacha20-poly1305@openssh.com,aes128-ctr,aes192-ctr,aes256-ctr,aes128-gcm@o=
penssh.com,aes256-gcm@openssh.com,aes128-cbc,aes192-cbc,aes256-cbc

debug2: ciphers stoc:
chacha20-poly1305@openssh.com,aes128-ctr,aes192-ctr,aes256-ctr,aes128-gcm@o=
penssh.com,aes256-gcm@openssh.com,aes128-cbc,aes192-cbc,aes256-cbc

debug2: MACs ctos:
umac-64-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-256-etm@openssh.=
com,hmac-sha2-512-etm@openssh.com,hmac-sha1-etm@openssh.com,umac-64@openssh=
.com,umac-128@openssh.com,hmac-sha2-256,hmac-sha2-512,hmac-sha1

debug2: MACs stoc:
umac-64-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-256-etm@openssh.=
com,hmac-sha2-512-etm@openssh.com,hmac-sha1-etm@openssh.com,umac-64@openssh=
.com,umac-128@openssh.com,hmac-sha2-256,hmac-sha2-512,hmac-sha1

debug2: compression ctos: none,zlib@openssh.com,zlib
debug2: compression stoc: none,zlib@openssh.com,zlib
debug2: languages ctos:
debug2: languages stoc:
debug2: first_kex_follows 0
debug2: reserved 0
debug2: peer server KEXINIT proposal
debug2: KEX algorithms:
curve25519-sha256,curve25519-sha256@libssh.org,ecdh-sha2-nistp521,ecdh-sha2=
-nistp384,ecdh-sha2-nistp256,diffie-hellman-group14-sha256,kexguess2@matt.u=
cc.asn.au

debug2: host key algorithms: rsa-sha2-256,ssh-rsa
debug2: ciphers ctos: chacha20-poly1305@openssh.com,aes128-ctr,aes256-ctr
debug2: ciphers stoc: chacha20-poly1305@openssh.com,aes128-ctr,aes256-ctr
debug2: MACs ctos: hmac-sha1,hmac-sha2-256
debug2: MACs stoc: hmac-sha1,hmac-sha2-256
debug2: compression ctos: zlib@openssh.com,none
debug2: compression stoc: zlib@openssh.com,none
debug2: languages ctos:
debug2: languages stoc:
debug2: first_kex_follows 0
debug2: reserved 0
debug1: kex: algorithm: curve25519-sha256
debug1: kex: host key algorithm: rsa-sha2-256
debug1: kex: server->client cipher: chacha20-poly1305@openssh.com MAC:
<implicit> compression: none
debug1: kex: client->server cipher: chacha20-poly1305@openssh.com MAC:
<implicit> compression: none
debug1: kex: curve25519-sha256 need=3D64 dh_need=3D64
debug1: kex: curve25519-sha256 need=3D64 dh_need=3D64
debug3: send packet: type 30
debug1: expecting SSH2_MSG_KEX_ECDH_REPLY
debug3: receive packet: type 31
debug1: Server host key: ssh-rsa SHA256:3WwhPmIIxzrw0
+cm/0vN3hifY4kh9sJhClVNw6zrJ7Y
debug3: hostkeys_foreach: reading file "/root/.ssh/known_hosts"
debug3: record_hostkey: found key type RSA in
file /root/.ssh/known_hosts:68
debug3: load_hostkeys: loaded 1 keys from 10.0.128.108
debug1: Host '10.0.128.108' is known and matches the RSA host key.
debug1: Found key in /root/.ssh/known_hosts:68
debug3: send packet: type 21
debug2: set_newkeys: mode 1
debug1: rekey after 134217728 blocks
debug1: SSH2_MSG_NEWKEYS sent
debug1: expecting SSH2_MSG_NEWKEYS
debug3: receive packet: type 21
debug1: SSH2_MSG_NEWKEYS received
debug2: set_newkeys: mode 0
debug1: rekey after 134217728 blocks
debug2: key: /root/.ssh/id_rsa (0x558ea3ad3640), agent
debug2: key: /root/.ssh/id_rsa ((nil))
debug2: key: /root/.ssh/id_dsa ((nil))
debug2: key: /root/.ssh/id_ecdsa ((nil))
debug2: key: /root/.ssh/id_ed25519 ((nil))
debug3: send packet: type 5
debug3: receive packet: type 7
debug1: SSH2_MSG_EXT_INFO received
debug1: kex_input_ext_info:
server-sig-algs=3D<ssh-ed25519,ecdsa-sha2-nistp256,ecdsa-sha2-nistp384,ecds=
a-sha2-nistp521,rsa-sha2-256,ssh-rsa,ssh-dss>

debug3: receive packet: type 6
debug2: service_accept: ssh-userauth
debug1: SSH2_MSG_SERVICE_ACCEPT received
debug3: send packet: type 50
debug3: receive packet: type 51
debug1: Authentications that can continue: publickey,password
debug3: start over, passed a different list publickey,password
debug3: preferred
gssapi-keyex,gssapi-with-mic,publickey,keyboard-interactive,password
debug3: authmethod_lookup publickey
debug3: remaining preferred: keyboard-interactive,password
debug3: authmethod_is_enabled publickey
debug1: Next authentication method: publickey
debug1: Offering RSA public key: /root/.ssh/id_rsa
debug3: send_pubkey_test
debug3: send packet: type 50
debug2: we sent a publickey packet, wait for reply
debug3: receive packet: type 51
debug1: Authentications that can continue: publickey,password
debug1: Trying private key: /root/.ssh/id_rsa
debug3: sign_and_send_pubkey: RSA SHA256:YfteufmWUV8W7EQEycZ
+38skgUWGDTYFHw93a7SwwLM
debug3: send packet: type 50
debug2: we sent a publickey packet, wait for reply
debug3: receive packet: type 51
debug1: Authentications that can continue: publickey,password
debug1: Trying private key: /root/.ssh/id_dsa
debug3: no such identity: /root/.ssh/id_dsa: No such file or directory
debug1: Trying private key: /root/.ssh/id_ecdsa
debug3: no such identity: /root/.ssh/id_ecdsa: No such file or directory
debug1: Trying private key: /root/.ssh/id_ed25519
debug3: no such identity: /root/.ssh/id_ed25519: No such file or directory
debug2: we did not send a packet, disable method
debug3: authmethod_lookup password
debug3: remaining preferred: ,password
debug3: authmethod_is_enabled password
debug1: Next authentication method: password


In non-working image, the logs are stopped after below lines and it is not
providing any errors.

debug1: Enabling compatibility mode for protocol 2.0
debug1: Local version string SSH-2.0-OpenSSH_7.4

Also one more observation in UART-Console, after flashing latest image.

1. reboot command is not working.
2. systemctl status <service_name> is not providing any status. ( Failed to
get properties: Connection timed out) 3. I can able to ping the ip address
but scp is not working.

Thanks,
Jayashree


-----Original Message-----
From: Patrick Williams <patrick@stwcx.xyz>
Sent: Thursday, September 17, 2020 9:16 PM
To: Jayashree D <jayashree-d@hcl.com>
Cc: Konstantin Klubnichkin <kitsok@yandex-team.ru>;
openbmc@lists.ozlabs.org
Subject: Re: Connection issue in OpenBMC image

Hello Jayashree,

I saw an output `ssh -v` from you earlier, but there really wasn't any
useful information there.  It looked like the connection was being made and
keys were exchanged and then the log just stopped abruptly.  This tells me
it likely isn't a networking issue but an issue in the handshake between
the ssh-client (your computer) and ssh-server (dropbear).  You can continue
to add '-v' parameters up to `ssh -vvv` and you'll get increasingly more
information.

Joseph Reynolds recently posted a reminder about dropbear disabling weak
ciphers[1].  Is it possible that your client is using an old cipher?

On Wed, Sep 16, 2020 at 11:35:28AM +0000, Jayashree D wrote:
> root@tiogapass:~# journalctl | grep drop
...
> Jan 01 00:15:28 tiogapass systemd[1]:
dropbear@0-10.0.128.108:22-10.0.0.1:51810.service: Succeeded.
> Jan 01 00:15:44 tiogapass dropbear[2753]: Child connection from
> ::ffff:10.0.0.1:51944 Jan 01 00:15:50 tiogapass dropbear[2753]: PAM
> password auth succeeded for 'root' from ::ffff:10.0.0.1:51944

This looks like a valid connection was established.

> 15.09.2020, 16:12, "Jayashree D" <jayashree-d@hcl.com<
mailto:jayashree-d@hcl.com>>:
>
> OpenSSH_7.4p1, OpenSSL 1.0.2k-fips  26 Jan 2017
> debug1: Reading configuration data /etc/ssh/ssh_config
> debug1: /etc/ssh/ssh_config line 58: Applying options for *
> debug1: Connecting to 10.0.128.108 [10.0.128.108] port 22.
> debug1: Connection established.
> debug1: permanently_set_uid: 0/0
> debug1: key_load_public: No such file or directory
> debug1: identity file /root/.ssh/id_rsa type -1
> debug1: key_load_public: No such file or directory
> debug1: identity file /root/.ssh/id_rsa-cert type -1
> debug1: key_load_public: No such file or directory
> debug1: identity file /root/.ssh/id_dsa type -1
> debug1: key_load_public: No such file or directory
> debug1: identity file /root/.ssh/id_dsa-cert type -1
> debug1: key_load_public: No such file or directory
> debug1: identity file /root/.ssh/id_ecdsa type -1
> debug1: key_load_public: No such file or directory
> debug1: identity file /root/.ssh/id_ecdsa-cert type -1
> debug1: key_load_public: No such file or directory
> debug1: identity file /root/.ssh/id_ed25519 type -1
> debug1: key_load_public: No such file or directory
> debug1: identity file /root/.ssh/id_ed25519-cert type -1
> debug1: Enabling compatibility mode for protocol 2.0
> debug1: Local version string SSH-2.0-OpenSSH_7.4

This is the log that also looks like a good connection.  Identity files
were attempted to be exchanged.  Version strings were exchanged.  And then
the log just abruptly stops.  Was the connection dropped?  Is it hung?

1.
https://lists.ozlabs.org/pipermail/openbmc/2020-September/023071.html


--
Patrick Williams
::DISCLAIMER::
________________________________
The contents of this e-mail and any attachment(s) are confidential and
intended for the named recipient(s) only. E-mail transmission is not
guaranteed to be secure or error-free as information could be intercepted,
corrupted, lost, destroyed, arrive late or incomplete, or may contain
viruses in transmission. The e mail and its contents (with or without
referred errors) shall therefore not attach any liability on the originator
or HCL or its affiliates. Views or opinions, if any, presented in this
email are solely those of the author and may not necessarily reflect the
views or opinions of HCL or its affiliates. Any form of reproduction,
dissemination, copying, disclosure, modification, distribution and / or
publication of this message without the prior written consent of authorized
representative of HCL is strictly prohibited. If you have received this
email in error please delete it and notify the sender immediately. Before
opening any email and/or attachments, please check them for viruses and
other defects.
________________________________




--1__=8FBB0F6BDFA0C9758f9e8a93df938690918c8FBB0F6BDFA0C975
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

<html><body><p><font size=3D"2">Jayashree,</font><br><br><font size=3D"2">C=
ouple places where it checks for the SSH to BMC and SOL as well, that shoul=
d catch those in your HW test CI environment</font><br><br><font size=3D"2"=
>Example:</font><br><br><a href=3D"https://github.com/openbmc/openbmc-test-=
automation/blob/master/test_lists/HW_CI#L2"><font size=3D"2">https://github=
.com/openbmc/openbmc-test-automation/blob/master/test_lists/HW_CI#L2</font>=
</a><br><font color=3D"#24292E" face=3D"Consolas">Test_SSH_And_IPMI_Connect=
ions</font> <br><br><a href=3D"https://github.com/openbmc/openbmc-test-auto=
mation/blob/master/test_lists/HW_CI#L4"><font size=3D"2">https://github.com=
/openbmc/openbmc-test-automation/blob/master/test_lists/HW_CI#L4</font></a>=
<br><font color=3D"#24292E" face=3D"Consolas">-i Verify_Redfish_Host_PowerO=
n</font> <br><font color=3D"#24292E" face=3D"Consolas">-i Verify_Redfish_Ho=
st_PowerOff</font> <br><font size=3D"2"><br>Here SOL connection done as par=
t of the above setup/teardown<br></font><a href=3D"https://github.com/openb=
mc/openbmc-test-automation/blob/master/redfish/systems/test_power_operation=
s.robot#L87"><font size=3D"2">https://github.com/openbmc/openbmc-test-autom=
ation/blob/master/redfish/systems/test_power_operations.robot#L87</font></a=
><br><a href=3D"https://github.com/openbmc/openbmc-test-automation/blob/mas=
ter/redfish/systems/test_power_operations.robot#L95"><font size=3D"2">https=
://github.com/openbmc/openbmc-test-automation/blob/master/redfish/systems/t=
est_power_operations.robot#L95</font></a><font size=3D"2"><br><br></font><b=
r><font size=3D"2">Those tests are currently running in upstream community =
HW Jenkins test CI. So it would have caught those SSH related for generic p=
orts in general and you can use similar in your environment.</font><br><br>=
<b><font size=3D"2" color=3D"#0000FF">Thanks and Regards,</font></b><br><fo=
nt size=3D"2" color=3D"#0000FF">   George Keishing</font><br><font size=3D"=
2" color=3D"#0000FF"> </font><br><br><br><img width=3D"16" height=3D"16" sr=
c=3D"cid:1__=3D8FBB0F6BDFA0C9758f9e8a93df938690918c8FB@" border=3D"0" alt=
=3D"Inactive hide details for Jayashree D ---05-10-2020 02:09:58 PM---Class=
ification: HCL Internal Regarding SSH connection, an iss"><font size=3D"2" =
color=3D"#424282">Jayashree D ---05-10-2020 02:09:58 PM---Classification: H=
CL Internal Regarding SSH connection, an issue has been created in openbmc =
and I al</font><br><br><font size=3D"2" color=3D"#5F5F5F">From:        </fo=
nt><font size=3D"2">Jayashree D &lt;jayashree-d@hcl.com&gt;</font><br><font=
 size=3D"2" color=3D"#5F5F5F">To:        </font><font size=3D"2">&quot;open=
bmc@lists.ozlabs.org&quot; &lt;openbmc@lists.ozlabs.org&gt;</font><br><font=
 size=3D"2" color=3D"#5F5F5F">Cc:        </font><font size=3D"2">George Kei=
shing &lt;gkeishin@in.ibm.com&gt;, &quot;geissonator@yahoo.com&quot; &lt;ge=
issonator@yahoo.com&gt;, Vijay Khemka &lt;vijaykhemka@fb.com&gt;, Konstanti=
n Klubnichkin &lt;kitsok@yandex-team.ru&gt;</font><br><font size=3D"2" colo=
r=3D"#5F5F5F">Date:        </font><font size=3D"2">05-10-2020 02:09 PM</fon=
t><br><font size=3D"2" color=3D"#5F5F5F">Subject:        </font><font size=
=3D"2">[EXTERNAL] RE: Connection issue in OpenBMC image</font><br><font siz=
e=3D"2" color=3D"#5F5F5F">Sent by:        </font><font size=3D"2">&quot;ope=
nbmc&quot; &lt;openbmc-bounces+gkeishin=3Din.ibm.com@lists.ozlabs.org&gt;</=
font><br><hr width=3D"100%" size=3D"2" align=3D"left" noshade style=3D"colo=
r:#8091A5; "><br><br><br><tt><font size=3D"2">Classification: HCL Internal<=
br><br>Regarding SSH connection, an issue has been created in openbmc and I=
 also see others having this same issue.<br>From the comments, I have run &=
quot;dropbear -E -p 5022&quot; in the target (UART-console) and tried to co=
nnect the target using &quot;ssh -p 5022 &lt;ip&gt;&quot; and ssh connectio=
n established.<br>But, reboot and systemctl commands hangs.<br><br>Issue - =
</font></tt><tt><font size=3D"2"><a href=3D"https://github.com/openbmc/open=
bmc/issues/3701">https://github.com/openbmc/openbmc/issues/3701</a></font><=
/tt><tt><font size=3D"2">&nbsp;<br><br>root@tiogapass:~# dropbear -E -p 502=
2<br>[348] Jan 01 00:06:48 Failed loading /etc/dropbear/dropbear_dss_host_k=
ey<br>[348] Jan 01 00:06:48 Failed loading /etc/dropbear/dropbear_ecdsa_hos=
t_key<br>[348] Jan 01 00:06:48 Failed loading /etc/dropbear/dropbear_ed2551=
9_host_key<br>[349] Jan 01 00:06:48 Running in background<br><br>[root@odc =
~]# ssh -p 5022 root@10.0.128.108 root@10.0.128.108's password:<br>root@tio=
gapass:~#<br><br>Hi George,<br><br>We are facing connection issue in access=
ing the target after flashing the latest image.<br>In openbmc-test-automati=
on, whether any test cases are present in CI to identify these issues ?<br>=
Please let us know your comments on this.<br><br>Regards,<br>Jayashree<br><=
br>-----Original Message-----<br>From: Jayashree D<br>Sent: Friday, Septemb=
er 25, 2020 10:29 AM<br>To: openbmc@lists.ozlabs.org<br>Cc: Konstantin Klub=
nichkin &lt;kitsok@yandex-team.ru&gt;; Vijay Khemka &lt;vijaykhemka@fb.com&=
gt;; geissonator@yahoo.com; joel@jms.id.au; Patrick Williams &lt;patrick@st=
wcx.xyz&gt;<br>Subject: RE: Connection issue in OpenBMC image<br><br>Classi=
fication: HCL Internal<br><br>Hi Team,<br><br>In the latest openbmc build, =
after image upgradation in the target, not able to connect the target throu=
gh SSH but able to ping the IP Address.<br><br>After analysing the latest c=
ommits, reverted the below commit in the latest build and checked by flashi=
ng the image. Now the target is connecting through SSH. Please help us on f=
ixing this issue.<br><br>Commit Link - </font></tt><tt><font size=3D"2"><a =
href=3D"https://github.com/openbmc/openbmc/commit/635e0e4637e40ba03f6920426=
5427550fd404f4c">https://github.com/openbmc/openbmc/commit/635e0e4637e40ba0=
3f69204265427550fd404f4c</a></font></tt><tt><font size=3D"2">&nbsp;<br><br>=
<br>Observation on UART-console after flashing latest image without any cha=
nges:<br><br>1. reboot command is not working.<br>2. systemctl status &lt;s=
ervice_name&gt; is not providing any status. ( Failed to get properties: Co=
nnection timed out) 3. I tried &quot;ssh -vvv &lt;ip&gt;&quot; and logs are=
 attached for working and non-working image.<br>4. From controller, I tried=
 to upgrade image using redfish and image is being copied and following log=
s shown.<br>root@tiogapass:~# journalctl | grep image Jan 01 00:00:37 tioga=
pass phosphor-image-updater[246]: Error in mapper GetSubTreePath Jan 01 10:=
43:59 tiogapass phosphor-image-updater[246]: BMC image activating - BMC reb=
oots are disabled.<br><br>5. Using Rest API command,<br><br>[root@odc ]# cu=
rl -k -H &quot;X-Auth-Token: $token&quot; -H &quot;Content-Type: applicatio=
n/json&quot; -X PUT -d '{&quot;data&quot;:&quot;xyz.openbmc_project.Softwar=
e.Activation.RequestedActivations.Active&quot;}' </font></tt><tt><font size=
=3D"2"><a href=3D"https://$%7Bbmc%7D/xyz/openbmc_project/software/a77348be/=
attr/RequestedActivation">https://$%7Bbmc%7D/xyz/openbmc_project/software/a=
77348be/attr/RequestedActivation</a></font></tt><tt><font size=3D"2">&nbsp;=
<br>{<br> &nbsp;&quot;data&quot;: {<br> &nbsp; &nbsp;&quot;description&quot=
;: &quot;org.freedesktop.DBus.Error.NoReply&quot;<br> &nbsp;},<br> &nbsp;&q=
uot;message&quot;: &quot;Method call timed out&quot;,<br> &nbsp;&quot;statu=
s&quot;: &quot;error&quot;<br>}<br><br><br>Regards,<br>Jayashree<br><br>---=
--Original Message-----<br>From: Jayashree D<br>Sent: Friday, September 18,=
 2020 3:18 PM<br>To: Patrick Williams &lt;patrick@stwcx.xyz&gt;; openbmc@li=
sts.ozlabs.org<br>Cc: Konstantin Klubnichkin &lt;kitsok@yandex-team.ru&gt;<=
br>Subject: RE: Connection issue in OpenBMC image<br><br>Classification: HC=
L Internal<br><br>Hello Patrick,<br><br>I saw the post about dropbear, but =
that commit was updated on July16 and my target is connecting till August l=
ast week image. I don't think that will be an issue. Also on working image,=
 I tried with 'ssh -vvv ' and I got below information.<br><br>OpenSSH_7.4p1=
, OpenSSL 1.0.2k-fips &nbsp;26 Jan 2017<br>debug1: Reading configuration da=
ta /etc/ssh/ssh_config<br>debug1: /etc/ssh/ssh_config line 58: Applying opt=
ions for *<br>debug2: resolving &quot;10.0.128.108&quot; port 22<br>debug2:=
 ssh_connect_direct: needpriv 0<br>debug1: Connecting to 10.0.128.108 [10.0=
.128.108] port 22.<br>debug1: Connection established.<br>debug1: permanentl=
y_set_uid: 0/0<br>debug1: key_load_public: No such file or directory<br>deb=
ug1: identity file /root/.ssh/id_rsa type -1<br>debug1: key_load_public: No=
 such file or directory<br>debug1: identity file /root/.ssh/id_rsa-cert typ=
e -1<br>debug1: key_load_public: No such file or directory<br>debug1: ident=
ity file /root/.ssh/id_dsa type -1<br>debug1: key_load_public: No such file=
 or directory<br>debug1: identity file /root/.ssh/id_dsa-cert type -1<br>de=
bug1: key_load_public: No such file or directory<br>debug1: identity file /=
root/.ssh/id_ecdsa type -1<br>debug1: key_load_public: No such file or dire=
ctory<br>debug1: identity file /root/.ssh/id_ecdsa-cert type -1<br>debug1: =
key_load_public: No such file or directory<br>debug1: identity file /root/.=
ssh/id_ed25519 type -1<br>debug1: key_load_public: No such file or director=
y<br>debug1: identity file /root/.ssh/id_ed25519-cert type -1<br>debug1: En=
abling compatibility mode for protocol 2.0<br>debug1: Local version string =
SSH-2.0-OpenSSH_7.4<br>debug1: Remote protocol version 2.0, remote software=
 version dropbear_2020.80<br>debug1: no match: dropbear_2020.80<br>debug2: =
fd 3 setting O_NONBLOCK<br>debug1: Authenticating to 10.0.128.108:22 as 'ro=
ot'<br>debug3: hostkeys_foreach: reading file &quot;/root/.ssh/known_hosts&=
quot;<br>debug3: record_hostkey: found key type RSA in file /root/.ssh/know=
n_hosts:68<br>debug3: load_hostkeys: loaded 1 keys from 10.0.128.108<br>deb=
ug3: order_hostkeyalgs: prefer hostkeyalgs: ssh-rsa-cert-v01@openssh.com,rs=
a-sha2-512,rsa-sha2-256,ssh-rsa<br>debug3: send packet: type 20<br>debug1: =
SSH2_MSG_KEXINIT sent<br>debug3: receive packet: type 20<br>debug1: SSH2_MS=
G_KEXINIT received<br>debug2: local client KEXINIT proposal<br>debug2: KEX =
algorithms: curve25519-sha256,curve25519-sha256@libssh.org,ecdh-sha2-nistp2=
56,ecdh-sha2-nistp384,ecdh-sha2-nistp521,diffie-hellman-group-exchange-sha2=
56,diffie-hellman-group16-sha512,diffie-hellman-group18-sha512,diffie-hellm=
an-group-exchange-sha1,diffie-hellman-group14-sha256,diffie-hellman-group14=
-sha1,diffie-hellman-group1-sha1,ext-info-c<br>debug2: host key algorithms:=
 ssh-rsa-cert-v01@openssh.com,rsa-sha2-512,rsa-sha2-256,ssh-rsa,ecdsa-sha2-=
nistp256-cert-v01@openssh.com,ecdsa-sha2-nistp384-cert-v01@openssh.com,ecds=
a-sha2-nistp521-cert-v01@openssh.com,ssh-ed25519-cert-v01@openssh.com,ssh-d=
ss-cert-v01@openssh.com,ecdsa-sha2-nistp256,ecdsa-sha2-nistp384,ecdsa-sha2-=
nistp521,ssh-ed25519,ssh-dss<br>debug2: ciphers ctos: chacha20-poly1305@ope=
nssh.com,aes128-ctr,aes192-ctr,aes256-ctr,aes128-gcm@openssh.com,aes256-gcm=
@openssh.com,aes128-cbc,aes192-cbc,aes256-cbc<br>debug2: ciphers stoc: chac=
ha20-poly1305@openssh.com,aes128-ctr,aes192-ctr,aes256-ctr,aes128-gcm@opens=
sh.com,aes256-gcm@openssh.com,aes128-cbc,aes192-cbc,aes256-cbc<br>debug2: M=
ACs ctos: umac-64-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-256-et=
m@openssh.com,hmac-sha2-512-etm@openssh.com,hmac-sha1-etm@openssh.com,umac-=
64@openssh.com,umac-128@openssh.com,hmac-sha2-256,hmac-sha2-512,hmac-sha1<b=
r>debug2: MACs stoc: umac-64-etm@openssh.com,umac-128-etm@openssh.com,hmac-=
sha2-256-etm@openssh.com,hmac-sha2-512-etm@openssh.com,hmac-sha1-etm@openss=
h.com,umac-64@openssh.com,umac-128@openssh.com,hmac-sha2-256,hmac-sha2-512,=
hmac-sha1<br>debug2: compression ctos: none,zlib@openssh.com,zlib<br>debug2=
: compression stoc: none,zlib@openssh.com,zlib<br>debug2: languages ctos:<b=
r>debug2: languages stoc:<br>debug2: first_kex_follows 0<br>debug2: reserve=
d 0<br>debug2: peer server KEXINIT proposal<br>debug2: KEX algorithms: curv=
e25519-sha256,curve25519-sha256@libssh.org,ecdh-sha2-nistp521,ecdh-sha2-nis=
tp384,ecdh-sha2-nistp256,diffie-hellman-group14-sha256,kexguess2@matt.ucc.a=
sn.au<br>debug2: host key algorithms: rsa-sha2-256,ssh-rsa<br>debug2: ciphe=
rs ctos: chacha20-poly1305@openssh.com,aes128-ctr,aes256-ctr<br>debug2: cip=
hers stoc: chacha20-poly1305@openssh.com,aes128-ctr,aes256-ctr<br>debug2: M=
ACs ctos: hmac-sha1,hmac-sha2-256<br>debug2: MACs stoc: hmac-sha1,hmac-sha2=
-256<br>debug2: compression ctos: zlib@openssh.com,none<br>debug2: compress=
ion stoc: zlib@openssh.com,none<br>debug2: languages ctos:<br>debug2: langu=
ages stoc:<br>debug2: first_kex_follows 0<br>debug2: reserved 0<br>debug1: =
kex: algorithm: curve25519-sha256<br>debug1: kex: host key algorithm: rsa-s=
ha2-256<br>debug1: kex: server-&gt;client cipher: chacha20-poly1305@openssh=
.com MAC: &lt;implicit&gt; compression: none<br>debug1: kex: client-&gt;ser=
ver cipher: chacha20-poly1305@openssh.com MAC: &lt;implicit&gt; compression=
: none<br>debug1: kex: curve25519-sha256 need=3D64 dh_need=3D64<br>debug1: =
kex: curve25519-sha256 need=3D64 dh_need=3D64<br>debug3: send packet: type =
30<br>debug1: expecting SSH2_MSG_KEX_ECDH_REPLY<br>debug3: receive packet: =
type 31<br>debug1: Server host key: ssh-rsa SHA256:3WwhPmIIxzrw0+cm/0vN3hif=
Y4kh9sJhClVNw6zrJ7Y<br>debug3: hostkeys_foreach: reading file &quot;/root/.=
ssh/known_hosts&quot;<br>debug3: record_hostkey: found key type RSA in file=
 /root/.ssh/known_hosts:68<br>debug3: load_hostkeys: loaded 1 keys from 10.=
0.128.108<br>debug1: Host '10.0.128.108' is known and matches the RSA host =
key.<br>debug1: Found key in /root/.ssh/known_hosts:68<br>debug3: send pack=
et: type 21<br>debug2: set_newkeys: mode 1<br>debug1: rekey after 134217728=
 blocks<br>debug1: SSH2_MSG_NEWKEYS sent<br>debug1: expecting SSH2_MSG_NEWK=
EYS<br>debug3: receive packet: type 21<br>debug1: SSH2_MSG_NEWKEYS received=
<br>debug2: set_newkeys: mode 0<br>debug1: rekey after 134217728 blocks<br>=
debug2: key: /root/.ssh/id_rsa (0x558ea3ad3640), agent<br>debug2: key: /roo=
t/.ssh/id_rsa ((nil))<br>debug2: key: /root/.ssh/id_dsa ((nil))<br>debug2: =
key: /root/.ssh/id_ecdsa ((nil))<br>debug2: key: /root/.ssh/id_ed25519 ((ni=
l))<br>debug3: send packet: type 5<br>debug3: receive packet: type 7<br>deb=
ug1: SSH2_MSG_EXT_INFO received<br>debug1: kex_input_ext_info: server-sig-a=
lgs=3D&lt;ssh-ed25519,ecdsa-sha2-nistp256,ecdsa-sha2-nistp384,ecdsa-sha2-ni=
stp521,rsa-sha2-256,ssh-rsa,ssh-dss&gt;<br>debug3: receive packet: type 6<b=
r>debug2: service_accept: ssh-userauth<br>debug1: SSH2_MSG_SERVICE_ACCEPT r=
eceived<br>debug3: send packet: type 50<br>debug3: receive packet: type 51<=
br>debug1: Authentications that can continue: publickey,password<br>debug3:=
 start over, passed a different list publickey,password<br>debug3: preferre=
d gssapi-keyex,gssapi-with-mic,publickey,keyboard-interactive,password<br>d=
ebug3: authmethod_lookup publickey<br>debug3: remaining preferred: keyboard=
-interactive,password<br>debug3: authmethod_is_enabled publickey<br>debug1:=
 Next authentication method: publickey<br>debug1: Offering RSA public key: =
/root/.ssh/id_rsa<br>debug3: send_pubkey_test<br>debug3: send packet: type =
50<br>debug2: we sent a publickey packet, wait for reply<br>debug3: receive=
 packet: type 51<br>debug1: Authentications that can continue: publickey,pa=
ssword<br>debug1: Trying private key: /root/.ssh/id_rsa<br>debug3: sign_and=
_send_pubkey: RSA SHA256:YfteufmWUV8W7EQEycZ+38skgUWGDTYFHw93a7SwwLM<br>deb=
ug3: send packet: type 50<br>debug2: we sent a publickey packet, wait for r=
eply<br>debug3: receive packet: type 51<br>debug1: Authentications that can=
 continue: publickey,password<br>debug1: Trying private key: /root/.ssh/id_=
dsa<br>debug3: no such identity: /root/.ssh/id_dsa: No such file or directo=
ry<br>debug1: Trying private key: /root/.ssh/id_ecdsa<br>debug3: no such id=
entity: /root/.ssh/id_ecdsa: No such file or directory<br>debug1: Trying pr=
ivate key: /root/.ssh/id_ed25519<br>debug3: no such identity: /root/.ssh/id=
_ed25519: No such file or directory<br>debug2: we did not send a packet, di=
sable method<br>debug3: authmethod_lookup password<br>debug3: remaining pre=
ferred: ,password<br>debug3: authmethod_is_enabled password<br>debug1: Next=
 authentication method: password<br><br><br>In non-working image, the logs =
are stopped after below lines and it is not providing any errors.<br><br>de=
bug1: Enabling compatibility mode for protocol 2.0<br>debug1: Local version=
 string SSH-2.0-OpenSSH_7.4<br><br>Also one more observation in UART-Consol=
e, after flashing latest image.<br><br>1. reboot command is not working.<br=
>2. systemctl status &lt;service_name&gt; is not providing any status. ( Fa=
iled to get properties: Connection timed out) 3. I can able to ping the ip =
address but scp is not working.<br><br>Thanks,<br>Jayashree<br><br><br>----=
-Original Message-----<br>From: Patrick Williams &lt;patrick@stwcx.xyz&gt;<=
br>Sent: Thursday, September 17, 2020 9:16 PM<br>To: Jayashree D &lt;jayash=
ree-d@hcl.com&gt;<br>Cc: Konstantin Klubnichkin &lt;kitsok@yandex-team.ru&g=
t;; openbmc@lists.ozlabs.org<br>Subject: Re: Connection issue in OpenBMC im=
age<br><br>Hello Jayashree,<br><br>I saw an output `ssh -v` from you earlie=
r, but there really wasn't any useful information there. &nbsp;It looked li=
ke the connection was being made and keys were exchanged and then the log j=
ust stopped abruptly. &nbsp;This tells me it likely isn't a networking issu=
e but an issue in the handshake between the ssh-client (your computer) and =
ssh-server (dropbear). &nbsp;You can continue to add '-v' parameters up to =
`ssh -vvv` and you'll get increasingly more information.<br><br>Joseph Reyn=
olds recently posted a reminder about dropbear disabling weak ciphers[1]. &=
nbsp;Is it possible that your client is using an old cipher?<br><br>On Wed,=
 Sep 16, 2020 at 11:35:28AM +0000, Jayashree D wrote:<br>&gt; root@tiogapas=
s:~# journalctl | grep drop<br>...<br>&gt; Jan 01 00:15:28 tiogapass system=
d[1]: dropbear@0-10.0.128.108:22-10.0.0.1:51810.service: Succeeded.<br>&gt;=
 Jan 01 00:15:44 tiogapass dropbear[2753]: Child connection from<br>&gt; ::=
ffff:10.0.0.1:51944 Jan 01 00:15:50 tiogapass dropbear[2753]: PAM<br>&gt; p=
assword auth succeeded for 'root' from ::ffff:10.0.0.1:51944<br><br>This lo=
oks like a valid connection was established.<br><br>&gt; 15.09.2020, 16:12,=
 &quot;Jayashree D&quot; &lt;jayashree-d@hcl.com&lt;</font></tt><tt><font s=
ize=3D"2"><a href=3D"mailto:jayashree-d@hcl.com">mailto:jayashree-d@hcl.com=
</a></font></tt><tt><font size=3D"2">&gt;&gt;:<br>&gt;<br>&gt; OpenSSH_7.4p=
1, OpenSSL 1.0.2k-fips &nbsp;26 Jan 2017<br>&gt; debug1: Reading configurat=
ion data /etc/ssh/ssh_config<br>&gt; debug1: /etc/ssh/ssh_config line 58: A=
pplying options for *<br>&gt; debug1: Connecting to 10.0.128.108 [10.0.128.=
108] port 22.<br>&gt; debug1: Connection established.<br>&gt; debug1: perma=
nently_set_uid: 0/0<br>&gt; debug1: key_load_public: No such file or direct=
ory<br>&gt; debug1: identity file /root/.ssh/id_rsa type -1<br>&gt; debug1:=
 key_load_public: No such file or directory<br>&gt; debug1: identity file /=
root/.ssh/id_rsa-cert type -1<br>&gt; debug1: key_load_public: No such file=
 or directory<br>&gt; debug1: identity file /root/.ssh/id_dsa type -1<br>&g=
t; debug1: key_load_public: No such file or directory<br>&gt; debug1: ident=
ity file /root/.ssh/id_dsa-cert type -1<br>&gt; debug1: key_load_public: No=
 such file or directory<br>&gt; debug1: identity file /root/.ssh/id_ecdsa t=
ype -1<br>&gt; debug1: key_load_public: No such file or directory<br>&gt; d=
ebug1: identity file /root/.ssh/id_ecdsa-cert type -1<br>&gt; debug1: key_l=
oad_public: No such file or directory<br>&gt; debug1: identity file /root/.=
ssh/id_ed25519 type -1<br>&gt; debug1: key_load_public: No such file or dir=
ectory<br>&gt; debug1: identity file /root/.ssh/id_ed25519-cert type -1<br>=
&gt; debug1: Enabling compatibility mode for protocol 2.0<br>&gt; debug1: L=
ocal version string SSH-2.0-OpenSSH_7.4<br><br>This is the log that also lo=
oks like a good connection. &nbsp;Identity files were attempted to be excha=
nged. &nbsp;Version strings were exchanged. &nbsp;And then the log just abr=
uptly stops. &nbsp;Was the connection dropped? &nbsp;Is it hung?<br><br>1. =
</font></tt><tt><font size=3D"2"><a href=3D"https://lists.ozlabs.org/piperm=
ail/openbmc/2020-September/023071.html">https://lists.ozlabs.org/pipermail/=
openbmc/2020-September/023071.html</a></font></tt><tt><font size=3D"2">&nbs=
p;<br><br>--<br>Patrick Williams<br>::DISCLAIMER::<br>_____________________=
___________<br>The contents of this e-mail and any attachment(s) are confid=
ential and intended for the named recipient(s) only. E-mail transmission is=
 not guaranteed to be secure or error-free as information could be intercep=
ted, corrupted, lost, destroyed, arrive late or incomplete, or may contain =
viruses in transmission. The e mail and its contents (with or without refer=
red errors) shall therefore not attach any liability on the originator or H=
CL or its affiliates. Views or opinions, if any, presented in this email ar=
e solely those of the author and may not necessarily reflect the views or o=
pinions of HCL or its affiliates. Any form of reproduction, dissemination, =
copying, disclosure, modification, distribution and / or publication of thi=
s message without the prior written consent of authorized representative of=
 HCL is strictly prohibited. If you have received this email in error pleas=
e delete it and notify the sender immediately. Before opening any email and=
/or attachments, please check them for viruses and other defects.<br>______=
__________________________<br><br></font></tt><br><br><BR>
</body></html>

--1__=8FBB0F6BDFA0C9758f9e8a93df938690918c8FBB0F6BDFA0C975--


--0__=8FBB0F6BDFA0C9758f9e8a93df938690918c8FBB0F6BDFA0C975
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <1__=8FBB0F6BDFA0C9758f9e8a93df938690918c8FB@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=8FBB0F6BDFA0C9758f9e8a93df938690918c8FBB0F6BDFA0C975--

