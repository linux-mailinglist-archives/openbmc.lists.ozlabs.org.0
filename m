Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B4346447C
	for <lists+openbmc@lfdr.de>; Wed,  1 Dec 2021 02:29:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3hMG3SrXz3bWC
	for <lists+openbmc@lfdr.de>; Wed,  1 Dec 2021 12:29:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=YMNv9U0K;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=hotmail.com (client-ip=2a01:111:f403:7005::815;
 helo=aus01-sy4-obe.outbound.protection.outlook.com;
 envelope-from=dehuitan1988@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256
 header.s=selector1 header.b=YMNv9U0K; 
 dkim-atps=neutral
Received: from AUS01-SY4-obe.outbound.protection.outlook.com
 (mail-sy4aus01olkn20815.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7005::815])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3hLl3xvcz2yNW
 for <openbmc@lists.ozlabs.org>; Wed,  1 Dec 2021 12:28:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H/oDlrhIbpF70Yle8NGK8iZF14OCjR95SJW9bGS6B2QeaGnA9dLosRUeQiXLRXvIakolRIK6qvWbNnSEjENJBB++Q/B14VqwBZO24zV3hh/8gnIFwBCL6/gBHXOuoJrXMtXBViwSheFOsNpytDQhcX11ekCQP6GnPzGWSn+myXDS8iBsdiwa0iwNSX8lMCPFpM8xQJwX68HI8X5DGuXmxVRjUbazyD9+v7x+wnVvWLTTFJ4VYdu5UDFuVXrGFN2ODYwV+oHe4PJ//vltFJMGjne6xf7rcPWVAJvVF216m7bi96UReq0jj54PKFjR34pIgVr6ryFpA7836n97a65xEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KdZ1YHSYlaJrIGYpYoxLUx9viMvrFSMmO9SjqeFx09g=;
 b=TFPYHknLrohgr0vZPHj0uBmodrV/doitKpS4lY6dxWqc8uoofeCYrgr9BZlqcetY30+ATGEjCZrIhjK1TeW+iGz0laVQJGKvL1WgO4fesPmL4RZR6mGvAuq01Ci67AFLTHlXkKOYTy8NWx3DZBasN13Q2RBSX1O6xOlReM+XSCq+mqP2Ji8sq4iwnJ9SlK0SDOYfZck+p+GrTMxh00YbzQJyavsgwh5z3leS6MQV/mjlhf5Xj/YxCOmaIFscgCelj437CYS6g5psm7CWiXzj+cB32XHIZ7Mc//v/svox6McmexslgzJz820MbFC5iUwqCLXc8LMylSWnIzLHA5vleQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KdZ1YHSYlaJrIGYpYoxLUx9viMvrFSMmO9SjqeFx09g=;
 b=YMNv9U0KAUJ4xpU8kuXdngTKky+bV/lFWHztihrZsHoF83AJ6LSk1vKRG3zA5/T2Ii1+e8o9To+jrzoyBuqqq1ezdPz9Hjd98/zg7K5ERnM9R45tsD4I8/1feoTMF0jqdud4d72RdNczDyvcxyfTgSdtSWuadB+xguR0gLQ2Kr+akqfozK8Hsy3Wahocs9cjfptuXfrb9Lp9y2LvU/rFv6e1yEHr7Kw+9lK4yR/LLqtVvBjLTmDf/pSqJkBPZmIhmnzr49fg5oH18fHfFYJsUTx/W80sl2bGzKEsrgCBpux52kRKcubV/O2/BSiW8+j5HviFpmXcgnnBcL6xfJegVQ==
