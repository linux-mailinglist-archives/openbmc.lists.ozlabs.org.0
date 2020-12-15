Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A14C82DA62A
	for <lists+openbmc@lfdr.de>; Tue, 15 Dec 2020 03:22:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cw28S6HKRzDqFh
	for <lists+openbmc@lfdr.de>; Tue, 15 Dec 2020 13:22:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.130.113;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300113.outbound.protection.outlook.com [40.107.130.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cw23N1ZFKzDqNs;
 Tue, 15 Dec 2020 13:17:50 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dXkNSDFvjX2n1P/7afZESx7Ps1NnouDyhTwjyxp2EkkhCYd8BsnNyNBuBVDtfjS7n9c9x8kfbdgrRhdGuZvxzT7DXcErpjcoeGdW7kq/66cUebAo34XW8zAy1BsEC19kGkEt9Y1LwF+LMD2vbla2WfdrVZplpAqVDzeNTBX+gwGpAvQ8bpjGy1T/vlzxUb4SiIRnLSrR8orZX9QgOZuwFn8UCAmjgNLozimSIKg7kpJ4oNgVAmK03sOb7WQwSlpJhAuUF6LY61WensVsYmVft1OhDM+loO3zM2s5KmZTok3R5cVa7nrakepJjXRBlPXwJR8RM72nxoZLJJJkmTURyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W2JzpdwsQ+lymTROqoPmN4oGjYldJY2LJQchGDNxzlg=;
 b=JAihtzjFujwmsrHdZf3BHoyHHhDKj4l2+ofcjs/5WXqSOMpwgXPRBG2+Jg/uq5bFLRgs2IMnURfS6xsHEE8+brRCsZUVuY/hG+qc3O2EnoNdlF+C0iN3ENX+eNQA4V9yUAH5UQU02KGuEwfNNZ/xB2q9TxGSt+E36Nx408ydfB9Ia53qENEo9nCOIPvm0B4lZ+IjOzdA7pT+s3ICNjZm34YLpAAExLc9Bw9sogcadJLHQWyasFtuTehQEN44JYSK58ydf9g6Mo7yu70Y0lotiCja8jA7Pcro0N480sDF21A5ZGd1pTymjfhyFBddoOSwJKL4BJUARxhjwU5c0rQ8DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by HK0PR06MB2996.apcprd06.prod.outlook.com (2603:1096:203:8d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.20; Tue, 15 Dec
 2020 02:17:35 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::7061:73d9:50ae:b35e]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::7061:73d9:50ae:b35e%7]) with mapi id 15.20.3654.025; Tue, 15 Dec 2020
 02:17:34 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>
Subject: RE: [PATCH v2 5/5] dt-bindings: aspeed-lpc: Remove LPC partitioning
Thread-Topic: [PATCH v2 5/5] dt-bindings: aspeed-lpc: Remove LPC partitioning
Thread-Index: AQHWq0XpiGvCIQ3se0K0W53Se1w+kan2LtDggAFodoCAABp7gA==
Date: Tue, 15 Dec 2020 02:17:34 +0000
Message-ID: <HK0PR06MB3779995E6FA5D6B2DE16F73D91C60@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20201005082806.28899-1-chiawei_wang@aspeedtech.com>
 <20201005082806.28899-6-chiawei_wang@aspeedtech.com>
 <2e2d3a02-6677-4b0e-b538-d3130a3b20d1@www.fastmail.com>
 <HK0PR06MB3779F5B4B9629909DDF441F091C70@HK0PR06MB3779.apcprd06.prod.outlook.com>
 <d6f83615-c9d1-4906-81e7-10528e963c94@www.fastmail.com>
