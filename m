Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D90AB3D81D7
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 23:34:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GZ96w5MLhz3bW0
	for <lists+openbmc@lfdr.de>; Wed, 28 Jul 2021 07:34:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=equinixinc.onmicrosoft.com header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-equinixinc-onmicrosoft-com header.b=GPUJANE3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.159.192;
 helo=mx0b-00268f01.pphosted.com;
 envelope-from=prvs=8842907869=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=equinixinc.onmicrosoft.com
 header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-equinixinc-onmicrosoft-com header.b=GPUJANE3; 
 dkim-atps=neutral
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com
 [148.163.159.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZ96W1CxYz3022;
 Wed, 28 Jul 2021 07:34:26 +1000 (AEST)
Received: from pps.filterd (m0165120.ppops.net [127.0.0.1])
 by mx0b-00268f01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16RLIQqq024439; Tue, 27 Jul 2021 21:34:01 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
 by mx0b-00268f01.pphosted.com with ESMTP id 3a2nx1h0yr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Jul 2021 21:34:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MQaIdCCcdLPZaLUE92giClZiMg3+ADzsgTzZ/Wj8Do8dtkRzzYPaygepc/GooEZ9Z1StpLYkolF7cQWlC2/o94YI0WFvWuLotfKv4aADhYIuw64XHvtegTmlpSnkDRO18223PumMW+B7McqWpa3nB2pZgNMaSJ8KawLsp4uqg6AF78PuMp2BAPDyuulBkufThyOm6ABMXZAvVg4WSNjVkJoWl5BOJg6SXxYAfhLSNv0UnWaAYb6V5INknPioRMJ0q6Hd4n9KCIbY1ENARSTpagqFSM5zrZ5S+ZsJSRRI3P01aiXb6yDIOK5EFLmoRj5xW9r933QJ+YTpUTBrQehqSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qF2OoXYqWO6N8AfSbOmg47wZq/CvydCttx2T8ByIxq4=;
 b=nnsWpuxNuM2DltmXpvQmGHrW9wj4iELWSJAHAEEBmLUKTUqlMMXOr0GVNcOKaOv3w7SImx3//ZMEaBX5oxAVyWZcW2+yA1SXoEkJtBHLkS5htbG1MFy0cGgrln4mlbRaLXAK4m/uQ/aqGz5eRxgZmLvERDhJ5iFuJFE64tBYRcHi4dVCwZw3YV8gRI4Mc4y8fepzaQ/cbGrZVPI3pdKhQCDaMgITY9dMLj8t5sI7KbOBDxNvdoDbPfOvile+mTKisuZAOXLpnnov/YgrAJ7/X9owT6HRUwO+pInr4/5ptJQCNXPzC6vm0eKe3o9tcTDCShfvCARBH/eL46p/UXel7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=equinixinc.onmicrosoft.com; s=selector2-equinixinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qF2OoXYqWO6N8AfSbOmg47wZq/CvydCttx2T8ByIxq4=;
 b=GPUJANE3w+D52cvbu8tijdpHZYZ6IDe8P1DyaULnX6UTUPt7OSDXzyON2zOtLX/o3SJzMh3Fl4n07Xx5EjIl8q/4wqgCRwjhcOCBDarj31uWNiXBh/WFuFwY+w6DdH8ESRCC+9awlVUZT8uYm8bpK1F1UP7iV6JU63MpJzSPgZY=
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by DM8PR04MB7991.namprd04.prod.outlook.com (2603:10b6:5:314::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Tue, 27 Jul
 2021 21:33:58 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::953d:f9ec:b2cc:ca2b]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::953d:f9ec:b2cc:ca2b%5]) with mapi id 15.20.4373.018; Tue, 27 Jul 2021
 21:33:58 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Iwona Winiarska <iwona.winiarska@intel.com>
Subject: Re: [PATCH 10/14] peci: Add peci-cpu driver
Thread-Topic: [PATCH 10/14] peci: Add peci-cpu driver
Thread-Index: AQHXgy8bT7LpuKFkwkuGK081TNbcfg==
Date: Tue, 27 Jul 2021 21:33:58 +0000
Message-ID: <20210727213357.GT8018@packtop>
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
 <20210712220447.957418-11-iwona.winiarska@intel.com>
