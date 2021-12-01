Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0A7465562
	for <lists+openbmc@lfdr.de>; Wed,  1 Dec 2021 19:26:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J46xN6TxDz30RC
	for <lists+openbmc@lfdr.de>; Thu,  2 Dec 2021 05:26:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ol4kXpTg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::433;
 helo=mail-wr1-x433.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=ol4kXpTg; dkim-atps=neutral
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J46wz01syz305K
 for <openbmc@lists.ozlabs.org>; Thu,  2 Dec 2021 05:26:26 +1100 (AEDT)
Received: by mail-wr1-x433.google.com with SMTP id v11so54321606wrw.10
 for <openbmc@lists.ozlabs.org>; Wed, 01 Dec 2021 10:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Dd7KadqX+tV7DYZHZAYw829X2D5lrtk6BlS8D2Br1+0=;
 b=ol4kXpTgUUpaR/Vxj61f3PLbbykfQCCFHJR4Ig/zeG62y147MNS1uN+GDmVaLSkes7
 rvoofQi89ijNZq4DJfnS9nIxFX9mc7wDSMPGk9n0Z8zVa8Ux+ZcwT5GHstyi1MkYCqdt
 hpIx/r8MM9s6ES47Kg5MDWWj2bspwmnxdlXv5UBT8sOg0CxK0fQv6sMNtPc+2syMx4B9
 HJsnWgyMSIKcKm4IrmofZRkvcT2apFgBhc24kYcGJASAl+CJiGsTwpfIsvSpWE35iouu
 yUkCLbe0y9qNvuTC/F+TAhNt8DVmj7HoogMwwZCp2IEqwbYs8AyehD9l1+FNtc3HsbA6
 4CPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Dd7KadqX+tV7DYZHZAYw829X2D5lrtk6BlS8D2Br1+0=;
 b=r7UqQO2xdncGzD8+8A7EqKloPupFUb8kgqmn031r5HTGyS0aejvaj5BkXVVFxUf5XF
 kpw/n1VSmpuic5DxfPyMn3NoKx2w90wx1mTVGOTLvRQvByfrFKnw77R0GB8hSUcEaSnN
 ShlIEDOIlbBMHsJ1thwumVYrDcW8npg6G28rij6tbLvirZI0y81CM7hdt1maTKwIFziz
 6MrPTI2eHUKT4/NRErDCr9Lw0KVaTEHS/Q0Pzg16jXvlF8AnJPvUgPgVKTAdzK1GI07N
 8VNYUSO2P26Od9b2VMV/eSppKd/GrWNkDSZS3vLrvjSUpouA8vPwFQINGeRXfLwHZl6k
 RKog==
X-Gm-Message-State: AOAM531zWsXX13HfMaHM7jUqkHFBnwjfC9Ys5JSCyVpOHcyGnZd/1uBS
 p1dKB+R0Q9WOBsVHIgHaTbS4J/qv50sHMp9meC/Ukf4BvFw+uA==
X-Google-Smtp-Source: ABdhPJwTw84zI/0m4JchW/6JeXyJYWWQcnbI4ibN+nPhcEx1MQAWcU5mb9UmN5ABvNYPgBl9EQFrXk66d69S/Mi50TM=
X-Received: by 2002:adf:a489:: with SMTP id g9mr8435713wrb.235.1638383182303; 
 Wed, 01 Dec 2021 10:26:22 -0800 (PST)
MIME-Version: 1.0
References: <ME3PR01MB80818C6B3280A804A2ECD63FC9689@ME3PR01MB8081.ausprd01.prod.outlook.com>
In-Reply-To: <ME3PR01MB80818C6B3280A804A2ECD63FC9689@ME3PR01MB8081.ausprd01.prod.outlook.com>
From: Ed Tanous <edtanous@google.com>
Date: Wed, 1 Dec 2021 10:26:11 -0800
Message-ID: <CAH2-KxD-3RQNW0ewRKDFq7zvD9UvQjXQvTnLpjiXf9nvQQNn9Q@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=22unauthorized=E2=80=9D_error_reported_when_access_web_?=
 =?UTF-8?Q?server?=
To: Tan Dehui <dehuitan1988@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Nov 30, 2021 at 5:29 PM Tan Dehui <dehuitan1988@hotmail.com> wrote:
>
> An =E2=80=9Cunauthorized=E2=80=9D error was reported when I accessed the =
Web server through the browser.

95% of the time when this is reported, it's because you didn't install
a webui on your system.  bmcweb doesn't include one by default.

