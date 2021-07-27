Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F213D716E
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 10:46:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GYr4Q6TvVz30JW
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 18:46:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=equinixinc.onmicrosoft.com header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-equinixinc-onmicrosoft-com header.b=COusa5iY;
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
 header.s=selector2-equinixinc-onmicrosoft-com header.b=COusa5iY; 
 dkim-atps=neutral
X-Greylist: delayed 5912 seconds by postgrey-1.36 at boromir;
 Tue, 27 Jul 2021 18:46:06 AEST
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com
 [148.163.148.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GYr3y24KLz307Z;
 Tue, 27 Jul 2021 18:46:05 +1000 (AEST)
Received: from pps.filterd (m0165118.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16R6wPui017422; Tue, 27 Jul 2021 07:06:54 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
 by mx0a-00268f01.pphosted.com with ESMTP id 3a236m1nq0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Jul 2021 07:06:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gmfPNYx4/VH2AwNEgj/09tgn3ij74KhJhFU8fBko+IOphZOdenT1vL0tKiJ4Ml7wgDatFrl6AMwi1SO10L97AGv3nzP6WgMjPAr4clP2h1A/a5LY4eWX7OOYI8Z8p1SRiAwEl8a3CPkONYt9RLms/j8Oc+lIG0362aQdXqGxZaXltiYoes8/MVNW0l3v3XZGA7KAIPucMDQgkFr9qLf5I6ZgI87phOdAw7/gxVk1U/Gl4q43PvszgiTDHpufSiepQBrG+Qct17VK4RnoOi6JbWQlq/plqp1PsvNBvB+f+qBvdUzAqofNM4h4A53p7OzyLKPfq95emNWQH/O/ZmUTtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=18AoYT96Id4iJvpupvxFOeN2xtBlvC66J5gLiODTbGk=;
 b=JapmFeZ0bmD65XrU21g436yo6JRGgcOAxXT+fCZkf5ai52rmc0qabym0mzMtwSnPKVBB9/9FqcChH1j62HF8LyyM1ZOAxCxbvhPoOkwIN3zVlhVl9R9urV4NY9fAUAgXWCALlr5nb7auvw+I+v0jZw5iQhZ2kVYYtLQn6pcpXDnqGd0Rt48EBmHfdlhGO4tt84JuSBeSL/ScIBETUtMgjIxK3dtDs5g2b9nV1uANXeycOZwbanVTmkEsPswv6kzG9GqO1q6p9SAJdJOGNs7p2sbfKNA7NvR0odRkLJmIhBOqZZt9vrkg3e8h+Edzdw0U+++7hW0N5keVi49XAj7hNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=equinixinc.onmicrosoft.com; s=selector2-equinixinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=18AoYT96Id4iJvpupvxFOeN2xtBlvC66J5gLiODTbGk=;
 b=COusa5iY14sbDDwmqwNDOFXEGE4kcOCMvvRjHPfg0mXUVzRw3MRQSA2d74aMnX4y9mCjs/AeSMya8DaP6KzOa+bqPe8Jblhj2smaALMfphzPxNueWC1KLf90scB0e0Cea79sTBnEt5Aa7+VE6pBJ88jwaE4DZeM8tGJj1ckXXWI=
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by DM8PR04MB7797.namprd04.prod.outlook.com (2603:10b6:8:3f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Tue, 27 Jul
 2021 07:06:52 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::953d:f9ec:b2cc:ca2b]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::953d:f9ec:b2cc:ca2b%6]) with mapi id 15.20.4352.032; Tue, 27 Jul 2021
 07:06:52 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Iwona Winiarska <iwona.winiarska@intel.com>
Subject: Re: [PATCH 11/14] hwmon: peci: Add cputemp driver
Thread-Topic: [PATCH 11/14] hwmon: peci: Add cputemp driver
Thread-Index: AQHXgrX5rzpUzdTFsE2/Bu/x34QZOw==
Date: Tue, 27 Jul 2021 07:06:52 +0000
Message-ID: <20210727070651.GP8018@packtop>
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
 <20210712220447.957418-12-iwona.winiarska@intel.com>
