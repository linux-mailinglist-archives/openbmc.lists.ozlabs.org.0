Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F09324DD0
	for <lists+openbmc@lfdr.de>; Thu, 25 Feb 2021 11:20:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmTMV2S9lz3cYC
	for <lists+openbmc@lfdr.de>; Thu, 25 Feb 2021 21:20:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=noHkyNbG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.243.135;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=noHkyNbG; 
 dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2135.outbound.protection.outlook.com [40.107.243.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmTL91bhDz3cTY;
 Thu, 25 Feb 2021 21:19:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oCKw3LJxFN4Pa3xI7iYmQl2+KGEcKdPUKanYnUrAvHq52h5pC9I4nl9AJqX6NqWsJp1TD5oUNeCXNiLQP9haZ88QfauP8yRBNHYWKS5wVrIvqiWFmTjUX5oFdJ1wKkXvQm2hAQdMeKsswuZVuwfO++ZsLcXyzKEKSSwNcw8pr6lPij/460RFkfH6I9MVJ5GYDIo+L+dwNApJYLNK8DstW/MgBGULI6H3UPhkCr420ZGtRWXPqh3nUMXr//A+qK2btBgjX23nD7BRb8rcXlBUDq+H4pDh/Q6c/LPczrUSJ2hQxfyevqW99uOJ4Rf+3bukeL3D2r1rtq1O2BWXaLpdgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=17LL4410pWwoo1LZM/jF2/IU69X1uoFR6+zAwqvUAew=;
 b=QQDfxHHqgUqMgFdU23mO0FhbtMdTfbsHZ5Z3dmqLu3UmvnG5+J/I4yJmeeZGnzhN86uujIcqgtgf4k+AO26SUFmZXA0T53pof+pjmrOt9E7/9L3tKzRM4PwIQLUAFDjcyiQpjyYFbq0OO+ygHBimMCEyIQhmglgu76mmw3JxLwB76LMWB+pB0V4mL7Lyp7r2anHKs1ZbcocXewHR1QViuOZMlDAe0hnWmIXvdGIuN1pUZrH0DOxYj7PfYv4bfike1ngg+UDLO04JPVUlle105UXpp7m5O6ZMcirC9ANTo/RUT+yPNw3LT9RUlfoSZFerL4Wi07ZWevCzhSTKyrWvSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=17LL4410pWwoo1LZM/jF2/IU69X1uoFR6+zAwqvUAew=;
 b=noHkyNbGf2oZ0COA+JW9LjMS8sspn2oDmL8upiXynJ2OAQUa54DqbSrCLHXxswK+f3aERjuMmYgGuFWTrI7LMBJrP48JiYVxl6WX7LcsAqPCQK+t+lEG3EoOw9l85qJi056Y9e1Mk0vGMW9kJB4kUL4qZw4GdwTKsUlYOATfMZI=
Authentication-Results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MWHPR01MB2320.prod.exchangelabs.com (2603:10b6:300:26::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19; Thu, 25 Feb 2021 10:19:40 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::682c:4e20:b53d:e660]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::682c:4e20:b53d:e660%7]) with mapi id 15.20.3890.019; Thu, 25 Feb 2021
 10:19:40 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
Subject: [PATCH 2/4] mfd: simple-mfd-i2c: Adds Ampere's Altra SMpro support
Date: Thu, 25 Feb 2021 17:18:52 +0700
Message-Id: <20210225101854.13896-3-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210225101854.13896-1-quan@os.amperecomputing.com>
References: <20210225101854.13896-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK0PR01CA0061.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::25) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by
 HK0PR01CA0061.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend
 Transport; Thu, 25 Feb 2021 10:19:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a030169-f550-4e2d-e13d-08d8d976dc18
