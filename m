Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6285D38C09C
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 09:20:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmdKk1zR7z305p
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 17:20:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=equinixinc.onmicrosoft.com header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-equinixinc-onmicrosoft-com header.b=iqyyiVgV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.159.192;
 helo=mx0b-00268f01.pphosted.com;
 envelope-from=prvs=6775408355=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=equinixinc.onmicrosoft.com
 header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-equinixinc-onmicrosoft-com header.b=iqyyiVgV; 
 dkim-atps=neutral
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com
 [148.163.159.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmdJt1krzz2yyM;
 Fri, 21 May 2021 17:19:25 +1000 (AEST)
Received: from pps.filterd (m0105197.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14L7ItFo007001; Fri, 21 May 2021 07:19:07 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
 by mx0a-00268f01.pphosted.com with ESMTP id 38p2purt93-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 07:19:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kNj2XsImn1rZtDE+z80mdbzL8IS4jxbTujs5DXo06VekpgJsNWX53vWiuLHxGpq+Lm4ZYTvC86xd5Hm9zzjCEuxf3SBs4N+DdWj32B7IHE197CSND4WS5GXXfiIVao1nNaf0o7rPrX5/WayaHZMtmh21jS2Zy0FKM6JIsO8a7okaleOzhyO/5tGU6mTlGcpYojc/uD8dRcS64qyRGd/YGCGN5BCpDTuF4ueX1/cJEbX1Du3qAKWKJ3r0A0wE9Rbr8srxMRe34qj//1W1PNxBQtzSNgpwT/XJ0fxjgljJILTho8jfXcqK8EWO7aW8tL+4m0jw9Um2/Q8kh/eOldci4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixREdW1LPxtzkKRP9758eKVztP3YEeF5yVv0rsK6YTU=;
 b=e+fHGUjSYD/ESVaHX+CKVF+3QS/7YjPxJWBqsXAGCmhUBpajoUUh4NXXHCz8KKnMlmQ+NuOORJXsXbvslUR2Q+wS+XxzPdBACso+jldDGCHmdUc+2B5kuY+oDkHUOzw9d8jne6UDpuGocv20JdEKUFoO45xQJOg04GmauzS2+3092X1UBBN8A5XWFI5NkBLTed2V3Da54IGIW4bf5MfqQBjMpCfxk247+QO9/EAdSLn4XAuanxQAww3ZGbxT/1htLOkpgrZ5vNQAjKnSH8noyd73TbliMPD/q8Gm9Feqtl4WkutwOpsOhyFr1p1cRrKrZSWcNmJQEd5OrqyjNOEPrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=equinixinc.onmicrosoft.com; s=selector2-equinixinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixREdW1LPxtzkKRP9758eKVztP3YEeF5yVv0rsK6YTU=;
 b=iqyyiVgVosGmVrOGkFyEgYJuhTSEtGfFkvO57/3gj1C3vqs9Fi15UzD0YJiMJgDqA1NdN2yUrXMremqbAstOoWO+k5r5WThwm4RMAiEoJPGSRnQXd9E4wamjkquwkhxT066giAWLD2PU5Ci+kgID9CIBI5zwtzsvtMIjvELR5mQ=
Received: from DM5PR04MB0762.namprd04.prod.outlook.com (2603:10b6:3:f3::13) by
 DM6PR04MB3802.namprd04.prod.outlook.com (2603:10b6:5:ac::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.28; Fri, 21 May 2021 07:19:05 +0000
Received: from DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::d9ba:6e7f:b51e:6cab]) by DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::d9ba:6e7f:b51e:6cab%2]) with mapi id 15.20.4129.034; Fri, 21 May 2021
 07:19:05 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v3 08/16] ipmi: kcs_bmc: Decouple the IPMI chardev from
 the core
Thread-Topic: [PATCH v3 08/16] ipmi: kcs_bmc: Decouple the IPMI chardev from
 the core
Thread-Index: AQHXThGV8YOzCpWyZ0Cmi3eDv0ZXtw==
Date: Fri, 21 May 2021 07:19:05 +0000
Message-ID: <YKde6CswsxxhxLoU@packtop>
References: <20210510054213.1610760-1-andrew@aj.id.au>
 <20210510054213.1610760-9-andrew@aj.id.au>
