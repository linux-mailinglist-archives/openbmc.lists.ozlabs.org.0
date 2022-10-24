Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D7B609C2A
	for <lists+openbmc@lfdr.de>; Mon, 24 Oct 2022 10:12:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mwnr92VRCz3br4
	for <lists+openbmc@lfdr.de>; Mon, 24 Oct 2022 19:12:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=JP7fHP26;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.220.111; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=JP7fHP26;
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2111.outbound.protection.outlook.com [40.107.220.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MwnqS2PHzz2xCd;
	Mon, 24 Oct 2022 19:12:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jETRK3b98vFu26rlWogpI5i0V2H3iajJ+YfAiWWMXAZjoHbyVRENM6SBi++3YAu6V5ntAzha7y7XCXj++nYwjBwKXFTfuQjXKz3jNA9gjuekHVTl+WcWTqSatlYwNntJsoh3bpyS0XiYg5+SCVuGEFDCDmI+Jy8HqQbTbtagZbxkmWRNwwvzlu6UE248azDcfnNoS3OwXyDGvP3uucEWkgOIOflVSRD+8Uchs+QN1L/FACGMq7UDxMHUxlcmt4pVm8IjzT7fOG8oP52LMrAkye388dVGWr9TAx434g+zo71udiZa/zDp51Ft1pM/HC+lRPbtFfzWDYW0sThfKGGLBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xer+n947eK+DNkvi3K1rpavd2qMg2ejGQW9lgcqOhdw=;
 b=NX1P5qhlDKA2Y7JylhU5yFocERxthMIqwrpgZ7fKytv6bIWzLk9kejbKTjQpEZuCfN6RTSNNtJ1svqm/9DDnZk/0xgHv/oQIGPo4iDfToSNOPvQIkegJKbmtsNO5VhPBQy5iHkqsLTPtrfsttlW8fQRd3OaJfxnWdzR4VAVtQV128gtKrcms44RY7kZpkX2SGw7gaWxA3DvG1HJRhi7CGY5qSHRuiKLTIpGvN+ZJuRY/lG5ZjvQUdRW3xNGeHGSyWMir9qkyaTLflV7QqwUFp5BcXYPbZ/Sm7XvViL5hO103unLA9XnaTXIXBXiqVO/vRitfviKfbtWY8W5v4pJlRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xer+n947eK+DNkvi3K1rpavd2qMg2ejGQW9lgcqOhdw=;
 b=JP7fHP26/WOc9Ue72U4/ZKP4K0FZjnyAysYkuLgstcM0t8I6h+M9BbbtOcNm27Cc3RXj+DrhlJ4/nNuNADHm8K3bL/kLj44REFvE9Sqw87xe8zEet7XbCSdN14ezIzauc+AyV8l0vZCbxViErFHHnjuvV8+dnq2otAKga6V8+O0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 MW4PR01MB6467.prod.exchangelabs.com (2603:10b6:303:75::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.30; Mon, 24 Oct 2022 08:11:57 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::ebe2:243d:ff84:aaa8]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::ebe2:243d:ff84:aaa8%3]) with mapi id 15.20.5746.021; Mon, 24 Oct 2022
 08:11:56 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Open Source Submission <patches@amperecomputing.com>
Subject: [PATCH] ARM: dts: aspeed: mtjade,mtmitchell: Add BMC SSIF nodes
Date: Mon, 24 Oct 2022 15:11:15 +0700
Message-Id: <20221024081115.3320584-1-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0013.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::25)
 To SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|MW4PR01MB6467:EE_
