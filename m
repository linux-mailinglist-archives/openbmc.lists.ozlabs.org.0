Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBBD4B40DC
	for <lists+openbmc@lfdr.de>; Mon, 14 Feb 2022 05:32:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jxrsf3GT9z3bV7
	for <lists+openbmc@lfdr.de>; Mon, 14 Feb 2022 15:32:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=KtTIU3KJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f400:feab::702;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=potin.lai@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=KtTIU3KJ; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20702.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::702])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jxrpz1C07z2x9b
 for <openbmc@lists.ozlabs.org>; Mon, 14 Feb 2022 15:29:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kTlwea+Y1Q7EcLgV1vaRc2NnsVQAr0eLC1bwNwFM/dbd8dSI4FS5TzoJFK3eEUV2lBPf2rhLhg2wKPMtVA3fqXCJDmU7TNT2o1x9SgGatMG3PTrXDMDzjQ1z0U8W4X1slJ/fY4uoKtmKhs65TX51oKJ+wTODf3SvKM0EoNdWLe2DKCCR6y03D6bs0MEfSnAlXyWf+aSF5QocQ/b5JDVuLdEpmM/umy0eDCIwIzU8GwK+7doX88WJgWpj4TA/wSmbAF5pQMeEU84oKGjogEVKzW/qebw9HYkt9Y3EzU4eh5pNoXoWjqcBJ+oOtFv7oUl+E8kHLQk31JtROgiQFBudcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KdUJBmwjU5W2iari+ueVI/TTp3sc1eWteK4je1O4ZtQ=;
 b=iyZe+m8iwwNnpdki8C6vBa7TtepgWDjq4qepJnmyd20dzwf3sUMrkG4w5wPyw2rlQdeFK+qPRsam2CL6j0yqbaHC5nSf73YSaLVF15dBF5rWj9TgDwYN+3V2fA8sUD+BauRXZps5xXfhWoeZpqN3oTZ/gOWybE7rtiM4nVAxhtsO1uhqeJa+TxlO1R3bI8+EhyTLec9h8ClC2y6uj84itTYEvpYbDPkt/dnXkQ6RMR+OChI8RbploE0ThwrEE4JHNaC25Q9khuRYvCA8aY29Wuxz+7P7mm0d8SjsWWN/cynYQuKnIsmKYwN8himj8icZFIlzGMuD9Jiw/u96bht0pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KdUJBmwjU5W2iari+ueVI/TTp3sc1eWteK4je1O4ZtQ=;
 b=KtTIU3KJqfa3LvEBRXBlfnPXkCJvhzsWSdR/kWivutaaDe8lM7jCGOg8b0Ov1YW7IcGKGnatXE6sG8NqIuQT9YCwpM0nO5+ZWLu5JY7TSosnfjkjjmKlRRfNUU6IHANFuDJg3F6tyMkqB0X8Y2kwk107xKK7e3s/gIvLq1SpNw0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by SG2PR04MB5916.apcprd04.prod.outlook.com (2603:1096:4:1db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Mon, 14 Feb
 2022 04:29:28 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03%4]) with mapi id 15.20.4975.018; Mon, 14 Feb 2022
 04:29:27 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 v2 03/10] arch: arm: dts: bletchley: update
 gpio-line-names
Date: Mon, 14 Feb 2022 12:29:05 +0800
Message-Id: <20220214042912.14584-4-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220214042912.14584-1-potin.lai@quantatw.com>
References: <20220214042912.14584-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0136.apcprd02.prod.outlook.com
 (2603:1096:202:16::20) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a83a133-9eaa-458c-f1ce-08d9ef7295b1