In-Reply-To: <20210510054213.1610760-9-andrew@aj.id.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=equinix.com;
x-originating-ip: [24.181.166.149]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f4392a70-755d-4b1d-4829-08d91c28b7ca
x-ms-traffictypediagnostic: DM6PR04MB3802:
x-microsoft-antispam-prvs: <DM6PR04MB38029F794BB56FC9622C6625C3299@DM6PR04MB3802.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:267;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NASJ1hHTQ9kRUMsmDDzEgg9CkUMNFPqpC78NkV3x3WrxMU+O/uhVHkJBkDUmBECeR4aOoH7B50bBVIoO2xs/RtS3YLUOc0YtQUaehYQjIYxeawjL8Je3wvVztLMiv41TkGSYNZ22geLuZgu8EJ+cb0v/5ftHFnT2j/IJv2U2Ex+vt6LqYsOmyQ4a+nxTV8BUzNKe682TK9irXat27N4UAz/dWiwfjiLZ04jCgjfTq5dFnmDnIU9YqOwCX94s4n69sYKubOtF8HnA0ZB+PgrPi7lbx91qn5xcmtygafsnNibGuoqpqCr7tAvw8b4PX2BZS+Pi9TVIYMHklsLvU1z4eWx/wHd3PwzEtBaQpWrw5HWb/n1myS/jgQKPjtUkdcxKHifUN+cJtU/w4LIbuT3KM6SmnO5xq84llglj9LV0hTBj+Fymm68JswFUDKXhzm8TeNLdqasVk33EJ7lmlEOjl+9Wor7qYMje0KWIE/HnlaLfbFpecAArgf4oa3fN6D2Fcq1whRHkZrB8JVZD46AMwb9DKdP+z3EMLIkmI//AJhw35vdfoVCl1QQ2NWc6prX+sLB59EqyL+lroGUxXcXWLgPWU/aBysu1EJn9Dfaql/s=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR04MB0762.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(346002)(39860400002)(376002)(396003)(366004)(136003)(122000001)(5660300002)(7416002)(478600001)(33716001)(38100700002)(71200400001)(26005)(54906003)(66476007)(66446008)(76116006)(66946007)(8676002)(4326008)(8936002)(6916009)(9686003)(6486002)(2906002)(64756008)(83380400001)(6512007)(186003)(6506007)(86362001)(66556008)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?PrgLL+lerZeHrdYqF6TujEMbOz71PajxgYiDT6ximpWo6WF8RGz1dsRJ4Tyq?=
 =?us-ascii?Q?5B09oUb6m8ELqaWBk2TrkQ+D9sVuqpoAXvbEGcKXTFmbRpa5OJOlmJ8xx2zC?=
 =?us-ascii?Q?mO+5Xd+wXkQ0POtKlYMTx72lGUhf5RSrnysTNJrI7/XyRqGGTvIdsccylpp0?=
 =?us-ascii?Q?BYO2mP6RqYJOmHi7Gk/K28aGrcWAq7Qjvp1JTlQR3s+527Np1JzdeEgJehm5?=
 =?us-ascii?Q?nxLiC3ifugDUmgwYFmR8Q08InKmRoubkTnT56yEPKAye+wbyZfURntI+MZbY?=
 =?us-ascii?Q?28nSeBHYDKpycjfMAP/4GM37ByKBqRLuB6g9J5/4SF37ciBaXp6r1AA62cPI?=
 =?us-ascii?Q?lGBMUxJFSEs4+h/gWDaEf8fUez2HYHYNJD/6TND3Ew+JrLniu5vyLwHYSTr6?=
 =?us-ascii?Q?v2I5t6GZviR7tg7KYpP7QrKLp9O2H2ceSEFsGtX6E/xwzpvkIwas04PUGVmZ?=
 =?us-ascii?Q?nD/9idHq4I6PDJwoFgjHW5PfecjM8mlyzFZ/kzKRf+UsDxlrOwKE7ZXBb3wC?=
 =?us-ascii?Q?fl/NfiFISTtEWDEBlIWQb0pa0wwcK7uK5nus946SeZZSlDcMKFizgf1saIie?=
 =?us-ascii?Q?Hsguduss9EdBN374H45Sljzehpvu6hAK2/hFUcoTb7njt6KA3qmv6+DL3AzH?=
 =?us-ascii?Q?YAYV5CDiUQDS4ZNaIkKaW0NtPNdKbj8KfqTuefdUpk+6qKLN2sJL35HXmBIQ?=
 =?us-ascii?Q?YZc3IwFlo0HfonVZnj27Pzmg2TUIHjG45sIHQ46tjWZfUDk5lGHyrt8nHgnA?=
 =?us-ascii?Q?P4fRcQ5A59xU5QhpUc6idCZ/qcaCSp/9hpl7up9OspCU3hwmp3KGIzrctDEc?=
 =?us-ascii?Q?j+3wV3XFumuNYpMOfVneeODViN1+PEbWhCz947QffsFwpY8p0Dp4xRxEOdcu?=
 =?us-ascii?Q?ccQls4tM9zaz/yZxF8eSspn7WNBhor1Dxfjup6dV1AFAoIcSqFZvhvMGAbIr?=
 =?us-ascii?Q?hha4cBvvCu4jE/njjz58StkODX6MK3GxHBGA9XmKcQeT6VHCtCFZFMwo0o2/?=
 =?us-ascii?Q?8JTxD7LQpsh1NQ0dvVFojDlwmqL3KXQ48UrtSH/hc2D62FdEKxfk+tgMy5CA?=
 =?us-ascii?Q?Ied6FD2Muspb/h90COjGKxcFZMHToH7S9w2xOWxbTbrmD3/62VzDmj7mYRSM?=
 =?us-ascii?Q?xxoko14dTV9hMXePig9JuXAKmMQXqk2eTmQLJgubd8SToFpLIW9eTnK27u7C?=
 =?us-ascii?Q?QHhh8Fr0HUnjrXjgu7VG/CBd0oxDctJOYHSOykJcrOZjiT8cDOozgm71VaZ7?=
 =?us-ascii?Q?btEF5b+mVr659f5hE6kX3H3snTPtmILp56jyQyoMYCGrekb736Iy0HBwF8Lt?=
 =?us-ascii?Q?7dOsWkGZBUELjesPLBu9aq5Y?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1EE4B917796F7149B663C02C1052CDA5@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR04MB0762.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4392a70-755d-4b1d-4829-08d91c28b7ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2021 07:19:05.5763 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZKjR91m0uV5OuO9i6Xr+GP0yHi2P5dudhzZ7LO00pPqyu/x4n08F3O0yhG8Bd7Py2Vu3X5qSRRvkaO1ugdJctA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB3802
