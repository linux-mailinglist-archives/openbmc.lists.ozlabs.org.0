Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B373592E6
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 05:15:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGjtp1NmBz30HC
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 13:15:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=hQ8yLdjE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.92.120;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=hQ8yLdjE; 
 dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2120.outbound.protection.outlook.com [40.107.92.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGjsP5WpXz301s;
 Fri,  9 Apr 2021 13:14:17 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O8/xOYPjIodSFXZhczTSfuk9dxNYwWWJAG/NVj97ylMQUh3xzXOVgH70VozGLTnc/U3r+ncLQ2yzpJ/G01bB3ZjXlMzM1z2j0ZGPWGKqtLe7wQO8IgbKp69CAMMi1ivdtR16S4WF1D/OZ8KPUO7SXvxq7TOJxyt2ubQffEv3/ioFQEqw1+y3rVkB6QKcHocNSstc5M4uIJjF4rraRfSX0j3egEyuyHrnu+gneIdrNlNAQ8odV+NhcaH3OIvZwGnNY7JNOBkZ+upJjogGCaUN4ytypI/PgIm8jin4S7UzUqTPOMJO4xFGUaExnGt+xqKvWggeAKt2IFKL1VepUgUBfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29W8ho0+Xw7Kqr3NjweadDw7HfMJk04fN+WYpLmVGU8=;
 b=JXEhmyHw/54UqPSe8OhzW22pHzZ6L9GXsv3XIZIKuhHyW5RLlvUuN2omIDpI/aDf35FA7zegk45W8YWzesScBguo0HtCMwch7Dqw7QdwCw0Yr4/tIW18Ne/C4EUhUOe/Mt2VrCCdfbIhrTXkTEHNJNqrY6pFk12dt5Tw9Zej5V0N8triApbKlibXxBmxU5mpQ6k5KkviI23XEpN5q8AOR44PJtJDJkLYA4Dj9Km3zXdGScOkdkNCUTR+mUej5p4RRtsY8RLuA0/9+O8TTGKnSmFBf1P/zrWHFAfb1K9PV3LZrRj38dtMt1n+AhmFuu6CwDRylvBfFa6PqBnpGDxPvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29W8ho0+Xw7Kqr3NjweadDw7HfMJk04fN+WYpLmVGU8=;
 b=hQ8yLdjERUtF+ofSqV39DdzZ2dyK81F7SrUI3p5QBqwoJGjJm1plXL9Ivvr85wc06/9E9ZMR/GofqH9yEB/iCml3laDu2OkpgdtNGy2f+eMlmhC/xSNRtxDptg/MVzbLHML0wRZgAztTSbP6Wwx4pRAA3iLuwXLYlHCWu3MCPRE=
Authentication-Results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MWHPR0101MB2991.prod.exchangelabs.com (2603:10b6:301:36::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.26; Fri, 9 Apr 2021 03:14:09 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.4020.016; Fri, 9 Apr 2021
 03:14:09 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
Subject: [PATCH v3 2/4] mfd: simple-mfd-i2c: Adds Ampere's Altra SMpro support
Date: Fri,  9 Apr 2021 10:13:30 +0700
Message-Id: <20210409031332.21919-3-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210409031332.21919-1-quan@os.amperecomputing.com>
References: <20210409031332.21919-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK0PR01CA0054.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::18) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by
 HK0PR01CA0054.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Fri, 9 Apr 2021 03:14:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4aef3221-474e-4ae5-e283-08d8fb058a88
X-MS-TrafficTypeDiagnostic: MWHPR0101MB2991:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR0101MB2991D94825CC78250A900AEAF2739@MWHPR0101MB2991.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bVSyDVNUJynUKEcOqk0QRtKXC+uEnwJ1hSyVtgWSXQt710UACqmBZal0BDjQpzPQ0dCnnZr5xp2aGJUGqRgfMC18hN6C2ADoM+LcCVv4BzcBee77eShVeX9GeemmDVq3Z4JFv1m8prtGNIKpNy/5VFkcIUS65LzFlagg7xL+Q2HE2MALnzXp6GEHoiPdT/5tqxZGFlKXP6NprjZX0ZH34ZbEgefnTj84LzS02BIga5vu8il+e44DrMRzVYwIWxe8IKKF8EB0LayZ7l9Ig0D2v6msMjgB3YNW1VzzMpZZ3StsjFi1B8gnVVorioOFa2xCvXs7ro8O0ftUqbPPLF1JUQdvXr76OdccA2RiRZbK2ys6JX0Eum6nm0CXokTcmCWEVSLKtvMMawQrg+8ie8WrGUBkDqAj0IRW3L78Xm6gU67tzitN0yP3RKRvsQWzxIaVLMmDkQJYVxeNX23M+XYEBUiHEmVwYMuJ7ei9yWGNUFgGtIJrtUVadIn/lX9itVxt4OlOTiQR4bYmiFrJ07EGsYvkZKGVu3S/zS3q4aVI0RuF3kn4SkcVcEDLs+oHPc3mF/B+KrxzxQQd8DexlZdAl64zhKtCRlaSr6AbTfRegQJxLxjKiWpVa/pdYiF8/smYNUax6iEKw2ikyXFSZyXNuwqOXCc3bIFHIxzEjpbs6cPwwrFHCMflRIet0W40xo4VARXjJIi9Kao33MfUAh7TWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39850400004)(396003)(136003)(346002)(376002)(6512007)(478600001)(38350700001)(921005)(6666004)(26005)(316002)(6486002)(1076003)(83380400001)(2906002)(86362001)(7416002)(186003)(16526019)(6506007)(5660300002)(107886003)(38100700001)(4326008)(66946007)(956004)(8936002)(8676002)(2616005)(52116002)(66556008)(54906003)(110136005)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?iivEg3YexNOACZDUXzZ7DmgZ5Fbbk7eJSpa9HY6KPE32QB9hOEGoaEBSSMSQ?=
 =?us-ascii?Q?eeUCjoOeXxkLGGYCHdtnEDyS+uSNBx8HlvMvh/Zy+QKlw932uv6T2+1djvKI?=
 =?us-ascii?Q?C71SU5a2RPZsWOg2gBcDoMjgZyLDiK3vMMyqRXqTuZqMS8b5a6GlXApbKA+s?=
 =?us-ascii?Q?FyDh0hgNFO0DIzsBSulZkLx+dM5olpjUzHWjphjK9x4ma37oIeW39iDuNLsl?=
 =?us-ascii?Q?4PR33hG+NEoHiDdSUb/jMrXZBWj2O/mT/k0//7M44FLOUvtwookx09ti+sKg?=
 =?us-ascii?Q?zzFZ1pDuP6qQlOWI6Qx///WbPawzR7dUi+y0WeuRi5EZQc64I5H4LpL0ltr4?=
 =?us-ascii?Q?/Cu4d6amILzdbU2WKoT1kzo/oaAciz+8DdfBX63+gPJzTXhQoNxfptN4lBlp?=
 =?us-ascii?Q?5hOVbtDcs3Iyq42LIGtp/x2XrR2P+pXe79766ShZS87gyqqMp9jsk7eJBZ8s?=
 =?us-ascii?Q?1sU+EDtKgNqxfEfLBpHNqbKOxCTw6Ba0BUbsDUr4iMSCyImWqnOk7//p1Svq?=
 =?us-ascii?Q?FnhnzNfG2ZS+hjyKzvNP2zxKMZUNPgiNNjsP6CSSPUzOIfzul6K83lzwd9mg?=
 =?us-ascii?Q?2rsVct9rSlH8ZAlZetH5Av5ZJldiS+6ttCJneRVFpBfPeoSwFZ8BVQ1e1d0s?=
 =?us-ascii?Q?RagYdKpWUtPUeQ55xyvqhsC9Y/h6YlSTNU2Kd57tlqz5rrc3Gg/jMJ/M7UYO?=
 =?us-ascii?Q?vnN+JhMUWN+SHSYj7ZWROl7/bv3C5b6m7/MqHB7S6tnANF7HLOte6MTdsTMg?=
 =?us-ascii?Q?fi/KPam+2PleNcduOQTE0mOFzsfzwQ45w/9U7BveIRQDy6AxLhWQLOOxWEX7?=
 =?us-ascii?Q?uFH/sjUocnVHQgYT2s7hUMWESMK1DmVHBLqemjy8zMMr2tV8OWVmZnzE7aLV?=
 =?us-ascii?Q?A3IotSvQ0M3DFQ3brgaCJqOTs3MFphO7xPhql8fNkaTQC11dzSKkL6WrdkhT?=
 =?us-ascii?Q?7dHBrEEhOQwd6LovnJO1PtB2J/Q7aHn+031Ggw0n+vEsp02FeFEBgtuPqpye?=
 =?us-ascii?Q?q8RIGYbtod/H+oXhi2Zazyka9+sNDBzEcbT9gv2wsVZHXbVrNHzT3alQIQC+?=
 =?us-ascii?Q?0FGzbYADVPkL8u2Qvn20g0FiT2xhsxep+vrxCFwDXV0AxM63d7mv2CnlfR+1?=
 =?us-ascii?Q?S5qYRhKCHq4tw43dX+Gmfvzw2EXd8K8K6OjgM1nrs+OX8eXinGOPM2Jb3eaE?=
 =?us-ascii?Q?JV+IEfi08V8c4g1GbEKdSJgxWE3n0THx9RBx+34Yr1A427xMYNxcF08sQJwS?=
 =?us-ascii?Q?HMnxQNvyT1FXgGUgpdLdeTDCYFOPc7w+vnj2ksepLiJLjua0W0mFP3ZJHWdN?=
 =?us-ascii?Q?qyLJmT1lfKn8DZGTqmLJctC6?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aef3221-474e-4ae5-e283-08d8fb058a88
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2021 03:14:09.5067 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ad91onPXNHj0pUG493XmtRka4Y+7ipbPztfWBXMFAQr3Cv9SQyBKsiZt2DEh2NKsrL7xnBKNyDBq3/WGw1zO2w/BBvNHP0Wk4+FJ11l0a4s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0101MB2991
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
 drivers/mfd/simple-mfd-i2c.c |  6 ++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index d07e8cf93286..f7a6460f7aa0 100644
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

