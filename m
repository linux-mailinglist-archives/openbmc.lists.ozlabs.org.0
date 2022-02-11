Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD054B1BCB
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 03:01:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvxgX3NqSz3cBr
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 13:01:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=CVMJvGaU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f400:febc::718;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=potin.lai@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=CVMJvGaU; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-hk2apc01on0718.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febc::718])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jvxbz0KpRz30K4
 for <openbmc@lists.ozlabs.org>; Fri, 11 Feb 2022 12:58:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iVp9FSnQzbeBxp/KtHpC5W8e/FVIAdfu0evoQPXYIK2B+xZzHVrVxh9FcHgfNwDgCEs81kglvLhrRaSDmW/TfBb5AlAiAnbff2r5TCSOFTFE1GZYWvB652kr7CPV1TAmI477BrUnj8UnN3rNCyUuzvz0vvLNTItwMLElHdhdFmEDNYlIxUqq6Y0DTVzD8LxhHvM2SpxYe61IWUdYdz8wS7qlY7rdeg0BnPOtvr6+UqLd67EZ+UIxY6U07g5imX0YA6rNsD0FQB1woS93gBYRZ5gHbGluKpVrnEPF+E2aQCm4V+DrfzCNyeZA8EPnFGlYXqNjShIQJb8ASDhO6hTlsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Lt3iNPXKIzzi2xs+5EMghw6HXh2oB6hYycNYkBAYNo=;
 b=c0s9DrdLXSKQLsJx9rurQeeLthz9df8sz0QbUUp01Q48vUcRDbkGCzAiYUDFA+mSmAs/CY5qf2IXvbZPPhL+MlPjnTF7lbsSbDYkzYuxgyjsxdM1KxbOPXDftH8MlzFhlGGswUobCOloxVNhJGAWQyelhDbK8dLQh35nAF8pIz4VUYIizhbutTswIkcmmO5qTUV+a/3dfD/rWdLmLkkB0Rv8K+UScyzrO/T0AGCTrwJHAn2dFchj85xGYTJeJRvAAv1Nr4lF3YFatvd1cydb+NEdfF4gyZ4Lc4tUaODTSEWkn21rhRt50opl+aUoooAm7/f3fXPnYjCCtAAvNITqPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Lt3iNPXKIzzi2xs+5EMghw6HXh2oB6hYycNYkBAYNo=;
 b=CVMJvGaUuawtPAM9ZgrdnVhswHNBtkRjCL8Xbi2VcplibtQKPxdv8xng/ricbRHKzC0FPB2PSrtVHKP874TI3Y6PI/qHr71mh0hubwYz1Y3Sp0dOKQWaVYydUbh6rX84i8FSBfoYNb2L4s+blPYmu1XrfGlRwEHXjnfuSF2Zbks=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by TY2PR04MB4015.apcprd04.prod.outlook.com (2603:1096:404:8005::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Fri, 11 Feb
 2022 01:58:14 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::8160:1a0:97e1:9e53]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::8160:1a0:97e1:9e53%3]) with mapi id 15.20.4951.019; Fri, 11 Feb 2022
 01:58:14 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 04/10] arch: arm: dts: bletchley: update fmc
 configurations
Date: Fri, 11 Feb 2022 09:57:49 +0800
Message-Id: <20220211015755.27644-5-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220211015755.27644-1-potin.lai@quantatw.com>
References: <20220211015755.27644-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0130.apcprd02.prod.outlook.com
 (2603:1096:202:16::14) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4519209c-7a83-4ea2-577a-08d9ed01f659
