Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBB03D6940
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 00:10:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GYYyB6DkDz308V
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 08:10:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=equinixinc.onmicrosoft.com header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-equinixinc-onmicrosoft-com header.b=CFffZs9e;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.159.192;
 helo=mx0b-00268f01.pphosted.com;
 envelope-from=prvs=8841ea84e2=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=equinixinc.onmicrosoft.com
 header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-equinixinc-onmicrosoft-com header.b=CFffZs9e; 
 dkim-atps=neutral
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com
 [148.163.159.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GYYxk6YWcz2yNT
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jul 2021 08:09:45 +1000 (AEST)
Received: from pps.filterd (m0165120.ppops.net [127.0.0.1])
 by mx0b-00268f01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16QLxVeZ011084; Mon, 26 Jul 2021 22:09:02 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2172.outbound.protection.outlook.com [104.47.73.172])
 by mx0b-00268f01.pphosted.com with ESMTP id 3a2361rcyv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Jul 2021 22:09:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m//oiskBmobNYhOmumeQ8cL5Ar978I0wfKGMsUNRJMKahQaW2LZKNvIOMOoJ6Qyn4gSwhnGnyeHnsv31t39lMiR3B3ZqhOiVwsS69m+S5svl6OkK+OaKuBRKTGWlAiwge/16O7W5C8nqPzNpkEekAxuBYmqRnXUzH6z/IGH4jGMy4PI3eTuZp3/pORlL4ICyWdZSTOEwX8I27webFMCNtzxtD6Pj5ZwF4mqQaYoXeE4JQaK9Hk+/l+T20ivB4jlRYPB2SqCnnBs4SaoY3/GmxaE/MyArJCFzT/EpAVdgNzix/qrbZ1hJZ0mlg6OYhwek+ibspmTcC88qxwU+GyrmYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dPwes0Zv3EE/AL9Bz+HaN/YQiakA58qvAuG76VtsrXs=;
 b=VIAVFFueA5Fmecur47gscHQr+YpTJOk8APICbH7orxZ7k4onCdqCEC5Iev3/sAkho6kJhKW71tFpjz4iAbbnsTSFLinClEHIVWOeTrMmoVmwqtxNCiKwPJF7DzcWVR2H/e9NCpFFRR40a7sH2NcdzHTeiy60yvie7gpZT2i5aqEk+8Nx9b0RE9CI0GGvF5ygCqhUla4MW8z3zwKzHw9frcAQnsm22q5SSCVSnI6DpA25heX3vLrPqrgu7WONnwSpDQxpF50dIYnW4qwGOUYfVL6+vfQLPYVW1MaITYcFKZ5TQ0PrdQi0S+XQb3pHyFvV9RPeRzjbPLAHCTjTx9lL/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=equinixinc.onmicrosoft.com; s=selector2-equinixinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dPwes0Zv3EE/AL9Bz+HaN/YQiakA58qvAuG76VtsrXs=;
 b=CFffZs9e/+TWQfTEVj/3aB/rCrehENMdM9Vy/e2np6Khsq+zqM4sSG2h9BP/EtfNg3KXG6G6q0YGExze2+KYIcpaf9DtJwEO3LIpCYx7R+EYNSMxnjVcZGHmNCvc8fWfHH1/dA1Fq7eJHo4gHVmUEAmrtEMB62EHjtkgSWzBT6U=
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by DM8PR04MB8071.namprd04.prod.outlook.com (2603:10b6:8:2::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.26; Mon, 26 Jul 2021 22:09:00 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::953d:f9ec:b2cc:ca2b]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::953d:f9ec:b2cc:ca2b%6]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 22:08:59 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Iwona Winiarska <iwona.winiarska@intel.com>
Subject: Re: [PATCH 12/14] hwmon: peci: Add dimmtemp driver
Thread-Topic: [PATCH 12/14] hwmon: peci: Add dimmtemp driver
Thread-Index: AQHXgmrVZf3R942350iYDt4H3MKFzA==
Date: Mon, 26 Jul 2021 22:08:59 +0000
Message-ID: <20210726220858.GO8018@packtop>
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
 <20210712220447.957418-13-iwona.winiarska@intel.com>
