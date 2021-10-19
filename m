Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 442EE432E13
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 08:20:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYNsg691mz2ywS
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 17:20:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=FhTi6cIV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.244.137;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=FhTi6cIV; 
 dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2137.outbound.protection.outlook.com [40.107.244.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYNq926ZNz2yqC;
 Tue, 19 Oct 2021 17:18:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JAiWZ0NjckaArmmnPE2FdxofdmYAWgBVDq58RDEnYGRywnUU3fjTzhiMOJhny3wVtw3yJTKVSrzct9gdzQP6FEQMFQPHOTtbYU462hSlZiNlKSS+q4u/DId4XeI3Vfwcfm5QhqGGX60rvPFGkpYZqjmZLSEtUNxpUeRCLRHKMmrIsXcFM+EnFpHv+cYOu8CLhSeOootTRJi8cngHvWWpcoNEV5RmvWJOaiqG7ZxEk5xdw/f1zdPA+GmSzr4WU+zc/UhUioX3Jw/5VoDbSJj/o8Q8DhCnqQBxAC/UH4ZfEk86dKGAN8LJvWm5E2Xm/PWyOfmtytwxOIGeU4IZPSl9Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2QPG54lbIU+wazX7K1TYrfVbDdH3f10oUSnKPcNHGD8=;
 b=aW1O5+Dqvkpjtk85tPjxqG1HL0DSzyH3Z2n5ddBRgm1PsSum94lTCzss9LnLFPwJqk7VI+pZHBPwFLiNlh/WOD8xwJrEak++q9Q4AlWXTrx3RIs7+SlqJ0yLcr2oksLRd5SCAlRqmXIb0mpZTmH5gHe+DdZCwJBLNb+65p2wDv1N/PRp1w+r+HXg526Sy9YweaBpIfmyiwVDCuRcFRyJx26MxpkJhBUSCLqYS6EjqtTYjV3wZsiR4I8gSNKEXzYe9MvtYK36H8logojNRdWqvULbpbrkDIRceDUD7BG7/+QT+9kCYuw7A5kN8hR4F93y43+1X1436/0Uih47zXUUWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2QPG54lbIU+wazX7K1TYrfVbDdH3f10oUSnKPcNHGD8=;
 b=FhTi6cIVgC6DG6geM1+yUJ2pHa4OqhtVxxMkXjzxh/X39boZGaI39ElpBxI+bCV7fcq6R0FWZhiYYP6lW8iQx56VfztmbTnqVKVxNyWpwDIwU7YQkP/D+8xv4+NfOfvF+/sVxoL3hlxMoc+D9JM3rQsyR7NUq8FidWC80fJQB0I=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BYAPR01MB5062.prod.exchangelabs.com (2603:10b6:a03:7f::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.17; Tue, 19 Oct 2021 06:02:21 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::f14d:21a9:9ebf:2924]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::f14d:21a9:9ebf:2924%9]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 06:02:21 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: [PATCH v2 2/3] ARM: dts: aspeed: mtjade: Add I2C buses for NVMe
 devices
Date: Tue, 19 Oct 2021 13:01:54 +0700
Message-Id: <20211019060155.945-3-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20211019060155.945-1-quan@os.amperecomputing.com>
References: <20211019060155.945-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK0PR01CA0059.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::23) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by
 HK0PR01CA0059.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18 via Frontend
 Transport; Tue, 19 Oct 2021 06:02:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99e70cb5-d46b-45d4-b7c8-08d992c6039c
