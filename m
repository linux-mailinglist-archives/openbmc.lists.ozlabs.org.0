Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B196635936E
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 05:56:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGkpT3mpPz3bTB
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 13:56:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=equinixinc.onmicrosoft.com header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-equinixinc-onmicrosoft-com header.b=ebRhjkEo;
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
 header.s=selector2-equinixinc-onmicrosoft-com header.b=ebRhjkEo; 
 dkim-atps=neutral
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com
 [148.163.148.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGkp65cL6z3015;
 Fri,  9 Apr 2021 13:56:29 +1000 (AEST)
Received: from pps.filterd (m0105196.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1393n4in003942; Fri, 9 Apr 2021 03:56:05 GMT
Received: from nam04-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam04lp2054.outbound.protection.outlook.com [104.47.44.54])
 by mx0a-00268f01.pphosted.com with ESMTP id 37t48m26u1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 03:56:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bodHrKey1PKOrSke6bpgSQ/6YnnruVBdMFEDxjQoek2H1SA+bFU5uHHAgXPCACqPKFp8mjAu6S76x6uX7CRFvnfQ/lb98J79dIg3gldlSI63hKO8KU82c0K+UOjQYwtke2ZdxshPk8F5lFROpgMzxZ9xnpYHVjX0GvqYJ6IdfiNW4wPzCjBjeRjVnebNzujKSd/4sFFNxIQJK00kyLpcA9Q25x+Sc3QFwtRTrfTinaEllebP3eC3EIR3bswuN1029lVk1+t0U4yB+87StxAtCYelPp8cjeyBZTMXYIt/sTNKB+X1p980Tbk0ru/UsoFcK0Obl2hpts8ifFke1qlKcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LdqnQLHGFQMyGQ3rr3giJ3xBiR66orltmmSNi1APXLc=;
 b=dpyAZtEdl97i70GRlVMphS4zfkMRu+M1pJZrqWU7Sr/y2nWxkwVyeXaf7uzjU6RkFVLPaRxTa0W9HcxUXsVur0omz4TCTrN5O94xGKdvl+c7EiSoHagkN2TZUwV8blkkFvARaz50S/MU8yd9LnOle3xC4Z0+wzHqeVu6JMjbobJQMZwmWfxnlIYY4T2VaL1Ud9BLRFiOHOKZvVyS59w0fqPGNUo6kKSt5bwFNEGFh6LTBnv+Bm1xRbWGBQzsAyoxliKMpx27NwRVP5r3ptXCma7KMcMnYzeGx58lRvG2WUma2ZUx0a2lXbaB/K36weOewgAGlD+GgehySg7Nqcqk2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=equinixinc.onmicrosoft.com; s=selector2-equinixinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LdqnQLHGFQMyGQ3rr3giJ3xBiR66orltmmSNi1APXLc=;
 b=ebRhjkEovGARjXrZlA44lZQszRNaW3gsI3TUUswsuY0lOElKXnQ+jdjDNtHnCyoGSOKmMSu9CsW0fX9kFjKBTif6uSui2OVPyJ/xsuigGP3s2x+6SuZtls1mlJbj5Jv2mO7LYFaY+4Q0P0GPVbwWngUTx/H5vkN/aJw2Jg+I9Sk=
Received: from DM5PR04MB0762.namprd04.prod.outlook.com (2603:10b6:3:f3::13) by
 DM6PR04MB6281.namprd04.prod.outlook.com (2603:10b6:5:1e8::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.28; Fri, 9 Apr 2021 03:56:02 +0000
Received: from DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::4c98:aeb:87a8:13ad]) by DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::4c98:aeb:87a8:13ad%5]) with mapi id 15.20.4020.017; Fri, 9 Apr 2021
 03:56:01 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v2 09/21] ipmi: kcs_bmc: Split out kcs_bmc_cdev_ipmi
Thread-Topic: [PATCH v2 09/21] ipmi: kcs_bmc: Split out kcs_bmc_cdev_ipmi
Thread-Index: AQHXLPRB0XKWw1jtxk6ym3nb33svGw==
Date: Fri, 9 Apr 2021 03:56:01 +0000
Message-ID: <YG/QUCIdEzW1ghVA@packtop>
References: <20210319062752.145730-1-andrew@aj.id.au>
 <20210319062752.145730-9-andrew@aj.id.au>
