Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7374B40DA
	for <lists+openbmc@lfdr.de>; Mon, 14 Feb 2022 05:30:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jxrr437ppz3bZp
	for <lists+openbmc@lfdr.de>; Mon, 14 Feb 2022 15:30:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=DLcUmA7W;
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
 header.s=selector2-quantacorp-onmicrosoft-com header.b=DLcUmA7W; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20702.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::702])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jxrpx5vBRz2x9b
 for <openbmc@lists.ozlabs.org>; Mon, 14 Feb 2022 15:29:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXvdm43Af1K+cwoBnle/uyUo00MeKXjn5jzKkNA9WbfNPz++k4vQWdgpm/oB+7IYn62zgGmx7Dtpw+Jqr5DDJaaNcAvMPTDat4tID3f10I2/yuwIxh/XdocE3iT8WANRLIQm8ggCJI9j8dwNBCkQ0nkLpvJ/9zShrZj/45UIhm75VMkaAJhdxgASrNaUthYc+pD/wkAd8lRIy18T0Uzp5zd0zo37JigqbWRvgFmMEoL+ifNPoLKvuCtijPkeSR+cAwmVWrUBV63YiUBim4A2gFs2UWbYHzNXHFdoOGDPz9haz01+3zE1/LD06UhTJFDodWrffPJMs6/Dxf0gxMpaTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hMP2YqBHAlWOGkvGdU94kNAJu/iajJTp9mhP6z85si4=;
 b=WuTOGajpXqwbv919pCV1bA/fFukHVOo8AVo8M70OCEvb1osZs3XQfyUO3Z+lID72njiLUB8ruo9JWI/5Fyhdse5Oa33pKwlWqr87cQ0R7HtPKScPb6wN/yAido048DUe3swy1x+Ys6GKj+xTRa3gduhTRW9NTy3XJhtWkVZ0J5RswoInd+MdsOzZgJoCNovUoFlqO85AfJi2pZyyE7/qFmXK1t+Tv/NUtPdTDz8t9vrdP4Qn20/dxTaFMAXmLKC6UknztrZ/Y2ZJDpA8ekwJc9QMtCy3Ky+zYLOY9bRY31aWPuaAFm3V5M4xyOI1MfU4V5VeAtSGUwrJeDcvM+ZFUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hMP2YqBHAlWOGkvGdU94kNAJu/iajJTp9mhP6z85si4=;
 b=DLcUmA7WdGWN/Epil3EMzl9x+IAKSDoCd26HOxVxlhfWhn5iXVjfnFgFsMvq6k7WgjeUfZXy7hXnxYhov+Kf6BpbSCzZmoQ0hVClFE8GiNJNDvgXDT9hqbP2wrVpQey4cIactH7hPu8gShV4yfWLGRroi8r4WPQV71PIuBH7rWw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by SG2PR04MB5916.apcprd04.prod.outlook.com (2603:1096:4:1db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Mon, 14 Feb
 2022 04:29:26 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03%4]) with mapi id 15.20.4975.018; Mon, 14 Feb 2022
 04:29:25 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 v2 01/10] arch: arm: dts: bletchley: switch
 sled numbering to 1-based
Date: Mon, 14 Feb 2022 12:29:03 +0800
Message-Id: <20220214042912.14584-2-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220214042912.14584-1-potin.lai@quantatw.com>
References: <20220214042912.14584-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0136.apcprd02.prod.outlook.com
 (2603:1096:202:16::20) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8c03607-c4b4-4c20-886b-08d9ef7294e2
