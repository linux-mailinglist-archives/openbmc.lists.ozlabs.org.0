Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0759E3222A7
	for <lists+openbmc@lfdr.de>; Tue, 23 Feb 2021 00:29:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dkz0n68gQz3cLX
	for <lists+openbmc@lfdr.de>; Tue, 23 Feb 2021 10:29:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-nuvoton-onmicrosoft-com header.b=VJna9Z/S;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=apc01-pu1-obe.outbound.protection.outlook.com
 (client-ip=40.107.132.58; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=ofer.eilon@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nuvoton.onmicrosoft.com
 header.i=@nuvoton.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-nuvoton-onmicrosoft-com header.b=VJna9Z/S; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320058.outbound.protection.outlook.com [40.107.132.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DkkcV41jtz30Nd
 for <openbmc@lists.ozlabs.org>; Tue, 23 Feb 2021 01:11:04 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=agpD+etxcU0mkZ5Mm53JrSscVURr4zXZT0VhJhPsh4htWzvsxpr7YEdLcfRNjowqfQRCZRLOXx4T9JCKPQh6uDOCQqdv+yvNpPQU9xTGbzeSioxr6SPlgCTi1gig8VW2h6AHbMTYEukVlsCkMlBkpCyrHJbqwD03yWSOYQ0tPfmzMUmtt01gHevii4SumwSCDP7K0uMb+kRyDJiquTnp3k7mHode+qHdIQRciysRb2lc3lmAmcm/bTU5MCTxbjFRUG/8P5nWI3SRhH8yiZ65UF+E0oMve4L/Q4JigUTu7nSllxSgnuYQbWT6vcU4R7KIK4rClZag9PUTU5/Qgd/AKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vn17V1KhYcLdNManDXLGwVkh6EyWqfs9tHW87++Qv2w=;
 b=UEh2klZsHCxVrR2Eo/NIXsk8gFn7tkdlq/jc6ZeAM794G2sbYInQOweQn7l28Zm2OyJvX7p1cXd4dhYKh2eyzmwpOAScljHvE3KDWYRosdA5ECc1I09u2nUHpFvBdeXduMD/YZ/DOc2EshDqHtsg5+TVH28DRLf6N86Z5iNZ8rIE3+o+FOCMIVLmYx6kPqhARPuFlcBM/4itKMT1pgnO6SNo+pBdUWsglxbwtmaVDY+nMuKY4A7C5I45InFxZsJCvrcJOfWdeUjWEo/OgmNctnxDLIaU9jeVRiPtDqvRmCCOepacOXDriBkEf3ZcGOvM9ZsQMC8EGoodR8Vz7GELGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vn17V1KhYcLdNManDXLGwVkh6EyWqfs9tHW87++Qv2w=;
 b=VJna9Z/S1oYGI3vjYh1tL1MLdLRC4hxx+IhWILeNgg5RfITjeFDD86E44nQQK793Ufk2JutRMk1i5aGU5MCmQTGkNZfp7rwKLoiJw5enKufXU7+Lwlwws/n0iRagtTVQsaZLKDItKEI2DSgqQ99Y2WkUhJM8BJtahiwfTJbxgbY=
Received: from KL1PR0302MB2551.apcprd03.prod.outlook.com (2603:1096:802:f::11)
 by KU1PR03MB2901.apcprd03.prod.outlook.com (2603:1096:802:1d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.16; Mon, 22 Feb
 2021 14:10:53 +0000
Received: from KL1PR0302MB2551.apcprd03.prod.outlook.com
 ([fe80::4136:8477:1102:564f]) by KL1PR0302MB2551.apcprd03.prod.outlook.com
 ([fe80::4136:8477:1102:564f%11]) with mapi id 15.20.3890.018; Mon, 22 Feb
 2021 14:10:52 +0000
From: IS20 Ofer Eilon <ofer.eilon@nuvoton.com>
To: Avi Fishman <avifishman70@gmail.com>, Anton Kachalov <gmouse@google.com>
Subject: RE: [PATCH] ARM: dts: nuvoton: Fix flash layout
Thread-Topic: [PATCH] ARM: dts: nuvoton: Fix flash layout
Thread-Index: AQHXCQSLzqaqyvos9EmAIN3K55QhcKpkNfMQ
Date: Mon, 22 Feb 2021 14:10:52 +0000
Message-ID: <KL1PR0302MB255112AE01C81FEA63472A6293819@KL1PR0302MB2551.apcprd03.prod.outlook.com>
References: <20210218122546.3546582-1-gmouse@google.com>
 <CADKL2t6P4gaSUZEFgk7y+TNBRw0Lhf8mXTxzLdbe3FhGs0WH+w@mail.gmail.com>
 <CAP6Zq1jf4-XAhLQxqNx3LM7-YzDr8zaVPb-jznn8o=frxTotdQ@mail.gmail.com>
 <CADVsX89F6Tc0Zk6uB3CKRK0F8j_E+sVGHVb9FMAkHDQqJ+KBAQ@mail.gmail.com>
 <CAKKbWA7WL80C9h9xPcBNAHn-1=NBK9dh2Nqa1hO21hbdLEUbTw@mail.gmail.com>
In-Reply-To: <CAKKbWA7WL80C9h9xPcBNAHn-1=NBK9dh2Nqa1hO21hbdLEUbTw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nuvoton.com;
x-originating-ip: [212.199.177.18]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 87ee7955-a437-4ae1-57e2-08d8d73baa0c
x-ms-traffictypediagnostic: KU1PR03MB2901:
x-microsoft-antispam-prvs: <KU1PR03MB2901B572554ED9E5D601113293819@KU1PR03MB2901.apcprd03.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zJ0od/lvT3T7ndgQht4c7GDU+9s5aYbIEuJ4S0JQa2CrqSUxS0GGGy6fe5CNmlY7IPwGE4Tdz8FlONDaHpgSCTvpafX/uDYTgrTopNlQbGkqI2VCF7BfL+vtIKO2tiiaIaHNkQzpu1xvCtnorZdWOv6ZtLJvBwjr9xgmvMpNLI5cFMOYs/sp8NyRajJoWkmxb9ZnTnJBpDd1mWcNmghn48tx5loOT8+9BhcTgAjfrfNbURkqvhWwf3IW1QRDixYPd4UgxJlTJVoR6PbBfRjkeWJwTXM/2pxc90uHwa9DGxOKz/U94mE2IPrQ/RMNbJhCehRzX+CuMNekqEBc1gBXYDWFfYaUCpYpKOntyUg6ksRlwc15G85m5N978MyKORtAPejX12yunriK6HONNnxQBhcdZtdO0YXL7Nfy7qYLqqBwGq/yx5p3DYy1xUSi47p0DYidsqXGmlobCjHxC4W9fCj9aWhueOz9b0eM6VHZJCMMWVhK1I88fGcuJgOrr7KGyaI0REoiRJ0Fh3HN1awbvyBYgFdU6tIzqiCBZ+9MOTcLlucZq5W1qLRrlWe3KUxlgR/+BsykaTDaGzvIgJTXC+9WbdoT1oP46zBfPcpWVUQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0302MB2551.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39860400002)(366004)(136003)(346002)(316002)(76116006)(66476007)(66946007)(71200400001)(66556008)(478600001)(966005)(45080400002)(66446008)(8676002)(9686003)(64756008)(52536014)(33656002)(5660300002)(53546011)(6506007)(186003)(54906003)(26005)(7416002)(110136005)(86362001)(4326008)(55016002)(83380400001)(2906002)(7696005)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?OtjmCbpyR76m4kGvZa4T7aB8+KkirzL9O2XRbR6YyIwhvDSPv4kGRNXcxyiU?=
 =?us-ascii?Q?ulAnzOltjZa3mluZDM0N+8qeLjxXu4q9WbGt7JFZOfqmuyFDPv3VC3W11HKy?=
 =?us-ascii?Q?5npVD80wbSx+i8yBmlXyLvmwqpE5PRNVEau0VywqkdRvWvsHed79QSzUzU//?=
 =?us-ascii?Q?A5JTiTbIy4P0a33793d8C7TM4Ld3GdCl6nI4xT+dLjGItH+5OsjRgwGBC0ZN?=
 =?us-ascii?Q?K5zDlsLASCuS25QmHocixoQrOyjVoJr/RK/NrVQWtoQyu3OQj8/XiPqhjvZn?=
 =?us-ascii?Q?c9L8Fmx25JZhyxQmGMCG/MNqJU/iYd5qxSuajGKwr4hjPcNrfAyvhwYFDDhB?=
 =?us-ascii?Q?89Dulm9kHgjcr7oBk6K3s+vGM88e3RKsR0XRdcAdFEAk5oMwvpmsA+HpkLdO?=
 =?us-ascii?Q?G5VbXKgmAJjUMOsfMIu9XiJPPbEL129rKsC/+YjQyTivIlZ0+NM29AApJa5V?=
 =?us-ascii?Q?bbDFW6ape6mGsHRikFeVIgUnKRYFtBmjZiBv/mzfxDeA0sFrs3J402r+zlLe?=
 =?us-ascii?Q?P+3GwDZDK0TY3EgRDZt7QDVgvWIHNGrxeaiBD+NJRfSmdMG7Xgc05cjCcL3D?=
 =?us-ascii?Q?BdE9dufuZJFjjmO6CmPOC8em9F8U76I3gFnXEeeNYOiw+sAkae2WhQqVy9tb?=
 =?us-ascii?Q?B7ud5zczzCFH8q3K7wIxubTgj32vaYRdotZjRTz7WwlLK+hHHMs7gV3o2cWW?=
 =?us-ascii?Q?W6pEk4+c/RKoQXNHAyz8uOEUfH6O7nsvJmFWplGTi+/bALQfsPURck8Zr7li?=
 =?us-ascii?Q?hb1tAMusvwqX1YY964usp5c/EBr2mI++wD/oc4ojoFsd5Zc4WI/mwYmVrZpB?=
 =?us-ascii?Q?tmer9d7DZxh92XW8NEgr5KFKXMOc0DwLL/25Ob7RB9csYF1lHah+ohkfbibg?=
 =?us-ascii?Q?W5ejjT1Ymp1rCifhtGCWPwjP0VCSEb1TG6C7DLlgx6ndC0q6j8GOBLe0fqWg?=
 =?us-ascii?Q?jfumoA3MhVQbjwPjOnO70X52U3UpF1uvO4IXtK7VSi8T0P1laoYD6X0AuKrl?=
 =?us-ascii?Q?RpyK5KO41qgOWrAW4282Fb04qU1Vzr1R7AgoqgPtAVxXq9yjKGGz4fn2bqIJ?=
 =?us-ascii?Q?Ojsv66LnjEmvd5LZOkQvSfTzTznx44Duye7Nl50v1M5ZvKD96JLeWHH7/tCZ?=
 =?us-ascii?Q?piycU7xNkcxQY6LyakQOgY8nsku/z+DJhAJ6uCaXHf9GqA7fX5w5gR6YpEBb?=
 =?us-ascii?Q?7MSWUyYbhJBFo1x6kheZJUpvYwgYdjOk2tc2HArZe04Q2f44jcr5i3k03x4K?=
 =?us-ascii?Q?ewNUPHnOIV49yFtnssK8nH9WdUkhkVJ8dl+JcoE/+10hTJwZDpBF+suDDusi?=
 =?us-ascii?Q?dch2PWPRGHpTO8yArrhEGao0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0302MB2551.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87ee7955-a437-4ae1-57e2-08d8d73baa0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2021 14:10:52.5614 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mn3ypXgvAP2PyHfquvfv1+4La9XydGHv1WIbU51DXbFaD5eGz5NDiIFwKYnpR4DtEUn0E+HJPWRwh0Wp8YEMFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU1PR03MB2901
X-Mailman-Approved-At: Tue, 23 Feb 2021 10:29:15 +1100
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
Cc: devicetree <devicetree@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Avi,

It seems an old version of uboot  u-boot_2019.01.7.5.bin  from igps below:

> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2FNuvoton-Israel%2Figps%2Ftree%2Fmaster%2FImageGeneration%2Fversions&=
amp;data=3D04%7C01%7Cofer.eilon%40nuvoton.com%7Ce56881b8491d42e5ee4c08d8d71=
bacd4%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C637495861162860437%7CUnk=
nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX=
VCI6Mn0%3D%7C1000&amp;sdata=3D0%2BNzEv%2FSX9QTg0XumchRrU61uGbZ3CZXrtspXu256=
0I%3D&amp;reserved=3D0

Please use latest from uboot.bin github.

Regards,
Ofer


-----Original Message-----
From: Avi Fishman <avifishman70@gmail.com>
Sent: Monday, February 22, 2021 12:21 PM
To: Anton Kachalov <gmouse@google.com>
Cc: Tomer Maimon <tmaimon77@gmail.com>; Benjamin Fair <benjaminfair@google.=
com>; Tali Perry <tali.perry1@gmail.com>; Patrick Venture <venture@google.c=
om>; Nancy Yuen <yuenn@google.com>; Rob Herring <robh+dt@kernel.org>; OpenB=
MC Maillist <openbmc@lists.ozlabs.org>; devicetree <devicetree@vger.kernel.=
org>; Linux Kernel Mailing List <linux-kernel@vger.kernel.org>; IS20 Ofer E=
ilon <ofer.eilon@nuvoton.com>
Subject: Re: [PATCH] ARM: dts: nuvoton: Fix flash layout

Ofer,

Can you check why u-boot doesn't work with SD cards?

On Mon, Feb 22, 2021 at 11:27 AM Anton Kachalov <gmouse@google.com> wrote:
>
> Hi, Tom.
>
> Yes, I'm using it for testing on real hardware.
>
> BTW. Recent u-boot doesn't work with SD cards. The card doesn't
> detect. The last working version was this one:
>
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgith
> ub.com%2FNuvoton-Israel%2Fnuvoton-info%2Ftree%2Fmaster%2Fnpcm7xx-poleg
> %2Fevaluation-board%2Fsw_deliverables%2Fnpcm7xx_v2.3&amp;data=3D04%7C01%
> 7Cofer.eilon%40nuvoton.com%7Ce56881b8491d42e5ee4c08d8d71bacd4%7Ca3f249
> 31d4034b4a94f17d83ac638e07%7C0%7C0%7C637495861162860437%7CUnknown%7CTW
> FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6
> Mn0%3D%7C1000&amp;sdata=3Df4t41g3CQaFTQNfwwNVBrIwQScndIGcfRTms0yrTn5o%3D
> &amp;reserved=3D0
>
> However, u-boot from igps repo:
>
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgith
> ub.com%2FNuvoton-Israel%2Figps%2Ftree%2Fmaster%2FImageGeneration%2Fver
> sions&amp;data=3D04%7C01%7Cofer.eilon%40nuvoton.com%7Ce56881b8491d42e5ee
> 4c08d8d71bacd4%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C6374958611
> 62860437%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL
> CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D0%2BNzEv%2FSX9QTg0Xumch
> RrU61uGbZ3CZXrtspXu2560I%3D&amp;reserved=3D0
>
> Has issues too. It doesn't allow me to read more than 4k bytes once at
> a time. Thus, to flash the stuff I have manually read chunks from the
> SD-card: fat load doesn't work at all and I write that data in raw
> partition.
>
> On Sun, 21 Feb 2021 at 17:40, Tomer Maimon <tmaimon77@gmail.com> wrote:
> >
> > Hi Benjamin and Anton,
> >
> > Sorry for the late reply,
> >
> > The EVB FIU0-CS0 partitioning is used for testing the EVB and this is w=
hy it is different than the OpenBMC flash layout.
> >
> >
> >
> > Are you using the NPCM7XX EVB for OpenBMC? if yes we can consider to mo=
dify the flash partition to OpenBMC use.
> >
> >
> > On Thu, 18 Feb 2021 at 19:11, Benjamin Fair <benjaminfair@google.com> w=
rote:
> >>
> >> On Thu, 18 Feb 2021 at 04:42, <gmouse@google.com> wrote:
> >> >
> >> > From: "Anton D. Kachalov" <gmouse@google.com>
> >> >
> >> > This change satisfy OpenBMC requirements for flash layout.
> >> >
> >> > Signed-off-by: Anton D. Kachalov <gmouse@google.com>
> >> > ---
> >> >  arch/arm/boot/dts/nuvoton-npcm750-evb.dts | 28
> >> > +++++++----------------
> >> >  1 file changed, 8 insertions(+), 20 deletions(-)
> >> >
> >> > diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> >> > b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> >> > index bd1eb6ee380f..741c1fee8552 100644
> >> > --- a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> >> > +++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> >> > @@ -182,8 +182,8 @@ bbuboot2@80000 {
> >> >                                 reg =3D <0x0080000 0x80000>;
> >> >                                 read-only;
> >> >                                 };
> >> > -                       envparam@100000 {
> >> > -                               label =3D "env-param";
> >> > +                       ubootenv@100000 {
> >> > +                               label =3D "u-boot-env";
> >> >                                 reg =3D <0x0100000 0x40000>;
> >> >                                 read-only;
> >> >                                 }; @@ -195,25 +195,13 @@
> >> > kernel@200000 {
> >> >                                 label =3D "kernel";
> >> >                                 reg =3D <0x0200000 0x400000>;
> >> >                                 };
> >> > -                       rootfs@600000 {
> >> > -                               label =3D "rootfs";
> >> > -                               reg =3D <0x0600000 0x700000>;
> >> > +                       rofs@780000 {
> >> > +                               label =3D "rofs";
> >> > +                               reg =3D <0x0780000 0x1680000>;
> >> >                                 };
> >> > -                       spare1@D00000 {
> >> > -                               label =3D "spare1";
> >> > -                               reg =3D <0x0D00000 0x200000>;
> >> > -                               };
> >> > -                       spare2@0F00000 {
> >> > -                               label =3D "spare2";
> >> > -                               reg =3D <0x0F00000 0x200000>;
> >> > -                               };
> >> > -                       spare3@1100000 {
> >> > -                               label =3D "spare3";
> >> > -                               reg =3D <0x1100000 0x200000>;
> >> > -                               };
> >> > -                       spare4@1300000 {
> >> > -                               label =3D "spare4";
> >> > -                               reg =3D <0x1300000 0x0>;
> >> > +                       rwfs@1e00000 {
> >> > +                               label =3D "rwfs";
> >> > +                               reg =3D <0x1e00000 0x200000>;
> >> >                         };
> >>
> >> I recommend just including the openbmc-flash-layout.dtsi file here
> >> instead since that contains the common flash layout for most
> >> OpenBMC systems.
> >>
> > Good solution,
> > Do you mean nuvoton-openbmc-flash-layout?
> >>
> >> >                 };
> >> >         };
> >> > --
> >> > 2.30.0.478.g8a0d178c01-goog
> >> >
> >
> >
> > Thanks,
> >
> > Tomer



--
Regards,
Avi
________________________________
________________________________
 The privileged confidential information contained in this email is intende=
d for use only by the addressees as indicated by the original sender of thi=
s email. If you are not the addressee indicated in this email or are not re=
sponsible for delivery of the email to such a person, please kindly reply t=
o the sender indicating this fact and delete all copies of it from your com=
puter and network server immediately. Your cooperation is highly appreciate=
d. It is advised that any unauthorized use of confidential information of N=
uvoton is strictly prohibited; and any information in this email irrelevant=
 to the official business of Nuvoton shall be deemed as neither given nor e=
ndorsed by Nuvoton.
