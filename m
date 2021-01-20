Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C972FCA6D
	for <lists+openbmc@lfdr.de>; Wed, 20 Jan 2021 06:24:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLDV41LxhzDqr6
	for <lists+openbmc@lfdr.de>; Wed, 20 Jan 2021 16:24:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.131.101;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310101.outbound.protection.outlook.com [40.107.131.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLDSp45nkzDqQX;
 Wed, 20 Jan 2021 16:23:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=daZ0NqDh3lasIjXOWI2xwIwoL/BQKG7AmttL74mJDiZS4pkvVeJxDIJOrGy6toB1snNCRMa8/F2psK/Jv8RsZtE+AeNf2h8vJR/hOBYSHclxEY39IBvvdmW0/hMMW8TSE+UhuvR1KmN9LwILrXTQcXWnMkAvyCNK02MuCfChfSSyKtZEiLaEDnXyWuaVDgZSJ4lDtTZdeJsO2mvLBteVS/bvkDz57CQIT7ldrjjlaeJqvVKjjbrUpxUersPx6wWemATxhPqtDDHVd2NsoQ1ezDBGBHiXXkeTGRC4XdgK3nOZVOM1bIDhVjDzlhsDLmEBh2VjdbR5G0c2+GOEgYoW1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=50hsDp4JXjJDV5f0i2lFzfR7pdMHt3J+ODLgkvTiI94=;
 b=nPWcWIJPYWSZbNgnpMJySuvM3LTRqu5NLj8JByC+91UetjnqILbKWYdONjT4do2r0TflFBgm6+BtAyx2V6q2R0c8QsnRaBUNOvCJXv6ewrXRfYmm3O02MPmUKYyRy0rwbGv28VaoZ81v4yTmV4DQHmHiVWZvgtwTFj5EDXN1DMGbqoCPugIvsyKfi0InvOZL1KDWUMBb8fWax7X0o5e7H9fh5YXb6l94ZWH7xtRMdGLDBKnnSMLg27OPik+8aJnkeZnxAKtijMjwBUmzj94cpwGCRj7CArj4Ns6o/wRrhtWCWftvfl/ryS2II0D+0Cj7AjSIbyOz5XhqlfiWHenYNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com (2603:1096:203:82::18)
 by HK2PR06MB3315.apcprd06.prod.outlook.com (2603:1096:202:3f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Wed, 20 Jan
 2021 05:23:15 +0000
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::116:1437:5d9a:16e9]) by HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::116:1437:5d9a:16e9%6]) with mapi id 15.20.3763.014; Wed, 20 Jan 2021
 05:23:15 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Andrew Jeffery <andrew@aj.id.au>, Troy Lee <troy_lee@aspeedtech.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Joel Stanley
 <joel@jms.id.au>, Philipp Zabel <p.zabel@pengutronix.de>, open list
 <linux-kernel@vger.kernel.org>, "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/ASPEED MACHINE
 SUPPORT" <linux-aspeed@lists.ozlabs.org>
Subject: RE: [PATCH v3 4/4] hwmon: Support Aspeed AST2600 PWM/Fan tachometer
Thread-Topic: [PATCH v3 4/4] hwmon: Support Aspeed AST2600 PWM/Fan tachometer
Thread-Index: AQHW7WZcJJ8BVJRwekOFwtRpOy1bEaov+/WAgAABchA=
Date: Wed, 20 Jan 2021 05:23:14 +0000
Message-ID: <HK0PR06MB338019E403823F0BF9962FE3F2A20@HK0PR06MB3380.apcprd06.prod.outlook.com>
References: <20210118065059.2478078-1-troy_lee@aspeedtech.com>
 <20210118065059.2478078-5-troy_lee@aspeedtech.com>
 <2bf67d3a-cd5f-4f9c-b043-709b18a759d5@www.fastmail.com>