Received: from ME3PR01MB8081.ausprd01.prod.outlook.com (2603:10c6:220:1bf::14)
 by MEYPR01MB7740.ausprd01.prod.outlook.com (2603:10c6:220:15f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Wed, 1 Dec
 2021 01:28:25 +0000
Received: from ME3PR01MB8081.ausprd01.prod.outlook.com
 ([fe80::f0eb:e25c:5384:13a5]) by ME3PR01MB8081.ausprd01.prod.outlook.com
 ([fe80::f0eb:e25c:5384:13a5%4]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 01:28:25 +0000
From: Tan Dehui <dehuitan1988@hotmail.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: =?Windows-1252?Q?"unauthorized=94_error_reported_when_access_web_server?=
Thread-Topic: =?Windows-1252?Q?"unauthorized=94_error_reported_when_access_web_server?=
Thread-Index: AQHX5lI4kwoDiV94t0uRtVNwTrFS+Q==
Date: Wed, 1 Dec 2021 01:28:24 +0000
Message-ID: <ME3PR01MB80818C6B3280A804A2ECD63FC9689@ME3PR01MB8081.ausprd01.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [RnAzgoHCmh7EKNYWAks7dC/YBOV2QDuA]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a5b306ea-14f1-40cb-3318-08d9b469deb1
x-ms-traffictypediagnostic: MEYPR01MB7740:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hDAOLeAvr7ODpocADZk3V4G3wcQXiEd5q3NpehA919BdkuxEyJsrw4TNkIZb04hdBkp3Q0Cc3//TVHgMaynAHQPM76JjgmiouHLhNC0IHEenfojD+R8wJ6gOPxsrWVEHdWssRWtwmqhxjI9Mk0KIEqxH8gqxcVeVNCuHutuJFAfJW69tcSJu9OOA0TTsCrYGOINiweEy1PFG8KeM5vXhRU0pVV3eW7Ua/jEB8TDf8wNQ7y+f+JpQ7U7aIUVdrxn+C9rJzLXL4IYHPNCsE3IFP0U2ldT6oee1Y/L0VBUZJho8EKvGD9nCDPPqkXImf80KFGxav3Z983YTyyyffhhMNEDxmerfhzZolc2N0d/LXWWQyVF8nwh+qfBZZXxekplGpbfyaZkUYc9yUMcgImEXUmPbyWIg4Ou5rmDOw+ZACWC2KsyRSklm0ss2o2WrFWg/2TLTspBIy0f1kiBppdUWUG3tjwefhIigrugy1lkgD5AG/ZHXIytynEZtuubbkeP0k4KqL6b8TJFL6/5X8XJqt48TBmMKMSWOMhnUZGsGRtZO2xjHQ1vkFPNB0aQgg6BCE5L9JAALCmFxcntKorm7yg==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?3aZX2ivO+B14ejVGQ02Y1pykJlt8FaCD3pzkrjDaNtFGU99gI7XcNfFz?=
 =?Windows-1252?Q?Zs9ipIUjuyp1jELWCDTrLVXrYA4gAN/g4TCts0e+iFT93Y4aRVJsqM5L?=
 =?Windows-1252?Q?F2f0wzbA29TJeT46Zvolqrr9p3Pl/UmgfV0y4jdd0IZtrCtblaE89sW4?=
 =?Windows-1252?Q?7c1tECqDMfJRMawbCZMxx6oOfcnz22TmCEQF/2W5qTIsWnyuLFy/j306?=
 =?Windows-1252?Q?oCiA5t9VLjGqrCV4dlunVejp6ctv3Nmcg6pKj5c1FSz9Kcbn/varKeiH?=
 =?Windows-1252?Q?HXFuRMDwcMGtK8vUSNMZoX9b96Yo0avmHcYrLjp3hkO3o5dKukL24Kcm?=
 =?Windows-1252?Q?QuPCfdnupsFIek4SMwzPKdGzVfNDdv80iSSyp/waivdciAFUpvmG71Me?=
 =?Windows-1252?Q?O+sQsIlB2Azc0cM5ePN5Wt9fMsCh4FAsS7hJ3pozm2cT/Nqt679EpGPS?=
 =?Windows-1252?Q?h8TN9NkAcxsIxSs3kEosNkrkPHV1ANQM46jGhwZCPrxjFliblNRDUuGH?=
 =?Windows-1252?Q?rA6C5kKAeqKUkHHjyklyMoQKh8roazXs1BasaVoORZdUyx7dyOE68xgE?=
 =?Windows-1252?Q?DMMUXP6u6FQ6yEhyxjQjgPlATWVy9FmSWIbZlTOVk9CVBwClreVZVRYr?=
 =?Windows-1252?Q?712WOuxwshg6rAFJ2P/5AHJpaSHU6VjAsOXSjf0NxTWZ7/t1qcFTSnXr?=
 =?Windows-1252?Q?pgz2FFzov3V0N4krQnCupK0EdNgowrvAz3GCK8RI4LLkKDY2RJiwZHvj?=
 =?Windows-1252?Q?V3YikIOr0BT7HyR//LKOa5rxMdStrnxg+pfATlEUjK7i9vd80mdX2eeW?=
 =?Windows-1252?Q?/hbw4Jv3iagp0wjSMcdhoMRtROPZOxOpT3L4IIt2r+C1sUUAF5mMq7O8?=
 =?Windows-1252?Q?2+MK005m28Of3jXI4sKaAvx+Ch5fBlLcrctL7czrgjNKTNU0e/E+jV74?=
 =?Windows-1252?Q?Awn2OEncskprTkxYdlA7jTXKoth+M0Hc33BXzIxRTgerw9BVHAZ0waUf?=
 =?Windows-1252?Q?1VXGGL8sETqc5N215Ukq4QqgNXMyBkMdGbGzahn9O4w7acTPNqY=3D?=
Content-Type: multipart/alternative;
 boundary="_000_ME3PR01MB80818C6B3280A804A2ECD63FC9689ME3PR01MB8081ausp_"
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-3174-20-msonline-outlook-adb55.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ME3PR01MB8081.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: a5b306ea-14f1-40cb-3318-08d9b469deb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2021 01:28:24.9360 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MEYPR01MB7740
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

--_000_ME3PR01MB80818C6B3280A804A2ECD63FC9689ME3PR01MB8081ausp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

An =93unauthorized=94 error was reported when I accessed the Web server thr=
ough the browser.  The logs is attached below.
By capturing network data, I found that no more messages are sent after the=
 Web Server and Web Client send Hello messages to each other.
Further, through debugging I suspect that the authentication algorithm migh=
t be a bit of a problem.

LOG:
=85
Feb 12 17:17:36 zcu102-zynqmp systemd[1]: Starting Phosphor User Manager...
Feb 12 17:17:36 zcu102-zynqmp systemd[1]: Started Phosphor sysfs LED contro=
ller.
Feb 12 17:17:36 zcu102-zynqmp systemd[1]: Started Phosphor sysfs LED contro=
ller.
Feb 12 17:17:36 zcu102-zynqmp nslcd[354]: [8b4567] <group=3D"priv-noaccess"=
> failed to bind to LDAP server ldap://127.0.0.1/: Can't contact LDAP serve=
r: Transport endpoint is not connected
Feb 12 17:17:36 zcu102-zynqmp nslcd[354]: [8b4567] <group=3D"priv-noaccess"=
> no available LDAP server found, sleeping 1 seconds
Feb 12 17:17:36 zcu102-zynqmp systemd[1]: Finished Load/Save Random Seed.
Feb 12 17:17:36 zcu102-zynqmp bmcweb[336]: Checking certs in file /etc/ssl/=
certs/https/server.pem
Feb 12 17:17:36 zcu102-zynqmp bmcweb[336]: Error in verifying signature, re=
generating
Feb 12 17:17:36 zcu102-zynqmp bmcweb[336]: Generating new keys
Feb 12 17:17:36 zcu102-zynqmp bmcweb[336]: Generating EC key
Feb 12 17:17:36 zcu102-zynqmp systemd[1]: Started Name Service Cache Daemon=
.
Feb 12 17:17:36 zcu102-zynqmp bmcweb[336]: Generating x509 Certificate
Feb 12 17:17:36 zcu102-zynqmp systemd[1]: Started LDAP daemon.
Feb 12 17:17:36 zcu102-zynqmp systemd[1]: obmc-phosphor-sysd.service: Main =
process exited, code=3Dexited, status=3D1/FAILURE
Feb 12 17:17:36 zcu102-zynqmp systemd[1]: obmc-phosphor-sysd.service: Faile=
d with result 'exit-code'.
Feb 12 17:17:36 zcu102-zynqmp systemd[1]: Started OpenBMC ipKVM daemon.
Feb 12 17:17:36 zcu102-zynqmp systemd[1]: Finished Permit User Sessions.
Feb 12 17:17:36 zcu102-zynqmp systemd[1]: Started Phosphor Log Manager.
Feb 12 17:17:36 zcu102-zynqmp avahi-daemon[394]: Found user 'avahi' (UID 99=
8) and group 'avahi' (GID 998).
Feb 12 17:17:36 zcu102-zynqmp nslcd[354]: [7b23c6] <group/member=3D"avahi">=
 failed to bind to LDAP server ldap://127.0.0.1/: Can't contact LDAP server=
: Transport endpoint is not connected
Feb 12 17:17:36 zcu102-zynqmp nslcd[354]: [7b23c6] <group/member=3D"avahi">=
 no available LDAP server found, sleeping 1 seconds
Feb 12 17:17:36 zcu102-zynqmp obmc-ikvm[392]: Failed to open input device
Feb 12 17:17:36 zcu102-zynqmp audit[392]: ANOM_ABEND auid=3D4294967295 uid=
=3D0 gid=3D0 ses=3D4294967295 pid=3D392 comm=3D"obmc-ikvm" exe=3D"/usr/bin/=
obmc-ikvm" sig=3D6 res=3D1
Feb 12 17:17:36 zcu102-zynqmp obmc-ikvm[392]: Failed to open a file
Feb 12 17:17:36 zcu102-zynqmp obmc-ikvm[392]: terminate called after throwi=
ng an instance of 'sdbusplus::xyz::openbmc_project::Common::File::Error::Op=
en'
Feb 12 17:17:36 zcu102-zynqmp obmc-ikvm[392]:   what():  xyz.openbmc_projec=
t.Common.File.Error.Open: Failed to open a file
Feb 12 17:17:36 zcu102-zynqmp systemd[1]: Started Phosphor LDAP privilege m=
apper.
Feb 12 17:17:36 zcu102-zynqmp kernel: audit: type=3D1701 audit(1613150256.3=
55:2): auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D392 comm=3D=
"obmc-ikvm" exe=3D"/usr/bin/obmc-ikvm" sig=3D6 res=3D1
Feb 12 17:17:36 zcu102-zynqmp phosphor-certificate-manager[363]: Writing pr=
ivate key to file
=85
Feb 12 17:17:37 zcu102-zynqmp sh[339]: Fingerprint: sha1!! 31:c8:95:38:53:b=
4:7d:08:94:c9:44:1b:dd:ae:16:71:cc:ec:fd:d1
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Finished SSH Key Generation.
Feb 12 17:17:37 zcu102-zynqmp systemd[415]: systemd-coredump@0-395-0.servic=
e: ProtectHostname=3Dyes is configured, but the kernel does not support UTS=
 namespaces, ignoring namespace setup.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Wait for /xyz/openbmc_pro=
ject/control/host0/boot/one_time.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Wait for /xyz/openbmc_pro=
ject/control/host0/boot.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: start-ipkvm.service: Main process=
 exited, code=3Ddumped, status=3D6/ABRT
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: start-ipkvm.service: Failed with =
result 'core-dump'.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Wait for /xyz/openbmc_pro=
ject/control/host0/power_restore_policy.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Wait for /xyz/openbmc_pro=
ject/control/host0/restriction_mode.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Wait for /xyz/openbmc_pro=
ject/led/groups/bmc_booted.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Wait for /xyz/openbmc_pro=
ject/time/sync_method.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Phosphor LED Group Manage=
ment Daemon.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Phosphor Ldap config upda=
ter.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Phosphor SNMP conf Manage=
r.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Phosphor Network Manager.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started OpenBMC Software Update M=
anager.
Feb 12 17:17:37 zcu102-zynqmp phosphor-chassis-state-manager[414]: Initial =
Chassis State will be Off
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Phosphor Chassis State Ma=
nager.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Wait for /xyz/openbmc_pro=
ject/state/chassis0.
Feb 12 17:17:37 zcu102-zynqmp nslcd[354]: [8b4567] <group=3D"priv-noaccess"=
> failed to bind to LDAP server ldap://127.0.0.1/: Can't contact LDAP serve=
r: Transport endpoint is not connected
Feb 12 17:17:37 zcu102-zynqmp nslcd[354]: [8b4567] <group=3D"priv-noaccess"=
> no available LDAP server found, sleeping 1 seconds
Feb 12 17:17:37 zcu102-zynqmp phosphor-bmc-state-manager[413]: Setting the =
BMCState field
Feb 12 17:17:37 zcu102-zynqmp phosphor-bmc-state-manager[413]: Setting the =
BMCState field
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Starting Wait for /xyz/openbmc_pr=
oject/led/groups...
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Starting Phosphor Inband IPMI...
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Stopping Network Service...
Feb 12 17:17:37 zcu102-zynqmp nscd[341]: 341 ignored inotify event for `/et=
c/resolv.conf` (file exists)
Feb 12 17:17:37 zcu102-zynqmp nscd[341]: 341 ignored inotify event for `/et=
c/resolv.conf` (file exists)
Feb 12 17:17:37 zcu102-zynqmp systemd-timesyncd[233]: Network configuration=
 changed, trying to establish connection.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Platf=
orm Persistent Storage Archival being skipped.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Starting Phosphor Version Softwar=
e Manager...
Feb 12 17:17:37 zcu102-zynqmp ipmid[426]: JSON file not found
Feb 12 17:17:37 zcu102-zynqmp ipmid[426]: JSON file not found
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Wait for /xyz/openbmc_pro=
ject/led/groups.
Feb 12 17:17:37 zcu102-zynqmp systemd-timesyncd[233]: Network configuration=
 changed, trying to establish connection.
Feb 12 17:17:37 zcu102-zynqmp nslcd[354]: [7b23c6] <group/member=3D"avahi">=
 failed to bind to LDAP server ldap://127.0.0.1/: Can't contact LDAP server=
: Transport endpoint is not connected
Feb 12 17:17:37 zcu102-zynqmp nslcd[354]: [7b23c6] <group/member=3D"avahi">=
 no available LDAP server found, sleeping 1 seconds
Feb 12 17:17:37 zcu102-zynqmp audit[426]: ANOM_ABEND auid=3D4294967295 uid=
=3D0 gid=3D0 ses=3D4294967295 pid=3D426 comm=3D"ipmid" exe=3D"/usr/bin/ipmi=
d" sig=3D11 res=3D1
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: systemd-networkd.service: Succeed=
ed.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Stopped Network Service.
Feb 12 17:17:37 zcu102-zynqmp kernel: audit: type=3D1701 audit(1613150257.3=
55:3): auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D426 comm=3D=
"ipmid" exe=3D"/usr/bin/ipmid" sig=3D11 res=3D1
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: obmc-phosphor-sysd.service: Sched=
uled restart job, restart counter is at 1.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Phosphor BMC State Manage=
r.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Phosphor Inband IPMI.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Phosphor Version Software=
 Manager.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Kerne=
l Trace File System being skipped.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Creat=
e list of static device nodes for the current kernel being skipped.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Stopped Phosphor System Manager.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in File =
System Check on Root Device being skipped.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Load =
Kernel Modules being skipped.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in FUSE =
Control File System being skipped.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Starting Network Service...
Feb 12 17:17:37 zcu102-zynqmp nslcd[354]: [3c9869] <group/member=3D"systemd=
-network"> failed to bind to LDAP server ldap://127.0.0.1/: Can't contact L=
DAP server: Transport endpoint is not connected
Feb 12 17:17:37 zcu102-zynqmp nslcd[354]: [3c9869] <group/member=3D"systemd=
-network"> no available LDAP server found, sleeping 1 seconds
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Platf=
orm Persistent Storage Archival being skipped.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Bind =
mount volatile /var/cache being skipped.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Bind =
mount volatile /var/lib being skipped.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Bind =
mount volatile /var/spool being skipped.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Bind =
mount volatile /srv being skipped.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Commi=
t a transient machine-id on disk being skipped.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started FRU Fault monitor service=
.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Phosphor System Manager.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Network IPMI daemon.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Check=
 Host0 status on BMC reset being skipped.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Reached target Host0 running afte=
r reset.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Start=
 host0 running after BMC reset being skipped.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Starting Phosphor Host State Mana=
ger...
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Process Core Dump (PID 43=
0/UID 0).
Feb 12 17:17:37 zcu102-zynqmp systemd[437]: systemd-coredump@1-430-0.servic=
e: PrivateNetwork=3Dyes is configured, but the kernel does not support netw=
ork namespaces, ignoring.
Feb 12 17:17:37 zcu102-zynqmp audit[435]: ANOM_ABEND auid=3D4294967295 uid=
=3D0 gid=3D0 ses=3D4294967295 pid=3D435 comm=3D"netipmid" exe=3D"/usr/bin/n=
etipmid" sig=3D11 res=3D1
Feb 12 17:17:37 zcu102-zynqmp kernel: audit: type=3D1701 audit(1613150257.5=
83:4): auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D435 comm=3D=
"netipmid" exe=3D"/usr/bin/netipmid" sig=3D11 res=3D1
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Process Core Dump (PID 43=
8/UID 0).
Feb 12 17:17:37 zcu102-zynqmp obmc-phosphor-sysd[434]:   File "/usr/sbin/ob=
mc-phosphor-sysd", line 26
Feb 12 17:17:37 zcu102-zynqmp obmc-phosphor-sysd[434]:     print "obmc-phos=
phor-watchdogd starting..."
Feb 12 17:17:37 zcu102-zynqmp obmc-phosphor-sysd[434]:           ^
Feb 12 17:17:37 zcu102-zynqmp obmc-phosphor-sysd[434]: SyntaxError: Missing=
 parentheses in call to 'print'. Did you mean print("obmc-phosphor-watchdog=
d starting...")?
Feb 12 17:17:37 zcu102-zynqmp systemd[439]: systemd-coredump@2-438-0.servic=
e: PrivateNetwork=3Dyes is configured, but the kernel does not support netw=
ork namespaces, ignoring.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: obmc-phosphor-sysd.service: Main =
process exited, code=3Dexited, status=3D1/FAILURE
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: obmc-phosphor-sysd.service: Faile=
d with result 'exit-code'.
Feb 12 17:17:37 zcu102-zynqmp phosphor-host-state-manager[436]: Initial Hos=
t State will be Off
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Phosphor Host State Manag=
er.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Wait for /xyz/openbmc_pro=
ject/state/host0.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Starting Reboot If Enabled...
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Starting Reset host sensors...
Feb 12 17:17:37 zcu102-zynqmp phosphor-discover-system-state[441]: Host pow=
er is off, checking power policy
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Starting Phosphor Time Manager da=
emon...
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Finished Reboot If Enabled.
Feb 12 17:17:37 zcu102-zynqmp phosphor-timemanager[444]: Time mode is chang=
ed
Feb 12 17:17:37 zcu102-zynqmp systemd[437]: systemd-coredump@1-430-0.servic=
e: ProtectHostname=3Dyes is configured, but the kernel does not support UTS=
 namespaces, ignoring namespace setup.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Kerne=
l Trace File System being skipped.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Creat=
e list of static device nodes for the current kernel being skipped.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in File =
System Check on Root Device being skipped.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Load =
Kernel Modules being skipped.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in FUSE =
Control File System being skipped.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Platf=
orm Persistent Storage Archival being skipped.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Bind =
mount volatile /var/cache being skipped.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Bind =
mount volatile /var/lib being skipped.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Bind =
mount volatile /var/spool being skipped.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Bind =
mount volatile /srv being skipped.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Commi=
t a transient machine-id on disk being skipped.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Starting Time & Date Service...
Feb 12 17:17:37 zcu102-zynqmp phosphor-mapper[378]: Introspect call failed =
with error: generic:113, No route to host on process: xyz.openbmc_project.C=
ontrol.Host path: /
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: phosphor-ipmi-host.service: Main =
process exited, code=3Ddumped, status=3D11/SEGV
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: phosphor-ipmi-host.service: Faile=
d with result 'core-dump'.
Feb 12 17:17:37 zcu102-zynqmp systemd[439]: systemd-coredump@2-438-0.servic=
e: ProtectHostname=3Dyes is configured, but the kernel does not support UTS=
 namespaces, ignoring namespace setup.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: phosphor-reset-sensor-states@0.se=
rvice: Succeeded.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Finished Reset host sensors.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Reached target Host0 (Reset Check=
).
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: phosphor-ipmi-net@eth0.service: M=
ain process exited, code=3Ddumped, status=3D11/SEGV
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: phosphor-ipmi-net@eth0.service: F=
ailed with result 'core-dump'.
Feb 12 17:17:37 zcu102-zynqmp systemd[447]: systemd-timedated.service: Prot=
ectHostname=3Dyes is configured, but the kernel does not support UTS namesp=
aces, ignoring namespace setup.
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Time & Date Service.
Feb 12 17:17:37 zcu102-zynqmp systemd-timedated[447]: Set NTP to enabled (s=
ystemd-timesyncd.service).
Feb 12 17:17:37 zcu102-zynqmp phosphor-timemanager[444]: Updated NTP settin=
g
Feb 12 17:17:37 zcu102-zynqmp systemd[1]: Started Phosphor Time Manager dae=
mon.
Feb 12 17:17:38 zcu102-zynqmp nslcd[354]: [8b4567] <group=3D"priv-noaccess"=
> failed to bind to LDAP server ldap://127.0.0.1/: Can't contact LDAP serve=
r: Transport endpoint is not connected
Feb 12 17:17:38 zcu102-zynqmp nslcd[354]: [8b4567] <group=3D"priv-noaccess"=
> no available LDAP server found, sleeping 1 seconds
Feb 12 17:17:38 zcu102-zynqmp systemd[1]: start-ipkvm.service: Scheduled re=
start job, restart counter is at 1.
Feb 12 17:17:38 zcu102-zynqmp systemd[1]: Condition check resulted in Kerne=
l Trace File System being skipped.
Feb 12 17:17:38 zcu102-zynqmp systemd[1]: Condition check resulted in Creat=
e list of static device nodes for the current kernel being skipped.
Feb 12 17:17:38 zcu102-zynqmp systemd[1]: Stopped OpenBMC ipKVM daemon.
Feb 12 17:17:38 zcu102-zynqmp systemd[1]: Condition check resulted in File =
System Check on Root Device being skipped.
Feb 12 17:17:38 zcu102-zynqmp systemd[1]: Condition check resulted in Load =
Kernel Modules being skipped.
Feb 12 17:17:38 zcu102-zynqmp systemd[1]: Condition check resulted in FUSE =
Control File System being skipped.
Feb 12 17:17:38 zcu102-zynqmp systemd[1]: Condition check resulted in Platf=
orm Persistent Storage Archival being skipped.
Feb 12 17:17:38 zcu102-zynqmp systemd[1]: Condition check resulted in Bind =
mount volatile /var/cache being skipped.
Feb 12 17:17:38 zcu102-zynqmp systemd[1]: Condition check resulted in Bind =
mount volatile /var/lib being skipped.
Feb 12 17:17:38 zcu102-zynqmp systemd[1]: Condition check resulted in Bind =
mount volatile /var/spool being skipped.
Feb 12 17:17:38 zcu102-zynqmp systemd[1]: Condition check resulted in Bind =
mount volatile /srv being skipped.
Feb 12 17:17:38 zcu102-zynqmp systemd[1]: Condition check resulted in Commi=
t a transient machine-id on disk being skipped.


Tan Dehui

--_000_ME3PR01MB80818C6B3280A804A2ECD63FC9689ME3PR01MB8081ausp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:DengXian;}
.MsoChpDefault
	{mso-style-type:export-only;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"ZH-CN" link=3D"blue" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Aria=
l&quot;,sans-serif;color:#333333;background:#F7F8FA">An =93unauthorized=94 =
error was reported when I accessed the Web server through the browser. &nbs=
p;The logs is attached below.</span><span lang=3D"EN-US"><o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Aria=
l&quot;,sans-serif;color:#333333;background:#F7F8FA">By capturing network d=
ata, I found that no more messages are sent after the Web Server and Web Cl=
ient send Hello messages to each other.&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Aria=
l&quot;,sans-serif;color:#333333;background:#F7F8FA">Further, through debug=
ging I suspect that the authentication algorithm might be a bit of a proble=
m. &nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">LOG:=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">=85<span lang=3D"EN=
-US"><o:p></o:p></span></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:36 zcu102-zynqmp systemd[1]: Starting Phosphor User Manager...<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:36 zcu102-zynqmp systemd[1]: Started Phosphor sysfs LED controller=
.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:36 zcu102-zynqmp systemd[1]: Started Phosphor sysfs LED controller=
.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:36 zcu102-zynqmp nslcd[354]: [8b4567] &lt;group=3D&quot;priv-noacc=
ess&quot;&gt; failed to bind to LDAP server ldap://127.0.0.1/: Can't contac=
t LDAP server: Transport endpoint is not connected<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:36 zcu102-zynqmp nslcd[354]: [8b4567] &lt;group=3D&quot;priv-noacc=
ess&quot;&gt; no available LDAP server found, sleeping 1 seconds<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:36 zcu102-zynqmp systemd[1]: Finished Load/Save Random Seed.<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:36 zcu102-zynqmp bmcweb[336]: Checking certs in file /etc/ssl/cert=
s/https/server.pem<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:36 zcu102-zynqmp bmcweb[336]: Error in verifying signature, regene=
rating<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:36 zcu102-zynqmp bmcweb[336]: Generating new keys<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:36 zcu102-zynqmp bmcweb[336]: Generating EC key<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:36 zcu102-zynqmp systemd[1]: Started Name Service Cache Daemon.<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:36 zcu102-zynqmp bmcweb[336]: Generating x509 Certificate<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:36 zcu102-zynqmp systemd[1]: Started LDAP daemon.<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:36 zcu102-zynqmp systemd[1]: obmc-phosphor-sysd.service: Main proc=
ess exited, code=3Dexited, status=3D1/FAILURE<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:36 zcu102-zynqmp systemd[1]: obmc-phosphor-sysd.service: Failed wi=
th result 'exit-code'.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:36 zcu102-zynqmp systemd[1]: Started OpenBMC ipKVM daemon.<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:36 zcu102-zynqmp systemd[1]: Finished Permit User Sessions.<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:36 zcu102-zynqmp systemd[1]: Started Phosphor Log Manager.<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:36 zcu102-zynqmp avahi-daemon[394]: Found user 'avahi' (UID 998) a=
nd group 'avahi' (GID 998).<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:36 zcu102-zynqmp nslcd[354]: [7b23c6] &lt;group/member=3D&quot;ava=
hi&quot;&gt; failed to bind to LDAP server ldap://127.0.0.1/: Can't contact=
 LDAP server: Transport endpoint is not connected<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:36 zcu102-zynqmp nslcd[354]: [7b23c6] &lt;group/member=3D&quot;ava=
hi&quot;&gt; no available LDAP server found, sleeping 1 seconds<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:36 zcu102-zynqmp obmc-ikvm[392]: Failed to open input device<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:36 zcu102-zynqmp audit[392]: ANOM_ABEND auid=3D4294967295 uid=3D0 =
gid=3D0 ses=3D4294967295 pid=3D392 comm=3D&quot;obmc-ikvm&quot; exe=3D&quot=
;/usr/bin/obmc-ikvm&quot; sig=3D6 res=3D1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:36 zcu102-zynqmp obmc-ikvm[392]: Failed to open a file<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:36 zcu102-zynqmp obmc-ikvm[392]: terminate called after throwing a=
n instance of 'sdbusplus::xyz::openbmc_project::Common::File::Error::Open'<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:36 zcu102-zynqmp obmc-ikvm[392]:&nbsp;&nbsp; what():&nbsp; xyz.ope=
nbmc_project.Common.File.Error.Open: Failed to open a file<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:36 zcu102-zynqmp systemd[1]: Started Phosphor LDAP privilege mappe=
r.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:36 zcu102-zynqmp kernel: audit: type=3D1701 audit(1613150256.355:2=
): auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D392 comm=3D&quo=
t;obmc-ikvm&quot; exe=3D&quot;/usr/bin/obmc-ikvm&quot; sig=3D6 res=3D1<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:36 zcu102-zynqmp phosphor-certificate-manager[363]: Writing privat=
e key to file<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">=85<span lang=3D"EN=
-US"><o:p></o:p></span></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp sh[339]: Fingerprint: sha1!! 31:c8:95:38:53:b4:7d=
:08:94:c9:44:1b:dd:ae:16:71:cc:ec:fd:d1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Finished SSH Key Generation.<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[415]: systemd-coredump@0-395-0.service: P=
rotectHostname=3Dyes is configured, but the kernel does not support UTS nam=
espaces, ignoring namespace setup.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Started Wait for /xyz/openbmc_project=
/control/host0/boot/one_time.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Started Wait for /xyz/openbmc_project=
/control/host0/boot.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: start-ipkvm.service: Main process exi=
ted, code=3Ddumped, status=3D6/ABRT<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: start-ipkvm.service: Failed with resu=
lt 'core-dump'.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Started Wait for /xyz/openbmc_project=
/control/host0/power_restore_policy.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Started Wait for /xyz/openbmc_project=
/control/host0/restriction_mode.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Started Wait for /xyz/openbmc_project=
/led/groups/bmc_booted.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Started Wait for /xyz/openbmc_project=
/time/sync_method.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Started Phosphor LED Group Management=
 Daemon.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Started Phosphor Ldap config updater.=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Started Phosphor SNMP conf Manager.<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Started Phosphor Network Manager.<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Started OpenBMC Software Update Manag=
er.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp phosphor-chassis-state-manager[414]: Initial Chas=
sis State will be Off<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Started Phosphor Chassis State Manage=
r.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Started Wait for /xyz/openbmc_project=
/state/chassis0.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp nslcd[354]: [8b4567] &lt;group=3D&quot;priv-noacc=
ess&quot;&gt; failed to bind to LDAP server ldap://127.0.0.1/: Can't contac=
t LDAP server: Transport endpoint is not connected<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp nslcd[354]: [8b4567] &lt;group=3D&quot;priv-noacc=
ess&quot;&gt; no available LDAP server found, sleeping 1 seconds<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp phosphor-bmc-state-manager[413]: Setting the BMCS=
tate field<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp phosphor-bmc-state-manager[413]: Setting the BMCS=
tate field<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Starting Wait for /xyz/openbmc_projec=
t/led/groups...<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Starting Phosphor Inband IPMI...<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Stopping Network Service...<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp nscd[341]: 341 ignored inotify event for `/etc/re=
solv.conf` (file exists)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp nscd[341]: 341 ignored inotify event for `/etc/re=
solv.conf` (file exists)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd-timesyncd[233]: Network configuration cha=
nged, trying to establish connection.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Platform =
Persistent Storage Archival being skipped.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Starting Phosphor Version Software Ma=
nager...<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp ipmid[426]: JSON file not found<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp ipmid[426]: JSON file not found<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Started Wait for /xyz/openbmc_project=
/led/groups.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd-timesyncd[233]: Network configuration cha=
nged, trying to establish connection.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp nslcd[354]: [7b23c6] &lt;group/member=3D&quot;ava=
hi&quot;&gt; failed to bind to LDAP server ldap://127.0.0.1/: Can't contact=
 LDAP server: Transport endpoint is not connected<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp nslcd[354]: [7b23c6] &lt;group/member=3D&quot;ava=
hi&quot;&gt; no available LDAP server found, sleeping 1 seconds<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp audit[426]: ANOM_ABEND auid=3D4294967295 uid=3D0 =
gid=3D0 ses=3D4294967295 pid=3D426 comm=3D&quot;ipmid&quot; exe=3D&quot;/us=
r/bin/ipmid&quot; sig=3D11 res=3D1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: systemd-networkd.service: Succeeded.<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Stopped Network Service.<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp kernel: audit: type=3D1701 audit(1613150257.355:3=
): auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D426 comm=3D&quo=
t;ipmid&quot; exe=3D&quot;/usr/bin/ipmid&quot; sig=3D11 res=3D1<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: obmc-phosphor-sysd.service: Scheduled=
 restart job, restart counter is at 1.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Started Phosphor BMC State Manager.<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Started Phosphor Inband IPMI.<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Started Phosphor Version Software Man=
ager.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Kernel Tr=
ace File System being skipped.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Create li=
st of static device nodes for the current kernel being skipped.<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Stopped Phosphor System Manager.<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in File Syst=
em Check on Root Device being skipped.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Load Kern=
el Modules being skipped.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in FUSE Cont=
rol File System being skipped.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Starting Network Service...<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp nslcd[354]: [3c9869] &lt;group/member=3D&quot;sys=
temd-network&quot;&gt; failed to bind to LDAP server ldap://127.0.0.1/: Can=
't contact LDAP server: Transport endpoint is not connected<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp nslcd[354]: [3c9869] &lt;group/member=3D&quot;sys=
temd-network&quot;&gt; no available LDAP server found, sleeping 1 seconds<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Platform =
Persistent Storage Archival being skipped.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Bind moun=
t volatile /var/cache being skipped.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Bind moun=
t volatile /var/lib being skipped.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Bind moun=
t volatile /var/spool being skipped.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Bind moun=
t volatile /srv being skipped.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Commit a =
transient machine-id on disk being skipped.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Started FRU Fault monitor service.<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Started Phosphor System Manager.<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Started Network IPMI daemon.<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Check Hos=
t0 status on BMC reset being skipped.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Reached target Host0 running after re=
set.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Start hos=
t0 running after BMC reset being skipped.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Starting Phosphor Host State Manager.=
..<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Started Process Core Dump (PID 430/UI=
D 0).<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[437]: systemd-coredump@1-430-0.service: P=
rivateNetwork=3Dyes is configured, but the kernel does not support network =
namespaces, ignoring.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp audit[435]: ANOM_ABEND auid=3D4294967295 uid=3D0 =
gid=3D0 ses=3D4294967295 pid=3D435 comm=3D&quot;netipmid&quot; exe=3D&quot;=
/usr/bin/netipmid&quot; sig=3D11 res=3D1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp kernel: audit: type=3D1701 audit(1613150257.583:4=
): auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D435 comm=3D&quo=
t;netipmid&quot; exe=3D&quot;/usr/bin/netipmid&quot; sig=3D11 res=3D1<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Started Process Core Dump (PID 438/UI=
D 0).<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp obmc-phosphor-sysd[434]:&nbsp;&nbsp; File &quot;/=
usr/sbin/obmc-phosphor-sysd&quot;, line 26<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp obmc-phosphor-sysd[434]:&nbsp;&nbsp;&nbsp;&nbsp; =
print &quot;obmc-phosphor-watchdogd starting...&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp obmc-phosphor-sysd[434]:&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp obmc-phosphor-sysd[434]: SyntaxError: Missing par=
entheses in call to 'print'. Did you mean print(&quot;obmc-phosphor-watchdo=
gd starting...&quot;)?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[439]: systemd-coredump@2-438-0.service: P=
rivateNetwork=3Dyes is configured, but the kernel does not support network =
namespaces, ignoring.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: obmc-phosphor-sysd.service: Main proc=
ess exited, code=3Dexited, status=3D1/FAILURE<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: obmc-phosphor-sysd.service: Failed wi=
th result 'exit-code'.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp phosphor-host-state-manager[436]: Initial Host St=
ate will be Off<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Started Phosphor Host State Manager.<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Started Wait for /xyz/openbmc_project=
/state/host0.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Starting Reboot If Enabled...<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Starting Reset host sensors...<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp phosphor-discover-system-state[441]: Host power i=
s off, checking power policy<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Starting Phosphor Time Manager daemon=
...<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Finished Reboot If Enabled.<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp phosphor-timemanager[444]: Time mode is changed<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[437]: systemd-coredump@1-430-0.service: P=
rotectHostname=3Dyes is configured, but the kernel does not support UTS nam=
espaces, ignoring namespace setup.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Kernel Tr=
ace File System being skipped.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Create li=
st of static device nodes for the current kernel being skipped.<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in File Syst=
em Check on Root Device being skipped.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Load Kern=
el Modules being skipped.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in FUSE Cont=
rol File System being skipped.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Platform =
Persistent Storage Archival being skipped.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Bind moun=
t volatile /var/cache being skipped.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Bind moun=
t volatile /var/lib being skipped.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Bind moun=
t volatile /var/spool being skipped.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Bind moun=
t volatile /srv being skipped.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Condition check resulted in Commit a =
transient machine-id on disk being skipped.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Starting Time &amp; Date Service...<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp phosphor-mapper[378]: Introspect call failed with=
 error: generic:113, No route to host on process: xyz.openbmc_project.Contr=
ol.Host path: /<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: phosphor-ipmi-host.service: Main proc=
ess exited, code=3Ddumped, status=3D11/SEGV<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: phosphor-ipmi-host.service: Failed wi=
th result 'core-dump'.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[439]: systemd-coredump@2-438-0.service: P=
rotectHostname=3Dyes is configured, but the kernel does not support UTS nam=
espaces, ignoring namespace setup.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: phosphor-reset-sensor-states@0.servic=
e: Succeeded.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Finished Reset host sensors.<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Reached target Host0 (Reset Check).<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: phosphor-ipmi-net@eth0.service: Main =
process exited, code=3Ddumped, status=3D11/SEGV<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: phosphor-ipmi-net@eth0.service: Faile=
d with result 'core-dump'.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[447]: systemd-timedated.service: ProtectH=
ostname=3Dyes is configured, but the kernel does not support UTS namespaces=
, ignoring namespace setup.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Started Time &amp; Date Service.<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd-timedated[447]: Set NTP to enabled (syste=
md-timesyncd.service).<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp phosphor-timemanager[444]: Updated NTP setting<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:37 zcu102-zynqmp systemd[1]: Started Phosphor Time Manager daemon.=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:38 zcu102-zynqmp nslcd[354]: [8b4567] &lt;group=3D&quot;priv-noacc=
ess&quot;&gt; failed to bind to LDAP server ldap://127.0.0.1/: Can't contac=
t LDAP server: Transport endpoint is not connected<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:38 zcu102-zynqmp nslcd[354]: [8b4567] &lt;group=3D&quot;priv-noacc=
ess&quot;&gt; no available LDAP server found, sleeping 1 seconds<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:38 zcu102-zynqmp systemd[1]: start-ipkvm.service: Scheduled restar=
t job, restart counter is at 1.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:38 zcu102-zynqmp systemd[1]: Condition check resulted in Kernel Tr=
ace File System being skipped.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:38 zcu102-zynqmp systemd[1]: Condition check resulted in Create li=
st of static device nodes for the current kernel being skipped.<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:38 zcu102-zynqmp systemd[1]: Stopped OpenBMC ipKVM daemon.<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:38 zcu102-zynqmp systemd[1]: Condition check resulted in File Syst=
em Check on Root Device being skipped.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:38 zcu102-zynqmp systemd[1]: Condition check resulted in Load Kern=
el Modules being skipped.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:38 zcu102-zynqmp systemd[1]: Condition check resulted in FUSE Cont=
rol File System being skipped.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:38 zcu102-zynqmp systemd[1]: Condition check resulted in Platform =
Persistent Storage Archival being skipped.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:38 zcu102-zynqmp systemd[1]: Condition check resulted in Bind moun=
t volatile /var/cache being skipped.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:38 zcu102-zynqmp systemd[1]: Condition check resulted in Bind moun=
t volatile /var/lib being skipped.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:38 zcu102-zynqmp systemd[1]: Condition check resulted in Bind moun=
t volatile /var/spool being skipped.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:38 zcu102-zynqmp systemd[1]: Condition check resulted in Bind moun=
t volatile /srv being skipped.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Feb =
12 17:17:38 zcu102-zynqmp systemd[1]: Condition check resulted in Commit a =
transient machine-id on disk being skipped.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Tan =
Dehui<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_ME3PR01MB80818C6B3280A804A2ECD63FC9689ME3PR01MB8081ausp_--
