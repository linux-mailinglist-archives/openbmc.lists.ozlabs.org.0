Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BDA3D7181
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 10:49:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GYr8C0br1z30BH
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 18:49:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=equinixinc.onmicrosoft.com header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-equinixinc-onmicrosoft-com header.b=fajAAeWQ;
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
 header.s=selector2-equinixinc-onmicrosoft-com header.b=fajAAeWQ; 
 dkim-atps=neutral
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com
 [148.163.148.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GYr7q5PHRz2yXs;
 Tue, 27 Jul 2021 18:49:26 +1000 (AEST)
Received: from pps.filterd (m0165118.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16R8msco003843; Tue, 27 Jul 2021 08:49:05 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
 by mx0a-00268f01.pphosted.com with ESMTP id 3a236m1x5g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Jul 2021 08:49:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OAWinKmnOMy0zrz/+2h0x8yPaM+witIimarcRI0qK1NuTJo4I2ZCLLPThSgiFtzDkx0doly79KTlFf3MV9nMZK5MRoB7+9CM2+l9Fk4w3U3IZ/rdwhcrS7k8OCQ2JBarkJbnSPan5JQAbV/A8WvktV4THpd5vpCcI9H9o0qLQxvF7O3bXtlX6WFvbk67WF0Zo0oxuve0GbA54UHRjTtvpKv9aBSAULF5fJRxKhUJkUwg3h1yFDlpA25/kL0fCCtALySSZtiD9U1BnWR+78/YLghXMTASPY8CoQF3cuF4jDe9tk3ihdn4NxJG1w+SKCXANzqOGDQD6MbHg4LRIAq41Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SIeekmVmkH348BhDDh6Kfp4FY9cuKoIki7VwUO7hGJc=;
 b=IQJyidUEZJ7Wc5mBqLpCLpSAJGc3hwX5KjhjTGtlSHk4JV6C+/L6FrOu/+wh3Y+adhGJb7weAqGNwnL2pN7BzXfUursjgR7CULKKK1sNLV6GoUAb3Ad/cY7zFaMFNK1q7b98tDIXXsBklJnblgajwac0E2En3BeuMnWCIkwavCsqwwXTapArM8QAf79eAuScjkWRXxFfbFKZy1I/3ldh7/Cai2IY+R3eFWHA07NbHBTItiHUZR0z+HAWgyXOobRThDDaoubxAtuEQUHHcXXg5h4BXeiNpP/DHSpZxOVS+cnkhX/OCt0GvJ+Fyt/dK0mHoIBjO4Yxg1OBA0CvP6vY7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=equinixinc.onmicrosoft.com; s=selector2-equinixinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SIeekmVmkH348BhDDh6Kfp4FY9cuKoIki7VwUO7hGJc=;
 b=fajAAeWQtxXWO4nbT30s2/7kpAqmG7Zi5GLhAjKKhUp/PqqTbFdT8zsUI8tLmvNteG4uJ9aEmYIi6h12zt2NLkIYTLI034zktExCQFCMtgHJGwTfqQjy9XRtYkuWgtRRibaJ7eZBnfIbIqlJrGxlr042Eco/IJTPpcZ9rQfXJ9s=
Received: from CH0PR04MB8002.namprd04.prod.outlook.com (2603:10b6:610:f8::16)
 by CH0PR04MB8131.namprd04.prod.outlook.com (2603:10b6:610:fc::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Tue, 27 Jul
 2021 08:49:02 +0000
Received: from CH0PR04MB8002.namprd04.prod.outlook.com
 ([fe80::d4d9:64f0:a6bf:9968]) by CH0PR04MB8002.namprd04.prod.outlook.com
 ([fe80::d4d9:64f0:a6bf:9968%8]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 08:49:01 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Iwona Winiarska <iwona.winiarska@intel.com>
Subject: Re: [PATCH 07/14] peci: Add peci-aspeed controller driver
Thread-Topic: [PATCH 07/14] peci: Add peci-aspeed controller driver
Thread-Index: AQHXgsQ/2U+11kOJzUGhN2GLpjgplA==
Date: Tue, 27 Jul 2021 08:49:01 +0000
Message-ID: <20210727084901.GQ8018@packtop>
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
 <20210712220447.957418-8-iwona.winiarska@intel.com>
In-Reply-To: <20210712220447.957418-8-iwona.winiarska@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=equinix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 63f5aeb2-0be1-49ae-328c-08d950db61dd
x-ms-traffictypediagnostic: CH0PR04MB8131:
x-microsoft-antispam-prvs: <CH0PR04MB8131FE0371CE452F6CACA6F1C3E99@CH0PR04MB8131.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kEqcpmqZYX3gxEsoee/QLp0QyW6yU3C5NoJzg+3ATY2UcjuNnuYE0OcahCmZcD8kdnJ6giofF5xYBbu53gO0DZX2yUkKtXxlaF3T7kLKz0crGpJLXpL9FJqMbh7IqOwL+EkDIMcMgnXPPSYDuHPD5zrA9Z6v/cWUC3qPtO7Dc7q1YAPEjInmjlYGiSpy4BtDtpPzcDWMxN0Hy7DPHjv+nGcBB0PtG5ZX3LrtNlyihT4sHtsIYi/Y+d6EyXoAz7uaM9LjNVMNRlgNe9m+9DRZI/ktEpu6pt4kfD9KGp/hNjwH1dkyHLuhUVMgeMJ0/uFQfKenA7kVU6f1sTd/7a3NFhXBzihO23Oc7sRhfirKpVoCyXAmGZdvbstCGAX25im8koZnQBzgMWrKpJtoe3osfne5bLOexlKRPsQNZABydQAxcSN3Jlwa2d0/J0xPTxvuZw6dL5GOBDusAnU+RDQc4ga0RVJjSutLcYW52BsyiBMq6c2E12iyzD/hJJ4KgVTJOZvZCbSG5upfbj4dj4m7puwUZiFJwXKtk6nCS+Yy6m6hqh1NIqSsVMaqQZfzwV2r7KirwQvHvtQzKnoD3GYbCywfmzkagA20utGIjPvhSo8GZPGPt08die7O/vvMQ2kt11FBHopGZSwhnOJ1m+oP7Wn+Q+I2qk6HxMp+Moji9p3vjee4NWJ32dOGTlnmNn7EQWvGVCFX1sheW5pqO6QwMnfWWHodHwe/DDf2jx+5UhM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR04MB8002.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(376002)(366004)(346002)(39860400002)(396003)(136003)(7416002)(122000001)(478600001)(66476007)(38100700002)(2906002)(6486002)(30864003)(186003)(9686003)(71200400001)(6512007)(1076003)(26005)(19627235002)(8936002)(8676002)(83380400001)(6506007)(5660300002)(54906003)(6916009)(33656002)(86362001)(316002)(33716001)(64756008)(66556008)(66946007)(91956017)(66446008)(4326008)(76116006)(87944003)(38070700004)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4BO7me0KFX002Ah1U69QX+RMNgrJije1Lhbtb1bjqTc/VQUSxZABPUu9BFiV?=
 =?us-ascii?Q?iD5FXuu3/DFliiRmDudC+FH0OFmMd1ODcXjWKkuPlr8CmI5zJYlwHVEvBqHr?=
 =?us-ascii?Q?cL+rBwNm9F3AmJYndTIRl15L21EcxlSpwMwNH9HYD3Bk27tP0zU1BK/Ct4oH?=
 =?us-ascii?Q?+tckB7yfaeUGNg63VDEg0ohBLaceCGUH3/Fj/UHvXSkM1TOl+PE/+X7dY56O?=
 =?us-ascii?Q?sRefhF7EjBcGvJfON9c9tiJXVcswLK8OHGlYuNdg/uvNviK+zEKvrbJyo9Um?=
 =?us-ascii?Q?Wlegng2O424JuoYk6va51jWpi7aJvTGAhfN0KXUb2uTdB+o1dPuxc9jNx2Qi?=
 =?us-ascii?Q?Eg7y50ClzT765zvYIxRmP8ryw8U7KYN6GYOfqQwhMopwX3ARphkuhi2AwpG8?=
 =?us-ascii?Q?wbN/jn+HxhnYOoH0YOw6oulkTFmIoQbrr5SqGgArO3325PrgffqOy0YA2YyU?=
 =?us-ascii?Q?IDf303jAKSI9tUVKX9ONeNCXKTwc5fVrlbqGWMZenO8lLJqnMOGnjMYVccGl?=
 =?us-ascii?Q?hlUtbVsBtSECbhSm46p8wxviR9pUJHnXzwLW37H6chE8Uyx81LHW8HQ7RlQc?=
 =?us-ascii?Q?90JxN9S0CBPC9rredOu5pRSnz4+C/zoSDoLym2CmGrSaPGD8vq3F5Hw8aBZg?=
 =?us-ascii?Q?dZVECwuMsLOkTLFw+2DVIrtDr4dE7/L0fzjH7C5YfwarVCEbJnyjUf6sM5Bp?=
 =?us-ascii?Q?Kg6+uMZVVRgBHtS7e7CgYgBG1h2FJlxyNfIt0L4JLyaiIsBjou2jC17tFJXZ?=
 =?us-ascii?Q?gRX5Fq/iJsryXvppnPMjrUlH/8i8fMRZYeUx6e3rx3cWDlM2e2P/LJiPe5w/?=
 =?us-ascii?Q?+8/55t2Asxi0fLqPbwE7H8K2vJkMQAFExKdLSOV59EC7e6wsLRGKbTuVvDcl?=
 =?us-ascii?Q?6DwELbdCe4dAdtIHtpiPhguTQWAYd/zxTAGhz8QsDGm0cf3qedUb3wvozejU?=
 =?us-ascii?Q?SbtPuElIoJbA6fzIkNTEZn+GFNYFhdWag3tFmMpUIYYp58YA4KvTlsEb3YUh?=
 =?us-ascii?Q?Qvy5lrvKvA4RszSVuiScLCpAgEoryjRrawYesle9SU0X4BKcgDc2J7ug+i2M?=
 =?us-ascii?Q?HOot/oD/oLDXbl3EosxKMtIPsQAh0TZuyQnAUNwXaOaqGfCtqCkh6gx9GLow?=
 =?us-ascii?Q?GtbiowewvdoqDilUqTPezonc8z8yX6WiMnkOzfFwWWI/0tsMreEUxqPxDbNS?=
 =?us-ascii?Q?UQlWBu4bbyXysomTPPAZa36dV31Yk/78kDYYesAnnOk+gswrKhkgmfEK1PoO?=
 =?us-ascii?Q?WRuuOQlZ29Fs0tcZR34bgNps1XklE1qfyQwl9NOu62CAsRpzhbRcfx1u+83w?=
 =?us-ascii?Q?2lv+6HFPxLYN8MpufYyAz/2X?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8F04666415CBFC43A8559B6DB1011E30@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR04MB8002.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63f5aeb2-0be1-49ae-328c-08d950db61dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2021 08:49:01.8188 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MdUwRAtSfZAwGQnoS0olmJGKJWn0FdTAdszd5ybim5e3TNjhFbql3qU3WmXq+YB87ebLLu8oa3OZqWBcJ0RztQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR04MB8131
X-Proofpoint-ORIG-GUID: m4U15aQFdElmqq4RsdSiXX7fKhlssCuV
X-Proofpoint-GUID: m4U15aQFdElmqq4RsdSiXX7fKhlssCuV
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-27_06:2021-07-27,
 2021-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 spamscore=0 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107270050
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

On Mon, Jul 12, 2021 at 05:04:40PM CDT, Iwona Winiarska wrote:
>From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>
>ASPEED AST24xx/AST25xx/AST26xx SoCs supports the PECI electrical
>interface (a.k.a PECI wire).
>
>Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>Co-developed-by: Iwona Winiarska <iwona.winiarska@intel.com>
>Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
>Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>---
> MAINTAINERS                           |   9 +
> drivers/peci/Kconfig                  |   6 +
> drivers/peci/Makefile                 |   3 +
> drivers/peci/controller/Kconfig       |  12 +
> drivers/peci/controller/Makefile      |   3 +
> drivers/peci/controller/peci-aspeed.c | 501 ++++++++++++++++++++++++++
> 6 files changed, 534 insertions(+)
> create mode 100644 drivers/peci/controller/Kconfig
> create mode 100644 drivers/peci/controller/Makefile
> create mode 100644 drivers/peci/controller/peci-aspeed.c
>
>diff --git a/MAINTAINERS b/MAINTAINERS
>index 47411e2b6336..4ba874afa2fa 100644
>--- a/MAINTAINERS
>+++ b/MAINTAINERS
>@@ -2865,6 +2865,15 @@ S:	Maintained
> F:	Documentation/hwmon/asc7621.rst
> F:	drivers/hwmon/asc7621.c
>
>+ASPEED PECI CONTROLLER
>+M:	Iwona Winiarska <iwona.winiarska@intel.com>
>+M:	Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>+L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
>+L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
>+S:	Supported
>+F:	Documentation/devicetree/bindings/peci/peci-aspeed.yaml
>+F:	drivers/peci/controller/peci-aspeed.c
>+
> ASPEED PINCTRL DRIVERS
> M:	Andrew Jeffery <andrew@aj.id.au>
> L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
>diff --git a/drivers/peci/Kconfig b/drivers/peci/Kconfig
>index 601cc3c3c852..0d0ee8009713 100644
>--- a/drivers/peci/Kconfig
>+++ b/drivers/peci/Kconfig
>@@ -12,3 +12,9 @@ menuconfig PECI
>
> 	  This support is also available as a module. If so, the module
> 	  will be called peci.
>+
>+if PECI
>+
>+source "drivers/peci/controller/Kconfig"
>+
>+endif # PECI
>diff --git a/drivers/peci/Makefile b/drivers/peci/Makefile
>index 2bb2f51bcda7..621a993e306a 100644
>--- a/drivers/peci/Makefile
>+++ b/drivers/peci/Makefile
>@@ -3,3 +3,6 @@
> # Core functionality
> peci-y :=3D core.o sysfs.o
> obj-$(CONFIG_PECI) +=3D peci.o
>+
>+# Hardware specific bus drivers
>+obj-y +=3D controller/
>diff --git a/drivers/peci/controller/Kconfig b/drivers/peci/controller/Kco=
nfig
>new file mode 100644
>index 000000000000..8ddbe494677f
>--- /dev/null
>+++ b/drivers/peci/controller/Kconfig
>@@ -0,0 +1,12 @@
>+# SPDX-License-Identifier: GPL-2.0-only
>+
>+config PECI_ASPEED
>+	tristate "ASPEED PECI support"
>+	depends on ARCH_ASPEED || COMPILE_TEST
>+	depends on OF
>+	depends on HAS_IOMEM
>+	help
>+	  Enable this driver if you want to support ASPEED PECI controller.
>+
>+	  This driver can be also build as a module. If so, the module
>+	  will be called peci-aspeed.
>diff --git a/drivers/peci/controller/Makefile b/drivers/peci/controller/Ma=
kefile
>new file mode 100644
>index 000000000000..022c28ef1bf0
>--- /dev/null
>+++ b/drivers/peci/controller/Makefile
>@@ -0,0 +1,3 @@
>+# SPDX-License-Identifier: GPL-2.0-only
>+
>+obj-$(CONFIG_PECI_ASPEED)	+=3D peci-aspeed.o
>diff --git a/drivers/peci/controller/peci-aspeed.c b/drivers/peci/controll=
er/peci-aspeed.c
>new file mode 100644
>index 000000000000..888b46383ea4
>--- /dev/null
>+++ b/drivers/peci/controller/peci-aspeed.c
>@@ -0,0 +1,501 @@
>+// SPDX-License-Identifier: GPL-2.0-only
>+// Copyright (C) 2012-2017 ASPEED Technology Inc.
>+// Copyright (c) 2018-2021 Intel Corporation
>+
>+#include <linux/bitfield.h>
>+#include <linux/clk.h>
>+#include <linux/delay.h>
>+#include <linux/interrupt.h>
>+#include <linux/io.h>
>+#include <linux/iopoll.h>
>+#include <linux/jiffies.h>
>+#include <linux/module.h>
>+#include <linux/of.h>
>+#include <linux/peci.h>
>+#include <linux/platform_device.h>
>+#include <linux/reset.h>
>+
>+#include <asm/unaligned.h>
>+
>+/* ASPEED PECI Registers */
>+/* Control Register */
>+#define ASPEED_PECI_CTRL			0x00
>+#define   ASPEED_PECI_CTRL_SAMPLING_MASK	GENMASK(19, 16)
>+#define   ASPEED_PECI_CTRL_READ_MODE_MASK	GENMASK(13, 12)
>+#define   ASPEED_PECI_CTRL_READ_MODE_COUNT	BIT(12)
>+#define   ASPEED_PECI_CTRL_READ_MODE_DBG	BIT(13)

Nitpick: might be nice to keep things in a consistent descending order
here (13 then 12).

>+#define   ASPEED_PECI_CTRL_CLK_SOURCE_MASK	BIT(11)

_MASK suffix seems out of place on this one.

>+#define   ASPEED_PECI_CTRL_CLK_DIV_MASK		GENMASK(10, 8)
>+#define   ASPEED_PECI_CTRL_INVERT_OUT		BIT(7)
>+#define   ASPEED_PECI_CTRL_INVERT_IN		BIT(6)
>+#define   ASPEED_PECI_CTRL_BUS_CONTENT_EN	BIT(5)

It *is* already kind of a long macro name, but abbreviating "contention"
to "content" seems a bit confusing; I'd suggest keeping the extra three
characters (or maybe drop the _EN suffix if you want to avoid making it
even longer).

>+#define   ASPEED_PECI_CTRL_PECI_EN		BIT(4)
>+#define   ASPEED_PECI_CTRL_PECI_CLK_EN		BIT(0)
>+
>+/* Timing Negotiation Register */
>+#define ASPEED_PECI_TIMING_NEGOTIATION		0x04
>+#define   ASPEED_PECI_TIMING_MESSAGE_MASK	GENMASK(15, 8)
>+#define   ASPEED_PECI_TIMING_ADDRESS_MASK	GENMASK(7, 0)
>+
>+/* Command Register */
>+#define ASPEED_PECI_CMD				0x08
>+#define   ASPEED_PECI_CMD_PIN_MON		BIT(31)
>+#define   ASPEED_PECI_CMD_STS_MASK		GENMASK(27, 24)
>+#define     ASPEED_PECI_CMD_STS_ADDR_T_NEGO	0x3
>+#define   ASPEED_PECI_CMD_IDLE_MASK		\
>+	  (ASPEED_PECI_CMD_STS_MASK | ASPEED_PECI_CMD_PIN_MON)
>+#define   ASPEED_PECI_CMD_FIRE			BIT(0)
>+
>+/* Read/Write Length Register */
>+#define ASPEED_PECI_RW_LENGTH			0x0c
>+#define   ASPEED_PECI_AW_FCS_EN			BIT(31)
>+#define   ASPEED_PECI_READ_LEN_MASK		GENMASK(23, 16)
>+#define   ASPEED_PECI_WRITE_LEN_MASK		GENMASK(15, 8)
>+#define   ASPEED_PECI_TAGET_ADDR_MASK		GENMASK(7, 0)

s/TAGET/TARGET/

>+
>+/* Expected FCS Data Register */
>+#define ASPEED_PECI_EXP_FCS			0x10
>+#define   ASPEED_PECI_EXP_READ_FCS_MASK		GENMASK(23, 16)
>+#define   ASPEED_PECI_EXP_AW_FCS_AUTO_MASK	GENMASK(15, 8)
>+#define   ASPEED_PECI_EXP_WRITE_FCS_MASK	GENMASK(7, 0)
>+
>+/* Captured FCS Data Register */
>+#define ASPEED_PECI_CAP_FCS			0x14
>+#define   ASPEED_PECI_CAP_READ_FCS_MASK		GENMASK(23, 16)
>+#define   ASPEED_PECI_CAP_WRITE_FCS_MASK	GENMASK(7, 0)
>+
>+/* Interrupt Register */
>+#define ASPEED_PECI_INT_CTRL			0x18
>+#define   ASPEED_PECI_TIMING_NEGO_SEL_MASK	GENMASK(31, 30)
>+#define     ASPEED_PECI_1ST_BIT_OF_ADDR_NEGO	0
>+#define     ASPEED_PECI_2ND_BIT_OF_ADDR_NEGO	1
>+#define     ASPEED_PECI_MESSAGE_NEGO		2
>+#define   ASPEED_PECI_INT_MASK			GENMASK(4, 0)
>+#define   ASPEED_PECI_INT_BUS_TIMEOUT		BIT(4)
>+#define   ASPEED_PECI_INT_BUS_CONNECT		BIT(3)

s/CONNECT/CONTENTION/

>+#define   ASPEED_PECI_INT_W_FCS_BAD		BIT(2)
>+#define   ASPEED_PECI_INT_W_FCS_ABORT		BIT(1)
>+#define   ASPEED_PECI_INT_CMD_DONE		BIT(0)
>+
>+/* Interrupt Status Register */
>+#define ASPEED_PECI_INT_STS			0x1c
>+#define   ASPEED_PECI_INT_TIMING_RESULT_MASK	GENMASK(29, 16)
>+	  /* bits[4..0]: Same bit fields in the 'Interrupt Register' */
>+
>+/* Rx/Tx Data Buffer Registers */
>+#define ASPEED_PECI_W_DATA0			0x20
>+#define ASPEED_PECI_W_DATA1			0x24
>+#define ASPEED_PECI_W_DATA2			0x28
>+#define ASPEED_PECI_W_DATA3			0x2c
>+#define ASPEED_PECI_R_DATA0			0x30
>+#define ASPEED_PECI_R_DATA1			0x34
>+#define ASPEED_PECI_R_DATA2			0x38
>+#define ASPEED_PECI_R_DATA3			0x3c
>+#define ASPEED_PECI_W_DATA4			0x40
>+#define ASPEED_PECI_W_DATA5			0x44
>+#define ASPEED_PECI_W_DATA6			0x48
>+#define ASPEED_PECI_W_DATA7			0x4c
>+#define ASPEED_PECI_R_DATA4			0x50
>+#define ASPEED_PECI_R_DATA5			0x54
>+#define ASPEED_PECI_R_DATA6			0x58
>+#define ASPEED_PECI_R_DATA7			0x5c
>+#define   ASPEED_PECI_DATA_BUF_SIZE_MAX		32
>+
>+/* Timing Negotiation */
>+#define ASPEED_PECI_RD_SAMPLING_POINT_DEFAULT	8
>+#define ASPEED_PECI_RD_SAMPLING_POINT_MAX	(BIT(4) - 1)
>+#define ASPEED_PECI_CLK_DIV_DEFAULT		0
>+#define ASPEED_PECI_CLK_DIV_MAX			(BIT(3) - 1)
>+#define ASPEED_PECI_MSG_TIMING_DEFAULT		1
>+#define ASPEED_PECI_MSG_TIMING_MAX		(BIT(8) - 1)
>+#define ASPEED_PECI_ADDR_TIMING_DEFAULT		1
>+#define ASPEED_PECI_ADDR_TIMING_MAX		(BIT(8) - 1)
>+
>+/* Timeout */
>+#define ASPEED_PECI_IDLE_CHECK_TIMEOUT_US	(50 * USEC_PER_MSEC)
>+#define ASPEED_PECI_IDLE_CHECK_INTERVAL_US	(10 * USEC_PER_MSEC)
>+#define ASPEED_PECI_CMD_TIMEOUT_MS_DEFAULT	(1000)
>+#define ASPEED_PECI_CMD_TIMEOUT_MS_MAX		(1000)
>+
>+struct aspeed_peci {
>+	struct peci_controller controller;
>+	struct device *dev;
>+	void __iomem *base;
>+	struct clk *clk;
>+	struct reset_control *rst;
>+	int irq;
>+	spinlock_t lock; /* to sync completion status handling */
>+	struct completion xfer_complete;
>+	u32 status;
>+	u32 cmd_timeout_ms;
>+	u32 msg_timing;
>+	u32 addr_timing;
>+	u32 rd_sampling_point;
>+	u32 clk_div;
>+};
>+
>+static inline struct aspeed_peci *to_aspeed_peci(struct peci_controller *=
a)
>+{
>+	return container_of(a, struct aspeed_peci, controller);
>+}
>+
>+static void aspeed_peci_init_regs(struct aspeed_peci *priv)
>+{
>+	u32 val;
>+
>+	val =3D FIELD_PREP(ASPEED_PECI_CTRL_CLK_DIV_MASK, ASPEED_PECI_CLK_DIV_DE=
FAULT);
>+	val |=3D ASPEED_PECI_CTRL_PECI_CLK_EN;
>+	writel(val, priv->base + ASPEED_PECI_CTRL);
>+	/*
>+	 * Timing negotiation period setting.
>+	 * The unit of the programmed value is 4 times of PECI clock period.
>+	 */
>+	val =3D FIELD_PREP(ASPEED_PECI_TIMING_MESSAGE_MASK, priv->msg_timing);
>+	val |=3D FIELD_PREP(ASPEED_PECI_TIMING_ADDRESS_MASK, priv->addr_timing);
>+	writel(val, priv->base + ASPEED_PECI_TIMING_NEGOTIATION);
>+
>+	/* Clear interrupts */
>+	val =3D readl(priv->base + ASPEED_PECI_INT_STS) | ASPEED_PECI_INT_MASK;

This should be & instead of |, I'm guessing?

>+	writel(val, priv->base + ASPEED_PECI_INT_STS);
>+
>+	/* Set timing negotiation mode and enable interrupts */
>+	val =3D FIELD_PREP(ASPEED_PECI_TIMING_NEGO_SEL_MASK, ASPEED_PECI_1ST_BIT=
_OF_ADDR_NEGO);
>+	val |=3D ASPEED_PECI_INT_MASK;
>+	writel(val, priv->base + ASPEED_PECI_INT_CTRL);
>+
>+	val =3D FIELD_PREP(ASPEED_PECI_CTRL_SAMPLING_MASK, priv->rd_sampling_poi=
nt);
>+	val |=3D FIELD_PREP(ASPEED_PECI_CTRL_CLK_DIV_MASK, priv->clk_div);
>+	val |=3D ASPEED_PECI_CTRL_PECI_EN;
>+	val |=3D ASPEED_PECI_CTRL_PECI_CLK_EN;
>+	writel(val, priv->base + ASPEED_PECI_CTRL);
>+}
>+
>+static inline int aspeed_peci_check_idle(struct aspeed_peci *priv)
>+{
>+	u32 cmd_sts =3D readl(priv->base + ASPEED_PECI_CMD);
>+
>+	if (FIELD_GET(ASPEED_PECI_CMD_STS_MASK, cmd_sts) =3D=3D ASPEED_PECI_CMD_=
STS_ADDR_T_NEGO)
>+		aspeed_peci_init_regs(priv);
>+
>+	return readl_poll_timeout(priv->base + ASPEED_PECI_CMD,
>+				  cmd_sts,
>+				  !(cmd_sts & ASPEED_PECI_CMD_IDLE_MASK),
>+				  ASPEED_PECI_IDLE_CHECK_INTERVAL_US,
>+				  ASPEED_PECI_IDLE_CHECK_TIMEOUT_US);
>+}
>+
>+static int aspeed_peci_xfer(struct peci_controller *controller,
>+			    u8 addr, struct peci_request *req)
>+{
>+	struct aspeed_peci *priv =3D to_aspeed_peci(controller);
>+	unsigned long flags, timeout =3D msecs_to_jiffies(priv->cmd_timeout_ms);
>+	u32 peci_head;
>+	int ret;
>+
>+	if (req->tx.len > ASPEED_PECI_DATA_BUF_SIZE_MAX ||
>+	    req->rx.len > ASPEED_PECI_DATA_BUF_SIZE_MAX)
>+		return -EINVAL;
>+
>+	/* Check command sts and bus idle state */
>+	ret =3D aspeed_peci_check_idle(priv);
>+	if (ret)
>+		return ret; /* -ETIMEDOUT */
>+
>+	spin_lock_irqsave(&priv->lock, flags);
>+	reinit_completion(&priv->xfer_complete);
>+
>+	peci_head =3D FIELD_PREP(ASPEED_PECI_TAGET_ADDR_MASK, addr) |
>+		    FIELD_PREP(ASPEED_PECI_WRITE_LEN_MASK, req->tx.len) |
>+		    FIELD_PREP(ASPEED_PECI_READ_LEN_MASK, req->rx.len);
>+
>+	writel(peci_head, priv->base + ASPEED_PECI_RW_LENGTH);
>+
>+	memcpy_toio(priv->base + ASPEED_PECI_W_DATA0, req->tx.buf,
>+		    req->tx.len > 16 ? 16 : req->tx.len);

min(req->tx.len, 16) for the third argument there might be a bit
clearer.

>+	if (req->tx.len > 16)
>+		memcpy_toio(priv->base + ASPEED_PECI_W_DATA4, req->tx.buf + 16,
>+			    req->tx.len - 16);
>+
>+	dev_dbg(priv->dev, "HEAD : 0x%08x\n", peci_head);
>+	print_hex_dump_bytes("TX : ", DUMP_PREFIX_NONE, req->tx.buf, req->tx.len=
);
>+
>+	priv->status =3D 0;
>+	writel(ASPEED_PECI_CMD_FIRE, priv->base + ASPEED_PECI_CMD);
>+	spin_unlock_irqrestore(&priv->lock, flags);
>+
>+	ret =3D wait_for_completion_interruptible_timeout(&priv->xfer_complete, =
timeout);
>+	if (ret < 0)
>+		return ret;
>+
>+	if (ret =3D=3D 0) {
>+		dev_dbg(priv->dev, "Timeout waiting for a response!\n");
>+		return -ETIMEDOUT;
>+	}
>+
>+	spin_lock_irqsave(&priv->lock, flags);
>+
>+	writel(0, priv->base + ASPEED_PECI_CMD);
>+
>+	if (priv->status !=3D ASPEED_PECI_INT_CMD_DONE) {
>+		spin_unlock_irqrestore(&priv->lock, flags);
>+		dev_dbg(priv->dev, "No valid response!\n");
>+		return -EIO;
>+	}
>+
>+	spin_unlock_irqrestore(&priv->lock, flags);
>+
>+	memcpy_fromio(req->rx.buf, priv->base + ASPEED_PECI_R_DATA0,
>+		      req->rx.len > 16 ? 16 : req->rx.len);

Likewise, min(req->rx.len, 16) here.

>+	if (req->rx.len > 16)
>+		memcpy_fromio(req->rx.buf + 16, priv->base + ASPEED_PECI_R_DATA4,
>+			      req->rx.len - 16);
>+
>+	print_hex_dump_bytes("RX : ", DUMP_PREFIX_NONE, req->rx.buf, req->rx.len=
);
>+
>+	return 0;
>+}
>+
>+static irqreturn_t aspeed_peci_irq_handler(int irq, void *arg)
>+{
>+	struct aspeed_peci *priv =3D arg;
>+	u32 status;
>+
>+	spin_lock(&priv->lock);
>+	status =3D readl(priv->base + ASPEED_PECI_INT_STS);
>+	writel(status, priv->base + ASPEED_PECI_INT_STS);
>+	priv->status |=3D (status & ASPEED_PECI_INT_MASK);
>+
>+	/*
>+	 * In most cases, interrupt bits will be set one by one but also note
>+	 * that multiple interrupt bits could be set at the same time.
>+	 */
>+	if (status & ASPEED_PECI_INT_BUS_TIMEOUT)
>+		dev_dbg_ratelimited(priv->dev, "ASPEED_PECI_INT_BUS_TIMEOUT\n");
>+
>+	if (status & ASPEED_PECI_INT_BUS_CONNECT)
>+		dev_dbg_ratelimited(priv->dev, "ASPEED_PECI_INT_BUS_CONNECT\n");

s/CONNECT/CONTENTION/ here too (in the message string).

>+
>+	if (status & ASPEED_PECI_INT_W_FCS_BAD)
>+		dev_dbg_ratelimited(priv->dev, "ASPEED_PECI_INT_W_FCS_BAD\n");
>+
>+	if (status & ASPEED_PECI_INT_W_FCS_ABORT)
>+		dev_dbg_ratelimited(priv->dev, "ASPEED_PECI_INT_W_FCS_ABORT\n");

Bus contention can of course arise legitimately, and I suppose an
offline host CPU might result in a timeout, so dbg seems fine for those
(though as Dan suggests, making some counters available seems like a
good idea, especially for contention).  Are the FCS error cases
significant enough to warrant something less likely to go unnoticed
though?  (e.g. dev_warn_ratelimited() or something?)

>+
>+	/*
>+	 * All commands should be ended up with a ASPEED_PECI_INT_CMD_DONE bit
>+	 * set even in an error case.
>+	 */
>+	if (status & ASPEED_PECI_INT_CMD_DONE)
>+		complete(&priv->xfer_complete);
>+
>+	spin_unlock(&priv->lock);
>+
>+	return IRQ_HANDLED;
>+}
>+
>+static void __sanitize_clock_divider(struct aspeed_peci *priv)
>+{
>+	u32 clk_div;
>+	int ret;
>+
>+	ret =3D device_property_read_u32(priv->dev, "clock-divider", &clk_div);
>+	if (ret) {
>+		clk_div =3D ASPEED_PECI_CLK_DIV_DEFAULT;
>+	} else if (clk_div > ASPEED_PECI_CLK_DIV_MAX) {
>+		dev_warn(priv->dev, "Invalid clock-divider: %u, Using default: %u\n",
>+			 clk_div, ASPEED_PECI_CLK_DIV_DEFAULT);
>+
>+		clk_div =3D ASPEED_PECI_CLK_DIV_DEFAULT;
>+	}
>+
>+	priv->clk_div =3D clk_div;
>+}
>+

The naming of these __sanitize_*() functions is a bit inconsistent with
the rest of the driver -- though given how similar they all look, could
they instead be refactored into a single helper function taking
property-name, default-value, and max-value parameters?

>+static void __sanitize_msg_timing(struct aspeed_peci *priv)
>+{
>+	u32 msg_timing;
>+	int ret;
>+
>+	ret =3D device_property_read_u32(priv->dev, "msg-timing", &msg_timing);
>+	if (ret) {
>+		msg_timing =3D ASPEED_PECI_MSG_TIMING_DEFAULT;
>+	} else if (msg_timing > ASPEED_PECI_MSG_TIMING_MAX) {
>+		dev_warn(priv->dev, "Invalid msg-timing : %u, Use default : %u\n",
>+			 msg_timing, ASPEED_PECI_MSG_TIMING_DEFAULT);
>+
>+		msg_timing =3D ASPEED_PECI_MSG_TIMING_DEFAULT;
>+	}
>+
>+	priv->msg_timing =3D msg_timing;
>+}
>+
>+static void __sanitize_addr_timing(struct aspeed_peci *priv)
>+{
>+	u32 addr_timing;
>+	int ret;
>+
>+	ret =3D device_property_read_u32(priv->dev, "addr-timing", &addr_timing)=
;
>+	if (ret) {
>+		addr_timing =3D ASPEED_PECI_ADDR_TIMING_DEFAULT;
>+	} else if (addr_timing > ASPEED_PECI_ADDR_TIMING_MAX) {
>+		dev_warn(priv->dev, "Invalid addr-timing : %u, Use default : %u\n",
>+			 addr_timing, ASPEED_PECI_ADDR_TIMING_DEFAULT);
>+
>+		addr_timing =3D ASPEED_PECI_ADDR_TIMING_DEFAULT;
>+	}
>+
>+	priv->addr_timing =3D addr_timing;
>+}
>+
>+static void __sanitize_rd_sampling_point(struct aspeed_peci *priv)
>+{
>+	u32 rd_sampling_point;
>+	int ret;
>+
>+	ret =3D device_property_read_u32(priv->dev, "rd-sampling-point", &rd_sam=
pling_point);
>+	if (ret) {
>+		rd_sampling_point =3D ASPEED_PECI_RD_SAMPLING_POINT_DEFAULT;
>+	} else if (rd_sampling_point > ASPEED_PECI_RD_SAMPLING_POINT_MAX) {
>+		dev_warn(priv->dev, "Invalid rd-sampling-point: %u, Use default : %u\n"=
,
>+			 rd_sampling_point, ASPEED_PECI_RD_SAMPLING_POINT_DEFAULT);
>+
>+		rd_sampling_point =3D ASPEED_PECI_RD_SAMPLING_POINT_DEFAULT;
>+	}
>+
>+	priv->rd_sampling_point =3D rd_sampling_point;
>+}
>+
>+static void __sanitize_cmd_timeout(struct aspeed_peci *priv)
>+{
>+	u32 timeout;
>+	int ret;
>+
>+	ret =3D device_property_read_u32(priv->dev, "cmd-timeout-ms", &timeout);
>+	if (ret) {
>+		timeout =3D ASPEED_PECI_CMD_TIMEOUT_MS_DEFAULT;
>+	} else if (timeout > ASPEED_PECI_CMD_TIMEOUT_MS_MAX || timeout =3D=3D 0)=
 {
>+		dev_warn(priv->dev, "Invalid cmd-timeout-ms: %u, Use default: %u\n",
>+			 timeout, ASPEED_PECI_CMD_TIMEOUT_MS_DEFAULT);
>+
>+		timeout =3D ASPEED_PECI_CMD_TIMEOUT_MS_DEFAULT;
>+	}
>+
>+	priv->cmd_timeout_ms =3D timeout;
>+}
>+
>+static void aspeed_peci_device_property_sanitize(struct aspeed_peci *priv=
)
>+{
>+	__sanitize_clock_divider(priv);
>+	__sanitize_msg_timing(priv);
>+	__sanitize_addr_timing(priv);
>+	__sanitize_rd_sampling_point(priv);
>+	__sanitize_cmd_timeout(priv);
>+}
>+
>+static void aspeed_peci_disable_clk(void *data)
>+{
>+	clk_disable_unprepare(data);
>+}
>+
>+static int aspeed_peci_init_ctrl(struct aspeed_peci *priv)
>+{
>+	int ret;
>+
>+	priv->clk =3D devm_clk_get(priv->dev, NULL);
>+	if (IS_ERR(priv->clk))
>+		return dev_err_probe(priv->dev, PTR_ERR(priv->clk), "Failed to get clk =
source\n");
>+
>+	ret =3D clk_prepare_enable(priv->clk);
>+	if (ret) {
>+		dev_err(priv->dev, "Failed to enable clock\n");
>+		return ret;
>+	}
>+
>+	ret =3D devm_add_action_or_reset(priv->dev, aspeed_peci_disable_clk, pri=
v->clk);
>+	if (ret)
>+		return ret;
>+
>+	aspeed_peci_device_property_sanitize(priv);
>+
>+	aspeed_peci_init_regs(priv);
>+
>+	return 0;
>+}
>+
>+static int aspeed_peci_probe(struct platform_device *pdev)
>+{
>+	struct aspeed_peci *priv;
>+	int ret;
>+
>+	priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>+	if (!priv)
>+		return -ENOMEM;
>+
>+	priv->dev =3D &pdev->dev;
>+	dev_set_drvdata(priv->dev, priv);
>+
>+	priv->base =3D devm_platform_ioremap_resource(pdev, 0);
>+	if (IS_ERR(priv->base))
>+		return PTR_ERR(priv->base);
>+
>+	priv->irq =3D platform_get_irq(pdev, 0);
>+	if (!priv->irq)
>+		return priv->irq;
>+
>+	ret =3D devm_request_irq(&pdev->dev, priv->irq, aspeed_peci_irq_handler,
>+			       0, "peci-aspeed-irq", priv);

Might as well drop the "-irq" suffix here?  (Seems a bit redundant, and
a quick glance through /proc/interrupts on the systems I have at hand
doesn't show anything else following that convention.)

>+	if (ret)
>+		return ret;
>+
>+	init_completion(&priv->xfer_complete);
>+	spin_lock_init(&priv->lock);
>+
>+	priv->controller.xfer =3D aspeed_peci_xfer;
>+
>+	priv->rst =3D devm_reset_control_get(&pdev->dev, NULL);
>+	if (IS_ERR(priv->rst)) {
>+		dev_err(&pdev->dev, "Missing or invalid reset controller entry\n");
>+		return PTR_ERR(priv->rst);
>+	}
>+	reset_control_deassert(priv->rst);
>+
>+	ret =3D aspeed_peci_init_ctrl(priv);
>+	if (ret)
>+		return ret;
>+
>+	return peci_controller_add(&priv->controller, priv->dev);
>+}
>+
>+static int aspeed_peci_remove(struct platform_device *pdev)
>+{
>+	struct aspeed_peci *priv =3D dev_get_drvdata(&pdev->dev);
>+
>+	peci_controller_remove(&priv->controller);
>+	reset_control_assert(priv->rst);
>+
>+	return 0;
>+}
>+
>+static const struct of_device_id aspeed_peci_of_table[] =3D {
>+	{ .compatible =3D "aspeed,ast2400-peci", },
>+	{ .compatible =3D "aspeed,ast2500-peci", },
>+	{ .compatible =3D "aspeed,ast2600-peci", },
>+	{ }
>+};
>+MODULE_DEVICE_TABLE(of, aspeed_peci_of_table);
>+
>+static struct platform_driver aspeed_peci_driver =3D {
>+	.probe  =3D aspeed_peci_probe,
>+	.remove =3D aspeed_peci_remove,
>+	.driver =3D {
>+		.name           =3D "peci-aspeed",
>+		.of_match_table =3D aspeed_peci_of_table,
>+	},
>+};
>+module_platform_driver(aspeed_peci_driver);
>+
>+MODULE_AUTHOR("Ryan Chen <ryan_chen@aspeedtech.com>");
>+MODULE_AUTHOR("Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>");
>+MODULE_DESCRIPTION("ASPEED PECI driver");
>+MODULE_LICENSE("GPL");
>+MODULE_IMPORT_NS(PECI);
>--=20
>2.31.1
>=
