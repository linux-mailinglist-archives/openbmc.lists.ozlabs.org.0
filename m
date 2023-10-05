Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C617B9A94
	for <lists+openbmc@lfdr.de>; Thu,  5 Oct 2023 06:01:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=pl6MzSK+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S1Ht85HgXz3vbx
	for <lists+openbmc@lfdr.de>; Thu,  5 Oct 2023 15:01:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=pl6MzSK+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe59::716; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20716.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::716])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S1Hmr4HCYz3cVy;
	Thu,  5 Oct 2023 14:56:44 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JKYA637PHOQOccTARtiZ6kl/w0XfD0OuRh546YQT0u5aBBPhworcIESkrd4iKaNkO+TKrNk68MpZXCkj758u3swjPvlrn36r5eSFN3bE/rXYLrwyF/GDh444AXb3RXYngOUDZbxHvfCq7ht6obuLoyCb8hL5yTTJ1HQxUyg/qn3hSMerqKYYhfo9UwpbBFcFAdhff9Nfhzjx5gGwrM5vtxXeZ0xNDyQbhV/7J5oLwnd5jBrF1dlVFgHuSrvh9VX6Y9IKA4nCpFT0e++699s3nYJVgvArol3xqmeNy3OmfyB3VL5ndTwdEMIph9lywgr6XsGg1cvS9aZwJY9fnHNhXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2UOT7SgQjlxdHik2nb2Z5XwG4gW0CcHHTHYd1biwev8=;
 b=gpFFOT7mW2/ZIwwQ2KrRFd0VXGZullJjSAmKNcihcAF5/GyMCrcvRQvJN0Lvv2MQYrUYWZMfHBUl5d9w1BHE2FxnsLERS4dEnW8mxdYaQ4AmvNtDm6Ikf0g5e8Lii/augQSAVBY6NswnCNo87I0AjBJhb3tyZhgoi/P2MHDe5GTG4gKomDfNPjygofnFtyWH9+6jDVY8Q7+hIdpTXDcwdkYugGclvxo2PbukacQmiviR/qRWb9BoFjJDyr8aHrSutx4XvRKw5AmfM3DeUak7CWc8np9HVGd7U6zGUCvECtfnMs+0fQC1mZSjHuBiMn6hV0vd33ILu+VvuDjkEUvKzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2UOT7SgQjlxdHik2nb2Z5XwG4gW0CcHHTHYd1biwev8=;
 b=pl6MzSK+cZKYq5ht00ylvIdNmA/HZeUDfEsf1DjpRhbLZ5mni937wfJjdXu7SXPV9+yQR8jBcaGQJnfWYcXK4J7KCQGctfLwlD6c8sCCvhKRIHDO1yuMqqhbHyE/rqIuvC09ZxA3nlpbnWEjeueKHo4jkEV/cHco5WHvWEPGOfM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from DS0PR01MB8010.prod.exchangelabs.com (2603:10b6:8:151::19) by
 BL1PR01MB7649.prod.exchangelabs.com (2603:10b6:208:394::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.25; Thu, 5 Oct 2023 03:56:25 +0000
Received: from DS0PR01MB8010.prod.exchangelabs.com
 ([fe80::6a3d:61d7:133b:9eb9]) by DS0PR01MB8010.prod.exchangelabs.com
 ([fe80::6a3d:61d7:133b:9eb9%4]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 03:56:25 +0000
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
Subject: [PATCH 4/7] ARM: dts: aspeed: mtmitchell: Add LEDs
Date: Thu,  5 Oct 2023 10:55:22 +0700
Message-Id: <20231005035525.19036-5-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231005035525.19036-1-chanh@os.amperecomputing.com>
References: <20231005035525.19036-1-chanh@os.amperecomputing.com>
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0016.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::28)
 To DS0PR01MB8010.prod.exchangelabs.com (2603:10b6:8:151::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR01MB8010:EE_|BL1PR01MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: f066644c-6a42-4103-5f21-08dbc5570be2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	qvlh1li4iQiOuiua+oZZi52vmTqMNrvOavV7OLkWkYwblOp0wRFCxC1sj3BiN9fPrerFgRu62XM371MjFfMDOm/RQ6qfysWI+OYQsgR7NDvRAp7276oKrpsVlbY4tOISdmDL0/TVZ1bX5rS8TT08oUxGfn5IIJ/TjVQlKekinr+ePdpBJ6BQrGzfnqJwVBjzPb/u4GFxfKlTUOQ6He++IECC5gUMlyYamYrVTfYj+DJFxTxoveJtdsMBXRKDDm7l37mzqi75Ut371ScCnrYng9L7Nmhs0hisDNHATpBq8KPKA2MC+rZwx8SaQXB87leUWZvImfVm2iRnCGbE0UTrO2t2LU3G7LDwcX1PUogooiaw6OWpjXFVtgHUq2GkJQF/R70Hd5tv5CYkOGqetaphnpx9X5tkYmnJbbDSvERkEsygqc6o7KlEejX5ZniIl6/oZtQIzKG9KgoINSJ1mLx1GTWDx/BqDZMKj9IZog+TrcCttHN9YqDy4FJ8GAfk3eCLXd6/D9+bRyo6uzODxirNulWrNFBm5ZZPWv9h80Feaeg3mlvIvK2CDGCnJACShC8m0jTbZrfeqmrLuUvIrLPc0yqbpohRhh1UY6SXD0f1LTmvihL8y1uwY0Yy0H/nSOZSM50BAFMY19Ynip4jcQ+05Q==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR01MB8010.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39850400004)(396003)(346002)(366004)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(38350700002)(38100700002)(6666004)(478600001)(6512007)(921005)(6486002)(6506007)(52116002)(7416002)(86362001)(8676002)(4326008)(8936002)(5660300002)(26005)(316002)(41300700001)(66946007)(66556008)(66476007)(2906002)(110136005)(1076003)(107886003)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?zaUcyhGZIIaKBFVn7eAAJ/pTtrhGl0TkPJDeRqE1n7c6PMMkfQxIG2ujX9Ce?=
 =?us-ascii?Q?JQIrtv7cK9+0lchzXxsfkDFFSRPp+YhLJxT7nKjjY7h/nwazfZONbyyoMhHC?=
 =?us-ascii?Q?BXPg0pIKgFJ/wOmfzQ7HRE0n1SgkkC93B1JkxLoDybvPMvH8c6R82/3l6N4y?=
 =?us-ascii?Q?P8yCoy/RVWsYJ0RZcx/Q1v8X2CYD2cVCxGHbrtmBc7QNrNXefNsykBP2OI/8?=
 =?us-ascii?Q?8q0gDzokGVNGw7BehpD5KrlnnIwhfo//wQVeEo3V7kRubVwVVqMJjUMudYRX?=
 =?us-ascii?Q?w14JpqGWeQ/CDMSHc08mA0F4OWTzUbKCjkHW+ovHMCh8XUqpDKSwd+DhB3sW?=
 =?us-ascii?Q?hQO35ebsNvEierk3FRMzWusDx6WJSy4oOKTM6TchR5elDbqw2//fZi95t3kU?=
 =?us-ascii?Q?cDbGQbsMCg42UQXUFbDmw+N64fEnLijOUNt7J9ih1YoaHtdnxDPNtKMrhztI?=
 =?us-ascii?Q?SiFdlKVRGAUbbTHAvu824abnaDPELxbJlD27XVKzAEdQEw1MH655MWOKWd9d?=
 =?us-ascii?Q?dkCz8ADOP9SlDQn8cvaumL09/Snz1vF6DEtiIYwWVngjx/zkoiAE6cIhdLW3?=
 =?us-ascii?Q?mwHz3HRywNIUHe7WjElEKsnec6I4ujeE9MeclRhF4EvmHYrojcTKGifLOyk1?=
 =?us-ascii?Q?OkkPqccPJwKG5917x31JpOFRV3s+qW7X2/H5K7zsyhTY2+jk6YMjNWX73Nqe?=
 =?us-ascii?Q?Oh1SdnSs6s7Rjn95ifeRHIa81TLTpCZz1dQEYMe98p+GFAQhpnc7H4shLVHn?=
 =?us-ascii?Q?wK74CMZqBQ59OkLa3uCiOH4SGVgF3b6GlLduf2f0y4l1LdpL4+Fdwj8LA4Fz?=
 =?us-ascii?Q?o3Z+K9F4XBVag3SIEaIFe88icVaPXQlB6NwRzEJW9fcRje9yTU+D9NdoqNHC?=
 =?us-ascii?Q?937AP5lfaY5kcRNe8D6rfXOihYz8M6yDm7fyQ8y+2HhqSOX5RpUnXSw300Ss?=
 =?us-ascii?Q?8PY4Mg5YwOFMrQIuKyFpdLpPSQFlI0qDh/dudl93BG/0PLJH9zucS8GvSRyg?=
 =?us-ascii?Q?TJJ5UkMZY/SBTMb/49P2L39gmNhax4n9FE1K8e9Q+17aqwMR/vodXJRDbp8/?=
 =?us-ascii?Q?bPivmzgi04YdzkzzunycgOOc9AeUUWrALtNPoJLSCUIMXS4R6/v1CWCf2lb5?=
 =?us-ascii?Q?LfjXaHFu3/rftHrnfOMDN7VMd+CuEwllEuTsBgp4+pYerWaqGyUKPMnZ0gGo?=
 =?us-ascii?Q?ptZfJ2I/TxGuoWFYV2Js0igAhvUWy+4EmSZuFk5W23BlRmr4VWigZOVa8qFx?=
 =?us-ascii?Q?RFSEvHLgHGJQLOR19wBTtHCOYCNwwK1kBIlI25BghvyZcvVm1hkuMosFwSQU?=
 =?us-ascii?Q?wAQXDe03wF1I7E/F1Ub/w8vZFi5SysIv+FFRaCPTJJik1u5JFTcvSdbk25+g?=
 =?us-ascii?Q?BEdFNFd/MpHQYse15XTuZYewCHZzyeDS1Kwo4bnCoO2e/VQwwJgcGiGaS6ds?=
 =?us-ascii?Q?6jh2U96RnNlU+lj+mLdbAlcSS8OTWN5xDAVfl/DSqB6OCuAlGF6UxAUMfX3K?=
 =?us-ascii?Q?QYKvkzO1ztgJx/fduXU3zi+tVhrFttu2RARGp4YQ+Qa4qsTCQPr8qY9jkuyU?=
 =?us-ascii?Q?t3AOezwQ/5LEuJ1qMKzZiUXLN4IYYcyDKMcOc2gqUqDCAKG9u7Bj0RED3BJ/?=
 =?us-ascii?Q?zZ5ybGo3vo59prZa0Q2iQj4=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f066644c-6a42-4103-5f21-08dbc5570be2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR01MB8010.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 03:56:25.8443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hNfVkm+shQtQorvJ+SpxbvdplMWM331eQr+0db3mPojWE889ilRQ3EbXrny++3UpFHIdcBioIcWoFEGiMp0uAMZ5X4Ix80clLFgdiSy3S/ksI+FOllvvxyVs9VE0V6PL
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

Use gpio-leds to configure GPIOW5 to GPIO_ACTIVE_HIGH and
GPIO_TRANSITORY flags as a bmc ready led. The GPIOW5 pin
is reset when watchdog timeout occurs.

Configure the GPIOS3 to GPIO_ACTIVE_HIGH as an identify led.

Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
---
 .../dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts     | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
index b7c4f7cfad07..88693c2b2dbe 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
@@ -51,6 +51,19 @@
 		};
 	};
 
+	leds {
+		compatible = "gpio-leds";
+
+		bmc-ready {
+			gpios = <&gpio0 ASPEED_GPIO(W, 5) (GPIO_ACTIVE_HIGH |
+			 GPIO_TRANSITORY)>;
+		};
+
+		identify {
+			gpios = <&gpio0 ASPEED_GPIO(S, 3) GPIO_ACTIVE_HIGH>;
+		};
+	};
+
 	voltage_mon_reg: voltage-mon-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "ltc2497_reg";
-- 
2.17.1

