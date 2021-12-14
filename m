Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C90B3473C62
	for <lists+openbmc@lfdr.de>; Tue, 14 Dec 2021 06:22:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCmwQ4bQYz305j
	for <lists+openbmc@lfdr.de>; Tue, 14 Dec 2021 16:22:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=EEzfJPUk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::720;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=EEzfJPUk; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20720.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::720])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCmvv26K3z2yWL
 for <openbmc@lists.ozlabs.org>; Tue, 14 Dec 2021 16:21:59 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BXedOen99Bg4yB6CV6YrQYDapnHyXKqqp3DmGZmK3ACo4cetVIPPLq0j+ylbL8tRTV7RZ/DWxY48BUsWJy3CDkLkPzAXcyrZWSzY6xwuxSOwGiX9U0A3S+PqHD6l1UaEvVKtgYmgiHRXfiLDloNGlVBPS1Jev+o8yxJ7huiXTfkGFtMq9Wh2ZmkC+H17RVJzr0T2SQmOTBSnZqRwIn9gQc6CzdU4JW6kucBLE/x66xc7sD/9rhWN3n1H4Tjxn5GYdKXtFRXIOJRyq6th0Ak7HesIukzXXn8TfCtzXtQNDvS1u51SMnAQjxUQOLIS1h/OQSk2rKu7+W0UUbIRZhQysw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZIfomLKJMnaclOKOUD3523OlFbUBeeuYkdvpe4qBtKE=;
 b=Zh4cYGus5OdtibuRSNm0crjxYPz/kXxWMVnxEIHIy/EhVvfw2GDklvggkqHOPDxthxawdIN7A7/SdlUHs7bm7mmio2sbawxfVtA4GTQC8ofaTTdaVdDBut5nMPUeu489eB3Pr7aIOzqn9mqBKxQMIunrsGPPIqHCpM+LAAGCbycFeHY6fQADozQwBh8qJJHXV1KToUxAt5V0IRP+kR1Nl0HQPtFvZwu8t5YErdrxWzNI5LPNk7txjWHTwGSTkqLp/sj4ztyzBe7eqaOXuX6R3j2RXwKYcqrkj2DgooJ/IoEMP3bfWE1u8WVAzO/xo0y9TR30EHMkjLIMszVhkm0xzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZIfomLKJMnaclOKOUD3523OlFbUBeeuYkdvpe4qBtKE=;
 b=EEzfJPUkkt8or5f99VVLlK3f9PMVPDNhEHUWGy68N7UfyxiVCl3t4+xWTxXW9edZ2VnOWLwMNDk0pvLN/Rv2a1UQywUgwRQYa2y/0qq9/opLOl7IpHqhfTUM7P3mNR8K9/ME6JihXHgntfT2BBnbx+IZ/BoOH9Lalx9s0aynEB9DlOhedCVhM43AiHHlHMyWJ8H0W/t43HiXsYfQ6vNdgIcKQWwnhXZtbxYDnInrW2xI7jomC2x1F0/jY0OrQnzdG7vUFMLgm4ktRdnzBvn6+b8pXNkrLTC55O0P9rF4GK+h/MbyK9AeVVlkuaEvb/0h+3QiAXCfI18rwdJYEo13rQ==
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com (2603:1096:203:82::18)
 by HK2PR0601MB2017.apcprd06.prod.outlook.com (2603:1096:202:7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Tue, 14 Dec
 2021 05:21:36 +0000
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::68a9:3f18:dfe4:273f]) by HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::68a9:3f18:dfe4:273f%7]) with mapi id 15.20.4755.028; Tue, 14 Dec 2021
 05:21:36 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: RE: [PATCH u-boot v2019.04-aspeed-openbmc] pinctrl: ast2400: add
 support for TXD3/RXD3 pins
Thread-Topic: [PATCH u-boot v2019.04-aspeed-openbmc] pinctrl: ast2400: add
 support for TXD3/RXD3 pins
Thread-Index: AQHX8FpD0Nz3v2I3x0ycyTg/sZrw5qwxMObwgAADdACAAAFQoIAAHLsAgAACI3CAAAQtgIAAGxXw
Date: Tue, 14 Dec 2021 05:21:36 +0000
Message-ID: <HK0PR06MB3380C34C97A93A62C7053CA3F2759@HK0PR06MB3380.apcprd06.prod.outlook.com>
References: <20211213194703.24060-1-zev@bewilderbeest.net>
 <HK0PR06MB338026E6233FBF845BF04F5EF2759@HK0PR06MB3380.apcprd06.prod.outlook.com>
 <Ybf0TApJEEaM4FDL@hatter.bewilderbeest.net>
 <HK0PR06MB3380B961DEE52F90241657FDF2759@HK0PR06MB3380.apcprd06.prod.outlook.com>
 <YbgNgBDzrGEI+1/c@hatter.bewilderbeest.net>
 <HK0PR06MB3380C413C9024689082AC4E2F2759@HK0PR06MB3380.apcprd06.prod.outlook.com>
 <YbgSyxUdI+tiG2L1@hatter.bewilderbeest.net>