In-Reply-To: <d6f83615-c9d1-4906-81e7-10528e963c94@www.fastmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=aspeedtech.com;
x-originating-ip: [211.20.114.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4b63b2cb-3fc0-48f4-6e10-08d8a09f95da
x-ms-traffictypediagnostic: HK0PR06MB2996:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR06MB2996DDF4AC793C7D0DFEF02B91C60@HK0PR06MB2996.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eTLJCBKnWoFoQ2C2Qc6E+d2i4ueZnZeOJLqciWCiNTKaLGQLhspTtjsAEEPJOP1B9ZILEjEiY8JLuHkpmI1AHalV2SHgtUdz5zzwkhmjPkcnjPBEINkPU9LzdN9gmGHbGhfn38ipwZmzDZQQR/DZlcm1YLqQ4qhIR7E4HRrLlAISCbM+j4tiF+t4e3q8YG0YZ47H1vlTlTltIJ5ZU1wQv1nT71cbLxDa/4MAE2tSh4qJW/YL7tzmQRc41hrj9fAF+7YzRnOVThXBoG8P0/P/FXaPBHIeaxklKmFIUuvtQsYtwAsNXIDM4Yqff/hbwzq9Fzo4LPijkcfXo+q4EzkCLw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3779.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(39840400004)(346002)(136003)(376002)(7696005)(55016002)(478600001)(8936002)(110136005)(316002)(71200400001)(6506007)(9686003)(4326008)(76116006)(54906003)(2906002)(86362001)(53546011)(66446008)(186003)(66556008)(5660300002)(26005)(55236004)(66946007)(64756008)(66476007)(33656002)(52536014)(7416002)(83380400001)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?4lbLBdfw7UmF1iZadqdTk3ZK+/Y/TEeUDf1Z5wBsJDktUR/zHWX2cpBWCe9h?=
 =?us-ascii?Q?sxCz1mjsz/6RPPBZcCd2R/I3VT/bnBYDTCJ9pWtn5dZMWkHlQF0N0lXCYjlF?=
 =?us-ascii?Q?gQvovQ27cF+vcvcfajafErcNjXCMr3Ah2KidMsBah8P35fx4L53HeM84O8yG?=
 =?us-ascii?Q?exvUGX3nJZhKrdQN1LlV2h02a2/IH+3eddqQBx/WrJMFEN+e5SceNB8MU81g?=
 =?us-ascii?Q?rJNQJ+DFvuP0AF44sJKmdAPLjEBfOr/iZbIKVfGcnHFgI/BLLFy9COmdzX5I?=
 =?us-ascii?Q?/XRBWHx1eclgxqsy9lpHkwk5/vMTUU8vJgD1ZfeS7/WJZD7lFAC65/S5eBHY?=
 =?us-ascii?Q?PMbFAx/tdFcwfEvDPNUPIBora24SIvjkpIeQE1ZIx0upoguv68U0ucC4jt/z?=
 =?us-ascii?Q?sNE2gpgrZOyrj3otVL32i+olqWy3dHjUlU8io7bJXfvwnU1ZUKlgRK1gOFcZ?=
 =?us-ascii?Q?iQcmXN8rBRtnk7MaN19VtVH80xuE0RbzjKcJnR59keQc7TRKnxsd1T2k+cUr?=
 =?us-ascii?Q?Fv+yFDiMsB9q/8C2edhaMQ0Y796z5RVi1zWdV0TsvjndCMbT+CXSWKpFW+6A?=
 =?us-ascii?Q?cBeRwmNBCQ8s9Uz6F1bXhjMTAMbnh7a3+wu80DA+6t2YOkXnRCL+CgXsVg9k?=
 =?us-ascii?Q?GJmNtMPuIMzTecs3edJFGSL0XFS8kV80H5Rro4rjC9fNEc+piXDPoPMnVhMN?=
 =?us-ascii?Q?avE8h85K0pw6C3HNuHwQGOjqLCaA1FETVWPoWQh1Mu5+xyqrR6Vnm4CP7lA/?=
 =?us-ascii?Q?1D3QyUBnloE/b+FE4rtZZbgC/+u2ypiBTqT2/MyrBu5W8o8qDgJhFTkaWrBH?=
 =?us-ascii?Q?33G6cMM2WO7B2lw2C5R/1l4ej11IOjsdsABZhraGHTa0ivOyjUll/gbvwjZU?=
 =?us-ascii?Q?ywsrZctfplJpUc7ZueI2wTyBhgF0DpR02DQlmtpbglbxvumAgrja3pv0nRPS?=
 =?us-ascii?Q?TL2YFdC+QSxPcjQv2J0gtZwS9wVpb1bef0beAbvF8Fg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b63b2cb-3fc0-48f4-6e10-08d8a09f95da
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2020 02:17:34.4741 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uqeRg7NZpe8ch3INpnUgmbC7UdNSbzH+YTjYkE1aBzQ5diaq+abROxkpPI+ef0N8PbAomSvh18jYi7oCmJQTII+VZ+nhyWc06biuGLaBk5Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2996
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
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Corey Minyard <minyard@acm.org>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Lee Jones <lee.jones@linaro.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Haiyue Wang <haiyue.wang@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrew,

> -----Original Message-----
> From: Andrew Jeffery <andrew@aj.id.au>
> Sent: Tuesday, December 15, 2020 8:12 AM
> To: ChiaWei Wang <chiawei_wang@aspeedtech.com>; Rob Herring
> <robh+dt@kernel.org>; Joel Stanley <joel@jms.id.au>
> Cc: Ryan Chen <ryan_chen@aspeedtech.com>; Lee Jones
> <lee.jones@linaro.org>; Corey Minyard <minyard@acm.org>; Arnd Bergmann
> <arnd@arndb.de>; Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Linus
> Walleij <linus.walleij@linaro.org>; Haiyue Wang
> <haiyue.wang@linux.intel.com>; linux-arm-kernel@lists.infradead.org;
> linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org;
> openbmc@lists.ozlabs.org; linux-gpio@vger.kernel.org
> Subject: Re: [PATCH v2 5/5] dt-bindings: aspeed-lpc: Remove LPC partition=
ing
>=20
> Hi Chiawei,
>=20
> On Mon, 14 Dec 2020, at 13:14, ChiaWei Wang wrote:
> > Hi Andrew & Rob,
> >
> > Do you have any suggestion on this patch?
>=20
> Rob hasn't responded, but I think it will be easier to get an Ack out of =
him if we
> do a v2 of the binding so we're not breaking backwards-compatibility with=
 the
> current definition. Concretely:
>=20
> - compatible:   One of:
>                 "aspeed,ast2400-lpc", "simple-mfd"
>                 "aspeed,ast2500-lpc", "simple-mfd"
>=20
> Becomes something like:
>=20
> - compatible:   One of:
>                 "aspeed,ast2400-lpc-v2", "simple-mfd"
>                 "aspeed,ast2500-lpc-v2", "simple-mfd"
>=20
> We can convert the in-tree devicetrees, immediately drop support for the
> current binding in the drivers, and _only_ support v2 of the binding goin=
g
> forward. That way your patches stay largely the same, the binding isn't
> hamstrung as it is currently, and we're not trying to maintain code to su=
pport
> the current binding definition - but we're also not pretending that old
> devicetrees will work with newer kernels that only support the new bindin=
g
> definition (which is the problem with your current patch series).
>=20
> How does that sound?
Sounds good. The v2 binding string should be a notification to sync both th=
e new device tree and the new drivers.
I will prepare a v3 patch with this change and the commit reordering sugges=
ted.

Thanks,
Chiawei

>=20
> As to how to implement this, I think we'll need to add some
> of_device_is_compatible() checks in the relevant drivers to make sure tha=
t
> they're using the new LPC binding, such as in
> drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c before we fetch the regmap on =
line
> 2657.
>=20
> Sorry that this is dragging out a bit (and for the mess I made).
>=20
> Cheers,
>=20
> Andrew