>  The logs is attached below.
>
> By capturing network data, I found that no more messages are sent after t=
he Web Server and Web Client send Hello messages to each other.
>
> Further, through debugging I suspect that the authentication algorithm mi=
ght be a bit of a problem.
>
>
>
> LOG:
>
> =E2=80=A6
>
> Feb 12 17:17:36 zcu102-zynqmp systemd[1]: Starting Phosphor User Manager.=
..
>
> Feb 12 17:17:36 zcu102-zynqmp systemd[1]: Started Phosphor sysfs LED cont=
roller.
>
> Feb 12 17:17:36 zcu102-zynqmp systemd[1]: Started Phosphor sysfs LED cont=
roller.
>
> Feb 12 17:17:36 zcu102-zynqmp nslcd[354]: [8b4567] <group=3D"priv-noacces=
s"> failed to bind to LDAP server ldap://127.0.0.1/: Can't contact LDAP ser=
ver: Transport endpoint is not connected
>
> Feb 12 17:17:36 zcu102-zynqmp nslcd[354]: [8b4567] <group=3D"priv-noacces=
s"> no available LDAP server found, sleeping 1 seconds
>
> Feb 12 17:17:36 zcu102-zynqmp systemd[1]: Finished Load/Save Random Seed.
>
> Feb 12 17:17:36 zcu102-zynqmp bmcweb[336]: Checking certs in file /etc/ss=
l/certs/https/server.pem
>
> Feb 12 17:17:36 zcu102-zynqmp bmcweb[336]: Error in verifying signature, =
regenerating
>
> Feb 12 17:17:36 zcu102-zynqmp bmcweb[336]: Generating new keys
>
> Feb 12 17:17:36 zcu102-zynqmp bmcweb[336]: Generating EC key
>
> Feb 12 17:17:36 zcu102-zynqmp systemd[1]: Started Name Service Cache Daem=
on.
>
> Feb 12 17:17:36 zcu102-zynqmp bmcweb[336]: Generating x509 Certificate
>
> Feb 12 17:17:36 zcu102-zynqmp systemd[1]: Started LDAP daemon.
>
> Feb 12 17:17:36 zcu102-zynqmp systemd[1]: obmc-phosphor-sysd.service: Mai=
n process exited, code=3Dexited, status=3D1/FAILURE
>
> Feb 12 17:17:36 zcu102-zynqmp systemd[1]: obmc-phosphor-sysd.service: Fai=
led with result 'exit-code'.
>
> Feb 12 17:17:36 zcu102-zynqmp systemd[1]: Started OpenBMC ipKVM daemon.
>
> Feb 12 17:17:36 zcu102-zynqmp systemd[1]: Finished Permit User Sessions.
>
> Feb 12 17:17:36 zcu102-zynqmp systemd[1]: Started Phosphor Log Manager.
>
> Feb 12 17:17:36 zcu102-zynqmp avahi-daemon[394]: Found user 'avahi' (UID =
998) and group 'avahi' (GID 998).
>
> Feb 12 17:17:36 zcu102-zynqmp nslcd[354]: [7b23c6] <group/member=3D"avahi=
"> failed to bind to LDAP server ldap://127.0.0.1/: Can't contact LDAP serv=
er: Transport endpoint is not connected
>
> Feb 12 17:17:36 zcu102-zynqmp nslcd[354]: [7b23c6] <group/member=3D"avahi=
"> no available LDAP server found, sleeping 1 seconds
>
> Feb 12 17:17:36 zcu102-zynqmp obmc-ikvm[392]: Failed to open input device
>
> Feb 12 17:17:36 zcu102-zynqmp audit[392]: ANOM_ABEND auid=3D4294967295 ui=
d=3D0 gid=3D0 ses=3D4294967295 pid=3D392 comm=3D"obmc-ikvm" exe=3D"/usr/bin=
/obmc-ikvm" sig=3D6 res=3D1
>
> Feb 12 17:17:36 zcu102-zynqmp obmc-ikvm[392]: Failed to open a file
>
> Feb 12 17:17:36 zcu102-zynqmp obmc-ikvm[392]: terminate called after thro=
wing an instance of 'sdbusplus::xyz::openbmc_project::Common::File::Error::=
Open'
>
> Feb 12 17:17:36 zcu102-zynqmp obmc-ikvm[392]:   what():  xyz.openbmc_proj=
ect.Common.File.Error.Open: Failed to open a file
>
> Feb 12 17:17:36 zcu102-zynqmp systemd[1]: Started Phosphor LDAP privilege=
 mapper.