X-MS-TrafficTypeDiagnostic: SG2PR04MB5916:EE_
X-Microsoft-Antispam-PRVS: <SG2PR04MB5916A5221C046DE14934B4548E339@SG2PR04MB5916.apcprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:569;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gQkHKVo0wPvWALYRBk0eSowwzEhqup1OVCqJYBm6BvDmzpEhy4dv50Mhj8ZkrYfch86gt7x55UJ/p5Lw2lpLtNW5vJd0XBJ9oGv05BMAh6J1YaAx03PXD94yjhqxMkiR0Emktk3GA/QACgElFyhe0dymc4k9aUPElRxykev8AyUgQNcMFqBVZRszNOAv5n/8vbHiTc5PWPZ1QCLrwKI09e1NZr5S2o+RBN491ArZQ5OT3j+MYS2ahiLZFK7P9DNnO+B9GvEag17idbUIdYbOkAhw47yF6YiCIL2gA9bEltPBqpyvGbHEGFMMaLUlRKTNZBa1IZRS2TAyCrL3RPwkylMfZdWccV6CC59XeyN6BsAi2aC/Zw1mxZP/woAB/MHOnVlRV8dB0x/v96nptOGneKoKMlbyeAC8xe59cWukcnLbcSIT4O4Mgt1kOuKI3P5mVQa9wkuEZGOnh7QdKmUl5mqG7qprZDVV8R91ifBvTrSohk9E7UX+LQNV2pyEmEEE8R3sdtzaI4vwt0wJ8ejY9FrPW4yTvzwhXf7aKvupNSR02la+Oa4ZvwcIpUdsbI82fVWoQA/V/dUq7S5mmqZzW37orK3dfE9v4SB7HdcZFqY7JYJm08t1ztBpZlQ/tvEyY+UOLQlAbbG3Bre6T/K2AM5TAkKlci2/QMmEUEpTJfPQdi3wNPtVRADTWi27gIlNqx0J2AuCPWWQ8w1Rp/Fe3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(36756003)(66946007)(66556008)(15650500001)(8936002)(5660300002)(83380400001)(66476007)(26005)(2616005)(186003)(1076003)(44832011)(4326008)(316002)(86362001)(38100700002)(52116002)(6512007)(508600001)(2906002)(107886003)(38350700002)(6506007)(6666004)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XHDu7cvtBIxkKiSEOpcbPvxmoUWFnaH/lkFro05bxHOsK8eYfzKgRGWZe+OG?=
 =?us-ascii?Q?sCQClOFoLwBTTInjigcJ3Wvw01YXV0DB3vq0BUALScenueVIHjSKBmebmpwf?=
 =?us-ascii?Q?rP/45yi46j4frwtRFavyCD39+TQPG+gNf9Jv8V+Awqnvu0oPdoqrLIVgsY5g?=
 =?us-ascii?Q?XuLw71YPlJrPTFeJku0UZhDfFBfITlzKQt7w2Ao8xPWO0F3uSavwtVbJ6Via?=
 =?us-ascii?Q?sUgubHxBF17kiA5BMtdDVgSaed3b14JeWvj36Am+z5CvrfYsZsAFO60F5/Qk?=
 =?us-ascii?Q?qg+tJJrwamCuFjWBHmX4yBXdr6Cp58XQohx0oUWpN8KDJKmm5y1eA/bs1nnM?=
 =?us-ascii?Q?aeE87vBQ+2WIprOiIjPbh5Yz9vPukYs6D+er+82/s3zYmih4umc2sLx6Pwgz?=
 =?us-ascii?Q?jakSE/V5bFCkh3KNmMpEyY7QXCUvgHBZPuvUH4uqPYxUkz5M4andt762lx0C?=
 =?us-ascii?Q?9YuqyN1I0xn1DVOrNQhH3+nXDIwVifbwVqO56jG9Nr2baZgDmqaSVcyO0gqZ?=
 =?us-ascii?Q?Ge8wYL6L9/ACGgBpBp+ejR4+MwNEziFkoZGRi36spiTgoniDOCjO+dcuXhAg?=
 =?us-ascii?Q?C/uYR0Zkawp15sz/V87lsIhwrEpgKCvDeqQX564n8YKlAZeLAOtH9fgP0r1o?=
 =?us-ascii?Q?VYeKhdxGELlJACwHhlOQDCvp/uax8N7TEz63b8+IMbCDpKOZRuXGZURd0d4K?=
 =?us-ascii?Q?KVQxdfQvbuivLUjxTQOMV8eO+Sey0kPol1bldNwrwYyfJvLpZ/5s0dU/wCbT?=
 =?us-ascii?Q?BTXKXsymj4uhxObiqp0djnOGKoSEgjx01LCPzO4TzWl02C7N94lZroh3Hkq4?=
 =?us-ascii?Q?ggOo/2CU3CMgIHU3SydZFBrW9hggA5ujzLQ08iFWc/tBF70+a5Qzudm/zkeW?=
 =?us-ascii?Q?Vgd/ykiRid355TRxjP1i4K5LhtYopvlYDOCQOBpK9iPORXo4kRzWmSrwr4wG?=
 =?us-ascii?Q?VKmJ/cTkwMk/uvmFrgTT6ktFLzVyQdVW9xmHrpsIFoZvt4LhssJxRrbvov6p?=
 =?us-ascii?Q?CnOFGdfOLqfALxKawt8bpGPibP+4d6c5TG0GmXze3yL/Do41NQiRaWKn9cnS?=
 =?us-ascii?Q?Qg5NdeV2XM1OLqGAmgdr6m7zHKCOMONt4v2hak+hhwhekrKZH/rlM1UcDgfd?=
 =?us-ascii?Q?btZnoNoP1Qhdy89KleEK/JE49nKcbkjb5+oqKBShz6kf4wWZ3BMPwumH7nU7?=
 =?us-ascii?Q?tcqBLNyORAMl38TTTV/pxWnqiiQpLk8TcQ3qqMcxhYjXHRW1N5nNI75a6VLj?=
 =?us-ascii?Q?jhyckHt9dEY+TYbPLikZetxJ6b/PDpZSMTp65cd1bA9dIoxe8et7ikWhqNSM?=
 =?us-ascii?Q?A41TDxU2zeg0eNpGW1c3U37sk/4LDusFhjIT1lHO2VMDJ93GjsvHYyoWpHKu?=
 =?us-ascii?Q?sDGaZFO6n7r9+z8Lf0C3JCxeAgNIffJ8KoBF+Y8uK+3W4VYTP8brAh6UOchP?=
 =?us-ascii?Q?KJZk4jQGvqg2lef1VzRHIjsIy/T+Fxv3l9OvMPcNiXDISQ3LIBb+4MxjVji5?=
 =?us-ascii?Q?6zD5QYXLxkxGRuqyNxqIB2MAvpHsdW5JFuzVbOXRXJp5Dvt8pj5qNVqTtjEa?=
 =?us-ascii?Q?G8+i8N2OZNNOGqIVroYKlBuCIPUBqduQgRkaL8xZHD4slvgewsHQ/n3bmiOC?=
 =?us-ascii?Q?HkTF1D8FsrB57B7MOhK1r2A=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a83a133-9eaa-458c-f1ce-08d9ef7295b1
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 04:29:26.7662 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WYXnqalN0dnWjJbJJec9hO0k9YNdyMIs9AoS6GLftCvvjYpbaBABUm5Ynf8Xr6LB7mbMYrTFGTGlZUrR4Gl+Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB5916
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
Cc: Potin Lai <potin.lai@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

