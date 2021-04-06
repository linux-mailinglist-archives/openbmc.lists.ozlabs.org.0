Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF22354C90
	for <lists+openbmc@lfdr.de>; Tue,  6 Apr 2021 08:07:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDxs93wM5z30Cs
	for <lists+openbmc@lfdr.de>; Tue,  6 Apr 2021 16:07:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.132.94;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320094.outbound.protection.outlook.com [40.107.132.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDxrx4NlGz2xZB;
 Tue,  6 Apr 2021 16:07:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lwMxJTVnzFWfUzCssVBF8ePJn9E2eQKvjuQ2NWGnLSk/2RGqnw+ecE6jdz3tPZEewH3tah7n39njf7oRe9YEMQlEjTTKBgPEaTi38MYi382X1L9syp2VFndCpwuvAxOHiDW+EGj3P9EIAi5T0VS3SdrBckhJfnPmu/1mf3kIjIGzJUMAg1wBMvwE4wmUe+Z+CA8wfOU7Q8vkB3i81poYZF17IhkBsl92uAIRqk3qNnpfSL0bAhKiplulnuw++zcttCv7vkad1EsdbmVM4EFjO1LTbzB4OLgODGpUPFatSx80Lp3z/z7gvOh/vGdHtEbHmk8de6vd3V9ObOKbbNASUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k05QNwuGhz3HP63zhaArE/tDx4L/XtgrjJbNrN2A5yQ=;
 b=Dwkh0+oFk7bVh/TT1jBFLyxF7s7NU92WSgYO00txTIYr636OqciRAXdBjsWrZcAM6dtohv/IqxMjz/Xk8vPyprcok2vsJ61OSkWheSYBqoSICbMrWr2pElqm4nErG9cLxQQcXkjcoqDH40efcMWLdmvVEgUF9hPgzXpKd2SjJOODcqeJiaPRgpqIpG78omt8Gkxe3lxrzLIwzeJ6XcDDM5c5/V6H/7PtitLLOfqQNq6ZhN9iZFz1cjmBbkqQjHnwnIi3KC9IygSSmbIqyIrQv0Hl8s61dxtk0fA2kVTh32rOv9d774GzqiP2gvJGYnmeKtWi1/awmYwP/D7HaLl6Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by HK2PR0601MB1907.apcprd06.prod.outlook.com (2603:1096:202:a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Tue, 6 Apr
 2021 06:07:35 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::20c8:80da:5b1d:fc06]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::20c8:80da:5b1d:fc06%4]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 06:07:35 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Andrew Jeffery <andrew@aj.id.au>,
 "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "minyard@acm.org" <minyard@acm.org>
Subject: RE: [PATCH v2 13/21] ipmi: kcs_bmc: Decouple the IPMI chardev from
 the core
Thread-Topic: [PATCH v2 13/21] ipmi: kcs_bmc: Decouple the IPMI chardev from
 the core
Thread-Index: AQHXHIk+O9FnK/Net0WHc9+3NR2Bq6qnHRgQ
Date: Tue, 6 Apr 2021 06:07:34 +0000
Message-ID: <HK0PR06MB3779088F39332DA6AEA8B06B91769@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20210319062752.145730-1-andrew@aj.id.au>
 <20210319062752.145730-13-andrew@aj.id.au>
