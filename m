Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A074D3D7C95
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 19:50:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GZ48W4YXRz30HD
	for <lists+openbmc@lfdr.de>; Wed, 28 Jul 2021 03:50:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=equinixinc.onmicrosoft.com header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-equinixinc-onmicrosoft-com header.b=RafwwBSk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.148.236;
 helo=mx0a-00268f01.pphosted.com;
 envelope-from=prvs=8842907869=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=equinixinc.onmicrosoft.com
 header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-equinixinc-onmicrosoft-com header.b=RafwwBSk; 
 dkim-atps=neutral
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com
 [148.163.148.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZ4842Lb1z2yNH;
 Wed, 28 Jul 2021 03:50:27 +1000 (AEST)
Received: from pps.filterd (m0165119.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16RHSXKT002467; Tue, 27 Jul 2021 17:49:04 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
 by mx0a-00268f01.pphosted.com with ESMTP id 3a236gm3p9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Jul 2021 17:49:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q10Bj4eXQw9+omq5/X2assS+TORynwaUYzz9fkEKFmDiWPsF1x9siJxBBsrsOxKOEiGy5w5jHC42lRCHVAdfkc30+z5xXGEBqeh994O2O3CADcY/CSPJJQfWafeeQVrpXLCkxFbwfxPhY15i85z9IUtOHk8X1rGtK+v+jSH1bxE9SqcrdBwdPGWS+ON/Cy1gwvJlt8BW3FtkPR7KkQBg2NFLs5YnzJVQ4fA9wnTjekVKwKJTg36E4/INcaXiooOKBwqDvPVi6DTdGzKJhIf8Is9huFD6o/mXl+0/wG0rBCBKGyT54aDN8PMmRv5MnTU5S8UtdMmYSfB69qQPThPwmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGFwMDleguFKbk41RneigJqNZ+j3IbI1RY7u9fBJm24=;
 b=i5/9b6ddJmRjM1tdD6ReLvjlhDMofqCxlWv8MoQo0CaDN4OBf7CudbfpkeH2KVijj2FiUVR0wviJSGWcBmdftr+xFRWrf4eiLpTEXn39cRnGhcJzu3IGoOJ4FD3g6vsKZiykREnTP7kod6rhbCbgGW3dBS3sWHHeAWV5tZBOST9YHpRmIDfr1mF7WHr697H6/MZN/GsCfC+TFjiq88R39trfv5403OxpV5EedbD4Nql6iy5ASUSK6TtskhVqk8r5OWc/zUA0gTEs9Pat9T8T3Mp8/DsWcj4EY3lvUyAYSXuge7/huKKQZwsutZe+4mT72xJKApGG8liuUAuZEZncBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=equinixinc.onmicrosoft.com; s=selector2-equinixinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGFwMDleguFKbk41RneigJqNZ+j3IbI1RY7u9fBJm24=;
 b=RafwwBSkNt4NSos0nrftQwW+3GZ2NH1gTbA1ugM4cj0Gb5CthTnmFBzb1UzyD2jGz4jMHbiFI4I13X+zi1kCwSfnaJeupvBaUoYWIBj/vfiZzxG7zAsWXNnYiU3TdS6lBU+t7kI2Qz7AUd6kVa98ObP7/Gq0awP/3xqZ4d+FUNA=
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by DM8PR04MB8168.namprd04.prod.outlook.com (2603:10b6:8::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.28; Tue, 27 Jul 2021 17:49:01 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::953d:f9ec:b2cc:ca2b]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::953d:f9ec:b2cc:ca2b%5]) with mapi id 15.20.4373.018; Tue, 27 Jul 2021
 17:49:01 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Iwona Winiarska <iwona.winiarska@intel.com>
Subject: Re: [PATCH 08/14] peci: Add device detection
Thread-Topic: [PATCH 08/14] peci: Add device detection
Thread-Index: AQHXgw+vLl0u04R8dUC2G5CmB0KiZQ==
Date: Tue, 27 Jul 2021 17:49:01 +0000
Message-ID: <20210727174900.GR8018@packtop>
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
 <20210712220447.957418-9-iwona.winiarska@intel.com>
