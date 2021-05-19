Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EB2389817
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 22:38:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fll7x373Jz307P
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 06:38:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=equinixinc.onmicrosoft.com header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-equinixinc-onmicrosoft-com header.b=G70Mr8hN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.159.192;
 helo=mx0b-00268f01.pphosted.com;
 envelope-from=prvs=6773c47ddf=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=equinixinc.onmicrosoft.com
 header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-equinixinc-onmicrosoft-com header.b=G70Mr8hN; 
 dkim-atps=neutral
X-Greylist: delayed 5700 seconds by postgrey-1.36 at boromir;
 Thu, 20 May 2021 06:38:16 AEST
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com
 [148.163.159.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fll7X0tLMz2xZH;
 Thu, 20 May 2021 06:38:14 +1000 (AEST)
Received: from pps.filterd (m0165121.ppops.net [127.0.0.1])
 by mx0b-00268f01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14JIrQIi001497; Wed, 19 May 2021 19:02:54 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by mx0b-00268f01.pphosted.com with ESMTP id 38n53f8rue-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 May 2021 19:02:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cCsOYuzsLiS/Ev8HBLFh2tQKIKn4ZnDtyPijFRFF7IzJ1oqs8WDPUCx8dbdUPm3FHr/8EjVdZFXc98QJ8qZufr/eSCbNz3kBzUBjQSqea3HhxADB9LSqe05oHe4BVs9MePWcr8QECTL2TNAnpD3s7FFrNiiJPCrOtDCEKJ4Qu1W8jZSgR6UWD3rxSO1fhmt9IoZ/8bTIVatGvgbODKCfgpGMBSLK9YOhIN618/HJ0Zls50EQmRZ82o7dieG773Z4AMAkudCh0V6IQAZmPrrTo9tr458t9KJtV7Gi6vqtBrT9XSXFNmf2/CY1GgCLWgXyfjSbr7yMRzmEQ5KZ6wFrJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kvoCsGU2nQjTYgbXdS5nzV22tJWDyVf+C2DmIiz8KGY=;
 b=MQz2ukTuGzE1KUQtHk2lSCvjWNP+nuArwlHBayu0Zj2w8rFPdglfK3kYJasSLXXWp7eMgM/IU5F03v/kQXxDFQPsvKoLaunnJLxWkZ1WoUQ3FXYCAf7sxxqKVwO0QJk77+LqLj32rGUYFNtIHPPifeixg+fD9pNn16afy+gVe2znzrdDKdhDz1x7EsiOaDUcvdFdu5qtsrEJ/L6FSemkkHrdNvgm3CkjV2nq/15WdLqmrRQkizYwqzk0beO088iANkAEMIysrD6l5K5ZW7aLbLZUIZKtIx9Cj8CIxpflow/zHBE6iuKeSAJ1BJOrDqpSkSnfYaMfsO1rRYE5iLFKzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=equinixinc.onmicrosoft.com; s=selector2-equinixinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kvoCsGU2nQjTYgbXdS5nzV22tJWDyVf+C2DmIiz8KGY=;
 b=G70Mr8hNK4MUvJHRVwYADZSPMqtWo7GTP2un1AWyUvHTppH6SzdqGo2wuqUOBf3UY2O0GlaRJt/AVrD+fYdpkYMo+QqoSDWV7aoocj6ilCmqLXrsPPyeoxZvkcRzesJ3x0I9EnUffi3wKJckjHLc4pvhYzus6+dEip+C5Xuig9g=
Received: from DM5PR04MB0762.namprd04.prod.outlook.com (2603:10b6:3:f3::13) by
 DM6PR04MB5532.namprd04.prod.outlook.com (2603:10b6:5:12d::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.28; Wed, 19 May 2021 19:02:51 +0000
Received: from DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::d9ba:6e7f:b51e:6cab]) by DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::d9ba:6e7f:b51e:6cab%2]) with mapi id 15.20.4129.033; Wed, 19 May 2021
 19:02:50 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Jamin Lin <jamin_lin@aspeedtech.com>
