Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E88F34C3B6
	for <lists+openbmc@lfdr.de>; Mon, 29 Mar 2021 08:18:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F82Sg4cy5z3046
	for <lists+openbmc@lfdr.de>; Mon, 29 Mar 2021 17:18:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-nuvoton-onmicrosoft-com header.b=QD/Rjkez;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=apc01-sg2-obe.outbound.protection.outlook.com
 (client-ip=40.107.131.78; helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=chli30@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nuvoton.onmicrosoft.com
 header.i=@nuvoton.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-nuvoton-onmicrosoft-com header.b=QD/Rjkez; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310078.outbound.protection.outlook.com [40.107.131.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F82SC3qcFz303G
 for <openbmc@lists.ozlabs.org>; Mon, 29 Mar 2021 17:17:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yw00uIm4z927F5IESVMM97jKduNnmrOcVG2JSINpiOCRKv6wUrO5tn9cNeB7tsXGaZwSN4dP3G3wlr9HkeFSL+byFzNjpGiIL60w7XOtwIC+0T1bLbGT/Dzbn3uWpwFPM3xqtw7VeRwTj6AhkEVFFlnEEaSPTB8gfOlq9IxshIdSnwvFhosFXNm4UP49rxX7fGaRoiFwDyhnhHmb71FJH/eVs0zWapUOm8NXcx5m8U5zcBquqzbKcT+c1zD0VGWpk8QkMr2zmqM00NIYHyEOAlTAdYm5WCyvfL05FTPCi+GmReRTmmLPovF6Wa95UHClfkrR19rIQGYAfJtOdX66lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1W86YY9nyXjmA/Ga8/N4DdowKyV/5D0ae/+QUe+ca5g=;
 b=RxjY1chtLBeVifS6uYGs5PC1QDisWTwPzmwYcVQzLFr1pHsfNndrL3dSmg8YBH1ubwxGEzYeEmERbGb8g3iVFZqxYCmHpvpfR+X+mESdyZ43Fy7uIbRprXH4yjApOfmulsBpWCQWahYLmPIHcDBbEGv26eHQiDDjf8Nhlfdsb52ylQmQXGHtXWCk2W2uJBxyBWy7oQrz3pTB3C/HCElYsHqv3uj4KYPSrlrQEo9tv1iB8rFPhr9otz15ofSrq5xYO5iqQSS6ik0H7L6xT947HWAWzaXpNKPpk6Q3fvbriF8x6MRKOFpffrNs2lrfXOMjbAe9/eF/ZaflSuXIkZLIlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1W86YY9nyXjmA/Ga8/N4DdowKyV/5D0ae/+QUe+ca5g=;
 b=QD/RjkezZStIEfKiYjW62ithBIvNXvtcm0W58K1W+VZL3lfrLSBWdATKFMVoBH5qPFiBiznnGx0cTFlGL/HiWWrBfDh1AGj2GYbmBJMhmZp/Qouw2Ulyp9wvkEi6NLOMGpYuNjN3gd2KJB3lLMxPIgMFyx8ZvMiaaJ+uNtWXvCA=
Received: from HK0PR03MB5090.apcprd03.prod.outlook.com (2603:1096:203:bf::11)
 by HK2PR03MB4257.apcprd03.prod.outlook.com (2603:1096:202:1c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.17; Mon, 29 Mar
 2021 06:17:37 +0000
Received: from HK0PR03MB5090.apcprd03.prod.outlook.com
 ([fe80::ccf4:f360:d6ac:ae8c]) by HK0PR03MB5090.apcprd03.prod.outlook.com
 ([fe80::ccf4:f360:d6ac:ae8c%6]) with mapi id 15.20.3999.021; Mon, 29 Mar 2021
 06:17:37 +0000
From: CS20 CHLi30 <CHLI30@nuvoton.com>
To: CS20 CHLi30 <CHLI30@nuvoton.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: [OpenBMC] [Linux-5.10] useradd: cannot open /etc/passwd
Thread-Topic: [OpenBMC] [Linux-5.10] useradd: cannot open /etc/passwd
Thread-Index: AdckYUdVvnoSdGPcThuquxaeQmoqIA==
Date: Mon, 29 Mar 2021 06:17:37 +0000
Message-ID: <HK0PR03MB5090B60085F8D0C40B0D9496CF7E9@HK0PR03MB5090.apcprd03.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nuvoton.com; dkim=none (message not signed)
 header.d=none;nuvoton.com; dmarc=none action=none header.from=nuvoton.com;
x-originating-ip: [60.250.194.160]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b0089f7d-62f3-4032-3ea2-08d8f27a599c
x-ms-traffictypediagnostic: HK2PR03MB4257:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK2PR03MB4257C4CC857D4FCF34F7AD04CF7E9@HK2PR03MB4257.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1079;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hbg+C7uUkt7I2gEcrfxzBSYpiPZ/w/DKc3KD+LkslF99jwov9nkjFZ9xbuuFVlFCLDfbgTogcXbCD5R/nNTdSVdsRuP3MoINhmmChxGNp+t9prWu4LIK/vpQjOrVAEe2pFKdzvUHf7EjLrepCG8tQpQ2zIzwbEgFrAgrL0jGgMbR2AxqYfxBzUE7dXjdzYDWl5pW1poS0ZmI+hZj6FpsIbK6VfyOLlj+uGd/He/X7nhmoe8Ea+VlXz7DgsDPlj1Wx+5rosoze2/KtnyRbmNtSAfwygmlfI6kkq0LWezrl5Nzfkri2DW1a9VWr6am2fXv4V6blAr7I25q8J+fi1O69thKwF/mv/FlQdffmQbRi6J6Bevx5Pu+FKX7L39GhxmWI1Ok6jPAdNiUqb26yDLm8FYfLjwPEcy0I6cTL7j/pl/dusKlveJ/fTI2LwFRSVjjYYd9vfV4XTl8eD4pYR+D2PoNJ8H0HhBWUC9jcFD0Nh6L/j45Ea0oIKTA8t0Vb+Grm1mvi4C7Y8/SF02seCSqvQ+rplj2sCOjN+km/xghhdmaiKzdd6xoP8D/+DPOOWzHRXkiSaHiLLMhPz+60Yhv8D8DCkw/kr2anvhByZEWRhAFSBYvsPnMSRXPSTPqgoJPHXeRiFDQeAzRWC1HIhdz6T+bQ35X21LjH/Dz6Hoo8cM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR03MB5090.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(396003)(39850400004)(376002)(346002)(83380400001)(38100700001)(71200400001)(5660300002)(7696005)(52536014)(316002)(55016002)(64756008)(110136005)(9686003)(6506007)(66476007)(66946007)(66446008)(2906002)(8676002)(26005)(33656002)(478600001)(86362001)(186003)(8936002)(76116006)(66556008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?OWf89kQoWFAYIywB5XzSMIbwQE+4p0ufs8jr9y0PstYud2wk4a8UFvLdjzfN?=
 =?us-ascii?Q?lrevMq/KGGHKZWn3nhYZ4MpABlA9tF+uAX2qiNaQ7keojJ8/NBh9Gy65VJ3i?=
 =?us-ascii?Q?FOJM6ralWuDyJYh3V6OABxjAiDY04pjsWqE1wwA5QjIzfD24+fOZBVN3RZL+?=
 =?us-ascii?Q?4hGBfcen2ruUwxeCzvjm9r6NPNfb5PUiqrNCGNhtNs50Tx7iE/ovkW4U6mfF?=
 =?us-ascii?Q?nk+fgijgq1qzvxcARx3CFu+uDqOAzi9MMJ9EmgDyWv+Ik0ggjDPm5yNKSDFt?=
 =?us-ascii?Q?8aOd82hcli/AmwTc6gW/n+FPh5EDW1SlHBstXhS38Aak9vlgey4Tr9DFiQIt?=
 =?us-ascii?Q?7GfJFntSFY2NG+o7wRaDH7PoaeD4q8IvyZfN7HxNzNd245u1g8XvauSH9/G8?=
 =?us-ascii?Q?Bb+2ls57zgMGhdXHsuCpSHw9SLOtqg3bdwa31jwUnDLirf0C0js6hWnKWDOJ?=
 =?us-ascii?Q?JtwMx+URn2Unew9pr4aHkHJMgov4aZddwlQc65B0vL759PzayiTNrnDGeodQ?=
 =?us-ascii?Q?g26FIkmVyCZll7QAYpBuJwm/L81FM9uyEuycDFLr00N9L2HJcPPWFOF4ZYVI?=
 =?us-ascii?Q?DvRRty7PnztIqqmZ/VwY7mpRySyU0UJCpPo9nBtDB1QvfSh/R/htjNIXIhnF?=
 =?us-ascii?Q?q6S6i30JeMK+AnUn3iD7QVNMpiD2p7GBPgqiPac8CQzO/fLge6EKdGX5t5Vs?=
 =?us-ascii?Q?tXpkwUPcXThPh5FMB6EDlxSuyXJXG5Q2e0ITW9iVvrhZG12hHYLGvNMlCgCK?=
 =?us-ascii?Q?oJAkfH/pXBX+QTDsmxEaJg2PPfmyK/oLhPdBn+pOAtT5nGQ9rph3pXvsZdDc?=
 =?us-ascii?Q?Z2eLrCsQM7/BC0OYfO6Uuc5cc0FQHEUZdJ0pVpX0pXKlnMj7fN6c93ac8JUg?=
 =?us-ascii?Q?p35qkIAQrJrcwIqQOdtc+V4hWJi2W+6IHB4VdukGZhb+LrP4qOwd+kYzrH5r?=
 =?us-ascii?Q?4q9sY8T7lEaSXeltW+n7vLTdeK9l00wqBvYCpIEi43bLWXrDJmLAU156bTyl?=
 =?us-ascii?Q?Da21B9rVlOO8ZBD3yrDPz/v/BcibC0/O8zVH6ZnJMhCkgJtFYoLFJ53XcJ/N?=
 =?us-ascii?Q?ulYjnllfVyBX8Gz1mTOelvv072OI4FLKh3T7mTTgEpsKSITSSFLz7cCFz7dR?=
 =?us-ascii?Q?XY7+IW7QkfZyX7xa4LF7mz+SbRZ8WXZt2SlkNqjVWuKz0T36lzGX6pjoIizt?=
 =?us-ascii?Q?KxuyhJBVv7vljBopLvUtQ/4Mslbexf3q9FuJI08hY9TSqBHacR+pf4Xj6iGW?=
 =?us-ascii?Q?J1YMTOK/1WkRog7D30SJpEZ6uTsrdRu42AEg6vC8oTLYo7d8tHTARv1zurPx?=
 =?us-ascii?Q?FkclvM4RWJPMozBgoUw15l+Y?=
Content-Type: multipart/alternative;
 boundary="_000_HK0PR03MB5090B60085F8D0C40B0D9496CF7E9HK0PR03MB5090apcp_"
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR03MB5090.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0089f7d-62f3-4032-3ea2-08d8f27a599c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2021 06:17:37.4999 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gG8qRSFc4GHt8IDYCnkyHZsXtAeL9mLvqxValGTXuqwVzGFLa20txjU1pyM6nelWm+uBTESf3yU7lFBTZqB+8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR03MB4257
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

--_000_HK0PR03MB5090B60085F8D0C40B0D9496CF7E9HK0PR03MB5090apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

We met this issue symptom after upgrading Linux kernel to 5.10.xx.
However, we didn't meet this issue at kernel 5.4 and 5.8.

And, we had run QEMU with latest palmetto 5.10.23 image, issue symptom also=
 can be repo it.
Is there anyone meet this issue at Linux kernel 5.10.xx? From journal log, =
we didn't find any obvious log about this symptom.
This issue is easy to repo and 100%, you can follow below repo step on your=
 OpenBMC project to repo it. Thanks.

Symptom:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
Ipmi.Test Ipmi User :: Test suite for OpenBMC IPMI user management.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
Verify IPMI User Summary :: Verify IPMI maximum supported IPMI use...
| FAIL |
Set User Name command failed (user 9, name HgekZnCI): Unspecified error: 1 =
!=3D 0

Journal Log:
olympus-nuvoton kernel: Linux version 5.10.14-711b69d-dirty-08f25ae (oe-use=
r@oe-host)
Mar 18 14:42:26 olympus-nuvoton phosphor-user-manager[1409]: useradd: canno=
t open /etc/passwd
Mar 18 14:42:26 olympus-nuvoton useradd[1409]: failed adding user 'HgekZnCI=
', data deleted
Mar 18 14:42:26 olympus-nuvoton phosphor-user-manager[288]: The operation f=
ailed internally.
Mar 18 14:42:26 olympus-nuvoton phosphor-user-manager[288]: Unable to creat=
e new user
Mar 18 14:42:26 olympus-nuvoton phosphor-user-manager[288]: The operation f=
ailed internally.

How to repo:
1. Run robot -t Verify_IPMI_User_Summary ipmi/test_ipmi_user.robot or
2. Execute useradd command to add user in our Olympus-nuvoton runbmc device=
.
  root@olympus-nuvoton:/# useradd timlee
  useradd: cannot open /etc/passwd

QEMU for plametto test result:
root@palmetto:~# cat /proc/version
Linux version 5.10.23-6687842 (oe-user@oe-host) (arm-openbmc-linux-gnueabi-=
gcc (GCC) 10.2.0, GNU ld (GNU Binutils) 2.36.1.20210209) #1 Sun Mar 28 20:5=
4:20 UTC 2021
root@palmetto:~# useradd timlee
useradd: cannot open /etc/passwd

Debug:
We had added more debug log in overlayfs driver, but seems all overlayfs fu=
nction call normally without error code return.
Here is the part of log after executing useradd command.

root@olympus-nuvoton:/# useradd timlee66
Mar 24 05:21:41 olympus-nuvoton kernel: overlayfs: open(a6b0076c[sbin/usera=
dd/l], 0400040) -> (581ac127, 0401400040)
Mar 24 05:21:46 olympus-nuvoton kernel: overlayfs: open(c2f826cb[etc/nsswit=
ch.conf/l], 00) -> (f971c00e, 0401000000)
Mar 24 05:21:46 olympus-nuvoton kernel: overlayfs: open(6fc219b2[etc/ld.so.=
cache/l], 0400000) -> (0d21569c, 0401400000)
Mar 24 05:21:46 olympus-nuvoton kernel: overlayfs: open(48a47202[lib/libnss=
_files-2.32.so/l], 0400000) -> (ee6b0bfe, 0401400000)
Mar 24 05:21:46 olympus-nuvoton kernel: overlayfs: open(3c1f263f[etc/passwd=
/l], 00) -> (b7939c0b, 0401000000)
Mar 24 05:21:46 olympus-nuvoton kernel: overlayfs: open(176fd21b[etc/ld.so.=
cache/l], 0400000) -> (d2e6be78, 0401400000)
Mar 24 05:21:46 olympus-nuvoton kernel: overlayfs: open(607e8d70[lib/libnss=
_ldap.so.2/l], 0400000) -> (57f4f2f1, 0401400000)
Mar 24 05:21:52 olympus-nuvoton kernel: overlayfs: create(etc/passwd.985, 0=
100600) =3D 0
Mar 24 05:21:52 olympus-nuvoton kernel: overlayfs: open(c46e5b8b[etc/passwd=
.985/u], 0400001) -> (ef6449e9, 0401400001)
Mar 24 05:21:52 olympus-nuvoton kernel: overlayfs: link(etc/passwd.985, etc=
/passwd.lock) =3D 0
Mar 24 05:21:52 olympus-nuvoton kernel: overlayfs: create(work/#1b, 0100000=
) =3D 0
Mar 24 05:21:52 olympus-nuvoton kernel: overlayfs: unlink(work/#1b) =3D 0
Mar 24 05:21:52 olympus-nuvoton useradd[985]: failed adding user 'timlee', =
data deleted
useradd: cannot open /etc/passwd

Best regards,
Tim
________________________________
The privileged confidential information contained in this email is intended=
 for use only by the addressees as indicated by the original sender of this=
 email. If you are not the addressee indicated in this email or are not res=
ponsible for delivery of the email to such a person, please kindly reply to=
 the sender indicating this fact and delete all copies of it from your comp=
uter and network server immediately. Your cooperation is highly appreciated=
. It is advised that any unauthorized use of confidential information of Nu=
voton is strictly prohibited; and any information in this email irrelevant =
to the official business of Nuvoton shall be deemed as neither given nor en=
dorsed by Nuvoton.

--_000_HK0PR03MB5090B60085F8D0C40B0D9496CF7E9HK0PR03MB5090apcp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 1 6 1 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-TW" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi All,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">We met this issue symptom after=
 upgrading Linux kernel to 5.10.xx.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">However, we didn't meet this is=
sue at kernel 5.4 and 5.8.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">And, we had run QEMU with lates=
t palmetto 5.10.23 image, issue symptom also can be repo it.<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Is there anyone meet this issue=
 at Linux kernel 5.10.xx? From journal log, we didn&#8217;t find any obviou=
s log about this symptom.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">This issue is easy to repo and =
100%, you can follow below repo step on your OpenBMC project to repo it. Th=
anks.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">Symptom:<o:p></o:p></span></=
b></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Ipmi.Test Ipmi User :: Test sui=
te for OpenBMC IPMI user management.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Verify IPMI User Summary :: Ver=
ify IPMI maximum supported IPMI use...<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">| FAIL |<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Set User Name command failed (u=
ser 9, name HgekZnCI): Unspecified error: 1 !=3D 0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">Journal Log:<o:p></o:p></spa=
n></b></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">olympus-nuvoton kernel: Linux v=
ersion 5.10.14-711b69d-dirty-08f25ae (oe-user@oe-host)<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Mar 18 14:42:26 olympus-nuvoton=
 phosphor-user-manager[1409]:
<b>useradd: cannot open /etc/passwd</b><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Mar 18 14:42:26 olympus-nuvoton=
 useradd[1409]: failed adding user 'HgekZnCI', data deleted<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Mar 18 14:42:26 olympus-nuvoton=
 phosphor-user-manager[288]: The operation failed internally.<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Mar 18 14:42:26 olympus-nuvoton=
 phosphor-user-manager[288]: Unable to create new user<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Mar 18 14:42:26 olympus-nuvoton=
 phosphor-user-manager[288]: The operation failed internally.<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">How to repo:<o:p></o:p></spa=
n></b></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">1. Run robot -t Verify_IPMI_Use=
r_Summary ipmi/test_ipmi_user.robot or<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">2. Execute useradd command to a=
dd user in our Olympus-nuvoton runbmc device.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp; root@olympus-nuvoton:/# =
useradd timlee<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp; <b>useradd: cannot open =
/etc/passwd<o:p></o:p></b></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; <o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">QEMU for plametto test resul=
t:<o:p></o:p></span></b></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">root@palmetto:~# cat /proc/vers=
ion<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Linux version 5.10.23-6687842 (=
oe-user@oe-host) (arm-openbmc-linux-gnueabi-gcc (GCC) 10.2.0, GNU ld (GNU B=
inutils) 2.36.1.20210209) #1 Sun Mar 28 20:54:20 UTC 2021<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">root@palmetto:~# useradd timlee=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">useradd: cannot open /etc/pa=
sswd<o:p></o:p></span></b></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">Debug:<o:p></o:p></span></b>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">We had added more debug log in =
overlayfs driver, but seems all overlayfs function call normally without er=
ror code return.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Here is the part of log after e=
xecuting useradd command.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">root@olympus-nuvoton:/# useradd=
 timlee66<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Mar 24 05:21:41 olympus-nuvoton=
 kernel: overlayfs: open(a6b0076c[sbin/useradd/l], 0400040) -&gt; (581ac127=
, 0401400040)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Mar 24 05:21:46 olympus-nuvoton=
 kernel: overlayfs: open(c2f826cb[etc/nsswitch.conf/l], 00) -&gt; (f971c00e=
, 0401000000)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Mar 24 05:21:46 olympus-nuvoton=
 kernel: overlayfs: open(6fc219b2[etc/ld.so.cache/l], 0400000) -&gt; (0d215=
69c, 0401400000)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Mar 24 05:21:46 olympus-nuvoton=
 kernel: overlayfs: open(48a47202[lib/libnss_files-2.32.so/l], 0400000) -&g=
t; (ee6b0bfe, 0401400000)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Mar 24 05:21:46 olympus-nuvoton=
 kernel: overlayfs: open(3c1f263f[etc/passwd/l], 00) -&gt; (b7939c0b, 04010=
00000)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Mar 24 05:21:46 olympus-nuvoton=
 kernel: overlayfs: open(176fd21b[etc/ld.so.cache/l], 0400000) -&gt; (d2e6b=
e78, 0401400000)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Mar 24 05:21:46 olympus-nuvoton=
 kernel: overlayfs: open(607e8d70[lib/libnss_ldap.so.2/l], 0400000) -&gt; (=
57f4f2f1, 0401400000)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Mar 24 05:21:52 olympus-nuvoton=
 kernel: overlayfs: create(etc/passwd.985, 0100600) =3D 0<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Mar 24 05:21:52 olympus-nuvoton=
 kernel: overlayfs: open(c46e5b8b[etc/passwd.985/u], 0400001) -&gt; (ef6449=
e9, 0401400001)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Mar 24 05:21:52 olympus-nuvoton=
 kernel: overlayfs: link(etc/passwd.985, etc/passwd.lock) =3D 0<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Mar 24 05:21:52 olympus-nuvoton=
 kernel: overlayfs: create(work/#1b, 0100000) =3D 0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Mar 24 05:21:52 olympus-nuvoton=
 kernel: overlayfs: unlink(work/#1b) =3D 0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Mar 24 05:21:52 olympus-nuvoton=
 useradd[985]: failed adding user 'timlee', data deleted<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">useradd: cannot open /etc/passw=
d<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Best regards,<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Tim<o:p></o:p></span></p>
</div>
<hr align=3D"center" width=3D"100%">
<span style=3D"font-size:12pt;line-height:0.7;font-family: 'Arial'; color:#=
808080">The privileged confidential information contained in this email is =
intended for use only by the addressees as indicated by the original sender=
 of this email. If you are not the
 addressee indicated in this email or are not responsible for delivery of t=
he email to such a person, please kindly reply to the sender indicating thi=
s fact and delete all copies of it from your computer and network server im=
mediately. Your cooperation is highly
 appreciated. It is advised that any unauthorized use of confidential infor=
mation of Nuvoton is strictly prohibited; and any information in this email=
 irrelevant to the official business of Nuvoton shall be deemed as neither =
given nor endorsed by Nuvoton.
</span>
</body>
</html>

--_000_HK0PR03MB5090B60085F8D0C40B0D9496CF7E9HK0PR03MB5090apcp_--
