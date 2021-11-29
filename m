Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0046460EA1
	for <lists+openbmc@lfdr.de>; Mon, 29 Nov 2021 06:45:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2Z7b5QNXz303F
	for <lists+openbmc@lfdr.de>; Mon, 29 Nov 2021 16:45:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-nuvoton-onmicrosoft-com header.b=BMB+/Obq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nuvoton.com (client-ip=2a01:111:f400:feab::62e;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=chli30@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nuvoton.onmicrosoft.com
 header.i=@nuvoton.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-nuvoton-onmicrosoft-com header.b=BMB+/Obq; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::62e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2Z752l15z2yxP
 for <openbmc@lists.ozlabs.org>; Mon, 29 Nov 2021 16:44:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mJJVzQtQm+fy0bNVu0/9fxPygWJUea3qkkb1Vj4ppHeKZS8phDD3S0AMoZsdN5w2Pr67vl7nZqREwlsMEx4ya4OlGu7zP8eWaW6+Ma4J0N5b0p5TLBIakGSnifBj0J6hILwhLEK68CitIrJB1UG/XVzUGeydCf60aNcBDpV7zKcZG6xaomMoUS9LvwbPFiJZ5uZ+8R/qLjB9XNhE0RaEbQjzsUsVjjFlv67DzEp3M5AZmjbvWBR9jRIq0b8flQdFlb0sdjaDkKGpRr6kY633AyJzcY8Y/t9hhfBKng5joEl8Rz6lEcznVa60NTciXtsDSbJWexQr3Qfte+k9bsq28w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dk+vMjZg5eTWVPZTWxJYq+D4szn/BCCsL15/VO4NT/Y=;
 b=Bi+yRXKW05iGl41BgRq3boAWXm+TGEwBgMB1qT3Qow60/NzQyHxXLqn7mPY1pUBTdjing2Z68eW3uJxiu86O+GV1c7EQ+gKHcmbLG1zsmn+kZGYxbcrBZaMhl6P1Hn1vXi/O4c/Na5aD+FvGHncE3f1DwRwCYqpy3HO2NTbk4Cvoo+7WlT9HTc/0VMJyiSv9AofoKsE8n8x5SmBAZRDZ5atJ1YOa52qG6rCX0EEqzJFwGobiA3QxCglPuqadFMzqJ2sYhBIj/Mcn8WYmufe6D4dUHhFPfT35atTgrhCaklSF2G/k7vJJECP/Ajv1JBckIa0brWXkpiKgbiGgvSI3mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dk+vMjZg5eTWVPZTWxJYq+D4szn/BCCsL15/VO4NT/Y=;
 b=BMB+/ObqWpWD1F6J7muvny7kk4B30AGwXxDlnikN0xS/NCw1jpQyi/Z5AfZ0hsViJKhLMabxf0LyvNe7oNUws04ntBDbnA2vM4it/e97IhGvDlwl0izXF9T843Ud4pjlV/Gcu86/zN2K9IjddV/Xq1bLqBDpyagcFAh65k+Ytxk=
Received: from HK0PR03MB5090.apcprd03.prod.outlook.com (2603:1096:203:bf::11)
 by HK0PR03MB3843.apcprd03.prod.outlook.com (2603:1096:203:7a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.9; Mon, 29 Nov
 2021 05:44:25 +0000
Received: from HK0PR03MB5090.apcprd03.prod.outlook.com
 ([fe80::34f5:5552:f815:b10f]) by HK0PR03MB5090.apcprd03.prod.outlook.com
 ([fe80::34f5:5552:f815:b10f%5]) with mapi id 15.20.4755.011; Mon, 29 Nov 2021
 05:44:25 +0000
From: CS20 CHLi30 <CHLI30@nuvoton.com>
To: Thang Nguyen <thang@amperemail.onmicrosoft.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, Tim Lee <timlee660101@gmail.com>, CS20 CHLi30
 <CHLI30@nuvoton.com>
Subject: RE: Check on BMC Reboot Cause
Thread-Topic: Check on BMC Reboot Cause
Thread-Index: AQHX2rQ3xJX0mN9PXUGmp8C+qVe5fKwQ4exAgAQytgCABP0kUA==
Date: Mon, 29 Nov 2021 05:44:24 +0000
Message-ID: <HK0PR03MB5090103C0D0557A9B28E3139CF669@HK0PR03MB5090.apcprd03.prod.outlook.com>
References: <0653d3ba-7bd6-c01a-741e-8b8cf5ee3655@amperemail.onmicrosoft.com>
 <HK0PR03MB50907F00CC0A0305E6269801CF629@HK0PR03MB5090.apcprd03.prod.outlook.com>
 <0e67b572-382d-d9a1-0cde-a01177ce9e63@amperemail.onmicrosoft.com>
In-Reply-To: <0e67b572-382d-d9a1-0cde-a01177ce9e63@amperemail.onmicrosoft.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nuvoton.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c00ad0a9-0e26-44eb-343d-08d9b2fb4d76
x-ms-traffictypediagnostic: HK0PR03MB3843:
x-microsoft-antispam-prvs: <HK0PR03MB384397151B7BFF1F91947368CF669@HK0PR03MB3843.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HxMaWwCi3OejGZGTdbpMr8NyDbJOZEIgZYWaB2Q1iEwhD+yZnBjO9XAZjW28x5snQD7C8hjVZ84wzVY+CvegtUX2XMjgK72FjR/kiwyY/ctlk6yL5Pw3jbtwOO7nUcv23d0P1EMq2af4jqP0LeSlLEa90KXkABUTos6ZJFRtXn4Bu4uaIoYv9UhKCy7K6eRc8iyUEjtFAuA/P1BmotHgeZa5kQ4pqeBhB04ruHtZL3PBmQbc3dx/0ngKLIgkN7JTGjKN6Fqi99QaUMHvzWfgfhkLp8lC8K9NDMdnuYSvQGP+F7RQQE1cSsgykv0ZSvJ9afPLHgyiEN6avZT7yA6gVD2dMQpxR6V8a97o9CEPVUQJJ18CN91TUY50/KOaluw/ek5/jCkMopb3jxCRLMGhmB1TNeJc+EHLk3U88q4QsiZRXk41TvBnD0OHzwvB2MO+ajfaDtHqM9VYaMYL/xMWKY/Who9izqNj4chwbDp2xzlnNa+LHagV/uU5tl6MMriYbNUQD75LhHGBF5GMK9PL0t6MPzrIvZk/x+qz6ZVL7hiMtiSw1380hFL3VbktE6bDEETTprv/nyjXcSh6J/S1U94MEBCN87sx9uxL9eaDO8uGKermioyXkLueYP9SpFjOeW6k76tQ10e1FPQLw/SLR2IqhIPckvQT6GNbbsrqLFKcrM+3hzBpFsHgmCbA4C4llo00r9smdXBZQP2G1vZdoLXg2ECItZQDhTHU4STzBXu2/teWMa9aypPGOKCHSbKvlLNc6kDZRBAF5nNcgSuSMn3lRKwhDbs2BjwcJEwDOOJ2QubQ27oKT+RT00zbkRzv4jdFOlQARhDyY9UuIP15a89I813lTPRuZ5RqqQ7Akeg9y8GZJyVpMFiP8aI7Xm0A
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR03MB5090.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(84040400005)(71200400001)(110136005)(38070700005)(9686003)(52536014)(122000001)(33656002)(38100700002)(296002)(316002)(45080400002)(186003)(2906002)(966005)(55016003)(8676002)(8936002)(76116006)(53546011)(66446008)(64756008)(66556008)(66946007)(66476007)(86362001)(6506007)(26005)(508600001)(83380400001)(5660300002)(7696005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qnDIkP7ZCygj0HmwRNC8abwnj/3b+s22cY/a2erRQ1uIT7fHHvbO8sOugutS?=
 =?us-ascii?Q?D71k0T/Sd60qHNvo/lgW/t1MrQ2UzVh38Saxg8rnKE2jd5QHPZkAp/X/CNub?=
 =?us-ascii?Q?QKD//4WSW6gSKymtbvwsUVAMJVDuOCzErw/c8e8H2YK47alyz1Dd+eVw3b/c?=
 =?us-ascii?Q?J7jX0bmHX6GkxHJ5aS71VtprgHAgxKzLbQUUVpK8P2WAnhMbDd1pM/bMBOcg?=
 =?us-ascii?Q?nQVDWfXFqCgHL9W4eoK2rWDxzlH7ztoc4e+dnb3ANts9NTPqio71i9spr5ca?=
 =?us-ascii?Q?z6aeWIxF6nFgC1ue+0EcWh/iLp9hfM7jBQJeMJS2EWOgDFK2sdXwy2SZuuSj?=
 =?us-ascii?Q?I7rcjYRRmuViiuQRwh3eqIYENaSyJObDG+SZ81FW9Z4UPOFjNAMeW80NXyeI?=
 =?us-ascii?Q?/aZZxq2YOJRcmR7d2NU7zi/tH7FDK1lHg/Bs8sbEeGzKbJSb6KtOnj2OGv71?=
 =?us-ascii?Q?XjoY16XYVl/krhcIYSyKrrBlsgxeOsoN2Jufrb0M8RsE0dMhLfauKf4GSyNh?=
 =?us-ascii?Q?QVxM7bx4MEmFdUCwChK+1BKmJdjRSg1vdmFWALyVcPqcQe69jqmL7B0081de?=
 =?us-ascii?Q?3SqN+gH5jJkTVUH6G8M5brfMq9jB1Y1BVCnfBUNBkVG7NXvwk35wXPloaNrU?=
 =?us-ascii?Q?5YO9nyHOO1FQ+liNzMVVJHZZgC1keQ1Wohd2D9BSaKdqXdKZzQnVBIdnGCnG?=
 =?us-ascii?Q?ZC03S4i2ZCZlusMeprnDaGnlTLiDKMa3s/RYyWgqtnAA/wiCClR/dlT0DmmM?=
 =?us-ascii?Q?e9KhmZLDKtEjYa71OI2bSXot61Wdn9Lqqvsb+3Arw+AccsLe8JxRrVAw0EjT?=
 =?us-ascii?Q?D79EN1IoFXIDU9nqcw7jGItyIZg6WA+NGf8V4FF+jsLNjdKyPEZYb9Ag4P8F?=
 =?us-ascii?Q?2vQsw9MtKq5gCkWSXM+xbNKclTTdIzjHEBXHcRykbPYqmNU/2XXcjBvpCq5D?=
 =?us-ascii?Q?Y0b4Gg+uuYMoCepmRJ8lsa9U46auRIgf8PakNILfAJ5ozLGWDWpID5WK7wRC?=
 =?us-ascii?Q?vSe6PHgiK8t/XtoXidHjoSOtMHbcyR+pXr97QhFv8iA+Q/L+ogERgnoLukIg?=
 =?us-ascii?Q?CA4nbwg6VALSHAdBzkLn/bHXQq+UZ2g0sAhwUKZjRAoar3S1oD1iv0XY1G+m?=
 =?us-ascii?Q?49jCCcjc9D5mgzohj1xoyV4qfMu6wmlLruGFs/SEfVlSyBhLiZ+u3CuGA34H?=
 =?us-ascii?Q?rcMeaxORuIGril4WibtsM8bsOCxCureD1H91HBs57WR0SlV0EScj75T0TiWm?=
 =?us-ascii?Q?rVK9tQclrZK68OOQBIkiFXI9SFsHO0uGdgHJNy01kcEldx41QEJ0v1LOyULI?=
 =?us-ascii?Q?8UutYs2/B4E1Ip9ZBjjf8epPMN10ZQyCwcBYmav7mEPHXuItUwVKsVYVfJHL?=
 =?us-ascii?Q?l791RoXY3VhYxAxRso3H3lTAm7Fnyuq9Ag3dh/aE1k3bLe3P8iO0vaCQItZN?=
 =?us-ascii?Q?p6K67hFkso2QYx/w2EUWgDLVS0rTlvnrchYD54ahpp80PBbKBz8i+w1gwhSo?=
 =?us-ascii?Q?EEw8LuFvn0N/EZ8nOofyTwn4aobRqDZpbaWK3xOD8pxmrNXD9uZdnbQvXAiR?=
 =?us-ascii?Q?v6ZTHW82rZv+QJDvP9buo1vUFEgRMR5pZAu6mwqdBoV3XQeZxNJehtc9xd3E?=
 =?us-ascii?Q?RQEMLh3915/gcdX5msjHt50=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR03MB5090.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c00ad0a9-0e26-44eb-343d-08d9b2fb4d76
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2021 05:44:25.4824 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mumaoz4CymJ5CMaf1dIQcUnQ0++KWLtyuicsNCa4JBtPUmkmqKigLXbREgSuAnHtNgA2RDb4jSwjqNC1dSSwGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR03MB3843
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

Thanks your response for this topic.
This information is NOT used to check if BMC is rebooted or others.
Thus, the Host status will not be changed when BMC is rebooted.

-----Original Message-----
From: Thang Nguyen <thang@amperemail.onmicrosoft.com>
Sent: Friday, November 26, 2021 9:29 AM
To: CS20 CHLi30 <CHLI30@nuvoton.com>; OpenBMC Maillist <openbmc@lists.ozlab=
s.org>; Tim Lee <timlee660101@gmail.com>
Subject: Re: Check on BMC Reboot Cause

Thanks Tim for your response.
I have one more question on this topic. With BMC reboot cause supported, is=
 the information used to check if BMC is rebooted or powered ON to skip cha=
ssis policy (always-on, always-off, previous) when BMC is rebooted? The rea=
son is that the Host status should not be changed when BMC is rebooted.

On 25/11/2021 09:10, CS20 CHLi30 wrote:
> Hi Thang,
> Sorry for late reply your message.
>
> In my opinion, usually BMC play rule of card and be pulgged in server mot=
herboard.
> However, according watchdog.h the definition WDIOF_CARDRESET is more
> reasonable for power on reboot BMC card then the other definitions.
>
> In NPCM watchdog driver, we will provide dts flag for customer to
> design their watchodog system. For example, we provide card-reset-type, e=
xt1-reset-type and ext2-reset-type.
> Customer can define their own reset type according their server motherboa=
rd design with BMC card.
>
> card-reset-type =3D Power ON Reset
> ext1-reset-type =3D Watchdog Reset 0, 1, 2 (depends on your SOC support)
> ext2-reset-type =3D Software Reset 1, 2, 3 (depends on your SOC support)
>
> Then according your SOC support to assign bootstatus as example:
> if (rstval & wdt->card_reset)
>          wdt->wdd.bootstatus |=3D WDIOF_CARDRESET; if (rstval &
> wdt->ext1_reset)
>          wdt->wdd.bootstatus |=3D WDIOF_EXTERN1; if (rstval &
> wdt->ext2_reset)
>          wdt->wdd.bootstatus |=3D WDIOF_EXTERN2;
>
> Sincerely,
> Tim
>
> -----Original Message-----
> From: openbmc <openbmc-bounces+chli30=3Dnuvoton.com@lists.ozlabs.org> On
> Behalf Of Thang Nguyen
> Sent: Monday, November 15, 2021 6:46 PM
> To: OpenBMC Maillist <openbmc@lists.ozlabs.org>; , Tim Lee
> <timlee660101@gmail.com>
> Subject: Check on BMC Reboot Cause
>
> Hi Tim Lee,
> I checked your change at
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgith
> ub.com%2Fopenbmc%2Fphosphor-state-manager%2Fcommit%2F2bfb1efc4bc7e7812
> 24e19c05b51e6675f13a488&amp;data=3D04%7C01%7CCHLI30%40nuvoton.com%7C75ce
> 6806e6974058580108d9b07c32bd%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C
> 0%7C637734872896751423%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJ
> QIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DeU0eIoLtq
> VBXEZzth4op9q%2BqGqdpHxc1JTi45ZDKSz4%3D&amp;reserved=3D0
> to support BMC Reboot Cause feature. But I does not understand about
> why
> WDIOF_EXTERN1 is translated to watchdog reboot and WDIOF_CARDRESET is tra=
nslated to Power ON reboot. Can you help explain about it?
>
> I checked on
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.
> kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2
> Ftree%2FDocumentation%2Fwatchdog%2Fwatchdog-api.rst&amp;data=3D04%7C01%7
> CCHLI30%40nuvoton.com%7C75ce6806e6974058580108d9b07c32bd%7Ca3f24931d40
> 34b4a94f17d83ac638e07%7C0%7C0%7C637734872896761421%7CUnknown%7CTWFpbGZ
> sb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3
> D%7C3000&amp;sdata=3DvwvVKtx8NhNoxTYCuR9pYigYZ4fI68D1l5BeB2X96pQ%3D&amp;
> reserved=3D0
> but the explanation seems not clear.
>
> Note that we are trying to make Aspeed watchdog support this as below but=
 I still not clear if the use of WDIOF_CARDRESET and WDIOF_EXTERN1 are corr=
ect:
>
> diff --git a/drivers/watchdog/aspeed_wdt.c
> b/drivers/watchdog/aspeed_wdt.c index 436571b6fc79..c5c3f80dfc48
> 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -54,6 +54,7 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
>    #define   WDT_CTRL_ENABLE              BIT(0)
>    #define WDT_TIMEOUT_STATUS     0x10
>    #define   WDT_TIMEOUT_STATUS_BOOT_SECONDARY    BIT(1)
> +#define   WDT_EVENT_COUNTER_MASK       (0xFF << 8)
>    #define WDT_CLEAR_TIMEOUT_STATUS       0x14
>    #define   WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION    BIT(0)
>
> @@ -369,13 +370,19 @@ static int aspeed_wdt_probe(struct
> platform_device
> *pdev)
>
>           status =3D readl(wdt->base + WDT_TIMEOUT_STATUS);
>           if (status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY) {
> -               wdt->wdd.bootstatus =3D WDIOF_CARDRESET;
> -
>                   if (of_device_is_compatible(np, "aspeed,ast2400-wdt") |=
|
>                       of_device_is_compatible(np, "aspeed,ast2500-wdt"))
>                           wdt->wdd.groups =3D bswitch_groups;
>           }
>
> +       if(status & WDT_EVENT_COUNTER_MASK) {
> +               // Reset cause by WatchDog
> +               wdt->wdd.bootstatus |=3D WDIOF_EXTERN1;
> +       } else {
> +               // Reset cause by Power On Reset
> +               wdt->wdd.bootstatus |=3D WDIOF_CARDRESET;
> +       }
> +
>           dev_set_drvdata(dev, wdt);
>
>           return devm_watchdog_register_device(dev, &wdt->wdd);
>
> Thanks,
> Thang Q. Nguyen -
> ________________________________
> ________________________________
>   The privileged confidential information contained in this email is inte=
nded for use only by the addressees as indicated by the original sender of =
this email. If you are not the addressee indicated in this email or are not=
 responsible for delivery of the email to such a person, please kindly repl=
y to the sender indicating this fact and delete all copies of it from your =
computer and network server immediately. Your cooperation is highly appreci=
ated. It is advised that any unauthorized use of confidential information o=
f Nuvoton is strictly prohibited; and any information in this email irrelev=
ant to the official business of Nuvoton shall be deemed as neither given no=
r endorsed by Nuvoton.
>
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