In-Reply-To: <20210712220447.957418-13-iwona.winiarska@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=equinix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 30a79180-f23d-4b8b-ef47-08d95081f87a
x-ms-traffictypediagnostic: DM8PR04MB8071:
x-microsoft-antispam-prvs: <DM8PR04MB80714DC9CCA68C241D83F0A6C3E89@DM8PR04MB8071.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PPnibRwsRKk8CZz8Q7f++T2fKLJasIua/6lQjGZz7Zokx8mOuomE2Y0dypO2N+KjfzSoVaYIj02u2c8M+rPfrd6mxL6KIEsguXG2XGmsaFNt2rQiV/Kxqeg9S3IdpFGy7NQQLpmeaWS2YBuC6gH3Rk+qCoNWU0wyEsGq+iIzooCpNoMbWHXpDn4zaeMi3AROjJoOlwzhgP+M9GJkzPtttXsLQm24aFkYxaAiB0VAn8gx2HD1Lcd45SDXdmBilJC2X1LQxwS/GY+YTQ/mKSJLkS3nRKvLU0OK73Sf4iRpDlROK73cVcgz6DXHdsjWTDLmXrraC9EvwiqoBcz7DA2UN9gqeUhib/Eu0OhHEqgfh6lXMgjWfFe2S6xAFV+gAFckHFAc1SNMjRs9RYEm+6a6GO/LZfRvsEm1apeEbimuV305JHmi7yMvrRb7a/3eEtiPvoH7e6AsRFNIOv9j78I+ZAdrutvyyC48j6NOrZ9BWqJHRaw5XvB8s/rmLtSfNqCgFa/2EQUG+pgARz+jCBftHmfhX+X5J8PW0l9jVokVzIP5QHt7oHR8uf9p5vTRZNtw/sOvJgpmH70HAGtuFX1+UdnyfjRJmd06IeE6SSBMSd6L6rLDmHuBGz/YoBhhG4+G32N/pjqj9jKbr7W6VHuf0UFv6sgVqr0rR3MiCjfjgUvJ3biadLPIeaN0x5BCg5fHsE/NI0yT1+oHx3GD8PaOww==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR04MB8007.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(39860400002)(396003)(136003)(346002)(366004)(376002)(122000001)(86362001)(83380400001)(38100700002)(71200400001)(26005)(6506007)(2906002)(33656002)(8676002)(1076003)(4326008)(54906003)(66446008)(66946007)(6916009)(66476007)(64756008)(33716001)(186003)(6486002)(66556008)(76116006)(478600001)(9686003)(316002)(30864003)(7416002)(8936002)(5660300002)(6512007)(38070700004)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0JL9vn8YT8spO0f5DI3D9SIrAkN/eO6DmUULm+auJjYPEWPThUXPAEba3hB8?=
 =?us-ascii?Q?YoGZT/mcwO+m2wVP8TVmNkBarFwBAwWlRrvCpsdlno7TKCmekk1NcRUhUhGT?=
 =?us-ascii?Q?UzEIt5zPSPM7fdMe+DXWiI5UyUxawpjTDSXKbvlk1kIR+6FzaVKzefew3TK+?=
 =?us-ascii?Q?C+11Beo1455ZIKu4fG9d4vNlUkN9mAwwCi55o5VaqxkpaZkq5Ky5+v0GB9cr?=
 =?us-ascii?Q?uBgKKtY4UiKkwqwpYkz2mHNYB+64fsDSCCiohvNp0eqBGNMg/UY4g8l1ql2C?=
 =?us-ascii?Q?4fO53KAuDXDhq+w/bZmLCZlgJCFRHABXJuDKRxBjojb/jF8hK4aOklq894Gl?=
 =?us-ascii?Q?sFE0dkLFNYx0OYs03opGDPIJ0m3RcYme0dFLQAy+PHCpbmEYX9pd1RjAy2Mz?=
 =?us-ascii?Q?1OSnmyWL+tUYuDdX6GABdOsOW/CjwmpFuquiMIVMAgcnJQNkxqZFkhoucf0h?=
 =?us-ascii?Q?0DgoQvolofVbQ/QVKmBQJ1eI0HS6LIkwhM66UT4fGbRCDXmnaBOC2flIjGgw?=
 =?us-ascii?Q?/583+ZLuBsy3Bm+E4pwIB8ShSgazo3lIlbCk+HUJQn6uvD93L7Lf5mm1uuIj?=
 =?us-ascii?Q?jMHFpwcZWayUulgJ7+wpH1HyExwNwvDAN8eHmfY+hqfywbB+JYlORXE2IZmf?=
 =?us-ascii?Q?ZTZMmHNv31mV5UISxicM8tYaFJl+8g2JanTjgtKa6JKRZEuAX2dV8BCBSlWM?=
 =?us-ascii?Q?zIu/ZMJ9NvHEaZptA080HpWTAn9VArtVy+S+oXWiHIzUAkfJwK6ln+zHosyh?=
 =?us-ascii?Q?/U7OYsnNJk93B5UqQ4bdQcctVfSZaG06WC4DqLu2wYBSpMRK/+XySWpiqGG8?=
 =?us-ascii?Q?cGztTBbjcCBPeuXdZrnhSSMuspFrv2mJ2VSSOYncId5CRJjBXyb5Qcd1+mvh?=
 =?us-ascii?Q?rzS+rBP2zVR+Ja6QEIAKXyiNpiq33qJNZI+rzdimNjYXMzVv7RFP3es44Lz7?=
 =?us-ascii?Q?vwG0xhujnjJS5EhfjxM3POHbGLu2BSPaEzQ0JL2FDT3vhTqm3BUyDfIpV8YJ?=
 =?us-ascii?Q?dfZoGYwIrz0ztYrnJpLuL6HSBwOcg5aT23aqQBE/Nr4Qeo5NgB53EboWARQP?=
 =?us-ascii?Q?M1RuHqCU+gJBFOQIprkcLWpwscjQVeouVMqoBrdJH2c4pYMYo/3SobQnt+Sc?=
 =?us-ascii?Q?JDPL++3kEa6AF5uUNYQ1k9+Z478XWJ5Agij9sDlZX0vhzZHWyMtrxiYXMSCx?=
 =?us-ascii?Q?7mjtHtAljH5MZvRighd6Q4ueEw2welitjt3OSZ5L5mzsbzhkE2nOVqUNmy47?=
 =?us-ascii?Q?oJf8dTmmHzURa79Yhbd+UOvgGhwMHN2m5bKyM/2H8ei3rQtAWO4unJBqCQGz?=
 =?us-ascii?Q?KfKUV63rtlheQbh/+PozhveS?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0DCB3260303D56479246FC0C8C5B31BC@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30a79180-f23d-4b8b-ef47-08d95081f87a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2021 22:08:59.7692 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7qdE7eWXFynY9Y40QcVswzkIdb/Mz6O9wnoaeh+z6ypnILy2vhWnM26L4hjN8ihMzJtLQv6iS8IWm1MUcbnr6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR04MB8071