X-MS-Office365-Filtering-Correlation-Id: 0438c5fd-697f-446f-cc2d-08dab5976a7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	yu1A0fTdGIWrSKgPfB3RKBP4ez8GHneysSicRKMohfFtjOoOShsCMckhYXA9BjIYNcQKE90OJ6i9/Pq9FPDswEsNj7Alg57uHuerAYFEgxGK3/lycNOaufu4GxlyU6DJOkDdOTabKXn5kNwYproNgtuFd23ifCD2Fwuj7T5LaDqSLPZGO6oeSsjw7RUYV1euwRAi9tBq1LM1Waj8wbfrllblnm7GTuypZGfbQhJtDpbKpOG9/j/aVhQtddqKYqCpPJ4sb8lb0pJWU/E+KdtL/5AfWA3jCLYnzYptNnQncbwLU7+kl606E/5cONaoE+8TkJXNHH5qgbFXrgb4FCiq4TfxRAHl8QKdU94BAqKrzl6zcYIfAVAc1EK6uDXFOTDlt20oaCgdmCIb4+EzlYe9iRdm/R6v2RdtPn4R04DB3RsZXWxMkMB9ArD5CvSEoHkqdysi33eqMnZgs7fp6DT8nd6ZtQ8eDowM9/NHjCdU6TBkc8IbG0vVZczhQOQmbzpLh5hMJj4DBETYC3UgxnGfU1QxqfSCgzN+jTRLz8lkyuKMIMzCVdgr56SaYtCrd8B2VXRFIi7vCyoe3m1SoetljaFnuCS+sl20LthAgAUDr8Uc8ihjmnL5DXrgh0ZwLlqKP7UwC8lJyqEXTVLosckpu4o5hWqTWudeoTp9XZuRTXh+h256eCC9oKkeycrNLrtPkdnMj7u6JNCQz8n0ONPq9IhjSG2Wa8BRSVDKiA3TUiJ4ngJNThV+UhPQaVSqJPLhNqWZTZrlnWWEl317u1aplQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(396003)(136003)(366004)(39850400004)(451199015)(86362001)(110136005)(4326008)(66556008)(26005)(2906002)(52116002)(186003)(6506007)(38100700002)(8676002)(66946007)(66476007)(38350700002)(5660300002)(41300700001)(316002)(6512007)(8936002)(2616005)(6666004)(54906003)(6486002)(1076003)(107886003)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Kn2T9HL+45B8lyKgPwzHu6TnldtREQfsG3wkXV/z365xy2vcWSDnJPRtEoZl?=
 =?us-ascii?Q?vrenIySJwxaYVW+V4DLFY9RDJqB4EvX8f0Z9WU8SEoSkVwtyw4k/uUOZ0zx9?=
 =?us-ascii?Q?Llb+d8+NEc29V28t+2LH6tMwDVEG882M54qpy2626awAbsQMkgJCSsCMDBa7?=
 =?us-ascii?Q?KxQaj3rEEA0H482roVUEVA8+xzA8AXuF55z9y8GTipHo3rT2L8hk1wipRAPC?=
 =?us-ascii?Q?t0jSLSAzx21RbDlcQN9dt+K+gUNFk96NOmbIc9QiRC8C0SpyqLr1NGa93mC0?=
 =?us-ascii?Q?mITBSlH35hqXYZorpWVd9a7PdjvblmMK9/i5SlOmZa/Lt1zkNxc/dgZZK5Q/?=
 =?us-ascii?Q?Ek5yKuUfF8zfyoFYx27uqo9eCYiW4eoeYsPjIRBgaDlLUVBVLesqdy8Yd+TB?=
 =?us-ascii?Q?5Ped2iM/V3eqmA5to/z27qfOi6ShxqM8oZcyrUEtUgbHyBsUL8fUXVWkMq34?=
 =?us-ascii?Q?eDTh640LaDL+cCE0h9PXnWqnw4g3bhsojmW3Irphjqs8Hhn+8V8TRdz88Hkg?=
 =?us-ascii?Q?fMO2RWNa1dmJFESdeWsTCNhNzblJQsr+dmHIGppnPBV9c46CenPDSbtXx6Ri?=
 =?us-ascii?Q?8yi4FDrxFivc5/Mp0Vl91DL6X8QDKTfj63nL/NVT1UYVOwrXDEL0IMXUiCEZ?=
 =?us-ascii?Q?xI2Xj9cU2MRtSfz8TNY2ZKWAGYJHuH53ukC3x6ddDvED5COQQTu9XXd1p4yQ?=
 =?us-ascii?Q?jmlvtFzsuAkturqaXX3ywTK7QiQn8N2l/rPGFItjlfrh2DXnzlO/xEK29Q5m?=
 =?us-ascii?Q?lLEPRN9acLz71BkHALZpe3edHF8MXExhTb4AckZVufzxXrs1CWcPr5yE2/Q1?=
 =?us-ascii?Q?aUZrUQr8oCRQn5SgyCj6SnOLO9kjbhd8cmt03fFixzynVhAkC0NQdsluxoLd?=
 =?us-ascii?Q?e+OiZXv45yAiMfRVB/2UZYS7yQFGqKyoL/4WqD1q29ab5kwWT5oNphz61KbK?=
 =?us-ascii?Q?OQA3h3fVK1hoB/Q+kXDlAP7u/Q4qW4pigqo3n3n6gIN5yhcqS5GBMaG4dIjE?=
 =?us-ascii?Q?uvqwJgEsciF3fM7lYUTxMvc71l54wd6F7gcaxgOTvkYblDPyrbyZrNCMBnmN?=
 =?us-ascii?Q?/+oXfow7NbdZr+TIaLMxzByzbjJK0neaIKGUDV4ii8exdAah/3J8X+2K1eRO?=
 =?us-ascii?Q?xBtFKHXGlAKnrtdUCfi/7mFVm24v36Xm6xuKtFcnvwAkYwbEyP2LBqikWFkt?=
 =?us-ascii?Q?5S64vXouA/nJDPYZSFn6rpAeubTBXRbtQpxxIF4qZ+zrnGUdgRyeGCbVaESJ?=
 =?us-ascii?Q?givSv59yyYnt+n62/+ShX+jqzdYwARcl9F+/jqE2wQeQ0rzhG2wRWYO69X1a?=
 =?us-ascii?Q?KtFRcfBdtvDKRERcu1c2FPrQSpTdGvA97taRntFzdzpDVfMjNGH+jnBl3pkd?=
 =?us-ascii?Q?zzuKUGYlZDYQq4LkBBvXUL4dItKdpyZ1VArlOXEVe/2GxGv5SZKXpKu1LHVC?=
 =?us-ascii?Q?YmXUaMFMgjGmtV4p/xNAQFuB7VMHr30HQxJ0RtvQlRt0lvwL6e6j8BasbhD/?=
 =?us-ascii?Q?YrM31xqwaEsEqmAbimrFc0j6r2Vxp1NHU4IrMEfXXPk2sYPZ07izx5uyaaPJ?=
 =?us-ascii?Q?Od4oow0iaAn2l9bORuvBBARTLAM4Q1x1363Gjadc2Z4jOSaQqsnUHV9xJXXu?=
 =?us-ascii?Q?TDykNiHQpym5L3d/AqTewLo=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0438c5fd-697f-446f-cc2d-08dab5976a7a
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 08:11:56.9028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bc6ScfDDWnV0Hjac1TBVX4UOhbP9YL9Iq7iCE1/5jAGGwcrtTJBntechBIZRnHbAQ0LVgDmBsn7jKpFCoISpoUbKSlgtgHgyw/mgN9l+ubk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6467
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, thang@os.amperecomputing.com, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add BMC SSIF node to support IPMI in-band communication.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
 arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts     | 4 ++++
 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
index d127cbcc7998..353359822d7b 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
@@ -342,6 +342,10 @@ &mac1 {
 
 &i2c0 {
 	status = "okay";
+	ssif-bmc@10 {
+		compatible = "ssif-bmc";
+		reg = <0x10>;
+	};
 };
 
 &i2c1 {
diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
index 606cd4be245a..4b91600eaf62 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
@@ -445,6 +445,10 @@ &i2c9 {
 
 &i2c11 {
 	status = "okay";
+	ssif-bmc@10 {
+		compatible = "ssif-bmc";
+		reg = <0x10>;
+	};
 };
 
 &i2c14 {
-- 
2.35.1