In-Reply-To: <20210319062752.145730-9-andrew@aj.id.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=equinix.com;
x-originating-ip: [24.181.166.149]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e00c22f-8b1b-4bbc-77f4-08d8fb0b6457
x-ms-traffictypediagnostic: DM6PR04MB6281:
x-microsoft-antispam-prvs: <DM6PR04MB62817E948151F48922E6B34DC3739@DM6PR04MB6281.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:121;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dhXBKUlHyGfWvxCh8d57fiV6nA9Vlyk3RRG0pWU9AERQAwQKMkd01ph7Q3eTzf8CYxW3d/gG2PwaTsQeyHdcOGojhWHmlUlcZXbTN/B9TV7Fky5bzLIwJqZBRbCD+B0rgQKkVtUzlXO6R38SQAk7NGVfXqa1V9P7y7mdEO/7ADIibsvHdEhPZ/zm4g0+MAmNeLvOubx8VJTABgbSbqI9HS13r+qJlbTn+BXgb2vOdb0nmLpEp36BDSIQiiRPZaFrNQ2W8WcLyrxdWrhwQ3W4UKMZdJgMtH+HWUpL8niI416x/s9rA2+IKgdv6EWk1wIWnqO89LDF8FsIfOAdDcPCBM/Bz8qKI02dYGQxuZ3zsBvVo7EW+dxxOo4ULDhbw14wmEB49s4XSz8n4KaTZ5mx5Ui+hmxJsSDg1/0ukw7IUMBz23rIaEZkDIrFbr2ObRFJvXyFTIM/nFucGrHjCA9J6j4tDyB3wST0gn84i7AAqB5B1tgqDTcJjaWsPdp0FwagMRqdiDb06RnOMO4SCTKmJvrm9hUVyed/lw2WmmMeVD5vTZLCgqhvZ7duguszL3vChGh4iDRIakVV6nkRIPuecsq3EjSqQoaHv/3K0R0QslGNCBnBarwpYed4hK8envJ6U4v6DXDmcUhkwychWPY219HtImAK+njWn6jVjDqPlIc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR04MB0762.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(4326008)(8676002)(66476007)(66946007)(64756008)(26005)(6916009)(86362001)(7416002)(186003)(33716001)(2906002)(6512007)(8936002)(9686003)(38100700001)(76116006)(83380400001)(71200400001)(66446008)(66556008)(5660300002)(6506007)(6486002)(478600001)(316002)(54906003)(30864003)(559001)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?4bwGbLwpAuY/Jawk40rcTkDOgIwTy9/eYBQMUJY5z1URFFxNRvT0OI8I4J1u?=
 =?us-ascii?Q?npKXWHveBBAfNDoRW6zz0GGMQaQVlENpO43iW0+mDCtUpxWJQHctJnpMgfnU?=
 =?us-ascii?Q?UyaJtG0HoTn8yD2XO2zLiDbPsKQaeIxwKmH4yz3D1eTGCBrTiUotxee8MyWT?=
 =?us-ascii?Q?ccjbJbE9/7a0vh5BZ1TKF7Umi4bdVIyFqnnoNCiHtsKNlJGkqQ6M6EtFadUt?=
 =?us-ascii?Q?PwdLL/Dv1v0iMHVWZGOYpWVv+CCXjDaWiS2UA98/ZwewkVFDlwhbN1XbkncK?=
 =?us-ascii?Q?woToF4OEeyDuWO84bcvfER6EkGi0rsnLwUk7IQunZ+Fy4OrrN2OBRf/9V9Ne?=
 =?us-ascii?Q?xzb9vxU+Hc10svHFaS5c8ABYZ68SHQ7LqEW5tmgM9BgaDaUEWY68mnUEugaa?=
 =?us-ascii?Q?C8Thcw9uC17OPrFep+ZdI9fW8QJ1ZFER4KFmWoquwgW0WlsP3WytRd5i78Sb?=
 =?us-ascii?Q?cboOzhBOTS+6w2gp1HZ7vb4FrfkBRVVmWOr19a9VLRG/hLZfHDNcon9XZ4OW?=
 =?us-ascii?Q?8VDbMbb2GlxM7juOav+rNhZEurjV/NamV6ynNtLYmrbOmO6Vn5rs3hdq93mC?=
 =?us-ascii?Q?64u/uy4ORGRe+6d3ipvy8sKByvXfKjQpGQFkoUcivMMx2OPOVEvguKo1EbET?=
 =?us-ascii?Q?AYdk0gHXoHgddMQbR/OzvuuhB0OCEuclUUtlfTw7HEOZpGYz0+fgRPrijdrO?=
 =?us-ascii?Q?8p8cM5BkAEep5CNRH6QNCVyToSjGoTojnovxGa1NSn3w6K6TPpNeyvUIYiZo?=
 =?us-ascii?Q?vzPEXd4iC4a79jAEtHc2ZXjf16pianYSGVhmN/9Os2VcLVzdxWKQVuKsYDRP?=
 =?us-ascii?Q?AuGmZzrLyvlldSVpBC9hAE6nG3eAILgM64uUbz12ifIe/rgJhumy6MlnKg5t?=
 =?us-ascii?Q?a7bC/rTsCX+rXHWDKVBU/G08DOOMTd659TpqzMtM6OrbyqSd8yEH+JpE7a/z?=
 =?us-ascii?Q?Ho6YEQOaS8t3fgB/BqH7kBXl1u7hjr2n4D5wduUKgUICcviYk07DtTtlyXwh?=
 =?us-ascii?Q?6zKIcRw7ZydJq39+sJoWXKFVMNSIv+XQHoO6JhlF6bGwAnAq5/OIZ0ckedWR?=
 =?us-ascii?Q?my2BHjWEeGqD2mBarIP1c6zImdMFmuYNEsKcqWN+g/lmwlgJbjD4eLqE2E6/?=
 =?us-ascii?Q?DklskuQYRRHJnso08PQDElnAz5jUgvQ6XmeBfbNwOuMDutDjavEGZDoPcDCn?=
 =?us-ascii?Q?sil/ETwb4cIQFFiXkgwNcxVX50/8thhIEw5oYAtVHBzrBiH6Z4HS0l7WGvNe?=
 =?us-ascii?Q?3jI2RkuMr+8GlLczTfSHTdaX2ji1mvGQTeE6JFHc/WMZ3PDdo6JrvQv3wnEW?=
 =?us-ascii?Q?ExCiRidgak7tk3UAp6AoQ5H1RX3oTD2OoELdVt0Vu+7bxg=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EE6753343E0E8B41A5CD502C97EF8C4C@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR04MB0762.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e00c22f-8b1b-4bbc-77f4-08d8fb0b6457
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2021 03:56:01.7682 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IWAEezmlTQidopuo3XxIL1sSZeeqY6eCEL9EmECAj+/cMdNIqeCgryOqSv31hjgLp9VPw+WYDR0vDp2n8AYlpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6281
X-Proofpoint-ORIG-GUID: vLUZRBDHBfdffWSbEI8B6Yt2s-yBVOK3
X-Proofpoint-GUID: vLUZRBDHBfdffWSbEI8B6Yt2s-yBVOK3
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-09_03:2021-04-08,
 2021-04-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 mlxlogscore=999 bulkscore=0 mlxscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104090025
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "chiawei_wang@aspeedtech.com" <chiawei_wang@aspeedtech.com>,
 "ryan_chen@aspeedtech.com" <ryan_chen@aspeedtech.com>,
 "tmaimon77@gmail.com" <tmaimon77@gmail.com>,
 "minyard@acm.org" <minyard@acm.org>,
 "avifishman70@gmail.com" <avifishman70@gmail.com>,
 "venture@google.com" <venture@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tali.perry1@gmail.com" <tali.perry1@gmail.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "benjaminfair@google.com" <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Mar 19, 2021 at 01:27:40AM CDT, Andrew Jeffery wrote:
