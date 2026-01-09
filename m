Return-Path: <openbmc+bounces-1136-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3547DD0C9FA
	for <lists+openbmc@lfdr.de>; Sat, 10 Jan 2026 01:30:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnzyc73C4z2yKp;
	Sat, 10 Jan 2026 11:28:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.56.75 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767950832;
	cv=pass; b=LD1JPRRX9yNCo97JmsZNxPNwJlRxBDnZIoSlTtXcdDSwhicMZACOkAcKoPONtuEqmeb3Cz20Hkz8jSjoxgrcXF72NaKRL9R+GNZj6VA97DzvGjLG0zYNm9lwBHXfJug+LEN/h1Y3C/m1nrEqH4oSfQKLCK80oCandyWclxlrxSEx2g9eneWimcegRZ0uvk9zg7qbfJ/9jy5jqii+olj8opQQytRJ58Q5RKl8HeU0ZrKJuJ67ievKxGlPcxMqZDmvj9ebZ2pK4lZRSguHJ4heo2QOByJ2dMEYufycWaOljYXKpshm4DOTXUadMnIiAMNAukj7QmOryEOe8GD1Ohe/lw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767950832; c=relaxed/relaxed;
	bh=1HoqERvZW8a8NoNLSPo5/D08UJEa/N6i38uf+4p8Avo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OnrCaXbL4SYq8WA271bvJdFeTdUNNS6LwuasuAQOO2V7L2ChQdB1swVtzKzuatyQk8jICMWwLvspHh2RM5ndJfNz63MYxgvJ7K+RjOdG92QgENlfc2uhMJPL2+ydWJ53Tk4yuZGzdD6+AepcELmnxJgaRZYhVXJ+9fT3+NeGBBWer1M59Nn/qSwcpt02LCqyP2A97bcAEvZtiLBQ2soKdiqClXc1Xjo0gzDYHCCWBYVaFogTXMGoaxIpMv5eCjgshK7B2Yn0jBo+UWbHg6G/cOaaDbIlXfWQjjvB6qk+8bDlMk+7Ba9sMvKok2ewgV60FPj0PNVGVlzJEZRXxW46cA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=h1HWZEZU; dkim-atps=neutral; spf=pass (client-ip=52.101.56.75; helo=bn1pr04cu002.outbound.protection.outlook.com; envelope-from=syang@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=h1HWZEZU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=52.101.56.75; helo=bn1pr04cu002.outbound.protection.outlook.com; envelope-from=syang@axiado.com; receiver=lists.ozlabs.org)
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11020075.outbound.protection.outlook.com [52.101.56.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnbyQ5nMMz2xSN
	for <openbmc@lists.ozlabs.org>; Fri, 09 Jan 2026 20:27:10 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KZBVvZlZYmxYahl0BM/ykbjXviaSvvzN945QRRBA1K7j1b0j5fyzCMDPg+EvD88KNz+SFC5gxzwWhN+IvgjskqlkwRNTYZt3IcTeIxsFuRqFjnW+zxqvfs0z95VU2BxUTKA3bWzuDrcP++/+YEjL5Yaw1Zbeeq5OEYgG0bDXiCfjymaYhBNfrxmQ+4+B1N8QPtgXxRqkKRz27HflgHY9AR05stoLwfsl0Fx2juZ49w9q5K8J7toDF28MY0rfDpw4HlZLekLYftlXjmJ1BOlVP3YYOMwkhsaFR7p42vT5cAKp6w3AAxKCQvnkaDw2kcSf3vUoh7MxFo7wg3Lo3EuLpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1HoqERvZW8a8NoNLSPo5/D08UJEa/N6i38uf+4p8Avo=;
 b=enLtP/xVU/UPm5HrWIfmAIe9+RmvdLFFM6CSZlEWXClp4kha110FvFeMwApaUh2TAdpqHEBs+v4EBaUi0I7lAhOWgfBP0A6VJyti8yrO+MjQ9rwKMT0gwDm3GSB6UdgyqjTImvaypBPe1ybmpqIds7VrHIQnRoewDWGoHvTG6yGTIPfmtm9NK2X31S1RNNlxkvGfzVE8aZypBptL2XmPCSPzO6IruRrIAtmJaB/SZ1VhV3MCUwEGk+Z/4Exx9IlwsGw9cyUvhSbqUa8Oqg5s2mk4fHayRDgINJ3xC8U21P3NHWaJkyiHDKigk6HbguAmOeosrQoLUhhOdMER0wj/dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 4.227.125.105) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1HoqERvZW8a8NoNLSPo5/D08UJEa/N6i38uf+4p8Avo=;
 b=h1HWZEZUCgC7EQ3F7uOrYKQ+IhnzBB2gade5Z3OMQwRHmycqg27IGgsjsOzBqZzvFGQdxvVLCjUErBDAGr0aMJSsldu/70kCxEYUM6VWkQqWfHYlnWhSrepSJULHHQ3axxqkytd9Ye6IFaOrM0QaFMUHKvlT/A8H79+DPmJPHO/hHYVB/jMyxR3z8UZ0KvFcqD4tHzoD056jCWzPk0e41nCblA0Jpgz9EO5wEzkbdQG43NbtB5E4c0yiYJUvADv/SEnxt0AfKabVxfL94Tr6Vi9ILFf8UqyGEnZuLS7pivaSj9x0rlm3UCibNIB3u0C7ZuXaQn9tV6PN5iJNqsFt4g==
