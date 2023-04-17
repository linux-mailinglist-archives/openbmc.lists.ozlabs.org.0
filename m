Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4973B6E403A
	for <lists+openbmc@lfdr.de>; Mon, 17 Apr 2023 08:56:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q0Hrk0mybz3cMc
	for <lists+openbmc@lfdr.de>; Mon, 17 Apr 2023 16:56:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=pliops.onmicrosoft.com header.i=@pliops.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-pliops-onmicrosoft-com header.b=XN9WTwGW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pliops.com (client-ip=2a01:111:f400:7e1a::627; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=liorw@pliops.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=pliops.onmicrosoft.com header.i=@pliops.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-pliops-onmicrosoft-com header.b=XN9WTwGW;
	dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on20627.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1a::627])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0Hr43phhz3c41
	for <openbmc@lists.ozlabs.org>; Mon, 17 Apr 2023 16:55:30 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QG6xOhGD9tglAKIzzKcTnl0KvOv6qyvtXkL/LyC6CLIylWq50bUplh3SJACXf1MwpSb4GaXFsEVyyM8Vl59fDqvAaQ4PxPJEEJojOLP+CAPGqrp599bu+HOK61T7/BOVRuhTbi7IiaFq+6P6M6daebmW4x5hjL3VaGWhc37OMgvLl69rJl+2cBpqzKVbbhJU8agWh+mY5o5tO2Zu+eZQ9CPQJibJZVFDlmGel/d/OUYNi1FBjgozUwSS2bK7FuSyPlGGFkJClSLKhcaaZN3/HGe2/tsEpKvsFdKFAtfjWA8/DTTzfsusTEeditR6zMcr+EaMntbjIKME6bSGQZX0WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=61hLKxDztyq9+l1ZQ9mv4s1a6RYxqUithyNWQGkSCOE=;
 b=UhxzouJ5O877JLyvIthx/9SFRSWKXPfuetWoBV17Jdnm3RVu5U2pMCT6QqHaG4MKrklIM6XO8r++Fg75TUqzRqf1lPKXbqoHPsIMUThRI5VnfzDsR5bhAb+jzo0SZc468CZntwrWbD53T8lOMPkWPYFbnPnetaYNkblEh8u5lpthwU633XR7pHEjVkuJ213UF0TaCTVoShp3kUZZDb6P3qlqxTYBucH/F2kSuqdxpOQiQHLj47sN43+E96AHqOg0ofU2g+gAxTtAIO2VD4+M/QWaSoh/9tiaR9fDrIp+veG8SSC/esH5Q2nCAutcaFSNonBk66dobKQhWtKvu+3n5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=pliops.com; dmarc=pass action=none header.from=pliops.com;
 dkim=pass header.d=pliops.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pliops.onmicrosoft.com; s=selector2-pliops-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61hLKxDztyq9+l1ZQ9mv4s1a6RYxqUithyNWQGkSCOE=;
 b=XN9WTwGWwNiWQ+jCOSCB0tuzJYTTqzLEvQJJ0L1zA0lf2cyCm6E7TnnaKTCWyfkoSn4usrgbp97Fd3iAUm/jGJyg3ueTYvL03rvenrNUlgtvCJxW0iCgg4Z4lduyjhybq3Q0CeKhX4JEwnokQp4fQw3pzlWcGx7C7x7ADcPhpyA=
Received: from PR3P195MB0555.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:30::14)
 by PR3P195MB0617.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:31::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 06:55:08 +0000
