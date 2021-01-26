Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A0F3035C8
	for <lists+openbmc@lfdr.de>; Tue, 26 Jan 2021 06:53:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DPwrr5BQ4zDqlw
	for <lists+openbmc@lfdr.de>; Tue, 26 Jan 2021 16:53:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.130.99;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300099.outbound.protection.outlook.com [40.107.130.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DPwqZ5BFtzDqjQ;
 Tue, 26 Jan 2021 16:52:24 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U2zzwP0+rk0azXgGPmgfTf8wynz6bBX8p8cHF4xjvtgoQulnwuswpdN1SCH7aYBtlo2gEwgICNW1SRKn5vffH2O78RqF1/E8sAYD+KMQUHS78Lx+g2tD+cJdAsognMAjcNUp3iPN+4Cd+WxqDKL3a4bVZyIRvtjhR0jO4cjxrhOtHwM3tp5Tv9kozBqZ6tiEnAOXnw5VWckh9ew+LdWG3uDwjMdzP+oQDmk9Op8Fnli0scC3CiNNQpygtNkSCW4NLk+Cv31dE6g8HDLztGndUXQ7DQDkyVEJ7CRxcylBqTfuk1fzdbLms5fF7WmgUPxlncCpCUA7XD2vVSYCPHwaPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N9v8W6qAoC4oyhp61hVfnvGdJvtvF8KTYUTHzlsyiao=;
 b=Jq5i3xaPfB7lNsGZlv1R6oX865x6cMMykCrymrFnMijYCvt28yC2P2GUrZPXsADKmH2sLkj1Ld+rrvA7RNAE8UAPpR3TBvOkdG5bu7v0li6p2/xlcYkuW8vr/7bIJWxfdhbJhtbzcZ1zOJmaNLTzeEKmsHOntoWlFwH7Ds9HE1mn2+Xrd+J1yNmxLVvbgHxZq3IH01Zp7ZYDT2lDQRzwvOpA0WSD+DIQSSo+AAwOmghr6MgKLxjnWShVLG7hnQwUunF5pyqk5Bsatn8YR51K/l9HLyaKRaKx56ceQel30bKZoqrxrSGQZoHxt5znQrIobll9tVPKIJD1XJViObuogg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by HK0PR06MB2369.apcprd06.prod.outlook.com (2603:1096:203:4d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Tue, 26 Jan
 2021 05:51:54 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::394c:29f2:cb4c:55ed]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::394c:29f2:cb4c:55ed%3]) with mapi id 15.20.3784.019; Tue, 26 Jan 2021
 05:51:54 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "lee.jones@linaro.org"
 <lee.jones@linaro.org>, "joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au"
 <andrew@aj.id.au>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "minyard@acm.org" <minyard@acm.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: [PATCH v5 0/5] Remove LPC register partitioning