X-MS-TrafficTypeDiagnostic: SG2PR04MB5916:EE_
X-Microsoft-Antispam-PRVS: <SG2PR04MB5916C2B6F5BDF1728A41AE008E339@SG2PR04MB5916.apcprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:418;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ud7nFvp2sUf6KsR0m5BohuIBNuoegLKrA9+wmJpzXJOl/Dn1psG0qATVzVHf3Zg7VAhiJHVf/haXEpOsSEudsD7uzo6JgpO4kBXllMldsHUY/8XO2A56/dPBEmHNUzghpFtZhvjGcWe/GqQHPlavevqqgqx+2RRN6M42McWiOB6VEnKa2HKbnSd0nChQZtiesMwMt3OzaRjhYLg0ruo32XhgBx3o8ix9gfPB2836kUH9rrzao2XctAI8zN0YdNULTgNgmQuZ6DkIEpo5J2nDMpwDBvZBpyvm4Muq6jBCNmbxJM+RiVBU1YTft8WKGavKAMNKRDRVmRfPpppOkBOmqj39OrU5B6G261hmL+sBpQXdib2ff43ZCI9BVhrxcCKCxXWM2ImP8pnSH4Ax+qqC8dmoJSp3Y3rV50S8TBBs74oiAqdsci7w88JuTic++9+3aeSp/Qwk31GhLm4huf9gGZMTWV0J7xHgJ1I0LQ6VnhckpDnIZfMQMfD1qYBChX3aMsoxNOfwoLumRV1pqk7d9y1EvUVL5Fp7l5vRkw7AiKvbxGxgugRf+cZS8cwp8eJSyI4EDyrURM6khmxtRFyhDOw76kfO/cTuuTW1MK5qoEU8pbiEM5heIxM+Sjz3tEDLCtCLPPjesO0J42ziXmNAEzacTgFmZtxsvUh+x3TA0qJGtpnUBsdUnPsCNa03jenSSysBNfkDqUjjnfguGIUxKA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(36756003)(66946007)(66556008)(8936002)(5660300002)(83380400001)(66476007)(26005)(2616005)(186003)(1076003)(44832011)(4326008)(316002)(86362001)(38100700002)(52116002)(6512007)(508600001)(2906002)(107886003)(38350700002)(6506007)(6666004)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8GHGVOIgGOmGNZ9QjwaGzoQe2XutpCpUpZivM4u6T/Bk/Owzp9bxdabGOTi5?=
 =?us-ascii?Q?YFhWS61+W5wKj3nRaf/CVmXdGtMPE+wPmYOwdyhqtLioEDxOxh/8+ocmgtIF?=
 =?us-ascii?Q?3YM8t+piLLrdJ1xG086UKFCUIsrUG3A6w177Txp2hp+wLlc12/4zKiubpEqA?=
 =?us-ascii?Q?2F4NNYeulZUogmQpCdMSe0iNj3WhnYvt6uvHQneelasIrcQ6f5FtUB0zLyQ4?=
 =?us-ascii?Q?SSb7xu53ViYswkNkXP1zElzO5F3OyKGYH4gW5JFSvJYwQfpSY8owBO/CkcGV?=
 =?us-ascii?Q?6+oilfNcWXNalRKV4PmHSxlsa5l5pHgL1TNSbsjI4CONzC2d1Osp2cnzBO/Q?=
 =?us-ascii?Q?oQA5T5kRDOOF35gxYCleoLzA382fW9IULDRgU6319UmXVEoG63iaZUMRw8p9?=
 =?us-ascii?Q?vQadl63F0v9BjYQ355vVAqxic/Li7dJWcixFubZHXNFaGrv2FYuthefCfc4u?=
 =?us-ascii?Q?G7ccHMHtwy+bLi8f6lYbDX85yz16wbd+8+JnG6HnW807NAGcrgOQzpWeRi+v?=
 =?us-ascii?Q?ABbBDXkWe2p+EEQ6t1S6/XsbWPSM1Yh7LtEfvOKlaC3A78H9ozB8t4uC0XS8?=
 =?us-ascii?Q?y3R6dvaIXEuyk5EcziESTay+QxQSxBTbnvXR9ROu3kwbANZ55H1oi0vexkjP?=
 =?us-ascii?Q?rM6M1lsmWSITYzTYQ3aJE2vfXRHf0GuQ8eaAHa1yIIpdbsw+2nz7gdbvlmUd?=
 =?us-ascii?Q?kMJl7jU4SEtFwwW+bfcrdk4ocdCzGjADslRDoWWqsOujyWb/ZL7CjJvl8GBo?=
 =?us-ascii?Q?qyhzoC585aFqwG8lMWa1JdT41uJs+uZzJR2emrHQ9Q89yqAAPO//fHoIas1z?=
 =?us-ascii?Q?2yP/f4Fd1UVz2G5H7alms5rsbs8SvxfcaitaUldJKa4X/6R2OUIENzERG+AJ?=
 =?us-ascii?Q?Rh9GDT6Vy07FDy97QoQsUgDO4r/ZGlWOLq+2Mm6XldhoultmTUmrQN9pEfBc?=
 =?us-ascii?Q?1tSsUD9/ngXm+CXRlS6ig4JuSzmbo+ewT12sDrhpfz6DkdhdyQ0e8HYkYfp8?=
 =?us-ascii?Q?cbhPMWFoYfJbx3gTsPEyfGYASMXRXOz3hzI9ZWQaRp2vY2LQdv7ueyzVGfOQ?=
 =?us-ascii?Q?4IRTElqWKRSulF9rvJG2va/3eaav4v97Hk7az4ti2K7ycujy+usLPKcy7WMe?=
 =?us-ascii?Q?yFcMVX826Y5z76GunrhNnN9zwWtoDw62a7W220YERyi8XPxFv3LxXLQ3Zf3s?=
 =?us-ascii?Q?+k5fZ2Z2KjKIu+835q950oeWoubSkNgmIBVlS5Xkc5lLLFI2IQc9RC3R/wmS?=
 =?us-ascii?Q?govz+bCmZaIarAkiZl8ydl/i5fQzW3qwT5pwIPAW+ixQ3oPi7ycd3wumpiJm?=
 =?us-ascii?Q?D/q1LeoNgTbqUCc6ob2g1isNC8A61QKr8xvEcIgrIZaaUkdvYaj1d1qAjwcA?=
 =?us-ascii?Q?XU7xSj1VnU2mHUpKoY+hpZdnkYsDDJSjf3p8meE8Tmdc8pIjYxlpuN4PdrDc?=
 =?us-ascii?Q?Rvm3uJUM+v7PAWQOrdGw8E/mOC8vhEz5cEjYxBhvVGKkzQAZvrklRZ29gJqj?=
 =?us-ascii?Q?B+BlN8WZYEBYbNZuAjfc2GIq1RQaiVO99NiS0xGI1ccEp2NX9S41MDmwXK0L?=
 =?us-ascii?Q?5uQoq/z30NZ2NdgXnieUIjpY14hPYKLYpRmSRpJ39ZYBeVZqHYjVO+dfY+Hr?=
 =?us-ascii?Q?X+wh/Rw20WnjH8iqh+BKduc=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8c03607-c4b4-4c20-886b-08d9ef7294e2
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 04:29:25.7663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w4TqdEekCD3CgKlYFJ2MF2psBNSM2WLG/XUjZy+ZiwggCP+Ebk5gALfHcB2z3Qhytl0EMSWc/4a1n9QVX5IHTw==
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