Subject: Re: [PATCH 1/3] i2c: aspeed: avoid new registers definition of AST2600
Thread-Topic: [PATCH 1/3] i2c: aspeed: avoid new registers definition of
 AST2600
Thread-Index: AQHXTOGQ+04th/dwT0i8Ccm8YNu1Cw==
Date: Wed, 19 May 2021 19:02:50 +0000
Message-ID: <YKVg2Kfbex3DYbNI@packtop>
References: <20210519080436.18975-1-jamin_lin@aspeedtech.com>
 <20210519080436.18975-2-jamin_lin@aspeedtech.com>
In-Reply-To: <20210519080436.18975-2-jamin_lin@aspeedtech.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aspeedtech.com; dkim=none (message not signed)
 header.d=none; aspeedtech.com; dmarc=none action=none header.from=equinix.com; 
x-originating-ip: [24.181.166.149]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f83a6770-f627-4288-3300-08d91af8b324
x-ms-traffictypediagnostic: DM6PR04MB5532:
x-microsoft-antispam-prvs: <DM6PR04MB5532A50BF223C8ACA86B6910C32B9@DM6PR04MB5532.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o0klEahC8/xfDOGVZ+y/xugA+ddS+D9mkiSdlLJp6lqex5UK9g0Y1wnWbjAfz+BDu8R34aVAlDNX3+3B5i8A0NglRseLRepKnGUJzLqwe/hLwjXe6+JhYgFkKREiOe9aDGDqVdHR+k+0Ju/mvuzsAAYzeDVts+EbUjFi2xkwCFralcsuj726EnNVYMNr2vBIn31xLPt7jz2xyHxIiMq6fbTw/+svga7bCw36Foxszf7e1JCSbIGBPvgrdqriycO6buYtWpbGIeaXaxfNZ/BLp8VgeP6jns0cq/2BG2hwlqbccMfDUVoabgIV8xEd59DFclz7jHTJLHnyCqEbLKY8TNlblJvUUGIetOvSJkO/NN1qiZrY7DcUkH6WglBYY+A+M2oAN8RT53QPVwNs3W15ZDtWhKYYwVDgXg+yeO4AZTj9ptL5FXQpou8Ba1oLirp4leYquzYrAG/Vpyq8rv+xB2Q3hxno7K9onln33i7jShZEtm0SOUTkfFCepjh5REIOT0i9P4AEwsjLa2J5MrekjzbYe0VvG0w/wofQNHCA0McAF+MbTxStSb6+vIOzn5PdVE9H4IAlSM9Gh/RQzi7Ri5/m5tRJnoYZovA4O5oZ0sE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR04MB0762.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(376002)(136003)(396003)(346002)(39860400002)(366004)(4326008)(478600001)(54906003)(8936002)(8676002)(316002)(6916009)(86362001)(91956017)(7416002)(66946007)(6486002)(5660300002)(76116006)(122000001)(6512007)(71200400001)(9686003)(26005)(186003)(66556008)(66476007)(64756008)(66446008)(38100700002)(33716001)(6506007)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?YPZUePZVPDx0O51aDq5UGtkk0XLS4WQfuV/sNJHKhO6Hpb01+20LGgeuplwI?=
 =?us-ascii?Q?yYNd6uMu2S19ySiBs8xKOhWUk73ZWtaiXa0DhrVv1zRaVSLvs/YvVzu3Yx0B?=
 =?us-ascii?Q?tWKoPKyBfCQqjfsJ5YiTo/vmFEdGxVavht3WjG2w4La3sPogUPi3yxXbOaR9?=
 =?us-ascii?Q?Es9BNihUxq8Pib7t4lGsAin7q2/CX+o7AmkGFt28LG1Y/OiRzxZZ3cEy2s7c?=
 =?us-ascii?Q?T/ZTeJZHDBv1zKaRonWucRZpKe+QRynagI2tQWDMYCE0aZ6c50x54jvZGtVy?=
 =?us-ascii?Q?woc2wwoHJ50YT7BAPRY3wCxXB6ZjlKFJzZt/jjKLIK61IKhLD5OaZAQVds9t?=
 =?us-ascii?Q?RQoAtVsWFjmDpNiVk+Lisxts5WYrUGd1cnTIaOr9tbnULI+vhNNyG/j5M5ct?=
 =?us-ascii?Q?3ScsL48AIGWdflRPsekxzZBwOk+5gUMsQ2W6rzOIbTppjn24edXHbWcYV/oy?=
 =?us-ascii?Q?JNFjH2al3xfVbQy6qfMG5/+s6crsb8G9LLzN643RplPBnW7xOnDCA0d2RMER?=
 =?us-ascii?Q?c2kYov7DL2xCbqkG0unQBjmo7R/lNJ95Uh4XCDosMRDTcPVnjvBvhOERKt3i?=
 =?us-ascii?Q?zxzJUEb5Yj78phUODW3JMI4CaVgFPnt+0EKth6HpzSevSvI4LDCvbw500yGU?=
 =?us-ascii?Q?5Y2HgLCL8VOJq4z0SzLg43pHRy4S3t35mkpRwMwbohrXIHqB4RNbxqvTT8FA?=
 =?us-ascii?Q?T4lgr5TK0NsHt/sdXR7gaVmK+hSkJ2+z7niwwFjZRCKo0/5a9ZpJWfiZ6imj?=
 =?us-ascii?Q?sGFlkKvH5jxm6yNHc0TlgHvLMLxcld5v3o7n4Paqk59HvZkgnJghlYAzwK/p?=
 =?us-ascii?Q?HScOQa6TMG46FXURY1PK/jcvBVVugvVe+Acn6iTNowfN/xOLsaTWK/7of3wR?=
 =?us-ascii?Q?bfZzFl+TMiATVVV3A8MAbteY5XlEjMJ67VWXlz+BFiuo+0GqLjlwnOv8yzve?=
 =?us-ascii?Q?a4afsI92JaxsmR6+mbQ0MUS+HDz8OMtSOcWyJ9g+ox14dShTJp5EAbFgxw3g?=
 =?us-ascii?Q?YkocReRTy//ZvFbkrcmcuxHLBofbJWiSYEupIMbVP/sZd9+tDXiMmYPl0B+y?=
 =?us-ascii?Q?q5O+FYvDGzgvm3n2fum+0hP+ZJ04fo249uR55iBztQOlK9xphnDEFLYSU0IA?=
 =?us-ascii?Q?3vPZCNiVjBAFUCzFc9bkNjNc+UrgQyVDAqwyExyWrpwnYdV45nX5eRPZmlTu?=
 =?us-ascii?Q?PVW8m+yBzoQnuK6a+wncIaaETT5uEzM4qyg4p33XBM5+IzEgM7JR51q2i/6H?=
 =?us-ascii?Q?o/5LWIRFkeSnKrIoQrgCmZn/miVMYyUVhfEEYa7AAkp7Td76m9Rt3ZeK01Az?=
 =?us-ascii?Q?Z4AJ1iN0WnmbWOkRi/JzhH3K/kLGQUw9/zyjOPkpdZzKOQ=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <84F50A129A8DAD49B76EF596CB752539@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR04MB0762.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f83a6770-f627-4288-3300-08d91af8b324
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2021 19:02:50.8511 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zDuP14UVcLw+WRfwC3DERIqIJVUsl+QU2gFiThZxkWypGLngxDBgujxc4z4wpx2XmQ6aJxycWTRPzCuYenCgsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB5532
X-Proofpoint-ORIG-GUID: wMwPn8DyDFsX_YFW7eiXhh4qf4UDxt8Y
X-Proofpoint-GUID: wMwPn8DyDFsX_YFW7eiXhh4qf4UDxt8Y
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-19_09:2021-05-19,
 2021-05-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0 clxscore=1011
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105190115
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
 "ryan_chen@aspeedtech.com" <ryan_chen@aspeedtech.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, "moderated list:ARM/ASPEED I2C
 DRIVER" <openbmc@lists.ozlabs.org>,
 "troy_lee@aspeedtech.com" <troy_lee@aspeedtech.com>,
 Brendan Higgins <brendanhiggins@google.com>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "steven_lee@aspeedtech.com" <steven_lee@aspeedtech.com>,
 "chiawei_wang@aspeedtech.com" <chiawei_wang@aspeedtech.com>, "moderated
 list:ARM/ASPEED MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, May 19, 2021 at 03:04:27AM CDT, Jamin Lin wrote:
>The register definition between AST2600 A2 and A3 is different.
>This patch avoid new registers definition of AST2600 to use
>this driver. We will submit the path for the new registers
>definition of AST2600.
>
>Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
>---
> drivers/i2c/busses/i2c-aspeed.c | 22 ++++++++++++++++++++++
> 1 file changed, 22 insertions(+)
>
>diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspe=
ed.c
>index 724bf30600d6..007309077d9f 100644
>--- a/drivers/i2c/busses/i2c-aspeed.c
>+++ b/drivers/i2c/busses/i2c-aspeed.c
>@@ -19,14 +19,20 @@
> #include <linux/irqchip/chained_irq.h>
> #include <linux/irqdomain.h>
> #include <linux/kernel.h>
>+#include <linux/mfd/syscon.h>
> #include <linux/module.h>
> #include <linux/of_address.h>
> #include <linux/of_irq.h>
> #include <linux/of_platform.h>
> #include <linux/platform_device.h>
>+#include <linux/regmap.h>
> #include <linux/reset.h>
> #include <linux/slab.h>
>
>+/* I2C Global Registers */
>+/* 0x0c : I2CG Global Control Register (AST2500)  */
>+#define ASPEED_I2CG_GLOBAL_CTRL_REG			0x0c
>+
> /* I2C Register */
> #define ASPEED_I2C_FUN_CTRL_REG				0x00
> #define ASPEED_I2C_AC_TIMING_REG1			0x04
>@@ -973,6 +979,22 @@ static int aspeed_i2c_probe_bus(struct platform_devic=
e *pdev)
> 	struct resource *res;
> 	int irq, ret;
>
>+	if (of_device_is_compatible(pdev->dev.of_node,
>+				    "aspeed,ast2600-i2c-bus")) {
>+		u32 global_ctrl;
>+		struct regmap *gr_regmap;
>+
>+		gr_regmap =3D syscon_regmap_lookup_by_compatible("aspeed,ast2600-i2c-gl=
obal");
>+
>+		if (IS_ERR(gr_regmap)) {
>+			ret =3D PTR_ERR(gr_regmap);
>+		} else {
>+			regmap_read(gr_regmap, ASPEED_I2CG_GLOBAL_CTRL_REG, &global_ctrl);
>+			if (global_ctrl & BIT(2))
>+				return -EIO;

A macro definition might be a bit nicer than a raw BIT(2) here I'd
think.

Also, it seems a bit unfortunate to just bail on the device entirely if
we find this bit set (seems like a good way for a bootloader to
inadvertently DoS the kernel), though I guess poking global syscon bits
in the bus probe function might not be ideal.  Could/should we consider
some module-level init code to ensure that bit is cleared?


Zev

>+		}
>+	}
>+
> 	bus =3D devm_kzalloc(&pdev->dev, sizeof(*bus), GFP_KERNEL);
> 	if (!bus)
> 		return -ENOMEM;
>--=20
>2.17.1
>=
