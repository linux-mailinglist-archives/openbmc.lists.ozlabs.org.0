Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D581335A6FF
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 21:22:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FH7LY4phMz3bwL
	for <lists+openbmc@lfdr.de>; Sat, 10 Apr 2021 05:22:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=equinixinc.onmicrosoft.com header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-equinixinc-onmicrosoft-com header.b=C9J1KG4H;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.148.236;
 helo=mx0a-00268f01.pphosted.com;
 envelope-from=prvs=5733813a0f=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=equinixinc.onmicrosoft.com
 header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-equinixinc-onmicrosoft-com header.b=C9J1KG4H; 
 dkim-atps=neutral
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com
 [148.163.148.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FH7LC5Hs3z3bTR;
 Sat, 10 Apr 2021 05:22:10 +1000 (AEST)
Received: from pps.filterd (m0105196.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 139JDw8q015572; Fri, 9 Apr 2021 19:21:38 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
 by mx0a-00268f01.pphosted.com with ESMTP id 37ts0e0v0y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 19:21:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TVFErZcovNmJgSHGsUPsc08r+sSe05ms77VUkTEVWNhim4aSXdQucUJb2j2YG3i5RqKxeBLyO79Jk0k1+5duxcFO5S3BrwCP/+VPneHhBpXid8g5pso88psfsJvenG8Fc/NeSAYN+pJbjmqXb8j83molEuM9o28pE5X2GxtlYm1Aktm305zoXCvUBc5J1BdbXlYxfMN1GdO6rn/pyUT7WR7bm6pQqV1vEMYdU+MJ+FAA0fxOfpxsfnUaGUe6fu91ESVsnH5/fQc410+3pk31cglFRH+5GinnxsGXXimZjcjjerg/rvoa4TZh8Z3sMk44vj46BCQtf7sVaOTazW+nTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xI+8E+S8M5qGrDi/51B1D8E0Sh4qglFIhdAdQ/sJ1Fw=;
 b=DHzv0mRVCjjUQ1+7pfI98pnlJJsQoi0W5HOt3A3ckKULAbPZrbSy6OC/HOVMMxd0ZhtZSeX+kYULd2X59AAmekgEVvYIGoYq6msOjzEkD4MTw8DOE4mEwgVgQqrO5Ax7k8ml7W9B8QJrwrPZBPNgb+uqGEjFwicrd6n9Jv4WKRbEYlortxQPSKLvrNixkPKjtd8LEbJ7oxuOASNEvZTWL8eOcn6J2pThZ4BZbNR+JmmQ9gFlwPFWK1A7yZWq72xonZ3/pHC1En0TFoD0Q7Ki/2xrPREWdMKBenozBhfTJeb9pMWpT3rzlI8zxtEMBuMwDj1biE33tWKpiX79ISEHxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=equinixinc.onmicrosoft.com; s=selector2-equinixinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xI+8E+S8M5qGrDi/51B1D8E0Sh4qglFIhdAdQ/sJ1Fw=;
 b=C9J1KG4H6oJ9Glk4Z0LQAd+Dja1gEEPxNcM2MjhTCQyXqK7D4t1gsphUNw3LiyRI6VxlSdvVPuuwmewYE59KqSPWp16p6DbKbzhE4oi31eYYaGW7UqnlWsbtI3LkRUtMf1RlNbX3/8mBDF1GdF88OJrP+KguRw4e3O+2kQBaSlE=
Received: from DM5PR04MB0762.namprd04.prod.outlook.com (2603:10b6:3:f3::13) by
 DM5PR04MB0363.namprd04.prod.outlook.com (2603:10b6:3:aa::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17; Fri, 9 Apr 2021 19:21:34 +0000
Received: from DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::4c98:aeb:87a8:13ad]) by DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::4c98:aeb:87a8:13ad%5]) with mapi id 15.20.4020.017; Fri, 9 Apr 2021
 19:21:34 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v2 09/21] ipmi: kcs_bmc: Split out kcs_bmc_cdev_ipmi
Thread-Topic: [PATCH v2 09/21] ipmi: kcs_bmc: Split out kcs_bmc_cdev_ipmi
Thread-Index: AQHXLXWNu7Ns/9FES0+M3VsE9hbh+g==
Date: Fri, 9 Apr 2021 19:21:34 +0000
Message-ID: <YHCpPa3EtVy9XcLn@packtop>
References: <20210319062752.145730-1-andrew@aj.id.au>
 <20210319062752.145730-9-andrew@aj.id.au> <YG/QUCIdEzW1ghVA@packtop>
 <6aa7c000-da09-4058-96b4-f330193c7fc6@www.fastmail.com>
