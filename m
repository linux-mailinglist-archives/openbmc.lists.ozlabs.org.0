Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4089489FD
	for <lists+openbmc@lfdr.de>; Tue,  6 Aug 2024 09:21:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=dwTdc/FH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WdPr36ndQz3cXH
	for <lists+openbmc@lfdr.de>; Tue,  6 Aug 2024 17:21:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=dwTdc/FH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:c000::1; helo=byapr05cu005.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c000::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WdPn93BPYz3cSH;
	Tue,  6 Aug 2024 17:19:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rAVcts2Qyj1OZvFJbtYxIS08exBr4IYJC1cXcwsPmeXjsdjOP8mIm9JnvoEu4dVv3p0k4DoGde+QpbdChgj6AuiqvFkI6rjjmu1Qu9Z0IDtNL2QueE7qTTM3D1kcFg/ajXyBewKRgWc1g+wZe56fBYoPkmpihmpd1FqVUpxzxuBLs13Jg4eQX2o26N5YJQZurOsMogg9sR4eW5h9DdDLEIo+VZZM6Ch3CaQds66nF4hDn8KPjPr8LcxdWZ13yhcXQLb4sCsV035ceLgSJnosJ5iFiD3dDhL4s34upLpunE3uMY7QYDvYUrT3uONit83V4WvV1K6Sdx5hiJ05jp/y5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+fkwb7tH7+dJqAFoJPtx64QruRrhcUH6ktYyYlCc+Q=;
 b=utx3GkXKaHTwSTxWs6uENKcZEsbIxDuwH7lIgrsq0iafO/ES07hQs3oobUDNTxSNr0k1G0SANkdiTMSuEkdZaQ+gBkP4jwtd1pe03x69YRahDfC8+RRzjjaaIqtfSu2UjwKyNhBmK8Gt0eTVKwDIa25I5Mevp7Z9/tKN0uCwehcFGDVmFDfwQ3bhadI+k3Cbfex4kHWxCH3ysmk3K58wubfTNSWRIsUA6mr4LNC6MWPyxfC6rjX2x+2LkwW88CRqVltML4ysNA/lqK1TxxGJoS6jRauGLegoasITrnMJfhPyNTTA2buTTuEQ2YoVp9PsF4x9AKehceWtFyquh0jfbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+fkwb7tH7+dJqAFoJPtx64QruRrhcUH6ktYyYlCc+Q=;
 b=dwTdc/FHDv408MU4PtiZgjOohD6gluOaN8h86zSizOKEoSgKRu2dnSWrAMDPoA+7+3KSY/ni7ctkFMLeTJpS9e9CcbGFMbhv50JOkgKxPd+Y3bp20K+h98+in5Eb1p7euiEtfuitnyBNCnPs0cbZLcaQa8cTA1wlmzqoqWbmDRM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 BL1PR01MB7770.prod.exchangelabs.com (2603:10b6:208:399::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.25; Tue, 6 Aug 2024 07:18:55 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%4]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 07:18:55 +0000
From: Chanh Nguyen <chanh@os.amperecomputing.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	OpenBMC Maillist <openbmc@lists.ozlabs.org>,
	Open Source Submission <patches@amperecomputing.com>
Subject: [PATCH v2 2/5] ARM: dts: aspeed: mtmitchell: Add I2C temperature sensor alias ports
Date: Tue,  6 Aug 2024 07:18:03 +0000
Message-ID: <20240806071806.1666550-3-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240806071806.1666550-1-chanh@os.amperecomputing.com>
References: <20240806071806.1666550-1-chanh@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0026.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::13)
 To BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|BL1PR01MB7770:EE_
