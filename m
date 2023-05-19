Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCE070923B
	for <lists+openbmc@lfdr.de>; Fri, 19 May 2023 10:54:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QN0z22h1fz3fCX
	for <lists+openbmc@lfdr.de>; Fri, 19 May 2023 18:54:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=Ib1u25fB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e8c::722; helo=nam04-mw2-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=Ib1u25fB;
	dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on20722.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8c::722])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QN0xX2Btkz3fBh;
	Fri, 19 May 2023 18:53:36 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AI7vJH9pHsve6EC/BzWUaD3RGKFaJJ9Wnic3RzqXf9QScPNNAHJiirgzzZ6dZ5v2LMCBvT1qSuMfY9odIdMjyp7llKrUYmUoL2atZIyshkkK+fTVs1CIR7vYertiYzDSVI6v4/byEZUYTBguy1sFuDpbOO0wMFRYKLxZbHEqvbiiMmHss7cJHrTm+hflHKc09P94WZGoH2LiPZ6tXeOgdJGpRhGbTln7QehUiOwrmKeTx1KZ2eNmXd7/GeihghTo9VX3eKHOXJJnWgfbRsjuW5UwmK0Zf9B3I5MXUwIQ76calh6ZlsA2CD66rwNC9/IWlH0qGxFcXFyUu2WeiaKlpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FjO2TepcAxmHWHllgz5eZITe19Kh3raEdDxo0Q8Jm6E=;
 b=Pll4aXG1A4dJCBiSq5iE9AF1B3lUfImnIBMP+NRuTctEsyVb7qw1NzzM4tu+OISuuWuIa/pjxODxlOv34i91eHXhkaW+iK+77huXvsxMEDV5hvBBADcfwMme+VjSg6yCh7ui9z/WRvIusKmsYEIBhXNlcrB/dswDSq1LNouLHkG08pOF8wzRK8Ni5RR64QtBYvgku/6fOR7LCNdwZOsVAAgFRopOKHMMlwL219/ka0fYf/AZrzz76vcM/e467f8notGNo/0jl5xing4mvm3ha3BIq6pGw/x8Ns6orR7jyfXna6p3kcNTNgZ5a97RUrMu+nOHcI8Qw2IE91o0bYfA6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FjO2TepcAxmHWHllgz5eZITe19Kh3raEdDxo0Q8Jm6E=;
 b=Ib1u25fBuN2mb8xlTTbd28e5POs/31vgQ8wTRvKxU7g12ny+aE7d33sTWmZR27Emg6LrtqLzkOg7emYwBxQYBPYa2cG1J7L32TDFamUNhkf1hSx9qPs4qDFu+ax4o2v+3KQPWBkcg3ddmXwRV4b0WGvJEmYj6qNSzLhpvzHX8pg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from DS0PR01MB8010.prod.exchangelabs.com (2603:10b6:8:151::19) by
 BN6PR01MB2675.prod.exchangelabs.com (2603:10b6:404:ce::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.21; Fri, 19 May 2023 08:53:12 +0000
Received: from DS0PR01MB8010.prod.exchangelabs.com
 ([fe80::e439:70c2:7d19:45e]) by DS0PR01MB8010.prod.exchangelabs.com
 ([fe80::e439:70c2:7d19:45e%6]) with mapi id 15.20.6411.019; Fri, 19 May 2023
 08:53:12 +0000
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
Subject: [PATCH v2 2/3] ARM: dts: aspeed: mtmitchell: Update ADC sensors for Mt.Mitchell DVT systems
Date: Fri, 19 May 2023 15:51:59 +0700
Message-Id: <20230519085200.22020-3-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230519085200.22020-1-chanh@os.amperecomputing.com>
References: <20230519085200.22020-1-chanh@os.amperecomputing.com>
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0004.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::23) To DS0PR01MB8010.prod.exchangelabs.com
 (2603:10b6:8:151::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR01MB8010:EE_|BN6PR01MB2675:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dcac5a1-e4bc-4c1f-e2b0-08db58467a10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	2ORHczgLrmdZTII5bvJdelc4LfySBA6Pgwwh9dwQWirlhpBry5p/MBIvchxmf11kvdloM0NxHLI5klDHnOr1wso0Ft0SxsRqjYbBhYohRfcB6GzpNr9OCWnYIQ6kTtraxDsFTx0tX+1MwFRi+Awg5bhHl4aecr7L/g4ZMir5XRp0r8O1nz6dG+gCSya/O56XLjDTa5jz93TVtuYyG4mk2UHtaiPx6tF3TAfgePcBNJbTleXaLcc2saVSl2nplhZ07LmCoBpt5pSzdYM+B4iNa5b7wbpJTz/s3/CA5/gUpypE0zTEfPXpiQXvZ6hn64uFcfxMc4MvZUDP8straJhRkuneSF/NJthypH1cWVJIq3HjZQ2lEWrFtDf0OKttt2cBDQMFIJOOkdVQT6EYgIDP1BT13lsM3UvHUazxM2IcbGGthf1ZasvJ8GJRYuUzoHVz/r9BuhsAxta5ovSMXLGOI+kFaz0EmMGtuksri7Y310xXR2gFT5KHxxApYUNLavn9mTirZ1JO9wKk8t9Q5LDNseELRzQk2XEGbvM+czAW5IKZus9zSQrT+6ixcDozlrf585ptV9Q4Aodz5zBp3JqnuEkV38j1LkjDg0k2RRIHFfeRpCdSOLTMKehN4TKXnTkLyPpTtUFFaruC688suGYW4Pn/lu/MVTslpYQGyxlgiSI=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR01MB8010.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(39850400004)(136003)(346002)(376002)(451199021)(86362001)(110136005)(316002)(4326008)(66556008)(66476007)(66946007)(52116002)(478600001)(6666004)(6486002)(8936002)(8676002)(41300700001)(5660300002)(2906002)(38100700002)(38350700002)(2616005)(26005)(107886003)(186003)(1076003)(6506007)(83380400001)(6512007)(473944003)(414714003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?9NaWF/Bi5yYhl5Tg4JLJzlKZishle0dYMerF8zp90MO+Dy6NbYjB2kD+9tmz?=
 =?us-ascii?Q?b+cRIS0blkvZxmLrif+pi0CzYgEdaFbIh9MaGrkLoDbn0aZBmxyt/Iqs6Vkr?=
 =?us-ascii?Q?BnLEaeeVIvdtvhGKXBjhQKwYR6A7qqiYdOgvL6imlFoYJtVySGhufy1D7d37?=
 =?us-ascii?Q?vi/AvxV6WVffYFu/J1Yl/Jwqli2/vllzNyNjKJwbNxvd09dnw0L0eUbgKNQ0?=
 =?us-ascii?Q?bYNjkB6tHjnmfVkiZl3N5yqh9DEse8JIjEYrtv4vIwu8/hDtliAFD7I4AOv7?=
 =?us-ascii?Q?VUKqyH5JD8wP7YtVCKU5yGLb00fuanfWJ1oZPJ7N0yOli+1jEoAfcuYPaGqW?=
 =?us-ascii?Q?0QqAgY7jaam7JAGfOySuPhlnYyAA37a89lVZshhEvOguGLaQaRF4YxWdMQJ+?=
 =?us-ascii?Q?tOQ8GRgh973lkdm6x2jBItQ0yvkcXwisDNiErDhEKZYVxe3Vy3haGjssPchZ?=
 =?us-ascii?Q?WCs5jr1NyZDWHMoEVC5mdhU8TAeTnb5ku8we4q6dkn5rm3d21BpJ3STCL6fj?=
 =?us-ascii?Q?+Un3Fp/fGkJv7zmQ+GKZTNJ5PUJ3UKqTY6jNEcpmkt0AjzdYmR13iNgGQhab?=
 =?us-ascii?Q?iCIwR3YI008muqVEPmO0BnYOTpdMedJ8FF/zwKJiKeSma3Q9N/bJFxxrmEAL?=
 =?us-ascii?Q?0dJbX9RlVX9MuVbZSdYXjSdEl4xLXpld5wZ4VMEZ4sSzZ8LHoenvtBPxFnzL?=
 =?us-ascii?Q?E6zwq2Co2OW/iidKduhZve0sERRv81Wjyb+TvTmzg+avmDA+QopgTnFrBmJy?=
 =?us-ascii?Q?kmW710vDRbg8nlSCaRzjGdtCjTn2At0UEX/bllraarM4aq/ENTZqP6t8HbPf?=
 =?us-ascii?Q?1lm9Z/p8YTWszq3JtF3AhSICK7BtGSyH7lUHtpkqQid9M/1P8u6sQ7Kc7txw?=
 =?us-ascii?Q?npDYEuAHr1hfKiOOJtqw+0xzC5rajSVTo005yC4x8KMkZA6mKJJOXfOhsaCh?=
 =?us-ascii?Q?iZdS7DVtQOHSz/Y/+BH7+VfEtC19188vqIqPZ4vTlt3lexeIEqo8aZGf7bh4?=
 =?us-ascii?Q?MCGpb9f7M8yoI9hesaoVvA4b1ktP5cay4JyDb4iisgyS0IlW7ipeZaceX6TF?=
 =?us-ascii?Q?Kb24QAFWR4S3Nd1XsjEkuTKNpaQ4R4WYd4MzijJV0di4rgXKMrQHs+45Ktdx?=
 =?us-ascii?Q?fwOpdrKNWITp92vtAcpkcuryI2taJj6tJaZpuScbGxAdi1qdg3R3J9bvhwGY?=
 =?us-ascii?Q?ZxoREOhD/pMZXFLrrElT8EBsxKNQwJIRiYaKWqsLCQgdxhlrwKRvszb0oECp?=
 =?us-ascii?Q?FvUNnHByDzLg5nznCOET0oYBkWs6ZN/ynqUl78SSA0BaCx/zR2prTqDGoXE2?=
 =?us-ascii?Q?lo/CFTjwn5qHxgtL4LvEIPEEHr2hP/TIfNedsoA26yoKEfz9quWdKY/UxhHj?=
 =?us-ascii?Q?wKCgxwxk24+iTCos2yYZOmKp+BXUmUFjZ8dYDQ8FUinQz87JtYIxHCnFQWab?=
 =?us-ascii?Q?fvDcMjxUA0Ltol3XI360TZphrbZHeDIAsxc52BZoDazk4H/lC0NefLKN2p18?=
 =?us-ascii?Q?ekU2xR+ESvyKjVZkaF7720JTETb4yKGTta1oQWGjdgzO8Unt7qsesPM1JW1J?=
 =?us-ascii?Q?+Z554QivFtjqaKAt7g0d7PWAGRqo0a6/afBLNsGdios77HvoITxDZlnP9toZ?=
 =?us-ascii?Q?F0k33lEhDYa3etllaI1HVcM=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dcac5a1-e4bc-4c1f-e2b0-08db58467a10
X-MS-Exchange-CrossTenant-AuthSource: DS0PR01MB8010.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 08:53:12.3298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M1iItw1tK9q0QjUCROCnKlri69iWHhoIXbaNby2T54I4/64MoT1kA9GuCG2LE9e6U8v4kUsCcQ1eIACMe2cufs2JR8Vg2v1UP6bK+vFjsKtKOWTKkdWSGtvnVLCGIDr0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR01MB2675
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

