Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1F35B95EF
	for <lists+openbmc@lfdr.de>; Thu, 15 Sep 2022 10:09:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSqcT4V2lz3bkR
	for <lists+openbmc@lfdr.de>; Thu, 15 Sep 2022 18:09:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=HfDckRdp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.212.103; helo=nam02-bn1-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=HfDckRdp;
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam07on2103.outbound.protection.outlook.com [40.107.212.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSqbt0W5bz2yyd;
	Thu, 15 Sep 2022 18:09:12 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G3MhUnRJW5HlyTbcPewpsTBvbpTtUr7UnQfWVVo22mYt8RXbZzkMshJwnnMbI/odRGmtSZfivg6sjcwTGSkNupxze3oZLNoPfJTqxj+pAmRsE5cKTudKKUbgE5Rwr8v6xUda5bwsN8SpHYyYdE/ykJ3UvQqQI/98ibjbgBl/831XjfBf364CnmQUhxKXaiHCcrj9v9rV1VaD66z+RnxELArA8hg3dgLa3UZbO04HVYtj4dS/75AYl3pAbE+IpVgxQEcKIxbRsMrdviOEvhhjpPkJCbG2HlO3k6WhJitKwnY07TFz70YRU6+/sPjR+WAU8SuXKhI57VU/bOsng2WioA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gwDtrbXnF/HBvWWEXc8oIMUoljMs18vjbVOMCvk9H1M=;
 b=j1Rn5bRmDkckxOLLzJOxH9zKnQNtla9Sxh1j8qOQ9Kn+FWb+1aAVYVio5HS6R38gq5b+T58dPcxJGL01lrFqdC/bEtjUvzODhnIxZf49wbmSPwWCn1z0AKL1hQTOresgd/oNsi5R+JlAoPipcDQ3SYuEz2ZQzuLQn0orVRmHyl6tW3Rhv/5nSwwn/qRaD11TNWE/k+t+Wo+p20ukanadk810/kdBqu75ZoAVnfnuCeDZzwB/H3kbf5Zv7g+MTuNem53WifncZD9C8OnEkM1IgXAPU25o7tvv18f419Y1SWcfMRshZ8lt/CsJcDpKrnPBTJMtR2lekq0mCyxuaN5q/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gwDtrbXnF/HBvWWEXc8oIMUoljMs18vjbVOMCvk9H1M=;
 b=HfDckRdpDYEk5i50zdxvBhu/VEjIAbYGWO4w/sQKhJhOqtCoxS450CFFdYnFDtiZNqlMCda2fRKgEof6rWknvJ1m6gdmAtPa47mJtVaNnWqltsQYL0rVxcU00fTS0+IOaFtP9LQDKTnajOu/ZH6sa9BUkKef79OJYjE+QDA+7ro=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 MN2PR01MB5919.prod.exchangelabs.com (2603:10b6:208:188::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5632.15; Thu, 15 Sep 2022 08:08:50 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::48f7:ac49:a2f8:614e]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::48f7:ac49:a2f8:614e%5]) with mapi id 15.20.5612.022; Thu, 15 Sep 2022
 08:08:50 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Open Source Submission <patches@amperecomputing.com>
Subject: [PATCH] ARM: dts: aspeed: mtjade: Remove gpio-keys entries
Date: Thu, 15 Sep 2022 15:08:28 +0700
Message-Id: <20220915080828.2894070-1-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0218.apcprd06.prod.outlook.com
 (2603:1096:4:68::26) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR01MB7282:EE_|MN2PR01MB5919:EE_
