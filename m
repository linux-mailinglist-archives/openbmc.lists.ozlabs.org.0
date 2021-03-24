Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B60E7348B58
	for <lists+openbmc@lfdr.de>; Thu, 25 Mar 2021 09:16:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5dHG5G7rz3bnM
	for <lists+openbmc@lfdr.de>; Thu, 25 Mar 2021 19:16:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=Synaptics.onmicrosoft.com header.i=@Synaptics.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-Synaptics-onmicrosoft-com header.b=OIRYA0Ad;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=synaptics.com (client-ip=40.107.244.78;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=jisheng.zhang@synaptics.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Synaptics.onmicrosoft.com
 header.i=@Synaptics.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-Synaptics-onmicrosoft-com header.b=OIRYA0Ad; 
 dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2078.outbound.protection.outlook.com [40.107.244.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F50lV3tfpz2xb9;
 Wed, 24 Mar 2021 18:50:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=odrjEiV+sWIVvb4CjbyN7V+tbMmZ+Ndb+VM3Mk+THNAfMT7qQDjOzLfDKBMaXq1Ymipf4PEcIJQC1baImlF6magdxVMonfFN0btGIfr1JmbIbEl3M8kTn4U5aIydHCBzYeiHfbVSQc0tQzX4BHecmsQdGhpYzvowJh8WY1vlWmW19lJoEB0R7NK57fpTSTtMD72EHkxbc4v0qKXRjCtiTwKlDU0ckVhcePHJFOwOjwLoXl7b/CFRULZpHmGKXcfgACtoY2a1V74HXK0ecLdOV2aQvqSdSFVLePpO/FIrJy7weSwvv6S1/UwOjYTbimw+aiq8YVmHOuzwj7mNQON1Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VIXyB4Y0zI3S5VVl77tjBQGyk+Y/1eftBDGEMYEDxyk=;
 b=OEYz5lwXNrYdsjbHepzacRpetryC7fC5vgmiLOkXgG6zH83os8cb4s/sTY3Kl6C/GfD+f7b3XI714cqOWvBOWS3qigbZSGu7rpIrym1sb1MZawaR+4KAwN1tEOVtqDSQIzZ5PJNEfPPwriMgKp6927yf2mwHbDvHVfhfYdLlqsLO1wSLiOciNo+CaJhD5ghi8kLMXbhxNbHaD4BkovBecrzFjkvc++8RM49IqorqzlE3rPy/fB/9ba2BSmIpC1hwqItJ6QksoBkjLg6my4I//TP68AT2IdB+um/OPHifF3uzmbDhdA+WvwJCKY3JXvyHN/6gSMmlxdb0nT3z10klFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VIXyB4Y0zI3S5VVl77tjBQGyk+Y/1eftBDGEMYEDxyk=;
 b=OIRYA0AdOYLmzVllFmVilavnKTgZzuwO3cYzDWu+0WJ1GIUKTIkfPf2+TXsnn1HanUJks5EjJBZEKIIotgC/CAgF4UGQO2Z5P69HFgDyP3T6t/HUhcKFIE+KUPhVHLeiehJZ8+5M2yI5W7PmUayISmzmMojmE+Latu5VvBq6xPk=
Authentication-Results: timesys.com; dkim=none (message not signed)
 header.d=none;timesys.com; dmarc=none action=none header.from=synaptics.com;
Received: from BY5PR03MB5345.namprd03.prod.outlook.com (2603:10b6:a03:219::16)
 by BYAPR03MB4805.namprd03.prod.outlook.com (2603:10b6:a03:12e::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Wed, 24 Mar
 2021 07:50:22 +0000
Received: from BY5PR03MB5345.namprd03.prod.outlook.com
 ([fe80::8569:341f:4bc6:5b72]) by BY5PR03MB5345.namprd03.prod.outlook.com
 ([fe80::8569:341f:4bc6:5b72%7]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 07:50:22 +0000
Date: Wed, 24 Mar 2021 15:50:13 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Angelo Dureghello <angelo.dureghello@timesys.com>, Adrian Hunter
 <adrian.hunter@intel.com>, Ulf Hansson <ulf.hansson@linaro.org>, Andrew
 Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH] mmc: sdhci: replace mmc->parent with mmc_dev() for consistency
Message-ID: <20210324155013.1e5faa3c@xhacker.debian>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.147.44.204]
X-ClientProxiedBy: SJ0PR13CA0176.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::31) To BY5PR03MB5345.namprd03.prod.outlook.com
 (2603:10b6:a03:219::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xhacker.debian (192.147.44.204) by
 SJ0PR13CA0176.namprd13.prod.outlook.com (2603:10b6:a03:2c7::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.9 via Frontend
 Transport; Wed, 24 Mar 2021 07:50:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a13c86d1-0165-4baf-55b2-08d8ee997a35
X-MS-TrafficTypeDiagnostic: BYAPR03MB4805:
X-Microsoft-Antispam-PRVS: <BYAPR03MB480544C8F948DEA24AA53208ED639@BYAPR03MB4805.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RFrSWPqxb7ESPZsBzKzelUXOwwqqFsypKQh8UwpuLD6nMpqsHjs2fK/b9655SqgIfuI4QwfDX1J/Qt8orOIWzv3GRyIgzlb7satZpfSnWFlt585TPWtNA6aaXwPsw3BDLbP+8pkuD4PzrPZJqb2izqDzN6Nw/GZ/xTw/eHfYKjM+TlKq5xsYZhuysE1I4tAx63VNnD0Njr8sp9GZOLSOKieUWk8b6hk3BoepXIsZkwkAWoJ8sgFa6NHhVt+3uXI2k8vCOLu21iXIWJ/eEp02BoLjnVOM0pmHVJZvFQ+tBXrlYg/m9OBF5inJhOT3C8AIwhByfOSizXXHkjiHRLV8XhEua98lKbSiABhY9Dig2sUmI30pmj/e4gQ0HYq8S2MhogFJuf3Rq+6FfNl/QzTxj5dbT5Yq4fYsN6PvBKaZ2LVyQ08q2WjrJw+AR2Lq3IpROIniCBTRCqCjYSnsFjsmrTCetsa6tJCSiLSfZj/hlUhVw/go63dw7wnVf/761Ei/GcYfSXrtBzdWB/Hm4aQh7hobtGldzeLMKg54H8uh4UGTnjy6lhzowmg2jNgm0z6nAp3RtJKS+TUGDOJNvwAsXl35Wvrp8DCPPaRxrui1x+wj6g5us/pGT8lx6AvdsWM1GjBYErSsJOK0Vfgq6MiMe6JM2nEiw45JboQ3Xvo90UM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR03MB5345.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(136003)(376002)(396003)(39850400004)(7696005)(478600001)(52116002)(6666004)(6506007)(110136005)(7416002)(186003)(16526019)(26005)(4326008)(316002)(2906002)(55016002)(9686003)(956004)(66946007)(30864003)(1076003)(66556008)(86362001)(66476007)(5660300002)(83380400001)(8676002)(38100700001)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?kLE3tdQHpy2mTqeU2q5cCWIRk2tM6jZO5bW4u+VD6aTJxFbzPHEJUFeFqo9D?=
 =?us-ascii?Q?4uASzORjlcnWgezH2YAnm6mHCxOmgPO8Vk7qotcKh0W5SX2fTL96ITHMhGQa?=
 =?us-ascii?Q?JkbInEs6pq2Fu73IIkO1yEA+OzPC0kgc83EcaX6AxQ9Ey+6Khl7lfxtwCzQm?=
 =?us-ascii?Q?oX0GGpvh8EpCJqowdZldMu9jNIWOor9KebNStQZgjzgCIfn/GxjdAyyrgaT7?=
 =?us-ascii?Q?Fb+rPyUEOKR8yoJWVC69Ein/ymTPAkM0/b8Cz4sBaHxTWZeIOfcajQ9NevIn?=
 =?us-ascii?Q?sOCgtRL2w8I2K9FBEIcCu7CfwDri/7Tq/iJizOANooHY3OItL70rHtgt7Pn3?=
 =?us-ascii?Q?gLl5XKMrVyBp8FC7LLy51zNVGkMEi2tNG+yO+oc/wrQ4PG1Mvn8w/tC8D/T/?=
 =?us-ascii?Q?CZqhG3C9RWULchqYqDTctoxHQ6ryyD1P07ySEmGYtLqzTFHdWF5BCZ+0Karj?=
 =?us-ascii?Q?yYNP2ugPItnT6WEHrLgKJtkCv4SpHwj+efh70ofVZHYDipYJKsp8+cWZPpQg?=
 =?us-ascii?Q?QsUhp4jzJAHw0HpfC8U60bReAtrN17zaSiRYm1R9cqyYUfvHt0N73t3CSqTu?=
 =?us-ascii?Q?Jty5l4YetpjThTh8addGEl5Sx6pphuz0lKK/60DVcK6knjeELRAVg1yPXI77?=
 =?us-ascii?Q?6t0Nf1lqMmE0JroHuBIYfhBcOPbU2F0RVy29kfGIR1A9mwkpXyKPtEKKJkMo?=
 =?us-ascii?Q?+1jV5+DLdemJuQmPSfKGKUquWpVdOX5w8TmxlTJHJilbJjhzR+J6/eelDdlm?=
 =?us-ascii?Q?ZqC4uWx6tX9nDQC4xFP63Kni8XDg3ZOhrixt/JaUYj4KIQPTJnVMMyU5kpsB?=
 =?us-ascii?Q?Y12gOW92JBT96cJdXCZLLFcvHG4yKgyaSpwgzdJD090L4KD6qIedxTHLC5tx?=
 =?us-ascii?Q?4nv4VekOgNUhFnQ3pt6yiTSCaBJV9OzeRfE7yDqjMCwnSKIDl3mmNaw2pl/Y?=
 =?us-ascii?Q?ttnYbHlV+21DitfpSZqcrLu+CbCwi1GFuC3kQZqQ1zwrWYsLpu57gLIIOnAG?=
 =?us-ascii?Q?aAu/RRl/VdYVnpNGtsR/BQ4Os6474PIU3n8MJ4H35RtwtGIyOCx7ndPk4zRm?=
 =?us-ascii?Q?1sWkZZfp31CZx2OOHrsgO1c7kTP3/1ovkcC9//K7QiE2WlxVkAwKlNOc7jwR?=
 =?us-ascii?Q?0s4fq8UOB8PpXn8LJUIoe1EdWn94dl1qQmoC+u0yUAse6dHKz//rvmG3p5VH?=
 =?us-ascii?Q?hRqebo7mBLvtbUeeG/FBrWHL+YVJ64tXjiDwM2PBkckGSRZLKqNOo4SDUauZ?=
 =?us-ascii?Q?6CZ77O7re2kZ5A6be267Fz5I5/UK3f6UuGwDucbR+/9t6QyGrbs0qPWi66NX?=
 =?us-ascii?Q?fpaWteyS1E20Jf0TQFaHO67z?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a13c86d1-0165-4baf-55b2-08d8ee997a35
X-MS-Exchange-CrossTenant-AuthSource: BY5PR03MB5345.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 07:50:22.2330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /emMWIYbvh37R6x743IauuMPr+scbAWywyDXowNKhAAC6oJjDo50E3exbanO3ChHJcWc+yJTXOIjkpPXFUzcHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4805
X-Mailman-Approved-At: Thu, 25 Mar 2021 19:16:05 +1100
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
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

As pointed out by Ulf, "both "mmc->parent" and mmc_dev(mmc) are being
used in the entire c-file". Convert all the mmc->parent usage in all
sdhci host driver to mmc_dev() for consistency.

Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
 drivers/mmc/host/sdhci-esdhc-mcf.c |  8 +++----
 drivers/mmc/host/sdhci-of-aspeed.c |  2 +-
 drivers/mmc/host/sdhci-tegra.c     | 34 +++++++++++++++---------------
 drivers/mmc/host/sdhci.c           | 24 ++++++++++-----------
 drivers/mmc/host/sdhci_am654.c     |  2 +-
 5 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/drivers/mmc/host/sdhci-esdhc-mcf.c b/drivers/mmc/host/sdhci-esdhc-mcf.c
index ca7a1690b2a8..05926bf5ecf9 100644
--- a/drivers/mmc/host/sdhci-esdhc-mcf.c
+++ b/drivers/mmc/host/sdhci-esdhc-mcf.c
@@ -367,14 +367,14 @@ static int esdhc_mcf_plat_init(struct sdhci_host *host,
 			       struct pltfm_mcf_data *mcf_data)
 {
 	struct mcf_esdhc_platform_data *plat_data;
+	struct device *dev = mmc_dev(host->mmc);
 
-	if (!host->mmc->parent->platform_data) {
-		dev_err(mmc_dev(host->mmc), "no platform data!\n");
+	if (!dev->platform_data) {
+		dev_err(dev, "no platform data!\n");
 		return -EINVAL;
 	}
 
-	plat_data = (struct mcf_esdhc_platform_data *)
-			host->mmc->parent->platform_data;
+	plat_data = (struct mcf_esdhc_platform_data *)dev->platform_data;
 
 	/* Card_detect */
 	switch (plat_data->cd_type) {
diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index 7d8692e90996..d001c51074a0 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -181,7 +181,7 @@ aspeed_sdhci_configure_phase(struct sdhci_host *host, unsigned long rate)
 	struct aspeed_sdhci *sdhci;
 	struct device *dev;
 
-	dev = host->mmc->parent;
+	dev = mmc_dev(host->mmc);
 	sdhci = sdhci_pltfm_priv(sdhci_priv(host));
 
 	if (!sdhci->phase_desc)
diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
index 41d193fa77bb..c61f797a853f 100644
--- a/drivers/mmc/host/sdhci-tegra.c
+++ b/drivers/mmc/host/sdhci-tegra.c
@@ -596,49 +596,49 @@ static void tegra_sdhci_parse_pad_autocal_dt(struct sdhci_host *host)
 			&tegra_host->autocal_offsets;
 	int err;
 
-	err = device_property_read_u32(host->mmc->parent,
+	err = device_property_read_u32(mmc_dev(host->mmc),
 			"nvidia,pad-autocal-pull-up-offset-3v3",
 			&autocal->pull_up_3v3);
 	if (err)
 		autocal->pull_up_3v3 = 0;
 
-	err = device_property_read_u32(host->mmc->parent,
+	err = device_property_read_u32(mmc_dev(host->mmc),
 			"nvidia,pad-autocal-pull-down-offset-3v3",
 			&autocal->pull_down_3v3);
 	if (err)
 		autocal->pull_down_3v3 = 0;
 
-	err = device_property_read_u32(host->mmc->parent,
+	err = device_property_read_u32(mmc_dev(host->mmc),
 			"nvidia,pad-autocal-pull-up-offset-1v8",
 			&autocal->pull_up_1v8);
 	if (err)
 		autocal->pull_up_1v8 = 0;
 
-	err = device_property_read_u32(host->mmc->parent,
+	err = device_property_read_u32(mmc_dev(host->mmc),
 			"nvidia,pad-autocal-pull-down-offset-1v8",
 			&autocal->pull_down_1v8);
 	if (err)
 		autocal->pull_down_1v8 = 0;
 
-	err = device_property_read_u32(host->mmc->parent,
+	err = device_property_read_u32(mmc_dev(host->mmc),
 			"nvidia,pad-autocal-pull-up-offset-sdr104",
 			&autocal->pull_up_sdr104);
 	if (err)
 		autocal->pull_up_sdr104 = autocal->pull_up_1v8;
 
-	err = device_property_read_u32(host->mmc->parent,
+	err = device_property_read_u32(mmc_dev(host->mmc),
 			"nvidia,pad-autocal-pull-down-offset-sdr104",
 			&autocal->pull_down_sdr104);
 	if (err)
 		autocal->pull_down_sdr104 = autocal->pull_down_1v8;
 
-	err = device_property_read_u32(host->mmc->parent,
+	err = device_property_read_u32(mmc_dev(host->mmc),
 			"nvidia,pad-autocal-pull-up-offset-hs400",
 			&autocal->pull_up_hs400);
 	if (err)
 		autocal->pull_up_hs400 = autocal->pull_up_1v8;
 
-	err = device_property_read_u32(host->mmc->parent,
+	err = device_property_read_u32(mmc_dev(host->mmc),
 			"nvidia,pad-autocal-pull-down-offset-hs400",
 			&autocal->pull_down_hs400);
 	if (err)
@@ -653,7 +653,7 @@ static void tegra_sdhci_parse_pad_autocal_dt(struct sdhci_host *host)
 	if (!(tegra_host->soc_data->nvquirks & NVQUIRK_NEEDS_PAD_CONTROL))
 		return;
 
-	err = device_property_read_u32(host->mmc->parent,
+	err = device_property_read_u32(mmc_dev(host->mmc),
 			"nvidia,pad-autocal-pull-up-offset-3v3-timeout",
 			&autocal->pull_up_3v3_timeout);
 	if (err) {
@@ -664,7 +664,7 @@ static void tegra_sdhci_parse_pad_autocal_dt(struct sdhci_host *host)
 		autocal->pull_up_3v3_timeout = 0;
 	}
 
-	err = device_property_read_u32(host->mmc->parent,
+	err = device_property_read_u32(mmc_dev(host->mmc),
 			"nvidia,pad-autocal-pull-down-offset-3v3-timeout",
 			&autocal->pull_down_3v3_timeout);
 	if (err) {
@@ -675,7 +675,7 @@ static void tegra_sdhci_parse_pad_autocal_dt(struct sdhci_host *host)
 		autocal->pull_down_3v3_timeout = 0;
 	}
 
-	err = device_property_read_u32(host->mmc->parent,
+	err = device_property_read_u32(mmc_dev(host->mmc),
 			"nvidia,pad-autocal-pull-up-offset-1v8-timeout",
 			&autocal->pull_up_1v8_timeout);
 	if (err) {
@@ -686,7 +686,7 @@ static void tegra_sdhci_parse_pad_autocal_dt(struct sdhci_host *host)
 		autocal->pull_up_1v8_timeout = 0;
 	}
 
-	err = device_property_read_u32(host->mmc->parent,
+	err = device_property_read_u32(mmc_dev(host->mmc),
 			"nvidia,pad-autocal-pull-down-offset-1v8-timeout",
 			&autocal->pull_down_1v8_timeout);
 	if (err) {
@@ -720,17 +720,17 @@ static void tegra_sdhci_parse_tap_and_trim(struct sdhci_host *host)
 	struct sdhci_tegra *tegra_host = sdhci_pltfm_priv(pltfm_host);
 	int err;
 
-	err = device_property_read_u32(host->mmc->parent, "nvidia,default-tap",
+	err = device_property_read_u32(mmc_dev(host->mmc), "nvidia,default-tap",
 				       &tegra_host->default_tap);
 	if (err)
 		tegra_host->default_tap = 0;
 
-	err = device_property_read_u32(host->mmc->parent, "nvidia,default-trim",
+	err = device_property_read_u32(mmc_dev(host->mmc), "nvidia,default-trim",
 				       &tegra_host->default_trim);
 	if (err)
 		tegra_host->default_trim = 0;
 
-	err = device_property_read_u32(host->mmc->parent, "nvidia,dqs-trim",
+	err = device_property_read_u32(mmc_dev(host->mmc), "nvidia,dqs-trim",
 				       &tegra_host->dqs_trim);
 	if (err)
 		tegra_host->dqs_trim = 0x11;
@@ -741,7 +741,7 @@ static void tegra_sdhci_parse_dt(struct sdhci_host *host)
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	struct sdhci_tegra *tegra_host = sdhci_pltfm_priv(pltfm_host);
 
-	if (device_property_read_bool(host->mmc->parent, "supports-cqe"))
+	if (device_property_read_bool(mmc_dev(host->mmc), "supports-cqe"))
 		tegra_host->enable_hwcq = true;
 	else
 		tegra_host->enable_hwcq = false;
@@ -1529,7 +1529,7 @@ static int sdhci_tegra_add_host(struct sdhci_host *host)
 
 	host->mmc->caps2 |= MMC_CAP2_CQE | MMC_CAP2_CQE_DCMD;
 
-	cq_host = devm_kzalloc(host->mmc->parent,
+	cq_host = devm_kzalloc(mmc_dev(host->mmc),
 				sizeof(*cq_host), GFP_KERNEL);
 	if (!cq_host) {
 		ret = -ENOMEM;
diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
index aefd0441658c..bf238ade1602 100644
--- a/drivers/mmc/host/sdhci.c
+++ b/drivers/mmc/host/sdhci.c
@@ -188,7 +188,7 @@ static void sdhci_runtime_pm_bus_on(struct sdhci_host *host)
 	if (host->bus_on)
 		return;
 	host->bus_on = true;
-	pm_runtime_get_noresume(host->mmc->parent);
+	pm_runtime_get_noresume(mmc_dev(host->mmc));
 }
 
 static void sdhci_runtime_pm_bus_off(struct sdhci_host *host)
@@ -196,7 +196,7 @@ static void sdhci_runtime_pm_bus_off(struct sdhci_host *host)
 	if (!host->bus_on)
 		return;
 	host->bus_on = false;
-	pm_runtime_put_noidle(host->mmc->parent);
+	pm_runtime_put_noidle(mmc_dev(host->mmc));
 }
 
 void sdhci_reset(struct sdhci_host *host, u8 mask)
@@ -648,7 +648,7 @@ static int sdhci_pre_dma_transfer(struct sdhci_host *host,
 			}
 		}
 		/* Switch ownership to the DMA */
-		dma_sync_single_for_device(host->mmc->parent,
+		dma_sync_single_for_device(mmc_dev(host->mmc),
 					   host->bounce_addr,
 					   host->bounce_buffer_size,
 					   mmc_get_dma_dir(data));
@@ -1176,7 +1176,7 @@ static int sdhci_external_dma_init(struct sdhci_host *host)
 	int ret = 0;
 	struct mmc_host *mmc = host->mmc;
 
-	host->tx_chan = dma_request_chan(mmc->parent, "tx");
+	host->tx_chan = dma_request_chan(mmc_dev(mmc), "tx");
 	if (IS_ERR(host->tx_chan)) {
 		ret = PTR_ERR(host->tx_chan);
 		if (ret != -EPROBE_DEFER)
@@ -1185,7 +1185,7 @@ static int sdhci_external_dma_init(struct sdhci_host *host)
 		return ret;
 	}
 
-	host->rx_chan = dma_request_chan(mmc->parent, "rx");
+	host->rx_chan = dma_request_chan(mmc_dev(mmc), "rx");
 	if (IS_ERR(host->rx_chan)) {
 		if (host->tx_chan) {
 			dma_release_channel(host->tx_chan);
@@ -2489,14 +2489,14 @@ void sdhci_enable_sdio_irq(struct mmc_host *mmc, int enable)
 	unsigned long flags;
 
 	if (enable)
-		pm_runtime_get_noresume(mmc->parent);
+		pm_runtime_get_noresume(mmc_dev(mmc));
 
 	spin_lock_irqsave(&host->lock, flags);
 	sdhci_enable_sdio_irq_nolock(host, enable);
 	spin_unlock_irqrestore(&host->lock, flags);
 
 	if (!enable)
-		pm_runtime_put_noidle(mmc->parent);
+		pm_runtime_put_noidle(mmc_dev(mmc));
 }
 EXPORT_SYMBOL_GPL(sdhci_enable_sdio_irq);
 
@@ -3063,7 +3063,7 @@ static bool sdhci_request_done(struct sdhci_host *host)
 						length = host->bounce_buffer_size;
 					}
 					dma_sync_single_for_cpu(
-						host->mmc->parent,
+						mmc_dev(host->mmc),
 						host->bounce_addr,
 						host->bounce_buffer_size,
 						DMA_FROM_DEVICE);
@@ -3074,7 +3074,7 @@ static bool sdhci_request_done(struct sdhci_host *host)
 				} else {
 					/* No copying, just switch ownership */
 					dma_sync_single_for_cpu(
-						host->mmc->parent,
+						mmc_dev(host->mmc),
 						host->bounce_addr,
 						host->bounce_buffer_size,
 						mmc_get_dma_dir(data));
@@ -4053,7 +4053,7 @@ static void sdhci_allocate_bounce_buffer(struct sdhci_host *host)
 	 * speedups by the help of a bounce buffer to group scattered
 	 * reads/writes together.
 	 */
-	host->bounce_buffer = devm_kmalloc(mmc->parent,
+	host->bounce_buffer = devm_kmalloc(mmc_dev(mmc),
 					   bounce_size,
 					   GFP_KERNEL);
 	if (!host->bounce_buffer) {
@@ -4067,11 +4067,11 @@ static void sdhci_allocate_bounce_buffer(struct sdhci_host *host)
 		return;
 	}
 
-	host->bounce_addr = dma_map_single(mmc->parent,
+	host->bounce_addr = dma_map_single(mmc_dev(mmc),
 					   host->bounce_buffer,
 					   bounce_size,
 					   DMA_BIDIRECTIONAL);
-	ret = dma_mapping_error(mmc->parent, host->bounce_addr);
+	ret = dma_mapping_error(mmc_dev(mmc), host->bounce_addr);
 	if (ret)
 		/* Again fall back to max_segs == 1 */
 		return;
diff --git a/drivers/mmc/host/sdhci_am654.c b/drivers/mmc/host/sdhci_am654.c
index 7a34649b0754..1fad6e442688 100644
--- a/drivers/mmc/host/sdhci_am654.c
+++ b/drivers/mmc/host/sdhci_am654.c
@@ -558,7 +558,7 @@ static int sdhci_am654_cqe_add_host(struct sdhci_host *host)
 	struct cqhci_host *cq_host;
 	int ret;
 
-	cq_host = devm_kzalloc(host->mmc->parent, sizeof(struct cqhci_host),
+	cq_host = devm_kzalloc(mmc_dev(host->mmc), sizeof(struct cqhci_host),
 			       GFP_KERNEL);
 	if (!cq_host)
 		return -ENOMEM;
-- 
2.31.0