In-Reply-To: <20210712220447.957418-11-iwona.winiarska@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=equinix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 437425c0-8173-42b0-46d2-08d951463e51
x-ms-traffictypediagnostic: DM8PR04MB7991:
x-microsoft-antispam-prvs: <DM8PR04MB7991831474544B581A1A231BC3E99@DM8PR04MB7991.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1303;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KKND7K91ol1JMXjo3H+0n08tbz6ueSsPr1GX4edec24oMeS6Is5MZ9NT1Qh+DHUjWwJuAcZd4jPsVYgI8/9DE0wS0YOlgn4JjBLKuaLfK3IGd2OaaGeTf88zoSLixT1YEAVgS1kQ5fPkzR79AVe4hW7Ya/jopZZbapkPfA+gWaeAmYhHVWc9DSINc92ea0Uw9eB+qHhL0qfZA8P5Q/icgXKDXVbCRlZ8e+8YEFkxEGKRCvSnGDqL2H/VOuIexn3H4mkrG867l8kNGwO2Hmo7TAmCLiGG/GC5gJXrB5fkKz5yMe20lk29KurBgbIDqm/ylNWCIS75ZHeFliEVKXZvxRktQvWwFgWSCS5H70T6a3dZk1XwFl7w20RZJ0293JXNhWXq5hSml6SPr/nLPwE3kW4Deyv3yal61NC7YUchVv3+Srj+ea/tsIo1LfsstkksUGumM3qQZAQAdWfkxmiLX7B6Ih7+k1X9VeVPo1nOy9qUiiF93XQoj4RS1PwlYMMVc9epH/7qfZ4jHej3JN8GtjZSsZRNe6/TgpOW+T7kvZ6s+/7UPSCtM0uT0DVWmCCgm7c4VJW5JdjkgdelJEMsEzHF0ypEb4gtXA7shU2aknTfihZ08gsVHJFqY5gHV8YZhW1vmQ77uGKZgsGH8SUkxiIvMsC4cfVBTBklJF48ePzuGcjnqos4MokydD29lZCm3qnD8nW9E2V1IuiYwv4Rbw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR04MB8007.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(396003)(366004)(376002)(136003)(346002)(39860400002)(4326008)(2906002)(1076003)(33656002)(33716001)(478600001)(316002)(66556008)(66476007)(66946007)(122000001)(38070700005)(7416002)(6486002)(83380400001)(38100700002)(86362001)(6916009)(26005)(30864003)(6512007)(6506007)(66446008)(64756008)(76116006)(9686003)(186003)(8936002)(54906003)(5660300002)(71200400001)(8676002)(559001)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BaAPZUknFzPwpRKM4cUML+R1Lrgsxuc2dhfFkmPNSFPGKEJsPk/OrizN0/Xu?=
 =?us-ascii?Q?lJEyISxMnAMBesRFAy9XMVyuIWl9aaUooejyxcf2HxXKfuN/ulPKM68gtRpU?=
 =?us-ascii?Q?Ljbb41B5nT9x9fx9ljpgp2c014gNsjxaJKSX6di7ny1jCideXIetEn0LMkUm?=
 =?us-ascii?Q?p73GcOcKHeF2l4TsC1GMjdrga+ersYdXx3YMW6vNqlcpoZ6SdMYb5fg9OPfy?=
 =?us-ascii?Q?DOqlbPTRbDKJIyfsqHFDMShj2nK5skAo6WxZfpgYI9ocdFVoOFCvPxvpj/mH?=
 =?us-ascii?Q?uKTOmbN6esYENc7RrCGW2osnrBlGd8wCKlLDunuQ8FKtdih32pJ+PQeabFEU?=
 =?us-ascii?Q?c7VG7kbponovaVnIbAOHWijLjHSG/T+Fd/LBJLuLRmuVkiq4q0DLAkw1ghiZ?=
 =?us-ascii?Q?rOYZBgV2ymjBTg7z+2vkwDh2iJFoD1llFCbN1CsJOsE+essAfUSeyxyHgat9?=
 =?us-ascii?Q?XWl0DIzCJQzK9YvNv/wOIlmGSPdJdVxjnsDbFc8ZK5Vk/c+i9O9bZxvk9KQ1?=
 =?us-ascii?Q?ZqYwEE6L3mPWTPojQiUb6QemidjNIckiT/rIOebE0W97oNrLcSNSM6WDHb3A?=
 =?us-ascii?Q?NvqARLgQNo8Qkfi00R9bfSqKXDl7zAIx7PKtKylCr5V4AvG1OnZGmltjkj1+?=
 =?us-ascii?Q?S9awZ4rVmnAevCsIO/DZEQysaNMB7yGqOSkEvgFy/CjE+SSLCRZTliiboU5m?=
 =?us-ascii?Q?jVMzYMIP5+fDeBpfTTefEan/Q8ubmAZEM9oTzKDnt/Wpyx4aw5fvNPgWdBM7?=
 =?us-ascii?Q?V9s8jC+MJMxxjTt4VZB11Gdtx35VcTB90K5DRlNFf1BUBs2+aOFevxqe90XS?=
 =?us-ascii?Q?9/Zbp7Q2WPPt8iJSFg7LtFP5gMSLgq9wCYnrIvkNyK9iD9DToj80MYQ0YCws?=
 =?us-ascii?Q?eNjgRPJHMp8cRCtwu+Yv1bW2N25kUVR6QMP+EnIZk3qenV+QWa/bLcO0taVv?=
 =?us-ascii?Q?Mk8uXqZ5+UQ0iGloVL1muiDqDrrt5Z1Q7UIZz3zaQnDJdn5ekQGC89vHDZFe?=
 =?us-ascii?Q?XSBEnG4QKk95Lzzu+bphfh/4Fznnkos8m6QxBX1DHCUITsu5WObZ8wMvlrGj?=
 =?us-ascii?Q?8gczdmU9GQgcXM2cqul9Fd90diE8K22Ya94hUqcTEyx7hpKNZPkW9qgW4mNn?=
 =?us-ascii?Q?WSCxpBSC3MmBTmdKMmlhW/4z2pDnUptwYHjjiR+2jq7iSCkW9nPtDdlmWhC/?=
 =?us-ascii?Q?fgXpyeArNSnV6yzLDlaoUhDMmQkOsNcQeQPTRmKGBptRqjjOsOh7zg3fz5q5?=
 =?us-ascii?Q?MA5vo+fM0JY+OKRU7yq3HHnE5LU2y9wgPIFydWxsVey2Cz5YhSeKkG1JvGIo?=
 =?us-ascii?Q?X568pnr7jwzUT4XrvfXyOf3o?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9CB3559842728A48990282C8FDBB914D@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 437425c0-8173-42b0-46d2-08d951463e51
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2021 21:33:58.4003 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iUdwr9MN7+NitPopPNasl63bWA+qVIKUUNwgsA0nfUu5Fnius7MHmLYndz6Kswl8x1IXxc2XXG7hPEWuZlME1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR04MB7991
X-Proofpoint-GUID: gYpCZlPe4TI0gexcuRJhxPP-hWTFem3y
X-Proofpoint-ORIG-GUID: gYpCZlPe4TI0gexcuRJhxPP-hWTFem3y
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-27_14:2021-07-27,
 2021-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 mlxscore=0 phishscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107270125
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "x86@kernel.org" <x86@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 Tony Luck <tony.luck@intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yazen Ghannam <yazen.ghannam@amd.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jul 12, 2021 at 05:04:43PM CDT, Iwona Winiarska wrote:
>PECI is an interface that may be used by different types of devices.
>Here we're adding a peci-cpu driver compatible with Intel processors.
>The driver is responsible for handling auxiliary devices that can
>subsequently be used by other drivers (e.g. hwmons).
>
>Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
>Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>---
> MAINTAINERS              |   1 +
> drivers/peci/Kconfig     |  15 ++
> drivers/peci/Makefile    |   2 +
> drivers/peci/cpu.c       | 347 +++++++++++++++++++++++++++++++++++++++
> drivers/peci/device.c    |   1 +
> drivers/peci/internal.h  |  27 +++
> drivers/peci/request.c   | 211 ++++++++++++++++++++++++
> include/linux/peci-cpu.h |  38 +++++
> include/linux/peci.h     |   8 -
> 9 files changed, 642 insertions(+), 8 deletions(-)
> create mode 100644 drivers/peci/cpu.c
> create mode 100644 include/linux/peci-cpu.h
>
>diff --git a/MAINTAINERS b/MAINTAINERS
>index 4ba874afa2fa..f47b5f634293 100644
>--- a/MAINTAINERS
>+++ b/MAINTAINERS
>@@ -14511,6 +14511,7 @@ L:	openbmc@lists.ozlabs.org (moderated for non-sub=
scribers)
> S:	Supported
> F:	Documentation/devicetree/bindings/peci/
> F:	drivers/peci/
>+F:	include/linux/peci-cpu.h
> F:	include/linux/peci.h
>
> PENSANDO ETHERNET DRIVERS
>diff --git a/drivers/peci/Kconfig b/drivers/peci/Kconfig
>index 27c31535843c..9e17e06fda90 100644
>--- a/drivers/peci/Kconfig
>+++ b/drivers/peci/Kconfig
>@@ -16,6 +16,21 @@ menuconfig PECI
>
> if PECI
>
>+config PECI_CPU
>+	tristate "PECI CPU"
>+	select AUXILIARY_BUS
>+	help
>+	  This option enables peci-cpu driver for Intel processors. It is
>+	  responsible for creating auxiliary devices that can subsequently
>+	  be used by other drivers in order to perform various
>+	  functionalities such as e.g. temperature monitoring.
>+
>+	  Additional drivers must be enabled in order to use the functionality
>+	  of the device.
>+
>+	  This driver can also be built as a module. If so, the module
>+	  will be called peci-cpu.
>+
> source "drivers/peci/controller/Kconfig"
>
> endif # PECI
>diff --git a/drivers/peci/Makefile b/drivers/peci/Makefile
>index 917f689e147a..7de18137e738 100644
>--- a/drivers/peci/Makefile
>+++ b/drivers/peci/Makefile
>@@ -3,6 +3,8 @@
> # Core functionality
> peci-y :=3D core.o request.o device.o sysfs.o
> obj-$(CONFIG_PECI) +=3D peci.o
>+peci-cpu-y :=3D cpu.o
>+obj-$(CONFIG_PECI_CPU) +=3D peci-cpu.o
>
> # Hardware specific bus drivers
> obj-y +=3D controller/
>diff --git a/drivers/peci/cpu.c b/drivers/peci/cpu.c
>new file mode 100644
>index 000000000000..8d130a9a71ad
>--- /dev/null
>+++ b/drivers/peci/cpu.c
>@@ -0,0 +1,347 @@
>+// SPDX-License-Identifier: GPL-2.0-only
>+// Copyright (c) 2021 Intel Corporation
>+
>+#include <linux/auxiliary_bus.h>
>+#include <linux/module.h>
>+#include <linux/peci.h>
>+#include <linux/peci-cpu.h>
>+#include <linux/slab.h>
>+#include <linux/x86/intel-family.h>
>+
>+#include "internal.h"
>+
>+/**
>+ * peci_temp_read() - read the maximum die temperature from PECI target d=
evice
>+ * @device: PECI device to which request is going to be sent
>+ * @temp_raw: where to store the read temperature
>+ *
>+ * It uses GetTemp PECI command.
>+ *
>+ * Return: 0 if succeeded, other values in case errors.
>+ */
>+int peci_temp_read(struct peci_device *device, s16 *temp_raw)
>+{
>+	struct peci_request *req;
>+
>+	req =3D peci_get_temp(device);
>+	if (IS_ERR(req))
>+		return PTR_ERR(req);
>+
>+	*temp_raw =3D peci_request_data_temp(req);
>+
>+	peci_request_free(req);
>+
>+	return 0;
>+}
>+EXPORT_SYMBOL_NS_GPL(peci_temp_read, PECI_CPU);
>+
>+/**
>+ * peci_pcs_read() - read PCS register
>+ * @device: PECI device to which request is going to be sent
>+ * @index: PCS index
>+ * @param: PCS parameter
>+ * @data: where to store the read data
>+ *
>+ * It uses RdPkgConfig PECI command.
>+ *
>+ * Return: 0 if succeeded, other values in case errors.
>+ */
>+int peci_pcs_read(struct peci_device *device, u8 index, u16 param, u32 *d=
ata)
>+{
>+	struct peci_request *req;
>+	int ret;
>+
>+	req =3D peci_pkg_cfg_readl(device, index, param);
>+	if (IS_ERR(req))
>+		return PTR_ERR(req);
>+
>+	ret =3D peci_request_status(req);
>+	if (ret)
>+		goto out_req_free;
>+
>+	*data =3D peci_request_data_readl(req);
>+out_req_free:

As in patch 9, this control flow could be rewritten as just

	if (!ret)
		*data =3D peci_request_data_readl(req);

and avoid the goto.

>+	peci_request_free(req);
>+
>+	return ret;
>+}
>+EXPORT_SYMBOL_NS_GPL(peci_pcs_read, PECI_CPU);
>+
>+/**
>+ * peci_pci_local_read() - read 32-bit memory location using raw address
>+ * @device: PECI device to which request is going to be sent
>+ * @bus: bus
>+ * @dev: device
>+ * @func: function
>+ * @reg: register
>+ * @data: where to store the read data
>+ *
>+ * It uses RdPCIConfigLocal PECI command.
>+ *
>+ * Return: 0 if succeeded, other values in case errors.
>+ */
>+int peci_pci_local_read(struct peci_device *device, u8 bus, u8 dev, u8 fu=
nc,
>+			u16 reg, u32 *data)
>+{
>+	struct peci_request *req;
>+	int ret;
>+
>+	req =3D peci_pci_cfg_local_readl(device, bus, dev, func, reg);
>+	if (IS_ERR(req))
>+		return PTR_ERR(req);
>+
>+	ret =3D peci_request_status(req);
>+	if (ret)
>+		goto out_req_free;
>+
>+	*data =3D peci_request_data_readl(req);
>+out_req_free:
>+	peci_request_free(req);
>+
>+	return ret;
>+}
>+EXPORT_SYMBOL_NS_GPL(peci_pci_local_read, PECI_CPU);
>+
>+/**
>+ * peci_ep_pci_local_read() - read 32-bit memory location using raw addre=
ss
>+ * @device: PECI device to which request is going to be sent
>+ * @seg: PCI segment
>+ * @bus: bus
>+ * @dev: device
>+ * @func: function
>+ * @reg: register
>+ * @data: where to store the read data
>+ *
>+ * Like &peci_pci_local_read, but it uses RdEndpointConfig PECI command.
>+ *
>+ * Return: 0 if succeeded, other values in case errors.
>+ */
>+int peci_ep_pci_local_read(struct peci_device *device, u8 seg,
>+			   u8 bus, u8 dev, u8 func, u16 reg, u32 *data)
>+{
>+	struct peci_request *req;
>+	int ret;
>+
>+	req =3D peci_ep_pci_cfg_local_readl(device, seg, bus, dev, func, reg);
>+	if (IS_ERR(req))
>+		return PTR_ERR(req);
>+
>+	ret =3D peci_request_status(req);
>+	if (ret)
>+		goto out_req_free;
>+
>+	*data =3D peci_request_data_readl(req);
>+out_req_free:
>+	peci_request_free(req);
>+
>+	return ret;
>+}
>+EXPORT_SYMBOL_NS_GPL(peci_ep_pci_local_read, PECI_CPU);
>+
>+/**
>+ * peci_mmio_read() - read 32-bit memory location using 64-bit bar offset=
 address
>+ * @device: PECI device to which request is going to be sent
>+ * @bar: PCI bar
>+ * @seg: PCI segment
>+ * @bus: bus
>+ * @dev: device
>+ * @func: function
>+ * @address: 64-bit MMIO address
>+ * @data: where to store the read data
>+ *
>+ * It uses RdEndpointConfig PECI command.
>+ *
>+ * Return: 0 if succeeded, other values in case errors.
>+ */
>+int peci_mmio_read(struct peci_device *device, u8 bar, u8 seg,
>+		   u8 bus, u8 dev, u8 func, u64 address, u32 *data)
>+{
>+	struct peci_request *req;
>+	int ret;
>+
>+	req =3D peci_ep_mmio64_readl(device, bar, seg, bus, dev, func, address);
>+	if (IS_ERR(req))
>+		return PTR_ERR(req);
>+
>+	ret =3D peci_request_status(req);
>+	if (ret)
>+		goto out_req_free;
>+
>+	*data =3D peci_request_data_readl(req);
>+out_req_free:
>+	peci_request_free(req);
>+
>+	return ret;
>+}
>+EXPORT_SYMBOL_NS_GPL(peci_mmio_read, PECI_CPU);
>+
>+struct peci_cpu {
>+	struct peci_device *device;
>+	const struct peci_device_id *id;
>+	struct auxiliary_device **aux_devices;

Given that the size for this allocation is a compile-time constant,
should we just inline this as 'struct auxiliary_device
*aux_devices[ARRAY_SIZE(type)]' and avoid some kmalloc work in
peci_cpu_add_adevices()?

>+};
>+
>+static const char * const type[] =3D {

A slightly more descriptive name might be good -- maybe something like
'peci_adevice_types'?

>+	"cputemp",
>+	"dimmtemp",
>+};
>+
>+static void adev_release(struct device *dev)
>+{
>+	struct auxiliary_device *adev =3D to_auxiliary_dev(dev);
>+
>+	kfree(adev->name);
>+	kfree(adev);
>+}
>+
>+static struct auxiliary_device *add_adev(struct peci_cpu *priv, int idx)
>+{
>+	struct peci_controller *controller =3D priv->device->controller;
>+	struct auxiliary_device *adev;
>+	const char *name;
>+	int ret;
>+
>+	adev =3D kzalloc(sizeof(*adev), GFP_KERNEL);
>+	if (!adev)
>+		return ERR_PTR(-ENOMEM);
>+
>+	name =3D kasprintf(GFP_KERNEL, "%s.%s", type[idx], (const char *)priv->i=
d->data);
>+	if (!name) {
>+		ret =3D -ENOMEM;
>+		goto free_adev;
>+	}
>+
>+	adev->name =3D name;
>+	adev->dev.parent =3D &priv->device->dev;
>+	adev->dev.release =3D adev_release;
>+	adev->id =3D (controller->id << 16) | (priv->device->addr);
>+
>+	ret =3D auxiliary_device_init(adev);
>+	if (ret)
>+		goto free_name;
>+
>+	ret =3D auxiliary_device_add(adev);
>+	if (ret) {
>+		auxiliary_device_uninit(adev);
>+		return ERR_PTR(ret);
>+	}
>+
>+	return adev;
>+
>+free_name:
>+	kfree(name);
>+free_adev:
>+	kfree(adev);
>+	return ERR_PTR(ret);
>+}
>+
>+static void del_adev(struct auxiliary_device *adev)
>+{
>+	auxiliary_device_delete(adev);
>+	auxiliary_device_uninit(adev);
>+}
>+
>+static int peci_cpu_add_adevices(struct peci_cpu *priv)
>+{
>+	struct device *dev =3D &priv->device->dev;
>+	struct auxiliary_device *adev;
>+	int i;
>+
>+	priv->aux_devices =3D devm_kcalloc(dev, ARRAY_SIZE(type),
>+					 sizeof(*priv->aux_devices),
>+					 GFP_KERNEL);
>+	if (!priv->aux_devices)
>+		return -ENOMEM;
>+
>+	for (i =3D 0; i < ARRAY_SIZE(type); i++) {
>+		adev =3D add_adev(priv, i);
>+		if (IS_ERR(adev)) {
>+			dev_warn(dev, "Failed to add PECI auxiliary: %s, ret =3D %ld\n",
>+				 type[i], PTR_ERR(adev));
>+			continue;
>+		}
>+
>+		priv->aux_devices[i] =3D adev;
>+	}
>+	return 0;
>+}
>+
>+static int
>+peci_cpu_probe(struct peci_device *device, const struct peci_device_id *i=
d)
>+{
>+	struct device *dev =3D &device->dev;
>+	struct peci_cpu *priv;
>+
>+	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>+	if (!priv)
>+		return -ENOMEM;
>+
>+	dev_set_drvdata(dev, priv);
>+	priv->device =3D device;
>+	priv->id =3D id;
>+
>+	return peci_cpu_add_adevices(priv);
>+}
>+
>+static void peci_cpu_remove(struct peci_device *device)
>+{
>+	struct peci_cpu *priv =3D dev_get_drvdata(&device->dev);
>+	int i;
>+
>+	for (i =3D 0; i < ARRAY_SIZE(type); i++) {
>+		struct auxiliary_device *adev =3D priv->aux_devices[i];
>+
>+		if (adev)
>+			del_adev(adev);
>+	}
>+}
>+
>+static const struct peci_device_id peci_cpu_device_ids[] =3D {
>+	{ /* Haswell Xeon */
>+		.family	=3D 6,
>+		.model	=3D INTEL_FAM6_HASWELL_X,
>+		.data	=3D "hsx",
>+	},
>+	{ /* Broadwell Xeon */
>+		.family	=3D 6,
>+		.model	=3D INTEL_FAM6_BROADWELL_X,
>+		.data	=3D "bdx",
>+	},
>+	{ /* Broadwell Xeon D */
>+		.family	=3D 6,
>+		.model	=3D INTEL_FAM6_BROADWELL_D,
>+		.data	=3D "skxd",
>+	},
>+	{ /* Skylake Xeon */
>+		.family	=3D 6,
>+		.model	=3D INTEL_FAM6_SKYLAKE_X,
>+		.data	=3D "skx",
>+	},
>+	{ /* Icelake Xeon */
>+		.family	=3D 6,
>+		.model	=3D INTEL_FAM6_ICELAKE_X,
>+		.data	=3D "icx",
>+	},
>+	{ /* Icelake Xeon D */
>+		.family	=3D 6,
>+		.model	=3D INTEL_FAM6_ICELAKE_D,
>+		.data	=3D "icxd",
>+	},
>+	{ }
>+};
>+MODULE_DEVICE_TABLE(peci, peci_cpu_device_ids);
>+
>+static struct peci_driver peci_cpu_driver =3D {
>+	.probe		=3D peci_cpu_probe,
>+	.remove		=3D peci_cpu_remove,
>+	.id_table	=3D peci_cpu_device_ids,
>+	.driver		=3D {
>+		.name		=3D "peci-cpu",
>+	},
>+};
>+module_peci_driver(peci_cpu_driver);
>+
>+MODULE_AUTHOR("Iwona Winiarska <iwona.winiarska@intel.com>");
>+MODULE_DESCRIPTION("PECI CPU driver");
>+MODULE_LICENSE("GPL");
>+MODULE_IMPORT_NS(PECI);
>diff --git a/drivers/peci/device.c b/drivers/peci/device.c
>index 8c4bd1ebbc29..c278c9ea166c 100644
>--- a/drivers/peci/device.c
>+++ b/drivers/peci/device.c
>@@ -3,6 +3,7 @@
>
> #include <linux/bitfield.h>
> #include <linux/peci.h>
>+#include <linux/peci-cpu.h>
> #include <linux/slab.h>
> #include <linux/x86/cpu.h>
>
>diff --git a/drivers/peci/internal.h b/drivers/peci/internal.h
>index c891c93e077a..1d39483a8acf 100644
>--- a/drivers/peci/internal.h
>+++ b/drivers/peci/internal.h
>@@ -21,6 +21,7 @@ void peci_request_free(struct peci_request *req);
>
> int peci_request_status(struct peci_request *req);
> u64 peci_request_data_dib(struct peci_request *req);
>+s16 peci_request_data_temp(struct peci_request *req);
>
> u8 peci_request_data_readb(struct peci_request *req);
> u16 peci_request_data_readw(struct peci_request *req);
>@@ -35,6 +36,32 @@ struct peci_request *peci_pkg_cfg_readw(struct peci_dev=
ice *device, u8 index, u1
> struct peci_request *peci_pkg_cfg_readl(struct peci_device *device, u8 in=
dex, u16 param);
> struct peci_request *peci_pkg_cfg_readq(struct peci_device *device, u8 in=
dex, u16 param);
>
>+struct peci_request *peci_pci_cfg_local_readb(struct peci_device *device,
>+					      u8 bus, u8 dev, u8 func, u16 reg);
>+struct peci_request *peci_pci_cfg_local_readw(struct peci_device *device,
>+					      u8 bus, u8 dev, u8 func, u16 reg);
>+struct peci_request *peci_pci_cfg_local_readl(struct peci_device *device,
>+					      u8 bus, u8 dev, u8 func, u16 reg);
>+
>+struct peci_request *peci_ep_pci_cfg_local_readb(struct peci_device *devi=
ce, u8 seg,
>+						 u8 bus, u8 dev, u8 func, u16 reg);
>+struct peci_request *peci_ep_pci_cfg_local_readw(struct peci_device *devi=
ce, u8 seg,
>+						 u8 bus, u8 dev, u8 func, u16 reg);
>+struct peci_request *peci_ep_pci_cfg_local_readl(struct peci_device *devi=
ce, u8 seg,
>+						 u8 bus, u8 dev, u8 func, u16 reg);
>+
>+struct peci_request *peci_ep_pci_cfg_readb(struct peci_device *device, u8=
 seg,
>+					   u8 bus, u8 dev, u8 func, u16 reg);
>+struct peci_request *peci_ep_pci_cfg_readw(struct peci_device *device, u8=
 seg,
>+					   u8 bus, u8 dev, u8 func, u16 reg);
>+struct peci_request *peci_ep_pci_cfg_readl(struct peci_device *device, u8=
 seg,
>+					   u8 bus, u8 dev, u8 func, u16 reg);
>+
>+struct peci_request *peci_ep_mmio32_readl(struct peci_device *device, u8 =
bar, u8 seg,
>+					  u8 bus, u8 dev, u8 func, u64 offset);
>+
>+struct peci_request *peci_ep_mmio64_readl(struct peci_device *device, u8 =
bar, u8 seg,
>+					  u8 bus, u8 dev, u8 func, u64 offset);
> /**
>  * struct peci_device_id - PECI device data to match
>  * @data: pointer to driver private data specific to device
>diff --git a/drivers/peci/request.c b/drivers/peci/request.c
>index 48354455b554..c5d39f7e8142 100644
>--- a/drivers/peci/request.c
>+++ b/drivers/peci/request.c
>@@ -3,6 +3,7 @@
>
> #include <linux/bug.h>
> #include <linux/export.h>
>+#include <linux/pci.h>
> #include <linux/peci.h>
> #include <linux/slab.h>
> #include <linux/types.h>
>@@ -15,6 +16,10 @@
> #define  PECI_GET_DIB_WR_LEN		1
> #define  PECI_GET_DIB_RD_LEN		8
>
>+#define PECI_GET_TEMP_CMD		0x01
>+#define  PECI_GET_TEMP_WR_LEN		1
>+#define  PECI_GET_TEMP_RD_LEN		2
>+
> #define PECI_RDPKGCFG_CMD		0xa1
> #define  PECI_RDPKGCFG_WRITE_LEN	5
> #define  PECI_RDPKGCFG_READ_LEN_BASE	1
>@@ -22,6 +27,44 @@
> #define  PECI_WRPKGCFG_WRITE_LEN_BASE	6
> #define  PECI_WRPKGCFG_READ_LEN		1
>
>+#define PECI_RDIAMSR_CMD		0xb1
>+#define  PECI_RDIAMSR_WRITE_LEN		5
>+#define  PECI_RDIAMSR_READ_LEN		9
>+#define PECI_WRIAMSR_CMD		0xb5
>+#define PECI_RDIAMSREX_CMD		0xd1
>+#define  PECI_RDIAMSREX_WRITE_LEN	6
>+#define  PECI_RDIAMSREX_READ_LEN	9
>+
>+#define PECI_RDPCICFG_CMD		0x61
>+#define  PECI_RDPCICFG_WRITE_LEN	6
>+#define  PECI_RDPCICFG_READ_LEN		5
>+#define  PECI_RDPCICFG_READ_LEN_MAX	24
>+#define PECI_WRPCICFG_CMD		0x65
>+
>+#define PECI_RDPCICFGLOCAL_CMD			0xe1
>+#define  PECI_RDPCICFGLOCAL_WRITE_LEN		5
>+#define  PECI_RDPCICFGLOCAL_READ_LEN_BASE	1
>+#define PECI_WRPCICFGLOCAL_CMD			0xe5
>+#define  PECI_WRPCICFGLOCAL_WRITE_LEN_BASE	6
>+#define  PECI_WRPCICFGLOCAL_READ_LEN		1
>+
>+#define PECI_ENDPTCFG_TYPE_LOCAL_PCI		0x03
>+#define PECI_ENDPTCFG_TYPE_PCI			0x04
>+#define PECI_ENDPTCFG_TYPE_MMIO			0x05
>+#define PECI_ENDPTCFG_ADDR_TYPE_PCI		0x04
>+#define PECI_ENDPTCFG_ADDR_TYPE_MMIO_D		0x05
>+#define PECI_ENDPTCFG_ADDR_TYPE_MMIO_Q		0x06
>+#define PECI_RDENDPTCFG_CMD			0xc1
>+#define  PECI_RDENDPTCFG_PCI_WRITE_LEN		12
>+#define  PECI_RDENDPTCFG_MMIO_D_WRITE_LEN	14
>+#define  PECI_RDENDPTCFG_MMIO_Q_WRITE_LEN	18
>+#define  PECI_RDENDPTCFG_READ_LEN_BASE		1
>+#define PECI_WRENDPTCFG_CMD			0xc5
>+#define  PECI_WRENDPTCFG_PCI_WRITE_LEN_BASE	13
>+#define  PECI_WRENDPTCFG_MMIO_D_WRITE_LEN_BASE	15
>+#define  PECI_WRENDPTCFG_MMIO_Q_WRITE_LEN_BASE	19
>+#define  PECI_WRENDPTCFG_READ_LEN		1
>+
> /* Device Specific Completion Code (CC) Definition */
> #define PECI_CC_SUCCESS				0x40
> #define PECI_CC_NEED_RETRY			0x80
>@@ -223,6 +266,27 @@ struct peci_request *peci_get_dib(struct peci_device =
*device)
> }
> EXPORT_SYMBOL_NS_GPL(peci_get_dib, PECI);
>
>+struct peci_request *peci_get_temp(struct peci_device *device)
>+{
>+	struct peci_request *req;
>+	int ret;
>+
>+	req =3D peci_request_alloc(device, PECI_GET_TEMP_WR_LEN, PECI_GET_TEMP_R=
D_LEN);
>+	if (!req)
>+		return ERR_PTR(-ENOMEM);
>+
>+	req->tx.buf[0] =3D PECI_GET_TEMP_CMD;
>+
>+	ret =3D peci_request_xfer(req);
>+	if (ret) {
>+		peci_request_free(req);
>+		return ERR_PTR(ret);
>+	}
>+
>+	return req;
>+}
>+EXPORT_SYMBOL_NS_GPL(peci_get_temp, PECI);
>+
> static struct peci_request *
> __pkg_cfg_read(struct peci_device *device, u8 index, u16 param, u8 len)
> {
>@@ -248,6 +312,108 @@ __pkg_cfg_read(struct peci_device *device, u8 index,=
 u16 param, u8 len)
> 	return req;
> }
>
>+static u32 __get_pci_addr(u8 bus, u8 dev, u8 func, u16 reg)
>+{
>+	return reg | PCI_DEVID(bus, PCI_DEVFN(dev, func)) << 12;
>+}
>+
>+static struct peci_request *
>+__pci_cfg_local_read(struct peci_device *device, u8 bus, u8 dev, u8 func,=
 u16 reg, u8 len)