X-MS-Office365-Filtering-Correlation-Id: feb58148-2643-448e-1ae4-08da96f1856f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	fnRBP3b7JWRjcuZ4QSpSOjxR9l7uGeqhRA358ZXjXE3xYoAyLpSwq3ccGCTHHeWsyanNNuCxReyTAOjj83DatBP9mwcxFRPr6VQnFqJ/Rs0orEZhalq565bpfAPidvGcSVXLjqESyBWv/4J+a0UJcAxqkLtE90KL2KSonwIuQD11MLrF02zY1kHnYGISjjM/Q16aM7Y/baIXMxewr4DqpY5ch9SoullSpgKGVtcBnNOzXQgtqpN5EKDH5BMAFEhW2k4pjQPPmJXS5tfSNSFI0J7Vq/ShIi6S9ytLndal+RnBdlLWjPUqoxWOBGJTVgaw/9asZ9Rbp+wVE8i8sTk+jqLb9HvEt7UOjZd1Klc43Go3Fqowpg5UBBcqV+Oof7FZ3rSI21jkg0ZfUtAOJhEHAGFdKcGP/xVpYY7Bjfc3uXFTcit3nUpNYz+GBez4djgacKf4ZonXyAIrr5L0PrdSeXt4+SfMzElAgz9w4AovnSLdpGl1FQe+TKwNDXxd6+AsRNN919+GOfg3cJUubhBtMhP8SrZEQg4ho6xh0KeIcnvSLxDWNZeqdgpVe5p78PvbM+oexoVGjUdLSuYlZIAyyTws538lkSBPBPM1ghouEO/KazHBikSr2FhcRy8Z+K5kSTE7jKGDXmvSwCgl/A9B/+WRkc8Rwnp8l/qqChKVeeynUiQ7i4T8avaMCqzrQHauDTk34J69DRLFcZoqr4eNBXs+IR0Rx3qMvcSc6CXksdUtZF+4sedrZgT6o/cIoEKrYf/EuW21XG5Hfkhv2tYATKqbMoBUx/2yote0pgrYzT4=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39850400004)(366004)(376002)(136003)(346002)(451199015)(8676002)(4326008)(5660300002)(66476007)(8936002)(66556008)(66946007)(54906003)(110136005)(1076003)(2616005)(316002)(86362001)(6486002)(38350700002)(2906002)(478600001)(38100700002)(83380400001)(921005)(186003)(41300700001)(6506007)(6512007)(6666004)(26005)(107886003)(52116002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?lzM7tKjja2OefCPrOwqYDsgpsmIISAezf7ba3O1j+loWlrynN8clx1c+xh3d?=
 =?us-ascii?Q?58Ux+UzspxFv0eTf/6Itm8Kcba5w12qGb13VnZS29kqiN/IsJDm6CHEvIrSw?=
 =?us-ascii?Q?/m3KwKIcOygWGExKK2WWpCvmhR1XWwTFPxol3KAqOhZ3WqDSNWD4I4m3D0GL?=
 =?us-ascii?Q?FkvjFIisxbCZu6fesMnWKFxldeTRJBg3KAYP8JSiF4tm4ZjY8JYfqMJ6txbI?=
 =?us-ascii?Q?p0teyVpJ41jsZFHEnz4xBTHtENXrZOV2dagQ8KAirV5eSPPG462NleRiH2vs?=
 =?us-ascii?Q?tvni6PqqQ1VV/QhOQtIoAow3leXviqnt9QYn5Vb2rICODdk3nS4Zo+VQP0wU?=
 =?us-ascii?Q?nOkqymSsfz2kI0pQjh6/o78Piz+Geh+p8cjOvpLX2KkQymFQJUdHR1U/Y8sd?=
 =?us-ascii?Q?S1qTG+RDw2zcflXk/JSIwNx1xQNiWarXXNqT+6I8u0BaLEOra3mpG4bbqBlt?=
 =?us-ascii?Q?fnmNXlTd4FdyLLVuRbA/TOPoIzlPKRpn9Z+Ia5Z0V5CLdIcMrn7laddI49wz?=
 =?us-ascii?Q?C7BMqSc67MR5NssUGSPAPzuuCIigwq5NtYlC/Gov1QqXFWL0Ot5tF8y4vlHu?=
 =?us-ascii?Q?fei2VMrbGqhM1EFpp0Y8Akgp2GomSFg+/wVhjqdI8VVCVlEVV8UkZCb+oz5c?=
 =?us-ascii?Q?leT1w5jHKLNEqf93j2UuGqhMI4nCddwvoVlGrU7JKoymj+TMBPAM0Im/ifG6?=
 =?us-ascii?Q?+Mh5wtrDd1nXjZAGjCvBpuAzNe/U4oIPwZNdFyqYdK1/zbDPUhJyFjLWnMKG?=
 =?us-ascii?Q?IpwDzWZoAqNqWaM59VSZ4chjo8xW/f/6q2KsZoqLq5nxSGqofKOFT539M4la?=
 =?us-ascii?Q?qbpJKeO/0ZWXemenabCWZ/U8WncF6Gk1kDeIuMX0EBdSZ2ZQ6ynqeiQhvn59?=
 =?us-ascii?Q?rOxE+9dmOK2HK0yxVRZbLL0tPYbQGabKjPS/Y7I7kXzJKoA3dPdRISQ0K+Eh?=
 =?us-ascii?Q?aKbTYSm410pFLilueAoJD0+rAc+YuIGNzNcN23GKduZ47+4vS2p4OZ5KiL6e?=
 =?us-ascii?Q?YJz4MGXT1mdvQ8qe17Gk3718h3as8RtsWKUzPZZGjWI+9Lx1zJlc3fkpY2Bn?=
 =?us-ascii?Q?+YKiE5VipqQ/0wXgsevNbRgKa/X2/5x+xI5FmzA8b+oDS4B62Ox+sh9mCSDh?=
 =?us-ascii?Q?lHbrLpysEGPal8R0FToIY4kVotYci4GkBa0cNTB4o72e0wgjlGGcmHtP4K2b?=
 =?us-ascii?Q?g6yG8xaBtq0NRlRT3XDdyhk/vPSmPsfOQMZ0qTPFLOs16m4+s0a/Zet4ar9R?=
 =?us-ascii?Q?WzULoap4jKmQg1Ea1QetZX1RWyjbsnnKdAHKHTh7f7C0I/aIxXMspgvALS6F?=
 =?us-ascii?Q?lg9jXXRiXM9D53BN/sjbHVVRfnaEj+Md82Eub9W7nw/C96zBCYwxthwBjzrC?=
 =?us-ascii?Q?65fkRxHLLN2DuWlx+lOWQW0sUojwzm82rD352PqbF6TVrv+y8xqg4ThXcsgW?=
 =?us-ascii?Q?otHgN3/tx23ATSzBnAfarJG4/+aZAvgTYkXk90IpCi463mBO5b1tqQfgT0OD?=
 =?us-ascii?Q?qRNGzNGfX0B3u291NGA7Z+dwkrYY6hRq1X/c8922xqZzZrs1V5OAIwiiSuEb?=
 =?us-ascii?Q?NFqjYn8ApIyXoxmJHfoM59Ttw2OjVah8pYM+RCbRx3VxJrFhzZkGc9XU2/uw?=
 =?us-ascii?Q?1VyyPwLEF/3f0vjHE1OGcco=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feb58148-2643-448e-1ae4-08da96f1856f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 08:08:50.3156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oKij1w1APx26v4sMgPOmYcpcX4wXdL6BdbS7bzVFuLitzqSkfwiGRIgVdSLyAtdi617heKoF5AphOKoUAwGzCsl0FbNSX3zlj7B7r3107PY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR01MB5919
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
Cc: Thang Nguyen <thang@os.amperecomputing.com>, quan@os.amperecomputing.com, Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Remove the gpio-keys entries from the Ampere's Mt. Jade BMC device
tree. The user space applications are going to change from using
libevdev to libgpiod.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
 .../arm/boot/dts/aspeed-bmc-ampere-mtjade.dts | 95 -------------------
 1 file changed, 95 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
index 82a6f14a45f0..d127cbcc7998 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
@@ -97,101 +97,6 @@ identify {
 		};
 	};
 
