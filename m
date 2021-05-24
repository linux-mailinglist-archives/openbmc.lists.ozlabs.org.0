Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A7938F4CE
	for <lists+openbmc@lfdr.de>; Mon, 24 May 2021 23:16:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fpqlr0VKRz301k
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 07:16:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=equinixinc.onmicrosoft.com header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-equinixinc-onmicrosoft-com header.b=fD2iLFRS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.148.236;
 helo=mx0a-00268f01.pphosted.com;
 envelope-from=prvs=67780b79a6=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=equinixinc.onmicrosoft.com
 header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-equinixinc-onmicrosoft-com header.b=fD2iLFRS; 
 dkim-atps=neutral
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com
 [148.163.148.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FpqlP3YxXz2yX1;
 Tue, 25 May 2021 07:16:32 +1000 (AEST)
Received: from pps.filterd (m0165119.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14OLCxD2015580; Mon, 24 May 2021 21:16:15 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
 by mx0a-00268f01.pphosted.com with ESMTP id 38rbpw1rcf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 May 2021 21:16:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TPcF+ROJ+iXhkNto9bX0tCZOQNxF2SgazwUZ8b+wFv/1xsfWqQCnus/OOnG7F+CBkcngjp024my/nWXryO9wgyvBjs8vsGlnAVVTT5Vq0HRYvvhf2T/WOsAKbGYuwbugbHvPObIJXn5xHNg4KaN8g3VMmulMOx0r/V+HOBOOqdktRRRmBLg2eujNlxHsnr8SNKdA5ttVZLfTzuvohboSLSApkLf4Dj6a49pR0gVqikDR2rQhiFhpSxGhjyTVKsjIF0iBeF2MYYP6WZ7n65IQ9epS86qbOvfUaTs93Wq2yZES48zwXaB9ywns0Spt/T1O29WYcfEM071AWHAva7YhBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NYVbbjuidkDj3FaToWnAMg/O4JQExq9LOHS7Ih2SPMc=;
 b=lecNS37zYLe0i3bBm8Kno9hhrjnZA8T1LymsQNsCvVNcgzRo/h9Ruxfps4AtTCwvG1sxaWC+ZtASGGq+mhMScNU+e5Tj86MuEuyLXh/Tlr2ZOJh/VP94wgzsUgLtxU30uL7rOxvKX52zAIcgFnx053I7qA8/2AI5co9BM9W4B0bppAZFPnE8lbN3CIcJba8+mqxkaJtoQSFqL2Ka9ZjUtvOAi/4rYEcwKUShHotrvEck31UhhjUHIS/OeDyBd9RhoyBzNB0Rw9rD4q1xTzM8rQsaYubZyfrF8gMHP8gVVyLq0v2DiO/EWS9+jKGzr2TZd1qAGHJG+hqjinqPv83rog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=equinixinc.onmicrosoft.com; s=selector2-equinixinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NYVbbjuidkDj3FaToWnAMg/O4JQExq9LOHS7Ih2SPMc=;
 b=fD2iLFRS+sFmylCy/1VPRIx/T+DXn+GLoZixHnl1o8GKQN4CKBS0IR4zl7Y9f4VHG7+JTo85vt9lE8J20avb4xC5cthDyMkQkq+MMpk03A45I0zJmvVQwVbNKyi2TwYZcpX9JDA0s29mZF/aCWHkLkTLM9C8Qb31z5RlB1D7X9I=
Received: from DM5PR04MB0762.namprd04.prod.outlook.com (2603:10b6:3:f3::13) by
 DM5PR04MB0364.namprd04.prod.outlook.com (2603:10b6:3:a8::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.27; Mon, 24 May 2021 21:16:13 +0000
Received: from DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::d9ba:6e7f:b51e:6cab]) by DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::d9ba:6e7f:b51e:6cab%2]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 21:16:13 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Jamin Lin <jamin_lin@aspeedtech.com>
Subject: Re: [PATCH 1/3] i2c: aspeed: avoid new registers definition of AST2600
Thread-Topic: [PATCH 1/3] i2c: aspeed: avoid new registers definition of
 AST2600