Thread-Topic: [PATCH v5 0/5] Remove LPC register partitioning
Thread-Index: AQHW6ndsqox3ADhVhEe3UJldn3lkl6o5ddtQ
Date: Tue, 26 Jan 2021 05:51:54 +0000
Message-ID: <HK0PR06MB377998280F185FC90D98A63E91BC0@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20210114131622.8951-1-chiawei_wang@aspeedtech.com>
In-Reply-To: <20210114131622.8951-1-chiawei_wang@aspeedtech.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=aspeedtech.com;
x-originating-ip: [211.20.114.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: beca8082-7fd5-4f34-9c8c-08d8c1be7c4b
x-ms-traffictypediagnostic: HK0PR06MB2369:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR06MB2369F54A193094D1080C4CC891BC0@HK0PR06MB2369.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mesdh5lIVWmrutRHLat8jV6vYnyy3dYkOUh4Pcr/QPPspyVtmItpsXLoiDsBbqGhgPoLog+vXV3P12bCNd/MLClU+vlRNoIibgbuRqkVRBZhgHkJ/yoOsomPgN0Kd8I1SR6jvAYtsovdAO49LwpizVzgNiPFtBdcE9FrK2DFRaW151mNEwdI+gDUTvRQZwwh6hnyc5HEUcRTPiAo49+2cFY27QSQag3t1rGYdIDGRZOzHJ+PBCZw7K3t0IX8iltljcPJD79tkzuOJ/ofHT/5n2Gm4NQGq2yYhefVkaYYP4jj7u9OOw7N2e8ITghFlAc2YwWq/xFKNBLL2IN9ybrYsrnP80zCywLo/6xvpVLPnhEbCuRZrCUWsb+65U3a8DrPlyuhQNhmsJ25A1qTyoDXctBeKyr2mjXZe4VAbgCl85/zaRkna4VkPbnXtbnsL3pDrrDFElc79sFSihovquqwCQiDG+A8zSpSWIn5687rvxX9/lvhiYImSIJuvpiDzcyzniErMmD19Q21oJUGXC3fDKhCRAcFlCtn7+zyK2WY0ttjCR9+DM8mT6b/of23njpX
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3779.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(136003)(366004)(396003)(39850400004)(921005)(7416002)(52536014)(66946007)(71200400001)(33656002)(8676002)(55236004)(6506007)(2906002)(64756008)(53546011)(66556008)(66476007)(478600001)(66446008)(7696005)(76116006)(26005)(110136005)(5660300002)(4326008)(55016002)(186003)(86362001)(54906003)(8936002)(9686003)(316002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?8JlfrQsGlL6R3qLfUQcZUpUtgJ6arAo/1WV094t/f2saH5bzfGCpgtYSD2tq?=
 =?us-ascii?Q?ZVn9hGLI8rEchld5V5Caraalh6wre8znNSCM3rdI8Spgc0ldsuQe0CF2ZlNY?=
 =?us-ascii?Q?gLB8xYycUbd/X99wCES9uHkH4wb/mNrCu5nb014M+tSPEnN33KT2/5Gl8RLz?=
 =?us-ascii?Q?aaBcNwq1QwWz7xLHcHdT37vAKVxxKXcDzGqUMUtOHQQ8kp06Ji0xKQtRydvM?=
 =?us-ascii?Q?OwyY4tyDVfGUv9qhB49RN2Zyao9hNWh7UxOs6OtkOW3M/cT5q3+OjrbY1B+y?=
 =?us-ascii?Q?gDUymQE1c29sePKYMjf1c77O3riQPQ7yven9Xd1pInWbp8f5moKy+OFXUeju?=
 =?us-ascii?Q?xYe1Rv/aPS6jMdo13KgmznQpmdROg7PuCJXGpRM3aPx5S3j/G259OV0fxuap?=
 =?us-ascii?Q?obPajQSYifEFXjrVy6va/1lokmF4fbe38H7odgYd7C+Ugduo1PUMkcsJu4Sg?=
 =?us-ascii?Q?wJMDrFlGGZrGf7sVoH8Q5d7XxS+sCLa2bFpmP2d0egwI5Hueg/Q1LRSDY92g?=
 =?us-ascii?Q?OmYohIKcBXgM/XflYXLzOfgExd7J2RheI32AXYc7iFVxji33DW2D13i6NEje?=
 =?us-ascii?Q?OhOL7yaIM2zq/3BAwV0hnAebgbG+AtewV8KJeEO2r5graeLpVwmpYhWk+7Xx?=
 =?us-ascii?Q?nHRZHs/7I1z4POMX6RkzS7BGZawJ49ktHcckQWDrZ/5M1AEeVwUK+2z80BLv?=
 =?us-ascii?Q?4GXA0hDPID30sMfzVpzJpdi1GwZL9B9g5HqlaKsrU/8zmD2guEzenYWC735t?=
 =?us-ascii?Q?eJbahxEhpBRal76XVRSuZDxyGs6fa4UQCmMI8IZ6VBT8yilMLxh3UOfYCkS5?=
 =?us-ascii?Q?TIp5J3wpzNt+pDjIpoLV+XCcPBU3CRgCCG9J/DkDmqFN+OQ8+kFvUXxGih5H?=
 =?us-ascii?Q?OY+LDrlIHKEaPi3JvDquwxD3Gxharlk7BhOGjfZ3YYHBmHsGTOyLMUzC9M6b?=
 =?us-ascii?Q?jtAYWtdo0w12YCwD1cL43u2Zv5LRIaKtJg2lsFh/EPS+HL84ADLS7ATFlwsE?=
 =?us-ascii?Q?lJRPGTPuPlzIbv4AM9jMYWmwr51BClvvbY6bm4kCZ+Icxz7hvXcXYGqhIheI?=
 =?us-ascii?Q?g942r9wu?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beca8082-7fd5-4f34-9c8c-08d8c1be7c4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2021 05:51:54.5752 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DaLwd8ldvdqwffbe5dYsha6dntSqS0NArxevQwGzTFQlW+oEtaXTmcu0a+LrXc5z0SnFjReEC3lmh6N5gwyPd7N2raZr6S4Xz09rj5v0Png=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2369
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>, "cyrilbur@gmail.com" <cyrilbur@gmail.com>,
 "haiyue.wang@linux.intel.com" <haiyue.wang@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Thank you all for the reviewing effort.

Hi Joel,

Would you help to merge these patches into Aspeed tree?
If yes, we should also notify Linus Walleij to apply the pinctrl one to the=
 pinctrl tree.

Thanks,
Chiawei

> -----Original Message-----
> From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
> Sent: Thursday, January 14, 2021 9:16 PM
> To: robh+dt@kernel.org; lee.jones@linaro.org; joel@jms.id.au;
> andrew@aj.id.au; linus.walleij@linaro.org; minyard@acm.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org;
> openbmc@lists.ozlabs.org
> Cc: BMC-SW <BMC-SW@aspeedtech.com>; haiyue.wang@linux.intel.com;
> cyrilbur@gmail.com; rlippert@google.com
> Subject: [PATCH v5 0/5] Remove LPC register partitioning
>=20
> The LPC controller has no concept of the BMC and the Host partitions.
> The incorrect partitioning can impose unnecessary range restrictions on
> register access through the syscon regmap interface.
>=20
> For instance, HICRB contains the I/O port address configuration of KCS ch=
annel
> 1/2. However, the KCS#1/#2 drivers cannot access HICRB as it is located a=
t the
> other LPC partition.
>=20
> In addition, to be backward compatible, the newly added HW control bits c=
ould
> be located at any reserved bits over the LPC addressing space.
>=20
> Thereby, this patch series aims to remove the LPC partitioning for better=
 driver
> development and maintenance. This requires the change to both the device
> tree and the driver implementation. To ensure both sides are synchronousl=
y
> updated, a v2 binding check is added.
>=20
> Chagnes since v4:
> 	- Add child node example in dt-bindings.
>=20
> Chagnes since v3:
> 	- Revise binding check as suggested by Haiyue Wang.
>=20
> Changes since v2:
> 	- Add v2 binding check to ensure the synchronization between the
> 	  device tree change and the driver register offset fix.
>=20
> Changes since v1:
> 	- Add the fix to the aspeed-lpc binding documentation.
>=20
> Chia-Wei, Wang (5):
>   dt-bindings: aspeed-lpc: Remove LPC partitioning
>   ARM: dts: Remove LPC BMC and Host partitions
>   ipmi: kcs: aspeed: Adapt to new LPC DTS layout
>   pinctrl: aspeed-g5: Adapt to new LPC device tree layout
>   soc: aspeed: Adapt to new LPC device tree layout
>=20
>  .../devicetree/bindings/mfd/aspeed-lpc.txt    | 100 ++++---------
>  arch/arm/boot/dts/aspeed-g4.dtsi              |  74 ++++------
>  arch/arm/boot/dts/aspeed-g5.dtsi              | 135 ++++++++----------
>  arch/arm/boot/dts/aspeed-g6.dtsi              | 135 ++++++++----------
>  drivers/char/ipmi/kcs_bmc_aspeed.c            |  27 ++--
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c    |  17 ++-
>  drivers/soc/aspeed/aspeed-lpc-ctrl.c          |  20 ++-
>  drivers/soc/aspeed/aspeed-lpc-snoop.c         |  23 +--
>  8 files changed, 229 insertions(+), 302 deletions(-)
>=20
> --
> 2.17.1