In-Reply-To: <6aa7c000-da09-4058-96b4-f330193c7fc6@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=equinix.com;
x-originating-ip: [24.181.166.149]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b78edeb7-6517-4bb0-96f7-08d8fb8cb043
x-ms-traffictypediagnostic: DM5PR04MB0363:
x-microsoft-antispam-prvs: <DM5PR04MB0363AD4A6D41BD38050730D0C3739@DM5PR04MB0363.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sWApSuL5aOLs/5LaEo9UuBeGrVVHqkt8GsOuC+AOEjq5gD5/WaSSwgmrSdfckR4FQ3JAW9ldI/msAQvFrxvm9kFkWmhoetWnnxyT5edrVzuMmrZvUPAEbXIcMr7rpfzGSWpE1PSCHnukP1OsBUWwBslg8wSn+VLuaXeJrv9MbMXOM8swHygSSbLl2PA2bVR6vphyry/KC7qdvf4AeotYsaoTNLXO+qGSu6etXHojWqASi+DZpdVREvVp38FO/iZNOxIoyrI0InVfECmt6p/VLmR9uoSFtSiuzQ8yt/f4lytwUWB03eEk9UmqHQnA1jzmKmCPegYTHdoCeyYrFh4NcJtYm21Lwzo3+VTJeh8XC2+/nSP6qkfiu9aqO00XG9CaLnXEK3jY3jt56KQGnu/zQ/RnEr6WsQmDHXymgg6O8cfc/B2meAWOWmp1PbXKD1RFMUGqvjlVd3rPTXI+ma53MbmRWALVBsPNgVlzbLUzsH91yCo77+pIltpcTJx8RmztDxjrGFYVkvDQWePlbrn5E45rrbTmQHVurakst272VXi0mlE0vE93CkBySrGbQmvyVuQB9SG9Z8WlwYojs2jIQ2WLybvX3T5JogimOF08xmDexs7/LTF+tUoYCWJOLGTxmNRNhK5gpt5VOLu1Kf+lCnk0d/Z93NwMjEEDJi0HyQE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR04MB0762.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(39850400004)(396003)(366004)(376002)(136003)(346002)(2906002)(9686003)(4326008)(8676002)(6916009)(76116006)(6512007)(6486002)(26005)(478600001)(6506007)(54906003)(316002)(66556008)(64756008)(66446008)(66476007)(86362001)(7416002)(38100700001)(5660300002)(8936002)(71200400001)(83380400001)(33716001)(66946007)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?5RziUrrUH7yddksiCh537+Jl/q7G5V+0znAhSki2qtDWWN/Sp+d40hO4O18S?=
 =?us-ascii?Q?QBVeTmyNASBRdDuyzfLO33fKjXdCXKhQfFpJZ1/xeOA7E/z71SJiOx/ZAv+i?=
 =?us-ascii?Q?jRiE2XTfOdXgODtoj6Dydu2okx7tR9zWulSLptdo/HiYsD76mZTr2QkePyUf?=
 =?us-ascii?Q?Fs/DdLVqPOBpngQ1FY88hGYn57vrVLL6db3ONTt+SQye0lbxqqO7DvAjiqoW?=
 =?us-ascii?Q?3xOTDtK32DAOA5FifCNMF3KTy9pgeS6KjwO+xJI1ysf/4EEoJJfFKhgAAuo0?=
 =?us-ascii?Q?8YGMtVa+eSSs+OTUg4H3ncoC7nOB9EXWTUvlPkVQhWujhFy1zMew9Sbwornj?=
 =?us-ascii?Q?T/v8FTpmxA5356Lxn9sE4xCROmr4yWnHJQxdyp06fNVU9xfur9zJ517NDP4/?=
 =?us-ascii?Q?p9iTwPw/nhPOCtgtq1JsDuSOBshG6QuqjUNqvTqgg2MKV98gPpu9HtngBQhq?=
 =?us-ascii?Q?6DAYIzjOcx35WEX4zgrcH5K2LtMU6O1UTIocReb4VGOBDYIeIsPYBhmiTO3Q?=
 =?us-ascii?Q?hyGzo5yulnb6jguCig0kBW1Z2kTK/VpNu0vIyt4IfNAZRl6i3xQWwTdqlp2m?=
 =?us-ascii?Q?0yeJUnu03a2Mmbf8DdL4NyFITSl+CzRpOxuBCqaoS9i8rwCAUYIVuu0j6Plx?=
 =?us-ascii?Q?0h5bMSx3HNyvxj6PczhYG1AJfNxXA8maygNynCxhGRiRi8sBizxSJPSDPNm7?=
 =?us-ascii?Q?QvP6bfliJDWERZ4Ywg9yA6QZRrVQ01XXRH8sSUNzSkyqw2pGTNkMgYSX1d28?=
 =?us-ascii?Q?XkoLVpIYH3fi2MphuzTzW11Nk+fKBKAmTJSZOFQpLpirhBkYbdA9DOs8Y7Ac?=
 =?us-ascii?Q?m+Usy66WTDDxOcSSTW10eLwacmdHFxddACOqdunJdF5R/Am2w3CPal+s8tCD?=
 =?us-ascii?Q?KOv1DKXZHcSTldSZ2KmPTJqzZMsMGv0D39fUVFmYb3VBfhgyV5Z+pntYTVdL?=
 =?us-ascii?Q?2XPi9uJz/m0ZzNLwJCoG08cUQ0L8lFe4Fy7H/s8nUKr2UkCMTS6TAY18Yd0S?=
 =?us-ascii?Q?Kw5hBwtHfa4eq6aMVwyFci8Z8e/wy4UN1Y2c4ZZrsI6CwoFCfrb2REz1Xxob?=
 =?us-ascii?Q?FkPK189uEdy//MBKL3cm21GDqJtHygduiOBfQAZkqv6zCI7sjeCCuHEdsCX5?=
 =?us-ascii?Q?OhgB1eqitnY6gwhRVAaWIbK6Yfi6UjpJRll7mTmZXGM71rLFQxn4Dd20DgV9?=
 =?us-ascii?Q?Vwwi729XGJr7bdcuP1UWZWrr6g/ZJnzIuuAGm8FYpUKU0xV8NvQelxiqvIbE?=
 =?us-ascii?Q?elNItWRpp0I1iq32AcG0pV85utunrcM4TUFmAybHRnRuLTne4Y0myBT+SwhQ?=
 =?us-ascii?Q?f7ToOZ5ElIYtFfj7UYxobajpG5/nEwaeIamuvWNsmOx4bw=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BA7FA534809E8A49AA8EB76770988099@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR04MB0762.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b78edeb7-6517-4bb0-96f7-08d8fb8cb043
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2021 19:21:34.3348 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bRtgpqSObKy3Lc2ce09KZ4+HBPby/itdP3kOpjZ6q8jQ20OzNHFku6YqW29SNmerTwdBmt20+lmeKZbxRRfuyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0363
X-Proofpoint-ORIG-GUID: 1G8bx9LvoGyVfGnvHFLVJZ-QsxY7yCAi
X-Proofpoint-GUID: 1G8bx9LvoGyVfGnvHFLVJZ-QsxY7yCAi
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-09_07:2021-04-09,
 2021-04-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104090138
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Chia-Wei,
 Wang" <chiawei_wang@aspeedtech.com>, Ryan Chen <ryan_chen@aspeedtech.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Corey Minyard <minyard@acm.org>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>, Lee Jones <lee.jones@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Apr 09, 2021 at 12:48:21AM CDT, Andrew Jeffery wrote:
>
>
>On Fri, 9 Apr 2021, at 13:26, Zev Weiss wrote:
>> On Fri, Mar 19, 2021 at 01:27:40AM CDT, Andrew Jeffery wrote:
>> >Take steps towards defining a coherent API to separate the KCS device
>> >drivers from the userspace interface. Decreasing the coupling will
>> >improve the separation of concerns and enable the introduction of
>> >alternative userspace interfaces.
>> >
>> >For now, simply split the chardev logic out to a separate file. The cod=
e
>> >continues to build into the same module.
>> >
>> >Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>> >---
>> > drivers/char/ipmi/Makefile            |   2 +-
>> > drivers/char/ipmi/kcs_bmc.c           | 423 +------------------------
>> > drivers/char/ipmi/kcs_bmc.h           |  10 +-
>> > drivers/char/ipmi/kcs_bmc_cdev_ipmi.c | 428 ++++++++++++++++++++++++++
>> > 4 files changed, 451 insertions(+), 412 deletions(-)
>> > create mode 100644 drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
>> >
>> >diff --git a/drivers/char/ipmi/Makefile b/drivers/char/ipmi/Makefile
>> >index 0822adc2ec41..a302bc865370 100644
>> >--- a/drivers/char/ipmi/Makefile
>> >+++ b/drivers/char/ipmi/Makefile
>> >@@ -22,7 +22,7 @@ obj-$(CONFIG_IPMI_SSIF) +=3D ipmi_ssif.o
>> > obj-$(CONFIG_IPMI_POWERNV) +=3D ipmi_powernv.o
>> > obj-$(CONFIG_IPMI_WATCHDOG) +=3D ipmi_watchdog.o
>> > obj-$(CONFIG_IPMI_POWEROFF) +=3D ipmi_poweroff.o
>> >-obj-$(CONFIG_IPMI_KCS_BMC) +=3D kcs_bmc.o
>> >+obj-$(CONFIG_IPMI_KCS_BMC) +=3D kcs_bmc.o kcs_bmc_cdev_ipmi.o
>> > obj-$(CONFIG_ASPEED_BT_IPMI_BMC) +=3D bt-bmc.o
>> > obj-$(CONFIG_ASPEED_KCS_IPMI_BMC) +=3D kcs_bmc_aspeed.o
>> > obj-$(CONFIG_NPCM7XX_KCS_IPMI_BMC) +=3D kcs_bmc_npcm7xx.o
>> >diff --git a/drivers/char/ipmi/kcs_bmc.c b/drivers/char/ipmi/kcs_bmc.c
>> >index c4336c1f2d6d..ef5c48ffe74a 100644
>> >--- a/drivers/char/ipmi/kcs_bmc.c
>> >+++ b/drivers/char/ipmi/kcs_bmc.c
>> >@@ -3,446 +3,51 @@
>> >  * Copyright (c) 2015-2018, Intel Corporation.
>> >  */
>> >
>> >-#define pr_fmt(fmt) "kcs-bmc: " fmt
>> >-
>> >-#include <linux/errno.h>
>> >-#include <linux/io.h>
>> >-#include <linux/ipmi_bmc.h>
>> > #include <linux/module.h>
>> >-#include <linux/platform_device.h>
>> >-#include <linux/poll.h>
>> >-#include <linux/sched.h>
>> >-#include <linux/slab.h>
>> >
>> > #include "kcs_bmc.h"
>> >
>> >-#define DEVICE_NAME "ipmi-kcs"
>> >-
>> >-#define KCS_MSG_BUFSIZ    1000
>> >-
>> >-#define KCS_ZERO_DATA     0
>> >-
>> >-
>> >-/* IPMI 2.0 - Table 9-1, KCS Interface Status Register Bits */
>> >-#define KCS_STATUS_STATE(state) (state << 6)
>> >-#define KCS_STATUS_STATE_MASK   GENMASK(7, 6)
>> >-#define KCS_STATUS_CMD_DAT      BIT(3)
>> >-#define KCS_STATUS_SMS_ATN      BIT(2)
>> >-#define KCS_STATUS_IBF          BIT(1)
>> >-#define KCS_STATUS_OBF          BIT(0)
>> >-
>> >-/* IPMI 2.0 - Table 9-2, KCS Interface State Bits */
>> >-enum kcs_states {
>> >-	IDLE_STATE  =3D 0,
>> >-	READ_STATE  =3D 1,
>> >-	WRITE_STATE =3D 2,
>> >-	ERROR_STATE =3D 3,
>> >-};
>> >-
>> >-/* IPMI 2.0 - Table 9-3, KCS Interface Control Codes */
>> >-#define KCS_CMD_GET_STATUS_ABORT  0x60
>> >-#define KCS_CMD_WRITE_START       0x61
>> >-#define KCS_CMD_WRITE_END         0x62
>> >-#define KCS_CMD_READ_BYTE         0x68
>> >-
>> >-static inline u8 kcs_bmc_read_data(struct kcs_bmc *kcs_bmc)
>> >+u8 kcs_bmc_read_data(struct kcs_bmc *kcs_bmc)
>> > {
>> > 	return kcs_bmc->io_inputb(kcs_bmc, kcs_bmc->ioreg.idr);
>> > }
>> >+EXPORT_SYMBOL(kcs_bmc_read_data);
>> >
>> >-static inline void kcs_bmc_write_data(struct kcs_bmc *kcs_bmc, u8 data=
)
>> >+void kcs_bmc_write_data(struct kcs_bmc *kcs_bmc, u8 data)
>> > {
>> > 	kcs_bmc->io_outputb(kcs_bmc, kcs_bmc->ioreg.odr, data);
>> > }
>> >+EXPORT_SYMBOL(kcs_bmc_write_data);
>> >
>> >-static inline u8 kcs_bmc_read_status(struct kcs_bmc *kcs_bmc)
>> >+u8 kcs_bmc_read_status(struct kcs_bmc *kcs_bmc)
>> > {
>> > 	return kcs_bmc->io_inputb(kcs_bmc, kcs_bmc->ioreg.str);
>> > }
>> >+EXPORT_SYMBOL(kcs_bmc_read_status);
>> >
>> >-static inline void kcs_bmc_write_status(struct kcs_bmc *kcs_bmc, u8 da=
ta)
>> >+void kcs_bmc_write_status(struct kcs_bmc *kcs_bmc, u8 data)
>> > {
>> > 	kcs_bmc->io_outputb(kcs_bmc, kcs_bmc->ioreg.str, data);
>> > }
>> >+EXPORT_SYMBOL(kcs_bmc_write_status);
>> >
>> >-static void kcs_bmc_update_status(struct kcs_bmc *kcs_bmc, u8 mask, u8=
 val)