In-Reply-To: <YbgSyxUdI+tiG2L1@hatter.bewilderbeest.net>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 16b66bcb-25f3-44f2-4e2f-08d9bec19999
x-ms-traffictypediagnostic: HK2PR0601MB2017:EE_
x-microsoft-antispam-prvs: <HK2PR0601MB2017BD6721F09E54A0EFEF1CF2759@HK2PR0601MB2017.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7ADJaWAuVlMDtOCrgPuTR5g5vKS0gBc8o6JtqA1cNGZrvNgt4bEKiiCol4Gx9UIGBhpNaj2rDWZeR8XH2gsoVQmEMUqa0qEijxvKQ1kNnPZ/oOH7dKVNPhO+FMJR0kT8VvKd0PrHQYKuJDf/gsnq5BfwCn4EW3RgQpf+lqFl+Yraftq6ZZrB5F0Q4LIHIi866Aro9u7wK19dVzvSfpvD5alKRdHRAOdBSBvLDG0kYj1MSEUsS+JcqN6cxwft/g2y6alG23H2ScU+ZaK5JL3vQmmZuTceRvp4U4rT00wLL2iE0/asoS0sOxHGogQjCmoF0uyT6dMKWDmh1D9Gop2sE+0CUmSxq7aCBKoQmKC3NatPT8GhC6SRpVeEkppietHXtR863XEMAivnQWmtQdxmsqD0bXa+x8DfOTKuJOHi3IkbZ7n4cCk+bvmFrLzs6I4uC18TAHG4Oy67sWuKg6zaQNZV//d9jbY3RrT9TscX2GIEkr7U7RQJLDThIEv/F6q4A5AR1Ol0fPRu0thyVqlWankJr/wy8MuSN+D7JnOM36mBjM4fMk8aLOnJT856zu142vGI4ZrZi4Nl+xN1GXCLOq4luypGF6LJNSf5gEOFiXUkuhpQl4xytdMgeepLmYMkGv+Q3uK3MjAHGe+RtcKkYIF++T3Ed9gwSwIDsu+lk/yMpbgap2Jde3XsQqa9jcroqaxZaN9ykDDhdKR01NXX+miL/Q0iV2j4QqVr0qsVIc8FcF3SXdud+0rSf5AB3Kyqo1hehMjt8+PDIsVxjsRA8bLplzKCPWY+ML6pq5QhHuaOEruQiWiE9lzkoiq8LWQheXkGHyZLD5uuMt9AfqPrwg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3380.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(136003)(346002)(396003)(366004)(376002)(107886003)(2906002)(38070700005)(6916009)(8936002)(966005)(54906003)(71200400001)(508600001)(8676002)(316002)(4326008)(7696005)(186003)(5660300002)(52536014)(53546011)(6506007)(76116006)(83380400001)(55016003)(66476007)(66446008)(66556008)(64756008)(26005)(33656002)(86362001)(66946007)(9686003)(38100700002)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Xs8+hp1A7Mf+gLPiO6hwZny+hTd5VMXsPfzYZDK+OplV7wnzIyvVE7kQfH4L?=
 =?us-ascii?Q?88+cOGC5EJKAmHauX1Tnlxl0UBJ16oC5kQXUD2MsmH5UmaKahnUDcoZseEe7?=
 =?us-ascii?Q?Oh5siuLc8QwYMHciy6Q313NIlYQ7Z2JxWUrMuglfvfst962x3IxS/ZVyRzRm?=
 =?us-ascii?Q?SZw/2fEoaqWEZKkR90rUZ9s2A61mKrcGjC2EtUKPZLkZMm0h0qBEWFV16VxR?=
 =?us-ascii?Q?aEVPiQOvtNveR9M01YJoc9OJht7lu8ICmNlQAZu65hGGBMFzeyomMEJOuC98?=
 =?us-ascii?Q?3zjPx08UiOIZnCJoe69/1iE5xj7HxKFuVqZUSWdNZ+aHFxAF/Q+4tuEDjsPi?=
 =?us-ascii?Q?OOk57PL3HCrnsKgTHRAre3eCl/8l/XPFDQqFWcV736oV+pCm8vEaUUs3slm7?=
 =?us-ascii?Q?zeH3Cj/W+mSpQ432+I6ijx65Z0JEbJqIF7q+TTV0vDIb2ne/FBWfvb93F8MI?=
 =?us-ascii?Q?sp06c3dHIfuUoti1D2CMEP2mFEf+TduYzwpeEoBSIw8ZJ+Oekz4AUY6GwIWJ?=
 =?us-ascii?Q?XF4dLHfOeQs2u1dPr8cY5UMUHYCBL2LtXUmXdLy6rfW4SCtQP1JBHga0ZuNO?=
 =?us-ascii?Q?fM8ONP4vX0SOgkgnNrf42zWPvs7CP8Amdrlu/+OPs0/q1/lVSPzlTD8D5Jt/?=
 =?us-ascii?Q?PfKfV+nM7U0ME2TP/XD9l+AppGs/7sb5j/LvlvNWFrCO8izsNbPCfChaAETf?=
 =?us-ascii?Q?QzugAJxH3fAkAckpx/RZYf1wHQtJt8gciu9WiwwmFhfFr0fJtrJFumJvi3y8?=
 =?us-ascii?Q?4ecFQWft/kFoSXdXnZxxoMNiHSSsFlb1C9YGiS57v/hERyz4qhOU71pYWeZZ?=
 =?us-ascii?Q?dJAOM9bb7RJ8yS4LpXhrYSmcTpx/uE0KXK0/Wcrr1lObyH4C6YiHM/bSPENf?=
 =?us-ascii?Q?I/9nos7lWTedL5i0wtqt5PxLJHk0GjV2cs/3gR7L2B+ePsZK0VMMj4KsaUeE?=
 =?us-ascii?Q?AlP9DMtQbfAPAtHaqq/ktPtv1CG+zM6U6TxGHFLKhwLtRaOjJ/f23tYgCx7+?=
 =?us-ascii?Q?cMHZbeNaDKMLe2AfiHw7bSRtuDeSAna+FLUm29xCxNME8fBKeCkd3o6339yx?=
 =?us-ascii?Q?sjg2xBA15hsda8mtNYl8CReCqrjexdOfri9MG/wyANYCpyRT38IbvWyPqwbQ?=
 =?us-ascii?Q?uQvfpdwDjO3lyF4Q6qzHLhI220n5cjifVlopM1wvkHJEbm32jb9awfAOfKUJ?=
 =?us-ascii?Q?Kd12KOz7ykYPcNzPlvO+A0fRkSurAfGECAfL4ERp2dXyynTlkPtGFrhaF06F?=
 =?us-ascii?Q?ExajIyuS9LBNSz7ad5ZDGKwwPDOF2+70AnZ6aMhs1MV60DRWq8sfmBwURc8Y?=
 =?us-ascii?Q?/vS5/hYRTdy75v2lpu33L46vo7DRrHjb3xcJ4TLnud/X9I58wXE0oGD9L0Gx?=
 =?us-ascii?Q?HYz8zdSIVMJr3HI1W2cXOJHfJ7XEqA5lLciaJJWUpCEkj0Jo6zVGWPL+jfQk?=
 =?us-ascii?Q?txRzSO7T1reAHmHhfevUk6XcTRPVZgYpjnNyNthYBdYbmld+xWlglFFky6EJ?=
 =?us-ascii?Q?kklh5tVCcTXLd6AU+iaIZ7z0tCvtYSgo7COmz+XgqquW8sTJ4F8Ud3LATiUV?=
 =?us-ascii?Q?1BjxSO2wz+Mt6axNTFA8KlM32Ih+lmdC3o7ECeADT8mVLPSQV1GYZij+NuNa?=
 =?us-ascii?Q?pGPchrjdbOtdd9lsVIdS2Qmf59fnEEOOf+GQo8CNZ3evvcsPEed/5FdXz4hc?=
 =?us-ascii?Q?ng7AAQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3380.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16b66bcb-25f3-44f2-4e2f-08d9bec19999
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2021 05:21:36.3413 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6kSz8ZZU/lQ+arw+7dWrLixhlFarnuXOIys1yZ+xprM9U+6qOta/0PGnVU65MwI8sAUKj/5+Q0XA0r0AcHIJ049GFjt7/JotOQr5zl8o7tQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR0601MB2017
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
 ChiaWei Wang <chiawei_wang@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,
