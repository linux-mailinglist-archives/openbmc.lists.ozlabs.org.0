Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9424C7B9A8A
	for <lists+openbmc@lfdr.de>; Thu,  5 Oct 2023 05:58:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=qPjmvCuD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S1HqF18Nfz3dLW
	for <lists+openbmc@lfdr.de>; Thu,  5 Oct 2023 14:58:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=qPjmvCuD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe59::705; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20705.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::705])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S1HmM2nJxz3c8c;
	Thu,  5 Oct 2023 14:56:19 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZaFf5v30wYPGdJyZih9DdsnxzI7fAHWsutiy6S296/BAmVI8QU/GPBiQEqdKaZKUhOvtu0FfpkllQXuEZywg4LLst/cfdynBYYtspN0NpRqRIWaN5kZWA8rDN+95oucwAMGr3WfEru8PZid1+ghQJ7th1/YkiuAwTPIu45VskMs5Xf6/NBfAgjSX3XjON+HYq2c0fgvLVpoUBEnZeecisMB6vcwR3izULKWyxr5oUcWOYIyTjqQ7vrQOA0/iudpJ5E059pOJ1efxMGb1DCGVO4RgrHnCnmZac6Hy7fnstCSJ6G0mRir6fRQdmdMltWbuRWLSho1krIf6r2o8M4DhwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7yCTCRCgMJ4qcCqPA2bsqmiVYHdoYiRIeu+eV5e1j/o=;
 b=c2wkbeFCDxTWTb66hUdcMq9TTOn9r+nKeDT7owo2dQyyShcq/ADR4EaLFS/wNLa8KJ+1D5jgZvbXTrTfkPHDEGyMh1befis7jsL3TiVJUkm1qsTV1N8jbmFl0GgIkJxkP0RMIghOkmRh/+SbI6Qo3IKPuBRDmxuhzdPsLEYxqA/+wiId3KGr+9WwiqO/l31eHQl9UXWRB0WjkGWYHyWN/eseRTdxMxgN4CyxnXkGrI2QwHjlA/ZwEsE6Db+W8Hs2YOPG7BQMOcu39sjfCmj0OnLcc9jBOE8QJE7EbSU+0MnBGltR6Jx3mUp+qU+L45nNV91ms5fwS6Uz5oBY9Wdbfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7yCTCRCgMJ4qcCqPA2bsqmiVYHdoYiRIeu+eV5e1j/o=;
 b=qPjmvCuDp74ghLntozfifGvF0FcWXb9kCZN6wnibLBi0ySwN8FR+GMBpamlYIIQhujcz5JTHRZds6Nw8Skj307wbZev92RlHqnDHXFZVo0L4qcDamyTJDHybRY8scQiLDAejuETy3NBAYbiVmC0yTl6dQ+EIX/ZByKIy7MDT2Z0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from DS0PR01MB8010.prod.exchangelabs.com (2603:10b6:8:151::19) by
 BL1PR01MB7649.prod.exchangelabs.com (2603:10b6:208:394::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.25; Thu, 5 Oct 2023 03:56:11 +0000
Received: from DS0PR01MB8010.prod.exchangelabs.com
 ([fe80::6a3d:61d7:133b:9eb9]) by DS0PR01MB8010.prod.exchangelabs.com
 ([fe80::6a3d:61d7:133b:9eb9%4]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 03:56:11 +0000
From: Chanh Nguyen <chanh@os.amperecomputing.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] ARM: dts: aspeed: mtjade, mtmitchell: Add new gpio-line-names
Date: Thu,  5 Oct 2023 10:55:20 +0700
Message-Id: <20231005035525.19036-3-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231005035525.19036-1-chanh@os.amperecomputing.com>
References: <20231005035525.19036-1-chanh@os.amperecomputing.com>
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0016.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::28)
 To DS0PR01MB8010.prod.exchangelabs.com (2603:10b6:8:151::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR01MB8010:EE_|BL1PR01MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: e03fa63b-1330-480a-ac44-08dbc5570391
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	fK557imwsAqVpXbSokWs17mDOX/pYsAjLT3x5n5ONUv90MQA/tkDOuEpnARHjPgRZK++cQKg+vu1Jg2hOml2H5wZAZx3wLjRxFBMMve798cB1U8ukYGPWpwor21yVobcSMF3Nalllo/f4KP/m/LzfYaLjIYS6FXUg5f9ahXu35QxOd+zlGCG18S57ABOPEdrp2ygNVqQNvE6YWyBaw4973oqKpBdLkreXytZJbNv4Rb/X0yZiHYixXXu8wDkYwz7ct4SZD5QLALVz3kZ1tVroTWpSORTs2HtnfLovpTBwXTf9oTsfXnrG41nDb3IG64obAeuEbQeBq9gtjE08gLWFP8DqNWO5pNFJlxTpodaotVjAykxyiuOyRYcVmOIZSMjpmg124IQ1sZYGUgC+6ZtSsBIMoAJ7vbL60bLRxsyvNWEChiLbKaWm98j65UyZXHf0H3kqvuye0DPY0yYfzG+dnCnBKIb6mjBEX8k64/SJi5ykxby84ZrQJv6BxpmtFcaXgcemYC3f8tkrEvjMlQK5MHDZGMtEMNDaMKJanKHWt9AYRs4eNJpaiJ3q6cqcrvsj1yV5kfCO4yDHdk5be3tJOd2CPoVKQdvQ5ztlmhyOhMXIDMGsx+a3EXFfR8QBw0BLpPbWqCnShPb9tRTUrMEqmcG+POo4Na1g+iQLGFscFQ=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR01MB8010.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39850400004)(396003)(346002)(366004)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(38350700002)(38100700002)(6666004)(478600001)(83380400001)(6512007)(921005)(6486002)(6506007)(52116002)(7416002)(86362001)(8676002)(4326008)(8936002)(5660300002)(26005)(316002)(41300700001)(66946007)(66556008)(66476007)(2906002)(110136005)(1076003)(107886003)(2616005)(449214003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?q1GnDxEduXXleojKdwkESmRGSJmH7ouGKm38JwakTHb6kMjFohCI24E+03sN?=
 =?us-ascii?Q?/Q2/u2m11bRpcf5b5fZXBdkqHvHk+frhXRCFJyXP2115xI4NrmdH9KyquTrF?=
 =?us-ascii?Q?PrzIO7EMdWPTjCLn4PzS3rQ766sygspQRiriYFETgOQgYfhcQdZ0z5w5Lv7g?=
 =?us-ascii?Q?87a4fMsdOwnJmmErctKJMGXB81APtobUZFESjgiyoAGTD1z9a4nOgVfqyAkP?=
 =?us-ascii?Q?/3Nn+tIFmuSBgC2l61tL3q3M5PwhAvnkVu2+aPI53df5TxnfkjEzRNbaMDpZ?=
 =?us-ascii?Q?pOzwL+VIMFIa1pUzMyDJ4La1phiZ69BX4bc9tj8LS604nQ2dUiGj/ZFWkOSX?=
 =?us-ascii?Q?8mDkNHFySmmKEqdQgZ6GoiqUZpnzHiTJmXJqEkUDld0fE7M3tge8F9F0A/PP?=
 =?us-ascii?Q?mHE5KD6fDLRU52D6kLM5zadLYJ6X5uWmuzKK3Wu96rpaSUUjO7oDo14QjCcr?=
 =?us-ascii?Q?jlQHMLNx54AjJr+0SiW5znbiA6WWosTC+PLEmrbHk8ZOjbsiAtnm4e8ic04E?=
 =?us-ascii?Q?jJtRWPQVu0HJ1JHnSmvTLfsMFSuB+VbMHAJogjP7FP0qAIUXzYYv4z3jrkt8?=
 =?us-ascii?Q?mNu6+uUEDXwdsFNsgHZ2BeBm3PicH39DhDk/rVOoMu23+uHB+nEL1iMDD6mo?=
 =?us-ascii?Q?rE1A9o2lwi1IDTZDO8jNP8DanZdb8Oqsr1XvlVV4MzuGb4ylC/UI9Bq8ph0D?=
 =?us-ascii?Q?6iViG7ul3jItiCrsRbWTLXQJGro1QzQQR/B9LB1M5tgyXRbKwrwrkYVbhYN5?=
 =?us-ascii?Q?5MtpLI5kx1kSkfVT/na8OAkxbT+3fviDqLuEcUG+WgE2m9e9iscUBBVwEBGK?=
 =?us-ascii?Q?3Uh68cMRmoCMKAnYQYHHWPYdgAEfGlmK7gZVVDCy3r9Lm07Hou/5UE3lQzSs?=
 =?us-ascii?Q?MOrR7NHfv2vDss/3EaYpQJXPdHkSUVFUWUojrrgIPHTCd81NfCjC7oh4j6RE?=
 =?us-ascii?Q?VkRjzSUxr7JE3kZPZEAS5FoH8BOsG6ESKg7XeBm4LmeDRNgaw5U/3BoffozQ?=
 =?us-ascii?Q?a3o1w9MUHp9T9lGrjmMBylP5i6OQP2c5lBhKaIxf6l5XBTKgsNVJW0Fe5wtm?=
 =?us-ascii?Q?svyjiIRw5OQm0pU/Re6jYAWo25uU3D3D76iH/grkL5Q3Z2ItOlZ5jBNIaRTi?=
 =?us-ascii?Q?sprSTpgaKOUg+HBFkmG47tINeKj9izhQUrJ5XjdBY+EyVoLJQczcZ39cnm6e?=
 =?us-ascii?Q?UHFUbyzhsmtHFIiA2/2tpD18zJEsems9aZtOsRZN1wiySBweoSIM/JBXJoOj?=
 =?us-ascii?Q?FXooYWnINLTjSHF0dy6AOd+UwNJGefBKCJmMEwOOx7LFeHrQO3/m16BtiRjn?=
 =?us-ascii?Q?8/vtx3cqs+O3EFblmyhcCaJsqsZn0R8XQvYVs7Dzm6qarL77za/p9/7v7Et0?=
 =?us-ascii?Q?sfW03BCiqMQubXgj4hykStlSDUOgr+oihunlCefn4sYtadgPDBkkAXxYtQSp?=
 =?us-ascii?Q?EHqo+itLfivsg8U3aEWYAtV3hQoxB9oCxjGUyvwwLgcWCLoFpdh67SSPhABM?=
 =?us-ascii?Q?x2Ncf7uD1kfoCx+NiTg7hLHYYSljQWlwsDcXND10PcDKAm79vcV70rp2g+Ih?=
 =?us-ascii?Q?ttjmrQyKa/fUuf+2CokIq8A0Ix7t5pImhNs79LX9y1lzpJuQsQPx4JsxlgVV?=
 =?us-ascii?Q?bVYw4XHRKuNXgSXhvimw93w=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e03fa63b-1330-480a-ac44-08dbc5570391
X-MS-Exchange-CrossTenant-AuthSource: DS0PR01MB8010.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 03:56:11.8568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8+Gq86UOs/iyf7u1FXwIEzlZpN+zFkQ3115TmhunAe7xIV4d1ib5S9wZp75V1QllgmUu4MzKNpYpq5AVBNGpReM//hwez5ChyQtaz4kw4x5T9QZF3z3h1nN1CAsi2Jyw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR01MB7649
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
Cc: Chanh Nguyen <chanh@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add new gpio-line-names from the Mt.Jade and Mt.Mitchell
HW schematic.

Mt.Jade
  GPIOB5: presence-cpu0
  GPIOF0: ps0-pgood
  GPIOF1: ps1-pgood
  GPIOG2: host0-shd-ack-n
  GPIOH0: uart1-mode1
  GPIOH1: uart2-mode1
  GPIOH2: uart3-mode1
  GPIOH3: uart4-mode1
  GPIOH7: i2c6-reset-n
  GPIOH3: host0-reboot-ack-n
  GPIOM4: s0-i2c9-alert-n
  GPIOM5: s1-i2c9-alert-n
  GPIOQ6: led-identify
  GPIOS0: s0-vr-hot-n
  GPIOS1: s1-vr-hot-n
  GPIOS5: vr-pmbus-sel-n
  GPIOY3: bmc-vga-en-n
  GPIOZ3: s0-rtc-lock
  GPIOAC2: spi0-program-sel
  GPIOAC3: spi0-backup-sel

Mt.Mitchell:
  GPIOC3: bmc-debug-mode
  GPIOE1: eth-phy-int-n
  GPIOH0: jtag-program-sel
  GPIOH1: fpga-program-b
  GPIOW3: s1-pcp-pgood

Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
---
 .../dts/aspeed/aspeed-bmc-ampere-mtjade.dts   | 42 +++++++++----------
 .../aspeed/aspeed-bmc-ampere-mtmitchell.dts   |  9 ++--
 2 files changed, 26 insertions(+), 25 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dts
index e57efcc8522a..c87be433bdd0 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dts
@@ -762,42 +762,42 @@
 	gpio-line-names =
 	/*A0-A7*/	"","","","host0-special-boot","","","","",
 	/*B0-B7*/	"i2c-backup-sel","","","",
-			"power-button","","","",
+			"power-button","presence-cpu0","","",
 	/*C0-C7*/	"","","","","","","","",
 	/*D0-D7*/	"","","","","","","","",
 	/*E0-E7*/	"","","","","","","","",
-	/*F0-F7*/	"","","power-chassis-control","s0-ddr-save","power-chassis-good",
-			"s1-ddr-save","","",
-	/*G0-G7*/	"host0-ready","host0-shd-req-n","","s0-overtemp-n","","",
-			"","",
-	/*H0-H7*/	"","","","","ps0-vin-good","ps1-vin-good","","",
-	/*I0-I7*/	"presence-ps0","presence-ps1","s1-special-boot",
-				"","","","","",
-	/*J0-J7*/	"s0-hightemp-n","s0-fault-alert","s0-sys-auth-failure-n","",
-			"","","","",
+	/*F0-F7*/	"ps0-pgood","ps1-pgood","power-chassis-control","s0-ddr-save",
+			"power-chassis-good", "s1-ddr-save","","",
+	/*G0-G7*/	"host0-ready","host0-shd-req-n","host0-shd-ack-n",
+			"s0-overtemp-n","","","","",
+	/*H0-H7*/	"uart1-mode1","uart2-mode1","uart3-mode1","uart4-mode1",
+			"ps0-vin-good","ps1-vin-good","","i2c6-reset-n",
+	/*I0-I7*/	"presence-ps0","presence-ps1","s1-special-boot","","","","","",
+	/*J0-J7*/	"s0-hightemp-n","s0-fault-alert","s0-sys-auth-failure-n",
+			"host0-reboot-ack-n","","","","",
 	/*K0-K7*/	"","","","","","","","",
 	/*L0-L7*/	"","","","host0-sysreset-n","s0-spi-auth-fail-n","","","",
-	/*M0-M7*/	"","","","","","","","",
+	/*M0-M7*/	"","","","","s0-i2c9-alert-n","s1-i2c9-alert-n","","",
 	/*N0-N7*/	"","","","","","","","",
 	/*O0-O7*/	"","","","","","","","",
 	/*P0-P7*/	"","","","","","","","",
-	/*Q0-Q7*/	"","","","","","identify-button","","",
-	/*R0-R7*/	"","","ext-hightemp-n","",
-			"ocp-main-pwren","reset-button","","",
-	/*S0-S7*/	"","","","","rtc-battery-voltage-read-enable","","","",
+	/*Q0-Q7*/	"","","","","","identify-button","led-identify","",
+	/*R0-R7*/	"","","ext-hightemp-n","","ocp-main-pwren","reset-button","","",
+	/*S0-S7*/	"s0-vr-hot-n","s1-vr-hot-n","","",
+			"rtc-battery-voltage-read-enable","vr-pmbus-sel-n","","",
 	/*T0-T7*/	"","","","","","","","",
 	/*U0-U7*/	"","","","","","","","",
 	/*V0-V7*/	"","","","","","","","",
 	/*W0-W7*/	"","","","","","","","",
 	/*X0-X7*/	"","","","","","","","",
-	/*Y0-Y7*/	"","","","","","","","",
-	/*Z0-Z7*/	"s0-plimit","s1-fault-alert","s1-fw-boot-ok","","",
+	/*Y0-Y7*/	"","","","bmc-vga-en-n","","","","",
+	/*Z0-Z7*/	"s0-plimit","s1-fault-alert","s1-fw-boot-ok","s0-rtc-lock","",
 			"s1-sys-auth-failure-n","s1-overtemp-n","",
 	/*AA0-AA7*/	"","","","","","","","",
-	/*AB0-AB7*/	"s1-hightemp-n","s1-plimit","s0-ddr-addr",
-			"s1-ddr-addr","","","","",
-	/*AC0-AC7*/	"sys-pwr-gd","","","","","","presence-cpu1",
-			"ocp-pgood";
+	/*AB0-AB7*/	"s1-hightemp-n","s1-plimit","s0-ddr-addr","s1-ddr-addr","","",
+			"","",
+	/*AC0-AC7*/	"sys-pwr-gd","","spi0-program-sel","spi0-backup-sel","bmc-ok",
+			"","presence-cpu1","ocp-pgood";
 
 	i2c4-o-en-hog {
 		gpio-hog;
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
index 2f571b43106d..b7c4f7cfad07 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
@@ -575,16 +575,17 @@
 	gpio-line-names =
 	/*A0-A7*/	"","","","","","i2c2-reset-n","i2c6-reset-n","i2c4-reset-n",
 	/*B0-B7*/	"","","","","host0-sysreset-n","host0-pmin-n","","",
-	/*C0-C7*/	"s0-vrd-fault-n","s1-vrd-fault-n","","",
+	/*C0-C7*/	"s0-vrd-fault-n","s1-vrd-fault-n","bmc-debug-mode","",
 			"irq-n","","vrd-sel","spd-sel",
 	/*D0-D7*/	"presence-ps0","presence-ps1","hsc-12vmain-alt2-n","ext-high-temp-n",
 			"","bmc-ncsi-txen","","",
-	/*E0-E7*/	"","","clk50m-bmc-ncsi","","","","","",
+	/*E0-E7*/	"","eth-phy-int-n","clk50m-bmc-ncsi","","","","","",
 	/*F0-F7*/	"s0-pcp-oc-warn-n","s1-pcp-oc-warn-n","power-chassis-control",
 			"cpu-bios-recover","s0-heartbeat","hs-csout-prochot",
 			"s0-vr-hot-n","s1-vr-hot-n",
 	/*G0-G7*/	"","","hsc-12vmain-alt1-n","","","","","",
-	/*H0-H7*/	"","","wd-disable-n","power-chassis-good","","","","",
+	/*H0-H7*/	"jtag-program-sel","fpga-program-b","wd-disable-n",
+			"power-chassis-good","","","","",
 	/*I0-I7*/	"","","","","","adc-sw","power-button","rtc-battery-voltage-read-enable",
 	/*J0-J7*/	"","","","","","","","",
 	/*K0-K7*/	"","","","","","","","",
@@ -605,7 +606,7 @@
 	/*V0-V7*/	"s0-hightemp-n","s0-fault-alert","s0-sys-auth-failure-n",
 			"host0-reboot-ack-n","s0-fw-boot-ok","host0-shd-req-n",
 			"host0-shd-ack-n","s0-overtemp-n",
-	/*W0-W7*/	"","ocp-main-pwren","ocp-pgood","",
+	/*W0-W7*/	"ocp-aux-pwren","ocp-main-pwren","ocp-pgood","s1-pcp-pgood",
 			"bmc-ok","bmc-ready","spi0-program-sel","spi0-backup-sel",
 	/*X0-X7*/	"i2c-backup-sel","s1-fault-alert","s1-fw-boot-ok",
 			"s1-hightemp-n","s0-spi-auth-fail-n","s1-sys-auth-failure-n",
-- 
2.17.1