In-Reply-To: <20210712220447.957418-12-iwona.winiarska@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=equinix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 768376fd-8800-459c-053c-08d950cd1c8f
x-ms-traffictypediagnostic: DM8PR04MB7797:
x-microsoft-antispam-prvs: <DM8PR04MB7797FDAD575784E65B4B9FA4C3E99@DM8PR04MB7797.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +eqQsES9Q8xdhxtmbzoiHFSnjiGgPbfo6eWOHXJQInfbrMovzlmnwJBIyLlEjim1vf/xJID72GzGlnpFlQ3npyQbG1KlMmC1bG6yQXqNnQZJbnyp4dwaRsuY/ow7HsjDk6aHPVmncLtDq18rEzKVcrFpr/QXAWywsaQmM8e4DfE0H8MtOaAF9A5KKFcMKTjn43lIdUVScFY9UgwyY7TlH1QDShFEqd7fqn1g2Ofe1Nc2tbP+6FUof2XAcmo3m8CcR0zxOZQcS8kMr7tLwQrKdZWDop3++BvbNrz/CllMDLpYgEpqd7vK8NZidcfHX3M2Z/A0/DWDdxQgyCu2sZCpzdIL7iRtFpZLYsTkYQdnJ+9ODzJ6g7OKGR3x1zdd1IkiUDGQBud0eezew0t9gth0ko+ZOe9kXIpBDVYRuEjM1wTDJSPcXfooLxM+2Wle0vucO8LjPD2EEU2jmi7N/P6KYbFxNKQY7ev7+u/QNelunjrvJdHmKboQ2fFtd5uIjw9HQZK90yA4iM4Zy4XIp2IRGQwmkfjmIGw8IHw3hbSv+tR1DJ/56SmfIq854SlYEcrbAnR+aK9NolaJXtscd+UB/gbQ4l0SewFnwONGide2dd9mTvuUYusN9tycEhXW+7U/JJ6jsrKtIbzdZ3eJpFM50ZwqNUAsObyeVEVXH8L/lsYjmuaEGPVxfhyOUlBi7Ld+GtNT0zE0LxBdX4P25Q5L2w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR04MB8007.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(136003)(376002)(346002)(366004)(39860400002)(396003)(7416002)(122000001)(478600001)(38100700002)(2906002)(6486002)(30864003)(186003)(9686003)(6512007)(71200400001)(26005)(1076003)(8936002)(8676002)(33656002)(83380400001)(6506007)(5660300002)(6916009)(54906003)(86362001)(316002)(33716001)(64756008)(66556008)(66946007)(66476007)(4326008)(66446008)(76116006)(38070700004)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OWWmOaJi3fbm8yjUoHbP/jhldml/qDw+Ot8EukcxfRYWetmexUHjEq5XBYIv?=
 =?us-ascii?Q?MFD/qJgTQWx6uQVAmKrTN5V3DhyDYhRFnBWdr5Y3LJAIJ/2NL+tPGoiDOCtu?=
 =?us-ascii?Q?dlACXZFYWg3kigFE/rt5OlXzAU1QtCZL2AGLp0HIqZLLtwIbRWdEXwIbJ+Tj?=
 =?us-ascii?Q?3her+a0zOJrMllsK72IMmeoyB/A/iZZP9o4xAZGcJhT1YhTYNifBeO79AKc4?=
 =?us-ascii?Q?K1Yw+6nnwRwFEm6zoMoF1LRDyVxiEI/aE6i6ouknWHVSbtN/SaPztNfIRLoY?=
 =?us-ascii?Q?vgu7zRoD3VgKCgqQ41mUbm9Ym2u90mPI0dswB59o5u4/RDUcDnBEVywF/6+I?=
 =?us-ascii?Q?/47GJFKDdObJKTfjmWjAG5ef9dCfeS92+D2E8r8NWoCVr5VeiAK2LTZapfV5?=
 =?us-ascii?Q?8DJMn5On8TrUyF0geNl8LP0LCGSn/gXASPvxQYIis/iJTF72E0MdeCpL4t9N?=
 =?us-ascii?Q?d641ovnYKGs+1ErC5j3ZYzLhxAYE4KtxZc2UMehymYycCBunRwQHC/LF780p?=
 =?us-ascii?Q?l7aC4f9wRvrQvTfhPE0EvuMQnaHvye4LzBG4y+9b3fQq+XCBo52HUDGFXSL0?=
 =?us-ascii?Q?K+H23YVgzpahPLZbg2LdfVCOJlndxWYuiLgdXWa8lQwdeh7k3OBTBI0Szr1U?=
 =?us-ascii?Q?s4MJg7i/HgVnL12pAbJ6FfUr1hThxal2UFF0yBuigPGrPGL+Iclz5oSbzGAo?=
 =?us-ascii?Q?TC7RtivcegFYusifte8Ex/x2vrbB+BqDTKr2BpPdioFic+z4z2ITZJqlbmn7?=
 =?us-ascii?Q?TJ6kft8ICENnq/tjEgFM2NgN8aVZk16iIji+52gTxktYBysvZTbmHr/ckPub?=
 =?us-ascii?Q?ZbmsURAw4tgcfawhjVGL8N17qe9LNNkZ8DMjgweiD+jQ1uRRS4n/pFlg9SKX?=
 =?us-ascii?Q?wdLeNNfBhSA26mf65r4LIfhXUOgVTF1bcN4+aNjjT72IP+ZdZXgUkcZVWik3?=
 =?us-ascii?Q?AIhuGhGGpKxXNRsa0b4jxR5bhcvbJUO4VGDcWXkrcYWyn08mkvqKWV7dVYai?=
 =?us-ascii?Q?Gfj9zVkZoIZQRSveOX4P8t8XnbPvFFawjqrWk29mVGskP/JSc7jqyRzp+FFq?=
 =?us-ascii?Q?T2L7UhxSPMrJLesyPODT4ICEhv8QRimer/GkoHim4xcawrbUKecRz6paIDWJ?=
 =?us-ascii?Q?BjWydmsHMpxO5FLvKpVn3r+vOnflw7TEDfdG04y9ryCpC0Y6hfi9wJz8Rznx?=
 =?us-ascii?Q?Vz4HUoPCOMTfGd8YDi0FCOb/PKSYqwfGfeKE6DqayFPcmPI9Pf5PRApZB4Xr?=
 =?us-ascii?Q?bscmQlWkIOkMyw9Wt156FQt2L6IsB0HZvsTd9WB2qgSmO5dmgU3SjN6o0gqS?=
 =?us-ascii?Q?UFYH4evgsVib9t0rJdfURagR?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8E9F04616B01BE47A3F0FD586ABB4F53@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 768376fd-8800-459c-053c-08d950cd1c8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2021 07:06:52.5172 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nZuu2jqbYhlW4fIWBLtgKVJ1SFtjUJpqBusPEhsyjWO6ft7fh1Sw55vYXzOVD5N8+wf41Tixjkc0nECtfmLF9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR04MB7797