> -----Original Message-----
> From: Zev Weiss <zev@bewilderbeest.net>
> Sent: Tuesday, December 14, 2021 11:43 AM
> To: Ryan Chen <ryan_chen@aspeedtech.com>
> Cc: openbmc@lists.ozlabs.org; Joel Stanley <joel@jms.id.au>; ChiaWei Wang
> <chiawei_wang@aspeedtech.com>
> Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] pinctrl: ast2400: add
> support for TXD3/RXD3 pins
>=20
> On Mon, Dec 13, 2021 at 07:29:48PM PST, Ryan Chen wrote:
> >Hello,
> >> -----Original Message-----
> >> From: Zev Weiss <zev@bewilderbeest.net>
> >> Sent: Tuesday, December 14, 2021 11:21 AM
> >> To: Ryan Chen <ryan_chen@aspeedtech.com>
> >> Cc: openbmc@lists.ozlabs.org; Joel Stanley <joel@jms.id.au>; ChiaWei
> >> Wang <chiawei_wang@aspeedtech.com>
> >> Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] pinctrl: ast2400:
> >> add support for TXD3/RXD3 pins
> >>
> >> On Mon, Dec 13, 2021 at 05:39:17PM PST, Ryan Chen wrote:
> >> >Hello,
> >> >
> >> >> -----Original Message-----
> >> >> From: Zev Weiss <zev@bewilderbeest.net>
> >> >> Sent: Tuesday, December 14, 2021 9:33 AM
> >> >> To: Ryan Chen <ryan_chen@aspeedtech.com>
> >> >> Cc: openbmc@lists.ozlabs.org; Joel Stanley <joel@jms.id.au>;
> >> >> ChiaWei Wang <chiawei_wang@aspeedtech.com>
> >> >> Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] pinctrl: ast240=
0:
> >> >> add support for TXD3/RXD3 pins
> >> >>
> >> >> On Mon, Dec 13, 2021 at 05:22:52PM PST, Ryan Chen wrote:
> >> >> >Hello,
> >> >> >	You may need claim for function group for link, not for pin link.
> >> >> >	Ex.
> >> >> >	static struct aspeed_sig_desc uart3_link[] =3D {
> >> >> >		{ 0x80, BIT(22), 0},
> >> >> >		{ 0x80, BIT(23), 0},
> >> >> >	}
> >> >> >
> >> >> >	ast2400_groups[] =3D {
> >> >> >	{ "UART3", 2, uart3_link },
> >> >> >Ryan
> >> >>
> >> >> Hi Ryan,
> >> >>
> >> >> That possibility occurred to me, but the existing function/group
> >> >> names in arch/arm/dts/ast2400.dtsi (lines 1130-1133 and 1375-1378)
> >> >> made me think they should be separate.
> >> >This device tree is copied from Linux kernel.
> >> >
> >> >> I'm certainly not an expert on pinctrl stuff though...is there
> >> >> some other existing logic or mechanism to link a "UART3" to the
> >> >> separate "TXD3" and "RXD3" in the device tree?
> >> >There is no separate in u-boot device tree.
> >>
> >> Perhaps we're misunderstanding each other...
> >>
> >>
> https://github.com/openbmc/u-boot/blob/a570745a1a836e351bd4b1131f23a4
> >> fa5013d6dd/arch/arm/dts/ast2400.dtsi#L1130-L1133
> >>
> >> and
> >>
> >>
> https://github.com/openbmc/u-boot/blob/a570745a1a836e351bd4b1131f23a4
> >> fa5013d6dd/arch/arm/dts/ast2400.dtsi#L1375-L1378
> >>
> >The following is my point.
> >https://github.com/openbmc/u-boot/blob/a570745a1a836e351bd4b1131f23a
> 4fa
> >5013d6dd/arch/arm/dts/ast2400.dtsi#L3
> >
>=20
> I'm afraid I don't follow...how does it being copied from the Linux kerne=
l device
> tree affect whether or not we should group these two or keep them separat=
e?
My point is the original dtsi file is copy from kernel.
So that dtsi define is inherit. So that you see in currently u-boot.

>=20
>=20
> >> look fairly separate to me?
> >>
> >> >May I know why you need separate?
> >>
> >> In my particular case I don't need these two to be separate, but it
> >> seems conceivable that there might be other cases that would require
> >> a different set of signals to be enabled for a generic "UART3" group
> >> -- possibly more (sideband signals like CTS and such), or perhaps
> >> even fewer (e.g. if you had an output-only UART3 just for logging or
> >> something, and only needed TXD3 for that, but still wanted to use pin
> >> B14 as GPIOE7 instead of RXD3).  Keeping them separate seems like it
> >> leaves things as flexible as possible, avoiding imposing any artificia=
l
> constraints.
> >>
> >>
> >> Zev
> >
