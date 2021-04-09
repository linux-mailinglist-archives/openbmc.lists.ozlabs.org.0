Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FDD359404
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 06:37:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGlj34KhGz3bw0
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 14:37:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=equinixinc.onmicrosoft.com header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-equinixinc-onmicrosoft-com header.b=DqHCA2XA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.159.192;
 helo=mx0b-00268f01.pphosted.com;
 envelope-from=prvs=5733813a0f=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=equinixinc.onmicrosoft.com
 header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-equinixinc-onmicrosoft-com header.b=DqHCA2XA; 
 dkim-atps=neutral
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com
 [148.163.159.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGlhP2CCtz30J5;
 Fri,  9 Apr 2021 14:36:35 +1000 (AEST)
Received: from pps.filterd (m0105197.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1394YFpU020213; Fri, 9 Apr 2021 04:35:33 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
 by mx0a-00268f01.pphosted.com with ESMTP id 37te7hg87x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 04:35:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oIYbSEOTQ8Mc7CXvJR0kh1HEf405Kzdo15e91KQ5mvaHyGZCxUCp050IGpzrSqehDaCfa4uhREk3j/9ce+4i0sAKpahh2evnd4zbnk+r0GAUQobGdmUROrQ76yfM3ZZiEiPSak01PCSipwSlWzzS89NArRMYZL2U9mkKhKeAqLBPezX+FCyQwBy+NIDcON3xOZDAm93zygvtNgPLKPXPNGihpEFeqBYhxKPv+X+suR71WunPZJmrqVqp2OpFnqryz0o62BO66EpeCALdNoZc47NIStY5w2vzK/qF1v9dC7hHmq5dLN9gYYx3wwetO3ssWKBV8ytEi2hO65y8RoMrUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t8enUxkv9576dfL8WOpXWiwwclKCfVQNvd45RtiNPPc=;
 b=PH2FztBU+aAN0ECIjRZgIEvueMkHX9nxx4NTacoEOjZR4twaJixUg2vTdsAZE0PIL5MM2bPgHyKn9yg4q6NqEW9Y6CzooiUlJE+7l7hdzIN/pHEZ+47/s4FoICvGPXmSvnRioPwkkd6jOQ9wiYlhTty/WyrBQIf96xvbXcjJHA6/YHs4sA+GimR5yzsKzpR5zUUa0N9iZoqTGXn2cKpiRnf6YTbhe/yrdOTFOgH7TJFg/KSZEkuH0GOAn8SWdYmWBM0GGY7VWpqogxI3hCCC0HdBbLNmvKLmrqfLe914M5q1S2Luin0fdDyhSjxgfdsn2UGIf9hLp1EMjFWLAp+4AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=equinixinc.onmicrosoft.com; s=selector2-equinixinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t8enUxkv9576dfL8WOpXWiwwclKCfVQNvd45RtiNPPc=;
 b=DqHCA2XAP5zPbmmNTrG3cGYlUEaaSRlZnW3P7y5R5C9byKs5KtpPykyRhb5gUyy5GFgz5e38548b7ANcSYZ7v2LhuswxgQxjRfYmg7BiPWgcGLF+vHfNjkHg+znhW9VQjdgjGJ7EhEdaHn6+JhZzCwZfzYYVQZJqWrPiF9nE/j8=
Received: from DM5PR04MB0762.namprd04.prod.outlook.com (2603:10b6:3:f3::13) by
 DM6PR04MB3929.namprd04.prod.outlook.com (2603:10b6:5:ac::30) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17; Fri, 9 Apr 2021 04:35:31 +0000
Received: from DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::4c98:aeb:87a8:13ad]) by DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::4c98:aeb:87a8:13ad%5]) with mapi id 15.20.4020.017; Fri, 9 Apr 2021
 04:35:30 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v2 13/21] ipmi: kcs_bmc: Decouple the IPMI chardev from
 the core
Thread-Topic: [PATCH v2 13/21] ipmi: kcs_bmc: Decouple the IPMI chardev from
 the core
Thread-Index: AQHXLPnFQEyxqSF8jUWs1YYelcFYYg==
Date: Fri, 9 Apr 2021 04:35:30 +0000
Message-ID: <YG/ZkanVAypmjCba@packtop>
References: <20210319062752.145730-1-andrew@aj.id.au>
 <20210319062752.145730-13-andrew@aj.id.au>