Switch sled to 1-based to meet OpenBMC multi-host numbering rule

Signed-off-by: Potin Lai <potin.lai@quantatw.com>
---
 .../dts/aspeed-bmc-facebook-bletchley.dts     | 128 +++++++++---------
 1 file changed, 64 insertions(+), 64 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
index f973ea883b97..e77736ed5c4c 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
@@ -101,16 +101,6 @@
 			default-state = "off";
 			gpios = <&fan_ioexp 15 GPIO_ACTIVE_HIGH>;
 		};
-		sled0_amber {
-			retain-state-shutdown;
-			default-state = "off";
-			gpios = <&sled0_leds 0 GPIO_ACTIVE_LOW>;
-		};
-		sled0_blue {
-			retain-state-shutdown;
-			default-state = "off";
-			gpios = <&sled0_leds 1 GPIO_ACTIVE_LOW>;
-		};
 		sled1_amber {
 			retain-state-shutdown;
 			default-state = "off";
@@ -161,6 +151,16 @@
 			default-state = "off";
 			gpios = <&sled5_leds 1 GPIO_ACTIVE_LOW>;
 		};
+		sled6_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&sled6_leds 0 GPIO_ACTIVE_LOW>;
+		};
+		sled6_blue {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&sled6_leds 1 GPIO_ACTIVE_LOW>;
+		};
 	};
 };
 
@@ -219,7 +219,7 @@
 		reg = <0x4f>;
 	};
 