X-MS-TrafficTypeDiagnostic: MWHPR01MB2320:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR01MB2320D9BE11660A8CA19A0DC1F29E9@MWHPR01MB2320.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V6M8VEb9wIR4tHqmFQa3PA5E6701XCTm8viGDpPDpccNocntxTEp8nIKdrXv49npvpTFsjOSKdHWewZxY9Pu8T/BlTn15fdvuM9lbrvUaod8WumIqDvUbCfg3x2xlGEsOxtY3laGCZFv3b5Itio6BT6hVAP7m6nR3s0lOLeipgSvLnkqy98REEJrWN6Y50JKyovtpo/ZXSU41+oKDysRk5o7W9PF3A7br1+jkhAUpVkvdFb7eBPj2VmLPxRAiZJyrS5Q//U/1UHVrghdSxK+Fk8LvJNayDQRXSrU9SF9zCwSo+/zM3J1jpuB4C5zRZ80rNBbaAKtOZVHBbBuW92AtNOxlllusf2cBIIeGoWkp7t2N0vvUI/7F4uCu2joskZQPNDrvfrvylGc1RU+2IcutwPj5DPLsUyyodIqKCb6lxeXpFP9HOtAjlEBjk+lQyQeWZIdiDxvW7nYR8YM4VOt4yTy234vG/EmQAn84rAMDy3EmPvgWOgJZp+Aw5Ga1YoOS1ywJpR3+kAV0UOBuG8GNajODkFxSZ842XK49B0oL6IDr0E4rxlNUAMQmu3RNbcj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(136003)(39830400003)(366004)(83380400001)(956004)(2616005)(66556008)(6512007)(6666004)(107886003)(110136005)(66946007)(66476007)(52116002)(8936002)(921005)(316002)(86362001)(26005)(2906002)(1076003)(5660300002)(6486002)(186003)(4326008)(6506007)(16526019)(8676002)(7416002)(478600001)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?x94G0oOrb3aBQ9XuPEQBBzSjy1E2xLbfpi+jgVjr/ZkdLvuIrFaHbDECPOMC?=
 =?us-ascii?Q?ugwl+AosXGGxF/bKxiZQQcTgls6e1Y/uvut2e2eqcremcPNZ0gSXoRnTORhC?=
 =?us-ascii?Q?29V94BeVyP4Xa9igdHmMCGu0zvMs3RsPzCP1Bxfr8BFbmQ4mcqZX74BhdVXL?=
 =?us-ascii?Q?zo57hQTTeBbCkAqqs1Meg1dwWCRXSUGaZwjWCaNXbuUTKm07dape5MQBvWbk?=
 =?us-ascii?Q?JvMYFq6el0ohtRvIxRANAveTzEhL8uUO5czd8MPzCxx4e3AX4XqYKD9ESGp0?=
 =?us-ascii?Q?bboDgSBALEGQXjIDuVZ7AIeOWr18TvY0wNjtKPv8cWAi/CoAk0LAPXQFDfi0?=
 =?us-ascii?Q?HBpPWv9vuyRsF71NfwiiyDGOpF+nFZbAtdnN/hH5O5S7qc80QRxEmT+FAx/v?=
 =?us-ascii?Q?iTuwIMCJywprwUlF4cYZZIUeuWxXAw6vyCmfltH1SfQt8DYU2aKqoRD2oKt9?=
 =?us-ascii?Q?PViEepV2UYJb4QJxz+1dfa0Spy0dpGp5WmfFVa57VUmtBHbRw3fAovgkItEq?=
 =?us-ascii?Q?1S6Dh/c/DentcJpjF4IhRlOKFSjIMlrq1oatfg2MqXvjBO41LrG4k1BgqpVP?=
 =?us-ascii?Q?Y8LBjen62f6s0vFVvtISuPCbormcqMuS3uAI5dzfilm9l1Bd7cBjLDR1NQ6u?=
 =?us-ascii?Q?QpQYryKzAfsiP5PH4llzO/T4Ml4ZtN1btkXTfWIkqT+eTJc3E5DnIwsa3UfQ?=
 =?us-ascii?Q?Qlr5FwTbkOb7p5E2T2gElBvjNhxQgEYWmYF7Kg2tuFW50nDYnShk1ngiCrfX?=
 =?us-ascii?Q?HydLWntkdk0WM6r1Of2pg8P8V5a1d2WcgaT0oVLS0YfFJutdafks0Mf3Sx3U?=
 =?us-ascii?Q?4F2eXEUy84UVmNoHL/Hr0QR2FNJDRf6FaI2Co9N2gXE0N/mlGBSdjjTg3Fxu?=
 =?us-ascii?Q?Q3NIkn57U1VjuNS6Y6+Qc39EWj0VZ/Oyev2OKtbYTdMAHg/cBKXbEbtrcIVT?=
 =?us-ascii?Q?+AQ+WzHSQhBPr+fVBNCbaZ5+ud2wtR+Qdl3+6iM4gFwVS6xvvYIEEuZo3Jst?=
 =?us-ascii?Q?mssADUQnG6ImHLdGxW4p/xHYlsNqwufSe3E97955zi/hc3RlcGmgfZDsWoxh?=
 =?us-ascii?Q?mCZzqVbH9WRGjwa5cX6MA2z6FLsCL1QB1ygxsX6ZFbnu3myda8Ap9nfVffPy?=
 =?us-ascii?Q?7pmIEtfawugl/xNV+nAqBPr146I8tzjUiCys+ltxDvacNi6KrrYWYGx9uXnb?=
 =?us-ascii?Q?fq7iepIelvJxfC/tHlvYf/Ke+dQREcKrwQHBHK0UZJMfC6ZcSbX5rWqBvfmr?=
 =?us-ascii?Q?Khe9Y+T8n246542kIJYZvrC18GA4INeVetMGQQjmsFtE1/FMuJAqps5e92hp?=
 =?us-ascii?Q?gNE1klcyic4Id44NkeI/mq9d?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a030169-f550-4e2d-e13d-08d8d976dc18
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 10:19:39.9798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z/jxPnz08fSj1nWJwRTwOsoZ/tezdBaGVCyBGiBvT0Nd9CJvXLqqlzBlzinT97noPB9RLyDKpTCvhzi7wY2mQkAmUBOUSLhvBkaFSu7fdtY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR01MB2320
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
Cc: Open Source Submission <patches@amperecomputing.com>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Adds an MFD driver for SMpro found on the Mt.Jade hardware reference
platform with Ampere's Altra processor family.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
 drivers/mfd/Kconfig          | 10 ++++++++++
 drivers/mfd/simple-mfd-i2c.c | 15 +++++++++++++--
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index b74efa469e90..5414371bdea1 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -77,6 +77,16 @@ config MFD_AS3711
 	help
 	  Support for the AS3711 PMIC from AMS
 
