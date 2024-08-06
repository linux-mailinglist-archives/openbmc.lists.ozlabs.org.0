Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F19948A0F
	for <lists+openbmc@lfdr.de>; Tue,  6 Aug 2024 09:25:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=nFpv9vL4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WdPw33mW8z3cmV
	for <lists+openbmc@lfdr.de>; Tue,  6 Aug 2024 17:25:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=nFpv9vL4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:c001::2; helo=sj2pr03cu001.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazlp170120002.outbound.protection.outlook.com [IPv6:2a01:111:f403:c001::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WdPnh2qBBz3cyd;
	Tue,  6 Aug 2024 17:19:36 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zEDhX6QKiWWylweNHYpXqMghzl9TAAfyc8RNVdtPHmttZuoEhq2X7P+E8BjalUASd6hmGt3/Cp4aIFQQNF/ehVlq2GNYg5qszradhi9FwvvK/LavNUDnPvjgL1+71tj6JjSlFUzSDt57bCj8WI3oT1uS1JexOJ1PvTgtaASA/bisekIDjkd7jS+1IkEtY7Gz6W1lQRjD0RxGR+ahh09K4fAa2pGksEzHQkOXQnhOaQBAqdmqRhum5KE4kRi/hELqfoBFNH4pmT+EvEUxWVp6VZi6CIfY8f+tc2NL8IIRTu31jGx9JKUmB9Hd1eIOxSdmmTu51LyIark/Fvp/7e3qcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/8fTsT/wmD3e7P8bdlXQ3b8HcpK52Ulj5xajjrlW/EQ=;
 b=cWKGewA5xF3W12zD0MHjOlQpDKT/PkTX5tK2WMABIajMeB0riyhvl1jmbFjEtQuNg8eM5cfO/TM3FeiYldTiLjhzw+zimlPA6aJJdYu0TxzQiXLXLXs+JFMAOq1sOQSvjwLnebdB6VWy9p+x7oMCjhnpDp+4PDIrCuntaJo4Ig00igouIvYmZX6ZQcRwVfYH3sJFloEgAcE/7Hem8AuHipTSjqikxPWhSv5bFSf+q9P+MEaxrbhblL7m+xfnrACDyhBx45f2tnmSijFMCwYyh9Isj9ieENYggXQiZg0qXdzkVVgVTwh2+pjaSmdU3bbhzjrj4YFvvY9WCgIKrq6gTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/8fTsT/wmD3e7P8bdlXQ3b8HcpK52Ulj5xajjrlW/EQ=;
 b=nFpv9vL4f4rs3K0xcXj3zL2dNMQrNyJSZ4uAu8BRs/yyvkqXVpLMrKVvttqvI973A8/FvloE8OUE1o75xrmsMwcyYgzNbMee/gn27vzfJa5sOl8N3qArQgelBwExNYbvCDGco5PZocXC1HKoZeKXhXUi/eexIysHdaTXKp+h/4c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 BL1PR01MB7770.prod.exchangelabs.com (2603:10b6:208:399::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.25; Tue, 6 Aug 2024 07:19:14 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%4]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 07:19:14 +0000
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
Subject: [PATCH v2 5/5] ARM: dts: aspeed: mtmitchell: Add LEDs
Date: Tue,  6 Aug 2024 07:18:06 +0000
Message-ID: <20240806071806.1666550-6-chanh@os.amperecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: 70542a14-725a-44de-c47b-08dcb5e8130e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?cvJSEjo2OvJdrSE9qhmBHMuJ0cmuJ04+pQFTfSHcwbsZRym9wBrv4RjuwUL4?=
 =?us-ascii?Q?cYfVtlr9i5qafnaI6w9I57H+LvW3IEQP/UDXRL6cjWoL/z0B2sYFssQocuCS?=
 =?us-ascii?Q?DjjGTS1lmHx5lEAt1TMi/NMSRXkosLK6dsEETizwDyPulc6BsuanqKxejMKJ?=
 =?us-ascii?Q?MvrgrwSTQ3DitT2smu+vhokwzdOSENGavDKgBbqYtrr+WQmI1MrYf2cCLi0n?=
 =?us-ascii?Q?jWy93U6M7PWGod6iTO93cp+QOtbGrJ6yU9erA+y0kVUogx82kI6Gwe8P7kW9?=
 =?us-ascii?Q?US9wOyA+mArRXfRlbtRr2NQNX9yc8GIBVI4RiKC8eCB0XgsD4Ijckq1pR7wl?=
 =?us-ascii?Q?PCbKg9VOwY9iJFjtfyw167InB2/f/NR6QnRHFLjiGrQ5Z0G539ecMenCCqCK?=
 =?us-ascii?Q?f3oukr3v1O040D+ZENT5e9Y9cA867T+aJrkOni96kamHSbXYV7T9kcyiSEZd?=
 =?us-ascii?Q?SlA59qw5AIa6nrBrCCntxmS/f4UPPmB0V9BOJ5p1TQnhuPdhPxCI2G7OmQ8O?=
 =?us-ascii?Q?HksFqt6T3J01eQ95EUDFe3Gn8BifLHHOvjYEYOfh5hboR1AsClV7xUpM6sUx?=
 =?us-ascii?Q?HCjL5GhdhrjqTngov3bNHvJMnLrA71PNqJd5lY7kNAIdvsR4Z+VNINhsI2hp?=
 =?us-ascii?Q?8BBDgtbqL93dD1iEf2jalYa2N6gW4gFnsU2gHN/YQuYr1L+noYwun1C0j0fA?=
 =?us-ascii?Q?2gKdWRL7BbPuaRJAE4MAXi72egvaCN5T7GHE7z9dULTi1VIisXI5tp6WFBQt?=
 =?us-ascii?Q?Fjf8r7i3hxAxb4MIA7jyDuMFpQmbOEEWzbeHH2rd1sUf6d5Znlq0UGZbgkgg?=
 =?us-ascii?Q?HiC3ZxFSv+UGi34YwtqnHsH8sKqBe7TUKtEmlr6xengH0UeGZwuWlxMGZlMI?=
 =?us-ascii?Q?RpMCbBj6ybFF0Z0Soc14YA9AXkcfYPgFfC7+nmEPqJMFJrb3fMPO5gjqTRFS?=
 =?us-ascii?Q?M2lr7ihP7UUm9gx4W4B/XPhiJqdOPYDnLGqCGstu8oN39PIxOnMuWRVPtPoK?=
 =?us-ascii?Q?nPUjISTDAnyE+ev32S/ws4Ii1aORvLJMwPOZyGZn/43iJpC76pSrJGXl/QYm?=
 =?us-ascii?Q?0syAso7QHc/OAMMDCnw4H83gkSUDthFmuQHuqU1z1NX4QUPPd0/E3C/rvCOn?=
 =?us-ascii?Q?5tEJxPleSkn9szoemANfFb8oj1E9smh5YWa43cGCSNPwI1Eo2vd4UZnpz8A8?=
 =?us-ascii?Q?UahDJak0g7h3bfUrF8eRlQ/Yd+4gzots2VaO7LS9Z9blCJvvOSnwqZlqTGLZ?=
 =?us-ascii?Q?j1g/QhniJf0VRugk+KbOD8MywtrMQhHsMIepJCs5Fz1/SPgIeMxjSQeRbOll?=
 =?us-ascii?Q?tl9vL7urCEr7b2dCU1984Y3e58B11w5Dd4zd39N0LVeHHgNIoedRpudqnvSG?=
 =?us-ascii?Q?lCs/LJOOXhVjNuPx+CzuRDIJ4ZzmWW9zt/cSzO8Bd18lDiK2TfZhuNnv8luB?=
 =?us-ascii?Q?acwi4DeaxUA=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?4yqBYZHNI3WawGa4N9lAgfTEOZW/ysC2+HU8wfwdqKhkrQHZ1x3QWmGYMzH4?=
 =?us-ascii?Q?cZJm3rgBwyTS7Eq0MUnk1PXZmMBDCgHaFWcmAiLJnxDVUEOOppvSQcJdKsZ+?=
 =?us-ascii?Q?S2UJNRPbz6WI79SSeJqI5xkkQvnOrmK1XuV0Qzr4Z4xKTr+suIOSZfp7MlB1?=
 =?us-ascii?Q?IPbKwizlbgh+S0REAKZZizN9i++Ze1V3dp90W8ryRNQ3pIMEyUCuVKoGW9me?=
 =?us-ascii?Q?qlfPKi5acblqiqtFbbkzAxBqt5Z6RnllV8inRz+CYqViNnDUqoOuF8EXfCAf?=
 =?us-ascii?Q?5RcgrUr2WrSs33+DP2VyR+wetBFfHFhXxoj12vV6avuFpJ5Ach1cBl3Zu+dp?=
 =?us-ascii?Q?0gRbEsaAO76iXSpu06ZrCVUHDB/mxCVzcpqj4lpJXhxsqoqM9AURHDQ2o/Ys?=
 =?us-ascii?Q?Ugkd9XWYJXXKo38t2Kb0p57hVadWE2i53hBO8rpiqj8hiHNLl6dK5iiKJHqn?=
 =?us-ascii?Q?69s+x2S8G8Qb/vyHslW+LOEC/mK7W7ySTuCj0Hm7n7oxxUBi3BaJA5YiASts?=
 =?us-ascii?Q?9vkvM+xYZxkGrt2WNtMgP3APSzrnRyw+VI5kGbAyTG3gwVcDuH+UrNXl8mkS?=
 =?us-ascii?Q?SmNeWeve0ejT2dc3XTrHFnswEdvVfzAiloeN0hmPIpdNpbO0uceoESS2k1hX?=
 =?us-ascii?Q?p3f7bd4yRgIO+Miha7cAMUfpMfZmTzLLAvuI/7WHkYS9SCTIcxN1kUw86E8f?=
 =?us-ascii?Q?9ow1Om+rGw6E68BKPlf/FFFg7KOv5a+n/G7M+XcYO02tcW5zr9gl5hoxL9V6?=
 =?us-ascii?Q?Zw0v5Tsdh4BarLLQaKAnGggRTWKz5oMlYRR3hcchQ9iTKlN8qxXJ8qVRKX45?=
 =?us-ascii?Q?Ha+Nwa8n99g/dEubbz4acCyd3DDF042WwJPqmiPHHlnNhm9+MWSSgWuasSc5?=
 =?us-ascii?Q?ltJP9VwHL9dgGD8U2c/jj3Slv/2Vy0nSQCW+5r7Pln4rxjKQ+ei87JkaC3Es?=
 =?us-ascii?Q?BzgYtWmIFDgWrVt6qqyCsZUtgM93TRoewu9nfG7yi2+V7y2B/dm91UhyY/0a?=
 =?us-ascii?Q?E9wbA+92BO8LqiG26Tv32CAkftTpL4LeLHkR/AZsv5vSqviv++JVBX0BiMLC?=
 =?us-ascii?Q?TbOmvpcnYBNUQUe0BTCrJtVhEI7E8r9SmO/x5cEKyw/DcQQ6v5VivNh5wpFG?=
 =?us-ascii?Q?I+bzAYLqbGinepTqWwgjNnFmPZUXWXHEAjUNaKh4AJNxkOdnyPqkrKDi+4LM?=
 =?us-ascii?Q?VQubwaVvJyYcTY2a1lQAhqF6iJU5DYm94Jf6WDD3X4z2kC3V1RM4N9HChsAf?=
 =?us-ascii?Q?0LmlqERWA0wuXeFifqVfYt3JipWKchm7m6SlhZJ/fhXMl4+B9x/sJPAsYPFr?=
 =?us-ascii?Q?oC/it0DUOz51rPAIuvzFxZaWNSW4tUz7Cz5il4QPJHoJXAEFcoA7f87Zx26V?=
 =?us-ascii?Q?KZv7O+Dwfx4DGAVJd8q7STBTzUjIja0TuUS2scCmlli9H5ZjSoSFtIKeq1el?=
 =?us-ascii?Q?X65pwJhyhYWBLe6EM2ZHuTPLCIgupmf4Tiq2xBSiWFbcVYL6h3EqzDQR878X?=
 =?us-ascii?Q?LC6ovMkztgiqAh0xXsf3dTg/ByhN98qJQIl/224jPeROihTfqAWfFTAJsfJL?=
 =?us-ascii?Q?GkXfgrxYBUEAKXJGkjyZdePDXK6phrzBJtogUY5nnM3uT0w66L86esPcYRWQ?=
 =?us-ascii?Q?EgaMCW5kVhinA4qt3b5lYX0=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70542a14-725a-44de-c47b-08dcb5e8130e
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 07:19:14.0062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NfPfTZ/JBycW6H5iaWMY+RMbagOel2cnjrvE2VlWNDRlLKJEPEveZAcdUKtygEI8/M9omdePBqCpjbYmGGRczFUT/QFEMDLNy9PqcsReA0/vPQ3bEasvND2f22weXLY0
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

Add LED nodes as the gpio-leds devices. They are led-bmc-ready,
led-sw-heartbeat, led-identify, led-fault, led-fan-fault, led-psu-fault

Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
---
Changes in v2:
  - None
---
 .../aspeed/aspeed-bmc-ampere-mtmitchell.dts   | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
index 3111f23e56dc..0295f5adcfbc 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
@@ -113,6 +113,37 @@ vga_memory: region@bf000000 {
 		};
 	};
 
+	leds {
+		compatible = "gpio-leds";
+		/*
+		 * Use gpio-leds to configure GPIOW5 (bmc-ready) pin to be reseted when
+		 * watchdog timeout.
+		 */
+		led-bmc-ready {
+			gpios = <&gpio0 ASPEED_GPIO(W, 5) (GPIO_ACTIVE_HIGH | GPIO_TRANSITORY)>;
+		};
+
+		led-sw-heartbeat {
+			gpios = <&gpio0 ASPEED_GPIO(N, 3) GPIO_ACTIVE_HIGH>;
+		};
+
+		led-identify {
+			gpios = <&gpio0 ASPEED_GPIO(S, 3) GPIO_ACTIVE_HIGH>;
+		};
+
+		led-fault {
+			gpios = <&gpio0 ASPEED_GPIO(P, 4) GPIO_ACTIVE_HIGH>;
+		};
+
+		led-fan-fault {
+			gpios = <&gpio_expander1 0 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-psu-fault {
+			gpios = <&gpio_expander1 1 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
 	voltage_mon_reg: voltage-mon-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "ltc2497_reg";
-- 
2.43.0