>> >+void kcs_bmc_update_status(struct kcs_bmc *kcs_bmc, u8 mask, u8 val)
>> > {
>> > 	kcs_bmc->io_updateb(kcs_bmc, kcs_bmc->ioreg.str, mask, val);
>> > }
>> >+EXPORT_SYMBOL(kcs_bmc_update_status);
>> >
>> >-static inline void set_state(struct kcs_bmc *kcs_bmc, u8 state)
>> >-{
>> >-	kcs_bmc_update_status(kcs_bmc, KCS_STATUS_STATE_MASK,
>> >-					KCS_STATUS_STATE(state));
>> >-}
>> >-
>> >-static void kcs_force_abort(struct kcs_bmc *kcs_bmc)
>> >-{
>> >-	set_state(kcs_bmc, ERROR_STATE);
>> >-	kcs_bmc_read_data(kcs_bmc);
>> >-	kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
>> >-
>> >-	kcs_bmc->phase =3D KCS_PHASE_ERROR;
>> >-	kcs_bmc->data_in_avail =3D false;
>> >-	kcs_bmc->data_in_idx =3D 0;
>> >-}
>> >-
>> >-static void kcs_bmc_handle_data(struct kcs_bmc *kcs_bmc)
>> >-{
>> >-	u8 data;
>> >-
>> >-	switch (kcs_bmc->phase) {
>> >-	case KCS_PHASE_WRITE_START:
>> >-		kcs_bmc->phase =3D KCS_PHASE_WRITE_DATA;
>> >-		fallthrough;
>> >-
>> >-	case KCS_PHASE_WRITE_DATA:
>> >-		if (kcs_bmc->data_in_idx < KCS_MSG_BUFSIZ) {
>> >-			set_state(kcs_bmc, WRITE_STATE);
>> >-			kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
>> >-			kcs_bmc->data_in[kcs_bmc->data_in_idx++] =3D
>> >-						kcs_bmc_read_data(kcs_bmc);
>> >-		} else {
>> >-			kcs_force_abort(kcs_bmc);
>> >-			kcs_bmc->error =3D KCS_LENGTH_ERROR;
>> >-		}
>> >-		break;
>> >-
>> >-	case KCS_PHASE_WRITE_END_CMD:
>> >-		if (kcs_bmc->data_in_idx < KCS_MSG_BUFSIZ) {
>> >-			set_state(kcs_bmc, READ_STATE);
>> >-			kcs_bmc->data_in[kcs_bmc->data_in_idx++] =3D
>> >-						kcs_bmc_read_data(kcs_bmc);
>> >-			kcs_bmc->phase =3D KCS_PHASE_WRITE_DONE;
>> >-			kcs_bmc->data_in_avail =3D true;
>> >-			wake_up_interruptible(&kcs_bmc->queue);
>> >-		} else {
>> >-			kcs_force_abort(kcs_bmc);
>> >-			kcs_bmc->error =3D KCS_LENGTH_ERROR;
>> >-		}
>> >-		break;
>> >-
>> >-	case KCS_PHASE_READ:
>> >-		if (kcs_bmc->data_out_idx =3D=3D kcs_bmc->data_out_len)
>> >-			set_state(kcs_bmc, IDLE_STATE);
>> >-
>> >-		data =3D kcs_bmc_read_data(kcs_bmc);
>> >-		if (data !=3D KCS_CMD_READ_BYTE) {
>> >-			set_state(kcs_bmc, ERROR_STATE);
>> >-			kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
>> >-			break;
>> >-		}
>> >-
>> >-		if (kcs_bmc->data_out_idx =3D=3D kcs_bmc->data_out_len) {
>> >-			kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
>> >-			kcs_bmc->phase =3D KCS_PHASE_IDLE;
>> >-			break;
>> >-		}
>> >-
>> >-		kcs_bmc_write_data(kcs_bmc,
>> >-			kcs_bmc->data_out[kcs_bmc->data_out_idx++]);
>> >-		break;
>> >-
>> >-	case KCS_PHASE_ABORT_ERROR1:
>> >-		set_state(kcs_bmc, READ_STATE);
>> >-		kcs_bmc_read_data(kcs_bmc);
>> >-		kcs_bmc_write_data(kcs_bmc, kcs_bmc->error);
>> >-		kcs_bmc->phase =3D KCS_PHASE_ABORT_ERROR2;
>> >-		break;
>> >-
>> >-	case KCS_PHASE_ABORT_ERROR2:
>> >-		set_state(kcs_bmc, IDLE_STATE);
>> >-		kcs_bmc_read_data(kcs_bmc);
>> >-		kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
>> >-		kcs_bmc->phase =3D KCS_PHASE_IDLE;
>> >-		break;
>> >-
>> >-	default:
>> >-		kcs_force_abort(kcs_bmc);
>> >-		break;
>> >-	}
>> >-}
>> >-
>> >-static void kcs_bmc_handle_cmd(struct kcs_bmc *kcs_bmc)
>> >-{
>> >-	u8 cmd;
>> >-
>> >-	set_state(kcs_bmc, WRITE_STATE);
>> >-	kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
>> >-
>> >-	cmd =3D kcs_bmc_read_data(kcs_bmc);
>> >-	switch (cmd) {
>> >-	case KCS_CMD_WRITE_START:
>> >-		kcs_bmc->phase =3D KCS_PHASE_WRITE_START;
>> >-		kcs_bmc->error =3D KCS_NO_ERROR;
>> >-		kcs_bmc->data_in_avail =3D false;
>> >-		kcs_bmc->data_in_idx =3D 0;
>> >-		break;
>> >-
>> >-	case KCS_CMD_WRITE_END:
>> >-		if (kcs_bmc->phase !=3D KCS_PHASE_WRITE_DATA) {
>> >-			kcs_force_abort(kcs_bmc);
>> >-			break;
>> >-		}
>> >-
>> >-		kcs_bmc->phase =3D KCS_PHASE_WRITE_END_CMD;
>> >-		break;
>> >-
>> >-	case KCS_CMD_GET_STATUS_ABORT:
>> >-		if (kcs_bmc->error =3D=3D KCS_NO_ERROR)
>> >-			kcs_bmc->error =3D KCS_ABORTED_BY_COMMAND;
>> >-
>> >-		kcs_bmc->phase =3D KCS_PHASE_ABORT_ERROR1;
>> >-		kcs_bmc->data_in_avail =3D false;
>> >-		kcs_bmc->data_in_idx =3D 0;
>> >-		break;
>> >-
>> >-	default:
>> >-		kcs_force_abort(kcs_bmc);
>> >-		kcs_bmc->error =3D KCS_ILLEGAL_CONTROL_CODE;
>> >-		break;
>> >-	}
>> >-}
>> >-
>> >+int kcs_bmc_ipmi_event(struct kcs_bmc *kcs_bmc);
>>
>> This declaration looks a bit out of place here; should it be in
>> kcs_bmc.h instead?
>
>These are only temporary and get removed later on in the series after
>some shuffling of the code.
>

Okay -- there were a couple others further down in the patch that I'm
pretty sure were strictly redundant and could perhaps be cleaned up
(kcs_bmc_ipmi_event and kcs_bmc_ipmi_alloc in kcs_bmc_cdev_ipmi.c), but
aside from that:

Reviewed-by: Zev Weiss <zweiss@equinix.com>