>+{
>+	struct peci_request *req;
>+	u32 pci_addr;
>+	int ret;
>+
>+	req =3D peci_request_alloc(device, PECI_RDPCICFGLOCAL_WRITE_LEN,
>+				 PECI_RDPCICFGLOCAL_READ_LEN_BASE + len);
>+	if (!req)
>+		return ERR_PTR(-ENOMEM);
>+
>+	pci_addr =3D __get_pci_addr(bus, dev, func, reg);
>+
>+	req->tx.buf[0] =3D PECI_RDPCICFGLOCAL_CMD;
>+	req->tx.buf[1] =3D 0;
>+	put_unaligned_le24(pci_addr, &req->tx.buf[2]);
>+
>+	ret =3D peci_request_xfer_retry(req);
>+	if (ret) {
>+		peci_request_free(req);
>+		return ERR_PTR(ret);
>+	}
>+
>+	return req;
>+}
>+
>+static struct peci_request *
>+__ep_pci_cfg_read(struct peci_device *device, u8 msg_type, u8 seg,
>+		  u8 bus, u8 dev, u8 func, u16 reg, u8 len)
>+{
>+	struct peci_request *req;
>+	u32 pci_addr;
>+	int ret;
>+
>+	req =3D peci_request_alloc(device, PECI_RDENDPTCFG_PCI_WRITE_LEN,
>+				 PECI_RDENDPTCFG_READ_LEN_BASE + len);
>+	if (!req)
>+		return ERR_PTR(-ENOMEM);
>+
>+	pci_addr =3D __get_pci_addr(bus, dev, func, reg);
>+
>+	req->tx.buf[0] =3D PECI_RDENDPTCFG_CMD;
>+	req->tx.buf[1] =3D 0;
>+	req->tx.buf[2] =3D msg_type;
>+	req->tx.buf[3] =3D 0;
>+	req->tx.buf[4] =3D 0;
>+	req->tx.buf[5] =3D 0;
>+	req->tx.buf[6] =3D PECI_ENDPTCFG_ADDR_TYPE_PCI;
>+	req->tx.buf[7] =3D seg; /* PCI Segment */
>+	put_unaligned_le32(pci_addr, &req->tx.buf[8]);
>+
>+	ret =3D peci_request_xfer_retry(req);
>+	if (ret) {
>+		peci_request_free(req);
>+		return ERR_PTR(ret);
>+	}
>+
>+	return req;
>+}
>+
>+static struct peci_request *
>+__ep_mmio_read(struct peci_device *device, u8 bar, u8 addr_type, u8 seg,
>+	       u8 bus, u8 dev, u8 func, u64 offset, u8 tx_len, u8 len)
>+{
>+	struct peci_request *req;
>+	int ret;
>+
>+	req =3D peci_request_alloc(device, tx_len, PECI_RDENDPTCFG_READ_LEN_BASE=
 + len);
>+	if (!req)
>+		return ERR_PTR(-ENOMEM);
>+
>+	req->tx.buf[0] =3D PECI_RDENDPTCFG_CMD;
>+	req->tx.buf[1] =3D 0;
>+	req->tx.buf[2] =3D PECI_ENDPTCFG_TYPE_MMIO;
>+	req->tx.buf[3] =3D 0; /* Endpoint ID */
>+	req->tx.buf[4] =3D 0; /* Reserved */
>+	req->tx.buf[5] =3D bar;
>+	req->tx.buf[6] =3D addr_type;
>+	req->tx.buf[7] =3D seg; /* PCI Segment */
>+	req->tx.buf[8] =3D PCI_DEVFN(dev, func);
>+	req->tx.buf[9] =3D bus; /* PCI Bus */
>+
>+	if (addr_type =3D=3D PECI_ENDPTCFG_ADDR_TYPE_MMIO_D)
>+		put_unaligned_le32(offset, &req->tx.buf[10]);
>+	else
>+		put_unaligned_le64(offset, &req->tx.buf[10]);
>+
>+	ret =3D peci_request_xfer_retry(req);
>+	if (ret) {
>+		peci_request_free(req);
>+		return ERR_PTR(ret);
>+	}
>+
>+	return req;
>+}
>+
> u8 peci_request_data_readb(struct peci_request *req)
> {
> 	return req->rx.buf[1];
>@@ -278,6 +444,12 @@ u64 peci_request_data_dib(struct peci_request *req)
> }
> EXPORT_SYMBOL_NS_GPL(peci_request_data_dib, PECI);
>
>+s16 peci_request_data_temp(struct peci_request *req)
>+{
>+	return get_unaligned_le16(&req->rx.buf[0]);
>+}
>+EXPORT_SYMBOL_NS_GPL(peci_request_data_temp, PECI);
>+
> #define __read_pkg_config(x, type) \
> struct peci_request *peci_pkg_cfg_##x(struct peci_device *device, u8 inde=
x, u16 param) \
> { \
>@@ -289,3 +461,42 @@ __read_pkg_config(readb, u8);
> __read_pkg_config(readw, u16);
> __read_pkg_config(readl, u32);
> __read_pkg_config(readq, u64);
>+
>+#define __read_pci_config_local(x, type) \
>+struct peci_request * \
>+peci_pci_cfg_local_##x(struct peci_device *device, u8 bus, u8 dev, u8 fun=
c, u16 reg) \
>+{ \
>+	return __pci_cfg_local_read(device, bus, dev, func, reg, sizeof(type)); =
\
>+} \