In-Reply-To: <20210319062752.145730-13-andrew@aj.id.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=equinix.com;
x-originating-ip: [24.181.166.149]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d145adf1-d759-4231-7004-08d8fb10e85a
x-ms-traffictypediagnostic: DM6PR04MB3929:
x-microsoft-antispam-prvs: <DM6PR04MB39296E1954C441A9C6284AC1C3739@DM6PR04MB3929.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xwUF7zaDdLndD6FsjHU0irzbj8Fk4ygxWidhOBE4Kb1Dg1/I3kYxOL7SDoCKneENxQ+qxNOpoylh/Um899psulkRL7RC3gUy1P7f3/NzeiCBkP7Mmzyp9fuLl5yQHMGt8SCZ7tOyn9kS6QO/LImXHRqTTjF2JHXCDSKq5YJXqwynuj3swHUXyMF4T3aYdD9OQh9EKDOip+ZfWN5qY0fQXo78VesTTUG4tSuy8OdYVIQkRa7/9gFufmC1H2AJUU9MwnXrOolRDhHE1ejNr0vrQfb4/8n2zjWyLzUYSLWGvJGl30aH4uOADgiFP8lmX27B9g4ui2IIIQPCV2eaBrKLCSJTS72a4n+J5eJL5KLuNK3sQ1tK/vnFNtb+Nk2FI5twcplLlLyQEAbs8uCIYPr3kzMUdoxuWmt4hpenzTNIG8+JhcwwuEvuPJNiRqGYluGEUFao86MbZIHtPjuqBcznEjw2UpAycoJ0/FDGaU+4kwaVjZo+7VU8/sooW+r+KYqUi8DlvWWyFB2NU4VijyfdpvnEDpB646iUfLyYKXUYVTVGOwSlm1y2mNuvN9s4l3c/n9s+coYa7v+TapS/SMfYODpP9oULoKRyFGB6kI/L9tZ+8wEEdfjC3YPuJSrnSo2M+j00n1M5WUrzAx584AUabQr/Jcb5p8HkS3uG/JGJDaI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR04MB0762.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(346002)(366004)(136003)(396003)(39860400002)(376002)(6916009)(38100700001)(186003)(2906002)(7416002)(91956017)(6486002)(26005)(6506007)(478600001)(6512007)(4326008)(9686003)(71200400001)(54906003)(83380400001)(316002)(66946007)(8936002)(8676002)(66446008)(64756008)(86362001)(76116006)(66476007)(66556008)(5660300002)(33716001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?K+VirYjecySypYT1boZQahHAdPdd+tU3QG9FNs3u+ZdZ5PcYMGE/sQ+Nk5hu?=
 =?us-ascii?Q?cIdsSlWhgJAiTU+11c6Jg+ocb0gVGJnFKdfLSYxubbsZSw0qOmZbZrpnju7Q?=
 =?us-ascii?Q?dIj/jbgMdjTFxAve77whgBn8n3zszVsEtLbsFpfhhD2AXOvcSkVGM/f1V9aq?=
 =?us-ascii?Q?4TTW2EOgyNa11Pqj3eexcO8TSjfPA4b9CRDJpuXkig4vST3UrpNuJNNNwDXM?=
 =?us-ascii?Q?7FSnHXW3bXfekQ/BoZ0WrWDr5z/xW/uIa5tuFBStT4ROKmhVPHin4eRsc2hg?=
 =?us-ascii?Q?EAWty1zsPKF0d8EPIiKkj6ULsrilfzP4sawFsx8Z24ln9UV6nsvfHmzmlk4m?=
 =?us-ascii?Q?vfIaPj+BFwgZxFFeW41R4TjxtcVjkesdF2Hlnqigyev8LD3UWVMwfo8K2laI?=
 =?us-ascii?Q?NmIWlOeAhXKidQbKElvrf7iqaFSTlh/IPGpYzORhm709q/LkyvFf+4uT/Olu?=
 =?us-ascii?Q?onPIBist7srMMpdEnUCUVlJjpuNLw425pHvGlZaeKlMNYKtnIlWBqMFfXPOy?=
 =?us-ascii?Q?fypkp/8Ou9lkSpHKIMeg3we2w+NjoWRw9nxHc34zbWH4or1ArqtPwWV0RY+m?=
 =?us-ascii?Q?ZfZ4KleTCnFskO6lP7ab3s/RAgNPBVRWy2/tSjiq8rIRXIpu3xJH8dOXledT?=
 =?us-ascii?Q?+bCo2/oTWGLp+wrwAKuMDhpuiCX6YnnVtCMwY1WOj6w8isA2IYCUEc0EPx2z?=
 =?us-ascii?Q?jRu5Xf+s9klqyiVqDJo+cWPvS0pcldaAZf6l/4ZCshH+j76j8nNCmJoNS8m9?=
 =?us-ascii?Q?84K0Q8OBWQ8NHBzi4YmH/xlzefevzAU1ycBqqGBD2AmEMAcQ1NJYb+LNDAxG?=
 =?us-ascii?Q?Bp8tgMADoaKC5hJh2lYTCeGtRaf6ztmAv0ppbo7/KuDxCsgb1FCYjGS6Cejp?=
 =?us-ascii?Q?DvkQotq0jeHMoq7/2b6NoAnO0p1c3dZ6Iud00l7XDmCFZmhvE+lcqwRj2FFy?=
 =?us-ascii?Q?i4+QB46W1oaGK72M9nQG5dnCenxdYMOQTdX77/6ci61aDJflyts3AjahSGB2?=
 =?us-ascii?Q?E4CfRQ8WffzYYgPr3kdJBCxXI33gagFzix3hkdIdgOioLXcUoDycwFL6fl1P?=
 =?us-ascii?Q?8DY9g35I0R2HV2bWpJce3f+XUHk7h4zMJ+aoLcf0v4BDO2LvVqKJI66+s8Lj?=
 =?us-ascii?Q?Pt3pss9PLf+Z4T2YWawG0suZZkv+fM9zJoyk0wfRnX7puXgf2sE12MnKrt0M?=
 =?us-ascii?Q?GnMQVVKVq6RFwgIeLHRdbXGTuRlWRIvzRHGKzeWhaFOzfaCw/l2Nqj235Hvn?=
 =?us-ascii?Q?0/s8p83J7K8amp8+//pKJa6WrikncYXCbHzDJdL/69D2iL6zMe4x2McqwwFg?=
 =?us-ascii?Q?Fwjad3fYXGgf4DEdFUVVGw88ZHyQud+E0pLVauspaZFxCw=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <451798C445515348AE8682B544D05EFC@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR04MB0762.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d145adf1-d759-4231-7004-08d8fb10e85a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2021 04:35:30.7325 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EpqZx4qXPcMBAJ2cFQTuyZNfMORu6Epe02CuwVGU7uGOdH0vKxtjm0DkHR03Km4kZXdiTLXrbI6zm2jbvmukcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB3929
X-Proofpoint-GUID: xZ4TW2q5kiPrWIIQmBij_Hb34bBv53NQ
X-Proofpoint-ORIG-GUID: xZ4TW2q5kiPrWIIQmBij_Hb34bBv53NQ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-09_03:2021-04-08,
 2021-04-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 spamscore=0 mlxscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104090032
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

On Fri, Mar 19, 2021 at 01:27:44AM CDT, Andrew Jeffery wrote:
>Now that we have untangled the data-structures, split the userspace
>interface out into its own module. Userspace interfaces and drivers are
>registered to the KCS BMC core to support arbitrary binding of either.
>
>Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>---
> drivers/char/ipmi/Kconfig             | 13 +++++
> drivers/char/ipmi/Makefile            |  3 +-
> drivers/char/ipmi/kcs_bmc.c           | 78 ++++++++++++++++++++++++++-
> drivers/char/ipmi/kcs_bmc.h           |  4 --
> drivers/char/ipmi/kcs_bmc_cdev_ipmi.c | 33 +++++++++---
> drivers/char/ipmi/kcs_bmc_client.h    | 14 +++++
> 6 files changed, 132 insertions(+), 13 deletions(-)
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
>index 266ebec71d6f..694db6ee2a92 100644
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
>+/* Record probed devices and cdevs */
>+static DEFINE_MUTEX(kcs_bmc_lock);
>+static LIST_HEAD(kcs_bmc_devices);
>+static LIST_HEAD(kcs_bmc_cdevs);
>+
> /* Consumer data access */
>
> u8 kcs_bmc_read_data(struct kcs_bmc_device *kcs_bmc)
>@@ -100,16 +107,83 @@ EXPORT_SYMBOL(kcs_bmc_disable_device);
>
> int kcs_bmc_add_device(struct kcs_bmc_device *kcs_bmc)
> {
>-	return kcs_bmc_ipmi_attach_cdev(kcs_bmc);
>+	struct kcs_bmc_cdev *cdev;
>+	int rc;
>+
>+	spin_lock_init(&kcs_bmc->lock);
>+	kcs_bmc->client =3D NULL;
>+
>+	mutex_lock(&kcs_bmc_lock);
>+	list_add(&kcs_bmc->entry, &kcs_bmc_devices);
>+	list_for_each_entry(cdev, &kcs_bmc_cdevs, entry) {
>+		rc =3D cdev->ops->add_device(kcs_bmc);
>+		if (rc)
>+			dev_err(kcs_bmc->dev, "Failed to add chardev for KCS channel %d: %d",
>+				kcs_bmc->channel, rc);
>+	}
>+	mutex_unlock(&kcs_bmc_lock);
>+
>+	return 0;

We're ignoring failed ->add_device() calls here?

> }
> EXPORT_SYMBOL(kcs_bmc_add_device);
>
> int kcs_bmc_remove_device(struct kcs_bmc_device *kcs_bmc)
> {
>-	return kcs_bmc_ipmi_detach_cdev(kcs_bmc);
>+	struct kcs_bmc_cdev *cdev;
>+	int rc;
>+
>+	mutex_lock(&kcs_bmc_lock);
>+	list_del(&kcs_bmc->entry);
>+	list_for_each_entry(cdev, &kcs_bmc_cdevs, entry) {
>+		rc =3D cdev->ops->remove_device(kcs_bmc);
>+		if (rc)
>+			dev_err(kcs_bmc->dev, "Failed to remove chardev for KCS channel %d: %d=
",
>+				kcs_bmc->channel, rc);
>+	}
>+	mutex_unlock(&kcs_bmc_lock);
>+
>+	return 0;

Similarly with the return value here...

> }
> EXPORT_SYMBOL(kcs_bmc_remove_device);
>
>+int kcs_bmc_register_cdev(struct kcs_bmc_cdev *cdev)
>+{
>+	struct kcs_bmc_device *kcs_bmc;
>+	int rc;
>+
>+	mutex_lock(&kcs_bmc_lock);
>+	list_add(&cdev->entry, &kcs_bmc_cdevs);
>+	list_for_each_entry(kcs_bmc, &kcs_bmc_devices, entry) {
>+		rc =3D cdev->ops->add_device(kcs_bmc);
>+		if (rc)
>+			dev_err(kcs_bmc->dev, "Failed to add chardev for KCS channel %d: %d",
>+				kcs_bmc->channel, rc);
>+	}
>+	mutex_unlock(&kcs_bmc_lock);
>+
>+	return 0;

...return value again here...

>+}
>+EXPORT_SYMBOL(kcs_bmc_register_cdev);
>+
>+int kcs_bmc_unregister_cdev(struct kcs_bmc_cdev *cdev)
>+{
>+	struct kcs_bmc_device *kcs_bmc;
>+	int rc;
>+
>+	mutex_lock(&kcs_bmc_lock);
>+	list_del(&cdev->entry);
>+	list_for_each_entry(kcs_bmc, &kcs_bmc_devices, entry) {
>+		rc =3D cdev->ops->remove_device(kcs_bmc);
>+		if (rc)
>+			dev_err(kcs_bmc->dev, "Failed to add chardev for KCS channel %d: %d",

s/add/remove/

Might also want to differentiate the *_device() error messages from the
*_cdev() ones a bit more?

>+				kcs_bmc->channel, rc);
>+	}
>+	mutex_unlock(&kcs_bmc_lock);
>+
>+	return rc;

...but this one is a bit incongruous, propagating the return value of
only the last ->remove_device() call.

(I'd have expected this to trigger a warning about returning a
potentially uninitialized 'rc', but in some manual testing it doesn't
seem to do so for me...not certain why.)

>+}
>+EXPORT_SYMBOL(kcs_bmc_unregister_cdev);
>+
> MODULE_LICENSE("GPL v2");
> MODULE_AUTHOR("Haiyue Wang <haiyue.wang@linux.intel.com>");
> MODULE_AUTHOR("Andrew Jeffery <andrew@aj.id.au>");
>diff --git a/drivers/char/ipmi/kcs_bmc.h b/drivers/char/ipmi/kcs_bmc.h
>index 3f266740c759..5deb9a0b8e60 100644
>--- a/drivers/char/ipmi/kcs_bmc.h
>+++ b/drivers/char/ipmi/kcs_bmc.h
>@@ -42,8 +42,4 @@ struct kcs_bmc_device {
> 	spinlock_t lock;
> 	struct kcs_bmc_client *client;
> };
>-
>-/* Temporary exports while refactoring */
>-int kcs_bmc_ipmi_attach_cdev(struct kcs_bmc_device *kcs_bmc);
>-int kcs_bmc_ipmi_detach_cdev(struct kcs_bmc_device *kcs_bmc);
> #endif /* __KCS_BMC_H__ */
>diff --git a/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c b/drivers/char/ipmi/kcs=
_bmc_cdev_ipmi.c
>index 58c42e76483d..df83d67851ac 100644
>--- a/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
>+++ b/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
>@@ -469,8 +469,7 @@ static const struct file_operations kcs_bmc_ipmi_fops =
=3D {
> static DEFINE_SPINLOCK(kcs_bmc_ipmi_instances_lock);
> static LIST_HEAD(kcs_bmc_ipmi_instances);
>
>-int kcs_bmc_ipmi_attach_cdev(struct kcs_bmc_device *kcs_bmc);
>-int kcs_bmc_ipmi_attach_cdev(struct kcs_bmc_device *kcs_bmc)
>+static int kcs_bmc_ipmi_attach_cdev(struct kcs_bmc_device *kcs_bmc)
> {
> 	struct kcs_bmc_ipmi *priv;
> 	int rc;
>@@ -512,10 +511,8 @@ int kcs_bmc_ipmi_attach_cdev(struct kcs_bmc_device *k=
cs_bmc)
>
> 	return 0;
> }
>-EXPORT_SYMBOL(kcs_bmc_ipmi_attach_cdev);
>
>-int kcs_bmc_ipmi_detach_cdev(struct kcs_bmc_device *kcs_bmc);
>-int kcs_bmc_ipmi_detach_cdev(struct kcs_bmc_device *kcs_bmc)
>+static int kcs_bmc_ipmi_detach_cdev(struct kcs_bmc_device *kcs_bmc)
> {
> 	struct kcs_bmc_ipmi *priv =3D NULL, *pos;
>
>@@ -541,7 +538,31 @@ int kcs_bmc_ipmi_detach_cdev(struct kcs_bmc_device *k=
cs_bmc)
>
> 	return 0;
> }
>-EXPORT_SYMBOL(kcs_bmc_ipmi_detach_cdev);
>+
>+static const struct kcs_bmc_cdev_ops kcs_bmc_ipmi_cdev_ops =3D {
>+	.add_device =3D kcs_bmc_ipmi_attach_cdev,
>+	.remove_device =3D kcs_bmc_ipmi_detach_cdev,
>+};
>+
>+static struct kcs_bmc_cdev kcs_bmc_ipmi_cdev =3D {
>+	.ops =3D &kcs_bmc_ipmi_cdev_ops,
>+};
>+
>+static int kcs_bmc_ipmi_init(void)
>+{
>+	return kcs_bmc_register_cdev(&kcs_bmc_ipmi_cdev);
>+}
>+module_init(kcs_bmc_ipmi_init);
>+
>+static void kcs_bmc_ipmi_exit(void)
>+{
>+	int rc;
>+
>+	rc =3D kcs_bmc_unregister_cdev(&kcs_bmc_ipmi_cdev);
>+	if (rc)
>+		pr_warn("Failed to remove KCS BMC client: %d", rc);
>+}
>+module_exit(kcs_bmc_ipmi_exit);
>
> MODULE_LICENSE("GPL v2");
> MODULE_AUTHOR("Haiyue Wang <haiyue.wang@linux.intel.com>");
>diff --git a/drivers/char/ipmi/kcs_bmc_client.h b/drivers/char/ipmi/kcs_bm=
c_client.h
>index 2dd710f4b4aa..d0a7404ff584 100644
>--- a/drivers/char/ipmi/kcs_bmc_client.h
>+++ b/drivers/char/ipmi/kcs_bmc_client.h
>@@ -10,6 +10,17 @@
>
> #include "kcs_bmc.h"
>
>+struct kcs_bmc_cdev_ops {
>+	int (*add_device)(struct kcs_bmc_device *kcs_bmc);
>+	int (*remove_device)(struct kcs_bmc_device *kcs_bmc);
>+};
>+
>+struct kcs_bmc_cdev {
>+	struct list_head entry;
>+
>+	const struct kcs_bmc_cdev_ops *ops;
>+};
>+
> struct kcs_bmc_client_ops {
> 	int (*event)(struct kcs_bmc_client *client);
> };
>@@ -20,6 +31,9 @@ struct kcs_bmc_client {
> 	struct kcs_bmc_device *dev;
> };
>
>+int kcs_bmc_register_cdev(struct kcs_bmc_cdev *cdev);
>+int kcs_bmc_unregister_cdev(struct kcs_bmc_cdev *cdev);
>+
> int kcs_bmc_enable_device(struct kcs_bmc_device *kcs_bmc, struct kcs_bmc_=
client *client);
> void kcs_bmc_disable_device(struct kcs_bmc_device *kcs_bmc, struct kcs_bm=
c_client *client);
>
>--=20
>2.27.0
>=