-	gpio-keys {
-		compatible = "gpio-keys";
-
-		event-shutdown-ack {
-			label = "SHUTDOWN_ACK";
-			gpios = <&gpio ASPEED_GPIO(G, 2) GPIO_ACTIVE_LOW>;
-			linux,code = <ASPEED_GPIO(G, 2)>;
-		};
-
-		event-reboot-ack {
-			label = "REBOOT_ACK";
-			gpios = <&gpio ASPEED_GPIO(J, 3) GPIO_ACTIVE_LOW>;
-			linux,code = <ASPEED_GPIO(J, 3)>;
-		};
-
-		event-s0-overtemp {
-			label = "S0_OVERTEMP";
-			gpios = <&gpio ASPEED_GPIO(G, 3) GPIO_ACTIVE_LOW>;
-			linux,code = <ASPEED_GPIO(G, 3)>;
-		};
-
-		event-s0-hightemp {
-			label = "S0_HIGHTEMP";
-			gpios = <&gpio ASPEED_GPIO(J, 0) GPIO_ACTIVE_LOW>;
-			linux,code = <ASPEED_GPIO(J, 0)>;
-		};
-
-		event-s0-cpu-fault {
-			label = "S0_CPU_FAULT";
-			gpios = <&gpio ASPEED_GPIO(J, 1) GPIO_ACTIVE_HIGH>;
-			linux,code = <ASPEED_GPIO(J, 1)>;
-		};
-
-		event-s0-scp-auth-fail {
-			label = "S0_SCP_AUTH_FAIL";
-			gpios = <&gpio ASPEED_GPIO(J, 2) GPIO_ACTIVE_LOW>;
-			linux,code = <ASPEED_GPIO(J, 2)>;
-		};
-
-		event-s1-scp-auth-fail {
-			label = "S1_SCP_AUTH_FAIL";
-			gpios = <&gpio ASPEED_GPIO(Z, 5) GPIO_ACTIVE_LOW>;
-			linux,code = <ASPEED_GPIO(Z, 5)>;
-		};
-
-		event-s1-overtemp {
-			label = "S1_OVERTEMP";
-			gpios = <&gpio ASPEED_GPIO(Z, 6) GPIO_ACTIVE_LOW>;
-			linux,code = <ASPEED_GPIO(Z, 6)>;
-		};
-
-		event-s1-hightemp {
-			label = "S1_HIGHTEMP";
-			gpios = <&gpio ASPEED_GPIO(AB, 0) GPIO_ACTIVE_LOW>;
-			linux,code = <ASPEED_GPIO(AB, 0)>;
-		};
-
-		event-s1-cpu-fault {
-			label = "S1_CPU_FAULT";
-			gpios = <&gpio ASPEED_GPIO(Z, 1) GPIO_ACTIVE_HIGH>;
-			linux,code = <ASPEED_GPIO(Z, 1)>;
-		};
-
-		event-id {
-			label = "ID_BUTTON";
-			gpios = <&gpio ASPEED_GPIO(Q, 5) GPIO_ACTIVE_LOW>;
-			linux,code = <ASPEED_GPIO(Q, 5)>;
-		};
-
-		event-psu1-vin-good {
-			label = "PSU1_VIN_GOOD";
-			gpios = <&gpio ASPEED_GPIO(H, 4) GPIO_ACTIVE_LOW>;
-			linux,code = <ASPEED_GPIO(H, 4)>;
-		};
-
-		event-psu2-vin-good {
-			label = "PSU2_VIN_GOOD";
-			gpios = <&gpio ASPEED_GPIO(H, 5) GPIO_ACTIVE_LOW>;
-			linux,code = <ASPEED_GPIO(H, 5)>;
-		};
-
-		event-psu1-present {
-			label = "PSU1_PRESENT";
-			gpios = <&gpio ASPEED_GPIO(I, 0) GPIO_ACTIVE_LOW>;
-			linux,code = <ASPEED_GPIO(I, 0)>;
-		};
-
-		event-psu2-present {
-			label = "PSU2_PRESENT";
-			gpios = <&gpio ASPEED_GPIO(I, 1) GPIO_ACTIVE_LOW>;
-			linux,code = <ASPEED_GPIO(I, 1)>;
-		};
-
-	};
-
 	gpioA0mux: mux-controller {
 		compatible = "gpio-mux";
 		#mux-control-cells = <0>;
-- 
2.35.1

