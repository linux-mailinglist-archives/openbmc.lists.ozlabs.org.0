Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6BF367D51
	for <lists+openbmc@lfdr.de>; Thu, 22 Apr 2021 11:10:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQs8V6r0Mz3018
	for <lists+openbmc@lfdr.de>; Thu, 22 Apr 2021 19:10:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=q12zZJKK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eae::701;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=q12zZJKK; 
 dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::701])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQs750WrHz2yQq;
 Thu, 22 Apr 2021 19:09:21 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lDhSMjpKMl9de0zCVO5/m1a0MeKlkdwAV8W3PkTGhALGJBkELUeAt8h4WoW45WrYGEoJACI+94QG4lz7hGI3JpeKHc/y/Q2JRoULng+7IPWgoAZqLuiMZdrYowOYSKsVr6JS+2/xODGkqINNLTmtPvqHMtcHmYmySxs6SUCNOxXuUTecYKRNmrcwB8MQvG/MbAUhuffQs2tBLNVugV71/g2OboLtbuBnRixgd15wOAYuh+4mzIeFL5uO9JD4nh6i7vNkzXhm/6QJjIsYEdeYoeXA03dIrMOTtRl1rkMLlTdsaMRKOEIkU3VuIreRdRGawmtkajeX7U0njsJH7evM4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ORDiNLCx24eLLZ2e/hdi11I+0SG2S7JQgFXHc+FNmS4=;
 b=Myvh2H6Yfnij08rcP6H36UbsNW+Bho2JRNWZIkDJTHw9u1q2Q9fvTc8jqKxN65VRbGakL1z81eNI2GLoXD/R9xdwhsgbDN/bVZkTkX7dQdGVle/AUqjGig1/ljTgshWLrZSnHL6zaZuc61h2C0RowmDM5T1VDtP8Kscz9+02tD9HYwXMwoEZNcPEVa7OZKOUpj/1iWf2QJAb3iP5GvtFSXRsyHrouc7dzQSww/cYTkFlXDxbjdCqW4YfZKYhPYcA9OjU3rD1k1riSkp3fGgFJsqyFFelxTojOMqYTd21HWMTtO4i1+TqVtMOdSg6BExRm8DoXnpS5Ba/4CzUwHaLZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ORDiNLCx24eLLZ2e/hdi11I+0SG2S7JQgFXHc+FNmS4=;
 b=q12zZJKK6KKoNkjW+aRq6yxHD8+wg7hDFO7zVEXKIxZXmaVxNo0Aa95SecPia6DDzO5B73rbF3F4+oTXAp1/C7R9UlzdZOlFtLjC3ywmHFTa90k/NqeHmvvbvn5xt/WbTtY/wzZcGiMD6Z9fpgb6663YI7q5CE5qxTF+XplgqCE=