Received: from CH0PR03CA0392.namprd03.prod.outlook.com (2603:10b6:610:11b::31)
 by PH7PR18MB5305.namprd18.prod.outlook.com (2603:10b6:510:248::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Fri, 9 Jan
 2026 09:26:29 +0000
Received: from DS3PEPF0000C380.namprd04.prod.outlook.com
 (2603:10b6:610:11b:cafe::a7) by CH0PR03CA0392.outlook.office365.com
 (2603:10b6:610:11b::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.4 via Frontend Transport; Fri, 9
 Jan 2026 09:26:20 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.227.125.105)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 4.227.125.105 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.227.125.105; helo=[127.0.0.1];
Received: from [127.0.0.1] (4.227.125.105) by
 DS3PEPF0000C380.mail.protection.outlook.com (10.167.23.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Fri, 9 Jan 2026 09:26:28 +0000
From: Swark Yang <syang@axiado.com>
Date: Fri, 09 Jan 2026 01:26:06 -0800
Subject: [PATCH v2 1/2] gpio: cadence: Add quirk for Axiado AX3000 platform
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-axiado-ax3000-cadence-gpio-support-v2-1-fc1e28edf68a@axiado.com>
References: <20260109-axiado-ax3000-cadence-gpio-support-v2-0-fc1e28edf68a@axiado.com>
In-Reply-To: <20260109-axiado-ax3000-cadence-gpio-support-v2-0-fc1e28edf68a@axiado.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Swark Yang <syang@axiado.com>, 
 Tzu-Hao Wei <twei@axiado.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4054; i=syang@axiado.com;
 h=from:subject:message-id; bh=Qxt8PM669PWwDzuEanA7cNhfH/NqFUDiK5Mdhg9SIFc=;
 b=owGbwMvMwCHWlWK8+EozbyzjabUkhsyEkwddUmYuLNszX3ufzKUoxYwtL2Zc+Ld56tfIPBf2E
 CEJ41tdHaUsDGIcDLJiiixfdb7ln8zVvte5d2UpzBxWJpAhDFycAjAR1acMf0X4Fzg9PvrBLPnG
 +x3Jop2f8nSPKNc+Xyozs73CzW+uVwIjw/3M4MP920QX82W0zei+aH5ppt91z4gNzKsy68zvHMu
 byQUA
X-Developer-Key: i=syang@axiado.com; a=openpgp;
 fpr=F52CF66FC96D2BDE89BDA9758A6433A3D4830D5D
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C380:EE_|PH7PR18MB5305:EE_
X-MS-Office365-Filtering-Correlation-Id: e755f167-f783-491f-8be4-08de4f612b11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?elNmYUd6Y1dQWlJMazVDNmMyS2dFZWZUdnFZT3VmRmdZVlMyTTJFWnhXOFNw?=
 =?utf-8?B?eEZMb2QweE0veit0bjk3ZFI2VEw0SFBTSmd2TDUwUnNmbENFOHpKdDd6bWdK?=
 =?utf-8?B?azk0U1RleHJnNmJDNUVBa2tHZUxLYXZ2YlBZcHIraG1XamNLRVJjYVVLeUE2?=
 =?utf-8?B?QW9ORTdXOFdURk9lT3gwekZ0TmRkUXplTFV5a2hCeEk1Rm1laEVTdFVZWTVF?=
 =?utf-8?B?Kyt3YkRjcWtIUDRkRndFMUc3ZDBrVGI4T3d0ZStEKzhvZTN6NXB6amYxcW9J?=
 =?utf-8?B?MWNUdXBzdTdaMzhXOXRYdnVJSitpdXhVRnFKdis2TWVPRzBFVlBYZDN1dHRT?=
 =?utf-8?B?UHpJaHdvN2gwR01WL0xaQWZxbk9qZjI3MmczRU5NSm04b2xnNHhUaEQrUmZS?=
 =?utf-8?B?NDZSOUJwWE14eVJON2xjQTdzSlNmMVlsaE5pNFZJbXFNU0R3VWczaDN4WnRm?=
 =?utf-8?B?b3g4Zk1rVDBoZ2RVQkoxWStLOUFKUW5vclFhWk40bHFyeXdNbmlyaTdUSGk4?=
 =?utf-8?B?NXFabDNYUHd5Y0RwS3ljK3hvK1pVaUFCKzVCM3hGVmd4cGFRcS82NTdydU4r?=
 =?utf-8?B?bUhWRk40bkx1SVpYZ0lucTR0Y2FURHFXRkV1WUlIZ2hFWlFlRXp6S2dvdEcw?=
 =?utf-8?B?QXZpc1lKbEliN1cyV3orT3A5SitWSytEemhldnFqZXkyMG5mRXA0L1JIQXpU?=
 =?utf-8?B?Y1hlTG9ZcHNHUWxLeHpNNjhHaU9nRDFFTVluMXdPMStZRGMwS3czT0ZZYkVF?=
 =?utf-8?B?Q0RsYmVlN1lGQ3N6ZWtSbWpENnMvUzJKc0NUckpWK2ppRXAwYkpnM1lSTHNH?=
 =?utf-8?B?SjBLQ0lMRTh2eGxsSjErRUFiaGJWeWRMNWZUUVBnbnpLUVdTTnNtMDJwWjlO?=
 =?utf-8?B?MU12YlovbFBxb0pnYW4yVEN3MzBaWWdQVDlUZU9lUUU2UTZlbG54NlBXdnRH?=
 =?utf-8?B?T09kZDhhbVJqS1hZRkdKR1hpdkZjRW9sdm0yd2J3bzFzTWFCVVJFbTJ4VHEw?=
 =?utf-8?B?M3NOMVNtMDEwTS9HQktla1JKRDd2blZvZkhkWjBrUHNIb2Fidnh3YU1KZkV4?=
 =?utf-8?B?MWxKWC9vRGhjdDFCSGQ3MGNkSUFZMWJjTzZSUDJUVk1VSUFIQnhvYzZVbEVK?=
 =?utf-8?B?QUtWbXFlekZRSE00RTk2SFNQQkEzazBvLzNmNUplYjdEQVl4ZCthcGdJOTIw?=
 =?utf-8?B?R3UycUljVlY5V243cTVsNHgwd1ZyeWFQck9hNnNLNnVEbFFRTkFjcTNFOGM4?=
 =?utf-8?B?OHpRWmwxR2dMSFNvaEU0UGpjZWxDNG8wbXhIUGZVUElGYXh2dFZsOEpvMEJh?=
 =?utf-8?B?VnFGb2hpR3VDMVRRenVRdVY2SGp0OUNOYnNlTEhNdVpKSEU1VmR5VXV2YzR2?=
 =?utf-8?B?WUFzMjY0NzY1RjVXd2tIeHhUL1A2eFovNXNyOXNtMkZaaFNnOU0vL1RKZW9J?=
 =?utf-8?B?S1lCWk9MQnhrZ2xqOXNmRDg3Q1RjWUkzakVtTXgwWi9UQ25tbGtUU3EwZjcr?=
 =?utf-8?B?aEwyUy9taXlwZEJkbmQ5RGFnRVFtekNRYlNCYUFJRnJ0Vm9qRW90VHdzbkQv?=
 =?utf-8?B?bEZmM3lkTGZld3ZVSTJZaEwyRC90WmVDb3BxbWRiV3hZT29CWHBjcGJ2WmlE?=
 =?utf-8?B?d1kzdElRWjR1dytvR1V0QmVhZFVSeFB0MTMvd3pQdngyVm5JZ3NuVkZMc0o2?=
 =?utf-8?B?blVBbXpyalVJS2FLL2JtUk5yMmx6eGNwSS9RQXJtQWJ3QjRDU1YvblNZT3Jr?=
 =?utf-8?B?ditoZlJ4NTBNbnVjdFFkYldUTFdMT3kvZ3B0elM4N2YwNW9ZdFFudUNwZU14?=
 =?utf-8?B?VjRpMlJXMlg1Q2IvOW0xR2wyMGpmWUtqajhjUWJldmdJbGpwOFN3MlJwNCtn?=
 =?utf-8?B?T0ExVFZXS1dIVEdFK2MzK2dXVTNVL3BCMENKQWhDTTM2ZXlzQmg5QlIxUnNR?=
 =?utf-8?B?bFV5UFBEcEVVUnhrdldhVmhzYlNjYjROVHhTRDVuUTNFTGVhb3NabHZ5cmw5?=
 =?utf-8?B?UEhUN0FFM2lNVGRja0R1TElhVFZ5RExEbUtybm1rTHBKYm9icjFMWHJCeS85?=
 =?utf-8?B?eTJiM3RTckJ1ZmUvM1Y4L2JEQjU1eHJNMTQxYWZLeFY0OUwvTm05Nk44cUZD?=
 =?utf-8?Q?xQDw=3D?=
X-Forefront-Antispam-Report:
	CIP:4.227.125.105;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:[127.0.0.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 09:26:28.0829
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e755f167-f783-491f-8be4-08de4f612b11
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[4.227.125.105];Helo=[[127.0.0.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C380.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR18MB5305
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On the Axiado AX3000 platform, pinmux and pin configuration (such as
direction and output enable) are configured by the hardware/firmware
at boot time before Linux boots.

To prevent conflicts, introduce a platform-specific quirk triggered by
the "axiado,ax3000-gpio" compatible string.

When this quirk is active, the driver will skip its default
initialization of pinmux configuration and direction settings during
probe.

Co-developed-by: Tzu-Hao Wei <twei@axiado.com>
Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
Signed-off-by: Swark Yang <syang@axiado.com>
---
 drivers/gpio/gpio-cadence.c | 56 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 45 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-cadence.c b/drivers/gpio/gpio-cadence.c
index b75734ca22dd..85aef54d0aec 100644
--- a/drivers/gpio/gpio-cadence.c
+++ b/drivers/gpio/gpio-cadence.c
@@ -2,6 +2,7 @@
 
 /*
  * Copyright 2017-2018 Cadence
+ * Copyright (C) 2025 Axiado Corporation.
  *
  * Authors:
  *  Jan Kotas <jank@cadence.com>
@@ -31,10 +32,23 @@
 #define CDNS_GPIO_IRQ_VALUE		0x28
 #define CDNS_GPIO_IRQ_ANY_EDGE		0x2c
 
+struct cdns_gpio_quirks {
+	bool skip_init;
+};
+
 struct cdns_gpio_chip {
 	struct gpio_generic_chip gen_gc;
 	void __iomem *regs;
 	u32 bypass_orig;
+	const struct cdns_gpio_quirks *quirks;
+};
+
+static const struct cdns_gpio_quirks cdns_default_quirks = {
+	.skip_init = false,
+};
+
+static const struct cdns_gpio_quirks ax3000_gpio_quirks = {
+	.skip_init = true,
 };
 
 static int cdns_gpio_request(struct gpio_chip *chip, unsigned int offset)
@@ -141,6 +155,19 @@ static const struct irq_chip cdns_gpio_irqchip = {
 	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
+static const struct of_device_id cdns_of_ids[] = {
+	{
+		.compatible = "axiado,ax3000-gpio",
+		.data = &ax3000_gpio_quirks
+	},
+	{
+		.compatible = "cdns,gpio-r1p02",
+		.data = &cdns_default_quirks
+	},
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, cdns_of_ids);
+
 static int cdns_gpio_probe(struct platform_device *pdev)
 {
 	struct gpio_generic_chip_config config = { };
@@ -165,6 +192,10 @@ static int cdns_gpio_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	cgpio->quirks = device_get_match_data(&pdev->dev);
+	if (!cgpio->quirks)
+		cgpio->quirks = &cdns_default_quirks;
+
 	/*
 	 * Set all pins as inputs by default, otherwise:
 	 * gpiochip_lock_as_irq:
@@ -173,8 +204,15 @@ static int cdns_gpio_probe(struct platform_device *pdev)
 	 * so it needs to be changed before gpio_generic_chip_init() is called.
 	 */
 	dir_prev = ioread32(cgpio->regs + CDNS_GPIO_DIRECTION_MODE);
-	iowrite32(GENMASK(num_gpios - 1, 0),
-		  cgpio->regs + CDNS_GPIO_DIRECTION_MODE);
+
+	/*
+	 * The AX3000 platform performs the required configuration at boot time
+	 * before Linux boots, so this quirk disables pinmux initialization.
+	 */
+	if (!cgpio->quirks->skip_init) {
+		iowrite32(GENMASK(num_gpios - 1, 0),
+			cgpio->regs + CDNS_GPIO_DIRECTION_MODE);
+	}
 
 	config.dev = &pdev->dev;
 	config.sz = 4;
@@ -240,9 +278,11 @@ static int cdns_gpio_probe(struct platform_device *pdev)
 	/*
 	 * Enable gpio outputs, ignored for input direction
 	 */
-	iowrite32(GENMASK(num_gpios - 1, 0),
-		  cgpio->regs + CDNS_GPIO_OUTPUT_EN);
-	iowrite32(0, cgpio->regs + CDNS_GPIO_BYPASS_MODE);
+	if (!cgpio->quirks->skip_init) {
+		iowrite32(GENMASK(num_gpios - 1, 0),
+			cgpio->regs + CDNS_GPIO_OUTPUT_EN);
+		iowrite32(0, cgpio->regs + CDNS_GPIO_BYPASS_MODE);
+	}
 
 	platform_set_drvdata(pdev, cgpio);
 	return 0;
@@ -260,12 +300,6 @@ static void cdns_gpio_remove(struct platform_device *pdev)
 	iowrite32(cgpio->bypass_orig, cgpio->regs + CDNS_GPIO_BYPASS_MODE);
 }
 
-static const struct of_device_id cdns_of_ids[] = {
-	{ .compatible = "cdns,gpio-r1p02" },
-	{ /* sentinel */ },
-};
-MODULE_DEVICE_TABLE(of, cdns_of_ids);
-
 static struct platform_driver cdns_gpio_driver = {
 	.driver = {
 		.name = "cdns-gpio",

-- 
2.34.1