As with peci_pkg_cfg_*() in patch 9, it seems like this could relieve
callers of some busy-work by returning a status int and writing the data
to a 'type*' pointer instead of returning a struct peci_request*.

>+EXPORT_SYMBOL_NS_GPL(peci_pci_cfg_local_##x, PECI)
>+
>+__read_pci_config_local(readb, u8);
>+__read_pci_config_local(readw, u16);
>+__read_pci_config_local(readl, u32);
>+
>+#define __read_ep_pci_config(x, msg_type, type) \
>+struct peci_request * \
>+peci_ep_pci_cfg_##x(struct peci_device *device, u8 seg, u8 bus, u8 dev, u=
8 func, u16 reg) \
>+{ \
>+	return __ep_pci_cfg_read(device, msg_type, seg, bus, dev, func, reg, siz=
eof(type)); \
>+} \

Likewise here.

>+EXPORT_SYMBOL_NS_GPL(peci_ep_pci_cfg_##x, PECI)
>+
>+__read_ep_pci_config(local_readb, PECI_ENDPTCFG_TYPE_LOCAL_PCI, u8);
>+__read_ep_pci_config(local_readw, PECI_ENDPTCFG_TYPE_LOCAL_PCI, u16);
>+__read_ep_pci_config(local_readl, PECI_ENDPTCFG_TYPE_LOCAL_PCI, u32);
>+__read_ep_pci_config(readb, PECI_ENDPTCFG_TYPE_PCI, u8);
>+__read_ep_pci_config(readw, PECI_ENDPTCFG_TYPE_PCI, u16);
>+__read_ep_pci_config(readl, PECI_ENDPTCFG_TYPE_PCI, u32);
>+
>+#define __read_ep_mmio(x, y, addr_type, type1, type2) \
>+struct peci_request *peci_ep_mmio##y##_##x(struct peci_device *device, u8=
 bar, u8 seg, \
>+					   u8 bus, u8 dev, u8 func, u64 offset) \
>+{ \
>+	return __ep_mmio_read(device, bar, addr_type, seg, bus, dev, func, \
>+			      offset, 10 + sizeof(type1), sizeof(type2)); \
>+} \

