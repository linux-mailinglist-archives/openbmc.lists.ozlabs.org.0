Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 045F39447FA
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2024 11:19:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=rX8oEnHS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZNhP6mnGz2xdg
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2024 19:19:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=rX8oEnHS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:c001::2; helo=sj2pr03cu001.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazlp170120002.outbound.protection.outlook.com [IPv6:2a01:111:f403:c001::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZNYh30mwz3dSG;
	Thu,  1 Aug 2024 19:13:44 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wTMUF0jR4OpsQkYYgGytLsWxArCJHeRB765EhXB80Ss+tLezKyTuxdT/+e6+Ja20hHgydfbJx7kyvW2kcaO2baSHOaD5SqfjDT1AZIGA1ZhwHiwQfbM8rF2YsRey7Fhs9wFiMZIQ3JccbutmudgFzZdYSzrzOWrHxEfUlpPVPxWVVWiQUNBzg/ipSVuuljrgnt7bGgFcLGFKwgH6Tm86zdYw0VKvMBHQxb9D1Rw739ipgD0rFQeiUukxLxY9awaM4kPbhQofksLFIa+fweOsExRAKJXyvFXcFnvDU/unttpWHUN089OzWfQscNJPkQTQwROPLgFum6kdX9VOtCbNow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0c/fcbXuJ95WK8ViA4Q5b5IphYpU8bZcqUT3kXw8pt4=;
 b=IYUdrM/G9P4uFAh+L9MoM/dvYOgyM/MltdOpwT+yWIW8rk6U6jJtUJXgVhV9LxOr1hNmekYrKaGSBxA1iv6qO4dCyxtOj/S1xpJWZlnKHdJoK5ThIm3605WsWzPpF1A0PMz0O46r08Oz27QOxovLH6b5AW+w1cfLjhjlx8RfUAxbFC2atAP0j1miyTpH37tX6Uh3PID0ZZT+MY1j0LN+uiP0IOMIkB7AD3k+yKZl21Lnspeg3ulUodZSLathkiZzvJ31rUZREirDRXnCHG5KNyzlGoTB+5nJTX3+Tfwvl2btssH5TruG9Ji6HskZpRvo6BfqWQBR3nUWo5rvQyQJ6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0c/fcbXuJ95WK8ViA4Q5b5IphYpU8bZcqUT3kXw8pt4=;
 b=rX8oEnHS+AVKey3jK0ywxs2DHhXwEIO78p7wXo34gZ2/t0PSfll201afaaddyc3F1Is1/fbgPR1tqD8eXq1xaEtQB/EBZpQiChwB3O2fg/ilBCqVof3aQc6FAcCIxYfrm11npqcb5kt+iOcQ+56adKkl+8dkWYsq54MJXMFNEkM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 SA1PR01MB6640.prod.exchangelabs.com (2603:10b6:806:1a4::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7807.28; Thu, 1 Aug 2024 09:13:39 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%4]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 09:13:39 +0000
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
Subject: [PATCH 6/6] ARM: dts: aspeed: mtmitchell: Add I2C FAN controllers
Date: Thu,  1 Aug 2024 09:12:16 +0000
Message-ID: <20240801091217.1408809-7-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801091217.1408809-1-chanh@os.amperecomputing.com>
References: <20240801091217.1408809-1-chanh@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KL1PR01CA0105.apcprd01.prod.exchangelabs.com
 (2603:1096:820:3::21) To BL3PR01MB7057.prod.exchangelabs.com
 (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|SA1PR01MB6640:EE_
X-MS-Office365-Filtering-Correlation-Id: dbe69685-7027-4e73-86a1-08dcb20a3b13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|7416014|366016|52116014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?LWtS36GROvIKxGtMYQOvrRAdrgkVcxDi/2tWAT4RhFgLtnD5tRQSloF25m1M?=
 =?us-ascii?Q?hahYzJYu/GQ8WXwh6Nt/jYh6kMqDGXdE7Bey28EgYKUKPVxL1f1C1wLOcWqV?=
 =?us-ascii?Q?Taz4DP19y+GfOSdDXl+a9++3T/GfMuqFhTdNTpvO99IwA0Cf07ZekJbZI69F?=
 =?us-ascii?Q?B/rvyBD1G3mwdmtE8E3MvVgSndLgmjGY2MFVh1Dx9hn18Al+aNl28T2hAdbj?=
 =?us-ascii?Q?2XgWk5/Yxh4/IWgpXd3mgaWMUCEfa45lpJUD9OMQZMYWplv78dSL/QkZGOEg?=
 =?us-ascii?Q?13tdvDlTL2xt80s4CYzxsLcsapwWfUyVwW3T1UZjIr8BCtqZNqU992oskrGg?=
 =?us-ascii?Q?3rp/2J2gtJQccJy4I9w5Sl0cGbKrMVtDvBaMtYw/Gsd262sdgO11lyCMBy82?=
 =?us-ascii?Q?Yfiu9VEvNqijIBUWzDY208thzAMt/AKDUaA/jSOYjx0w4CE2rGxeDbfbSDQ8?=
 =?us-ascii?Q?8rXa7eHmindGaG/jijWEhcELVz5EqtiOPx4NPIDm7XhhlKmCaaWAuhe6MNGD?=
 =?us-ascii?Q?AH+mlH2s5WRh2YXEvCrAdHIGTuAyG2FNHfyp5IR8aEKjFGiAZoxfa/kVu1X/?=
 =?us-ascii?Q?sJKD8O4li0AMz8JRmmeJZd0p7Bz3yIPIN6TN+7BVyHOWrDhTyrPm4OiEBO+x?=
 =?us-ascii?Q?lN5FSZ6Aw3iqBaPQptFkpfhIFLIR6+q/9VY8UjILRsER+hKFvl+d8cckUMq+?=
 =?us-ascii?Q?MWQjPvU9d6TpoTTezy/9KIQXsz6fZEaLbeEI916zMVdHOJu9lyyoksb/yiQu?=
 =?us-ascii?Q?LlkbZzvwjamP+lclVHi9Qyi0ZMq/XT+O1eAEjuho4brE/J7tPeruHMunH4ba?=
 =?us-ascii?Q?0qZiN68WcTfpcgMEojeRXrE8z659TcLG41IZEtAeQRRCnxtiTE9DKJPeiPxy?=
 =?us-ascii?Q?Ih2j9mjttzfexYeO5IdhYTeMy64pRkRYwtpGhCw9o+LfbxAA2UMbgo0JrO1H?=
 =?us-ascii?Q?/p4uwRUvhl+hEPJSWKvVBFRkH6Kx2GKwAP0eeNuPGEMbWQdoyW4eNelOvU9I?=
 =?us-ascii?Q?Dzvn3Y6Jx93/xNu4TXLSAkwRgkWjd+C+aQqqrkOgutSoiOfofS2j/jvYl97U?=
 =?us-ascii?Q?6Dk+MuCvW+2zzINJNQo9db8kc7LT7Q9ZMFyh1q5+qTi+CDqTBGR1c2kpk23y?=
 =?us-ascii?Q?Y6fYybi4vWR70av92UHbyvt2KrofqIwXE4ilvEFOSz12pVKWsRJr90A9Atra?=
 =?us-ascii?Q?K0/1TORzKkdrt0UPXXI8i4GS97fzXrZ3s8WuVVZuedEk9kmPqWLCG2zbGDlp?=
 =?us-ascii?Q?6/vbozIqy70rDSydcZSOdmv/cPVA7a6rkAEXSIkBBZBcYQ28QRWMS0aDsyxi?=
 =?us-ascii?Q?G/HooDU4eUGWqfuqUititapvSvdspXqZmbWcmtCaEylFPbWGxL34PFaeNrfo?=
 =?us-ascii?Q?husSE+/LX77QKq+Xc70RWfcxEWZx+iFqxwl8pI5CpON5WXnC1wXRszctb4et?=
 =?us-ascii?Q?JJKMbH50uCs=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(52116014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?zH2XYcExDtAnrdRqwmbj0So7jzomvCw6dRvZL6inmEG5GHedRrlx+LWmMajL?=
 =?us-ascii?Q?2wtYPZHfPBPZskyNW2mwnRys5WRMhSte5aoQokLVoj6E0tuiPCLruvArO90a?=
 =?us-ascii?Q?HvchXWbXtTkna90NMa14e36dWa5bmzQsgZt0eL+3UW1mxjB3+rDkV0r1TbZN?=
 =?us-ascii?Q?Jqfcl3wkoi8pChtNZYD1I+VTNB2NoPtZPw0X01CpLyjiN3EoSohnKuc9VW5o?=
 =?us-ascii?Q?Wd/LWa2gmNUfegePfeJzrxihWhGQJjbXNdaDDmDJwrp8106qR85m5c07eb41?=
 =?us-ascii?Q?ekx5CKk1RDNsHkCl3HEUQeybKg9tTR7J6U/1L85iVc5VByFpTIYeA3c90YR0?=
 =?us-ascii?Q?C6Sn6py3MwxUWbAGqALmqZk88F93sTsGYbkn6tsao1TRXcfCxEtr5FU+Fdo/?=
 =?us-ascii?Q?1yhLKIL2J+Qy95bQW3HxbEv+gt9h15Aqtjsgmd1qi0bq5LmvUNXV6+E85qNp?=
 =?us-ascii?Q?NjsKTzU7lv3XAJtMhxoTCuIrGCchbfOnW1/KAWwMPZP/KSns4lbM4QUqccNk?=
 =?us-ascii?Q?jXdsbb3ML3jWkPHzNMrEe7Rx4u9ZqIMqeJg3Dg10GthIkFIEtA9CeI0o7eJQ?=
 =?us-ascii?Q?iK0OdkCDAN/JhSnatWWagYbkSgFmoKBfbdFJ76xvhng491I/wyndQZPKzlD6?=
 =?us-ascii?Q?/LgouSq0a1tv/3DvK7UxVpBiCN6/lrQHtOWKt9yum3Fofp7aeilcHaSlna9o?=
 =?us-ascii?Q?Ndb97cSAuWQ1pTW0Fz6lYb1a/Wx+fFlWLLrIINDfoQX8d6v9qW/Bqrx5Wm9B?=
 =?us-ascii?Q?qylAvZRK09HeX1JWvNXkR5TvDeBP+O+eya+KqYIcG7fGnR2sFSRYrTDCFdFe?=
 =?us-ascii?Q?ZU1/DOG+hCknVV3kXld9BgYm4nlz876oRGZyThxC2zNpw6gn8HY0//WOpxgl?=
 =?us-ascii?Q?PcBDpWiXzVKqWe7Z5ftZ8N80ECME8tPXhvIm8Ncsrb9JTT4kwUzbT2Qaj6kB?=
 =?us-ascii?Q?zBrsVwRTgt4Zn0tVfIDZDmMLwJKXHrqQdbZhMAI8Jm28eaah76Ogspef6cYf?=
 =?us-ascii?Q?mdTDau+U9E0tG2uIgyb1WN0Ch1WyKhKMth3VpxOtaaRvcVW209Zgfp5h7GB9?=
 =?us-ascii?Q?v1rzhYQ75NHZFtNHs4fnQ51A1In6ipSp2qb+zMvI5xT5CVXlPetS6N0gzRPv?=
 =?us-ascii?Q?yN2KpQnVslfmJBM81AqEBlIwuaeA74tJfLJbtEHqGVTK35+KYKqltoOnEjDF?=
 =?us-ascii?Q?XFqNt02unx8rpkEyx/jct9oy3Bxl3UVyphmW0dOFb3skA482LQ9ABFMiwEed?=
 =?us-ascii?Q?oySq4TK3OvUpbwnnJrkP4wMj53IgU+CYafAqCRoPCqc4d7d7mCHt4DI6+Xsp?=
 =?us-ascii?Q?iFPb3bHcbCI2HMP8ovsP7P60J9P6NK1YTqk5PsUxSWmdGe0MoHbDE1jecSCC?=
 =?us-ascii?Q?gILbjziLIT+GKysDeHgWanVkBVCjc/P7YRTHojBJw+tDRQj/GT68Qf5m0Gu4?=
 =?us-ascii?Q?luonIdxOt++2SocI8a+1YNjPegN0SAG+DzTw05rP7x+atsGLNZHRWyRTSMnY?=
 =?us-ascii?Q?/aA+w9Nt3j9SntPY8qng48xUrrXHoXyYlNgH/I8oyqJzSoCWs8jRpbze1MhD?=
 =?us-ascii?Q?d2tfV9D4NcpKSMPqoggmeJCus4ffNNPTcitpIELu39r6GAIH7FF2tH57H3Ux?=
 =?us-ascii?Q?WpFmtuGvC4+f/38Q9bIJoQY=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbe69685-7027-4e73-86a1-08dcb20a3b13
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 09:13:39.4751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hgL2TlKdaph/nBWgNPa9QEMcL2v7HK1NENukbeFSlNr7x2h2n/sDuQLADJaAoM5dbu+7BsDUtxoXALvT0z7FPUmRgZZp4NNJAvQdLjcDoT83wIyaFMKdToDJ3lgZhHFt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB6640
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

Add the MAX31790 nodes as fan I2C controllers.

Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
---
 .../boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts   | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
index 093b746c010f..b3e7a306901b 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
@@ -672,6 +672,16 @@ bmc-ocp0-en-hog {
 			line-name = "bmc-ocp0-en-n";
 		};
 	};
+
+	fan-controller0@20 {
+		compatible = "maxim,max31790";
+		reg = <0x20>;
+	};
+
+	fan-controller1@2f {
+		compatible = "maxim,max31790";
+		reg = <0x2f>;
+	};
 };
 
 &i2c9 {
-- 
2.43.0