X-Proofpoint-GUID: AUArRqNNO--hMDQhUWpo-4ZClHFbiwdV
X-Proofpoint-ORIG-GUID: AUArRqNNO--hMDQhUWpo-4ZClHFbiwdV
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-21_03:2021-05-20,
 2021-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015
 mlxscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105210046
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
 "minyard@acm.org" <minyard@acm.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "avifishman70@gmail.com" <avifishman70@gmail.com>,
 "venture@google.com" <venture@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tali.perry1@gmail.com" <tali.perry1@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>,
 "benjaminfair@google.com" <benjaminfair@google.com>,
 "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>,
 "chiawei_wang@aspeedtech.com" <chiawei_wang@aspeedtech.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "tmaimon77@gmail.com" <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, May 10, 2021 at 12:42:05AM CDT, Andrew Jeffery wrote:
>Now that we have untangled the data-structures, split the userspace
>interface out into its own module. Userspace interfaces and drivers are
>registered to the KCS BMC core to support arbitrary binding of either.
>
>Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>---
> drivers/char/ipmi/Kconfig             | 13 +++++
> drivers/char/ipmi/Makefile            |  3 +-
> drivers/char/ipmi/kcs_bmc.c           | 76 ++++++++++++++++++++++++---
> drivers/char/ipmi/kcs_bmc_cdev_ipmi.c | 31 ++++++++---
> drivers/char/ipmi/kcs_bmc_client.h    | 14 +++++
> 5 files changed, 122 insertions(+), 15 deletions(-)
>
>diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
>index 07847d9a459a..bc5f81899b62 100644
>--- a/drivers/char/ipmi/Kconfig
>+++ b/drivers/char/ipmi/Kconfig
>@@ -124,6 +124,19 @@ config NPCM7XX_KCS_IPMI_BMC
> 	  This support is also available as a module.  If so, the module
> 	  will be called kcs_bmc_npcm7xx.
>
>+config IPMI_KCS_BMC_CDEV_IPMI
>+	depends on IPMI_KCS_BMC
>+	tristate "IPMI character device interface for BMC KCS devices"
>+	help
>+	  Provides a BMC-side character device implementing IPMI
>+	  semantics for KCS IPMI devices.
>+
>+	  Say YES if you wish to expose KCS devices on the BMC for IPMI
>+	  purposes.
>+
>+	  This support is also available as a module. The module will be
>+	  called kcs_bmc_cdev_ipmi.
>+
> config ASPEED_BT_IPMI_BMC
> 	depends on ARCH_ASPEED || COMPILE_TEST
> 	depends on REGMAP && REGMAP_MMIO && MFD_SYSCON
>diff --git a/drivers/char/ipmi/Makefile b/drivers/char/ipmi/Makefile
>index a302bc865370..fcfa676afddb 100644
>--- a/drivers/char/ipmi/Makefile
>+++ b/drivers/char/ipmi/Makefile
>@@ -22,7 +22,8 @@ obj-$(CONFIG_IPMI_SSIF) +=3D ipmi_ssif.o
> obj-$(CONFIG_IPMI_POWERNV) +=3D ipmi_powernv.o
> obj-$(CONFIG_IPMI_WATCHDOG) +=3D ipmi_watchdog.o
> obj-$(CONFIG_IPMI_POWEROFF) +=3D ipmi_poweroff.o
>-obj-$(CONFIG_IPMI_KCS_BMC) +=3D kcs_bmc.o kcs_bmc_cdev_ipmi.o
>+obj-$(CONFIG_IPMI_KCS_BMC) +=3D kcs_bmc.o
>+obj-$(CONFIG_IPMI_KCS_BMC_CDEV_IPMI) +=3D kcs_bmc_cdev_ipmi.o
> obj-$(CONFIG_ASPEED_BT_IPMI_BMC) +=3D bt-bmc.o
> obj-$(CONFIG_ASPEED_KCS_IPMI_BMC) +=3D kcs_bmc_aspeed.o
> obj-$(CONFIG_NPCM7XX_KCS_IPMI_BMC) +=3D kcs_bmc_npcm7xx.o
>diff --git a/drivers/char/ipmi/kcs_bmc.c b/drivers/char/ipmi/kcs_bmc.c
>index 70bfeb72c3c7..2ec8312ce766 100644
>--- a/drivers/char/ipmi/kcs_bmc.c
>+++ b/drivers/char/ipmi/kcs_bmc.c
>@@ -5,7 +5,9 @@
>  */
>
> #include <linux/device.h>
>+#include <linux/list.h>
> #include <linux/module.h>
>+#include <linux/mutex.h>
>
> #include "kcs_bmc.h"
>
>@@ -13,6 +15,11 @@
> #include "kcs_bmc_device.h"
> #include "kcs_bmc_client.h"
>
>+/* Record registered devices and drivers */
>+static DEFINE_MUTEX(kcs_bmc_lock);
>+static LIST_HEAD(kcs_bmc_devices);
>+static LIST_HEAD(kcs_bmc_drivers);
>+
> /* Consumer data access */
>
> u8 kcs_bmc_read_data(struct kcs_bmc_device *kcs_bmc)
>@@ -98,24 +105,77 @@ void kcs_bmc_disable_device(struct kcs_bmc_device *kc=
s_bmc, struct kcs_bmc_clien
> }
> EXPORT_SYMBOL(kcs_bmc_disable_device);
>
>-int kcs_bmc_ipmi_add_device(struct kcs_bmc_device *kcs_bmc);
> void kcs_bmc_add_device(struct kcs_bmc_device *kcs_bmc)
> {
>-	if (kcs_bmc_ipmi_add_device(kcs_bmc))
>-		pr_warn("Failed to add device for KCS channel %d\n",
>-			kcs_bmc->channel);
>+	struct kcs_bmc_driver *drv;
>+	int rc;
>+
>+	spin_lock_init(&kcs_bmc->lock);
>+	kcs_bmc->client =3D NULL;
>+
>+	mutex_lock(&kcs_bmc_lock);
>+	list_add(&kcs_bmc->entry, &kcs_bmc_devices);
>+	list_for_each_entry(drv, &kcs_bmc_drivers, entry) {
>+		rc =3D drv->ops->add_device(kcs_bmc);
>+		if (rc)
>+			dev_err(kcs_bmc->dev, "Failed to add chardev for KCS channel %d: %d",
>+				kcs_bmc->channel, rc);
>+	}
>+	mutex_unlock(&kcs_bmc_lock);
> }
> EXPORT_SYMBOL(kcs_bmc_add_device);
>
>-int kcs_bmc_ipmi_remove_device(struct kcs_bmc_device *kcs_bmc);
> void kcs_bmc_remove_device(struct kcs_bmc_device *kcs_bmc)
> {
>-	if (kcs_bmc_ipmi_remove_device(kcs_bmc))
>-		pr_warn("Failed to remove device for KCS channel %d\n",
>-			kcs_bmc->channel);
>+	struct kcs_bmc_driver *drv;
>+	int rc;
>+
>+	mutex_lock(&kcs_bmc_lock);
>+	list_del(&kcs_bmc->entry);
>+	list_for_each_entry(drv, &kcs_bmc_drivers, entry) {
>+		rc =3D drv->ops->remove_device(kcs_bmc);
>+		if (rc)
>+			dev_err(kcs_bmc->dev, "Failed to remove chardev for KCS channel %d: %d=
",
>+				kcs_bmc->channel, rc);
>+	}
>+	mutex_unlock(&kcs_bmc_lock);
> }
> EXPORT_SYMBOL(kcs_bmc_remove_device);
>
>+void kcs_bmc_register_driver(struct kcs_bmc_driver *drv)
>+{
>+	struct kcs_bmc_device *kcs_bmc;
>+	int rc;
>+
>+	mutex_lock(&kcs_bmc_lock);
>+	list_add(&drv->entry, &kcs_bmc_drivers);
>+	list_for_each_entry(kcs_bmc, &kcs_bmc_devices, entry) {
>+		rc =3D drv->ops->add_device(kcs_bmc);
>+		if (rc)
>+			dev_err(kcs_bmc->dev, "Failed to add chardev for KCS channel %d: %d",
>+				kcs_bmc->channel, rc);

s/chardev/driver/?

>+	}
>+	mutex_unlock(&kcs_bmc_lock);
>+}
>+EXPORT_SYMBOL(kcs_bmc_register_driver);
>+
>+void kcs_bmc_unregister_driver(struct kcs_bmc_driver *drv)
>+{
>+	struct kcs_bmc_device *kcs_bmc;
>+	int rc;
>+
>+	mutex_lock(&kcs_bmc_lock);
>+	list_del(&drv->entry);
>+	list_for_each_entry(kcs_bmc, &kcs_bmc_devices, entry) {
>+		rc =3D drv->ops->remove_device(kcs_bmc);
>+		if (rc)
>+			dev_err(kcs_bmc->dev, "Failed to add chardev for KCS channel %d: %d",
>+				kcs_bmc->channel, rc);

s/add chardev/remove driver/?

>+	}
>+	mutex_unlock(&kcs_bmc_lock);
>+}
>+EXPORT_SYMBOL(kcs_bmc_unregister_driver);
>+
> MODULE_LICENSE("GPL v2");
> MODULE_AUTHOR("Haiyue Wang <haiyue.wang@linux.intel.com>");
> MODULE_AUTHOR("Andrew Jeffery <andrew@aj.id.au>");
>diff --git a/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c b/drivers/char/ipmi/kcs=
_bmc_cdev_ipmi.c
>index 865d8b93f3b7..486834a962c3 100644
>--- a/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
>+++ b/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
>@@ -469,8 +469,7 @@ static const struct file_operations kcs_bmc_ipmi_fops =
=3D {
> static DEFINE_SPINLOCK(kcs_bmc_ipmi_instances_lock);
> static LIST_HEAD(kcs_bmc_ipmi_instances);
>
>-int kcs_bmc_ipmi_add_device(struct kcs_bmc_device *kcs_bmc);
>-int kcs_bmc_ipmi_add_device(struct kcs_bmc_device *kcs_bmc)
>+static int kcs_bmc_ipmi_add_device(struct kcs_bmc_device *kcs_bmc)
> {
> 	struct kcs_bmc_ipmi *priv;
> 	int rc;
>@@ -512,10 +511,8 @@ int kcs_bmc_ipmi_add_device(struct kcs_bmc_device *kc=
s_bmc)
>
> 	return 0;
> }
>-EXPORT_SYMBOL(kcs_bmc_ipmi_add_device);
>
>-int kcs_bmc_ipmi_remove_device(struct kcs_bmc_device *kcs_bmc);
>-int kcs_bmc_ipmi_remove_device(struct kcs_bmc_device *kcs_bmc)
>+static int kcs_bmc_ipmi_remove_device(struct kcs_bmc_device *kcs_bmc)
> {
> 	struct kcs_bmc_ipmi *priv =3D NULL, *pos;
>
>@@ -541,7 +538,29 @@ int kcs_bmc_ipmi_remove_device(struct kcs_bmc_device =
*kcs_bmc)
>
> 	return 0;
> }
>-EXPORT_SYMBOL(kcs_bmc_ipmi_remove_device);
>+
>+static const struct kcs_bmc_driver_ops kcs_bmc_ipmi_driver_ops =3D {
>+	.add_device =3D kcs_bmc_ipmi_add_device,
>+	.remove_device =3D kcs_bmc_ipmi_remove_device,
>+};
>+
>+static struct kcs_bmc_driver kcs_bmc_ipmi_driver =3D {
>+	.ops =3D &kcs_bmc_ipmi_driver_ops,
>+};
>+
>+static int kcs_bmc_ipmi_init(void)
>+{
>+	kcs_bmc_register_driver(&kcs_bmc_ipmi_driver);
>+
>+	return 0;
>+}
>+module_init(kcs_bmc_ipmi_init);
>+
>+static void kcs_bmc_ipmi_exit(void)
>+{
>+	kcs_bmc_unregister_driver(&kcs_bmc_ipmi_driver);
>+}
>+module_exit(kcs_bmc_ipmi_exit);
>
> MODULE_LICENSE("GPL v2");
> MODULE_AUTHOR("Haiyue Wang <haiyue.wang@linux.intel.com>");
>diff --git a/drivers/char/ipmi/kcs_bmc_client.h b/drivers/char/ipmi/kcs_bm=
c_client.h
>index c0f85c5bdf5c..cb38b56cda85 100644
>--- a/drivers/char/ipmi/kcs_bmc_client.h
>+++ b/drivers/char/ipmi/kcs_bmc_client.h
>@@ -11,6 +11,17 @@
>
> #include "kcs_bmc.h"
>
>+struct kcs_bmc_driver_ops {
>+	int (*add_device)(struct kcs_bmc_device *kcs_bmc);
>+	int (*remove_device)(struct kcs_bmc_device *kcs_bmc);
>+};
>+
>+struct kcs_bmc_driver {
>+	struct list_head entry;
>+
>+	const struct kcs_bmc_driver_ops *ops;
>+};
>+
> struct kcs_bmc_client_ops {
> 	irqreturn_t (*event)(struct kcs_bmc_client *client);
> };
>@@ -21,6 +32,9 @@ struct kcs_bmc_client {
> 	struct kcs_bmc_device *dev;
> };
>
>+void kcs_bmc_register_driver(struct kcs_bmc_driver *drv);
>+void kcs_bmc_unregister_driver(struct kcs_bmc_driver *drv);
>+
> int kcs_bmc_enable_device(struct kcs_bmc_device *kcs_bmc, struct kcs_bmc_=
client *client);
> void kcs_bmc_disable_device(struct kcs_bmc_device *kcs_bmc, struct kcs_bm=
c_client *client);
>
>--=20
>2.27.0
>=
