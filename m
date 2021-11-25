Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FF845D2FB
	for <lists+openbmc@lfdr.de>; Thu, 25 Nov 2021 03:11:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J01Zv0pJ3z3bN8
	for <lists+openbmc@lfdr.de>; Thu, 25 Nov 2021 13:11:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-nuvoton-onmicrosoft-com header.b=N9Ab9AO6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nuvoton.com (client-ip=2a01:111:f400:feab::60d;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=chli30@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nuvoton.onmicrosoft.com
 header.i=@nuvoton.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-nuvoton-onmicrosoft-com header.b=N9Ab9AO6; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::60d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J01ZQ1sxMz2yfb
 for <openbmc@lists.ozlabs.org>; Thu, 25 Nov 2021 13:11:08 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lgJULgh7IpflyXgPOqjFbsPo1GlfMJvTIywxYmvc+bKAbH9hzX8saTVhJa7Bav+6USVAxunO51bz+FVNWSF6nPAkb9K7zcHENpBPlUHu1NJrI4MWzqpxUM20mhU3/G3M9Q4i2ZwEvc2IO7UVrBy8/vHDAqYuE9a0Lu6RvW2ryj7Ko/rAOKlHqNY7dUEOKkDDHjwlrqvSIliPPdeIUVNazM9zdk6UNh1XgUmnStHlTE/wuBB/Ok6MIalv1btA76XDt1SvZwkXWkJJhoCkJWYp7kOJ5INXKLXPtBMzxBcYaJQCAqhheFltNVd08W4sf76xyEWcTt85wciPzYxh3N/6gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YsA5+sxTQMrcNnuYsofYBgSa5KBv4D+i9+IocgJEl64=;
 b=MlcP9Dq7BdDtihHbyVkAEODEpV5YxjOm7Ggn0YG9v2fYz+Xgrfs2u8xL0a6+93Ml8eZFTYyzo7GdA246Uz0O4idh4auG4Saz75vYJ2sKr3z+ViphDmTz6HVy6S8zNAv8aiR1QLSDp2G+iViGR+orOPp6mesao28E8jGuDDqdVDLV6+Ggl3fqugwRqtuiJ+1pn1xwfoEzLSUouf5r2ZywviNz/BiuNrfIpt29585rXEcMHkJYSmUu6AvxaeAZI/L0g8amLkxDRe+puqt3HwBGJQQEQ6o+MJJSj3UhBllTNbVpipm/2tcB+BCibrIjPbiWcbdgFUSmsBfygdBKCvDWlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YsA5+sxTQMrcNnuYsofYBgSa5KBv4D+i9+IocgJEl64=;
 b=N9Ab9AO6c2MEKUi1elyF1TxjaCPLKaa6DmfvvPp7I2wzQg3MSQGGR6xQMMVOVdtZYV0TrM8AyYyvQSOm4YxKcR0CgIu4Ysnm/zvZOirKFxCLhyAOkri75szfWuxU+QHSP71zpYeDsAooLEkbVLG1KziuQMR8yRf1LA69V6vI22M=
Received: from HK0PR03MB5090.apcprd03.prod.outlook.com (2603:1096:203:bf::11)
 by HK2PR03MB4498.apcprd03.prod.outlook.com (2603:1096:202:18::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.14; Thu, 25 Nov
 2021 02:10:36 +0000
Received: from HK0PR03MB5090.apcprd03.prod.outlook.com
 ([fe80::34f5:5552:f815:b10f]) by HK0PR03MB5090.apcprd03.prod.outlook.com
 ([fe80::34f5:5552:f815:b10f%5]) with mapi id 15.20.4713.026; Thu, 25 Nov 2021
 02:10:37 +0000
From: CS20 CHLi30 <CHLI30@nuvoton.com>
To: Thang Nguyen <thang@amperemail.onmicrosoft.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, ", Tim Lee" <timlee660101@gmail.com>, CS20 CHLi30
 <CHLI30@nuvoton.com>
Subject: RE: Check on BMC Reboot Cause
Thread-Topic: Check on BMC Reboot Cause
Thread-Index: AQHX2rQ3xJX0mN9PXUGmp8C+qVe5fKwQ4exA
Date: Thu, 25 Nov 2021 02:10:37 +0000
Message-ID: <HK0PR03MB50907F00CC0A0305E6269801CF629@HK0PR03MB5090.apcprd03.prod.outlook.com>
References: <0653d3ba-7bd6-c01a-741e-8b8cf5ee3655@amperemail.onmicrosoft.com>
In-Reply-To: <0653d3ba-7bd6-c01a-741e-8b8cf5ee3655@amperemail.onmicrosoft.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nuvoton.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 604c2f0a-b193-4ed3-567f-08d9afb8c5c3
x-ms-traffictypediagnostic: HK2PR03MB4498:
x-microsoft-antispam-prvs: <HK2PR03MB449824330F1AB20E0CAC84F2CF629@HK2PR03MB4498.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: STh/eOzZ3Mg/O3B0KXs1+thEAt2pbQ/ccIECDQ1JNlQ6jGYqNPIPJWjbpEOlzTY6LvPJSEPMNlAfvHAjzsqCajdLZtfqj4Zfu/Xt6KUobsQmDmRWT8O3OLv9Pp9d7nhdf2slqFI1rovhXbllj07QSGTWit868QJHcBnxAISrzdrS6rDVD36kgH5KouZwiaOwsKTon7ZieP+FpdjYN2GdvdQsVKObx8cANmoTEt7za0fDCB5FpTfG+goQ2wNgZf3gzRaT3IimdF8GuRTaRwbk9d7OOBJp02GFMwCikL/PlYpygvmBCYH87hWEDw6Tmi1CHl4b8xkOvt2dYH5zyokrLr1+P8+di2hfmiC0zEePKc3wLRi75s9Sbb8DMyaSKp/s3nXQgCYRJgQf+Jo4ykGZxHGvgri8W8D5FiHSz0k58SF2Lzy9g75InKghUC2AaDsavaqIdop8AguhZvnx5zF46I4x1mLqOrzYyl693buFACPw15xo2UqtELcLMljlJdjZekWCK8m+zb8AqTmhD8PjkSUapkvtZxZX7Edf8Q+3PsW+/iVq1wrI2Yaadh7hNtE2V1zpXmHxQpUkDY1yOykALd7I09nI18I7drNn3EvdQWbx1fkhG6E/dmAAKhuSgHCFIKTzOE9WUeHUQHol5flZoosH9m6W5+8yP5rC1wONqbWSWNuB8uLSOH7r5fgesApOUwGl2uwriQozs6z8scBBrUQWZV0soUCOO+2w8tHTorY3ECO+fzXQT+FOjl/5C54f0hjbM6N7ZaCQNVk8lEnliq2wsNYOj3kDS2W9pmj/6dc6z/LyzUv0F6l3DGZbgKJCpyjADZbequAVZpHqi12xL4CIKRnxAYqDD+pq8tHIdoSfYL1I9Yr7Yve0gidXT+eh
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR03MB5090.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(84040400005)(316002)(110136005)(296002)(186003)(52536014)(9686003)(38070700005)(83380400001)(55016003)(8676002)(2906002)(33656002)(26005)(66476007)(86362001)(5660300002)(966005)(66556008)(7696005)(6506007)(8936002)(122000001)(53546011)(508600001)(66946007)(38100700002)(45080400002)(64756008)(76116006)(66446008)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iHS2m8QPJC7aCExipGR9jEtEDiEygSxY7lWeAk8Huf2bD10OW4ylCozBSj0q?=
 =?us-ascii?Q?DS0LYV34vKaL3jbBqrrsg4rMjMU+rNMAhW8qR8ILLtZTR3G/mevncEgDLupb?=
 =?us-ascii?Q?vafBGTeuHhGf823c7hNC6AwTCBWC4bTtlhuMpy4pBOBK8MTCoZw729uNlueo?=
 =?us-ascii?Q?eTqxJ6osllH7VvBPvEb39hcC5yVGREwymLJ+BNXKhjh1iqFGq3s4jmfq4llw?=
 =?us-ascii?Q?1ZLKqQHOhqLegf7QPafGEoP/r/oB7r9FjRddzpmUd6f66OmDeeHuFie7/0tq?=
 =?us-ascii?Q?V/tkMGA7MySCEresGLoitzm3CJX0SLSjJ82nIA0+AdlWFAujNBZkF+4iZXDx?=
 =?us-ascii?Q?+T7R29H+5osxrwiPUILKNIeO1UdBwErs+nI6iB8U0TarJUGGBiUzyFVGrws2?=
 =?us-ascii?Q?tjQ/+SlfpULPyYtebTMEZACYtn7/6A5cXbKZ+M4y3r3QKIUAamFQXmMKlUnJ?=
 =?us-ascii?Q?TW37vDQTSfqvExttNUTAQSTdQSygKvitEGLsSVf6wrK6weImWG64xrVoVp0T?=
 =?us-ascii?Q?W788nQJzcRgNlxu+0HdnlyCjeorAqlBJbfFcJixOrdI61EnqGwo0MfHcs85A?=
 =?us-ascii?Q?AuN0pOQKQwxHZVh9h6i4BIhLuJyRYZIVOJ5HercYXJ888D4GXsKx2j3EvsI6?=
 =?us-ascii?Q?QHs9KW8Jl0u6K6MQ0HYfaiBPla1beDcy7Ag0CcNN1D/cfE39qSgKGNuDKoSM?=
 =?us-ascii?Q?ns7MsiMFfu7p9mnlqBdZdw67upNy0NNuiX5WqnKnl2gJ4N9phKAz1OkZLbr7?=
 =?us-ascii?Q?DHJe7bVnVpDLTVf14/JkSHz9p4oQQIH2l48rX4sDaEYZ6HZnGj2p1ZyL9OkP?=
 =?us-ascii?Q?f6CiFiGlIDYqMUYRXoYXre/8ZJTRrD/Itis11vXMhRntD5g+EILPFIL5a1C4?=
 =?us-ascii?Q?b/mQybnTZp7cbfgw/NoWMQT0L+RkEs+c+Otlj9pKWUfz+lz2bRvDpeSK5L2p?=
 =?us-ascii?Q?guaueQdEwxSTB4R8qF/EBgXZwfWoS3sUkBFbe03/NmwCxWwc+aD47t5hV9zN?=
 =?us-ascii?Q?UVwdCgqlyKvWidckmzlCBKfRCLzJImq0xmSreF6Un0kqfd5K4TRgGSkfa3+F?=
 =?us-ascii?Q?cYjfcfe8QhSFj6vG5QNh00O9dnBUNlYZMKsUnROBzy9B1+n3XUXwHIX9/2j/?=
 =?us-ascii?Q?nTrM2gfYYCC0Cp23uk10FuiEI1x2ntVuQqq9VbelPyCfmZZvsZVC1rDvlYsn?=
 =?us-ascii?Q?F2j3bLLYpeNxasILc0xi5Pzaax3WOnKa3gIIaD/NoYayCCtKFoaUAHrv79Jq?=
 =?us-ascii?Q?dkcd9kBcFqExqQC8/0DgQEdAH9b2BtIfYGFPdSwLjyrbvcthWopaH5qFm+2n?=
 =?us-ascii?Q?q8cMG8C4mKZoF39ZJEdAAKio4qsR8nYvfjy3p0nntbikEzqBL8uYnUZ9hSpl?=
 =?us-ascii?Q?h8PSud3H85hNNaP57Y+eKEqJ7yFRFHtGoLs4bdvqSst5/9s9ONQTbtDZ/XPA?=
 =?us-ascii?Q?f1CTUpL/8VXG1YuILiPvVLbF6exhQtr8Ama3W/6tYXrd7lzcuKps73+l2iNL?=
 =?us-ascii?Q?YiDlRbfTJApudWmXETtRDjDvVO5f/S9zjskgKKUlXwJbqnWqn0str0rbxB/z?=
 =?us-ascii?Q?JwVsS/qsMpyBBnPb02DI61HvPmaffAvL+QJvLVVnY8LGa2IM5k+Pld83tPMJ?=
 =?us-ascii?Q?6EVW4hagn44RnVFbLMaiY3E=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR03MB5090.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 604c2f0a-b193-4ed3-567f-08d9afb8c5c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2021 02:10:37.4693 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yBi6SAYmeQucYix/LiZMbsc2TbgGc7Qs3bSVg+OHuxHKNJdh/+htP0oEth1ZVggOsPWq0BWc3u5TwmqXBijAzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR03MB4498
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

Hi Thang,
Sorry for late reply your message.

In my opinion, usually BMC play rule of card and be pulgged in server mothe=
rboard.
However, according watchdog.h the definition WDIOF_CARDRESET is more reason=
able
for power on reboot BMC card then the other definitions.

In NPCM watchdog driver, we will provide dts flag for customer to design th=
eir watchodog
system. For example, we provide card-reset-type, ext1-reset-type and ext2-r=
eset-type.
Customer can define their own reset type according their server motherboard=
 design with BMC card.

card-reset-type =3D Power ON Reset
ext1-reset-type =3D Watchdog Reset 0, 1, 2 (depends on your SOC support)
ext2-reset-type =3D Software Reset 1, 2, 3 (depends on your SOC support)

Then according your SOC support to assign bootstatus as example:
if (rstval & wdt->card_reset)
        wdt->wdd.bootstatus |=3D WDIOF_CARDRESET;
if (rstval & wdt->ext1_reset)
        wdt->wdd.bootstatus |=3D WDIOF_EXTERN1;
if (rstval & wdt->ext2_reset)
        wdt->wdd.bootstatus |=3D WDIOF_EXTERN2;

Sincerely,
Tim

-----Original Message-----
From: openbmc <openbmc-bounces+chli30=3Dnuvoton.com@lists.ozlabs.org> On Be=
half Of Thang Nguyen
Sent: Monday, November 15, 2021 6:46 PM
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>; , Tim Lee <timlee660101@gm=
ail.com>
Subject: Check on BMC Reboot Cause

Hi Tim Lee,
I checked your change at
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2Fopenbmc%2Fphosphor-state-manager%2Fcommit%2F2bfb1efc4bc7e781224e19c05=
b51e6675f13a488&amp;data=3D04%7C01%7Cchli30%40nuvoton.com%7C5e09ba4542d844d=
b827108d9a82559f0%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C637726413598=
056663%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6=
Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3D7nPq4H3s1hhZVqSfLwVHas%2F%2FVm8eW=
Z9ceexUzZ8bvR0%3D&amp;reserved=3D0
to support BMC Reboot Cause feature. But I does not understand about why
WDIOF_EXTERN1 is translated to watchdog reboot and WDIOF_CARDRESET is trans=
lated to Power ON reboot. Can you help explain about it?

I checked on
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.ker=
nel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Ftree%2F=
Documentation%2Fwatchdog%2Fwatchdog-api.rst&amp;data=3D04%7C01%7Cchli30%40n=
uvoton.com%7C5e09ba4542d844db827108d9a82559f0%7Ca3f24931d4034b4a94f17d83ac6=
38e07%7C0%7C0%7C637726413598056663%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw=
MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DGRpNz=
dv9PYTVsFWB%2FAE2h0X1lFRXoX4LHOIOOSJb5s4%3D&amp;reserved=3D0
but the explanation seems not clear.

Note that we are trying to make Aspeed watchdog support this as below but I=
 still not clear if the use of WDIOF_CARDRESET and WDIOF_EXTERN1 are correc=
t:

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c =
index 436571b6fc79..c5c3f80dfc48 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -54,6 +54,7 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
  #define   WDT_CTRL_ENABLE              BIT(0)
  #define WDT_TIMEOUT_STATUS     0x10
  #define   WDT_TIMEOUT_STATUS_BOOT_SECONDARY    BIT(1)
+#define   WDT_EVENT_COUNTER_MASK       (0xFF << 8)
  #define WDT_CLEAR_TIMEOUT_STATUS       0x14
  #define   WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION    BIT(0)

@@ -369,13 +370,19 @@ static int aspeed_wdt_probe(struct platform_device
*pdev)

         status =3D readl(wdt->base + WDT_TIMEOUT_STATUS);
         if (status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY) {
-               wdt->wdd.bootstatus =3D WDIOF_CARDRESET;
-
                 if (of_device_is_compatible(np, "aspeed,ast2400-wdt") ||
                     of_device_is_compatible(np, "aspeed,ast2500-wdt"))
                         wdt->wdd.groups =3D bswitch_groups;
         }

+       if(status & WDT_EVENT_COUNTER_MASK) {
+               // Reset cause by WatchDog
+               wdt->wdd.bootstatus |=3D WDIOF_EXTERN1;
+       } else {
+               // Reset cause by Power On Reset
+               wdt->wdd.bootstatus |=3D WDIOF_CARDRESET;
+       }
+
         dev_set_drvdata(dev, wdt);

         return devm_watchdog_register_device(dev, &wdt->wdd);

Thanks,
Thang Q. Nguyen -
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