+config MFD_SMPRO
+	tristate "Ampere Computing MFD SMpro core driver"
+	select MFD_SIMPLE_MFD_I2C
+	help
+	  Say yes here to enable SMpro driver support for Ampere's Altra
+	  processor family.
+
+	  Ampere's Altra SMpro exposes an I2C regmap interface that can
+	  be accessed by child devices.
+
 config MFD_AS3722
 	tristate "ams AS3722 Power Management IC"
 	select MFD_CORE
diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
index 87f684cff9a1..0459a9fbd3f5 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -21,14 +21,24 @@ static const struct regmap_config simple_regmap_config = {
 	.val_bits = 8,
 };
 
+static const struct regmap_config simple_word_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 16,
+};
+
 static int simple_mfd_i2c_probe(struct i2c_client *i2c)
 {
 	const struct regmap_config *config;
 	struct regmap *regmap;
 
 	config = device_get_match_data(&i2c->dev);
-	if (!config)
-		config = &simple_regmap_config;
+	if (!config) {
+		if (of_device_is_compatible(i2c->dev.of_node,
+						"ampere,ac01-smpro"))
+			config = &simple_word_regmap_config;
+		else
+			config = &simple_regmap_config;
+	}
 
 	regmap = devm_regmap_init_i2c(i2c, config);
 	if (IS_ERR(regmap))
@@ -39,6 +49,7 @@ static int simple_mfd_i2c_probe(struct i2c_client *i2c)
 
 static const struct of_device_id simple_mfd_i2c_of_match[] = {
 	{ .compatible = "kontron,sl28cpld" },
+	{ .compatible = "ampere,ac01-smpro" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, simple_mfd_i2c_of_match);
-- 
2.28.0