>Take steps towards defining a coherent API to separate the KCS device
>drivers from the userspace interface. Decreasing the coupling will
>improve the separation of concerns and enable the introduction of
>alternative userspace interfaces.
>
>For now, simply split the chardev logic out to a separate file. The code
>continues to build into the same module.
>
>Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>---
> drivers/char/ipmi/Makefile            |   2 +-
> drivers/char/ipmi/kcs_bmc.c           | 423 +------------------------
> drivers/char/ipmi/kcs_bmc.h           |  10 +-
> drivers/char/ipmi/kcs_bmc_cdev_ipmi.c | 428 ++++++++++++++++++++++++++
> 4 files changed, 451 insertions(+), 412 deletions(-)
> create mode 100644 drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
>
>diff --git a/drivers/char/ipmi/Makefile b/drivers/char/ipmi/Makefile
>index 0822adc2ec41..a302bc865370 100644
>--- a/drivers/char/ipmi/Makefile
>+++ b/drivers/char/ipmi/Makefile
>@@ -22,7 +22,7 @@ obj-$(CONFIG_IPMI_SSIF) +=3D ipmi_ssif.o
> obj-$(CONFIG_IPMI_POWERNV) +=3D ipmi_powernv.o
> obj-$(CONFIG_IPMI_WATCHDOG) +=3D ipmi_watchdog.o
> obj-$(CONFIG_IPMI_POWEROFF) +=3D ipmi_poweroff.o
>-obj-$(CONFIG_IPMI_KCS_BMC) +=3D kcs_bmc.o
>+obj-$(CONFIG_IPMI_KCS_BMC) +=3D kcs_bmc.o kcs_bmc_cdev_ipmi.o
> obj-$(CONFIG_ASPEED_BT_IPMI_BMC) +=3D bt-bmc.o
> obj-$(CONFIG_ASPEED_KCS_IPMI_BMC) +=3D kcs_bmc_aspeed.o
> obj-$(CONFIG_NPCM7XX_KCS_IPMI_BMC) +=3D kcs_bmc_npcm7xx.o
>diff --git a/drivers/char/ipmi/kcs_bmc.c b/drivers/char/ipmi/kcs_bmc.c
>index c4336c1f2d6d..ef5c48ffe74a 100644
>--- a/drivers/char/ipmi/kcs_bmc.c
>+++ b/drivers/char/ipmi/kcs_bmc.c
>@@ -3,446 +3,51 @@
>  * Copyright (c) 2015-2018, Intel Corporation.
>  */
>
>-#define pr_fmt(fmt) "kcs-bmc: " fmt
>-
>-#include <linux/errno.h>
>-#include <linux/io.h>
>-#include <linux/ipmi_bmc.h>
> #include <linux/module.h>
>-#include <linux/platform_device.h>
>-#include <linux/poll.h>
>-#include <linux/sched.h>
>-#include <linux/slab.h>
>
> #include "kcs_bmc.h"
>
>-#define DEVICE_NAME "ipmi-kcs"
>-
>-#define KCS_MSG_BUFSIZ    1000
>-
>-#define KCS_ZERO_DATA     0
>-
>-
>-/* IPMI 2.0 - Table 9-1, KCS Interface Status Register Bits */
>-#define KCS_STATUS_STATE(state) (state << 6)
>-#define KCS_STATUS_STATE_MASK   GENMASK(7, 6)
>-#define KCS_STATUS_CMD_DAT      BIT(3)
>-#define KCS_STATUS_SMS_ATN      BIT(2)
>-#define KCS_STATUS_IBF          BIT(1)
>-#define KCS_STATUS_OBF          BIT(0)
>-
>-/* IPMI 2.0 - Table 9-2, KCS Interface State Bits */
>-enum kcs_states {
>-	IDLE_STATE  =3D 0,
>-	READ_STATE  =3D 1,
>-	WRITE_STATE =3D 2,
>-	ERROR_STATE =3D 3,
>-};
>-
>-/* IPMI 2.0 - Table 9-3, KCS Interface Control Codes */
>-#define KCS_CMD_GET_STATUS_ABORT  0x60
>-#define KCS_CMD_WRITE_START       0x61
>-#define KCS_CMD_WRITE_END         0x62
>-#define KCS_CMD_READ_BYTE         0x68
>-
>-static inline u8 kcs_bmc_read_data(struct kcs_bmc *kcs_bmc)
>+u8 kcs_bmc_read_data(struct kcs_bmc *kcs_bmc)
> {
> 	return kcs_bmc->io_inputb(kcs_bmc, kcs_bmc->ioreg.idr);
> }
>+EXPORT_SYMBOL(kcs_bmc_read_data);
>
>-static inline void kcs_bmc_write_data(struct kcs_bmc *kcs_bmc, u8 data)
>+void kcs_bmc_write_data(struct kcs_bmc *kcs_bmc, u8 data)
> {
> 	kcs_bmc->io_outputb(kcs_bmc, kcs_bmc->ioreg.odr, data);
> }
>+EXPORT_SYMBOL(kcs_bmc_write_data);
>
>-static inline u8 kcs_bmc_read_status(struct kcs_bmc *kcs_bmc)
>+u8 kcs_bmc_read_status(struct kcs_bmc *kcs_bmc)
> {
> 	return kcs_bmc->io_inputb(kcs_bmc, kcs_bmc->ioreg.str);
> }
>+EXPORT_SYMBOL(kcs_bmc_read_status);
>
>-static inline void kcs_bmc_write_status(struct kcs_bmc *kcs_bmc, u8 data)
>+void kcs_bmc_write_status(struct kcs_bmc *kcs_bmc, u8 data)
> {
> 	kcs_bmc->io_outputb(kcs_bmc, kcs_bmc->ioreg.str, data);
> }
>+EXPORT_SYMBOL(kcs_bmc_write_status);
>
>-static void kcs_bmc_update_status(struct kcs_bmc *kcs_bmc, u8 mask, u8 va=
l)
>+void kcs_bmc_update_status(struct kcs_bmc *kcs_bmc, u8 mask, u8 val)
> {
> 	kcs_bmc->io_updateb(kcs_bmc, kcs_bmc->ioreg.str, mask, val);
> }
>+EXPORT_SYMBOL(kcs_bmc_update_status);
>
>-static inline void set_state(struct kcs_bmc *kcs_bmc, u8 state)
>-{
>-	kcs_bmc_update_status(kcs_bmc, KCS_STATUS_STATE_MASK,
>-					KCS_STATUS_STATE(state));
>-}
>-
>-static void kcs_force_abort(struct kcs_bmc *kcs_bmc)
>-{
>-	set_state(kcs_bmc, ERROR_STATE);
>-	kcs_bmc_read_data(kcs_bmc);
>-	kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
>-
>-	kcs_bmc->phase =3D KCS_PHASE_ERROR;
>-	kcs_bmc->data_in_avail =3D false;
>-	kcs_bmc->data_in_idx =3D 0;
>-}
>-
>-static void kcs_bmc_handle_data(struct kcs_bmc *kcs_bmc)
>-{
>-	u8 data;
>-
>-	switch (kcs_bmc->phase) {
>-	case KCS_PHASE_WRITE_START:
>-		kcs_bmc->phase =3D KCS_PHASE_WRITE_DATA;
>-		fallthrough;
>-
>-	case KCS_PHASE_WRITE_DATA:
>-		if (kcs_bmc->data_in_idx < KCS_MSG_BUFSIZ) {
>-			set_state(kcs_bmc, WRITE_STATE);
>-			kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
>-			kcs_bmc->data_in[kcs_bmc->data_in_idx++] =3D
>-						kcs_bmc_read_data(kcs_bmc);
>-		} else {
>-			kcs_force_abort(kcs_bmc);
>-			kcs_bmc->error =3D KCS_LENGTH_ERROR;
>-		}
>-		break;
>-
>-	case KCS_PHASE_WRITE_END_CMD:
>-		if (kcs_bmc->data_in_idx < KCS_MSG_BUFSIZ) {
>-			set_state(kcs_bmc, READ_STATE);
>-			kcs_bmc->data_in[kcs_bmc->data_in_idx++] =3D
>-						kcs_bmc_read_data(kcs_bmc);
>-			kcs_bmc->phase =3D KCS_PHASE_WRITE_DONE;
>-			kcs_bmc->data_in_avail =3D true;
>-			wake_up_interruptible(&kcs_bmc->queue);
>-		} else {
>-			kcs_force_abort(kcs_bmc);
>-			kcs_bmc->error =3D KCS_LENGTH_ERROR;
>-		}
>-		break;
>-
>-	case KCS_PHASE_READ:
>-		if (kcs_bmc->data_out_idx =3D=3D kcs_bmc->data_out_len)
>-			set_state(kcs_bmc, IDLE_STATE);
>-
>-		data =3D kcs_bmc_read_data(kcs_bmc);
>-		if (data !=3D KCS_CMD_READ_BYTE) {
>-			set_state(kcs_bmc, ERROR_STATE);
>-			kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
>-			break;
>-		}
>-
>-		if (kcs_bmc->data_out_idx =3D=3D kcs_bmc->data_out_len) {
>-			kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
>-			kcs_bmc->phase =3D KCS_PHASE_IDLE;
>-			break;
>-		}
>-
>-		kcs_bmc_write_data(kcs_bmc,
>-			kcs_bmc->data_out[kcs_bmc->data_out_idx++]);
>-		break;
>-
>-	case KCS_PHASE_ABORT_ERROR1:
>-		set_state(kcs_bmc, READ_STATE);
>-		kcs_bmc_read_data(kcs_bmc);
>-		kcs_bmc_write_data(kcs_bmc, kcs_bmc->error);
>-		kcs_bmc->phase =3D KCS_PHASE_ABORT_ERROR2;
>-		break;
>-
>-	case KCS_PHASE_ABORT_ERROR2:
>-		set_state(kcs_bmc, IDLE_STATE);
>-		kcs_bmc_read_data(kcs_bmc);
>-		kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
>-		kcs_bmc->phase =3D KCS_PHASE_IDLE;
>-		break;
>-
>-	default:
>-		kcs_force_abort(kcs_bmc);
>-		break;
>-	}
>-}
>-
>-static void kcs_bmc_handle_cmd(struct kcs_bmc *kcs_bmc)
>-{
>-	u8 cmd;
>-
>-	set_state(kcs_bmc, WRITE_STATE);
>-	kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
>-
>-	cmd =3D kcs_bmc_read_data(kcs_bmc);
>-	switch (cmd) {
>-	case KCS_CMD_WRITE_START:
>-		kcs_bmc->phase =3D KCS_PHASE_WRITE_START;
>-		kcs_bmc->error =3D KCS_NO_ERROR;
>-		kcs_bmc->data_in_avail =3D false;
>-		kcs_bmc->data_in_idx =3D 0;
>-		break;
>-
>-	case KCS_CMD_WRITE_END:
>-		if (kcs_bmc->phase !=3D KCS_PHASE_WRITE_DATA) {
>-			kcs_force_abort(kcs_bmc);
>-			break;
>-		}
>-
>-		kcs_bmc->phase =3D KCS_PHASE_WRITE_END_CMD;
>-		break;
>-
>-	case KCS_CMD_GET_STATUS_ABORT:
>-		if (kcs_bmc->error =3D=3D KCS_NO_ERROR)
>-			kcs_bmc->error =3D KCS_ABORTED_BY_COMMAND;
>-
>-		kcs_bmc->phase =3D KCS_PHASE_ABORT_ERROR1;
>-		kcs_bmc->data_in_avail =3D false;
>-		kcs_bmc->data_in_idx =3D 0;
>-		break;
>-
>-	default:
>-		kcs_force_abort(kcs_bmc);
>-		kcs_bmc->error =3D KCS_ILLEGAL_CONTROL_CODE;
>-		break;
>-	}
>-}
>-
>+int kcs_bmc_ipmi_event(struct kcs_bmc *kcs_bmc);