X-Proofpoint-ORIG-GUID: UOE7OGRKfVwWBdTd8FxbX8G2peGexglu
X-Proofpoint-GUID: UOE7OGRKfVwWBdTd8FxbX8G2peGexglu
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-27_05:2021-07-27,
 2021-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 spamscore=0 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107270039
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

On Mon, Jul 12, 2021 at 05:04:44PM CDT, Iwona Winiarska wrote:
>Add peci-cputemp driver for Digital Thermal Sensor (DTS) thermal
>readings of the processor package and processor cores that are
>accessible via the PECI interface.
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
> MAINTAINERS                  |   7 +
> drivers/hwmon/Kconfig        |   2 +
> drivers/hwmon/Makefile       |   1 +
> drivers/hwmon/peci/Kconfig   |  18 ++
> drivers/hwmon/peci/Makefile  |   5 +
> drivers/hwmon/peci/common.h  |  46 ++++
> drivers/hwmon/peci/cputemp.c | 503 +++++++++++++++++++++++++++++++++++
> 7 files changed, 582 insertions(+)
> create mode 100644 drivers/hwmon/peci/Kconfig
> create mode 100644 drivers/hwmon/peci/Makefile
> create mode 100644 drivers/hwmon/peci/common.h
> create mode 100644 drivers/hwmon/peci/cputemp.c
>
>diff --git a/MAINTAINERS b/MAINTAINERS
>index f47b5f634293..35ba9e3646bd 100644
>--- a/MAINTAINERS
>+++ b/MAINTAINERS
>@@ -14504,6 +14504,13 @@ L:	platform-driver-x86@vger.kernel.org
> S:	Maintained
> F:	drivers/platform/x86/peaq-wmi.c
>
>+PECI HARDWARE MONITORING DRIVERS
>+M:	Iwona Winiarska <iwona.winiarska@intel.com>
>+R:	Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>+L:	linux-hwmon@vger.kernel.org
>+S:	Supported
>+F:	drivers/hwmon/peci/
>+
> PECI SUBSYSTEM
> M:	Iwona Winiarska <iwona.winiarska@intel.com>
> R:	Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>index e3675377bc5d..61c0e3404415 100644
>--- a/drivers/hwmon/Kconfig
>+++ b/drivers/hwmon/Kconfig
>@@ -1507,6 +1507,8 @@ config SENSORS_PCF8591
> 	  These devices are hard to detect and rarely found on mainstream
> 	  hardware. If unsure, say N.
>
>+source "drivers/hwmon/peci/Kconfig"
>+
> source "drivers/hwmon/pmbus/Kconfig"
>
> config SENSORS_PWM_FAN
>diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
>index d712c61c1f5e..f52331f212ed 100644
>--- a/drivers/hwmon/Makefile
>+++ b/drivers/hwmon/Makefile
>@@ -202,6 +202,7 @@ obj-$(CONFIG_SENSORS_WM8350)	+=3D wm8350-hwmon.o
> obj-$(CONFIG_SENSORS_XGENE)	+=3D xgene-hwmon.o
>
> obj-$(CONFIG_SENSORS_OCC)	+=3D occ/
>+obj-$(CONFIG_SENSORS_PECI)	+=3D peci/
> obj-$(CONFIG_PMBUS)		+=3D pmbus/
>
> ccflags-$(CONFIG_HWMON_DEBUG_CHIP) :=3D -DDEBUG
>diff --git a/drivers/hwmon/peci/Kconfig b/drivers/hwmon/peci/Kconfig
>new file mode 100644
>index 000000000000..e10eed68d70a
>--- /dev/null
>+++ b/drivers/hwmon/peci/Kconfig
>@@ -0,0 +1,18 @@
>+# SPDX-License-Identifier: GPL-2.0-only
>+
>+config SENSORS_PECI_CPUTEMP
>+	tristate "PECI CPU temperature monitoring client"
>+	depends on PECI
>+	select SENSORS_PECI
>+	select PECI_CPU
>+	help
>+	  If you say yes here you get support for the generic Intel PECI
>+	  cputemp driver which provides Digital Thermal Sensor (DTS) thermal
>+	  readings of the CPU package and CPU cores that are accessible via
>+	  the processor PECI interface.
>+
>+	  This driver can also be built as a module. If so, the module
>+	  will be called peci-cputemp.
>+
>+config SENSORS_PECI
>+	tristate
>diff --git a/drivers/hwmon/peci/Makefile b/drivers/hwmon/peci/Makefile
>new file mode 100644
>index 000000000000..e8a0ada5ab1f
>--- /dev/null
>+++ b/drivers/hwmon/peci/Makefile
>@@ -0,0 +1,5 @@
>+# SPDX-License-Identifier: GPL-2.0-only
>+
>+peci-cputemp-y :=3D cputemp.o
>+
>+obj-$(CONFIG_SENSORS_PECI_CPUTEMP)	+=3D peci-cputemp.o
>diff --git a/drivers/hwmon/peci/common.h b/drivers/hwmon/peci/common.h
>new file mode 100644
>index 000000000000..54580c100d06
>--- /dev/null
>+++ b/drivers/hwmon/peci/common.h
>@@ -0,0 +1,46 @@
>+/* SPDX-License-Identifier: GPL-2.0-only */
>+/* Copyright (c) 2021 Intel Corporation */
>+
>+#include <linux/types.h>
>+
>+#ifndef __PECI_HWMON_COMMON_H
>+#define __PECI_HWMON_COMMON_H
>+
>+#define UPDATE_INTERVAL_DEFAULT		HZ
>+
>+/**
>+ * struct peci_sensor_data - PECI sensor information
>+ * @valid: flag to indicate the sensor value is valid
>+ * @value: sensor value in milli units
>+ * @last_updated: time of the last update in jiffies
>+ */
>+struct peci_sensor_data {
>+	unsigned int valid;

From what I can see it looks like the 'valid' member here is strictly a
one-shot has-this-value-ever-been-set indicator, which seems a bit
wasteful to keep around forever post initialization; couldn't the same
information be inferred from checking last_updated !=3D 0 or something?

>+	s32 value;
>+	unsigned long last_updated;
>+};
>+
>+/**
>+ * peci_sensor_need_update() - check whether sensor update is needed or n=
ot
>+ * @sensor: pointer to sensor data struct
>+ *
>+ * Return: true if update is needed, false if not.
>+ */
>+
>+static inline bool peci_sensor_need_update(struct peci_sensor_data *senso=
r)
>+{
>+	return !sensor->valid ||
>+	       time_after(jiffies, sensor->last_updated + UPDATE_INTERVAL_DEFAUL=
T);
>+}
>+
>+/**
>+ * peci_sensor_mark_updated() - mark the sensor is updated
>+ * @sensor: pointer to sensor data struct
>+ */
>+static inline void peci_sensor_mark_updated(struct peci_sensor_data *sens=
or)
>+{
>+	sensor->valid =3D 1;
>+	sensor->last_updated =3D jiffies;
>+}
>+
>+#endif /* __PECI_HWMON_COMMON_H */
>diff --git a/drivers/hwmon/peci/cputemp.c b/drivers/hwmon/peci/cputemp.c
>new file mode 100644
>index 000000000000..56a526471687
>--- /dev/null
>+++ b/drivers/hwmon/peci/cputemp.c
>@@ -0,0 +1,503 @@
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
>+#include <linux/x86/intel-family.h>
>+
>+#include "common.h"
>+
>+#define CORE_NUMS_MAX		64
>+
>+#define DEFAULT_CHANNEL_NUMS	5