X-MS-Office365-Filtering-Correlation-Id: d20803c5-72c5-475b-bfa1-08dcb5e80802
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?SVssY+eoUD+8hXCiBCc2GOqirfxrR9QYxG1kS8AI5b7n9hxqB1fcuuUQ08L2?=
 =?us-ascii?Q?3HgI7goDiMnEJlu68zSuWLDB++KV6KXhXODJnR1PIw2zt5RzRmemAW/T5ZCh?=
 =?us-ascii?Q?dSZviwysUOpurVcuccrqJDIwQ569hDFaryQJt4mscSqB4tSHmngouA7y1sH5?=
 =?us-ascii?Q?APIjOdJzcQd/pspjL/woe8rAj79EY4CCd9f6aE09h6rxVYuJ9LC085vSxkLl?=
 =?us-ascii?Q?8Zy5mkoLz4WzUFfqLXB7xGj+0aO0SSQSiYj7fEhjtFKuPlBbArOiaMPhAgjv?=
 =?us-ascii?Q?wiq3g9RdD0BRQEnFO7VkCOE23fzwQjhHkl5xrbmFprl63KzY/2DB9sSwEHSZ?=
 =?us-ascii?Q?TYEfVmhTZYKhWiTM/UWcEqFlqIiRGVUKH58OEiO3YFcFJ/iDQ1dplDU0yWH5?=
 =?us-ascii?Q?yPIyPe44to5jlIowMMTtrD66D3z/lVY9FVinbfOYeYh5LYu+3JdWlZ3VhdDP?=
 =?us-ascii?Q?Bh7xtAx3ACGms4R2ZGCRyTDyLiKgHY9u9AKzG1hRHDr2JhhwrUbpceiRAH0A?=
 =?us-ascii?Q?dPFRHPyUWHhaJJS++wkjF6EbB5nT//Jvw0KvM2uA4xRD2whW6WuPDQQVqunP?=
 =?us-ascii?Q?QuHTr6+eEdVUzZPiz2O97gvKe6swHSbIWeusKNNqdGhjHnY7nCJhXRfPQwoS?=
 =?us-ascii?Q?321uOW0NbEpmD4MM/BS2lOGcWgMj3lYR3azrMbTbD3JGtftDY6RZ0NMeONYW?=
 =?us-ascii?Q?43L4Wap0b3TUmqJkkbqdRHghPvuXzVScrvARqdIWpp9zIEtWqTM0TuSg4jXX?=
 =?us-ascii?Q?h8fRbF3ovO/70SEGwuu8SZSa80jfQ6CBRmlIGjt1NQFSda0/LjkYtyi6KZmh?=
 =?us-ascii?Q?4rIBwG+9fQpTN7fPIoYjZJS1pZ1ebhwTFH66z/2XUNU3ImXL8JxpNXk/3CBL?=
 =?us-ascii?Q?AWCfU7gHBNuAHyaiLHnpSy6cUF/2CTezkhKkRCdZ153fjtwUKkk3VCb1S5zm?=
 =?us-ascii?Q?prJ82aDjoDxq0b2DEz6qJosYG7mBwHSErLTdmeDEBu64UfzRcaO7l4I4a+Rx?=
 =?us-ascii?Q?Wf8dkXW0IU6wUG6PIpjC42tq2Z4jYfwMUboz1hLu6pl3WvkrM3Db0T+cDeui?=
 =?us-ascii?Q?Ga2kkKrshPdjYs5pHJS/06hZ44oea5CNcZy086GOZ4Qcy3rBG+p8nT0rs1mI?=
 =?us-ascii?Q?LoycMEuue2fQ6qWydvlws2fITLLBacZfOlNcLmaKGf4OKtCt5rlqapilL8Tc?=
 =?us-ascii?Q?FrHdkOZvAdB5DylK2rePK+K4cvUFVZYpTYxBpgdHFESepYTz55Z2skBNv0uY?=
 =?us-ascii?Q?GtohIz4k8+8OqNT4OyxddX6aVScSsd2HCwd4LtsWrS5HthxwXxwW9ghRZ+Hj?=
 =?us-ascii?Q?ZsIiUVkMcNiTd/hdLYSZakUiUvVlga1K8k44B+mCWfb7BnvrmDpjSEcy22jt?=
 =?us-ascii?Q?MGek6xyPqJURB0VtX0ZFW7eMQqa8i57E2I8q7xtfTfvur0CBI+T6AcdxYIsl?=
 =?us-ascii?Q?CW1sEnQoJ58=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?NYWW5Hya38pKhf8IouwHDsH78ClJ6NDHhkO09di7EQKhLC2hEtf2JixMN1Px?=
 =?us-ascii?Q?XWYAQu8lar3rGKGWP2KVZ8yMqJgHdSDWiAnfTFBVunxgbb0nxCuVn22hkR2M?=
 =?us-ascii?Q?CaW6VPsc++D2I6ZRxEmxXpCwX/DLoJsH+fETmCYnz2wZ7C2GMrxooSYnLlH7?=
 =?us-ascii?Q?CKAXpfMcIK8pkgnFn7BJe69MTeivaCoHxXRaH0un2AG4H/KRxgRMFzgPe+C1?=
 =?us-ascii?Q?XU4BkFwWBYYQrBMrLRkofcectLFVKeGxzskptR9cAHwZYisrOKMhR3VNTNav?=
 =?us-ascii?Q?JjJUkVfzVdbrhHeookjO+BTqcW0J4crVxUqsep83twGgoZyJxCNPfe02D5Pi?=
 =?us-ascii?Q?9DAAC648KALIseM5zH7E9RSL4q/JRcwzTi2XDuSgVxz6C/pwq9IBC6LAndDQ?=
 =?us-ascii?Q?0yNHvkDHSXFx9rELJjgv1zTlcAHLj3NmCAw9GixFBdh5um+jmoC0GAQ+dQiE?=
 =?us-ascii?Q?P2CQuE2/58kxGq29+T/7m67xRTHUPTG9TucjUk2NZ5uJL26pDhvlPuszp1BC?=
 =?us-ascii?Q?HKToT+J5j4BpAH2rkGX5nL26APxO/3eCp6Xy3shL983E/yb3r82skn8nUTfw?=
 =?us-ascii?Q?EhDpid6Ux72PcZjnnwFo7bvi5I7QEIJutKm2DZb474ap+EMBmeyzzGeCrd2D?=
 =?us-ascii?Q?CLKcbpJxNCxv03n0rc0pXoNPbW6ME8dGto+s5sF/UHsKxQeypCX5SezXD98+?=
 =?us-ascii?Q?9/gGGf9pnlNCSLnlG3UbE98RisphGlgPLpRPj/JbUhdbwFtljU7x0ITkHW6K?=
 =?us-ascii?Q?LLDHbahjev/O/MnBrPZuDJUUu55NGehWUR6gvSPsRjpGbI+hWSjW8ur+nMZQ?=
 =?us-ascii?Q?sAKf9Jfi0smczfpBeGAkienR8a9RutCsx8D0BVddR+hzcXgRNVsSAtJVxQrG?=
 =?us-ascii?Q?jYxSHckps4s5D1K1wQPBDxF6uWs/nVnLSwT7pKYWkXniQBe3xte0CEkxOX4t?=
 =?us-ascii?Q?LeEzDciFWm6wxqAaPdQ78useelDYHvHW30dSF/0bIP30ATy3J1AcGYwSHIeR?=
 =?us-ascii?Q?7edukqSpv7gMQ/FNlWGuRQ3dw+GSroOIo75eawzgpoUjxfgEDeuvLMSIKj3J?=
 =?us-ascii?Q?uFk3eDtkVOCjRQiYxv8s5z3KCGbBXPFGuy8qrcROGackZyveEuWHWQ3EaEBF?=
 =?us-ascii?Q?2zkESo+W9zePqOMPUFspqH29WVLjWPMG6sGWtWLON+dq0Yj4prb3O+ySrqyU?=
 =?us-ascii?Q?9LnG017o9z2XC12WoZzRVpzHRR+f5cXbTHLci2mq0ebMqD/8fZDYWZnTfSvq?=
 =?us-ascii?Q?xMGHIG4PXuefnvj/vIU5C2rlVhy9vXPYkK3Ap3s1QKbsTjll+rNRKX+3zZNu?=
 =?us-ascii?Q?BoAEDBaQt8Dv4C6EDoLSZjWUvUlIDO8bwocZaPckxhbp/wl3989e64DGO1wv?=
 =?us-ascii?Q?hQov9ZwY2+pltJSa/AZDoSmRHI92uiyQdOV30CL5godTKnx1NoT0G3A2H5Fw?=
 =?us-ascii?Q?Yy1Q+dfszXxBtmr5o4AqvPKqXBx9Yn0LUsHa0K7lptZ4uEY4WktDd7ct3tHv?=
 =?us-ascii?Q?43S6GXQyKTeXEOl+bkd8TLBRZgCYdx1M5YuuVuCtim3v+k/mbkt4bfpwLgTt?=
 =?us-ascii?Q?otHZolRt3Uu0tUIEavBQmZtRC9OeS/N6/etCUOvjpAfiRh8qd0XQ+Omuzn75?=
 =?us-ascii?Q?XSUTZG6h11AX+zJUXRsDkeY=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d20803c5-72c5-475b-bfa1-08dcb5e80802
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 07:18:55.5311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bhfxIB3AuTwezP4Itd7yS8oRe2aVARQryFtJOfEsGVuSpsjRRznnRnCEiZxG/owtDG9dw3wzix+uDcN9ENv/2gTpzsi1YEcKZLGlwpntfNb8JcYIgz8X1BzGmxaBInv6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR01MB7770
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
Cc: Chanh Nguyen <chanh@os.amperecomputing.com>, Thang Nguyen <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add the I2C alias ports to read temperature sensors via channels
of the I2C muxes.

Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
---
Changes in v2:
  - None
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
index 3a97e88278d5..1679911e4fd8 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
@@ -15,6 +15,14 @@ aliases {
 		serial7 = &uart8;
 		serial8 = &uart9;
 
+		/*
+		 * I2C temperature alias port
+		 */
+		i2c20 = &i2c4_bus70_chn0;
+		i2c21 = &i2c4_bus70_chn1;
+		i2c22 = &i2c4_bus70_chn2;
+		i2c23 = &i2c4_bus70_chn3;
+
 		/*
 		 *  i2c bus 30-31 assigned to OCP slot 0-1
 		 */
-- 
2.43.0