>
> Feb 12 17:17:36 zcu102-zynqmp kernel: audit: type=3D1701 audit(1613150256=
.355:2): auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D392 comm=
=3D"obmc-ikvm" exe=3D"/usr/bin/obmc-ikvm" sig=3D6 res=3D1
>
> Feb 12 17:17:36 zcu102-zynqmp phosphor-certificate-manager[363]: Writing =
private key to file
>
> =E2=80=A6
>
> Feb 12 17:17:37 zcu102-zynqmp sh[339]: Fingerprint: sha1!! 31:c8:95:38:53=
:b4:7d:08:94:c9:44:1b:dd:ae:16:71:cc:ec:fd:d1
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Finished SSH Key Generation.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[415]: systemd-coredump@0-395-0.serv=
ice: ProtectHostname=3Dyes is configured, but the kernel does not support U=
TS namespaces, ignoring namespace setup.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Wait for /xyz/openbmc_p=
roject/control/host0/boot/one_time.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Wait for /xyz/openbmc_p=
roject/control/host0/boot.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: start-ipkvm.service: Main proce=
ss exited, code=3Ddumped, status=3D6/ABRT
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: start-ipkvm.service: Failed wit=
h result 'core-dump'.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Wait for /xyz/openbmc_p=
roject/control/host0/power_restore_policy.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Wait for /xyz/openbmc_p=
roject/control/host0/restriction_mode.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Wait for /xyz/openbmc_p=
roject/led/groups/bmc_booted.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Wait for /xyz/openbmc_p=
roject/time/sync_method.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Phosphor LED Group Mana=
gement Daemon.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Phosphor Ldap config up=
dater.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Phosphor SNMP conf Mana=
ger.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Phosphor Network Manage=
r.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started OpenBMC Software Update=
 Manager.
>
> Feb 12 17:17:37 zcu102-zynqmp phosphor-chassis-state-manager[414]: Initia=
l Chassis State will be Off
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Phosphor Chassis State =
Manager.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Wait for /xyz/openbmc_p=
roject/state/chassis0.
>
> Feb 12 17:17:37 zcu102-zynqmp nslcd[354]: [8b4567] <group=3D"priv-noacces=
s"> failed to bind to LDAP server ldap://127.0.0.1/: Can't contact LDAP ser=
ver: Transport endpoint is not connected
>
> Feb 12 17:17:37 zcu102-zynqmp nslcd[354]: [8b4567] <group=3D"priv-noacces=
s"> no available LDAP server found, sleeping 1 seconds
>
> Feb 12 17:17:37 zcu102-zynqmp phosphor-bmc-state-manager[413]: Setting th=
e BMCState field
>
> Feb 12 17:17:37 zcu102-zynqmp phosphor-bmc-state-manager[413]: Setting th=
e BMCState field
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Starting Wait for /xyz/openbmc_=
project/led/groups...
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Starting Phosphor Inband IPMI..=
.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Stopping Network Service...
>
> Feb 12 17:17:37 zcu102-zynqmp nscd[341]: 341 ignored inotify event for `/=
etc/resolv.conf` (file exists)
>
> Feb 12 17:17:37 zcu102-zynqmp nscd[341]: 341 ignored inotify event for `/=
etc/resolv.conf` (file exists)
>
> Feb 12 17:17:37 zcu102-zynqmp systemd-timesyncd[233]: Network configurati=
on changed, trying to establish connection.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Pla=
tform Persistent Storage Archival being skipped.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Starting Phosphor Version Softw=
are Manager...
>
> Feb 12 17:17:37 zcu102-zynqmp ipmid[426]: JSON file not found
>
> Feb 12 17:17:37 zcu102-zynqmp ipmid[426]: JSON file not found
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Wait for /xyz/openbmc_p=
roject/led/groups.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd-timesyncd[233]: Network configurati=
on changed, trying to establish connection.
>
> Feb 12 17:17:37 zcu102-zynqmp nslcd[354]: [7b23c6] <group/member=3D"avahi=
"> failed to bind to LDAP server ldap://127.0.0.1/: Can't contact LDAP serv=
er: Transport endpoint is not connected
>
> Feb 12 17:17:37 zcu102-zynqmp nslcd[354]: [7b23c6] <group/member=3D"avahi=
"> no available LDAP server found, sleeping 1 seconds
>
> Feb 12 17:17:37 zcu102-zynqmp audit[426]: ANOM_ABEND auid=3D4294967295 ui=
d=3D0 gid=3D0 ses=3D4294967295 pid=3D426 comm=3D"ipmid" exe=3D"/usr/bin/ipm=
id" sig=3D11 res=3D1
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: systemd-networkd.service: Succe=
eded.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Stopped Network Service.
>
> Feb 12 17:17:37 zcu102-zynqmp kernel: audit: type=3D1701 audit(1613150257=
.355:3): auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D426 comm=
=3D"ipmid" exe=3D"/usr/bin/ipmid" sig=3D11 res=3D1
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: obmc-phosphor-sysd.service: Sch=
eduled restart job, restart counter is at 1.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Phosphor BMC State Mana=
ger.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Phosphor Inband IPMI.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Phosphor Version Softwa=
re Manager.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Ker=
nel Trace File System being skipped.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Cre=
ate list of static device nodes for the current kernel being skipped.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Stopped Phosphor System Manager=
.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Fil=
e System Check on Root Device being skipped.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Loa=
d Kernel Modules being skipped.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in FUS=
E Control File System being skipped.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Starting Network Service...
>
> Feb 12 17:17:37 zcu102-zynqmp nslcd[354]: [3c9869] <group/member=3D"syste=
md-network"> failed to bind to LDAP server ldap://127.0.0.1/: Can't contact=
 LDAP server: Transport endpoint is not connected