DEFAULT_ seems like a slightly odd prefix for this (it's not something
that can really be overridden or anything); would BASE_ perhaps be a bit
more appropriate?

>+#define CORETEMP_CHANNEL_NUMS	CORE_NUMS_MAX
>+#define CPUTEMP_CHANNEL_NUMS	(DEFAULT_CHANNEL_NUMS + CORETEMP_CHANNEL_NUM=
S)
>+
>+#define TEMP_TARGET_FAN_TEMP_MASK	GENMASK(15, 8)
>+#define TEMP_TARGET_REF_TEMP_MASK	GENMASK(23, 16)
>+#define TEMP_TARGET_TJ_OFFSET_MASK	GENMASK(29, 24)
>+
>+#define DTS_MARGIN_MASK		GENMASK(15, 0)
>+#define PCS_MODULE_TEMP_MASK	GENMASK(15, 0)
>+
>+#define DTS_FIXED_POINT_FRACTION	64
>+
>+struct resolved_cores_reg {
>+	u8 bus;
>+	u8 dev;
>+	u8 func;
>+	u8 offset;
>+};
>+
>+struct cpu_info {
>+	struct resolved_cores_reg *reg;
>+	u8 min_peci_revision;

As with the dimmtemp driver, min_peci_revision appears unused here,
though in this case if it were removed there'd only be one (pointer)
member left in struct cpu_info, so we could perhaps remove it as well
and then also a level of indirection in peci_cputemp_ids/cpu_{hsx,icx}
too?

>+};
>+
>+struct peci_cputemp {
>+	struct peci_device *peci_dev;
>+	struct device *dev;
>+	const char *name;
>+	const struct cpu_info *gen_info;
>+	struct {
>+		struct peci_sensor_data die;
>+		struct peci_sensor_data dts;
>+		struct peci_sensor_data tcontrol;
>+		struct peci_sensor_data tthrottle;
>+		struct peci_sensor_data tjmax;
>+		struct peci_sensor_data core[CORETEMP_CHANNEL_NUMS];
>+	} temp;
>+	const char **coretemp_label;
>+	DECLARE_BITMAP(core_mask, CORE_NUMS_MAX);
>+};
>+
>+enum cputemp_channels {
>+	channel_die,
>+	channel_dts,
>+	channel_tcontrol,
>+	channel_tthrottle,
>+	channel_tjmax,
>+	channel_core,
>+};
>+
>+static const char *cputemp_label[DEFAULT_CHANNEL_NUMS] =3D {

static const char * const cputemp_label?  (That is, const pointer to
const char, rather than non-const pointer to const char.)

>+	"Die",
>+	"DTS",
>+	"Tcontrol",
>+	"Tthrottle",
>+	"Tjmax",
>+};
>+
>+static int get_temp_targets(struct peci_cputemp *priv)
>+{
>+	s32 tthrottle_offset, tcontrol_margin;
>+	u32 pcs;
>+	int ret;
>+
>+	/*
>+	 * Just use only the tcontrol marker to determine if target values need
>+	 * update.
>+	 */
>+	if (!peci_sensor_need_update(&priv->temp.tcontrol))
>+		return 0;
>+
>+	ret =3D peci_pcs_read(priv->peci_dev, PECI_PCS_TEMP_TARGET, 0, &pcs);
>+	if (ret)
>+		return ret;
>+
>+	priv->temp.tjmax.value =3D FIELD_GET(TEMP_TARGET_REF_TEMP_MASK, pcs) * M=
ILLIDEGREE_PER_DEGREE;
>+
>+	tcontrol_margin =3D FIELD_GET(TEMP_TARGET_FAN_TEMP_MASK, pcs);
>+	tcontrol_margin =3D sign_extend32(tcontrol_margin, 7) * MILLIDEGREE_PER_=
DEGREE;
>+	priv->temp.tcontrol.value =3D priv->temp.tjmax.value - tcontrol_margin;
>+
>+	tthrottle_offset =3D FIELD_GET(TEMP_TARGET_TJ_OFFSET_MASK, pcs) * MILLID=
EGREE_PER_DEGREE;
>+	priv->temp.tthrottle.value =3D priv->temp.tjmax.value - tthrottle_offset=
;
>+
>+	peci_sensor_mark_updated(&priv->temp.tcontrol);
>+
>+	return 0;
>+}
>+
>+/*
>+ * Processors return a value of DTS reading in S10.6 fixed point format
>+ * (sign, 10 bits signed integer value, 6 bits fractional).

This parenthetical reads to me like it's describing 17 bits -- I'm not a
PECI expert, but from my reading of the (somewhat skimpy) docs I've got
on it I'd suggest a description more like "sign, 9-bit magnitude, 6-bit
fraction".

>+ * Error codes:
>+ *   0x8000: General sensor error
>+ *   0x8001: Reserved
>+ *   0x8002: Underflow on reading value
>+ *   0x8003-0x81ff: Reserved
>+ */
>+static bool dts_valid(s32 val)
>+{
>+	return val < 0x8000 || val > 0x81ff;
>+}
>+
>+static s32 dts_to_millidegree(s32 val)
>+{
>+	return sign_extend32(val, 15) * MILLIDEGREE_PER_DEGREE / DTS_FIXED_POINT=
_FRACTION;
>+}
>+
>+static int get_die_temp(struct peci_cputemp *priv)
>+{
>+	s16 temp;
>+	int ret;
>+
>+	if (!peci_sensor_need_update(&priv->temp.die))
>+		return 0;
>+
>+	ret =3D peci_temp_read(priv->peci_dev, &temp);
>+	if (ret)
>+		return ret;
>+
>+	if (!dts_valid(temp))
>+		return -EIO;
>+
>+	/* Note that the tjmax should be available before calling it */
>+	priv->temp.die.value =3D priv->temp.tjmax.value + dts_to_millidegree(tem=
p);
>+
>+	peci_sensor_mark_updated(&priv->temp.die);
>+
>+	return 0;
>+}
>+
>+static int get_dts(struct peci_cputemp *priv)
>+{
>+	s32 dts_margin;
>+	u32 pcs;
>+	int ret;
>+
>+	if (!peci_sensor_need_update(&priv->temp.dts))
>+		return 0;
>+
>+	ret =3D peci_pcs_read(priv->peci_dev, PECI_PCS_THERMAL_MARGIN, 0, &pcs);
>+	if (ret)
>+		return ret;
>+
>+	dts_margin =3D FIELD_GET(DTS_MARGIN_MASK, pcs);
>+	if (!dts_valid(dts_margin))
>+		return -EIO;
>+
>+	/* Note that the tcontrol should be available before calling it */
>+	priv->temp.dts.value =3D priv->temp.tcontrol.value - dts_to_millidegree(=
dts_margin);
>+
>+	peci_sensor_mark_updated(&priv->temp.dts);
>+
>+	return 0;
>+}
>+
>+static int get_core_temp(struct peci_cputemp *priv, int core_index)
>+{
>+	s32 core_dts_margin;
>+	u32 pcs;
>+	int ret;
>+
>+	if (!peci_sensor_need_update(&priv->temp.core[core_index]))
>+		return 0;
>+
>+	ret =3D peci_pcs_read(priv->peci_dev, PECI_PCS_MODULE_TEMP, core_index, =
&pcs);
>+	if (ret)
>+		return ret;
>+
>+	core_dts_margin =3D FIELD_GET(PCS_MODULE_TEMP_MASK, pcs);
>+	if (!dts_valid(core_dts_margin))
>+		return -EIO;
>+
>+	/* Note that the tjmax should be available before calling it */
>+	priv->temp.core[core_index].value =3D
>+		priv->temp.tjmax.value + dts_to_millidegree(core_dts_margin);
>+
>+	peci_sensor_mark_updated(&priv->temp.core[core_index]);
>+
>+	return 0;
>+}
>+
>+static int cputemp_read_string(struct device *dev, enum hwmon_sensor_type=
s type,
>+			       u32 attr, int channel, const char **str)
>+{
>+	struct peci_cputemp *priv =3D dev_get_drvdata(dev);
>+
>+	if (attr !=3D hwmon_temp_label)
>+		return -EOPNOTSUPP;
>+
>+	*str =3D channel < channel_core ?
>+		cputemp_label[channel] : priv->coretemp_label[channel - channel_core];
>+
>+	return 0;
>+}
>+
>+static int cputemp_read(struct device *dev, enum hwmon_sensor_types type,
>+			u32 attr, int channel, long *val)
>+{
>+	struct peci_cputemp *priv =3D dev_get_drvdata(dev);
>+	int ret, core_index;
>+
>+	ret =3D get_temp_targets(priv);
>+	if (ret)
>+		return ret;
>+
>+	switch (attr) {
>+	case hwmon_temp_input:
>+		switch (channel) {
>+		case channel_die:
>+			ret =3D get_die_temp(priv);
>+			if (ret)
>+				return ret;
>+
>+			*val =3D priv->temp.die.value;
>+			break;
>+		case channel_dts:
>+			ret =3D get_dts(priv);
>+			if (ret)
>+				return ret;
>+
>+			*val =3D priv->temp.dts.value;
>+			break;
>+		case channel_tcontrol:
>+			*val =3D priv->temp.tcontrol.value;
>+			break;
>+		case channel_tthrottle:
>+			*val =3D priv->temp.tthrottle.value;
>+			break;
>+		case channel_tjmax:
>+			*val =3D priv->temp.tjmax.value;
>+			break;
>+		default:
>+			core_index =3D channel - channel_core;
>+			ret =3D get_core_temp(priv, core_index);
>+			if (ret)
>+				return ret;
>+
>+			*val =3D priv->temp.core[core_index].value;
>+			break;
>+		}
>+		break;
>+	case hwmon_temp_max:
>+		*val =3D priv->temp.tcontrol.value;
>+		break;
>+	case hwmon_temp_crit:
>+		*val =3D priv->temp.tjmax.value;
>+		break;
>+	case hwmon_temp_crit_hyst:
>+		*val =3D priv->temp.tjmax.value - priv->temp.tcontrol.value;
>+		break;
>+	default:
>+		return -EOPNOTSUPP;
>+	}
>+
>+	return 0;
>+}
>+
>+static umode_t cputemp_is_visible(const void *data, enum hwmon_sensor_typ=
es type,
>+				  u32 attr, int channel)
>+{
>+	const struct peci_cputemp *priv =3D data;
>+
>+	if (channel > CPUTEMP_CHANNEL_NUMS)
>+		return 0;
>+
>+	if (channel < channel_core)
>+		return 0444;
>+
>+	if (test_bit(channel - channel_core, priv->core_mask))
>+		return 0444;
>+
>+	return 0;
>+}
>+
>+static int init_core_mask(struct peci_cputemp *priv)
>+{
>+	struct peci_device *peci_dev =3D priv->peci_dev;
>+	struct resolved_cores_reg *reg =3D priv->gen_info->reg;
>+	u64 core_mask;
>+	u32 data;
>+	int ret;
>+
>+	/* Get the RESOLVED_CORES register value */
>+	switch (peci_dev->info.model) {
>+	case INTEL_FAM6_ICELAKE_X:
>+	case INTEL_FAM6_ICELAKE_D:
>+		ret =3D peci_ep_pci_local_read(peci_dev, 0, reg->bus, reg->dev,
>+					     reg->func, reg->offset + 4, &data);
>+		if (ret)
>+			return ret;
>+
>+		core_mask =3D (u64)data << 32;
>+
>+		ret =3D peci_ep_pci_local_read(peci_dev, 0, reg->bus, reg->dev,
>+					     reg->func, reg->offset, &data);
>+		if (ret)
>+			return ret;
>+
>+		core_mask |=3D data;
>+
>+		break;
>+	default:
>+		ret =3D peci_pci_local_read(peci_dev, reg->bus, reg->dev,
>+					  reg->func, reg->offset, &data);
>+		if (ret)
>+			return ret;
>+
>+		core_mask =3D data;
>+
>+		break;
>+	}
>+
>+	if (!core_mask)
>+		return -EIO;
>+
>+	bitmap_from_u64(priv->core_mask, core_mask);
>+
>+	return 0;
>+}
>+
>+static int create_temp_label(struct peci_cputemp *priv)
>+{
>+	unsigned long core_max =3D find_last_bit(priv->core_mask, CORE_NUMS_MAX)=
;
>+	int i;
>+
>+	priv->coretemp_label =3D devm_kzalloc(priv->dev, core_max * sizeof(char =
*), GFP_KERNEL);
>+	if (!priv->coretemp_label)
>+		return -ENOMEM;
>+
>+	for_each_set_bit(i, priv->core_mask, CORE_NUMS_MAX) {
>+		priv->coretemp_label[i] =3D devm_kasprintf(priv->dev, GFP_KERNEL, "Core=
 %d", i);
>+		if (!priv->coretemp_label[i])
>+			return -ENOMEM;
>+	}
>+
>+	return 0;
>+}
>+
>+static void check_resolved_cores(struct peci_cputemp *priv)
>+{
>+	int ret;
>+
>+	ret =3D init_core_mask(priv);
>+	if (ret)
>+		return;
>+
>+	ret =3D create_temp_label(priv);
>+	if (ret)
>+		bitmap_zero(priv->core_mask, CORE_NUMS_MAX);
>+}
>+
>+static const struct hwmon_ops peci_cputemp_ops =3D {
>+	.is_visible =3D cputemp_is_visible,
>+	.read_string =3D cputemp_read_string,
>+	.read =3D cputemp_read,
>+};
>+
>+static const u32 peci_cputemp_temp_channel_config[] =3D {
>+	/* Die temperature */
>+	HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT | HWMON_T_CRI=
T_HYST,
>+	/* DTS margin */
>+	HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT | HWMON_T_CRI=
T_HYST,
>+	/* Tcontrol temperature */
>+	HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_CRIT,
>+	/* Tthrottle temperature */
>+	HWMON_T_LABEL | HWMON_T_INPUT,
>+	/* Tjmax temperature */
>+	HWMON_T_LABEL | HWMON_T_INPUT,
>+	/* Core temperature - for all core channels */
>+	[channel_core ... CPUTEMP_CHANNEL_NUMS - 1] =3D HWMON_T_LABEL | HWMON_T_=
INPUT,
>+	0
>+};
>+
>+static const struct hwmon_channel_info peci_cputemp_temp_channel =3D {
>+	.type =3D hwmon_temp,
>+	.config =3D peci_cputemp_temp_channel_config,
>+};
>+
>+static const struct hwmon_channel_info *peci_cputemp_info[] =3D {
>+	&peci_cputemp_temp_channel,
>+	NULL
>+};
>+
>+static const struct hwmon_chip_info peci_cputemp_chip_info =3D {
>+	.ops =3D &peci_cputemp_ops,
>+	.info =3D peci_cputemp_info,
>+};
>+
>+static int peci_cputemp_probe(struct auxiliary_device *adev,
>+			      const struct auxiliary_device_id *id)
>+{
>+	struct device *dev =3D &adev->dev;
>+	struct peci_device *peci_dev =3D to_peci_device(dev->parent);
>+	struct peci_cputemp *priv;
>+	struct device *hwmon_dev;
>+
>+	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>+	if (!priv)
>+		return -ENOMEM;
>+
>+	priv->name =3D devm_kasprintf(dev, GFP_KERNEL, "peci_cputemp.cpu%d",
>+				    peci_dev->info.socket_id);
>+	if (!priv->name)
>+		return -ENOMEM;
>+
>+	dev_set_drvdata(dev, priv);
>+	priv->dev =3D dev;
>+	priv->peci_dev =3D peci_dev;
>+	priv->gen_info =3D (const struct cpu_info *)id->driver_data;
>+
>+	check_resolved_cores(priv);
>+
>+	hwmon_dev =3D devm_hwmon_device_register_with_info(priv->dev, priv->name=
,
>+							 priv, &peci_cputemp_chip_info, NULL);
>+
>+	return PTR_ERR_OR_ZERO(hwmon_dev);
>+}
>+
>+static struct resolved_cores_reg resolved_cores_reg_hsx =3D {
>+	.bus =3D 1,
>+	.dev =3D 30,
>+	.func =3D 3,
>+	.offset =3D 0xb4,
>+};
>+
>+static struct resolved_cores_reg resolved_cores_reg_icx =3D {
>+	.bus =3D 14,
>+	.dev =3D 30,
>+	.func =3D 3,
>+	.offset =3D 0xd0,
>+};
>+
>+static const struct cpu_info cpu_hsx =3D {
>+	.reg		=3D &resolved_cores_reg_hsx,
>+	.min_peci_revision =3D 0x30,
>+};
>+
>+static const struct cpu_info cpu_icx =3D {
>+	.reg		=3D &resolved_cores_reg_icx,
>+	.min_peci_revision =3D 0x40,
>+};
>+
>+static const struct auxiliary_device_id peci_cputemp_ids[] =3D {
>+	{
>+		.name =3D "peci_cpu.cputemp.hsx",
>+		.driver_data =3D (kernel_ulong_t)&cpu_hsx,
>+	},
>+	{
>+		.name =3D "peci_cpu.cputemp.bdx",
>+		.driver_data =3D (kernel_ulong_t)&cpu_hsx,
>+	},
>+	{
>+		.name =3D "peci_cpu.cputemp.bdxd",
>+		.driver_data =3D (kernel_ulong_t)&cpu_hsx,
>+	},
>+	{
>+		.name =3D "peci_cpu.cputemp.skx",
>+		.driver_data =3D (kernel_ulong_t)&cpu_hsx,
>+	},
>+	{
>+		.name =3D "peci_cpu.cputemp.icx",
>+		.driver_data =3D (kernel_ulong_t)&cpu_icx,
>+	},
>+	{
>+		.name =3D "peci_cpu.cputemp.icxd",
>+		.driver_data =3D (kernel_ulong_t)&cpu_icx,
>+	},
>+	{ }
>+};
>+MODULE_DEVICE_TABLE(auxiliary, peci_cputemp_ids);
>+
>+static struct auxiliary_driver peci_cputemp_driver =3D {
>+	.probe		=3D peci_cputemp_probe,
>+	.id_table	=3D peci_cputemp_ids,
>+};
>+
>+module_auxiliary_driver(peci_cputemp_driver);
>+
>+MODULE_AUTHOR("Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>");
>+MODULE_AUTHOR("Iwona Winiarska <iwona.winiarska@intel.com>");
>+MODULE_DESCRIPTION("PECI cputemp driver");
>+MODULE_LICENSE("GPL");
>+MODULE_IMPORT_NS(PECI_CPU);
>--=20
>2.31.1
>=