X-MS-TrafficTypeDiagnostic: BYAPR01MB5062:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR01MB5062B7DE4533FC3BA7F8D318F2BD9@BYAPR01MB5062.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:207;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LzvcrzRXZ7iBerG4CJhtfm5tHkeFRfp2VS9YpcqRFCX/s00TqLQQwlbI7LEEKx6NuHLlCsga5Y5EeUKo3CbnzrrjOSfqOTSIo/IoWrEzMkN1PMzfJtsNBQ3GOgLsgQQzsjnEIEgmBMpJCTKcVcLO66I6isw6ww3ukyazXoIR8GWx9kNsaWNYgE6I0/gUl0EI5VDbvI3czlR9wjwwPPgUAExtxMLuxjcQl6llwTiFL3at4vPXR1z3XEe2fc31T99mi2gGgMhKJHqluaGfap/EaTqaOyVNFy4vo+sQRYux/At3ucd/hUCT7MdXFSds1z3BmGoM8ep/isYeIpHlw5OJOLSivfezPgNi3YgqrWGgmBLR8bvbQXF5P0RUCwzZz8JYYFeM8UOMRynsLdMeNY9QdYqkBAkRt1A/WOWfY1WbtuqwYL4Nro/a3icaKIMwNZSJZRkOKyqHAwUvWoKmsn2w3BUCzdkPxqg+t93eZ+7GppvjvgIU8kdl1Agj5V2G1tSJeAACh0nBqd3572CgRyRSZOBOZgUH1qR0sBnyiYqHmJ0rQAE9xLJkzcvlOAG+F5aqbegLuNtDWUwfPd0UEKEnSJSiigtpxi7lot1Y43RrGaEkNPVvZpVCxxUI9zTJC0RUxHHDM1ARaJvml/+cG5oZq/aIbOo6+e/VVO1ID9tFG95g5+lz0Bg4y6w6xZGUVPyQFqjM7egjqKz/c3/5QecRZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(6512007)(110136005)(956004)(2616005)(508600001)(66946007)(5660300002)(107886003)(66556008)(6666004)(316002)(8936002)(2906002)(52116002)(38350700002)(6506007)(38100700002)(86362001)(6486002)(8676002)(186003)(66476007)(4326008)(1076003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JHFrZ1q9phwQ4V/Dgg+E9l6x2DqaHc6fqvYOc7i1/LcMzwKow2gbT/HoGGfQ?=
 =?us-ascii?Q?TyoUPKTwv72DMraZfLa3H5F/mSu3cUlMqUEMdSVoDwU2VwarhVBHfLMGGTg7?=
 =?us-ascii?Q?LQqPTtuQIoBHwZlTDmh3TRaD1AM4g/ataztABzi7M6SZvVv7w0/su/aY4yn6?=
 =?us-ascii?Q?PMHhsynJpZlNucKQaf84kbY7OoPB3jzLnFV310w+I6eUB7QVxWtJRO4V34wH?=
 =?us-ascii?Q?1VWzgifgJ7xgFs6pFIoBKDxMZ0UzHioq/HlQv/ssOd37Nx4a83WUrFjNJSu7?=
 =?us-ascii?Q?ztPJ8tIMBvS45jhefxE5BMgWVcfdf+jB0aEr7ireivGLJ4nTApQUPzr5HRFk?=
 =?us-ascii?Q?Dyk+PGL4Qqm8BBUz1iTUtdqHtmk/7yDCpmetFjfJu99BHYI4sMP4mQWLSxkK?=
 =?us-ascii?Q?wYhyO8lxxBHvEB/Wsuq0JZTUYC5dPKBHzt38eOuN5JQZj2y0CijSbUKlNa31?=
 =?us-ascii?Q?YUB6HouHGr9zkADJG8KymKW1vClq2c5/10Uk75U4a8b0xsHuABMFbA2d13P3?=
 =?us-ascii?Q?gQrQ9EMx7lyUM3io8vqtcv8gkTbbyRFqiKZ/Ywm8C2WxFnjyA8R/Mz6KNMFU?=
 =?us-ascii?Q?7NzJb/WTZWS5xBEbaYzu4vbTuIVxzbXqpa/oysbxkUYoD2uFmpFCRrhDQAfl?=
 =?us-ascii?Q?dacAh+KNgAxuW0MLQn093mha3+gRMlDp89D5cmBkMIDsWE8FNrvxmoLpH4+C?=
 =?us-ascii?Q?+LhUcXROPRddoft+0tf2XPFT0seocDpN9T1v4nM7avjAHOgMyOOFyJHXXst+?=
 =?us-ascii?Q?IaZGuzitYVLQMLAvmDUOz4R793Fn3Kk3Z1aSANy8qEmXKXsvXd1S0Rf5FL1f?=
 =?us-ascii?Q?Clf7ymgc12jXrtZ75+G31w1y2VnRpTLndq2WdRWA/ebD7STh1L8lkoL3d1ww?=
 =?us-ascii?Q?+eKIH1KqkJE+l+zdpjoa9TL9GYMos6+HIUYTu+1Hmcuf3ekHhRD6tGAEay6Y?=
 =?us-ascii?Q?15TmsBiMVNS6K4f9hNLFsfKVJYeyvels28fCTbwJeHLW3XNQ/esJF8Gv5KX9?=
 =?us-ascii?Q?tx4pOpgHDBXaAiRggQSbRAQH/h02zU4YSJlaKmcErwECyFjqSUJtYfh/rb9e?=
 =?us-ascii?Q?WWPkzcUvcheSTrJD8zo/F5Y8nkJkruL4vW8UN00ueWwTGftqvetwOcixRwo5?=
 =?us-ascii?Q?EQEfwkCC9+JnsMrS4YMa5W2A+HgXgweb6fmnK+T426EH+rKhv8GYbbv688aO?=
 =?us-ascii?Q?6lrSq/mJMbi08AWCiYAmrQrJZ1gm1+UTdOzmRDFIRN9vK46YGrPtJJOPYPDY?=
 =?us-ascii?Q?nWhObboFQqL9gdvQgscBKra7bF2AyMnR81jx+I84T/5xdnDBsTTGi6k5LSVR?=
 =?us-ascii?Q?IK2Qtedb4lF6Jr76KgI0+tDW?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99e70cb5-d46b-45d4-b7c8-08d992c6039c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 06:02:21.4046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qnbAnFFf2G2Dzdm7/N0nkFLQivX+oWcXO+/I1xkVq+6h59DKiWMwbG0YoxmsSeIbeOVaF4lc9+G97e6fasONLDa3phRiXG/PcrKe6FKu9Pw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB5062
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

This commit adds configuration i2c busses for 24 NVMe slots and
2 M2 NVMe slots found on Mt.Jade hardware reference platform
with Ampere's Altra processor family.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
v2:
  + Introduced in v2

 .../arm/boot/dts/aspeed-bmc-ampere-mtjade.dts | 258 ++++++++++++++++++
 1 file changed, 258 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
index 3515d55bd312..723c7063c223 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
@@ -7,6 +7,50 @@ / {
 	model = "Ampere Mt. Jade BMC";
 	compatible = "ampere,mtjade-bmc", "aspeed,ast2500";
 
+	aliases {
+		/*
+		 *  i2c bus 50-57 assigned to NVMe slot 0-7
+		 */
+		i2c50 = &nvmeslot_0;
+		i2c51 = &nvmeslot_1;
+		i2c52 = &nvmeslot_2;
+		i2c53 = &nvmeslot_3;
+		i2c54 = &nvmeslot_4;
+		i2c55 = &nvmeslot_5;
+		i2c56 = &nvmeslot_6;
+		i2c57 = &nvmeslot_7;
+
+		/*
+		 *  i2c bus 60-67 assigned to NVMe slot 8-15
+		 */
+		i2c60 = &nvmeslot_8;
+		i2c61 = &nvmeslot_9;
+		i2c62 = &nvmeslot_10;
+		i2c63 = &nvmeslot_11;
+		i2c64 = &nvmeslot_12;
+		i2c65 = &nvmeslot_13;
+		i2c66 = &nvmeslot_14;
+		i2c67 = &nvmeslot_15;
+
+		/*
+		 *  i2c bus 70-77 assigned to NVMe slot 16-23
+		 */
+		i2c70 = &nvmeslot_16;
+		i2c71 = &nvmeslot_17;
+		i2c72 = &nvmeslot_18;
+		i2c73 = &nvmeslot_19;
+		i2c74 = &nvmeslot_20;
+		i2c75 = &nvmeslot_21;
+		i2c76 = &nvmeslot_22;
+		i2c77 = &nvmeslot_23;
+
+		/*
+		 *  i2c bus 80-81 assigned to NVMe M2 slot 0-1
+		 */
+		i2c80 = &nvme_m2_0;
+		i2c81 = &nvme_m2_1;
+	};
+
 	chosen {
 		stdout-path = &uart5;
 		bootargs = "console=ttyS4,115200 earlycon";
@@ -445,6 +489,220 @@ rtc@51 {
 
 &i2c5 {
 	status = "okay";
+	i2c-mux@70 {
+		compatible = "nxp,pca9548";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x70>;
+		i2c-mux-idle-disconnect;
+
+		nvmeslot_0_7: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x3>;
+		};
+	};
+
+	i2c-mux@71 {
+		compatible = "nxp,pca9548";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x71>;
+		i2c-mux-idle-disconnect;
+
+		nvmeslot_8_15: i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x4>;
+		};
+
+		nvmeslot_16_23: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x3>;
+		};
+
+	};
+
+	i2c-mux@72 {
+		compatible = "nxp,pca9545";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x72>;
+		i2c-mux-idle-disconnect;
+
+		nvme_m2_0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0>;
+		};
+
+		nvme_m2_1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x1>;
+		};
+	};
+};
+
+&nvmeslot_0_7 {
+	status = "okay";
+
+	i2c-mux@75 {
+		compatible = "nxp,pca9548";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x75>;
+		i2c-mux-idle-disconnect;
+
+		nvmeslot_0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0>;
+		};
+		nvmeslot_1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x1>;
+		};
+		nvmeslot_2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x2>;
+		};
+		nvmeslot_3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x3>;
+		};
+		nvmeslot_4: i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x4>;
+		};
+		nvmeslot_5: i2c@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x5>;
+		};
+		nvmeslot_6: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x6>;
+		};
+		nvmeslot_7: i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x7>;
+		};
+
+	};
+};
+
+&nvmeslot_8_15 {
+	status = "okay";
+
+	i2c-mux@75 {
+		compatible = "nxp,pca9548";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x75>;
+		i2c-mux-idle-disconnect;
+
+		nvmeslot_8: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0>;
+		};
+		nvmeslot_9: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x1>;
+		};
+		nvmeslot_10: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x2>;
+		};
+		nvmeslot_11: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x3>;
+		};
+		nvmeslot_12: i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x4>;
+		};
+		nvmeslot_13: i2c@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x5>;
+		};
+		nvmeslot_14: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x6>;
+		};
+		nvmeslot_15: i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x7>;
+		};
+	};
+};
+
+&nvmeslot_16_23 {
+	status = "okay";
+
+	i2c-mux@75 {
+		compatible = "nxp,pca9548";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x75>;
+		i2c-mux-idle-disconnect;
+
+		nvmeslot_16: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0>;
+		};
+		nvmeslot_17: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x1>;
+		};
+		nvmeslot_18: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x2>;
+		};
+		nvmeslot_19: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x3>;
+		};
+		nvmeslot_20: i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x4>;
+		};
+		nvmeslot_21: i2c@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x5>;
+		};
+		nvmeslot_22: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x6>;
+		};
+		nvmeslot_23: i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x7>;
+		};
+	};
 };
 
 &i2c6 {
-- 
2.28.0