In-Reply-To: <20210319062752.145730-13-andrew@aj.id.au>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=aspeedtech.com;
x-originating-ip: [211.20.114.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2334dc95-ec32-457a-bcd4-08d8f8c245c5
x-ms-traffictypediagnostic: HK2PR0601MB1907:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK2PR0601MB19078015B5C0EAAAD704A80791769@HK2PR0601MB1907.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2Fw9DMoBcVB7ZlCIZMAFcbY63+hHNwPTx3FhpB1MdWn/ZUwgC4m8kuT/XASG9fCL+pt8YGMMOgWqe2JhRAsk3CsctJKsYChnvLlCNC8ShGuwnSv4I77rHgChPhP/AMiUA2ImbBUgjJZA5h2IwXRwA5GV1PfFtBTE8uLWZktB6yxxDbNyU7kg9Jy3Rdpi/OLy9s010NMuAtbSTbx4bCSiBu1E6EU1UCtw0/7dNSnjm/7nKAfz3y+GtvlNA1PbFsJraHUNBJfT3Pc3Bdd+VsW361cx3QEiqhjtg1k4K7l4yHCPCHpGJmufdJBETLid94+tH+ElGxWcX+y56M39kMIqYWvqDvPo6rCYpmuIi1dOwaJs+6EUJhwgXzZPzyv7Sp/u26UwYiEakn+4KY1+JH3oZRXI9STM+3VzwfXRfYAfiS6As9C2KhmEbHT+3O1G7ZsmLc8VSVwI7ZkWELHyWoXO3h0MbZHrz6dqGATGEJVsb5AQ1+5BRLoNMFELA4gF+dLNhSP5X7C66WAh+dzqvV31YKDH2iLSrCrtMu+tZfTAH8ZiIkM8AQFf2XIBxQt42qXiMdjld7GwkAhfeDjgaDL1ZoG3+edSaq3pDwyQ2MmBFBFoXyvRLrL3dSVMaE7vS6sh0PxE/LBCPfSJWyXa2t5ROnAkP8B+/VuocKVxTWOkFfE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3779.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(366004)(396003)(39840400004)(136003)(6506007)(66946007)(66446008)(38100700001)(52536014)(55016002)(55236004)(76116006)(9686003)(4326008)(8676002)(7416002)(8936002)(33656002)(86362001)(316002)(5660300002)(71200400001)(7696005)(478600001)(110136005)(186003)(54906003)(83380400001)(66476007)(26005)(66556008)(2906002)(64756008)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Nrnn/Os5vlDI6UfgID8NeVeOdYj19cvwZ/iap7qmwVtXSVlccrfihi8Li4dk?=
 =?us-ascii?Q?Rl0jl3qtFeX7jG3RFElqWeqnIeS8N6XrWssjHK9RSNvyzKEN3gVk6nUkuXjx?=
 =?us-ascii?Q?OcieHxqxyWuhTum3qjfXlWtI6/pMDBhp2uluVXTM3eqR5Cu501jzyvxDIVSa?=
 =?us-ascii?Q?50GfncHilooruhhm4zZlQhoaZ7ViJDEfKftDPnf5EWlgoc6Z9CmZm2W0D0op?=
 =?us-ascii?Q?cfi2RwXT1S/R3jjdUm6aKBdKZnTKY2W1r38Hf5zGWugkgHeLzy+DNPpD22Fc?=
 =?us-ascii?Q?/9blELWR/eBJb2dD++awWm06Qcl6u2UpMcMThNdAd0FO6sRYQKVjUtyGZnG3?=
 =?us-ascii?Q?grsrlMOil7A5cyaXbSS0zunc87FbrHaHRXslR9KOO0NCaY1rD6bQRcTj8wL7?=
 =?us-ascii?Q?W9E8FzGRjShQXGxeFFJ9w9AtHY5aKeEia74CPYNzLj95+V1TkSRfPqYTpLA5?=
 =?us-ascii?Q?nZqBe2N9f5Sk5bfTEHWA0amawXQ2pb02ev35Si7HkCo5Gi/PS1SvRp8HZurL?=
 =?us-ascii?Q?Rc+SaeGD5ntkxmPk3B4sFqa4zBewjdJb6lvo3/qdfFnDsCzX243KD71RqnCT?=
 =?us-ascii?Q?aMifO7jCuMBooHw40Yw2ajIr00yb+ajnGjY7N2AcvCwvUseseJoD9Ma6V3A/?=
 =?us-ascii?Q?JsoUMxKrys8ChX4FYQFrGFXASJZjZAAZYq9n4VKYI/CqSVPNyPb+iWyY/b0J?=
 =?us-ascii?Q?94AMWUCqG6u1gTPu8bOs17p0MbfXfFnnibj30RQNGTcmVsqAukAHX8S2wAsv?=
 =?us-ascii?Q?N2btpHLZzFk3hegr+RIxzXLvmD26JCUdQe8KyCuHoHhvko5Yj46kOnqiNuls?=
 =?us-ascii?Q?0SQAHBIQ7EP9L4O2xr5W1OAddopdrBEMeIEDt9exKcgb6JvS/f3zJuD7fYsE?=
 =?us-ascii?Q?3Ubv8N8lm2oyztZzXeQKUw2sSiVXORkR8eTJHnoVrVn89i+gHHb67rAO0T5s?=
 =?us-ascii?Q?+WzaeO12stq9i8vlAHhswaHwAqq64wjB0KIUvJe5SBXgLiMgbefJxbuJYrE4?=
 =?us-ascii?Q?/6nnXDBPWC1Opfwu08KQVk27qUrnPJV2HkKDPIKqgaTQAaaGauYV8T5jrD3F?=
 =?us-ascii?Q?o7NbIP8mHgpVJ/WJKQ31JQuBsucI7byPqryPOc2bYANHIhlRyvwPFm1fcdyj?=
 =?us-ascii?Q?opAdzTQGil2MnsWF4NwhYbAa8KRx2TgJhkRKNdDqbd4JY0woXRKrkqMHlrcT?=
 =?us-ascii?Q?ZmVUkox4LIjYbwPj3FvHMDDe5oxvQiXLrkLHZwfNprK4PovVtbDXe4X/ah1g?=
 =?us-ascii?Q?S/qfkjvq/VTXUUg7stulnZww6KkTcgc0YRezA3tPXUy+aGcbvjyDsinpDSyd?=
 =?us-ascii?Q?4xbOaR08nsdt01+H+2MLuyA2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2334dc95-ec32-457a-bcd4-08d8f8c245c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2021 06:07:34.9406 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sHTRVGrhXiKRt+1zvCIbsyyS0avGCbeL30y6T45RXh51cBls+ucDA0U+Flp1KFHjwPioJKXdJTyy8t28y/E3KJhoLSl3W8oTxaTMVqGlgCE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR0601MB1907
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
 Ryan Chen <ryan_chen@aspeedtech.com>,
 "tmaimon77@gmail.com" <tmaimon77@gmail.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "avifishman70@gmail.com" <avifishman70@gmail.com>,
 "venture@google.com" <venture@google.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tali.perry1@gmail.com" <tali.perry1@gmail.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "benjaminfair@google.com" <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I have tried this patch on Intel EGS CRB with AST2600 A1 as the BMC.
Chiawei

Tested-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>

> -----Original Message-----
> From: Andrew Jeffery <andrew@aj.id.au>
> Sent: Friday, March 19, 2021 2:28 PM
> To: openipmi-developer@lists.sourceforge.net; openbmc@lists.ozlabs.org;
> minyard@acm.org
> Subject: [PATCH v2 13/21] ipmi: kcs_bmc: Decouple the IPMI chardev from t=
he
> core
>=20
> Now that we have untangled the data-structures, split the userspace inter=
face
> out into its own module. Userspace interfaces and drivers are registered =
to the
> KCS BMC core to support arbitrary binding of either.
>=20
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  drivers/char/ipmi/Kconfig             | 13 +++++
>  drivers/char/ipmi/Makefile            |  3 +-
>  drivers/char/ipmi/kcs_bmc.c           | 78
> ++++++++++++++++++++++++++-
>  drivers/char/ipmi/kcs_bmc.h           |  4 --
>  drivers/char/ipmi/kcs_bmc_cdev_ipmi.c | 33 +++++++++---
>  drivers/char/ipmi/kcs_bmc_client.h    | 14 +++++
>  6 files changed, 132 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig index
> 07847d9a459a..bc5f81899b62 100644
> --- a/drivers/char/ipmi/Kconfig
> +++ b/drivers/char/ipmi/Kconfig
> @@ -124,6 +124,19 @@ config NPCM7XX_KCS_IPMI_BMC
>  	  This support is also available as a module.  If so, the module
>  	  will be called kcs_bmc_npcm7xx.
>=20
> +config IPMI_KCS_BMC_CDEV_IPMI
> +	depends on IPMI_KCS_BMC
> +	tristate "IPMI character device interface for BMC KCS devices"
> +	help
> +	  Provides a BMC-side character device implementing IPMI
> +	  semantics for KCS IPMI devices.
> +
> +	  Say YES if you wish to expose KCS devices on the BMC for IPMI
> +	  purposes.
> +
> +	  This support is also available as a module. The module will be
> +	  called kcs_bmc_cdev_ipmi.
> +
>  config ASPEED_BT_IPMI_BMC
>  	depends on ARCH_ASPEED || COMPILE_TEST
>  	depends on REGMAP && REGMAP_MMIO && MFD_SYSCON diff --git
> a/drivers/char/ipmi/Makefile b/drivers/char/ipmi/Makefile index
> a302bc865370..fcfa676afddb 100644
> --- a/drivers/char/ipmi/Makefile
> +++ b/drivers/char/ipmi/Makefile
> @@ -22,7 +22,8 @@ obj-$(CONFIG_IPMI_SSIF) +=3D ipmi_ssif.o
>  obj-$(CONFIG_IPMI_POWERNV) +=3D ipmi_powernv.o
>  obj-$(CONFIG_IPMI_WATCHDOG) +=3D ipmi_watchdog.o
>  obj-$(CONFIG_IPMI_POWEROFF) +=3D ipmi_poweroff.o
> -obj-$(CONFIG_IPMI_KCS_BMC) +=3D kcs_bmc.o kcs_bmc_cdev_ipmi.o
> +obj-$(CONFIG_IPMI_KCS_BMC) +=3D kcs_bmc.o
> +obj-$(CONFIG_IPMI_KCS_BMC_CDEV_IPMI) +=3D kcs_bmc_cdev_ipmi.o
>  obj-$(CONFIG_ASPEED_BT_IPMI_BMC) +=3D bt-bmc.o
>  obj-$(CONFIG_ASPEED_KCS_IPMI_BMC) +=3D kcs_bmc_aspeed.o
>  obj-$(CONFIG_NPCM7XX_KCS_IPMI_BMC) +=3D kcs_bmc_npcm7xx.o diff --git
> a/drivers/char/ipmi/kcs_bmc.c b/drivers/char/ipmi/kcs_bmc.c index
> 266ebec71d6f..694db6ee2a92 100644
> --- a/drivers/char/ipmi/kcs_bmc.c
> +++ b/drivers/char/ipmi/kcs_bmc.c
> @@ -5,7 +5,9 @@
>   */
>=20
>  #include <linux/device.h>
> +#include <linux/list.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
>=20
>  #include "kcs_bmc.h"
>=20
> @@ -13,6 +15,11 @@
>  #include "kcs_bmc_device.h"
>  #include "kcs_bmc_client.h"
>=20
> +/* Record probed devices and cdevs */
> +static DEFINE_MUTEX(kcs_bmc_lock);
> +static LIST_HEAD(kcs_bmc_devices);
> +static LIST_HEAD(kcs_bmc_cdevs);
> +
>  /* Consumer data access */
>=20
>  u8 kcs_bmc_read_data(struct kcs_bmc_device *kcs_bmc) @@ -100,16
> +107,83 @@ EXPORT_SYMBOL(kcs_bmc_disable_device);
>=20
>  int kcs_bmc_add_device(struct kcs_bmc_device *kcs_bmc)  {
> -	return kcs_bmc_ipmi_attach_cdev(kcs_bmc);
> +	struct kcs_bmc_cdev *cdev;
> +	int rc;
> +
> +	spin_lock_init(&kcs_bmc->lock);
> +	kcs_bmc->client =3D NULL;
> +
> +	mutex_lock(&kcs_bmc_lock);
> +	list_add(&kcs_bmc->entry, &kcs_bmc_devices);
> +	list_for_each_entry(cdev, &kcs_bmc_cdevs, entry) {
> +		rc =3D cdev->ops->add_device(kcs_bmc);
> +		if (rc)
> +			dev_err(kcs_bmc->dev, "Failed to add chardev for KCS channel
> %d: %d",
> +				kcs_bmc->channel, rc);
> +	}
> +	mutex_unlock(&kcs_bmc_lock);
> +
> +	return 0;
>  }
>  EXPORT_SYMBOL(kcs_bmc_add_device);
>=20
>  int kcs_bmc_remove_device(struct kcs_bmc_device *kcs_bmc)  {
> -	return kcs_bmc_ipmi_detach_cdev(kcs_bmc);
> +	struct kcs_bmc_cdev *cdev;
> +	int rc;
> +
> +	mutex_lock(&kcs_bmc_lock);
> +	list_del(&kcs_bmc->entry);
> +	list_for_each_entry(cdev, &kcs_bmc_cdevs, entry) {
> +		rc =3D cdev->ops->remove_device(kcs_bmc);
> +		if (rc)
> +			dev_err(kcs_bmc->dev, "Failed to remove chardev for KCS
> channel %d: %d",
> +				kcs_bmc->channel, rc);
> +	}
> +	mutex_unlock(&kcs_bmc_lock);
> +
> +	return 0;
>  }
>  EXPORT_SYMBOL(kcs_bmc_remove_device);
>=20
> +int kcs_bmc_register_cdev(struct kcs_bmc_cdev *cdev) {
> +	struct kcs_bmc_device *kcs_bmc;
> +	int rc;
> +
> +	mutex_lock(&kcs_bmc_lock);
> +	list_add(&cdev->entry, &kcs_bmc_cdevs);
> +	list_for_each_entry(kcs_bmc, &kcs_bmc_devices, entry) {
> +		rc =3D cdev->ops->add_device(kcs_bmc);
> +		if (rc)
> +			dev_err(kcs_bmc->dev, "Failed to add chardev for KCS channel
> %d: %d",
> +				kcs_bmc->channel, rc);
> +	}
> +	mutex_unlock(&kcs_bmc_lock);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(kcs_bmc_register_cdev);
> +
> +int kcs_bmc_unregister_cdev(struct kcs_bmc_cdev *cdev) {
> +	struct kcs_bmc_device *kcs_bmc;
> +	int rc;
> +
> +	mutex_lock(&kcs_bmc_lock);
> +	list_del(&cdev->entry);
> +	list_for_each_entry(kcs_bmc, &kcs_bmc_devices, entry) {
> +		rc =3D cdev->ops->remove_device(kcs_bmc);
> +		if (rc)
> +			dev_err(kcs_bmc->dev, "Failed to add chardev for KCS channel
> %d: %d",
> +				kcs_bmc->channel, rc);
> +	}
> +	mutex_unlock(&kcs_bmc_lock);
> +
> +	return rc;
> +}
> +EXPORT_SYMBOL(kcs_bmc_unregister_cdev);
> +
>  MODULE_LICENSE("GPL v2");
>  MODULE_AUTHOR("Haiyue Wang <haiyue.wang@linux.intel.com>");
> MODULE_AUTHOR("Andrew Jeffery <andrew@aj.id.au>"); diff --git
> a/drivers/char/ipmi/kcs_bmc.h b/drivers/char/ipmi/kcs_bmc.h index
> 3f266740c759..5deb9a0b8e60 100644
> --- a/drivers/char/ipmi/kcs_bmc.h
> +++ b/drivers/char/ipmi/kcs_bmc.h
> @@ -42,8 +42,4 @@ struct kcs_bmc_device {
>  	spinlock_t lock;
>  	struct kcs_bmc_client *client;
>  };
> -
> -/* Temporary exports while refactoring */ -int
> kcs_bmc_ipmi_attach_cdev(struct kcs_bmc_device *kcs_bmc); -int
> kcs_bmc_ipmi_detach_cdev(struct kcs_bmc_device *kcs_bmc);  #endif /*
> __KCS_BMC_H__ */ diff --git a/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
> b/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
> index 58c42e76483d..df83d67851ac 100644
> --- a/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
> +++ b/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
> @@ -469,8 +469,7 @@ static const struct file_operations kcs_bmc_ipmi_fops
> =3D {  static DEFINE_SPINLOCK(kcs_bmc_ipmi_instances_lock);
>  static LIST_HEAD(kcs_bmc_ipmi_instances);
>=20
> -int kcs_bmc_ipmi_attach_cdev(struct kcs_bmc_device *kcs_bmc); -int
> kcs_bmc_ipmi_attach_cdev(struct kcs_bmc_device *kcs_bmc)
> +static int kcs_bmc_ipmi_attach_cdev(struct kcs_bmc_device *kcs_bmc)
>  {
>  	struct kcs_bmc_ipmi *priv;
>  	int rc;
> @@ -512,10 +511,8 @@ int kcs_bmc_ipmi_attach_cdev(struct
> kcs_bmc_device *kcs_bmc)
>=20
>  	return 0;
>  }
> -EXPORT_SYMBOL(kcs_bmc_ipmi_attach_cdev);
>=20
> -int kcs_bmc_ipmi_detach_cdev(struct kcs_bmc_device *kcs_bmc); -int
> kcs_bmc_ipmi_detach_cdev(struct kcs_bmc_device *kcs_bmc)
> +static int kcs_bmc_ipmi_detach_cdev(struct kcs_bmc_device *kcs_bmc)
>  {
>  	struct kcs_bmc_ipmi *priv =3D NULL, *pos;
>=20
> @@ -541,7 +538,31 @@ int kcs_bmc_ipmi_detach_cdev(struct
> kcs_bmc_device *kcs_bmc)
>=20
>  	return 0;
>  }
> -EXPORT_SYMBOL(kcs_bmc_ipmi_detach_cdev);
> +
> +static const struct kcs_bmc_cdev_ops kcs_bmc_ipmi_cdev_ops =3D {
> +	.add_device =3D kcs_bmc_ipmi_attach_cdev,
> +	.remove_device =3D kcs_bmc_ipmi_detach_cdev, };
> +
> +static struct kcs_bmc_cdev kcs_bmc_ipmi_cdev =3D {
> +	.ops =3D &kcs_bmc_ipmi_cdev_ops,
> +};
> +
> +static int kcs_bmc_ipmi_init(void)
> +{
> +	return kcs_bmc_register_cdev(&kcs_bmc_ipmi_cdev);
> +}
> +module_init(kcs_bmc_ipmi_init);
> +
> +static void kcs_bmc_ipmi_exit(void)
> +{
> +	int rc;
> +
> +	rc =3D kcs_bmc_unregister_cdev(&kcs_bmc_ipmi_cdev);
> +	if (rc)
> +		pr_warn("Failed to remove KCS BMC client: %d", rc); }
> +module_exit(kcs_bmc_ipmi_exit);
>=20
>  MODULE_LICENSE("GPL v2");
>  MODULE_AUTHOR("Haiyue Wang <haiyue.wang@linux.intel.com>"); diff
> --git a/drivers/char/ipmi/kcs_bmc_client.h
> b/drivers/char/ipmi/kcs_bmc_client.h
> index 2dd710f4b4aa..d0a7404ff584 100644
> --- a/drivers/char/ipmi/kcs_bmc_client.h
> +++ b/drivers/char/ipmi/kcs_bmc_client.h
> @@ -10,6 +10,17 @@
>=20
>  #include "kcs_bmc.h"
>=20
> +struct kcs_bmc_cdev_ops {
> +	int (*add_device)(struct kcs_bmc_device *kcs_bmc);
> +	int (*remove_device)(struct kcs_bmc_device *kcs_bmc); };
> +
> +struct kcs_bmc_cdev {
> +	struct list_head entry;
> +
> +	const struct kcs_bmc_cdev_ops *ops;
> +};
> +
>  struct kcs_bmc_client_ops {
>  	int (*event)(struct kcs_bmc_client *client);  }; @@ -20,6 +31,9 @@
> struct kcs_bmc_client {
>  	struct kcs_bmc_device *dev;
>  };
>=20
> +int kcs_bmc_register_cdev(struct kcs_bmc_cdev *cdev); int
> +kcs_bmc_unregister_cdev(struct kcs_bmc_cdev *cdev);
> +
>  int kcs_bmc_enable_device(struct kcs_bmc_device *kcs_bmc, struct
> kcs_bmc_client *client);  void kcs_bmc_disable_device(struct
> kcs_bmc_device *kcs_bmc, struct kcs_bmc_client *client);
>=20
> --
> 2.27.0

