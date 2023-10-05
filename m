Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C583D7B9A88
	for <lists+openbmc@lfdr.de>; Thu,  5 Oct 2023 05:57:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=Y25FkCYi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S1Hp55lYvz3dfg
	for <lists+openbmc@lfdr.de>; Thu,  5 Oct 2023 14:57:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=Y25FkCYi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe59::705; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20705.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::705])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S1HmL6Hd5z3c8c;
	Thu,  5 Oct 2023 14:56:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MOAJS1g530kjtnIU81bWERyJOxzCO1LoPMOb8rQ+6F7rFBdSEUWLKRseStf14ZLrOpUENP0qujX8Y4jDwSHCCKlU/0MSvW70wdsjPEgdgQxkEY+kKM3v22TLIiP6JC2YEC+uGs1R4Oncwljov6FdsWXDN6adfvcwfM12YVrPryP+2HbhGRq+66bhdDybEExP5I4peT47bOt7jlPqti8kSE2OK0Y7LGbb0QHILsU4q59+kfrXk+RsMWuYmIzbqMK6BOMPhMb/aFeqbLI/MURm3o/XgA3tDHm6ej3KGIYO9x+CwF17C/FV+OaHHtXQLLI565FBtDP/jv2yAc191pA+3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e8NbKW+afFd5BIlOfUO9CN82XK58ZXuR/m2S1+hxk3I=;
 b=enTrBhQBuhXECxKsDeMjfr6LkPQegG7LsbroN4kPII+OihrCsWuqkBnCbrz/iR9d7XykrC7zpZKdCU7beI3zzmHnKaZ31jwP1nFAP5MCUcf0g915PId0X/JOtPFrOO9B+fd8WBAf3qgTI0Z06DTFSK2+UYGK7Yc9kORXTz0GoQ4GH9wY6RrpSdQ59ZOEh5bLPExcvMltZ9QtPjb4s/6U7uWz7zEy7rjYvn/3MdT9yJKruOHGYHNDjBO85+bz3DQ96dME+MdN36p0mLoc6SAoBwcdWt0wLagSZuutWgwdQzmvy1ergAZkzM6MlK5zJjaSZUqzVpgyKdJHxpOg0akqIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e8NbKW+afFd5BIlOfUO9CN82XK58ZXuR/m2S1+hxk3I=;
 b=Y25FkCYiQg615TZa9avwSvOnz5h5quoL880wiv0L+pXUNqAHom5dF5ZCYi/xy4j8v91lnMFCtb+Cd6dGnP4gZI+QJReHOS0KJZ2S7QRiUWrHS32pPJIfQJNKJJRkxjYov0SRCuhGF4FFyzPT8NAr5nu15O/53PA/fyRtTFNFnt0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from DS0PR01MB8010.prod.exchangelabs.com (2603:10b6:8:151::19) by
 BL1PR01MB7649.prod.exchangelabs.com (2603:10b6:208:394::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.25; Thu, 5 Oct 2023 03:56:04 +0000
Received: from DS0PR01MB8010.prod.exchangelabs.com
 ([fe80::6a3d:61d7:133b:9eb9]) by DS0PR01MB8010.prod.exchangelabs.com
 ([fe80::6a3d:61d7:133b:9eb9%4]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 03:56:03 +0000
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
Subject: [PATCH 1/7] ARM: dts: aspeed: mtjade, mtmitchell: Update gpio-line-names
Date: Thu,  5 Oct 2023 10:55:19 +0700
Message-Id: <20231005035525.19036-2-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231005035525.19036-1-chanh@os.amperecomputing.com>
References: <20231005035525.19036-1-chanh@os.amperecomputing.com>
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0016.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::28)
 To DS0PR01MB8010.prod.exchangelabs.com (2603:10b6:8:151::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR01MB8010:EE_|BL1PR01MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: 91c5531d-ccef-4183-9201-08dbc556fecf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	22kRoacU9Kl6za9gzr1hJPusDKWICfMdo+Y068z3n+tXA2kLh2bELU3kAqGBAMqO7IYS+8yY4Lf+3B1K+5cCawVVJBCWagA9d3Y/qAJ9r+tocc2wmCB0iYfnZVzbmbaftm03k7c4ZTWg6WQKvxDPlYwXWPcA3aD71S6iS4W3sFD7mHJV0m517UHG59p/BVOKk18p1hhaUsXGQX3gEASFYpXgc/RnHGknhd0q+pjV4N16NshAMLp0kuytsn2T9yeyobvxkc3rOWn/GeKK2167euZyIGlAv27HRWQwQQ8Qs9G2VnAIIE83uNzPerOdNmIjsOTHlvDVB5doyv5B6uQDv7Z84L2aNSqNX0Fbu6ZTWZ93qox4OKnNtc0v3ZnWDV4x04kybUwlXwGKz45cH5WwmQ6Iwn0CypVTxFQ0EG8ygQWggDtl+wcz/g+Ld28qu3DlW4FGKGpBlop0LBBLKnVUKOzH3geQ9GfMY+ichFOzfqnzdutPqqF3r3O9vJWgcvtzHmjr0OQeXRz1gfxkSzLqj6HuFIsJq0AhY5ZbffnpHnSG0OrmnnsdsR9V/JkfMLaTFF1ThxjsHHQWH8Oz0JNq5EXadp1MJlAiGZVjYgpqO8RWif7ylLLuzw77p9mRYTtUtUnSY0whtvIlJlvOzoM1dA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR01MB8010.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39850400004)(396003)(346002)(366004)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(84970400001)(38350700002)(38100700002)(6666004)(478600001)(83380400001)(6512007)(921005)(6486002)(6506007)(52116002)(7416002)(15650500001)(86362001)(8676002)(4326008)(8936002)(5660300002)(26005)(316002)(41300700001)(66946007)(66556008)(66476007)(2906002)(110136005)(1076003)(107886003)(2616005)(449214003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?2L39HRUMTjvIwVg58IEeZlzaE70jzoRU9FTKzqOdsl3O05Z5E8+rTWnxp9zk?=
 =?us-ascii?Q?FlikTP2KB0yTw4VxIqS8ehgZZvJLIjNFxx4s2J7FK8qt1oG9RFH7xuC0jp5X?=
 =?us-ascii?Q?2Qqz8UGMR+CJtl50L8RJgXd7HxK6+mWwONncvVOytsTXcv8f7QPeL8mMyYBJ?=
 =?us-ascii?Q?MMi4XaBrtJyua5f4YX6cZjk04Ci/t//RnbBecSZRIdWRzLbz1QNQawMGkD2N?=
 =?us-ascii?Q?rRP5jJgZfAGz816wmYRpgua8J2l2P0QHe+5cTC0bCIATRODk/Ulwp1TR6qrO?=
 =?us-ascii?Q?HC7qcX4DVHVGfg5pdhuGTOQ+IJUB7hlyknG4wrJpipJ8l4jUjK8GJRA0QJgq?=
 =?us-ascii?Q?vK6snjdDlFqMhFqLypPuhkxcl/z98RfroPnoguRDvjzyn7zyEunyWoJIGKgG?=
 =?us-ascii?Q?hl6FSYTlfwTqQCa8M/PohuCo5D4MtmsM3OQlFml7YXTPqaEv0MyPFAQM0E7c?=
 =?us-ascii?Q?szLNE4NNNLVA26Palf+s4DCIStGYyYNHeFVHR1UuKLmTwtiWoVkPGP8O7oPF?=
 =?us-ascii?Q?QIXAoNCUOwVNl7g/bbxCeSmDSOyXtgztjyZBQYLauPX804C65HDZVP+2eGFy?=
 =?us-ascii?Q?dV9iZn12V981dnqOXOUDx7zROSUQwFo9H+408DT14mjIP1zGxl6tuaqaAz7s?=
 =?us-ascii?Q?1+hkdgHS6OxNrOZszqP73B9KpSpCAcQ3ZNBy/sIwdBeia/vMrHbtrzs71ekT?=
 =?us-ascii?Q?o0zkINiGKwAgOROeNPAsIkNGx/PvM2qeQCGssxKx7lxvUyytR+mtMASKcatt?=
 =?us-ascii?Q?1KIa/N9OOPIoxhUBB8IVu4Q4hsFAubOAqbVrWJzU5Nq1vaU9pGBMMU207qME?=
 =?us-ascii?Q?lfJlcGgLRsRm8r3FVVP58bQ0zLCxK+nTaYyCYCW2HOhv8EpL9pab/aOSRhdm?=
 =?us-ascii?Q?nPi+qWeqouYRTV6fg3560ZoNKJyyY9I1WjYOqkXVMvBHgrotBvgPQ9t7W+w5?=
 =?us-ascii?Q?pRD0Gy/m9pOu90Y1dxSK7rbt6kKNhT7rlhRbCqgIqd4dWdpBgdxzBbZ7ud1u?=
 =?us-ascii?Q?xyU2ibO/XSMmVw3GjBkXcMSCiQiaTXr2bWc0SbpCB3sYs8qtl2DshdFnvOST?=
 =?us-ascii?Q?wqoOYDpHr7Mv2hwE0u5vI5JOF3kXHrobTTFV2wtU+Tj1Qsc1Xf2AzJuuH1Fh?=
 =?us-ascii?Q?TwQYI83CHof7pCV2OWujybhvW9TwAeo+ljmW+gCqRX77BGEBOxuNd2Wpa5hv?=
 =?us-ascii?Q?oq0el1Gqv08d7EALck6Ahh8AaiM8CLuya4WzqcrEPw9WQ4dWirJ3+M0MXUhf?=
 =?us-ascii?Q?8ZOTwCJToOAFUWqnU6x1ZOMWEBopGhrm8BywHU1X/tqV+OXAqJnm8S/9xeAe?=
 =?us-ascii?Q?QZCKz4QwJd6FYK/cV0mD3A+SNydlFZjQR3Q8pNitoM+6Mm5axnnKQL6SFcgc?=
 =?us-ascii?Q?MPM16GU8DHU1mN8H6YDZrJgtLoW2iMoqfOEmr36z5QWlwDHI+AWml0zF4sUB?=
 =?us-ascii?Q?1yGvz17CjMXDUYMM0OnMfe7MJjGM4QZjigJMW/jXaxBSUmzKHo2gIJ24z0dC?=
 =?us-ascii?Q?4EOdZ8GQY+ueQBduX2bTF8pgCTLmIEYuY/s2C8VqZcbDndfzBbLb1sU1VnHQ?=
 =?us-ascii?Q?JwadPFaKfI/KjwePMWg54fV3vnCuSxoUnMb51OsfapML4cnQMHE6Nnon82GI?=
 =?us-ascii?Q?JOTxmcNUB59jYovc1cDECNU=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91c5531d-ccef-4183-9201-08dbc556fecf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR01MB8010.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 03:56:03.8925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sk3/yaBzXFIuDHpVPXT7rJ4TqpE2iTOm+CTGzS/yN34j2FnFvLp592EkmdLLpu41qkJ+7HNWgzIkoKf3mL6wrOKUN1OtIALa90nxYcPd3OfvoRrZb7jfFMO8sJ8Wc80d
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

Update GPIO line-name to follow naming convention specified at
github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming.md

Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
---
 .../dts/aspeed/aspeed-bmc-ampere-mtjade.dts   | 42 +++++++++----------
 .../aspeed/aspeed-bmc-ampere-mtmitchell.dts   |  6 +--
 2 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dts
index 0a51d2e32fab..e57efcc8522a 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dts
@@ -760,30 +760,30 @@
 
 &gpio {
 	gpio-line-names =
-	/*A0-A7*/	"","","","S0_BMC_SPECIAL_BOOT","","","","",
-	/*B0-B7*/	"BMC_SELECT_EEPROM","","","",
-			"POWER_BUTTON","","","",
+	/*A0-A7*/	"","","","host0-special-boot","","","","",
+	/*B0-B7*/	"i2c-backup-sel","","","",
+			"power-button","","","",
 	/*C0-C7*/	"","","","","","","","",
 	/*D0-D7*/	"","","","","","","","",
 	/*E0-E7*/	"","","","","","","","",
-	/*F0-F7*/	"","","BMC_SYS_PSON_L","S0_DDR_SAVE","PGOOD",
-			"S1_DDR_SAVE","","",
-	/*G0-G7*/	"host0-ready","SHD_REQ_L","","S0_OVERTEMP_L","","",
+	/*F0-F7*/	"","","power-chassis-control","s0-ddr-save","power-chassis-good",
+			"s1-ddr-save","","",
+	/*G0-G7*/	"host0-ready","host0-shd-req-n","","s0-overtemp-n","","",
 			"","",
-	/*H0-H7*/	"","","","","PSU1_VIN_GOOD","PSU2_VIN_GOOD","","",
-	/*I0-I7*/	"PSU1_PRESENT","PSU2_PRESENT","S1_BMC_SPECIAL_BOOT",
-			"","","","","",
-	/*J0-J7*/	"S0_HIGHTEMP_L","S0_FAULT_L","S0_SCP_AUTH_FAIL_L","",
+	/*H0-H7*/	"","","","","ps0-vin-good","ps1-vin-good","","",
+	/*I0-I7*/	"presence-ps0","presence-ps1","s1-special-boot",
+				"","","","","",
+	/*J0-J7*/	"s0-hightemp-n","s0-fault-alert","s0-sys-auth-failure-n","",
 			"","","","",
 	/*K0-K7*/	"","","","","","","","",
-	/*L0-L7*/       "","","","BMC_SYSRESET_L","SPI_AUTH_FAIL_L","","","",
+	/*L0-L7*/	"","","","host0-sysreset-n","s0-spi-auth-fail-n","","","",
 	/*M0-M7*/	"","","","","","","","",
 	/*N0-N7*/	"","","","","","","","",
 	/*O0-O7*/	"","","","","","","","",
 	/*P0-P7*/	"","","","","","","","",
-	/*Q0-Q7*/	"","","","","","UID_BUTTON","","",
-	/*R0-R7*/	"","","BMC_EXT_HIGHTEMP_L","OCP_AUX_PWREN",
-			"OCP_MAIN_PWREN","RESET_BUTTON","","",
+	/*Q0-Q7*/	"","","","","","identify-button","","",
+	/*R0-R7*/	"","","ext-hightemp-n","",
+			"ocp-main-pwren","reset-button","","",
 	/*S0-S7*/	"","","","","rtc-battery-voltage-read-enable","","","",
 	/*T0-T7*/	"","","","","","","","",
 	/*U0-U7*/	"","","","","","","","",
@@ -791,18 +791,18 @@
 	/*W0-W7*/	"","","","","","","","",
 	/*X0-X7*/	"","","","","","","","",
 	/*Y0-Y7*/	"","","","","","","","",
-	/*Z0-Z7*/	"S0_BMC_PLIMIT","S1_FAULT_L","S1_FW_BOOT_OK","","",
-			"S1_SCP_AUTH_FAIL_L","S1_OVERTEMP_L","",
+	/*Z0-Z7*/	"s0-plimit","s1-fault-alert","s1-fw-boot-ok","","",
+			"s1-sys-auth-failure-n","s1-overtemp-n","",
 	/*AA0-AA7*/	"","","","","","","","",
-	/*AB0-AB7*/	"S1_HIGHTEMP_L","S1_BMC_PLIMIT","S0_BMC_DDR_ADDR",
-			"S1_BMC_DDR_ADR","","","","",
-	/*AC0-AC7*/	"SYS_PWR_GD","","","","","BMC_READY","SLAVE_PRESENT_L",
-			"BMC_OCP_PG";
+	/*AB0-AB7*/	"s1-hightemp-n","s1-plimit","s0-ddr-addr",
+			"s1-ddr-addr","","","","",
+	/*AC0-AC7*/	"sys-pwr-gd","","","","","","presence-cpu1",
+			"ocp-pgood";
 
 	i2c4-o-en-hog {
 		gpio-hog;
 		gpios = <ASPEED_GPIO(Y, 2) GPIO_ACTIVE_HIGH>;
 		output-high;
-		line-name = "BMC_I2C4_O_EN";
+		line-name = "i2c4-o-en";
 	};
 };
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
index 0715cb9ab30c..2f571b43106d 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
@@ -599,17 +599,17 @@
 	/*Q0-Q7*/	"","","","","","","","",
 	/*R0-R7*/	"","","","","","","","",
 	/*S0-S7*/	"","","identify-button","led-identify",
-			"s1-ddr-save","spi-nor-access","sys-pgood","presence-cpu1",
+			"s1-ddr-save","spi-nor-access","host0-ready","presence-cpu1",
 	/*T0-T7*/	"","","","","","","","",
 	/*U0-U7*/	"","","","","","","","",
 	/*V0-V7*/	"s0-hightemp-n","s0-fault-alert","s0-sys-auth-failure-n",
-			"host0-reboot-ack-n","host0-ready","host0-shd-req-n",
+			"host0-reboot-ack-n","s0-fw-boot-ok","host0-shd-req-n",
 			"host0-shd-ack-n","s0-overtemp-n",
 	/*W0-W7*/	"","ocp-main-pwren","ocp-pgood","",
 			"bmc-ok","bmc-ready","spi0-program-sel","spi0-backup-sel",
 	/*X0-X7*/	"i2c-backup-sel","s1-fault-alert","s1-fw-boot-ok",
 			"s1-hightemp-n","s0-spi-auth-fail-n","s1-sys-auth-failure-n",
-			"s1-overtemp-n","s1-spi-auth-fail-n",
+			"s1-overtemp-n","cpld-s1-spi-auth-fail-n",
 	/*Y0-Y7*/	"","","","","","","","host0-special-boot",
 	/*Z0-Z7*/	"reset-button","ps0-pgood","ps1-pgood","","","","","";
 
-- 
2.17.1