X-Proofpoint-ORIG-GUID: fme1-Zqbrt6cWamt_9EeJ6kaMHVka5RB
X-Proofpoint-GUID: fme1-Zqbrt6cWamt_9EeJ6kaMHVka5RB
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-26_14:2021-07-26,
 2021-07-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1011 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107260128
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

On Mon, Jul 12, 2021 at 05:04:45PM CDT, Iwona Winiarska wrote:
>Add peci-dimmtemp driver for Digital Thermal Sensor (DTS) thermal
>readings of DIMMs that are accessible via the processor PECI interface.
>
>The main use case for the driver (and PECI interface) is out-of-band
>management, where we're able to obtain the DTS readings from an external
>entity connected with PECI, e.g. BMC on server platforms.
>
>Co-developed-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
>Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>---
> drivers/hwmon/peci/Kconfig    |  13 +
> drivers/hwmon/peci/Makefile   |   2 +
> drivers/hwmon/peci/dimmtemp.c | 508 ++++++++++++++++++++++++++++++++++
> 3 files changed, 523 insertions(+)
> create mode 100644 drivers/hwmon/peci/dimmtemp.c
>
>diff --git a/drivers/hwmon/peci/Kconfig b/drivers/hwmon/peci/Kconfig
>index e10eed68d70a..f2d57efa508b 100644
>--- a/drivers/hwmon/peci/Kconfig
>+++ b/drivers/hwmon/peci/Kconfig
>@@ -14,5 +14,18 @@ config SENSORS_PECI_CPUTEMP
> 	  This driver can also be built as a module. If so, the module
> 	  will be called peci-cputemp.
>
>+config SENSORS_PECI_DIMMTEMP
>+	tristate "PECI DIMM temperature monitoring client"
>+	depends on PECI
>+	select SENSORS_PECI
>+	select PECI_CPU
>+	help
>+	  If you say yes here you get support for the generic Intel PECI hwmon
>+	  driver which provides Digital Thermal Sensor (DTS) thermal readings of
>+	  DIMM components that are accessible via the processor PECI interface.
>+
>+	  This driver can also be built as a module. If so, the module
>+	  will be called peci-dimmtemp.
>+
> config SENSORS_PECI
> 	tristate
>diff --git a/drivers/hwmon/peci/Makefile b/drivers/hwmon/peci/Makefile
>index e8a0ada5ab1f..191cfa0227f3 100644
>--- a/drivers/hwmon/peci/Makefile
>+++ b/drivers/hwmon/peci/Makefile
>@@ -1,5 +1,7 @@
> # SPDX-License-Identifier: GPL-2.0-only
>
> peci-cputemp-y :=3D cputemp.o
>+peci-dimmtemp-y :=3D dimmtemp.o
>
> obj-$(CONFIG_SENSORS_PECI_CPUTEMP)	+=3D peci-cputemp.o
>+obj-$(CONFIG_SENSORS_PECI_DIMMTEMP)	+=3D peci-dimmtemp.o
>diff --git a/drivers/hwmon/peci/dimmtemp.c b/drivers/hwmon/peci/dimmtemp.c
>new file mode 100644
>index 000000000000..2fcb8607137a
>--- /dev/null
>+++ b/drivers/hwmon/peci/dimmtemp.c
>@@ -0,0 +1,508 @@
>+// SPDX-License-Identifier: GPL-2.0-only
>+// Copyright (c) 2018-2021 Intel Corporation
>+
>+#include <linux/auxiliary_bus.h>
>+#include <linux/bitfield.h>
>+#include <linux/bitops.h>
>+#include <linux/hwmon.h>
>+#include <linux/jiffies.h>
>+#include <linux/module.h>
>+#include <linux/peci.h>
>+#include <linux/peci-cpu.h>
>+#include <linux/units.h>
>+#include <linux/workqueue.h>
>+#include <linux/x86/intel-family.h>
>+
>+#include "common.h"
>+
>+#define DIMM_MASK_CHECK_DELAY_JIFFIES	msecs_to_jiffies(5000)
>+#define DIMM_MASK_CHECK_RETRY_MAX	60 /* 60 x 5 secs =3D 5 minutes */
>+
>+/* Max number of channel ranks and DIMM index per channel */
>+#define CHAN_RANK_MAX_ON_HSX	8
>+#define DIMM_IDX_MAX_ON_HSX	3
>+#define CHAN_RANK_MAX_ON_BDX	4
>+#define DIMM_IDX_MAX_ON_BDX	3
>+#define CHAN_RANK_MAX_ON_BDXD	2
>+#define DIMM_IDX_MAX_ON_BDXD	2
>+#define CHAN_RANK_MAX_ON_SKX	6
>+#define DIMM_IDX_MAX_ON_SKX	2
>+#define CHAN_RANK_MAX_ON_ICX	8
>+#define DIMM_IDX_MAX_ON_ICX	2
>+#define CHAN_RANK_MAX_ON_ICXD	4
>+#define DIMM_IDX_MAX_ON_ICXD	2
>+
>+#define CHAN_RANK_MAX		CHAN_RANK_MAX_ON_HSX
>+#define DIMM_IDX_MAX		DIMM_IDX_MAX_ON_HSX
>+#define DIMM_NUMS_MAX		(CHAN_RANK_MAX * DIMM_IDX_MAX)