Received: from PR3P195MB0555.EURP195.PROD.OUTLOOK.COM
 ([fe80::2376:d467:719a:c91c]) by PR3P195MB0555.EURP195.PROD.OUTLOOK.COM
 ([fe80::2376:d467:719a:c91c%8]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 06:55:05 +0000
From: Lior Weintraub <liorw@pliops.com>
To: Andrew Jeffery <andrew@aj.id.au>, Patrick Williams <patrick@stwcx.xyz>,
	Ryan Chen <ryan_chen@aspeedtech.com>
Subject: RE: OpenBMC porting to portwell pcomc660-ast2600 device.
Thread-Topic: OpenBMC porting to portwell pcomc660-ast2600 device.
Thread-Index: Adlvg6fi1hXH38M1TxmitTi5f2yoIABVM/2AAAYX0AA=
Date: Mon, 17 Apr 2023 06:55:05 +0000
Message-ID:  <PR3P195MB055565CDA894F11E456057E7C39C9@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
References:  <PR3P195MB055571D5873D3A5F1425213BC39E9@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
 <be8000ad-722b-418a-8629-ea7c90805782@app.fastmail.com>
In-Reply-To: <be8000ad-722b-418a-8629-ea7c90805782@app.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=pliops.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3P195MB0555:EE_|PR3P195MB0617:EE_
x-ms-office365-filtering-correlation-id: 8fdc9be6-0052-4789-637a-08db3f10acd1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  /L4uohbCjmr1c0p8N6rF96ThbF7etHTNsx4zGfnW3THzBfym/kHkhdcTa6F1MOv7jiCZNMbyFOPt/JvwD0AqHGozamJdsxhz8pk+JQAnNbr4VDKtTbmB/oSAUhOW9xGIZpveix60DZ9bqRpyq4PHDTM932f1dJkx1A68u+bAQmlBYgKFfFoesyOdBrkiEGYw0vCv9QMGuz31A6HNt1oUXWLz+0UHtKXo7U2hNt6NYcyte3Se6Ad/KR5DIZ4MVFDvwTOk0YobDVrf8lsYYcf9XFPfbA+uZeRZ+m9uQd2Uoha0xnN6qst6ovMUlcJASUMrmob+rtbT90LNttNr1n956RDNvnZWTOun5iFOIzlkpMYic7HttMLAEkeoTF5Ot7dLpX0MFE/XCOsNKTAEIZ4XleW1Ugk5DSVhEJO+aiO4aGsAxgHQoMEhtAYt45p7viDEM1ewo1KR71iUjRIsiyqWGOrnEvyg2ISb+hEfxweuGpWxx9WBEDvDXVqsP8EsmI4thQf6fd5SW+SUl2xBqbCu+C/1Jdt0J2Viup2AOIvFbEGFYlxdPa8RaTyLIQkBpqN9LqNkuUzzRhHsI+8U2XgEbDjZMf+OEg1XjIAZsCb8GFA=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3P195MB0555.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(396003)(136003)(39840400004)(376002)(451199021)(5660300002)(8676002)(8936002)(41300700001)(52536014)(4326008)(76116006)(316002)(66556008)(66446008)(66946007)(66476007)(64756008)(2906002)(66899021)(110136005)(478600001)(86362001)(7696005)(966005)(38070700005)(38100700002)(6506007)(186003)(53546011)(9686003)(122000001)(71200400001)(55016003)(16799955002)(83380400001)(26005)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?norUb1njFFMvqRqcnff9YlCOdbTR+L2yjagUnYTmsBC+Q/mbgG4ZCxKo1oyM?=
 =?us-ascii?Q?V1EUNIe8/VSfW5CihP8/dYvwjSWrtp4PnhhKTCQ2rabMVUNavEFq+T7oYV9f?=
 =?us-ascii?Q?U1xI+NcKsDitAL+Si28vLenul9nYPl7ZdEZGjjoOTS9v8HBWG4t81pZ0dxMW?=
 =?us-ascii?Q?jS+InEaToLMcQr2Ur5fX0PqhbP4mYyObqXkV4qqltu2KXHQOm5UaLp5YuXok?=
 =?us-ascii?Q?+g23c5Xo/+QlnefY6fp/EwhljKfD/06ezSxaS9NUzpO1xTIo0F25iCHPpjbb?=
 =?us-ascii?Q?x57hcKSA1i3+h2ytGivLLCIqw58VhnOKRKSa0uwvS0BW5tDLHdGigKmv72c3?=
 =?us-ascii?Q?V757SMMCR0YFQUvtVgjOwR7eRoWSD4oNiX5mGx18rPQ/ktbnLcAeygBzwxKc?=
 =?us-ascii?Q?arVWEDCtnDzpowjHHevovmbfbjSK3EanXFh6V7w5aHoHToonFvaPsGbhFmW3?=
 =?us-ascii?Q?Usn0ra2HdvaspE1KcY153CQTHz1oVmasMgsm3b5Ebq3DpT0jkvWhhz33LnOj?=
 =?us-ascii?Q?MFJDuFKODRRA6CIl93Glu6PA0QxlZSZOUHPh0dOzx54eQXOPf+UBctwW91fK?=
 =?us-ascii?Q?3gxey7Y1cedIEpoOvokZsXUF++kdy3Q6JJ1ARN35cHKMjCabf5TcBomqGTdI?=
 =?us-ascii?Q?RlKkP5YkcFJR9vcy8i0oibn228w9VtlmGK7mHmSHg/ZKdPkSZ25JdCn9UaQV?=
 =?us-ascii?Q?Lx2klGeWOhNwqpMUtujPQ6psOLJcu3TsSNI2ohSoK2z3+DM3V/foQhlce3/w?=
 =?us-ascii?Q?uhW9jYzT7e7E9+DpwFUE0fPILBZt+dMz6rUZcmp9LZ2VuX61GAuPEbKrMQj0?=
 =?us-ascii?Q?dxXs0aRyApyQuodo7LjQIIWj9KfNsuK3x+cyDLdebUryUBAQaBeI+PjJCR43?=
 =?us-ascii?Q?QrzqI+kzopYDckWEgIkPRsFilQXLhMLlv33lRnlWmi/WrCvbiRNSbb327ZTy?=
 =?us-ascii?Q?WwKGjL1+LtFNsXq2bLV3WhJ4/DiQPqQsbt5ZP4ZVZf+4ZAfeOaDfdS28ysQx?=
 =?us-ascii?Q?21giqthRJ0KfuNiXbVKxAvqjakHqWCC8Crsmb7yf7bxNNOy7sxJlC45mq8Um?=
 =?us-ascii?Q?B3QeB7g/q/C5bY6ZGDqs6IzhNpyJHVO4695pCrgLkEVDRAXVmH8WYX8o+JmG?=
 =?us-ascii?Q?FMBPrK3tRw1b9Ads9dzHT1w8rioeLbpn1J08WdFOoWp+eQf3y1bYkxhOtClV?=
 =?us-ascii?Q?EoA5xTOg3NXxS7UZTSE6y3Ilbzj7uJBgAg5wes6tv0T41rN2d41JMn2v9oSo?=
 =?us-ascii?Q?ARq+8bC2nL1s5c4Shl6LtmRnA55+pWYxaKYptMPcrq53npErdpr0OZFcP8TC?=
 =?us-ascii?Q?adrswPTVWrupC64aVxrt4f8a85ZVYFpLwERcMxyishVhdVarTVHCGTJWqdRX?=
 =?us-ascii?Q?9mK9OfKWR2snaSeV/cWGKaB7NAcNcorvamgaXWOoQaPg/YKNEpo6rYpvHlUA?=
 =?us-ascii?Q?zW5rT8X11W9KeHRNHRqIKtXPosXa99S+jBxA8A7bjKyCzwYnma33kocwpHUP?=
 =?us-ascii?Q?n5OwySXFD9rnXVBeTi5QlRkyHKdWQzwk3c0KWf8uyFhVvrkRPhVfDLQwymQV?=
 =?us-ascii?Q?wAYl4X9x8WlpR+i1fNk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: pliops.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3P195MB0555.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fdc9be6-0052-4789-637a-08db3f10acd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2023 06:55:05.4203
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 40fe8f47-55ac-403a-a5ab-1be3dd209cf8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VI7MGgYWIbSXM3DYDuKYtgz2/WxsydhTodXNzbvkhhMII3UFr3JPqPBh8RkoNySanAUpZtRo7qm1O0CtQue+iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P195MB0617
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

Hi Andrew,

The AST2600 Development kit from Portwell comes with a slightly old version=
 of OpenBMC.
The sources came as a tar.xz file and could be downloaded from: https://www=
.dropbox.com/s/t2nb11mkuoisj0s/PCOM-C660-AST2600_BSP_20211210.tar.xz?dl=3D0

What I try to do is to get the latest OpenBMC codebase and integrate meta-p=
ortwell layer from the old sources (dated from Dec. 2021).
If you take a look on the 3 last commits from https://github.com/wlbe4/open=
bmc/tree/portwell, you can see my migration attempt.

I have upgraded the linux-aspeed version they used (5.10.67) to 6.1.15 but =
left their patch as it includes the device tree for their platform.
I have removed the patch they had for u-boot-aspeed-sdk as an attempt to so=
lve the errors I got even though I think this patch might be needed.

The current build error with u-boot-aspeed-sdk is:
build/pcomc660-ast2600/tmp/work/pcomc660_ast2600-openbmc-linux-gnueabi/u-bo=
ot-aspeed-sdk/1_v2019.04+gitAUTOINC+fd915728e1-r0/git/lib/smbios.c:84:58: e=
rror: 'U_BOOT_DMI_DATE' undeclared (first use in this function)
   84 |         t->bios_release_date =3D smbios_add_string(t->eos, U_BOOT_D=
MI_DATE);

Regarding the errors I had with obmc-console:
ERROR: /media/data/workspace/openbmc/openbmc-fork/meta-phosphor/recipes-pho=
sphor/console/obmc-console_git.bb: Unable to get checksum for obmc-console =
SRC_URI entry obmc-console.conffile: file could not be found

Their original code included a bbappend file for the obmc-console:
FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}/:"
OBMC_CONSOLE_HOST_TTY =3D "ttyS0"