Thread-Index: AQHXUOIG88H/dxjruU+R5Lxy+695eA==
Date: Mon, 24 May 2021 21:16:13 +0000
Message-ID: <YKwXnPH0XyYLRtfa@packtop>
References: <20210519080436.18975-1-jamin_lin@aspeedtech.com>
 <20210519080436.18975-2-jamin_lin@aspeedtech.com> <YKVg2Kfbex3DYbNI@packtop>
 <20210524020846.GB2591@aspeedtech.com>
In-Reply-To: <20210524020846.GB2591@aspeedtech.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aspeedtech.com; dkim=none (message not signed)
 header.d=none; aspeedtech.com; dmarc=none action=none header.from=equinix.com; 
x-originating-ip: [24.181.166.149]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3cc9909e-21e3-4934-ab87-08d91ef92946
x-ms-traffictypediagnostic: DM5PR04MB0364:
x-microsoft-antispam-prvs: <DM5PR04MB0364A95274B473ADE95DC4CAC3269@DM5PR04MB0364.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pm7vn4YkLswVq3SajXWxyA/ngdnm+KcMvz63wGaSakMbWJtWgGhpHzTcgQYU88F/OksBQvMkRk1ORQAUEJt3t7a1sqI7S2/QpDobv5c91cUuJzgXOVR6yyJtFfMddUL27VGoArPUTZaZn5Ysai4CuriTsADq8uImGfMUTIQ5pO3SDy08qgx5QVZcogyG6NC6H/aeb7k45rPa/+QMEu9Jan7WL/X8oN/iSBNqS30WcwUNR3UGD8lkOH2f2SLpZgm236fuIwYnt4hlZXyGtaK8qSeNlv+n7rU1b1bfhpxPIA7++Yw3wnoEtWeI2oxuJMCVHUlWLgR+d4oSGQQ1AbKBDOTJjoYUcu0U82ESJScQ+5Y5dB/n9R+I3Rw3zSgPtXXHW7sTxAnMbSHkbnDjiRcbJAhKR8bo2qcRKMMzRtJ5WE87DfkLrUbEbttKc+vuCPpfIyyD5juFELUR2GcLJI/WJ0ZE66M4SAXhMcAje7i6UZYM/S5HuCwtxvtJ48N2aGer0Yqlp1iG2h8nyOHBkpDpm4Mqkyuo4IUCY7t3THmnknegAyXU28J5tcfk2Semt/n83xVcAK6Xu1Lpxsptp3J3JL2xp6RAIwKVlYw98u24ZdA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR04MB0762.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(346002)(376002)(396003)(136003)(39850400004)(366004)(6512007)(9686003)(26005)(64756008)(66446008)(66556008)(76116006)(66946007)(6506007)(8936002)(6916009)(86362001)(7416002)(122000001)(66476007)(38100700002)(8676002)(83380400001)(54906003)(5660300002)(4326008)(71200400001)(2906002)(316002)(6486002)(186003)(33716001)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?xxuJ+LhySHOpjRypQ0+w1DoxdMiI1WZdMyy14v0tVFPiyYpwNtILAkTMVsDY?=
 =?us-ascii?Q?VOnylA8SXyT+O42d/hquUHxQO0wCvAzvr4H1IHhoZS+/R28uFFLakdZkqjku?=
 =?us-ascii?Q?k9zjhsQPmTwW5cSMb+wSjUHPe+LdoWfJfS0v7uLDY+GUdlak55tdAcmEHf4y?=
 =?us-ascii?Q?xuKPVo2nUHBGoxiHLeWH5Ds6PjcxZwg0rdeZ5RyC1lOnTCXuuZU/92xuo3BQ?=
 =?us-ascii?Q?/+5bPo7XPCQCTpoROGi7eFJa0d2UyTzvwB+QydMDbESTpoJvQF4fmpCMfqCZ?=
 =?us-ascii?Q?ugtlX2vQ+lo2L11SaWYidm6sUomdvSlcuHExxM2h+b3CCKGKL12o42SlhBT9?=
 =?us-ascii?Q?bXXGysv7EnQjQC/jZrXFIVVZi/Kk8dP7LbGs9+ONB8DrCfsYplwFuXNb3EzV?=
 =?us-ascii?Q?R1p67bKzFrinlCX5XVqEoxkNNFneA7bF9fagNSFIMzFF/jnptSCMq9+C81Ch?=
 =?us-ascii?Q?yt7DNSlW+t7ZP2ym+3It7By8mP7VJrRnq5ubRTTa3HoUzG1fWJe+92pxvmuU?=
 =?us-ascii?Q?c8pXrFwdB2px2FscZsCcyyjBTQQ+u1hIq/BJaATzDYcz4b8r99draj9eYg00?=
 =?us-ascii?Q?/Bqm6wHguO4PXPh/dhpRCL7MXB9VKL8rT6Os5zYKTIGWnSo7Icadxc4v3UeS?=
 =?us-ascii?Q?VCtLP45vphaPLowH/YRABjwHbp4zfqWgKdxRb53QzlEZ1aVUHNFYAsM8r7+i?=
 =?us-ascii?Q?tngB7hoGnBEYJgEpMs2GrKQgPgMbU3SlRTToP0bd3Ysu9D+gy8YLci7Wjz4l?=
 =?us-ascii?Q?PpIR5U3MA0Jsq/l+mgMmTkmEUSIu7fuFuRwS0ogt3mlQrGBo843lejeFZegx?=
 =?us-ascii?Q?0oB8pP6CdjYhKRP6LKeR7UiEDmDS8cTlxX8FcKHdNnTpIxiL/QUsNKjdj9tn?=
 =?us-ascii?Q?UwjUR7SBSoysi0Atpk2ScxgDaDUukDHF+Rhg66sZ9pObQm5LYNMskmsIql0R?=
 =?us-ascii?Q?gajxsG3NZl5YOUZPI177pHrRHRxSnhGbXdMD6o5x7lsOu5gDT5GLOlDE0t3B?=
 =?us-ascii?Q?//oK3URFvod7hrIZUbgv9j7u0YEgbRug8aBoz9wwlWc7Q0BNHzxgWBQDrrDo?=
 =?us-ascii?Q?nXO027LI/mZgw8rVN8Bf6eLrxOxbspFBeZuMRSL0Wk4W85sZO8tBFM/LSLU5?=
 =?us-ascii?Q?1OiWqTVMvXrCs8uy4NgmIJm6PV+qDTDq9rAt1w95c7x3tCozxQ7zgBTG1BtZ?=
 =?us-ascii?Q?By6i+iT6oq9EHdqY5OE8fHYtZzEYvJ9l11eH85CyKr3LjTFoZqAGrZ5iHGh6?=
 =?us-ascii?Q?a54AY2QwjOfM+5D3lntijamT7+503JQyuDGVeV1oLjW7tk+raKoWTTpBbDyu?=
 =?us-ascii?Q?5DB/20WZ/Ze4kZcldtkeRmOi5Y75ktuIFKjjZ0TlW6QHbA=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DC05F5B0E7C4C249B02B5CE459090DFE@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR04MB0762.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cc9909e-21e3-4934-ab87-08d91ef92946
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2021 21:16:13.7213 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LK0XyFvfJHfL4HXHZwJcmGuOwqhIEqjlFE/GNymjC9eX4Uk/8v2yd5eO5F1OvvBbnXDoNgCFS7p9m7BB5GB7kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0364
X-Proofpoint-GUID: WnbUeubIyoxiFUOdvot_Te8wxziVxV-f
X-Proofpoint-ORIG-GUID: WnbUeubIyoxiFUOdvot_Te8wxziVxV-f
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-24_09:2021-05-24,
 2021-05-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105240126
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
Cc: "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, "moderated list:ARM/ASPEED I2C
 DRIVER" <openbmc@lists.ozlabs.org>, Troy Lee <troy_lee@aspeedtech.com>,
 Brendan Higgins <brendanhiggins@google.com>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 ChiaWei Wang <chiawei_wang@aspeedtech.com>, "moderated
 list:ARM/ASPEED MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, May 23, 2021 at 09:08:47PM CDT, Jamin Lin wrote:
>The 05/19/2021 19:02, Zev Weiss wrote:
>> On Wed, May 19, 2021 at 03:04:27AM CDT, Jamin Lin wrote:
>> >The register definition between AST2600 A2 and A3 is different.
>> >This patch avoid new registers definition of AST2600 to use
>> >this driver. We will submit the path for the new registers
>> >definition of AST2600.
>> >
>> >Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
>> >---
>> > drivers/i2c/busses/i2c-aspeed.c | 22 ++++++++++++++++++++++
>> > 1 file changed, 22 insertions(+)
>> >
>> >diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-a=
speed.c
>> >index 724bf30600d6..007309077d9f 100644
>> >--- a/drivers/i2c/busses/i2c-aspeed.c
>> >+++ b/drivers/i2c/busses/i2c-aspeed.c
>> >@@ -19,14 +19,20 @@
>> > #include <linux/irqchip/chained_irq.h>
>> > #include <linux/irqdomain.h>
>> > #include <linux/kernel.h>
>> >+#include <linux/mfd/syscon.h>
>> > #include <linux/module.h>
>> > #include <linux/of_address.h>
>> > #include <linux/of_irq.h>
>> > #include <linux/of_platform.h>
>> > #include <linux/platform_device.h>
>> >+#include <linux/regmap.h>
>> > #include <linux/reset.h>
>> > #include <linux/slab.h>
>> >
>> >+/* I2C Global Registers */
>> >+/* 0x0c : I2CG Global Control Register (AST2500)  */
>> >+#define ASPEED_I2CG_GLOBAL_CTRL_REG			0x0c
>> >+
>> > /* I2C Register */
>> > #define ASPEED_I2C_FUN_CTRL_REG				0x00
>> > #define ASPEED_I2C_AC_TIMING_REG1			0x04
>> >@@ -973,6 +979,22 @@ static int aspeed_i2c_probe_bus(struct platform_de=
vice *pdev)
>> > 	struct resource *res;
>> > 	int irq, ret;
>> >
>> >+	if (of_device_is_compatible(pdev->dev.of_node,
>> >+				    "aspeed,ast2600-i2c-bus")) {
>> >+		u32 global_ctrl;
>> >+		struct regmap *gr_regmap;
>> >+
>> >+		gr_regmap =3D syscon_regmap_lookup_by_compatible("aspeed,ast2600-i2c=
-global");
>> >+
>> >+		if (IS_ERR(gr_regmap)) {
>> >+			ret =3D PTR_ERR(gr_regmap);
>> >+		} else {
>> >+			regmap_read(gr_regmap, ASPEED_I2CG_GLOBAL_CTRL_REG, &global_ctrl);
>> >+			if (global_ctrl & BIT(2))
>> >+				return -EIO;
>>
>> A macro definition might be a bit nicer than a raw BIT(2) here I'd
>> think.
>Will modify
>>
>> Also, it seems a bit unfortunate to just bail on the device entirely if
>> we find this bit set (seems like a good way for a bootloader to
>> inadvertently DoS the kernel), though I guess poking global syscon bits
>> in the bus probe function might not be ideal.  Could/should we consider
>> some module-level init code to ensure that bit is cleared?
>>
>>
>We use syscon API to get the global register of i2c not the specific i2c
>bus.
>Can you describe it more detail?

Sure -- I just meant that if for whatever reason the kernel is booting
on a system that's had that syscon bit set to enable the new register
access mode (e.g. by a newer bootloader or something), it seems like
we'd just give up entirely on enabling any i2c busses, when as far as I
know there shouldn't be anything stopping us from resetting the bit back
to be in the state this driver needs it to be in (old register mode) and
then continuing along normally.


Zev