In-Reply-To: <2bf67d3a-cd5f-4f9c-b043-709b18a759d5@www.fastmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=aspeedtech.com;
x-originating-ip: [211.20.114.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b91e84f0-80aa-49b2-bbff-08d8bd037ce4
x-ms-traffictypediagnostic: HK2PR06MB3315:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK2PR06MB33153FB1B9B26D03B799AEC7F2A20@HK2PR06MB3315.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +gsrw4UrCgmqkEkByD0YXR39rSwNezBkoYzuDnbxbxFPAXlUzrzN7PTbjkhf91hk6WO/Vc96EI+vIfAjjDE4ZRdvqVwByZsU9nGCrfcmybWt7F3V9Uuhi3nA+rcJsW6QYoVh8nqojOz52bwPSUqubD+ku6Odd3CXK/ytxiCqnHf1tV+SnJFOzCXQU8xek3iwVoBrwZsBwJrNc23QcCo8i/WK8FlNbJOvw+M7ZGONoi9ug18xzwa8SFA9NCayTZgZxV0vGDVvIhXS096tNznwQty7Rz5JRvWfTYQHP2KHmjlqphba4tQ+AJ0SWDTZbMxVLnQhV0IaglbG9lUfI6fiArV6SodWWxcSO392RwkEK9jUiIUcGMpKVBwNo+4eteQ2XIyeZLWrvOc+VHgBvEPQFQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3380.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(39840400004)(346002)(376002)(366004)(2906002)(66946007)(83380400001)(66476007)(8676002)(55236004)(8936002)(110136005)(6506007)(66446008)(53546011)(54906003)(64756008)(66556008)(76116006)(71200400001)(316002)(33656002)(55016002)(52536014)(26005)(7696005)(9686003)(5660300002)(4326008)(478600001)(186003)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?ePZ1sAisFyGCaFX1txdb3NL0Cg+BOB+dfgSZmOxCT/QxDVxE6jKxC/cSwj67?=
 =?us-ascii?Q?TUtbl9/pScEAlSZ6SFUk3xwkLrHxi1Q08bUWR7IZb/r4LYXDLVPFEw0RAPQ9?=
 =?us-ascii?Q?E0xwewrYuIOIYq3aHzdXBp1znSFyRNVSn6Q/NJzNU5wTaSn+vivZVOXkd/9y?=
 =?us-ascii?Q?sTE4vE0kUPDvuL2Aa/bWEMJEFGHljkdfYsAH6u88l2uhu7Iz7X+X705f8m0n?=
 =?us-ascii?Q?bLcDxiCwA8R9DhbWgTb1C/KDMKHNjNzPZLJE63TpuEuBtri3ZaxdK1rk7Hok?=
 =?us-ascii?Q?8/4Moj0c/RQvhTUtUiKA3LYU12V2o0uTlQsMuaHovnvfFWTeA8ez9TA+GCbS?=
 =?us-ascii?Q?NqkudLzedC1CkzW9KYEZg3HvAqlcT17fUjeWKStseHxsuCOa9qrJkxlSJJOE?=
 =?us-ascii?Q?Hz+AqAA9tYDFuIq5u+oKYkwzfiN4vNcJ8vsjjXFhd0OYVRGFu/qrOw+yrEsv?=
 =?us-ascii?Q?q/6GvIHhc9WK5W3oYGXmaA4eJzWBe4QDz5OJWysc4f9oLiQ20DPRcN0BnEPi?=
 =?us-ascii?Q?6m1eh32kD2x8ugPd9F3y4rgEp36mNSipiBhVVZvruhJnbs35ssIN7B9xP6no?=
 =?us-ascii?Q?qpnHBLL4HD1k3IPoax3q5EDqPdRt/CoxPsiNEMZ6gKxx+BdoRFnP/B0Cqpow?=
 =?us-ascii?Q?3P77pLKWPwFIPvZ1KKliwdTeuhYqHf8/HlYdBNwiefrQyr5egn4InoO8p8vZ?=
 =?us-ascii?Q?9btu5Tg5p2/FVzd01svkb6mIeGv0nWiFOG41FPG/9koQ11Zp0w0pQwKdNCIy?=
 =?us-ascii?Q?OYk8UCYC3JZXK9Xs9j8Oyry/Mu/XQLw4FjXJr7uqLLNgJCbQHIKFj4lDwGTw?=
 =?us-ascii?Q?aPWjUKCtNPsgGA7jNElPv4HdiXQC3QwbqRAg2reOWx2xG3D4xs1qvqKG8EZS?=
 =?us-ascii?Q?idwZ5QjzpmSt6CyofunvHUh8Bld6/Z/osvhRlXo3Pllva6z95C4xIUPDlCVm?=
 =?us-ascii?Q?+jKSFG1NPNM+FVbkGnWGzBdlWwDITDyFwotyICk04M4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3380.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b91e84f0-80aa-49b2-bbff-08d8bd037ce4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2021 05:23:14.9888 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: moKz0A36RT0z/IYRSN4F0WnnKEKB8M+gcSGEfqYVM++EdWfaIHJZt39JKqUpQyrvi4v18zBi3dhI+4Uc3dmo3zLknJs/5HuBLm9PhqBRGs8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR06MB3315
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
Cc: ChiaWei Wang <chiawei_wang@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 kbuild test robot <lkp@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> -----Original Message-----
> From: Andrew Jeffery <andrew@aj.id.au>
> Sent: Wednesday, January 20, 2021 1:16 PM
> To: Troy Lee <troy_lee@aspeedtech.com>; openbmc@lists.ozlabs.org; Joel
> Stanley <joel@jms.id.au>; Philipp Zabel <p.zabel@pengutronix.de>; open li=
st
> <linux-kernel@vger.kernel.org>; moderated list:ARM/ASPEED MACHINE
> SUPPORT <linux-arm-kernel@lists.infradead.org>; moderated
> list:ARM/ASPEED MACHINE SUPPORT <linux-aspeed@lists.ozlabs.org>
> Cc: Ryan Chen <ryan_chen@aspeedtech.com>; ChiaWei Wang
> <chiawei_wang@aspeedtech.com>; Troy Lee <leetroy@gmail.com>; kbuild
> test robot <lkp@intel.com>
> Subject: Re: [PATCH v3 4/4] hwmon: Support Aspeed AST2600 PWM/Fan
> tachometer
>=20
> Hi Troy,
>=20
> On Mon, 18 Jan 2021, at 17:20, Troy Lee wrote:
> > Add Aspeed AST2600 PWM/Fan tacho driver. AST2600 has 16 PWM channel
> > and
> > 16 FAN tacho channel.
> >
> > Changes since v2:
> >  - declare local function as static function
> >
> > Changes since v1:
> >  - fixed review comments
> >  - fixed double-looped calculation of div_h and div_l
> >  - moving configuration to device tree
> >  - register hwmon driver with devm_hwmon_device_register_with_info()
> >
> > Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> > Reported-by: kernel test robot <lkp@intel.com>
> > ---
> >  drivers/hwmon/Kconfig                |  10 +
> >  drivers/hwmon/Makefile               |   1 +
> >  drivers/hwmon/aspeed2600-pwm-tacho.c | 756
> > +++++++++++++++++++++++++++
> >  3 files changed, 767 insertions(+)
> >  create mode 100644 drivers/hwmon/aspeed2600-pwm-tacho.c
>=20
> ...
>=20
> > diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile index
> > 09a86c5e1d29..1a415d493ffc 100644
> > --- a/drivers/hwmon/Makefile
> > +++ b/drivers/hwmon/Makefile
> > @@ -52,6 +52,7 @@ obj-$(CONFIG_SENSORS_ARM_SCPI)	+=3D
> scpi-hwmon.o
> >  obj-$(CONFIG_SENSORS_AS370)	+=3D as370-hwmon.o
> >  obj-$(CONFIG_SENSORS_ASC7621)	+=3D asc7621.o
> >  obj-$(CONFIG_SENSORS_ASPEED)	+=3D aspeed-pwm-tacho.o
> > +obj-$(CONFIG_SENSORS_ASPEED2600_PWM_TACHO)	+=3D
> aspeed2600-pwm-tacho.o
>=20
> Why does this have to be a separate implementation from the existing ASPE=
ED
> PWM/Tacho driver? Is there really nothing in common?
>=20
Hello Andrew,
	The register set is fully re-arrange. And it is new design at AST2600, can=
't be compatible with older PWM. =20