Should we perhaps have a static_assert(DIMM_NUMS_MAX <=3D 64) so that
check_populated_dimms() doesn't silently break if we ever have a system
with > 64 dimms?  (Not sure how far off that might be, but doesn't seem
*that* wildly inconceivable, anyway.)

On a similar note, it'd be nice if there were some neat way of
automating the maintenance of CHAN_RANK_MAX and DIMM_IDX_MAX, but I
don't know of any great solutions for that offhand.  (Shrug.)

>+
>+#define CPU_SEG_MASK		GENMASK(23, 16)
>+#define GET_CPU_SEG(x)		(((x) & CPU_SEG_MASK) >> 16)
>+#define CPU_BUS_MASK		GENMASK(7, 0)
>+#define GET_CPU_BUS(x)		((x) & CPU_BUS_MASK)
>+
>+#define DIMM_TEMP_MAX		GENMASK(15, 8)
>+#define DIMM_TEMP_CRIT		GENMASK(23, 16)
>+#define GET_TEMP_MAX(x)		(((x) & DIMM_TEMP_MAX) >> 8)
>+#define GET_TEMP_CRIT(x)	(((x) & DIMM_TEMP_CRIT) >> 16)
>+
>+struct dimm_info {
>+	int chan_rank_max;
>+	int dimm_idx_max;
>+	u8 min_peci_revision;

This field doesn't seem to be used for anything that I can see; is it
really needed?

>+};
>+
>+struct peci_dimmtemp {
>+	struct peci_device *peci_dev;
>+	struct device *dev;
>+	const char *name;
>+	const struct dimm_info *gen_info;
>+	struct delayed_work detect_work;
>+	struct peci_sensor_data temp[DIMM_NUMS_MAX];
>+	long temp_max[DIMM_NUMS_MAX];
>+	long temp_crit[DIMM_NUMS_MAX];
>+	int retry_count;
>+	char **dimmtemp_label;
>+	DECLARE_BITMAP(dimm_mask, DIMM_NUMS_MAX);
>+};
>+
>+static u8 __dimm_temp(u32 reg, int dimm_order)
>+{
>+	return (reg >> (dimm_order * 8)) & 0xff;
>+}
>+
>+static int get_dimm_temp(struct peci_dimmtemp *priv, int dimm_no)
>+{
>+	int dimm_order =3D dimm_no % priv->gen_info->dimm_idx_max;
>+	int chan_rank =3D dimm_no / priv->gen_info->dimm_idx_max;
>+	struct peci_device *peci_dev =3D priv->peci_dev;
>+	u8 cpu_seg, cpu_bus, dev, func;
>+	u64 offset;
>+	u32 data;
>+	u16 reg;
>+	int ret;
>+
>+	if (!peci_sensor_need_update(&priv->temp[dimm_no]))
>+		return 0;
>+
>+	ret =3D peci_pcs_read(peci_dev, PECI_PCS_DDR_DIMM_TEMP, chan_rank, &data=
);
>+	if (ret)
>+		return ret;
>+
>+	priv->temp[dimm_no].value =3D __dimm_temp(data, dimm_order) * MILLIDEGRE=
E_PER_DEGREE;
>+
>+	switch (peci_dev->info.model) {
>+	case INTEL_FAM6_ICELAKE_X:
>+	case INTEL_FAM6_ICELAKE_D:
>+		ret =3D peci_ep_pci_local_read(peci_dev, 0, 13, 0, 2, 0xd4, &data);
>+		if (ret || !(data & BIT(31)))
>+			break; /* Use default or previous value */
>+
>+		ret =3D peci_ep_pci_local_read(peci_dev, 0, 13, 0, 2, 0xd0, &data);
>+		if (ret)
>+			break; /* Use default or previous value */
>+
>+		cpu_seg =3D GET_CPU_SEG(data);
>+		cpu_bus =3D GET_CPU_BUS(data);
>+
>+		/*
>+		 * Device 26, Offset 224e0: IMC 0 channel 0 -> rank 0
>+		 * Device 26, Offset 264e0: IMC 0 channel 1 -> rank 1
>+		 * Device 27, Offset 224e0: IMC 1 channel 0 -> rank 2
>+		 * Device 27, Offset 264e0: IMC 1 channel 1 -> rank 3
>+		 * Device 28, Offset 224e0: IMC 2 channel 0 -> rank 4
>+		 * Device 28, Offset 264e0: IMC 2 channel 1 -> rank 5
>+		 * Device 29, Offset 224e0: IMC 3 channel 0 -> rank 6
>+		 * Device 29, Offset 264e0: IMC 3 channel 1 -> rank 7
>+		 */
>+		dev =3D 0x1a + chan_rank / 2;
>+		offset =3D 0x224e0 + dimm_order * 4;
>+		if (chan_rank % 2)
>+			offset +=3D 0x4000;
>+
>+		ret =3D peci_mmio_read(peci_dev, 0, cpu_seg, cpu_bus, dev, 0, offset, &=
data);
>+		if (ret)
>+			return ret;
>+
>+		priv->temp_max[dimm_no] =3D GET_TEMP_MAX(data) * MILLIDEGREE_PER_DEGREE=
;
>+		priv->temp_crit[dimm_no] =3D GET_TEMP_CRIT(data) * MILLIDEGREE_PER_DEGR=
EE;

These two lines look identical in all (non-default) cases; should we
deduplicate them by just moving them to after the switch?

>+
>+		break;
>+	case INTEL_FAM6_SKYLAKE_X:
>+		/*
>+		 * Device 10, Function 2: IMC 0 channel 0 -> rank 0
>+		 * Device 10, Function 6: IMC 0 channel 1 -> rank 1
>+		 * Device 11, Function 2: IMC 0 channel 2 -> rank 2
>+		 * Device 12, Function 2: IMC 1 channel 0 -> rank 3
>+		 * Device 12, Function 6: IMC 1 channel 1 -> rank 4
>+		 * Device 13, Function 2: IMC 1 channel 2 -> rank 5
>+		 */
>+		dev =3D 10 + chan_rank / 3 * 2 + (chan_rank % 3 =3D=3D 2 ? 1 : 0);
>+		func =3D chan_rank % 3 =3D=3D 1 ? 6 : 2;
>+		reg =3D 0x120 + dimm_order * 4;
>+
>+		ret =3D peci_pci_local_read(peci_dev, 2, dev, func, reg, &data);
>+		if (ret)
>+			return ret;
>+
>+		priv->temp_max[dimm_no] =3D GET_TEMP_MAX(data) * MILLIDEGREE_PER_DEGREE=
;
>+		priv->temp_crit[dimm_no] =3D GET_TEMP_CRIT(data) * MILLIDEGREE_PER_DEGR=
EE;
>+
>+		break;
>+	case INTEL_FAM6_BROADWELL_D:
>+		/*
>+		 * Device 10, Function 2: IMC 0 channel 0 -> rank 0
>+		 * Device 10, Function 6: IMC 0 channel 1 -> rank 1
>+		 * Device 12, Function 2: IMC 1 channel 0 -> rank 2
>+		 * Device 12, Function 6: IMC 1 channel 1 -> rank 3
>+		 */
>+		dev =3D 10 + chan_rank / 2 * 2;
>+		func =3D (chan_rank % 2) ? 6 : 2;
>+		reg =3D 0x120 + dimm_order * 4;
>+
>+		ret =3D peci_pci_local_read(peci_dev, 2, dev, func, reg, &data);
>+		if (ret)
>+			return ret;
>+
>+		priv->temp_max[dimm_no] =3D GET_TEMP_MAX(data) * MILLIDEGREE_PER_DEGREE=
;
>+		priv->temp_crit[dimm_no] =3D GET_TEMP_CRIT(data) * MILLIDEGREE_PER_DEGR=
EE;
>+
>+		break;
>+	case INTEL_FAM6_HASWELL_X:
>+	case INTEL_FAM6_BROADWELL_X:
>+		/*
>+		 * Device 20, Function 0: IMC 0 channel 0 -> rank 0
>+		 * Device 20, Function 1: IMC 0 channel 1 -> rank 1
>+		 * Device 21, Function 0: IMC 0 channel 2 -> rank 2
>+		 * Device 21, Function 1: IMC 0 channel 3 -> rank 3
>+		 * Device 23, Function 0: IMC 1 channel 0 -> rank 4
>+		 * Device 23, Function 1: IMC 1 channel 1 -> rank 5
>+		 * Device 24, Function 0: IMC 1 channel 2 -> rank 6
>+		 * Device 24, Function 1: IMC 1 channel 3 -> rank 7
>+		 */
>+		dev =3D 20 + chan_rank / 2 + chan_rank / 4;
>+		func =3D chan_rank % 2;
>+		reg =3D 0x120 + dimm_order * 4;
>+
>+		ret =3D peci_pci_local_read(peci_dev, 1, dev, func, reg, &data);
>+		if (ret)
>+			return ret;
>+
>+		priv->temp_max[dimm_no] =3D GET_TEMP_MAX(data) * MILLIDEGREE_PER_DEGREE=
;
>+		priv->temp_crit[dimm_no] =3D GET_TEMP_CRIT(data) * MILLIDEGREE_PER_DEGR=
EE;
>+
>+		break;
>+	default:
>+		return -EOPNOTSUPP;
>+	}
>+
>+	peci_sensor_mark_updated(&priv->temp[dimm_no]);
>+
>+	return 0;
>+}
>+
>+static int dimmtemp_read_string(struct device *dev,
>+				enum hwmon_sensor_types type,
>+				u32 attr, int channel, const char **str)
>+{
>+	struct peci_dimmtemp *priv =3D dev_get_drvdata(dev);
>+
>+	if (attr !=3D hwmon_temp_label)
>+		return -EOPNOTSUPP;
>+
>+	*str =3D (const char *)priv->dimmtemp_label[channel];
>+
>+	return 0;
>+}
>+
>+static int dimmtemp_read(struct device *dev, enum hwmon_sensor_types type=
,
>+			 u32 attr, int channel, long *val)
>+{
>+	struct peci_dimmtemp *priv =3D dev_get_drvdata(dev);
>+	int ret;
>+
>+	ret =3D get_dimm_temp(priv, channel);
>+	if (ret)
>+		return ret;
>+
>+	switch (attr) {
>+	case hwmon_temp_input:
>+		*val =3D priv->temp[channel].value;
>+		break;
>+	case hwmon_temp_max:
>+		*val =3D priv->temp_max[channel];
>+		break;
>+	case hwmon_temp_crit:
>+		*val =3D priv->temp_crit[channel];
>+		break;
>+	default:
>+		return -EOPNOTSUPP;
>+	}
>+
>+	return 0;
>+}
>+
>+static umode_t dimmtemp_is_visible(const void *data, enum hwmon_sensor_ty=
pes type,
>+				   u32 attr, int channel)
>+{
>+	const struct peci_dimmtemp *priv =3D data;
>+
>+	if (test_bit(channel, priv->dimm_mask))
>+		return 0444;
>+
>+	return 0;
>+}
>+
>+static const struct hwmon_ops peci_dimmtemp_ops =3D {
>+	.is_visible =3D dimmtemp_is_visible,
>+	.read_string =3D dimmtemp_read_string,
>+	.read =3D dimmtemp_read,
>+};
>+
>+static int check_populated_dimms(struct peci_dimmtemp *priv)
>+{
>+	int chan_rank_max =3D priv->gen_info->chan_rank_max;
>+	int dimm_idx_max =3D priv->gen_info->dimm_idx_max;
>+	int chan_rank, dimm_idx, ret;
>+	u64 dimm_mask =3D 0;
>+	u32 pcs;
>+
>+	for (chan_rank =3D 0; chan_rank < chan_rank_max; chan_rank++) {
>+		ret =3D peci_pcs_read(priv->peci_dev, PECI_PCS_DDR_DIMM_TEMP, chan_rank=
, &pcs);
>+		if (ret) {
>+			/*
>+			 * Overall, we expect either success or -EINVAL in
>+			 * order to determine whether DIMM is populated or not.
>+			 * For anything else - we fall back to defering the
>+			 * detection to be performed at a later point in time.
>+			 */
>+			if (ret =3D=3D -EINVAL)
>+				continue;
>+			else
>+				return -EAGAIN;
>+		}
>+
>+		for (dimm_idx =3D 0; dimm_idx < dimm_idx_max; dimm_idx++)
>+			if (__dimm_temp(pcs, dimm_idx))
>+				dimm_mask |=3D BIT(chan_rank * dimm_idx_max + dimm_idx);
>+	}
>+	/*
>+	 * It's possible that memory training is not done yet. In this case we
>+	 * defer the detection to be performed at a later point in time.
>+	 */
>+	if (!dimm_mask)
>+		return -EAGAIN;
>+
>+	dev_dbg(priv->dev, "Scanned populated DIMMs: %#llx\n", dimm_mask);

Hmm, though aside from this one debug print it seems like this function
could just as easily operate directly on priv->dimm_mask if we wanted to
make it safe for >64 dimms (I have no particular objection to keeping it
as-is for now though).

>+
>+	bitmap_from_u64(priv->dimm_mask, dimm_mask);
>+
>+	return 0;
>+}
>+
>+static int create_dimm_temp_label(struct peci_dimmtemp *priv, int chan)
>+{
>+	int rank =3D chan / priv->gen_info->dimm_idx_max;
>+	int idx =3D chan % priv->gen_info->dimm_idx_max;
>+
>+	priv->dimmtemp_label[chan] =3D devm_kasprintf(priv->dev, GFP_KERNEL,
>+						    "DIMM %c%d", 'A' + rank,
>+						    idx + 1);
>+	if (!priv->dimmtemp_label[chan])
>+		return -ENOMEM;
>+
>+	return 0;
>+}
>+
>+static const u32 peci_dimmtemp_temp_channel_config[] =3D {
>+	[0 ... DIMM_NUMS_MAX - 1] =3D HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_MA=
X | HWMON_T_CRIT,
>+	0
>+};
>+
>+static const struct hwmon_channel_info peci_dimmtemp_temp_channel =3D {
>+	.type =3D hwmon_temp,
>+	.config =3D peci_dimmtemp_temp_channel_config,
>+};
>+
>+static const struct hwmon_channel_info *peci_dimmtemp_temp_info[] =3D {
>+	&peci_dimmtemp_temp_channel,
>+	NULL
>+};
>+
>+static const struct hwmon_chip_info peci_dimmtemp_chip_info =3D {
>+	.ops =3D &peci_dimmtemp_ops,
>+	.info =3D peci_dimmtemp_temp_info,
>+};
>+
>+static int create_dimm_temp_info(struct peci_dimmtemp *priv)
>+{
>+	int ret, i, channels;
>+	struct device *dev;
>+
>+	ret =3D check_populated_dimms(priv);
>+	if (ret =3D=3D -EAGAIN) {
>+		if (priv->retry_count < DIMM_MASK_CHECK_RETRY_MAX) {
>+			schedule_delayed_work(&priv->detect_work,
>+					      DIMM_MASK_CHECK_DELAY_JIFFIES);
>+			priv->retry_count++;
>+			dev_dbg(priv->dev, "Deferred populating DIMM temp info\n");
>+			return ret;
>+		}
>+
>+		dev_info(priv->dev, "Timeout populating DIMM temp info\n");
>+		return -ETIMEDOUT;
>+	}
>+
>+	channels =3D priv->gen_info->chan_rank_max * priv->gen_info->dimm_idx_ma=
x;
>+
>+	priv->dimmtemp_label =3D devm_kzalloc(priv->dev, channels * sizeof(char =
*), GFP_KERNEL);
>+	if (!priv->dimmtemp_label)
>+		return -ENOMEM;
>+
>+	for_each_set_bit(i, priv->dimm_mask, DIMM_NUMS_MAX) {
>+		ret =3D create_dimm_temp_label(priv, i);
>+		if (ret)
>+			return ret;
>+	}
>+
>+	dev =3D devm_hwmon_device_register_with_info(priv->dev, priv->name, priv=
,
>+						   &peci_dimmtemp_chip_info, NULL);
>+	if (IS_ERR(dev)) {
>+		dev_err(priv->dev, "Failed to register hwmon device\n");
>+		return PTR_ERR(dev);
>+	}
>+
>+	dev_dbg(priv->dev, "%s: sensor '%s'\n", dev_name(dev), priv->name);
>+
>+	return 0;
>+}
>+
>+static void create_dimm_temp_info_delayed(struct work_struct *work)
>+{
>+	struct peci_dimmtemp *priv =3D container_of(to_delayed_work(work),
>+						  struct peci_dimmtemp,
>+						  detect_work);
>+	int ret;
>+
>+	ret =3D create_dimm_temp_info(priv);
>+	if (ret && ret !=3D -EAGAIN)
>+		dev_dbg(priv->dev, "Failed to populate DIMM temp info\n");
>+}
>+
>+static int peci_dimmtemp_probe(struct auxiliary_device *adev, const struc=
t auxiliary_device_id *id)
>+{
>+	struct device *dev =3D &adev->dev;
>+	struct peci_device *peci_dev =3D to_peci_device(dev->parent);
>+	struct peci_dimmtemp *priv;
>+	int ret;
>+
>+	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>+	if (!priv)
>+		return -ENOMEM;
>+
>+	priv->name =3D devm_kasprintf(dev, GFP_KERNEL, "peci_dimmtemp.cpu%d",
>+				    peci_dev->info.socket_id);
>+	if (!priv->name)
>+		return -ENOMEM;
>+
>+	dev_set_drvdata(dev, priv);
>+	priv->dev =3D dev;
>+	priv->peci_dev =3D peci_dev;
>+	priv->gen_info =3D (const struct dimm_info *)id->driver_data;
>+
>+	INIT_DELAYED_WORK(&priv->detect_work, create_dimm_temp_info_delayed);
>+
>+	ret =3D create_dimm_temp_info(priv);
>+	if (ret && ret !=3D -EAGAIN) {
>+		dev_dbg(dev, "Failed to populate DIMM temp info\n");
>+		return ret;
>+	}
>+
>+	return 0;
>+}
>+
>+static void peci_dimmtemp_remove(struct auxiliary_device *adev)
>+{
>+	struct peci_dimmtemp *priv =3D dev_get_drvdata(&adev->dev);
>+
>+	cancel_delayed_work_sync(&priv->detect_work);
>+}
>+
>+static const struct dimm_info dimm_hsx =3D {
>+	.chan_rank_max	=3D CHAN_RANK_MAX_ON_HSX,
>+	.dimm_idx_max	=3D DIMM_IDX_MAX_ON_HSX,
>+	.min_peci_revision =3D 0x30,
>+};
>+
>+static const struct dimm_info dimm_bdx =3D {
>+	.chan_rank_max	=3D CHAN_RANK_MAX_ON_BDX,
>+	.dimm_idx_max	=3D DIMM_IDX_MAX_ON_BDX,
>+	.min_peci_revision =3D 0x30,
>+};
>+
>+static const struct dimm_info dimm_bdxd =3D {
>+	.chan_rank_max	=3D CHAN_RANK_MAX_ON_BDXD,
>+	.dimm_idx_max	=3D DIMM_IDX_MAX_ON_BDXD,
>+	.min_peci_revision =3D 0x30,
>+};
>+
>+static const struct dimm_info dimm_skx =3D {
>+	.chan_rank_max	=3D CHAN_RANK_MAX_ON_SKX,
>+	.dimm_idx_max	=3D DIMM_IDX_MAX_ON_SKX,
>+	.min_peci_revision =3D 0x30,
>+};
>+
>+static const struct dimm_info dimm_icx =3D {
>+	.chan_rank_max	=3D CHAN_RANK_MAX_ON_ICX,
>+	.dimm_idx_max	=3D DIMM_IDX_MAX_ON_ICX,
>+	.min_peci_revision =3D 0x40,
>+};
>+
>+static const struct dimm_info dimm_icxd =3D {
>+	.chan_rank_max	=3D CHAN_RANK_MAX_ON_ICXD,
>+	.dimm_idx_max	=3D DIMM_IDX_MAX_ON_ICXD,
>+	.min_peci_revision =3D 0x40,
>+};
>+
>+static const struct auxiliary_device_id peci_dimmtemp_ids[] =3D {
>+	{
>+		.name =3D "peci_cpu.dimmtemp.hsx",
>+		.driver_data =3D (kernel_ulong_t)&dimm_hsx,
>+	},
>+	{
>+		.name =3D "peci_cpu.dimmtemp.bdx",
>+		.driver_data =3D (kernel_ulong_t)&dimm_bdx,
>+	},
>+	{
>+		.name =3D "peci_cpu.dimmtemp.bdxd",
>+		.driver_data =3D (kernel_ulong_t)&dimm_bdxd,
>+	},
>+	{
>+		.name =3D "peci_cpu.dimmtemp.skx",
>+		.driver_data =3D (kernel_ulong_t)&dimm_skx,
>+	},
>+	{
>+		.name =3D "peci_cpu.dimmtemp.icx",
>+		.driver_data =3D (kernel_ulong_t)&dimm_icx,
>+	},
>+	{
>+		.name =3D "peci_cpu.dimmtemp.icxd",
>+		.driver_data =3D (kernel_ulong_t)&dimm_icxd,
>+	},
>+	{ }
>+};
>+MODULE_DEVICE_TABLE(auxiliary, peci_dimmtemp_ids);
>+
>+static struct auxiliary_driver peci_dimmtemp_driver =3D {
>+	.probe		=3D peci_dimmtemp_probe,
>+	.remove		=3D peci_dimmtemp_remove,
>+	.id_table	=3D peci_dimmtemp_ids,
>+};
>+
>+module_auxiliary_driver(peci_dimmtemp_driver);
>+
>+MODULE_AUTHOR("Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>");
>+MODULE_AUTHOR("Iwona Winiarska <iwona.winiarska@intel.com>");
>+MODULE_DESCRIPTION("PECI dimmtemp driver");
>+MODULE_LICENSE("GPL");
>+MODULE_IMPORT_NS(PECI_CPU);
>--=20
>2.31.1
>=