update gpio-line-names based on EVT HW schematic

- gpio0:
  - BSM_FRU_WP (G0, out)
  - PWRGD_P1V05_VDDCORE (G4, in)
  - PWRGD_P1V5_VDD (G5, in)
  - BSM_FLASH_WP_STATUS (I5, in)
  - BMC_TPM_PRES (I6, in)
  - BMC_RTC_INT (L5, in)
  - BMC_HEARTBEAT (P7, out)
  - PWRGD_CNS_PSU (V0, in)
  - PSU_PRSNT (V3, in)
  - BMC_SELF_HW_RST (Y0, out)
  - BSM_PRSNT (Y1, in)

- sled1_led pca9522:
  - SLED1_MD_REF_PWM (3, out)

- sled2_led pca9522:
  - SLED2_MD_REF_PWM (3, out)

- sled3_led pca9522:
  - SLED3_MD_REF_PWM (3, out)

- sled4_led pca9522:
  - SLED4_MD_REF_PWM (3, out)

- sled5_led pca9522:
  - SLED5_MD_REF_PWM (3, out)

- sled6_led pca9522:
  - SLED6_MD_REF_PWM (3, out)

Signed-off-by: Potin Lai <potin.lai@quantatw.com>
---
 .../dts/aspeed-bmc-facebook-bletchley.dts     | 26 ++++++++++---------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
index ebd2430a3bdd..fc0690ccdb0a 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
@@ -270,7 +270,7 @@
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"led-sled1-amber","led-sled1-blue","SLED1_RST_IOEXP","",
+		"led-sled1-amber","led-sled1-blue","SLED1_RST_IOEXP","SLED1_MD_REF_PWM",
 		"","","","",
 		"","","","",
 		"","","","";