SRC_URI:remove =3D "file://${BPN}.conf"
SRC_URI:append =3D "file://server.ttyS0.conf"

do_install:append() {
        # Remove upstream-provided configuration
        rm -rf ${D}${sysconfdir}/${BPN}

        # Install the server configuration
        install -m 0755 -d ${D}${sysconfdir}/${BPN}
        install -m 0644 ${WORKDIR}/*.conf ${D}${sysconfdir}/${BPN}/
        # Remove upstream-provided server configuration
        rm -f ${D}${sysconfdir}/${BPN}/server.ttyVUART0.conf
}

I suspected that their removal of "file://${BPN}.conf" wasn't welcomed by t=
he obmc-console_git.bb recipe=20
So I just commented it all out (except for the first line), copied the obmc=
-console.conf and the error was gone.=20

Their server.ttyS0.conf file included:
local-tty =3D ttyS0
baud =3D 115200
So I have and added the local-tty line to my obmc-console.conf copy.

I am not sure that the console will work after my changes as I currently do=
n't have the board for testing (will arrive in 2 weeks time).
So I am currently focusing my efforts on migration and fixing the compilati=
on errors.

Thanks for your help,
Lior.
=20
-----Original Message-----
From: Andrew Jeffery <andrew@aj.id.au>=20
Sent: Monday, April 17, 2023 5:58 AM
To: Lior Weintraub <liorw@pliops.com>; Patrick Williams <patrick@stwcx.xyz>=
; Ryan Chen <ryan_chen@aspeedtech.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: OpenBMC porting to portwell pcomc660-ast2600 device.

CAUTION: External Sender

Hi Lior,

On Sat, 15 Apr 2023, at 20:08, Lior Weintraub wrote:
> Hi Guys,
>
> I have forked the openbmc project and opened a "portwell" branch from=20
> it's "master".
> The repo is under: https://github.com/wlbe4/openbmc I am trying to=20
> port OpenBMC into this board:
> https://portwell.com/solutions/openBMC.php
>
> My first commit to this branch was the original code of meta-portwell=20
> layer given to me by Portwell support (PCOM-C660-AST2600_BSP_20211210).
> The second commit tries to migrate meta-portwell layer to the latest=20
> Yocto syntax.
>
> Changes include (among others):
> 1. replace _append with :append
> 2. replace _prepend with :prepend
> 3. move bblayers.conf.sample, conf-notes.txt and local.conf.sample=20
> into templates/default folder.
> 4. Try to fix build errors on u-boot and aspeed-linux - Still there=20
> are errors

This doesn't give us any insight as to what the errors were. Can you provid=
e more detail?

> 5. Try to fix obmc-console - The build errors are gone but not sure it=20
> will work (no platform for testing yet)

What build errors did you see?

>
> Some of the changes were just a syntax change but some requires deeper=20
> understanding.
> Few examples are the changes in obmc-concole, u-boot and aspeed-linux.
> Since the original version is based on older u-boot and linux kernel,=20
> the patches might not be relevant anymore.
>
> Can you please review the following changes on my repo:
> meta-portwell/meta-pcomc660-ast2600/recipes-phosphor/console/obmc-cons
> ole_%.bbappend

It's hard to say whether that's correct for your platform, but I don't thin=
k there's anything obviously wrong there.

> meta-portwell/meta-pcomc660-ast2600/classes/socsec-sign.bbclass

Can you unpack what were you trying to achieve by copying socsec-sign.bbcla=
ss?

> meta-portwell/meta-pcomc660-ast2600/conf/machine/pcomc660-ast2600.conf
> meta-portwell/meta-pcomc660-ast2600/recipes-bsp/u-boot/u-boot-aspeed-s
> dk_2019.04.bbappend=20
> meta-portwell/meta-pcomc660-ast2600/recipes-kernel/linux/linux-aspeed_
> git.bb

Have you tried building without applying patches to u-boot and linux-aspeed=
? It's not clear whether its your own patches that are breaking the build o=
r if something else is afoot.

Andrew
