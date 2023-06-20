Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 043037367B8
	for <lists+openbmc@lfdr.de>; Tue, 20 Jun 2023 11:29:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=rjP1R+Ql;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QlhCg6fbpz30fd
	for <lists+openbmc@lfdr.de>; Tue, 20 Jun 2023 19:29:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=rjP1R+Ql;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e89::711; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20711.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e89::711])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qlh8l6b3Mz30dn;
	Tue, 20 Jun 2023 19:26:31 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d9YJ1SaXIGzuVLyZCvMyPriMJlSmlR3y/L8OQbkwvjkvOvxbMD8kcrxDS0gdmMbl1u+HVgUWDUvcAi1cWO6CbzkHcjybOZmkHHpz7mcfnmiopIqTa3cM29FVajhvPXu5jWTm92fxlRcaGmIlD09VDcD58tgHFLlyRbIyAHr5Ps33bcEO3QcGuScHzb5noxe5PTXDzhVM5mtrD+gPUX1KjFH+U5cvt2zn8VDmF9vWfcNdqsOHiwkf9jRjs9khg8T/j0/bkrwTYlJiEbLA9fpCI6aGiQU1YbYjHPh3xizN9cGLSHTjAXx63ImJsp7Jds7tqo1pWxYr5034ztP+6FdXig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=voyeqpMRt29J7dnpPMaK92qIdd3sWhB4tRwWDAss44M=;
 b=L5w0fo1+vCKTO1TCtzMyPoi8ukSlVAa/alvWHeM0t+QZZ0vI2LgcOtib5raQTLsFtfb/AqDi7UMZZy2dFl/1BbFw7GE6bBdkvVpu3unPLGsoZdGqiBfrheZeJUnIffn7bcoB75ZlENeWRQWhHDJYfkoIsy1TCtdnQek+Aa3kNxH0VOwDsQVImFiKM+uMSb4qcnlVGzeeXnc1cfAbek1CIpdlHfE8tIpg0UIiq+xkfvIm+ZnpekGeMBCNvvsbHKXdyOmN01ppfEUxtupv3PJxZZgCb/PE7vOAhXFToEYv1bE3C8ZsRnvtA3RvL7kHhR42DmEBCjNvzHxPUzhNtKnvaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=voyeqpMRt29J7dnpPMaK92qIdd3sWhB4tRwWDAss44M=;
 b=rjP1R+QlCyarLjFV+PF+AJEIO8I2OpWBNlw+h52ue9N8sNIOl4lm/FBj8tSJSiQfeDlUU1wXGBWNUqgsTQARcdh4xNgQJtMOP0lW6kKnOunfsCBzbXmuhqfUiI56qeKWuC0Y+ACvnOrva+b9lMlEqicxpYekRGqNW9vgyre4I/A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from DS0PR01MB8010.prod.exchangelabs.com (2603:10b6:8:151::19) by
 IA0PR01MB8237.prod.exchangelabs.com (2603:10b6:208:48d::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.35; Tue, 20 Jun 2023 09:26:17 +0000
Received: from DS0PR01MB8010.prod.exchangelabs.com
 ([fe80::e439:70c2:7d19:45e]) by DS0PR01MB8010.prod.exchangelabs.com
 ([fe80::e439:70c2:7d19:45e%6]) with mapi id 15.20.6521.020; Tue, 20 Jun 2023
 09:26:17 +0000
From: Chanh Nguyen <chanh@os.amperecomputing.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] ARM: dts: aspeed: mtmitchell: Update ADC sensors for Mt.Mitchell DVT systems
Date: Tue, 20 Jun 2023 16:25:36 +0700
Message-Id: <20230620092537.20007-3-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230620092537.20007-1-chanh@os.amperecomputing.com>
References: <20230620092537.20007-1-chanh@os.amperecomputing.com>
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0023.apcprd02.prod.outlook.com
 (2603:1096:4:195::11) To DS0PR01MB8010.prod.exchangelabs.com
 (2603:10b6:8:151::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR01MB8010:EE_|IA0PR01MB8237:EE_
X-MS-Office365-Filtering-Correlation-Id: d3b35a8c-5177-4361-c180-08db71706625
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	oqacAAYDCz+RIE4gOiKrzrpq0vHgpaqnDAArq92XGk73IscPZON7YdJaTRl90uA+2AudCZVTaWyrs9EhPEMsNA9qWSlTqMkz3e0vI029y8K2n7wuQQh7hHn9v0AYmHKhpKikFPWI2pEbGrLvPE8S9I8XD1TMii7KmDaVZKtvo4CV8gfg1H+CSNxURsggWHwcrvfOcPG7uB6SEH5WDYnPFYraffNfzklQ2M7/c03oVUJbPrBzm2R1iXbPgAFJ1hG7c4ao94+oTnpWWLR/bV9DvsumwRaRXPE8OrGSKg006CquNliwNouc8vP9HkOPeP4scGP1y7vhTiT1uJsx9FSwVhR/xEVjvYW4IJpCxAifGsht+gxoYNtD/GBt0qwX4uxQBqBeZxaFe/++B726lWNK4FdCFFKKAVbhxQzuObGrKMoWQar2BPStmIb/rn7sEWL1QHMM18eBnCU2wX2sCzvxOn8Ld6kEu1O5EhWCm/S5ssvkREEv00qVC+B45Mgd/HvfDIB8naTBk17JbCAlIrep7Jvb+4Yn67E3vDJ1TKTy9BrhalEfwB1VzfrkDDykRHvjpgxN4/kz8bHwMsesAu22sk3F+djwAXnwrNn4jDI3XE3pZ53iFzUjTEdjhd7A0E8qVFvmYtGRtDPJmF+bAzUzLFIPjQJjFm0x30gin+ntSdQ=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR01MB8010.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(451199021)(6666004)(6486002)(478600001)(107886003)(1076003)(6506007)(52116002)(5660300002)(86362001)(2906002)(110136005)(8676002)(41300700001)(8936002)(66476007)(66556008)(66946007)(316002)(2616005)(38100700002)(38350700002)(83380400001)(4326008)(26005)(6512007)(186003)(473944003)(414714003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Sv3wUbWxSeNWUh/j4xXWL1iY/6epdtCuOJr1ghSXfl6L+nCwOs4XCeawY02/?=
 =?us-ascii?Q?ld5m6CnYflwFt1PicJLf+83i5l53Qj9e4HDyBjqX8yU4AxYnAnz6W4b3NSAT?=
 =?us-ascii?Q?lO8aYBYl9fM9jBPORMBMe+qNsVXnwBpXcsUQSumZCCBEfvSbmD4T7OpznDDo?=
 =?us-ascii?Q?hMUiRPJIFubMt8YWrFC5kKBZMAMnoWAByEED/x5QcxlLIqqcIBiDoWtgj67n?=
 =?us-ascii?Q?BH6m+aJne7u88es2eTEceOULj5XavjJqMaInzFagvCNDxst6jNmJDuLPniju?=
 =?us-ascii?Q?hJzM+CFvCK0Zw1hBAVp9Dfi5UnsHlGy2zSy/waV6brcLDpBAvRCvVq/gCXpn?=
 =?us-ascii?Q?jXn1GfQeK3OPVdBEzhU0TmNU+njzVHRKuFS7wlKnyv975HXHvOVF1ehDQKdv?=
 =?us-ascii?Q?GewwdZJV5EwOx+wJSnbVooKpVYwC3lExSBCh1RBqkA1h+cS/7w/fMswnnDei?=
 =?us-ascii?Q?GuMlhrt8jVMHNvNG4auybJy6bSCNTpFK5kE51n20ElSXubIDFu9K2q/ZLl/J?=
 =?us-ascii?Q?Xp6NWSunJoVkxpc6eggkqufTHACzCA+q+Zig05PDTw5OdlxZCVj7n9guIoLz?=
 =?us-ascii?Q?Qa2D1/LYEx3gbKmLFJSApbL7MefFf1DVw5IBuKEXLF3/KXBSxN9WG8sdBiPx?=
 =?us-ascii?Q?aIlRJpUrlPv3HrXn02998p+z3Yc9owobk6+zAoo6rjoraP4rufl8lTusL4H4?=
 =?us-ascii?Q?t1VEl1GkFjIcZDBWJx4v8n2sJsCi9yaDs4Qa7fP5Zgnvvi1m/tGLJwUdHDyu?=
 =?us-ascii?Q?u3iYCW5acr/3RCgB6/dvQ0eW+Sjd+iIuT0+skQNYrCOlAdiZGzbfvObT/BJc?=
 =?us-ascii?Q?dGOgpHaHTKztniMe3XOT6Wjyf8GVdLee4GMwyAX/tpsVd+BbK7f/0C8QCICw?=
 =?us-ascii?Q?5H7R0S1M5TJ32pEkNCuEZ5f7uNk673FPihOSBBW60v2skYhHWrTkxYaqznjH?=
 =?us-ascii?Q?6YgYk3KHDWHS61J590upT90jP/ceWDxgkpSl0WQPBGC96BskddGiuySVUsw8?=
 =?us-ascii?Q?xGsuEuSymX9fZGCDOjsXbLTlYG0uj6pjMOlFwQ7OVTtac2U7uEfn+UhatFGM?=
 =?us-ascii?Q?2VzOwh/DbOrECgyztCaGrr6Ab1dRZoMaiyiLM6mwvymzxeXy5R86BuaE0C70?=
 =?us-ascii?Q?6w1bZ7nIy2fP7RbUP6YiLLzCg65Ku31IamCHdJNy4SXcjRdO9k6AmZ/IHsJd?=
 =?us-ascii?Q?uupE2Zq4J6OeAk3cwzbuN0OawjQBLlel4Q1/eW4qJdVwagnO8LSlQo9ajK5W?=
 =?us-ascii?Q?QOYVyPMw7t/PVL0tXEKEv2hWkAtbvd9mRgaU4npB+oZCK+JaO4ZGTLNbqZL1?=
 =?us-ascii?Q?LWCTsfuJrl7PXYe9g/whMK9weNbkVXRCchLmcIgjWiUlXnnTQF+jmkzoHbX2?=
 =?us-ascii?Q?f/wcn4RGGbY5PFQWxOXe5MT8UKmVdA2gL620EIu5CrHO2+DWfhUhnq39WiY4?=
 =?us-ascii?Q?5BRKoH9kB2RifnOlGFiO1uzEat34dMXXaoEzOerNUirEk34kdgLefqqJAIg1?=
 =?us-ascii?Q?gDpjcSzB+V79+N82Tzm4beqJdxMU9rkaDPRgkP0zDkhJv/rx52l4EmgOxc4w?=
 =?us-ascii?Q?TL9Jy+8wGDP7Cx9SgA8qdV/hcNB2OE4CYhWVo05wq8kKWXnCMVOCJ9c/rZft?=
 =?us-ascii?Q?Q8/+etUbW5GmQcVY/K9j4Js=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3b35a8c-5177-4361-c180-08db71706625
X-MS-Exchange-CrossTenant-AuthSource: DS0PR01MB8010.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 09:26:16.9906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SKdjNg+JOB1cfm5voflrbTFxY+QlWR22s96N9pr6gh55QEECxLhB+XAbihyr4STKX38IKYFyoAbqnADAShYDCWMf2c1CEpj1lhTObOJAdh85oMHd1yM2lnC7vD2yhBnv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR01MB8237
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

Change to use I2C ADC controller (ltc2497) for Mt.Mitchell DVT and
later hardware.

Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
---
Changes in v3:
  - None
Changes in v2:
  - None
---
 .../boot/dts/aspeed-bmc-ampere-mtmitchell.dts | 107 +++++++++++-------
 1 file changed, 66 insertions(+), 41 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
index e79f56208b89..d3c7e7c0fd25 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
@@ -65,174 +65,192 @@
 
 	adc0mux: adc0mux {
 		compatible = "io-channel-mux";
-		io-channels = <&adc0 0>;
+		io-channels = <&adc_i2c_0 0>;
 		#io-channel-cells = <1>;
 		io-channel-names = "parent";
 		mux-controls = <&gpioI5mux>;
+		settle-time-us = <10000>;
 		channels = "s0", "s1";
 	};
 
 	adc1mux: adc1mux {
 		compatible = "io-channel-mux";
-		io-channels = <&adc0 1>;
+		io-channels = <&adc_i2c_0 1>;
 		#io-channel-cells = <1>;
 		io-channel-names = "parent";
 		mux-controls = <&gpioI5mux>;
+		settle-time-us = <10000>;
 		channels = "s0", "s1";
 	};
 
 	adc2mux: adc2mux {
 		compatible = "io-channel-mux";
-		io-channels = <&adc0 2>;
+		io-channels = <&adc_i2c_0 2>;
 		#io-channel-cells = <1>;
 		io-channel-names = "parent";
 		mux-controls = <&gpioI5mux>;
+		settle-time-us = <10000>;
 		channels = "s0", "s1";
 	};
 
 	adc3mux: adc3mux {
 		compatible = "io-channel-mux";
-		io-channels = <&adc0 3>;
+		io-channels = <&adc_i2c_0 3>;
 		#io-channel-cells = <1>;
 		io-channel-names = "parent";
 		mux-controls = <&gpioI5mux>;
+		settle-time-us = <10000>;
 		channels = "s0", "s1";
 	};
 
 	adc4mux: adc4mux {
 		compatible = "io-channel-mux";
-		io-channels = <&adc0 4>;
+		io-channels = <&adc_i2c_0 4>;
 		#io-channel-cells = <1>;
 		io-channel-names = "parent";
 		mux-controls = <&gpioI5mux>;
+		settle-time-us = <10000>;
 		channels = "s0", "s1";
 	};
 
 	adc5mux: adc5mux {
 		compatible = "io-channel-mux";
-		io-channels = <&adc0 5>;
+		io-channels = <&adc_i2c_0 5>;
 		#io-channel-cells = <1>;
 		io-channel-names = "parent";
 		mux-controls = <&gpioI5mux>;
+		settle-time-us = <10000>;
 		channels = "s0", "s1";
 	};
 
 	adc6mux: adc6mux {
 		compatible = "io-channel-mux";
-		io-channels = <&adc0 6>;
+		io-channels = <&adc_i2c_0 6>;
 		#io-channel-cells = <1>;
 		io-channel-names = "parent";
 		mux-controls = <&gpioI5mux>;
+		settle-time-us = <10000>;
 		channels = "s0", "s1";
 	};
 
 	adc7mux: adc7mux {
 		compatible = "io-channel-mux";
-		io-channels = <&adc0 7>;
+		io-channels = <&adc_i2c_0 7>;
 		#io-channel-cells = <1>;
 		io-channel-names = "parent";
 		mux-controls = <&gpioI5mux>;
+		settle-time-us = <10000>;
 		channels = "s0", "s1";
 	};
 
 	adc8mux: adc8mux {
 		compatible = "io-channel-mux";
-		io-channels = <&adc1 0>;
+		io-channels = <&adc_i2c_0 8>;
 		#io-channel-cells = <1>;
 		io-channel-names = "parent";
 		mux-controls = <&gpioI5mux>;
+		settle-time-us = <10000>;
 		channels = "s0", "s1";
 	};
 
 	adc9mux: adc9mux {
 		compatible = "io-channel-mux";
-		io-channels = <&adc1 1>;
+		io-channels = <&adc_i2c_0 9>;
 		#io-channel-cells = <1>;
 		io-channel-names = "parent";
 		mux-controls = <&gpioI5mux>;
+		settle-time-us = <10000>;
 		channels = "s0", "s1";
 	};
 
 	adc10mux: adc10mux {
 		compatible = "io-channel-mux";
-		io-channels = <&adc1 2>;
+		io-channels = <&adc_i2c_0 10>;
 		#io-channel-cells = <1>;
 		io-channel-names = "parent";
 		mux-controls = <&gpioI5mux>;
+		settle-time-us = <10000>;
 		channels = "s0", "s1";
 	};
 
 	adc11mux: adc11mux {
 		compatible = "io-channel-mux";
-		io-channels = <&adc1 3>;
+		io-channels = <&adc_i2c_0 11>;
 		#io-channel-cells = <1>;
 		io-channel-names = "parent";
 		mux-controls = <&gpioI5mux>;
+		settle-time-us = <10000>;
 		channels = "s0", "s1";
 	};
 
 	adc12mux: adc12mux {
 		compatible = "io-channel-mux";
-		io-channels = <&adc1 4>;
+		io-channels = <&adc_i2c_0 12>;
 		#io-channel-cells = <1>;
 		io-channel-names = "parent";
 		mux-controls = <&gpioI5mux>;
+		settle-time-us = <10000>;
 		channels = "s0", "s1";
 	};
 
 	adc13mux: adc13mux {
 		compatible = "io-channel-mux";
-		io-channels = <&adc1 5>;
+		io-channels = <&adc_i2c_0 13>;
 		#io-channel-cells = <1>;
 		io-channel-names = "parent";
 		mux-controls = <&gpioI5mux>;
+		settle-time-us = <10000>;
 		channels = "s0", "s1";
 	};
 
 	adc14mux: adc14mux {
 		compatible = "io-channel-mux";
-		io-channels = <&adc1 6>;
+		io-channels = <&adc_i2c_0 14>;
 		#io-channel-cells = <1>;
 		io-channel-names = "parent";
 		mux-controls = <&gpioI5mux>;
+		settle-time-us = <10000>;
 		channels = "s0", "s1";
 	};
 
 	adc15mux: adc15mux {
 		compatible = "io-channel-mux";
-		io-channels = <&adc1 7>;
+		io-channels = <&adc_i2c_0 15>;
 		#io-channel-cells = <1>;
 		io-channel-names = "parent";
 		mux-controls = <&gpioI5mux>;
+		settle-time-us = <10000>;
 		channels = "s0", "s1";
 	};
 
 	iio-hwmon {
 		compatible = "iio-hwmon";
-		io-channels = <&adc0mux 0>, <&adc0mux 1>,
-			<&adc1mux 0>, <&adc1mux 1>,
-			<&adc2mux 0>, <&adc2mux 1>,
-			<&adc3mux 0>, <&adc3mux 1>,
-			<&adc4mux 0>, <&adc4mux 1>,
-			<&adc5mux 0>, <&adc5mux 1>,
-			<&adc6mux 0>, <&adc6mux 1>,
-			<&adc7mux 0>, <&adc7mux 1>,
-			<&adc8mux 0>, <&adc8mux 1>,
-			<&adc9mux 0>, <&adc9mux 1>,
-			<&adc10mux 0>, <&adc10mux 1>,
-			<&adc11mux 0>, <&adc11mux 1>,
-			<&adc12mux 0>, <&adc12mux 1>,
-			<&adc13mux 0>, <&adc13mux 1>,
-			<&adc14mux 0>, <&adc14mux 1>,
-			<&adc15mux 0>, <&adc15mux 1>,
-			<&adc_i2c 0>, <&adc_i2c 1>,
-			<&adc_i2c 2>, <&adc_i2c 3>,
-			<&adc_i2c 4>, <&adc_i2c 5>,
-			<&adc_i2c 6>, <&adc_i2c 7>,
-			<&adc_i2c 8>, <&adc_i2c 9>,
-			<&adc_i2c 10>, <&adc_i2c 11>,
-			<&adc_i2c 12>, <&adc_i2c 13>,
-			<&adc_i2c 14>, <&adc_i2c 15>;
+		io-channels =	<&adc0mux 0>, <&adc0mux 1>,
+				<&adc1mux 0>, <&adc1mux 1>,
+				<&adc2mux 0>, <&adc2mux 1>,
+				<&adc3mux 0>, <&adc3mux 1>,
+				<&adc4mux 0>, <&adc4mux 1>,
+				<&adc5mux 0>, <&adc5mux 1>,
+				<&adc6mux 0>, <&adc6mux 1>,
+				<&adc7mux 0>, <&adc7mux 1>,
+				<&adc8mux 0>, <&adc8mux 1>,
+				<&adc9mux 0>, <&adc9mux 1>,
+				<&adc10mux 0>, <&adc10mux 1>,
+				<&adc11mux 0>, <&adc11mux 1>,
+				<&adc12mux 0>, <&adc12mux 1>,
+				<&adc13mux 0>, <&adc13mux 1>,
+				<&adc14mux 0>, <&adc14mux 1>,
+				<&adc15mux 0>, <&adc15mux 1>,
+				<&adc_i2c_1 0>, <&adc_i2c_1 1>,
+				<&adc_i2c_1 2>, <&adc_i2c_1 3>,
+				<&adc_i2c_1 4>, <&adc_i2c_1 5>,
+				<&adc_i2c_1 6>, <&adc_i2c_1 7>,
+				<&adc_i2c_1 8>, <&adc_i2c_1 9>,
+				<&adc_i2c_1 10>, <&adc_i2c_1 11>,
+				<&adc_i2c_1 12>, <&adc_i2c_1 13>,
+				<&adc_i2c_1 14>, <&adc_i2c_1 15>,
+				<&adc0 0>, <&adc0 1>,
+				<&adc0 2>;
 	};
 };
 
@@ -353,7 +371,14 @@
 &i2c4 {
 	status = "okay";
 
-	adc_i2c: adc@16 {
+	adc_i2c_0: adc@14 {
+		compatible = "lltc,ltc2497";
+		reg = <0x14>;
+		vref-supply = <&voltage_mon_reg>;
+		#io-channel-cells = <1>;
+	 };
+
+	adc_i2c_1: adc@16 {
 		compatible = "lltc,ltc2497";
 		reg = <0x16>;
 		vref-supply = <&voltage_mon_reg>;
-- 
2.17.1