-	sled0_ioexp: pca9539@76 {
+	sled1_ioexp: pca9539@76 {
 		compatible = "nxp,pca9539";
 		reg = <0x76>;
 		#address-cells = <1>;
@@ -228,13 +228,13 @@
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"SLED0_MS_DETECT1","SLED0_VBUS_BMC_EN","SLED0_INA230_ALERT","SLED0_P12V_STBY_ALERT",
-		"SLED0_SSD_ALERT","SLED0_MS_DETECT0","SLED0_RST_CCG5","SLED0_FUSB302_INT",
-		"SLED0_MD_STBY_RESET","SLED0_MD_IOEXP_EN_FAULT","SLED0_MD_DIR","SLED0_MD_DECAY",
-		"SLED0_MD_MODE1","SLED0_MD_MODE2","SLED0_MD_MODE3","power-host0";
+		"SLED1_MS_DETECT1","SLED1_VBUS_BMC_EN","SLED1_INA230_ALERT","SLED1_P12V_STBY_ALERT",
+		"SLED1_SSD_ALERT","SLED1_MS_DETECT0","SLED1_RST_CCG5","SLED1_FUSB302_INT",
+		"SLED1_MD_STBY_RESET","SLED1_MD_IOEXP_EN_FAULT","SLED1_MD_DIR","SLED1_MD_DECAY",
+		"SLED1_MD_MODE1","SLED1_MD_MODE2","SLED1_MD_MODE3","power-host1";
 	};
 
-	sled0_leds: pca9552@67 {
+	sled1_leds: pca9552@67 {
 		compatible = "nxp,pca9552";
 		reg = <0x67>;
 		#address-cells = <1>;
@@ -243,13 +243,13 @@
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"led-sled0-amber","led-sled0-blue","SLED0_RST_IOEXP","",
+		"led-sled1-amber","led-sled1-blue","SLED1_RST_IOEXP","",
 		"","","","",
 		"","","","",
 		"","","","";
 	};
 
-	sled0_fusb302: typec-portc@22 {
+	sled1_fusb302: typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
@@ -282,7 +282,7 @@
 		reg = <0x4f>;
 	};
 
-	sled1_ioexp: pca9539@76 {
+	sled2_ioexp: pca9539@76 {
 		compatible = "nxp,pca9539";
 		reg = <0x76>;
 		#address-cells = <1>;
@@ -291,13 +291,13 @@
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"SLED1_MS_DETECT1","SLED1_VBUS_BMC_EN","SLED1_INA230_ALERT","SLED1_P12V_STBY_ALERT",
-		"SLED1_SSD_ALERT","SLED1_MS_DETECT0","SLED1_RST_CCG5","SLED1_FUSB302_INT",
-		"SLED1_MD_STBY_RESET","SLED1_MD_IOEXP_EN_FAULT","SLED1_MD_DIR","SLED1_MD_DECAY",
-		"SLED1_MD_MODE1","SLED1_MD_MODE2","SLED1_MD_MODE3","power-host1";
+		"SLED2_MS_DETECT1","SLED2_VBUS_BMC_EN","SLED2_INA230_ALERT","SLED2_P12V_STBY_ALERT",
+		"SLED2_SSD_ALERT","SLED2_MS_DETECT0","SLED2_RST_CCG5","SLED2_FUSB302_INT",
+		"SLED2_MD_STBY_RESET","SLED2_MD_IOEXP_EN_FAULT","SLED2_MD_DIR","SLED2_MD_DECAY",
+		"SLED2_MD_MODE1","SLED2_MD_MODE2","SLED2_MD_MODE3","power-host2";
 	};
 
-	sled1_leds: pca9552@67 {
+	sled2_leds: pca9552@67 {
 		compatible = "nxp,pca9552";
 		reg = <0x67>;
 		#address-cells = <1>;
@@ -306,13 +306,13 @@
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"led-sled1-amber","led-sled1-blue","SLED1_RST_IOEXP","",
+		"led-sled2-amber","led-sled2-blue","SLED2_RST_IOEXP","",
 		"","","","",
 		"","","","",
 		"","","","";
 	};
 
-	sled1_fusb302: typec-portc@22 {
+	sled2_fusb302: typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
@@ -349,7 +349,7 @@
 		reg = <0x4f>;
 	};
 
-	sled2_ioexp: pca9539@76 {
+	sled3_ioexp: pca9539@76 {
 		compatible = "nxp,pca9539";
 		reg = <0x76>;
 		#address-cells = <1>;
@@ -358,13 +358,13 @@
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"SLED2_MS_DETECT1","SLED2_VBUS_BMC_EN","SLED2_INA230_ALERT","SLED2_P12V_STBY_ALERT",
-		"SLED2_SSD_ALERT","SLED2_MS_DETECT0","SLED2_RST_CCG5","SLED2_FUSB302_INT",
-		"SLED2_MD_STBY_RESET","SLED2_MD_IOEXP_EN_FAULT","SLED2_MD_DIR","SLED2_MD_DECAY",
-		"SLED2_MD_MODE1","SLED2_MD_MODE2","SLED2_MD_MODE3","power-host2";
+		"SLED3_MS_DETECT1","SLED3_VBUS_BMC_EN","SLED3_INA230_ALERT","SLED3_P12V_STBY_ALERT",
+		"SLED3_SSD_ALERT","SLED3_MS_DETECT0","SLED3_RST_CCG5","SLED3_FUSB302_INT",
+		"SLED3_MD_STBY_RESET","SLED3_MD_IOEXP_EN_FAULT","SLED3_MD_DIR","SLED3_MD_DECAY",
+		"SLED3_MD_MODE1","SLED3_MD_MODE2","SLED3_MD_MODE3","power-host3";
 	};
 
-	sled2_leds: pca9552@67 {
+	sled3_leds: pca9552@67 {
 		compatible = "nxp,pca9552";
 		reg = <0x67>;
 		#address-cells = <1>;
@@ -373,13 +373,13 @@
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"led-sled2-amber","led-sled2-blue","SLED2_RST_IOEXP","",
+		"led-sled3-amber","led-sled3-blue","SLED3_RST_IOEXP","",
 		"","","","",
 		"","","","",
 		"","","","";
 	};
 
-	sled2_fusb302: typec-portc@22 {
+	sled3_fusb302: typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
@@ -412,7 +412,7 @@
 		reg = <0x4f>;
 	};
 
-	sled3_ioexp: pca9539@76 {
+	sled4_ioexp: pca9539@76 {
 		compatible = "nxp,pca9539";
 		reg = <0x76>;
 		#address-cells = <1>;
@@ -421,13 +421,13 @@
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"SLED3_MS_DETECT1","SLED3_VBUS_BMC_EN","SLED3_INA230_ALERT","SLED3_P12V_STBY_ALERT",
-		"SLED3_SSD_ALERT","SLED3_MS_DETECT0","SLED3_RST_CCG5","SLED3_FUSB302_INT",
-		"SLED3_MD_STBY_RESET","SLED3_MD_IOEXP_EN_FAULT","SLED3_MD_DIR","SLED3_MD_DECAY",
-		"SLED3_MD_MODE1","SLED3_MD_MODE2","SLED3_MD_MODE3","power-host3";
+		"SLED4_MS_DETECT1","SLED4_VBUS_BMC_EN","SLED4_INA230_ALERT","SLED4_P12V_STBY_ALERT",
+		"SLED4_SSD_ALERT","SLED4_MS_DETECT0","SLED4_RST_CCG5","SLED4_FUSB302_INT",
+		"SLED4_MD_STBY_RESET","SLED4_MD_IOEXP_EN_FAULT","SLED4_MD_DIR","SLED4_MD_DECAY",
+		"SLED4_MD_MODE1","SLED4_MD_MODE2","SLED4_MD_MODE3","power-host4";
 	};
 
-	sled3_leds: pca9552@67 {
+	sled4_leds: pca9552@67 {
 		compatible = "nxp,pca9552";
 		reg = <0x67>;
 		#address-cells = <1>;
@@ -436,13 +436,13 @@
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"led-sled3-amber","led-sled3-blue","SLED3_RST_IOEXP","",
+		"led-sled4-amber","led-sled4-blue","SLED4_RST_IOEXP","",
 		"","","","",
 		"","","","",
 		"","","","";
 	};
 
-	sled3_fusb302: typec-portc@22 {
+	sled4_fusb302: typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
@@ -475,7 +475,7 @@
 		reg = <0x4f>;
 	};
 
-	sled4_ioexp: pca9539@76 {
+	sled5_ioexp: pca9539@76 {
 		compatible = "nxp,pca9539";
 		reg = <0x76>;
 		#address-cells = <1>;
@@ -484,13 +484,13 @@
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"SLED4_MS_DETECT1","SLED4_VBUS_BMC_EN","SLED4_INA230_ALERT","SLED4_P12V_STBY_ALERT",
-		"SLED4_SSD_ALERT","SLED4_MS_DETECT0","SLED4_RST_CCG5","SLED4_FUSB302_INT",
-		"SLED4_MD_STBY_RESET","SLED4_MD_IOEXP_EN_FAULT","SLED4_MD_DIR","SLED4_MD_DECAY",
-		"SLED4_MD_MODE1","SLED4_MD_MODE2","SLED4_MD_MODE3","power-host4";
+		"SLED5_MS_DETECT1","SLED5_VBUS_BMC_EN","SLED5_INA230_ALERT","SLED5_P12V_STBY_ALERT",
+		"SLED5_SSD_ALERT","SLED5_MS_DETECT0","SLED5_RST_CCG5","SLED5_FUSB302_INT",
+		"SLED5_MD_STBY_RESET","SLED5_MD_IOEXP_EN_FAULT","SLED5_MD_DIR","SLED5_MD_DECAY",
+		"SLED5_MD_MODE1","SLED5_MD_MODE2","SLED5_MD_MODE3","power-host5";
 	};
 
-	sled4_leds: pca9552@67 {
+	sled5_leds: pca9552@67 {
 		compatible = "nxp,pca9552";
 		reg = <0x67>;
 		#address-cells = <1>;
@@ -499,13 +499,13 @@
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"led-sled4-amber","led-sled4-blue","SLED4_RST_IOEXP","",
+		"led-sled5-amber","led-sled5-blue","SLED5_RST_IOEXP","",
 		"","","","",
 		"","","","",
 		"","","","";
 	};
 
-	sled4_fusb302: typec-portc@22 {
+	sled5_fusb302: typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
@@ -538,7 +538,7 @@
 		reg = <0x4f>;
 	};
 
-	sled5_ioexp: pca9539@76 {
+	sled6_ioexp: pca9539@76 {
 		compatible = "nxp,pca9539";
 		reg = <0x76>;
 		#address-cells = <1>;
@@ -547,13 +547,13 @@
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"SLED5_MS_DETECT1","SLED5_VBUS_BMC_EN","SLED5_INA230_ALERT","SLED5_P12V_STBY_ALERT",
-		"SLED5_SSD_ALERT","SLED5_MS_DETECT0","SLED5_RST_CCG5","SLED5_FUSB302_INT",
-		"SLED5_MD_STBY_RESET","SLED5_MD_IOEXP_EN_FAULT","SLED5_MD_DIR","SLED5_MD_DECAY",
-		"SLED5_MD_MODE1","SLED5_MD_MODE2","SLED5_MD_MODE3","power-host5";
+		"SLED6_MS_DETECT1","SLED6_VBUS_BMC_EN","SLED6_INA230_ALERT","SLED6_P12V_STBY_ALERT",
+		"SLED6_SSD_ALERT","SLED6_MS_DETECT0","SLED6_RST_CCG5","SLED6_FUSB302_INT",
+		"SLED6_MD_STBY_RESET","SLED6_MD_IOEXP_EN_FAULT","SLED6_MD_DIR","SLED6_MD_DECAY",
+		"SLED6_MD_MODE1","SLED6_MD_MODE2","SLED6_MD_MODE3","power-host6";
 	};
 
-	sled5_leds: pca9552@67 {
+	sled6_leds: pca9552@67 {
 		compatible = "nxp,pca9552";
 		reg = <0x67>;
 		#address-cells = <1>;
@@ -562,13 +562,13 @@
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"led-sled5-amber","led-sled5-blue","SLED5_RST_IOEXP","",
+		"led-sled6-amber","led-sled6-blue","SLED6_RST_IOEXP","",
 		"","","","",
 		"","","","",
 		"","","","";
 	};
 
-	sled5_fusb302: typec-portc@22 {
+	sled6_fusb302: typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
@@ -702,17 +702,17 @@
 	/*F0-F7*/	"","","","","","","","",
 	/*G0-G7*/	"","SWITCH_FRU_MUX","","","","","","",
 	/*H0-H7*/	"presence-riser1","presence-riser2",
-			"presence-sled0","presence-sled1",
-			"presence-sled2","presence-sled3",
-			"presence-sled4","presence-sled5",
+			"presence-sled1","presence-sled2",
+			"presence-sled3","presence-sled4",
+			"presence-sled5","presence-sled6",
 	/*I0-I7*/	"REV_ID0","","REV_ID1","REV_ID2",
 			"","","","",
 	/*J0-J7*/	"","","","","","","","",
 	/*K0-K7*/	"","","","","","","","",
 	/*L0-L7*/	"","","","","","","","",
-	/*M0-M7*/	"ALERT_SLED0","ALERT_SLED1",
-			"ALERT_SLED2","ALERT_SLED3",
-			"ALERT_SLED4","ALERT_SLED5",
+	/*M0-M7*/	"ALERT_SLED1","ALERT_SLED2",
+			"ALERT_SLED3","ALERT_SLED4",
+			"ALERT_SLED5","ALERT_SLED6",
 			"P12V_AUX_ALERT1","",
 	/*N0-N7*/	"","","","","","","","",
 	/*O0-O7*/	"","","","",
-- 
2.17.1