>
> Feb 12 17:17:37 zcu102-zynqmp nslcd[354]: [3c9869] <group/member=3D"syste=
md-network"> no available LDAP server found, sleeping 1 seconds
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Pla=
tform Persistent Storage Archival being skipped.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Bin=
d mount volatile /var/cache being skipped.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Bin=
d mount volatile /var/lib being skipped.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Bin=
d mount volatile /var/spool being skipped.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Bin=
d mount volatile /srv being skipped.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Com=
mit a transient machine-id on disk being skipped.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started FRU Fault monitor servi=
ce.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Phosphor System Manager=
.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Network IPMI daemon.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Che=
ck Host0 status on BMC reset being skipped.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Reached target Host0 running af=
ter reset.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Sta=
rt host0 running after BMC reset being skipped.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Starting Phosphor Host State Ma=
nager...
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Process Core Dump (PID =
430/UID 0).
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[437]: systemd-coredump@1-430-0.serv=
ice: PrivateNetwork=3Dyes is configured, but the kernel does not support ne=
twork namespaces, ignoring.
>
> Feb 12 17:17:37 zcu102-zynqmp audit[435]: ANOM_ABEND auid=3D4294967295 ui=
d=3D0 gid=3D0 ses=3D4294967295 pid=3D435 comm=3D"netipmid" exe=3D"/usr/bin/=
netipmid" sig=3D11 res=3D1
>
> Feb 12 17:17:37 zcu102-zynqmp kernel: audit: type=3D1701 audit(1613150257=
.583:4): auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D435 comm=
=3D"netipmid" exe=3D"/usr/bin/netipmid" sig=3D11 res=3D1
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Process Core Dump (PID =
438/UID 0).
>
> Feb 12 17:17:37 zcu102-zynqmp obmc-phosphor-sysd[434]:   File "/usr/sbin/=
obmc-phosphor-sysd", line 26
>
> Feb 12 17:17:37 zcu102-zynqmp obmc-phosphor-sysd[434]:     print "obmc-ph=
osphor-watchdogd starting..."
>
> Feb 12 17:17:37 zcu102-zynqmp obmc-phosphor-sysd[434]:           ^
>
> Feb 12 17:17:37 zcu102-zynqmp obmc-phosphor-sysd[434]: SyntaxError: Missi=
ng parentheses in call to 'print'. Did you mean print("obmc-phosphor-watchd=
ogd starting...")?
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[439]: systemd-coredump@2-438-0.serv=
ice: PrivateNetwork=3Dyes is configured, but the kernel does not support ne=
twork namespaces, ignoring.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: obmc-phosphor-sysd.service: Mai=
n process exited, code=3Dexited, status=3D1/FAILURE
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: obmc-phosphor-sysd.service: Fai=
led with result 'exit-code'.
>
> Feb 12 17:17:37 zcu102-zynqmp phosphor-host-state-manager[436]: Initial H=
ost State will be Off
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Phosphor Host State Man=
ager.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Wait for /xyz/openbmc_p=
roject/state/host0.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Starting Reboot If Enabled...
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Starting Reset host sensors...
>
> Feb 12 17:17:37 zcu102-zynqmp phosphor-discover-system-state[441]: Host p=
ower is off, checking power policy
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Starting Phosphor Time Manager =
daemon...
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Finished Reboot If Enabled.
>
> Feb 12 17:17:37 zcu102-zynqmp phosphor-timemanager[444]: Time mode is cha=
nged
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[437]: systemd-coredump@1-430-0.serv=
ice: ProtectHostname=3Dyes is configured, but the kernel does not support U=
TS namespaces, ignoring namespace setup.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Ker=
nel Trace File System being skipped.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Cre=
ate list of static device nodes for the current kernel being skipped.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Fil=
e System Check on Root Device being skipped.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Loa=
d Kernel Modules being skipped.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in FUS=
E Control File System being skipped.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Pla=
tform Persistent Storage Archival being skipped.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Bin=
d mount volatile /var/cache being skipped.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Bin=
d mount volatile /var/lib being skipped.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Bin=
d mount volatile /var/spool being skipped.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Bin=
d mount volatile /srv being skipped.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Com=
mit a transient machine-id on disk being skipped.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Starting Time & Date Service...
>
> Feb 12 17:17:37 zcu102-zynqmp phosphor-mapper[378]: Introspect call faile=
d with error: generic:113, No route to host on process: xyz.openbmc_project=
.Control.Host path: /
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: phosphor-ipmi-host.service: Mai=
n process exited, code=3Ddumped, status=3D11/SEGV
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: phosphor-ipmi-host.service: Fai=
led with result 'core-dump'.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[439]: systemd-coredump@2-438-0.serv=
ice: ProtectHostname=3Dyes is configured, but the kernel does not support U=
TS namespaces, ignoring namespace setup.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: phosphor-reset-sensor-states@0.=
service: Succeeded.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Finished Reset host sensors.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Reached target Host0 (Reset Che=
ck).
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: phosphor-ipmi-net@eth0.service:=
 Main process exited, code=3Ddumped, status=3D11/SEGV
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: phosphor-ipmi-net@eth0.service:=
 Failed with result 'core-dump'.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[447]: systemd-timedated.service: Pr=
otectHostname=3Dyes is configured, but the kernel does not support UTS name=
spaces, ignoring namespace setup.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Time & Date Service.
>
> Feb 12 17:17:37 zcu102-zynqmp systemd-timedated[447]: Set NTP to enabled =
(systemd-timesyncd.service).
>
> Feb 12 17:17:37 zcu102-zynqmp phosphor-timemanager[444]: Updated NTP sett=
ing
>
> Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Phosphor Time Manager d=
aemon.
>
> Feb 12 17:17:38 zcu102-zynqmp nslcd[354]: [8b4567] <group=3D"priv-noacces=
s"> failed to bind to LDAP server ldap://127.0.0.1/: Can't contact LDAP ser=
ver: Transport endpoint is not connected
>
> Feb 12 17:17:38 zcu102-zynqmp nslcd[354]: [8b4567] <group=3D"priv-noacces=
s"> no available LDAP server found, sleeping 1 seconds
>
> Feb 12 17:17:38 zcu102-zynqmp systemd[1]: start-ipkvm.service: Scheduled =
restart job, restart counter is at 1.
>
> Feb 12 17:17:38 zcu102-zynqmp systemd[1]: Condition check resulted in Ker=
nel Trace File System being skipped.
>
> Feb 12 17:17:38 zcu102-zynqmp systemd[1]: Condition check resulted in Cre=
ate list of static device nodes for the current kernel being skipped.
>
> Feb 12 17:17:38 zcu102-zynqmp systemd[1]: Stopped OpenBMC ipKVM daemon.
>
> Feb 12 17:17:38 zcu102-zynqmp systemd[1]: Condition check resulted in Fil=
e System Check on Root Device being skipped.
>
> Feb 12 17:17:38 zcu102-zynqmp systemd[1]: Condition check resulted in Loa=
d Kernel Modules being skipped.
>
> Feb 12 17:17:38 zcu102-zynqmp systemd[1]: Condition check resulted in FUS=
E Control File System being skipped.
>
> Feb 12 17:17:38 zcu102-zynqmp systemd[1]: Condition check resulted in Pla=
tform Persistent Storage Archival being skipped.
>
> Feb 12 17:17:38 zcu102-zynqmp systemd[1]: Condition check resulted in Bin=
d mount volatile /var/cache being skipped.
>
> Feb 12 17:17:38 zcu102-zynqmp systemd[1]: Condition check resulted in Bin=
d mount volatile /var/lib being skipped.
>
> Feb 12 17:17:38 zcu102-zynqmp systemd[1]: Condition check resulted in Bin=
d mount volatile /var/spool being skipped.
>
> Feb 12 17:17:38 zcu102-zynqmp systemd[1]: Condition check resulted in Bin=
d mount volatile /srv being skipped.
>
> Feb 12 17:17:38 zcu102-zynqmp systemd[1]: Condition check resulted in Com=
mit a transient machine-id on disk being skipped.
>
>
>
>
>
> Tan Dehui