This declaration looks a bit out of place here; should it be in
kcs_bmc.h instead?

> int kcs_bmc_handle_event(struct kcs_bmc *kcs_bmc)
> {
>-	unsigned long flags;
>-	int ret =3D -ENODATA;
>-	u8 status;
>-
>-	spin_lock_irqsave(&kcs_bmc->lock, flags);
>-
>-	status =3D kcs_bmc_read_status(kcs_bmc);
>-	if (status & KCS_STATUS_IBF) {
>-		if (!kcs_bmc->running)
>-			kcs_force_abort(kcs_bmc);
>-		else if (status & KCS_STATUS_CMD_DAT)
>-			kcs_bmc_handle_cmd(kcs_bmc);
>-		else
>-			kcs_bmc_handle_data(kcs_bmc);
>-
>-		ret =3D 0;
>-	}
>-
>-	spin_unlock_irqrestore(&kcs_bmc->lock, flags);
>-
>-	return ret;
>+	return kcs_bmc_ipmi_event(kcs_bmc);
> }
> EXPORT_SYMBOL(kcs_bmc_handle_event);
>
>-static inline struct kcs_bmc *to_kcs_bmc(struct file *filp)
>-{
>-	return container_of(filp->private_data, struct kcs_bmc, miscdev);
>-}
>-
>-static int kcs_bmc_open(struct inode *inode, struct file *filp)
>-{
>-	struct kcs_bmc *kcs_bmc =3D to_kcs_bmc(filp);
>-	int ret =3D 0;
>-
>-	spin_lock_irq(&kcs_bmc->lock);
>-	if (!kcs_bmc->running)
>-		kcs_bmc->running =3D 1;
>-	else
>-		ret =3D -EBUSY;
>-	spin_unlock_irq(&kcs_bmc->lock);
>-
>-	return ret;
>-}
>-
>-static __poll_t kcs_bmc_poll(struct file *filp, poll_table *wait)
>-{
>-	struct kcs_bmc *kcs_bmc =3D to_kcs_bmc(filp);
>-	__poll_t mask =3D 0;
>-
>-	poll_wait(filp, &kcs_bmc->queue, wait);
>-
>-	spin_lock_irq(&kcs_bmc->lock);
>-	if (kcs_bmc->data_in_avail)
>-		mask |=3D EPOLLIN;
>-	spin_unlock_irq(&kcs_bmc->lock);
>-
>-	return mask;
>-}
>-
>-static ssize_t kcs_bmc_read(struct file *filp, char __user *buf,
>-			    size_t count, loff_t *ppos)
>-{
>-	struct kcs_bmc *kcs_bmc =3D to_kcs_bmc(filp);
>-	bool data_avail;
>-	size_t data_len;
>-	ssize_t ret;
>-
>-	if (!(filp->f_flags & O_NONBLOCK))
>-		wait_event_interruptible(kcs_bmc->queue,
>-					 kcs_bmc->data_in_avail);
>-
>-	mutex_lock(&kcs_bmc->mutex);
>-
>-	spin_lock_irq(&kcs_bmc->lock);
>-	data_avail =3D kcs_bmc->data_in_avail;
>-	if (data_avail) {
>-		data_len =3D kcs_bmc->data_in_idx;
>-		memcpy(kcs_bmc->kbuffer, kcs_bmc->data_in, data_len);
>-	}
>-	spin_unlock_irq(&kcs_bmc->lock);
>-
>-	if (!data_avail) {
>-		ret =3D -EAGAIN;
>-		goto out_unlock;
>-	}
>-
>-	if (count < data_len) {
>-		pr_err("channel=3D%u with too large data : %zu\n",
>-			kcs_bmc->channel, data_len);
>-
>-		spin_lock_irq(&kcs_bmc->lock);
>-		kcs_force_abort(kcs_bmc);
>-		spin_unlock_irq(&kcs_bmc->lock);
>-
>-		ret =3D -EOVERFLOW;
>-		goto out_unlock;
>-	}
>-
>-	if (copy_to_user(buf, kcs_bmc->kbuffer, data_len)) {
>-		ret =3D -EFAULT;
>-		goto out_unlock;
>-	}
>-
>-	ret =3D data_len;
>-
>-	spin_lock_irq(&kcs_bmc->lock);
>-	if (kcs_bmc->phase =3D=3D KCS_PHASE_WRITE_DONE) {
>-		kcs_bmc->phase =3D KCS_PHASE_WAIT_READ;
>-		kcs_bmc->data_in_avail =3D false;
>-		kcs_bmc->data_in_idx =3D 0;
>-	} else {
>-		ret =3D -EAGAIN;
>-	}
>-	spin_unlock_irq(&kcs_bmc->lock);
>-
>-out_unlock:
>-	mutex_unlock(&kcs_bmc->mutex);
>-
>-	return ret;
>-}
>-
>-static ssize_t kcs_bmc_write(struct file *filp, const char __user *buf,
>-			     size_t count, loff_t *ppos)
>-{
>-	struct kcs_bmc *kcs_bmc =3D to_kcs_bmc(filp);
>-	ssize_t ret;
>-
>-	/* a minimum response size '3' : netfn + cmd + ccode */
>-	if (count < 3 || count > KCS_MSG_BUFSIZ)
>-		return -EINVAL;
>-
>-	mutex_lock(&kcs_bmc->mutex);
>-
>-	if (copy_from_user(kcs_bmc->kbuffer, buf, count)) {
>-		ret =3D -EFAULT;
>-		goto out_unlock;
>-	}
>-
>-	spin_lock_irq(&kcs_bmc->lock);
>-	if (kcs_bmc->phase =3D=3D KCS_PHASE_WAIT_READ) {
>-		kcs_bmc->phase =3D KCS_PHASE_READ;
>-		kcs_bmc->data_out_idx =3D 1;
>-		kcs_bmc->data_out_len =3D count;
>-		memcpy(kcs_bmc->data_out, kcs_bmc->kbuffer, count);
>-		kcs_bmc_write_data(kcs_bmc, kcs_bmc->data_out[0]);
>-		ret =3D count;
>-	} else {
>-		ret =3D -EINVAL;
>-	}
>-	spin_unlock_irq(&kcs_bmc->lock);
>-
>-out_unlock:
>-	mutex_unlock(&kcs_bmc->mutex);
>-
>-	return ret;
>-}
>-
>-static long kcs_bmc_ioctl(struct file *filp, unsigned int cmd,
>-			  unsigned long arg)
>-{
>-	struct kcs_bmc *kcs_bmc =3D to_kcs_bmc(filp);
>-	long ret =3D 0;
>-
>-	spin_lock_irq(&kcs_bmc->lock);
>-
>-	switch (cmd) {
>-	case IPMI_BMC_IOCTL_SET_SMS_ATN:
>-		kcs_bmc_update_status(kcs_bmc, KCS_STATUS_SMS_ATN, KCS_STATUS_SMS_ATN);
>-		break;
>-
>-	case IPMI_BMC_IOCTL_CLEAR_SMS_ATN:
>-		kcs_bmc_update_status(kcs_bmc, KCS_STATUS_SMS_ATN, 0);
>-		break;
>-
>-	case IPMI_BMC_IOCTL_FORCE_ABORT:
>-		kcs_force_abort(kcs_bmc);
>-		break;
>-
>-	default:
>-		ret =3D -EINVAL;
>-		break;
>-	}
>-
>-	spin_unlock_irq(&kcs_bmc->lock);
>-
>-	return ret;
>-}
>-
>-static int kcs_bmc_release(struct inode *inode, struct file *filp)
>-{
>-	struct kcs_bmc *kcs_bmc =3D to_kcs_bmc(filp);
>-
>-	spin_lock_irq(&kcs_bmc->lock);
>-	kcs_bmc->running =3D 0;
>-	kcs_force_abort(kcs_bmc);
>-	spin_unlock_irq(&kcs_bmc->lock);
>-
>-	return 0;
>-}
>-
>-static const struct file_operations kcs_bmc_fops =3D {
>-	.owner          =3D THIS_MODULE,
>-	.open           =3D kcs_bmc_open,
>-	.read           =3D kcs_bmc_read,
>-	.write          =3D kcs_bmc_write,
>-	.release        =3D kcs_bmc_release,
>-	.poll           =3D kcs_bmc_poll,
>-	.unlocked_ioctl =3D kcs_bmc_ioctl,
>-};
>-
>+struct kcs_bmc *kcs_bmc_ipmi_alloc(struct device *dev, int sizeof_priv, u=
32 channel);