And here (I think).

Also, the '10 +' looks a bit magical/mysterious.  Could that be
clarified a bit with a macro or something?

>+EXPORT_SYMBOL_NS_GPL(peci_ep_mmio##y##_##x, PECI)
>+
>+__read_ep_mmio(readl, 32, PECI_ENDPTCFG_ADDR_TYPE_MMIO_D, u32, u32);
>+__read_ep_mmio(readl, 64, PECI_ENDPTCFG_ADDR_TYPE_MMIO_Q, u64, u32);
>diff --git a/include/linux/peci-cpu.h b/include/linux/peci-cpu.h
>new file mode 100644
>index 000000000000..d1b307ec2429
>--- /dev/null
>+++ b/include/linux/peci-cpu.h
>@@ -0,0 +1,38 @@
>+/* SPDX-License-Identifier: GPL-2.0-only */
>+/* Copyright (c) 2021 Intel Corporation */
>+
>+#ifndef __LINUX_PECI_CPU_H
>+#define __LINUX_PECI_CPU_H
>+
>+#include <linux/types.h>
>+
>+#define PECI_PCS_PKG_ID			0  /* Package Identifier Read */
>+#define  PECI_PKG_ID_CPU_ID		0x0000  /* CPUID Info */
>+#define  PECI_PKG_ID_PLATFORM_ID	0x0001  /* Platform ID */
>+#define  PECI_PKG_ID_DEVICE_ID		0x0002  /* Uncore Device ID */
>+#define  PECI_PKG_ID_MAX_THREAD_ID	0x0003  /* Max Thread ID */
>+#define  PECI_PKG_ID_MICROCODE_REV	0x0004  /* CPU Microcode Update Revisi=
on */
>+#define  PECI_PKG_ID_MCA_ERROR_LOG	0x0005  /* Machine Check Status */
>+#define PECI_PCS_MODULE_TEMP		9  /* Per Core DTS Temperature Read */
>+#define PECI_PCS_THERMAL_MARGIN		10 /* DTS thermal margin */
>+#define PECI_PCS_DDR_DIMM_TEMP		14 /* DDR DIMM Temperature */
>+#define PECI_PCS_TEMP_TARGET		16 /* Temperature Target Read */
>+#define PECI_PCS_TDP_UNITS		30 /* Units for power/energy registers */
>+
>+struct peci_device;
>+
>+int peci_temp_read(struct peci_device *device, s16 *temp_raw);
>+
>+int peci_pcs_read(struct peci_device *device, u8 index,
>+		  u16 param, u32 *data);
>+
>+int peci_pci_local_read(struct peci_device *device, u8 bus, u8 dev,
>+			u8 func, u16 reg, u32 *data);
>+
>+int peci_ep_pci_local_read(struct peci_device *device, u8 seg,
>+			   u8 bus, u8 dev, u8 func, u16 reg, u32 *data);
>+
>+int peci_mmio_read(struct peci_device *device, u8 bar, u8 seg,
>+		   u8 bus, u8 dev, u8 func, u64 address, u32 *data);
>+
>+#endif /* __LINUX_PECI_CPU_H */
>diff --git a/include/linux/peci.h b/include/linux/peci.h
>index f9f37b874011..31f9e628fd11 100644
>--- a/include/linux/peci.h
>+++ b/include/linux/peci.h
>@@ -9,14 +9,6 @@
> #include <linux/mutex.h>
> #include <linux/types.h>
>
>-#define PECI_PCS_PKG_ID			0  /* Package Identifier Read */
>-#define  PECI_PKG_ID_CPU_ID		0x0000  /* CPUID Info */
>-#define  PECI_PKG_ID_PLATFORM_ID	0x0001  /* Platform ID */
>-#define  PECI_PKG_ID_DEVICE_ID		0x0002  /* Uncore Device ID */
>-#define  PECI_PKG_ID_MAX_THREAD_ID	0x0003  /* Max Thread ID */
>-#define  PECI_PKG_ID_MICROCODE_REV	0x0004  /* CPU Microcode Update Revisi=
on */
>-#define  PECI_PKG_ID_MCA_ERROR_LOG	0x0005  /* Machine Check Status */
>-
> struct peci_request;
>
> /**
>--=20
>2.31.1
>=