Authentication-Results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MW4PR01MB6356.prod.exchangelabs.com (2603:10b6:303:66::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16; Thu, 22 Apr 2021 09:09:14 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.4042.024; Thu, 22 Apr 2021
 09:09:14 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
Subject: [PATCH v4 2/4] mfd: simple-mfd-i2c: Adds Ampere's Altra SMpro support
Date: Thu, 22 Apr 2021 16:08:41 +0700
Message-Id: <20210422090843.4614-3-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210422090843.4614-1-quan@os.amperecomputing.com>
References: <20210422090843.4614-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HKAPR04CA0011.apcprd04.prod.outlook.com
 (2603:1096:203:d0::21) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by
 HKAPR04CA0011.apcprd04.prod.outlook.com (2603:1096:203:d0::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.22 via Frontend Transport; Thu, 22 Apr 2021 09:09:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3655f894-4e1f-4cd0-f0b0-08d9056e4c96
X-MS-TrafficTypeDiagnostic: MW4PR01MB6356:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW4PR01MB635665979A06EC81506FA295F2469@MW4PR01MB6356.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 10tuTmfynHEYsMt/rOoriw2qM6rl2jhjyAd1zVDKQ7wmE+za8vCMQzOIi5eyOXpS52YzdsM8SISDFk3auuFp9l+piitGrEog+8SrjPXu1j8r+B8AnH+HiRaQ5FxeZYfuggPKJbkqy4lrPJveoZ/IT30A1ypOf/HjmpKASLFZ/FjPnWpsDWqpY308wid4LsmBC8RMagKO5VPz8RMusDODjSDBlJIhDZpTz9pH6Jut9IJVy0s1EcSxsJVVeLn5mY1kXri0nzZwBI4sORqHTZkbpHUdFvhftO+YFVp5o4g1CZeBtpysMwLbMrfzvZvvQLp6+AeLKnCBUtdsJlrQnsRmNR09F82gjne9/vmm8+LqmRoI+uveaS4QqSNQvH2IODP2kNLmRtjIsxzsng8eJmBPdISFv8OL8KT/z7FQzyKoYhUrgDfk00DYh6GwjFA4H61ki/JjN2PyMTM5xpxmPIG+vatO4a4y5l7E6wmzaIFsnsK9a4LxD+F5CIDp7l8UEh6Ty3jlszQi6eoCP81Ghrni8FVhAPqemu3vopLM5BzswtAPXjMpshjUlbVessJoonuEt2RgML5NP61/QHjbw03TE4drJ0qr6mSR4L1NZ4gPD84Apn9R34/Huxkb2rGfXd9r0kWUtd6JfMINt55FOYIr+BbkVHeXzIHK+pGRLnvfCVY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39850400004)(376002)(366004)(346002)(110136005)(38100700002)(26005)(107886003)(5660300002)(86362001)(956004)(2906002)(6512007)(1076003)(6666004)(316002)(8676002)(186003)(83380400001)(66476007)(4326008)(16526019)(66556008)(52116002)(38350700002)(921005)(7416002)(2616005)(8936002)(478600001)(6486002)(66946007)(54906003)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?+5ueedYNwe5PVd0w8YlvmGIC6zyLtK0nr+ebE/G1zJb0kifHB7C1szmSKiwm?=
 =?us-ascii?Q?610NlLAkBVekKj/sbGOCBdzsl8+a065w2yTA1bGSHLQfMFKP08imCnAPjHHY?=
 =?us-ascii?Q?hhE7oMAAc3vOAWCdMKUHf0vf2mQpUz5JCxsz3CczdSu7NxECaPp1idA0yXzl?=
 =?us-ascii?Q?UGfN664j+y5Nn6kECBCp+0O/kHkvqgVWOl/KCgnaXcnzFqWWXJMwKYyjkYT0?=
 =?us-ascii?Q?hPIC3NCSLfix7Lf+3/srgpaSjYcrsPnTyAaHLF8b/Kz/QciXaQAUftnR+hd7?=
 =?us-ascii?Q?pxyEqEvR4uIzx86lJs5WN3/lalO5PI2f34M/n3NsYY7+iMU+vuD5VaHFKDzE?=
 =?us-ascii?Q?Wb1Lmr30AjHi0pf5tQLc29Z054tdKtGpx2UHGpNv4/+bCpdK8Ajel6UHKL1o?=
 =?us-ascii?Q?KGk1gNMNhotarCKpLHhFCiWHXeP1ykl1yUp0ZzdofWl9BkV2nC+HN7yCjgAc?=
 =?us-ascii?Q?xX5pJvMFig+2sEqPu6S5gDovtSLKbRaK/GgE6+C5sSfQRbnWGYyhaULQSXi+?=
 =?us-ascii?Q?bdgZg7hpqNXBRoU2dirMsFYJeinj8RZKIsU7mOftip+4kvEdBTnApOrcEOy8?=
 =?us-ascii?Q?Fd1XzGK0Yqn8RxmktElSvD2nLv6K+UpoM52tut916AXkeuUyl9kV02A/deo3?=
 =?us-ascii?Q?KWE9zjQRmuNPCv4cZ8V9QIiRzFz2ov+L3dPM3lehgXv0itXyRIVk7MJgbDqO?=
 =?us-ascii?Q?1zJ/QUs507LDSWtKfEcIyukvZj8gHzDaV6m/PK8bvDk7l6m9OB6+ZziFif/K?=
 =?us-ascii?Q?OU8xZNp2UBVaBro/NN3EOQ/ZkuB9NfNTbHRRxUsS3YIfu8w3pwojuS4nfJt0?=
 =?us-ascii?Q?kLEiMMXL0pz8e60cvp2Dz5F00gJM83UkFe6VvGqIWTshA+0YDy6sYFqpYPbM?=
 =?us-ascii?Q?jY1rjr/LubhzIaFDVZ95aamFJGBrywT8iyJL40zELAdkYvx7ILy/M3Erke9J?=
 =?us-ascii?Q?hyNxyoN6OaVdgR1amhZYFsaWf6SKW7ShM5aTjm3uRKbzhKDaobNMkqDiUTYz?=
 =?us-ascii?Q?CNy+iv4a1KtcXYRZWSIl8RC8Sn5gtejQoEhO74ClKPYZsPiLQt9LlzN9p7iy?=
 =?us-ascii?Q?RdZINy0XQo8NdEiVi8+2/l0H3Dh9B/2rTTK+UMBW/LnZZOWhzPPhcVWrLmlP?=
 =?us-ascii?Q?jPJvVMqscWn82ivsE7PfJIkS9LTkYpiDZbNvsja2Au1oOBbayIE6WRcBHcIN?=
 =?us-ascii?Q?JMPvpXV/xZQ5D5fdHjUOrFkLDGkbpq+d/Z62Vr4dNKE/eonCj1DCcqopE/dQ?=
 =?us-ascii?Q?7aQjqMgk94boFeW6x4Jxv8oqT9eHrKveXFkz1B35WFL8UO6bksCR+XG4uzTc?=
 =?us-ascii?Q?JbNYpmb5UuMA2h4E1DUgpMYB?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3655f894-4e1f-4cd0-f0b0-08d9056e4c96
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 09:09:14.2655 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZTqErKle1wBD2DaAOMzDizLwdIpe9REkEvCplSquvh3GKx4POtMeVwNZ+jgKf87MGMRb3vPIldI7H1J62zWYpA0a/mmYLdRBB8y44Xoibvk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6356
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

Adds simple register map MFD driver for SMpro co-processor found on the
Mt.Jade hardware reference platform with Ampere's Altra processor family.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
Changes in v4:
  + Add "depends on I2C" to fix build issue found by kernel test robot [Guenter]

Changes in v3:
  + None

Changes in v2:
  + Used 'struct of_device_id's .data attribute [Lee Jones]

 drivers/mfd/Kconfig          | 11 +++++++++++
 drivers/mfd/simple-mfd-i2c.c |  6 ++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index d07e8cf93286..10713b0e260e 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -77,6 +77,17 @@ config MFD_AS3711
 	help
 	  Support for the AS3711 PMIC from AMS
 
+config MFD_SMPRO
+	tristate "Ampere Computing MFD SMpro core driver"
+	depends on I2C
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
index 87f684cff9a1..9a44655f5592 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -21,6 +21,11 @@ static const struct regmap_config simple_regmap_config = {
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
@@ -39,6 +44,7 @@ static int simple_mfd_i2c_probe(struct i2c_client *i2c)
 
 static const struct of_device_id simple_mfd_i2c_of_match[] = {
 	{ .compatible = "kontron,sl28cpld" },
+	{ .compatible = "ampere,smpro", .data = &simple_word_regmap_config },
 	{}
 };
 MODULE_DEVICE_TABLE(of, simple_mfd_i2c_of_match);
-- 
2.28.0