Similarly here.

> struct kcs_bmc *kcs_bmc_alloc(struct device *dev, int sizeof_priv, u32 ch=
annel)
> {
>-	struct kcs_bmc *kcs_bmc;
>-
>-	kcs_bmc =3D devm_kzalloc(dev, sizeof(*kcs_bmc) + sizeof_priv, GFP_KERNEL=
);
>-	if (!kcs_bmc)
>-		return NULL;
>-
>-	spin_lock_init(&kcs_bmc->lock);
>-	kcs_bmc->channel =3D channel;
>-
>-	mutex_init(&kcs_bmc->mutex);
>-	init_waitqueue_head(&kcs_bmc->queue);
>-
>-	kcs_bmc->data_in =3D devm_kmalloc(dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
>-	kcs_bmc->data_out =3D devm_kmalloc(dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
>-	kcs_bmc->kbuffer =3D devm_kmalloc(dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
>-
>-	kcs_bmc->miscdev.minor =3D MISC_DYNAMIC_MINOR;
>-	kcs_bmc->miscdev.name =3D devm_kasprintf(dev, GFP_KERNEL, "%s%u",
>-					       DEVICE_NAME, channel);
>-	if (!kcs_bmc->data_in || !kcs_bmc->data_out || !kcs_bmc->kbuffer ||
>-	    !kcs_bmc->miscdev.name)
>-		return NULL;
>-	kcs_bmc->miscdev.fops =3D &kcs_bmc_fops;
>-
>-	return kcs_bmc;
>+	return kcs_bmc_ipmi_alloc(dev, sizeof_priv, channel);
> }
> EXPORT_SYMBOL(kcs_bmc_alloc);
>
>diff --git a/drivers/char/ipmi/kcs_bmc.h b/drivers/char/ipmi/kcs_bmc.h
>index 970f53892f2d..febea0c8deb4 100644
>--- a/drivers/char/ipmi/kcs_bmc.h
>+++ b/drivers/char/ipmi/kcs_bmc.h
>@@ -104,6 +104,12 @@ static inline void *kcs_bmc_priv(struct kcs_bmc *kcs_=
bmc)
> }
>
> int kcs_bmc_handle_event(struct kcs_bmc *kcs_bmc);
>-struct kcs_bmc *kcs_bmc_alloc(struct device *dev, int sizeof_priv,
>-					u32 channel);
>+struct kcs_bmc *kcs_bmc_alloc(struct device *dev, int sizeof_priv, u32 ch=
annel);
>+
>+u8 kcs_bmc_read_data(struct kcs_bmc *kcs_bmc);
>+void kcs_bmc_write_data(struct kcs_bmc *kcs_bmc, u8 data);
>+u8 kcs_bmc_read_status(struct kcs_bmc *kcs_bmc);
>+void kcs_bmc_write_status(struct kcs_bmc *kcs_bmc, u8 data);
>+void kcs_bmc_update_status(struct kcs_bmc *kcs_bmc, u8 mask, u8 val);
>+
> #endif /* __KCS_BMC_H__ */
>diff --git a/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c b/drivers/char/ipmi/kcs=
_bmc_cdev_ipmi.c
>new file mode 100644
>index 000000000000..82c77994e481
>--- /dev/null
>+++ b/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
>@@ -0,0 +1,428 @@
>+// SPDX-License-Identifier: GPL-2.0
>+/*
>+ * Copyright (c) 2015-2018, Intel Corporation.
>+ */
>+
>+#define pr_fmt(fmt) "kcs-bmc: " fmt
>+
>+#include <linux/errno.h>
>+#include <linux/io.h>
>+#include <linux/ipmi_bmc.h>
>+#include <linux/module.h>
>+#include <linux/platform_device.h>
>+#include <linux/poll.h>
>+#include <linux/sched.h>
>+#include <linux/slab.h>
>+
>+#include "kcs_bmc.h"
>+
>+#define DEVICE_NAME "ipmi-kcs"
>+
>+#define KCS_MSG_BUFSIZ    1000
>+
>+#define KCS_ZERO_DATA     0
>+
>+
>+/* IPMI 2.0 - Table 9-1, KCS Interface Status Register Bits */
>+#define KCS_STATUS_STATE(state) (state << 6)
>+#define KCS_STATUS_STATE_MASK   GENMASK(7, 6)
>+#define KCS_STATUS_CMD_DAT      BIT(3)
>+#define KCS_STATUS_SMS_ATN      BIT(2)
>+#define KCS_STATUS_IBF          BIT(1)
>+#define KCS_STATUS_OBF          BIT(0)
>+
>+/* IPMI 2.0 - Table 9-2, KCS Interface State Bits */
>+enum kcs_states {
>+	IDLE_STATE  =3D 0,
>+	READ_STATE  =3D 1,
>+	WRITE_STATE =3D 2,
>+	ERROR_STATE =3D 3,
>+};
>+
>+/* IPMI 2.0 - Table 9-3, KCS Interface Control Codes */
>+#define KCS_CMD_GET_STATUS_ABORT  0x60
>+#define KCS_CMD_WRITE_START       0x61
>+#define KCS_CMD_WRITE_END         0x62
>+#define KCS_CMD_READ_BYTE         0x68
>+
>+static inline void set_state(struct kcs_bmc *kcs_bmc, u8 state)
>+{
>+	kcs_bmc_update_status(kcs_bmc, KCS_STATUS_STATE_MASK,
>+					KCS_STATUS_STATE(state));
>+}
>+
>+static void kcs_bmc_ipmi_force_abort(struct kcs_bmc *kcs_bmc)
>+{
>+	set_state(kcs_bmc, ERROR_STATE);
>+	kcs_bmc_read_data(kcs_bmc);
>+	kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
>+
>+	kcs_bmc->phase =3D KCS_PHASE_ERROR;
>+	kcs_bmc->data_in_avail =3D false;
>+	kcs_bmc->data_in_idx =3D 0;
>+}
>+
>+static void kcs_bmc_ipmi_handle_data(struct kcs_bmc *kcs_bmc)
>+{
>+	u8 data;
>+
>+	switch (kcs_bmc->phase) {
>+	case KCS_PHASE_WRITE_START:
>+		kcs_bmc->phase =3D KCS_PHASE_WRITE_DATA;
>+		fallthrough;
>+
>+	case KCS_PHASE_WRITE_DATA:
>+		if (kcs_bmc->data_in_idx < KCS_MSG_BUFSIZ) {
>+			set_state(kcs_bmc, WRITE_STATE);
>+			kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
>+			kcs_bmc->data_in[kcs_bmc->data_in_idx++] =3D
>+						kcs_bmc_read_data(kcs_bmc);
>+		} else {
>+			kcs_bmc_ipmi_force_abort(kcs_bmc);
>+			kcs_bmc->error =3D KCS_LENGTH_ERROR;
>+		}
>+		break;
>+
>+	case KCS_PHASE_WRITE_END_CMD:
>+		if (kcs_bmc->data_in_idx < KCS_MSG_BUFSIZ) {
>+			set_state(kcs_bmc, READ_STATE);
>+			kcs_bmc->data_in[kcs_bmc->data_in_idx++] =3D
>+						kcs_bmc_read_data(kcs_bmc);
>+			kcs_bmc->phase =3D KCS_PHASE_WRITE_DONE;
>+			kcs_bmc->data_in_avail =3D true;
>+			wake_up_interruptible(&kcs_bmc->queue);
>+		} else {
>+			kcs_bmc_ipmi_force_abort(kcs_bmc);
>+			kcs_bmc->error =3D KCS_LENGTH_ERROR;
>+		}
>+		break;
>+
>+	case KCS_PHASE_READ:
>+		if (kcs_bmc->data_out_idx =3D=3D kcs_bmc->data_out_len)
>+			set_state(kcs_bmc, IDLE_STATE);
>+
>+		data =3D kcs_bmc_read_data(kcs_bmc);
>+		if (data !=3D KCS_CMD_READ_BYTE) {
>+			set_state(kcs_bmc, ERROR_STATE);
>+			kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
>+			break;
>+		}
>+
>+		if (kcs_bmc->data_out_idx =3D=3D kcs_bmc->data_out_len) {
>+			kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
>+			kcs_bmc->phase =3D KCS_PHASE_IDLE;
>+			break;
>+		}
>+
>+		kcs_bmc_write_data(kcs_bmc,
>+			kcs_bmc->data_out[kcs_bmc->data_out_idx++]);
>+		break;
>+
>+	case KCS_PHASE_ABORT_ERROR1:
>+		set_state(kcs_bmc, READ_STATE);
>+		kcs_bmc_read_data(kcs_bmc);
>+		kcs_bmc_write_data(kcs_bmc, kcs_bmc->error);
>+		kcs_bmc->phase =3D KCS_PHASE_ABORT_ERROR2;
>+		break;
>+
>+	case KCS_PHASE_ABORT_ERROR2:
>+		set_state(kcs_bmc, IDLE_STATE);
>+		kcs_bmc_read_data(kcs_bmc);
>+		kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
>+		kcs_bmc->phase =3D KCS_PHASE_IDLE;
>+		break;
>+
>+	default:
>+		kcs_bmc_ipmi_force_abort(kcs_bmc);
>+		break;
>+	}
>+}
>+
>+static void kcs_bmc_ipmi_handle_cmd(struct kcs_bmc *kcs_bmc)
>+{
>+	u8 cmd;
>+
>+	set_state(kcs_bmc, WRITE_STATE);
>+	kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
>+
>+	cmd =3D kcs_bmc_read_data(kcs_bmc);
>+	switch (cmd) {
>+	case KCS_CMD_WRITE_START:
>+		kcs_bmc->phase =3D KCS_PHASE_WRITE_START;
>+		kcs_bmc->error =3D KCS_NO_ERROR;
>+		kcs_bmc->data_in_avail =3D false;
>+		kcs_bmc->data_in_idx =3D 0;
>+		break;
>+
>+	case KCS_CMD_WRITE_END:
>+		if (kcs_bmc->phase !=3D KCS_PHASE_WRITE_DATA) {
>+			kcs_bmc_ipmi_force_abort(kcs_bmc);
>+			break;
>+		}
>+
>+		kcs_bmc->phase =3D KCS_PHASE_WRITE_END_CMD;
>+		break;
>+
>+	case KCS_CMD_GET_STATUS_ABORT:
>+		if (kcs_bmc->error =3D=3D KCS_NO_ERROR)
>+			kcs_bmc->error =3D KCS_ABORTED_BY_COMMAND;
>+
>+		kcs_bmc->phase =3D KCS_PHASE_ABORT_ERROR1;
>+		kcs_bmc->data_in_avail =3D false;
>+		kcs_bmc->data_in_idx =3D 0;
>+		break;
>+
>+	default:
>+		kcs_bmc_ipmi_force_abort(kcs_bmc);
>+		kcs_bmc->error =3D KCS_ILLEGAL_CONTROL_CODE;
>+		break;
>+	}
>+}
>+
>+int kcs_bmc_ipmi_event(struct kcs_bmc *kcs_bmc);

Another instance...

>+int kcs_bmc_ipmi_event(struct kcs_bmc *kcs_bmc)
>+{
>+	unsigned long flags;
>+	int ret =3D -ENODATA;
>+	u8 status;
>+
>+	spin_lock_irqsave(&kcs_bmc->lock, flags);
>+
>+	status =3D kcs_bmc_read_status(kcs_bmc);
>+	if (status & KCS_STATUS_IBF) {
>+		if (!kcs_bmc->running)
>+			kcs_bmc_ipmi_force_abort(kcs_bmc);
>+		else if (status & KCS_STATUS_CMD_DAT)
>+			kcs_bmc_ipmi_handle_cmd(kcs_bmc);
>+		else
>+			kcs_bmc_ipmi_handle_data(kcs_bmc);
>+
>+		ret =3D 0;
>+	}
>+
>+	spin_unlock_irqrestore(&kcs_bmc->lock, flags);
>+
>+	return ret;
>+}
>+EXPORT_SYMBOL(kcs_bmc_ipmi_event);
>+
>+static inline struct kcs_bmc *to_kcs_bmc(struct file *filp)
>+{
>+	return container_of(filp->private_data, struct kcs_bmc, miscdev);
>+}
>+
>+static int kcs_bmc_ipmi_open(struct inode *inode, struct file *filp)
>+{
>+	struct kcs_bmc *kcs_bmc =3D to_kcs_bmc(filp);
>+	int ret =3D 0;
>+
>+	spin_lock_irq(&kcs_bmc->lock);
>+	if (!kcs_bmc->running)
>+		kcs_bmc->running =3D 1;
>+	else
>+		ret =3D -EBUSY;
>+	spin_unlock_irq(&kcs_bmc->lock);
>+
>+	return ret;
>+}
>+
>+static __poll_t kcs_bmc_ipmi_poll(struct file *filp, poll_table *wait)
>+{
>+	struct kcs_bmc *kcs_bmc =3D to_kcs_bmc(filp);
>+	__poll_t mask =3D 0;
>+
>+	poll_wait(filp, &kcs_bmc->queue, wait);
>+
>+	spin_lock_irq(&kcs_bmc->lock);
>+	if (kcs_bmc->data_in_avail)
>+		mask |=3D EPOLLIN;
>+	spin_unlock_irq(&kcs_bmc->lock);
>+
>+	return mask;
>+}
>+
>+static ssize_t kcs_bmc_ipmi_read(struct file *filp, char __user *buf,
>+			    size_t count, loff_t *ppos)
>+{
>+	struct kcs_bmc *kcs_bmc =3D to_kcs_bmc(filp);
>+	bool data_avail;
>+	size_t data_len;
>+	ssize_t ret;
>+
>+	if (!(filp->f_flags & O_NONBLOCK))
>+		wait_event_interruptible(kcs_bmc->queue,
>+					 kcs_bmc->data_in_avail);
>+
>+	mutex_lock(&kcs_bmc->mutex);
>+
>+	spin_lock_irq(&kcs_bmc->lock);
>+	data_avail =3D kcs_bmc->data_in_avail;
>+	if (data_avail) {
>+		data_len =3D kcs_bmc->data_in_idx;
>+		memcpy(kcs_bmc->kbuffer, kcs_bmc->data_in, data_len);
>+	}
>+	spin_unlock_irq(&kcs_bmc->lock);
>+
>+	if (!data_avail) {
>+		ret =3D -EAGAIN;
>+		goto out_unlock;
>+	}
>+
>+	if (count < data_len) {
>+		pr_err("channel=3D%u with too large data : %zu\n",
>+			kcs_bmc->channel, data_len);
>+
>+		spin_lock_irq(&kcs_bmc->lock);
>+		kcs_bmc_ipmi_force_abort(kcs_bmc);
>+		spin_unlock_irq(&kcs_bmc->lock);
>+
>+		ret =3D -EOVERFLOW;
>+		goto out_unlock;
>+	}
>+
>+	if (copy_to_user(buf, kcs_bmc->kbuffer, data_len)) {
>+		ret =3D -EFAULT;
>+		goto out_unlock;
>+	}
>+
>+	ret =3D data_len;
>+
>+	spin_lock_irq(&kcs_bmc->lock);
>+	if (kcs_bmc->phase =3D=3D KCS_PHASE_WRITE_DONE) {
>+		kcs_bmc->phase =3D KCS_PHASE_WAIT_READ;
>+		kcs_bmc->data_in_avail =3D false;
>+		kcs_bmc->data_in_idx =3D 0;
>+	} else {
>+		ret =3D -EAGAIN;
>+	}
>+	spin_unlock_irq(&kcs_bmc->lock);
>+
>+out_unlock:
>+	mutex_unlock(&kcs_bmc->mutex);
>+
>+	return ret;
>+}
>+
>+static ssize_t kcs_bmc_ipmi_write(struct file *filp, const char __user *b=
uf,
>+			     size_t count, loff_t *ppos)
>+{
>+	struct kcs_bmc *kcs_bmc =3D to_kcs_bmc(filp);
>+	ssize_t ret;
>+
>+	/* a minimum response size '3' : netfn + cmd + ccode */
>+	if (count < 3 || count > KCS_MSG_BUFSIZ)
>+		return -EINVAL;
>+
>+	mutex_lock(&kcs_bmc->mutex);
>+
>+	if (copy_from_user(kcs_bmc->kbuffer, buf, count)) {
>+		ret =3D -EFAULT;
>+		goto out_unlock;
>+	}
>+
>+	spin_lock_irq(&kcs_bmc->lock);
>+	if (kcs_bmc->phase =3D=3D KCS_PHASE_WAIT_READ) {
>+		kcs_bmc->phase =3D KCS_PHASE_READ;
>+		kcs_bmc->data_out_idx =3D 1;
>+		kcs_bmc->data_out_len =3D count;
>+		memcpy(kcs_bmc->data_out, kcs_bmc->kbuffer, count);
>+		kcs_bmc_write_data(kcs_bmc, kcs_bmc->data_out[0]);
>+		ret =3D count;
>+	} else {
>+		ret =3D -EINVAL;
>+	}
>+	spin_unlock_irq(&kcs_bmc->lock);
>+
>+out_unlock:
>+	mutex_unlock(&kcs_bmc->mutex);
>+
>+	return ret;
>+}
>+
>+static long kcs_bmc_ipmi_ioctl(struct file *filp, unsigned int cmd,
>+			  unsigned long arg)
>+{
>+	struct kcs_bmc *kcs_bmc =3D to_kcs_bmc(filp);
>+	long ret =3D 0;
>+
>+	spin_lock_irq(&kcs_bmc->lock);
>+
>+	switch (cmd) {
>+	case IPMI_BMC_IOCTL_SET_SMS_ATN:
>+		kcs_bmc_update_status(kcs_bmc, KCS_STATUS_SMS_ATN, KCS_STATUS_SMS_ATN);
>+		break;
>+
>+	case IPMI_BMC_IOCTL_CLEAR_SMS_ATN:
>+		kcs_bmc_update_status(kcs_bmc, KCS_STATUS_SMS_ATN, 0);
>+		break;
>+
>+	case IPMI_BMC_IOCTL_FORCE_ABORT:
>+		kcs_bmc_ipmi_force_abort(kcs_bmc);
>+		break;
>+
>+	default:
>+		ret =3D -EINVAL;
>+		break;
>+	}
>+
>+	spin_unlock_irq(&kcs_bmc->lock);
>+
>+	return ret;
>+}
>+
>+static int kcs_bmc_ipmi_release(struct inode *inode, struct file *filp)
>+{
>+	struct kcs_bmc *kcs_bmc =3D to_kcs_bmc(filp);
>+
>+	spin_lock_irq(&kcs_bmc->lock);
>+	kcs_bmc->running =3D 0;
>+	kcs_bmc_ipmi_force_abort(kcs_bmc);
>+	spin_unlock_irq(&kcs_bmc->lock);
>+
>+	return 0;
>+}
>+
>+static const struct file_operations kcs_bmc_fops =3D {
>+	.owner          =3D THIS_MODULE,
>+	.open           =3D kcs_bmc_ipmi_open,
>+	.read           =3D kcs_bmc_ipmi_read,
>+	.write          =3D kcs_bmc_ipmi_write,
>+	.release        =3D kcs_bmc_ipmi_release,
>+	.poll           =3D kcs_bmc_ipmi_poll,
>+	.unlocked_ioctl =3D kcs_bmc_ipmi_ioctl,
>+};
>+
>+struct kcs_bmc *kcs_bmc_ipmi_alloc(struct device *dev, int sizeof_priv, u=
32 channel);

Here too.

>+struct kcs_bmc *kcs_bmc_ipmi_alloc(struct device *dev, int sizeof_priv, u=
32 channel)
>+{
>+	struct kcs_bmc *kcs_bmc;
>+
>+	kcs_bmc =3D devm_kzalloc(dev, sizeof(*kcs_bmc) + sizeof_priv, GFP_KERNEL=
);
>+	if (!kcs_bmc)
>+		return NULL;
>+
>+	spin_lock_init(&kcs_bmc->lock);
>+	kcs_bmc->channel =3D channel;
>+
>+	mutex_init(&kcs_bmc->mutex);
>+	init_waitqueue_head(&kcs_bmc->queue);
>+
>+	kcs_bmc->data_in =3D devm_kmalloc(dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
>+	kcs_bmc->data_out =3D devm_kmalloc(dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
>+	kcs_bmc->kbuffer =3D devm_kmalloc(dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
>+
>+	kcs_bmc->miscdev.minor =3D MISC_DYNAMIC_MINOR;
>+	kcs_bmc->miscdev.name =3D devm_kasprintf(dev, GFP_KERNEL, "%s%u",
>+					       DEVICE_NAME, channel);
>+	if (!kcs_bmc->data_in || !kcs_bmc->data_out || !kcs_bmc->kbuffer ||
>+	    !kcs_bmc->miscdev.name)
>+		return NULL;
>+	kcs_bmc->miscdev.fops =3D &kcs_bmc_fops;
>+
>+	return kcs_bmc;
>+}
>+EXPORT_SYMBOL(kcs_bmc_ipmi_alloc);
>+
>+MODULE_LICENSE("GPL v2");
>+MODULE_AUTHOR("Haiyue Wang <haiyue.wang@linux.intel.com>");
>+MODULE_DESCRIPTION("KCS BMC to handle the IPMI request from system softwa=
re");
>--=20
>2.27.0
>=