X-MS-TrafficTypeDiagnostic: TY2PR04MB4015:EE_
X-Microsoft-Antispam-PRVS: <TY2PR04MB40152C0375E4A1CDB439C7468E309@TY2PR04MB4015.apcprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SeDifdI3xPgv+jRGgDwKZOheRrOpvaZigi89SQtWg4QfYQFGfLx5xH2unoW5106t+N/rB2IbltPz4oGdYISZna9c6jLnIrmTwaOWJeAsBPrJV6emt9Mo8RE5tSQjjqrv1TTt5t6Y13UEb0InF31AmDy5okvGeRb8lQcZdScrd+9dd6nQLKe+7WC5QvgiOYvmHiscqF3ON4RYELNrfZjf7XvPrnHWFra0W7trvNg4LWHM6tlJO+knVlMueWJ5Xk0K76li8LpZBqOUuyse5h5PVXSUWaFql9W1Drd3BrVoIO+9APcPURARm2KWVA4JqbW/AwzdWO+F71/i9/+qMdPFczoiZPA4ZdMwPJEMdAuJZU/WkfZPKah1TERo1I2I81nqk2RWkgTCUlGE8rfSwMmihMmbC6AmRxocoD6+AcS43shh6lsBE7hWL2EuHN5rhA3kpY2bcxu1DZoWfiB15J9pQwRUapv9fwigJ1HKCVQMkUWeh37SFiUxK8nk/dfvgHC8Q1Vkvv8b4U+HrAMIFLyr7OrZrovo2M9c7xXaJWGOjB5vYUapeRU1Z9qVwSc57mGHrGBDJ6y8homFnmiqnyFPbLSCUuVCSVUahiXtlEjf8QoeGssCErcgy8JCAPwvsoJKMLEEEjkz1vnXcShPERCT3sEk4At7QFXHTZ1nlRZFD3jjRtraEgae+XyLtf+vinZWUiW5M7BIkierclemCI3ljA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(52116002)(66556008)(4326008)(66476007)(6666004)(6512007)(38350700002)(8676002)(8936002)(38100700002)(5660300002)(6506007)(316002)(508600001)(86362001)(6486002)(1076003)(186003)(26005)(4744005)(44832011)(2906002)(107886003)(36756003)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+oH4OLpp8GnoRym30ra1kbb82Q1DW3T174Lg1txJGpj9Bd7Pcy4QmcqDgsRX?=
 =?us-ascii?Q?voQohRMa1jZ9yO90KzEXmaqt+VF1SkjDO355BYCleci7mplQZ0xtCfRA7k2b?=
 =?us-ascii?Q?uY3MFm23go1pE+hLLgzWwnBfiiKQyvWT0S3o2lX6FgbSm01O8t7uNxHDNlWd?=
 =?us-ascii?Q?zPdeKC3Qsh1EIZ/JXB52bcDfSX0UtwQCW5y5b0J48cm8TTzp5Q9MkoVQI5Ug?=
 =?us-ascii?Q?FrVac6gExVU+ESeA4ZWzYB70RurdBWNb2EeJHtYK7ssPV+rLUPdg2O3nXu1P?=
 =?us-ascii?Q?Ys3AK3sRfAFtaVtdWLcNEHljpqEysvHdAypIhS2lnDpIxYKWNI6ezrjuA9rs?=
 =?us-ascii?Q?WbUFNbGvnIHmSBG/5vZybyN5fY0Mm37LugogfzppkJunxn6Z7Kp52LHVEXY7?=
 =?us-ascii?Q?rb/Z3ciJZx2JegYuY/GCRRcPh4lzT2ab1Zl0B5QvDhruiD9lJS4/tV2Nrq3e?=
 =?us-ascii?Q?s0yOMABPFRGe5KVEixMbODw2OV+duucNSOnXIpjtMwSYTj11LLQzEMKFjcnQ?=
 =?us-ascii?Q?H4Jc4JpYAnNaFN3WONk3bZgySv1rf1EycuuP+9CffnWYuZtNr+tUMrFte0bv?=
 =?us-ascii?Q?1NGqGkaiSAaUmjDA5AOgYtGig3Ts+ULAe9rW0pom4+nBsoosOUa7kQYPG0V5?=
 =?us-ascii?Q?ciBOKflI3wsgsRPutLGp09PWfj8Q4w4meodYJfo5pWuce6oame9xLRG8M6Bb?=
 =?us-ascii?Q?RUetS9XVMZDnCIQC81YlcwJydfeY7d8lp0Msk0/5aGBoLZzOVBrV1J3tt4yn?=
 =?us-ascii?Q?Eei1NhqBM08B/licCULutOyjV9LuQHkuGI908TlHzNJy1sSKG6RPM739Zul1?=
 =?us-ascii?Q?rMMENpDfsdSmvxcASJbPGevaJHdKq2nyWk4SxYrV95frMAagY6SYsDyOfoJ1?=
 =?us-ascii?Q?OM2zGcUtdOWRbU8c5hNmxW3C5hoNW4fLob4HZReJFXz7kksvvdjTXDhhhBUy?=
 =?us-ascii?Q?10eECjLxEhqus4KnA43OKYfQXp2wbZajQKAVZUhIdtkyXkyt8VtTtuLA4Pcy?=
 =?us-ascii?Q?O2A2ZmUJ2uqrXIArSruu5Eb4RqCeojep5Zq4yNcBUAvmafJXCsLJtES5w7eS?=
 =?us-ascii?Q?ockunPsRjjI/kMpJzIv6HSK30/39jw22U4BnkgFCwiXGTZ38rHeYSctA0oKB?=
 =?us-ascii?Q?LOs7CsrBg65/f1fZCk10nPXXvBUlHSgdJZvhHnbXhUWVDw+1nJDFP5aBMdAq?=
 =?us-ascii?Q?EOdcbJNESCZvS38yrYvqrGs+iAfJC0b+6+eyX5fipPT2rekvZorSKU7G8ydN?=
 =?us-ascii?Q?ipkkjKM53mBQp08Qule/NS0jsc/iF/R2/6WmKNx/7ocMFprk9e5+x6WpBuuq?=
 =?us-ascii?Q?ZxcLKKzLePV2WySVZp9W3siZtl6pHgPUU4Z3IskXnqr4H6n5KUWhuoXIHUrU?=
 =?us-ascii?Q?0GPG0t4YtZOg0tvkPO7RELFThwnGOLSDNj6mR+rlF0QWeNhbYsECTzIjoVEG?=
 =?us-ascii?Q?n5epXCF9q5lrkTtvcLU3ogvTlj217ps6YfnzyAYteKM4d4EfIzV+nbHQ91O0?=
 =?us-ascii?Q?UDXMgdfVOND6yAKqLHefwXYEP3BOcp1QZz1Uz9DhJ1G4mPSXYoL+AlzMPMGa?=
 =?us-ascii?Q?3Gf84VDlIp5tVe4eU3/Cb6rM8e3AzRcg9p3MGSLTSZ2Q5bswS6912GLgZAFN?=
 =?us-ascii?Q?VDfjIif4gTruG0MpX/PNz60=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4519209c-7a83-4ea2-577a-08d9ed01f659
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 01:58:13.4686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +y5UcViu1V1bBRq6GeEankuIsD0ru9mMggatNl/bq0GzneALgKNCocYWOqYS6/U5XPmuNPaPseKPPn578hozoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB4015
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

add flash1 in fmc to support dual flash module

Signed-off-by: Potin Lai <potin.lai@quantatw.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
index fc0690ccdb0a..b01f1e7adb81 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
@@ -217,6 +217,12 @@
 		spi-max-frequency = <50000000>;
 #include "openbmc-flash-layout-128.dtsi"
 	};
+	flash@1 {
+		status = "okay";
+		m25p,fast-read;
+		label = "flash1";
+		spi-max-frequency = <50000000>;
+	};
 };
 
 &spi2 {
-- 
2.17.1