In-Reply-To: <20210712220447.957418-9-iwona.winiarska@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=equinix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 25fb11dc-2012-4e67-862c-08d95126d1ab
x-ms-traffictypediagnostic: DM8PR04MB8168:
x-microsoft-antispam-prvs: <DM8PR04MB8168FAFCF47580C3B1815B41C3E99@DM8PR04MB8168.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: plC/TTAHLBOb0Kmr8kAP3qpV88ldlYd/UDNha4iEGDdpbZerqxvulPhNnddta7beW7Cpna/mlkJsObsrPH1YpmKmBgxWserhByTxWDtDm4b7HFNEpQF+mWg9uCkbzqKroAyi0DUHbrSE1y0mIISBqhthlgxkrMLvCL7OR6xnaDXQNTVLIHca/ctk6YM5M+wPHuLYDQjv3GI5P0udY4wDgvoR06UW3Dfi37+xm5Gl8OiP3QUB+qvUHEKApj2q6vr0Nmkaj7RafzBmQwwsK5bdAGgo2BQ3V0noKsMrv2Xy6dJ9fMX52mIW2ThKSPIymKa1z1SDrqy7pwDUFE8/idF9ZTm8UYgk3tslbAdeUqxJEAysWESdFzY9aBSl7RFmVp27UD4vZOPwARfK5iXk0Vc+6zB+TCjcU2Kys9lBxtG/evG0XwR2jrqYUJS01CPZyXsgbsRDp4YeC/XlbwknC54gj1eeRcS9W2gfwSNvCZvpto/OvYHEROysVGOzIfjZUolE6oDA4aS6PpujTpBFXYyHMQXs5D+lXTfbvJxmtuST2lY31Qv0UFqJBWixPjMLw9Xaq15ukC68dRejWDUVuDJNss4sT8vbmqtyUysJso53tXM49fGrzPWO92e4CXsbirEne1kPYFCgYn2NEZ7Rb7rhoSoFYxrWNkrGlc4qQmzh/qw2LWe68+xutErgyizhPiup0aIpyYWgWiE+UHXCEnSzdg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR04MB8007.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(366004)(376002)(396003)(346002)(39860400002)(136003)(76116006)(2906002)(91956017)(5660300002)(26005)(8676002)(8936002)(6512007)(64756008)(38100700002)(66476007)(33716001)(122000001)(66556008)(6486002)(66446008)(6506007)(33656002)(316002)(54906003)(6916009)(186003)(66946007)(1076003)(4326008)(71200400001)(83380400001)(478600001)(7416002)(9686003)(86362001)(38070700004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vtNZ4YeWzLrMBm88PAgzsac0Nlxo04z91Q9MwINNpeyag3gFdf6EXQNh5DFZ?=
 =?us-ascii?Q?0CB3o9AALh0+ZBBjM4ZnvgSu1t73TbM7yuWB2wP7OMg5kdkduGYSoJYaa3Tu?=
 =?us-ascii?Q?ND5kzizspO/FpLjRvtZ6JDyT2OD6bNB0O9j1yBKAHW4xDhM33IBx4gRL+ae6?=
 =?us-ascii?Q?s8ZWReJAQFkcrLdD4Wu9p8dItQG3fT9SuO18yCRA21ypI/rNkVMlhbyWJFR9?=
 =?us-ascii?Q?1BIZCDm0sQP9Cid21VqJFHx1I1QMJdBERWljBO1Vl9nZhdd2dCbsMRzqFyPN?=
 =?us-ascii?Q?n/fFfxTRps7vPO237AJKlkZS2KY5667uR8SP+i7cdvT851IcI3mbLQxgtdv4?=
 =?us-ascii?Q?ISAUHIaeonOIfnk2qw7ToAW1/pF9f1tVCzTmYSLt80UO66UFFmcWguAE/ns1?=
 =?us-ascii?Q?ZIjbspILQdgrAEG0aQxVxu2g0yMvXVHusmYdUhhW6hXirxlh49/LQA7VhXNW?=
 =?us-ascii?Q?TSsgMb2zI9O3OwqmHFb1YK2IwvJwbuv9avSfynLDIrnbkUS8kiKC+hTQnTXY?=
 =?us-ascii?Q?0qw9H3CO505+pwrIjbesKTdgydcGcrxsDytFl0YLka6l+awtF8+W+MXY91Eo?=
 =?us-ascii?Q?O5b/hqzFvbiEcxHiq2c1LFzl+WDg2KAKs96/m89AsFLsoxJB6jXfryp8BUlY?=
 =?us-ascii?Q?6+IwJeJu8blM9gCZiNu9Px8ISbU+61cl38Cpzrjl5aoB0DAN4wEr6TQVqBFd?=
 =?us-ascii?Q?chJF2D6PiaS8wGl4ifmy+xyx6jvSwJC7oZ+b4WUPVEQz43+KAHoZVv4D1brh?=
 =?us-ascii?Q?FuN6gjl3qvbLCUKWYaeTfLufLuYbpvtm/v6FVG6Lg3SD4T8TuWySCPZcRN99?=
 =?us-ascii?Q?wU1usshyVvfEKGoAvr73NpXdXXYvggRxJxJzoyNBvfTovctja8N3JtJ+kDfT?=
 =?us-ascii?Q?Itagga0MytRr2X9Ca8CoeZjAwI/NDuaNmTffdlzA/j/SAPqb2nH+1TiWHOfo?=
 =?us-ascii?Q?GNGdpSZv+mEVtwJXbfu77UKCFhBdOTx5t+8BqMhk6A6IF6sZk7vtHBOmDNdJ?=
 =?us-ascii?Q?4lg+1Jt1uSl2fqp0Hp7rgVxM1ue+ox0YxfGLsov4UdE3ovHwvsGAJr5HZu4H?=
 =?us-ascii?Q?VUemVO6IJPof17zb2uHu1QGDUA8PKgrwheGt82DZYtHAXlLzr8TtqD6zFpOT?=
 =?us-ascii?Q?n6zudTYGentCAYReUN4lYuBM4p4iFbGbgEzosKwwB08yPFrpVhqDc/7oGegc?=
 =?us-ascii?Q?o6ed567VAdBWzhKE0jxQmhWHBSoTsojBMuyVxPFwkAhTjU6r4u4aHs9Kq3bC?=
 =?us-ascii?Q?3pvAWWBnwFwDZf/63Nc6VQ6UsmLHa/6DoiiS7FEufNFUEoPJne4Ni5USiiBb?=
 =?us-ascii?Q?TtDkBgckTAzEfub5qbLELXQq?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5E48F702AE40314B8EF8A33765D88255@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25fb11dc-2012-4e67-862c-08d95126d1ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2021 17:49:01.6010 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fg21Mh7o63/EknL2dFheHjCVyC2SDC4hKKVgao/ay5shmly0T+v3WFOuFUa6cXqDkp+TisGPu/kJMHKNk1y5xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR04MB8168
X-Proofpoint-GUID: rseF9ezmyp8U7rZn0heTVSj5Xn0QKctB
X-Proofpoint-ORIG-GUID: rseF9ezmyp8U7rZn0heTVSj5Xn0QKctB
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-27_10:2021-07-27,
 2021-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=999 bulkscore=0 priorityscore=1501 adultscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107270105
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

On Mon, Jul 12, 2021 at 05:04:41PM CDT, Iwona Winiarska wrote:
>Since PECI devices are discoverable, we can dynamically detect devices
>that are actually available in the system.
>
>This change complements the earlier implementation by rescanning PECI
>bus to detect available devices. For this purpose, it also introduces the
>minimal API for PECI requests.
>
>Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
>Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>---
> drivers/peci/Makefile   |   2 +-
> drivers/peci/core.c     |  13 ++++-
> drivers/peci/device.c   | 111 ++++++++++++++++++++++++++++++++++++++++
> drivers/peci/internal.h |  15 ++++++
> drivers/peci/request.c  |  74 +++++++++++++++++++++++++++
> drivers/peci/sysfs.c    |  34 ++++++++++++
> 6 files changed, 246 insertions(+), 3 deletions(-)
> create mode 100644 drivers/peci/device.c
> create mode 100644 drivers/peci/request.c
>
>diff --git a/drivers/peci/Makefile b/drivers/peci/Makefile
>index 621a993e306a..917f689e147a 100644
>--- a/drivers/peci/Makefile
>+++ b/drivers/peci/Makefile
>@@ -1,7 +1,7 @@
> # SPDX-License-Identifier: GPL-2.0-only
>
> # Core functionality
>-peci-y :=3D core.o sysfs.o
>+peci-y :=3D core.o request.o device.o sysfs.o
> obj-$(CONFIG_PECI) +=3D peci.o
>
> # Hardware specific bus drivers
>diff --git a/drivers/peci/core.c b/drivers/peci/core.c
>index 0ad00110459d..ae7a9572cdf3 100644
>--- a/drivers/peci/core.c
>+++ b/drivers/peci/core.c
>@@ -31,7 +31,15 @@ struct device_type peci_controller_type =3D {
>
> int peci_controller_scan_devices(struct peci_controller *controller)
> {
>-	/* Just a stub, no support for actual devices yet */
>+	int ret;
>+	u8 addr;
>+
>+	for (addr =3D PECI_BASE_ADDR; addr < PECI_BASE_ADDR + PECI_DEVICE_NUM_MA=
X; addr++) {
>+		ret =3D peci_device_create(controller, addr);
>+		if (ret)
>+			return ret;
>+	}
>+
> 	return 0;
> }
>
>@@ -106,7 +114,8 @@ EXPORT_SYMBOL_NS_GPL(peci_controller_add, PECI);
>
> static int _unregister(struct device *dev, void *dummy)
> {
>-	/* Just a stub, no support for actual devices yet */
>+	peci_device_destroy(to_peci_device(dev));
>+
> 	return 0;
> }
>
>diff --git a/drivers/peci/device.c b/drivers/peci/device.c
>new file mode 100644
>index 000000000000..1124862211e2
>--- /dev/null
>+++ b/drivers/peci/device.c
>@@ -0,0 +1,111 @@
>+// SPDX-License-Identifier: GPL-2.0-only
>+// Copyright (c) 2018-2021 Intel Corporation
>+
>+#include <linux/peci.h>
>+#include <linux/slab.h>
>+
>+#include "internal.h"
>+
>+static int peci_detect(struct peci_controller *controller, u8 addr)
>+{
>+	struct peci_request *req;
>+	int ret;
>+
>+	req =3D peci_request_alloc(NULL, 0, 0);
>+	if (!req)
>+		return -ENOMEM;
>+

Might be worth a brief comment here noting that an empty request happens
to be the format of a PECI ping command (and/or change the name of the
function to peci_ping()).

>+	mutex_lock(&controller->bus_lock);
>+	ret =3D controller->xfer(controller, addr, req);
>+	mutex_unlock(&controller->bus_lock);
>+
>+	peci_request_free(req);
>+
>+	return ret;
>+}
>+
>+static bool peci_addr_valid(u8 addr)
>+{
>+	return addr >=3D PECI_BASE_ADDR && addr < PECI_BASE_ADDR + PECI_DEVICE_N=
UM_MAX;
>+}
>+
>+static int peci_dev_exists(struct device *dev, void *data)
>+{
>+	struct peci_device *device =3D to_peci_device(dev);
>+	u8 *addr =3D data;
>+
>+	if (device->addr =3D=3D *addr)
>+		return -EBUSY;
>+
>+	return 0;
>+}
>+
>+int peci_device_create(struct peci_controller *controller, u8 addr)
>+{
>+	struct peci_device *device;
>+	int ret;
>+
>+	if (WARN_ON(!peci_addr_valid(addr)))
>+		return -EINVAL;

Wondering about the necessity of this check (and the peci_addr_valid()
function) -- as of the end of this patch series, there's only one caller
of peci_device_create(), and it's peci_controller_scan_devices() looping
from PECI_BASE_ADDR to PECI_BASE_ADDR + PECI_DEVICE_NUM_MAX, so
checking that the address is in that range seems a bit redundant.  Do we
anticipate that we might gain additional callers in the future that
could run a non-zero risk of passing a bad address?

>+
>+	/* Check if we have already detected this device before. */
>+	ret =3D device_for_each_child(&controller->dev, &addr, peci_dev_exists);
>+	if (ret)
>+		return 0;
>+
>+	ret =3D peci_detect(controller, addr);
>+	if (ret) {
>+		/*
>+		 * Device not present or host state doesn't allow successful
>+		 * detection at this time.
>+		 */
>+		if (ret =3D=3D -EIO || ret =3D=3D -ETIMEDOUT)
>+			return 0;

Do we really want to be ignoring EIO here?  From a look at
aspeed_peci_xfer(), it looks like the only path that would produce that
is the non-timeout, non-CMD_DONE case, which I guess happens on
contention or FCS errors and such.  Should we maybe have some automatic
(limited) retry loop for cases like those?

>+
>+		return ret;
>+	}
>+
>+	device =3D kzalloc(sizeof(*device), GFP_KERNEL);
>+	if (!device)
>+		return -ENOMEM;
>+
>+	device->controller =3D controller;
>+	device->addr =3D addr;
>+	device->dev.parent =3D &device->controller->dev;
>+	device->dev.bus =3D &peci_bus_type;
>+	device->dev.type =3D &peci_device_type;
>+
>+	ret =3D dev_set_name(&device->dev, "%d-%02x", controller->id, device->ad=
dr);
>+	if (ret)
>+		goto err_free;
>+
>+	ret =3D device_register(&device->dev);
>+	if (ret)
>+		goto err_put;
>+
>+	return 0;
>+
>+err_put:
>+	put_device(&device->dev);
>+err_free:
>+	kfree(device);
>+
>+	return ret;
>+}
>+
>+void peci_device_destroy(struct peci_device *device)
>+{
>+	device_unregister(&device->dev);
>+}
>+
>+static void peci_device_release(struct device *dev)
>+{
>+	struct peci_device *device =3D to_peci_device(dev);
>+
>+	kfree(device);
>+}
>+
>+struct device_type peci_device_type =3D {
>+	.groups		=3D peci_device_groups,
>+	.release	=3D peci_device_release,
>+};
>diff --git a/drivers/peci/internal.h b/drivers/peci/internal.h
>index 80c61bcdfc6b..6b139adaf6b8 100644
>--- a/drivers/peci/internal.h
>+++ b/drivers/peci/internal.h
>@@ -9,6 +9,21 @@
>
> struct peci_controller;
> struct attribute_group;
>+struct peci_device;
>+struct peci_request;
>+
>+/* PECI CPU address range 0x30-0x37 */
>+#define PECI_BASE_ADDR		0x30
>+#define PECI_DEVICE_NUM_MAX		8
>+
>+struct peci_request *peci_request_alloc(struct peci_device *device, u8 tx=
_len, u8 rx_len);
>+void peci_request_free(struct peci_request *req);
>+
>+extern struct device_type peci_device_type;
>+extern const struct attribute_group *peci_device_groups[];
>+
>+int peci_device_create(struct peci_controller *controller, u8 addr);
>+void peci_device_destroy(struct peci_device *device);
>
> extern struct bus_type peci_bus_type;
> extern const struct attribute_group *peci_bus_groups[];
>diff --git a/drivers/peci/request.c b/drivers/peci/request.c
>new file mode 100644
>index 000000000000..78cee51dfae1
>--- /dev/null
>+++ b/drivers/peci/request.c
>@@ -0,0 +1,74 @@
>+// SPDX-License-Identifier: GPL-2.0-only
>+// Copyright (c) 2021 Intel Corporation
>+
>+#include <linux/export.h>
>+#include <linux/peci.h>
>+#include <linux/slab.h>
>+#include <linux/types.h>
>+
>+#include "internal.h"
>+
>+/**
>+ * peci_request_alloc() - allocate &struct peci_request with buffers with=
 given lengths
>+ * @device: PECI device to which request is going to be sent
>+ * @tx_len: requested TX buffer length
>+ * @rx_len: requested RX buffer length
>+ *
>+ * Return: A pointer to a newly allocated &struct peci_request on success=
 or NULL otherwise.
>+ */
>+struct peci_request *peci_request_alloc(struct peci_device *device, u8 tx=
_len, u8 rx_len)
>+{
>+	struct peci_request *req;
>+	u8 *tx_buf, *rx_buf;
>+
>+	req =3D kzalloc(sizeof(*req), GFP_KERNEL);
>+	if (!req)
>+		return NULL;
>+
>+	req->device =3D device;
>+
>+	/*
>+	 * PECI controllers that we are using now don't support DMA, this
>+	 * should be converted to DMA API once support for controllers that do
>+	 * allow it is added to avoid an extra copy.
>+	 */
>+	if (tx_len) {
>+		tx_buf =3D kzalloc(tx_len, GFP_KERNEL);
>+		if (!tx_buf)
>+			goto err_free_req;
>+
>+		req->tx.buf =3D tx_buf;
>+		req->tx.len =3D tx_len;
>+	}
>+
>+	if (rx_len) {
>+		rx_buf =3D kzalloc(rx_len, GFP_KERNEL);
>+		if (!rx_buf)
>+			goto err_free_tx;
>+
>+		req->rx.buf =3D rx_buf;
>+		req->rx.len =3D rx_len;
>+	}
>+

As long as we're punting on DMA support, could we do the whole thing in
a single allocation instead of three?  It'd add some pointer arithmetic,
but would also simplify the error-handling/deallocation paths a bit.

Or, given that the one controller we're currently supporting has a
hardware limit of 32 bytes per transfer anyway, maybe just inline
fixed-size rx/tx buffers into struct peci_request and have callers keep
them on the stack instead of kmalloc()-ing them?

>+	return req;
>+
>+err_free_tx:
>+	kfree(req->tx.buf);
>+err_free_req:
>+	kfree(req);
>+
>+	return NULL;
>+}
>+EXPORT_SYMBOL_NS_GPL(peci_request_alloc, PECI);
>+
>+/**
>+ * peci_request_free() - free peci_request
>+ * @req: the PECI request to be freed
>+ */
>+void peci_request_free(struct peci_request *req)
>+{
>+	kfree(req->rx.buf);
>+	kfree(req->tx.buf);
>+	kfree(req);
>+}
>+EXPORT_SYMBOL_NS_GPL(peci_request_free, PECI);
>diff --git a/drivers/peci/sysfs.c b/drivers/peci/sysfs.c
>index 36c5e2a18a92..db9ef05776e3 100644
>--- a/drivers/peci/sysfs.c
>+++ b/drivers/peci/sysfs.c
>@@ -1,6 +1,8 @@
> // SPDX-License-Identifier: GPL-2.0-only
> // Copyright (c) 2021 Intel Corporation
>
>+#include <linux/device.h>
>+#include <linux/kernel.h>
> #include <linux/peci.h>
>
> #include "internal.h"
>@@ -46,3 +48,35 @@ const struct attribute_group *peci_bus_groups[] =3D {
> 	&peci_bus_group,
> 	NULL
> };
>+
>+static ssize_t remove_store(struct device *dev, struct device_attribute *=
attr,
>+			    const char *buf, size_t count)
>+{
>+	struct peci_device *device =3D to_peci_device(dev);
>+	bool res;
>+	int ret;
>+
>+	ret =3D kstrtobool(buf, &res);
>+	if (ret)
>+		return ret;
>+
>+	if (res && device_remove_file_self(dev, attr))
>+		peci_device_destroy(device);
>+
>+	return count;
>+}
>+static DEVICE_ATTR_IGNORE_LOCKDEP(remove, 0200, NULL, remove_store);
>+
>+static struct attribute *peci_device_attrs[] =3D {
>+	&dev_attr_remove.attr,
>+	NULL
>+};
>+
>+static const struct attribute_group peci_device_group =3D {
>+	.attrs =3D peci_device_attrs,
>+};
>+
>+const struct attribute_group *peci_device_groups[] =3D {
>+	&peci_device_group,
>+	NULL
>+};
>--=20
>2.31.1
>=