@@ -333,7 +333,7 @@
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"led-sled2-amber","led-sled2-blue","SLED2_RST_IOEXP","",
+		"led-sled2-amber","led-sled2-blue","SLED2_RST_IOEXP","SLED2_MD_REF_PWM",
 		"","","","",
 		"","","","",
 		"","","","";
@@ -400,7 +400,7 @@
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"led-sled3-amber","led-sled3-blue","SLED3_RST_IOEXP","",
+		"led-sled3-amber","led-sled3-blue","SLED3_RST_IOEXP","SLED3_MD_REF_PWM",
 		"","","","",
 		"","","","",
 		"","","","";
@@ -463,7 +463,7 @@
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"led-sled4-amber","led-sled4-blue","SLED4_RST_IOEXP","",
+		"led-sled4-amber","led-sled4-blue","SLED4_RST_IOEXP","SLED4_MD_REF_PWM",
 		"","","","",
 		"","","","",
 		"","","","";
@@ -526,7 +526,7 @@
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"led-sled5-amber","led-sled5-blue","SLED5_RST_IOEXP","",
+		"led-sled5-amber","led-sled5-blue","SLED5_RST_IOEXP","SLED5_MD_REF_PWM",
 		"","","","",
 		"","","","",
 		"","","","";
@@ -589,7 +589,7 @@
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"led-sled6-amber","led-sled6-blue","SLED6_RST_IOEXP","",
+		"led-sled6-amber","led-sled6-blue","SLED6_RST_IOEXP","SLED6_MD_REF_PWM",
 		"","","","",
 		"","","","",
 		"","","","";
@@ -727,16 +727,17 @@
 	/*D0-D7*/	"","","","","","","","",
 	/*E0-E7*/	"","","","","","","","",
 	/*F0-F7*/	"","","","","","","","",
-	/*G0-G7*/	"","SWITCH_FRU_MUX","","","","","","",
+	/*G0-G7*/	"BSM_FRU_WP","SWITCH_FRU_MUX","","",
+			"PWRGD_P1V05_VDDCORE","PWRGD_P1V5_VDD","","",
 	/*H0-H7*/	"presence-riser1","presence-riser2",
 			"presence-sled1","presence-sled2",
 			"presence-sled3","presence-sled4",
 			"presence-sled5","presence-sled6",
 	/*I0-I7*/	"REV_ID0","","REV_ID1","REV_ID2",
-			"","","","",
+			"","BSM_FLASH_WP_STATUS","BMC_TPM_PRES","",
 	/*J0-J7*/	"","","","","","","","",
 	/*K0-K7*/	"","","","","","","","",
-	/*L0-L7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","","","BMC_RTC_INT","","",
 	/*M0-M7*/	"ALERT_SLED1","ALERT_SLED2",
 			"ALERT_SLED3","ALERT_SLED4",
 			"ALERT_SLED5","ALERT_SLED6",
@@ -744,19 +745,20 @@
 	/*N0-N7*/	"","","","","","","","",
 	/*O0-O7*/	"","","","",
 			"","BOARD_ID0","BOARD_ID1","BOARD_ID2",
-	/*P0-P7*/	"","","","","","","","",
+	/*P0-P7*/	"","","","","","","","BMC_HEARTBEAT",
 	/*Q0-Q7*/	"","","","","","","","",
 	/*R0-R7*/	"","","","","","","","",
 	/*S0-S7*/	"","","","BAT_DETECT",
 			"BMC_BT_WP0","BMC_BT_WP1","","",
 	/*T0-T7*/	"","","","","","","","",
 	/*U0-U7*/	"","","","","","","","",
-	/*V0-V7*/	"","RST_BMC_MVL","","",
+	/*V0-V7*/	"PWRGD_CNS_PSU","RST_BMC_MVL","","PSU_PRSNT",
 			"USB2_SEL0_A","USB2_SEL1_A",
 			"USB2_SEL0_B","USB2_SEL1_B",
 	/*W0-W7*/	"RST_FRONT_IOEXP","","","","","","","",
 	/*X0-X7*/	"","","","","","","","",
-	/*Y0-Y7*/	"","","BSM_FLASH_LATCH","","","","","",
+	/*Y0-Y7*/	"BMC_SELF_HW_RST","BSM_PRSNT","BSM_FLASH_LATCH","",
+			"","","","",
 	/*Z0-Z7*/	"","","","","","","","";
 };
 
-- 
2.17.1

