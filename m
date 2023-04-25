Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 259DB6EDBFC
	for <lists+openbmc@lfdr.de>; Tue, 25 Apr 2023 08:59:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5CY26qXGz3cfL
	for <lists+openbmc@lfdr.de>; Tue, 25 Apr 2023 16:59:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=ThLVmiPw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe5b::711; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=ThLVmiPw;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20711.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::711])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5CWS4Vvgz2xbC;
	Tue, 25 Apr 2023 16:58:12 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C1YZbmqdf6yLMVMX5778GpMjpXlntZHnSgyh8Ch+SUSBblaFW9LdzUrTJiWakQ0HDlU2weQNLvNiZ5ldmGmmIoja96GTgsAJqptpWKAsCAF09dWmuuYg/Cx42AiVX3rWdS5rRI+cAG4Se9EAJSAUCJhw7eQ15B1ZAFeEIGBcTZaNaWYldaCYBFfQsxJr/03K/3Zv2hs7CVyT5Cm7JIZaAjwkpoKJZy33oYc/dpNz3fzbwGdL8QqyMMpnDnJJy9LaT57xFM2+O3XuYC03VkO4/HvQDCkn5gWmYgmOABn8wJCIHnyiuv1r69ziky9clQjrhtFFqgnnFe4b5m0wHySRFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+RLPGuJTd7oz7kuWloiYHv2YNQbVWTPsVdUNG9UXrlo=;
 b=TI8gQJ8oEHuqK6VwrCZ6RV1v1qwxlhMntCxrwT15W/hoF1Y7CD/0HNuI0KlWYMNuIRpOqNV1JdqJG6wHP5YgjCblumiWzZ3qli5TUd7pU6Ux0hEvLJSaTtThNWrYdRC9b0i8g0KyjugeFfP0LUc+hSZ7tuEdIK4J4CKqeAAlB76YeF7PZBBewmFpAsHGbQ2DXDbN+5rEbUmxRXatz7F5A6zPlA1+/YPmd9PgJiXN2joI3/JAhgm0YK2RcQ66xrYsd/clroWPuyrOOgHZx1Mc3mukXJwdrfwUJWdc1G3XS7uohF45YQ+4WYapUyweAwDy3TWtIebff+n3hO+tiBWuJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+RLPGuJTd7oz7kuWloiYHv2YNQbVWTPsVdUNG9UXrlo=;
 b=ThLVmiPwTnU3PEVo4J3m68Icftmqrkr9wtiJYIwIGC4PzK/fWHCYqmd/PsLDocps5benDulMaAOI8KnWaeYfKTuMGu82n1hap8p4DsZMaumQjYeAPxPtewd1rFl8+u1T8Z3iQODhu9F2djhpZAmE+UDAiLKYK2A0O/oqradHr4M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BYAPR01MB4966.prod.exchangelabs.com (2603:10b6:a03:7e::28) by
 PH0PR01MB6504.prod.exchangelabs.com (2603:10b6:510:b::14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.19; Tue, 25 Apr 2023 06:58:05 +0000
Received: from BYAPR01MB4966.prod.exchangelabs.com
 ([fe80::46c3:3b44:d2f8:4c3]) by BYAPR01MB4966.prod.exchangelabs.com
 ([fe80::46c3:3b44:d2f8:4c3%4]) with mapi id 15.20.6340.019; Tue, 25 Apr 2023
 06:58:04 +0000
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
Subject: [PATCH 1/4] ARM: dts: aspeed: mtmitchell: Enable the BMC UART8 and UART9
Date: Tue, 25 Apr 2023 13:57:12 +0700
Message-Id: <20230425065715.21871-2-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230425065715.21871-1-chanh@os.amperecomputing.com>
References: <20230425065715.21871-1-chanh@os.amperecomputing.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:54::15) To BYAPR01MB4966.prod.exchangelabs.com
 (2603:10b6:a03:7e::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR01MB4966:EE_|PH0PR01MB6504:EE_
X-MS-Office365-Filtering-Correlation-Id: 72afd3ea-c790-4265-ec5e-08db455a6ae5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	qBGVIUagN7fC1egMSLq8aRhNgqJOLrfFsiC6Dsd9nprFu0DJ+SbyO8SzwAEuIYi695acB0yRJIGLpbdkeLl02GWqdEkjfz90HFgY8Efc0soPDN+1mE5ucrdkex+BxUHMqXlpFgx9oqV5LDyP9Twq0jXzeEdK8dGdmcJDbk9YF4+IL6sygjQSUdL8/CMUtZp3czgXsnt5WHGi4Ffgtb/v3Ot5rVys03DBjzuRttPdAb3SQr84k7+DpGKscH57uQOkFDIIwLGnImHONlFjISIpm23Dw3mw7yLNqro+1YMcB3+zSW8X8HQxWZ/Lji1agoy0UnGBLJEUBnuj+N785GYvl88sjlSmwET6tMtmK6Bkv2HIRXauxPRBAcR2xg1sDoCEUXFHxljmrsWWVm8EuV2nx3D8yeveaBkLi4lKDnf5i0bInec0HZc3vwLkxa1XjCRrbu7+rWTmNZwgfv5cP1yJxbZpyUnlO0MKVdAtlJc95icrRzyVgE7KwzYlV6hhRUDD8NZCQZdlgmZpVQR7Uf/cwTzC6Re+XTUllhlF9dEJgIoS3Y2ucAu++fi89ktnxPkJE3OxJEl0D/QjDFS+D+ELT4LmvRTnuZUVbX9I0+rIrXOJBXJx+MkcOaLr+Q1RXC0N
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR01MB4966.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(346002)(39850400004)(376002)(136003)(451199021)(107886003)(6506007)(1076003)(26005)(6512007)(2616005)(186003)(38350700002)(38100700002)(66946007)(478600001)(86362001)(66556008)(66476007)(8676002)(8936002)(110136005)(5660300002)(52116002)(6486002)(41300700001)(2906002)(4744005)(4326008)(6666004)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?rtUo6mJi/MxQ1GPrbmjciyTgB0cHgj+gGZA+nSpwhnTco2TNeYqbkW2LH/uE?=
 =?us-ascii?Q?tdrmRBxDAC76KVl5i6EdZNAw+AQbjxqiSF3G9+uVj0EIovUaELjDnTPigWd9?=
 =?us-ascii?Q?r+0RIrQANRhK5nPc+lnwQq+KVGIj/G96AMSCtLXeYRpYtGhKutgxvf4eNzTb?=
 =?us-ascii?Q?+BrPbugO0De7VCifDBMJSTAEBMCekvdxwQFV11EDsNlJrFzCa1WX+D5GANpZ?=
 =?us-ascii?Q?XOr0KRmpMUY2sCLRcVxCVbzGZZE1TYWEtrtfcnTAbEitT7tD9E/+opvSaTXj?=
 =?us-ascii?Q?pw6G03dy4ghOFTCRdUzcSkraKKk9syz94K/WBPJWLoZiQZ+MriT7hmvzN3fs?=
 =?us-ascii?Q?ZIAdb9YTGeDrw47G1av8sgDcf6OCL6wNiU5u1DOvvbxn5Db9+t16xNYMThBm?=
 =?us-ascii?Q?VZ8ChY0+yRchc7qDvuAeSiTF+X2feMeg7ZJS0ZedkSyOfJ5pktY3pdIG3rtZ?=
 =?us-ascii?Q?cUfy0mSzIUF0ND67qTxzLUUTDgn0+ZgAsZRvn6egGx6rm2CVAz/VWY51a5Vq?=
 =?us-ascii?Q?ES5gFQCPFl5uQmJasqyx/c6SkBmgRIFDljWstdiH+KWhjAhsEPWRdgjWFHWM?=
 =?us-ascii?Q?bSDhap/rYYAyrLVpmeZTHwje1QT/4IaRth5U3d6wwaxOIdtfW7pN/N4yUZMQ?=
 =?us-ascii?Q?roc2BxQvqGtOa3rWKDUlcTQiNnbxkqMNK/OKkGIREMW6KHQJNsV2E3NfgG2T?=
 =?us-ascii?Q?81FrY5B55wNDc9DWW+LGYkaLGHS5XHmGxMRU/v9jC/JOSNPSgnxCYiouvSY4?=
 =?us-ascii?Q?7Ml5Br0BkkSDYNg2muoRjfBD6joEvYLc3ilPwIB1zt5gHX+B3WRnunElFjxQ?=
 =?us-ascii?Q?BdiCpiUM7cxcjN3EagmBzAW//k+arPsxKZ9Iu2Hz5jaHvTHDPbafjbiYymTZ?=
 =?us-ascii?Q?E7iaC/cfdgGOIrtknEm3HQgWLJQzKdD4QFeoY3U4zA8JhZH23eKlnq5ceorn?=
 =?us-ascii?Q?R2e8rmwzDMZA++CjDSHeYIwfmEA0QRsQhH/9pehbTNpYO6Fo5Nxap/6klMng?=
 =?us-ascii?Q?GmIPydty4Rn6EHbKcqzRilb6+/Gp7xBpzm5n+UCUed+JANSVHZZTke9NssQv?=
 =?us-ascii?Q?1IZ4Ocv4FrawohYW2WUjqNJ7W6vlEhQP1LA6MbdB36Ky6UYNbKmVwUFdemGu?=
 =?us-ascii?Q?nbGcToWJYlRddytbITXmb3/0MfmRedexKuvPSNTKfvXxGKbiMl1+HacU0FUT?=
 =?us-ascii?Q?H8ZiPxAtTc6DSXbsFPnbn6pVZZghN17MiS+NcE54hM7K6dD49ssKKNmidYEH?=
 =?us-ascii?Q?tDgzx98+i3H8u7HNAytAQ42uXkU6KdreUfNgI97+bKPc0BYk1hsngDkQuf8q?=
 =?us-ascii?Q?FnhtbtmUVn4T+W3DZP4k9QQx5vKWHn/pSRUouYJpVpPglg1J+ov1o6v/yhc3?=
 =?us-ascii?Q?JsyWoR+jWUSyc0e8ZXMC79ANa6q5gaKW8umtpTS5Tt+wPb7elu7U3XfBYiVr?=
 =?us-ascii?Q?4NWCB37cheYAlw3XCK4C4cQGPFt8trlr9V7oTsF1rk7pHJqcxDU2YmcCnFXL?=
 =?us-ascii?Q?iqRtABOGKrHdGzDx9UI6u2hCRuWn+veKUG7pdlPooK2mVtxZy4Q+idlvU0cf?=
 =?us-ascii?Q?HUBiUQ+2IoT1NZO2YqOMsKTLahyCEpVIz9RKSMocFOyZ25BLUxcHc8hA7mJf?=
 =?us-ascii?Q?SvIEapmSB2RyhM5Z6ybDhfg=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72afd3ea-c790-4265-ec5e-08db455a6ae5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR01MB4966.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 06:58:04.9441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8qLrKO+vYQu11Bdv/h9KmCaGA+z93OAwl78qQoxlmuvPQDiEsbDSW0ihw0xdyOxJwrhY7FpGZRnrnNaE8Me1E8C7KOL9ggmHWvBy+CEyg38jSDMWK7vsHN0f+CxSmkp0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR01MB6504
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

The BMC UART8 and UART9 were connected to the Secpro and Mpro console
of socket S1 on the Mt.Mitchell system.

Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
---
 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
index 1e0e88465254..e79f56208b89 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
@@ -9,6 +9,10 @@
 / {
 	model = "Ampere Mt.Mitchell BMC";
 	compatible = "ampere,mtmitchell-bmc", "aspeed,ast2600";
+	aliases {
+		serial7 = &uart8;
+		serial8 = &uart9;
+	};
 
 	chosen {
 		stdout-path = &uart5;
@@ -307,6 +311,14 @@
 	status = "okay";
 };
 
+&uart8 {
+	status = "okay";
+};
+
+&uart9 {
+	status = "okay";
+};
+
 &i2c0 {
 	status = "okay";
 
-- 
2.17.1

