Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1510C709243
	for <lists+openbmc@lfdr.de>; Fri, 19 May 2023 10:55:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QN1056y10z3fDS
	for <lists+openbmc@lfdr.de>; Fri, 19 May 2023 18:55:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=t5hTUGUs;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e8c::722; helo=nam04-mw2-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=t5hTUGUs;
	dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on20722.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8c::722])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QN0xX70F0z3fCb;
	Fri, 19 May 2023 18:53:36 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=njbzyO482a8FOsWEgzGAFcMNKbMGXXwxKe/RbpF836YG6AwE1hawb1rkSN4AmX+xEO79zcrUUZWoX8Pc7SZH8qtbJHDIC19bP9zNaOGGLsknC8eLXTKmuS6aq1huWL/dFp7A3FDHdZCg/p9cpqpcxRT/8S+bjRWTZ/Ctzt2I9n4K2CNiayLi124KzZbDY9caVFDUv3aHSaFP4E5f9U1DZmvFlDb33CZV1uyVD9HpobhBxP0QbfPQYgfNPgcptCHkhgoaPzE9W2coryQc6/VXZlzponcGn7YjREbrPYdnuOUNiO8jzQmxpaA4a6V6Bwpi1MwlnDxcW6QGrxbtj8Ka4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bLfT7frowKwB6BkZ5vtaCejX3YozCFQccska+jJI/W4=;
 b=MUg31alnaWspkSbLWEUz+Qfg8OecLU/YFoV+qYeEBSUIKZVt21GiIn6qZNwb0FS7Ml7cy4uzaUwonat4Hg0qfDL+W5sREOu/VWZtIJ4dIQzhIACtUUzivzrd8zHppoxoFXP10yE+yT4lOGotELDQRk0VVHn76m8uL1yabAZJtmgX2W734cDSRF1Zrk9dQ1cIYEgfH/cqgUQsff1SdGwegqHVzL4ai7DlK0YsnE+DVni1QttuKrxD/m35UWg3h9E/JGqCTZLg75RtpZysb+kjnKRuC3ZDX3khr9Wf7jlS6m0qU2Zi1OUuZHqTG5uz3dTLe/AI15DzV35E5koGG4Q23w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bLfT7frowKwB6BkZ5vtaCejX3YozCFQccska+jJI/W4=;
 b=t5hTUGUsP5ssLcjYxrUYuLcI2h2UBPhSt1H5stwrLysyGZbADXOwXzP4QsdHIxs02OXz9IIWlyZ4NhKGbXkYRso8XJmbvwHhI0C9tlV1cXRSKwxb72RhG7bIDgp3LgQ9tmUl4sPMEHsXwsVP97nWtoEvr6vxYhnMmoUIUe1jz3w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from DS0PR01MB8010.prod.exchangelabs.com (2603:10b6:8:151::19) by
 BN6PR01MB2675.prod.exchangelabs.com (2603:10b6:404:ce::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.21; Fri, 19 May 2023 08:53:17 +0000
Received: from DS0PR01MB8010.prod.exchangelabs.com
 ([fe80::e439:70c2:7d19:45e]) by DS0PR01MB8010.prod.exchangelabs.com
 ([fe80::e439:70c2:7d19:45e%6]) with mapi id 15.20.6411.019; Fri, 19 May 2023
 08:53:17 +0000
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
Subject: [PATCH v2 3/3] ARM: dts: aspeed: mtmitchell: Add MCTP
Date: Fri, 19 May 2023 15:52:00 +0700
Message-Id: <20230519085200.22020-4-chanh@os.amperecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: 424be050-e3e6-40cd-e7af-08db58467d25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	/3EMlyL5KP+0VpyIO4h/7d1F1GEEUfBUq+6+lOeug4oNUQLHtDh/4YsPTUG5llO6ljHkMOYG/VvO7NDjz10bEqf0rMxqsQgSaFmr9PfbKU0owk4f1TR1+Q1yRSvg0bxiP19dAvDkWKZfaq/hGIh3YiVaPd8lPUVSC2xHXsu3Nl6f3U7tXDqXy7UZqHVPQzmhyKKxGipXD3zbbFDXwKfJ5SlO+PdSJajXIxjjuQKXpYJfLgqvS4qkAhT35ceU9CpjPAYLXuDyKXaVD6nf2YDd7lBcb6M/9to1pI3sTuLNZmiSTIpIsquoKF15ib7fu4q16vAFy/fEmX3JFsK2i352AtGNfaCCQ0iVsKkFVtqtitYd8Jg/KF5WLo2Tlhwhv23QBvtPoC7QCwJBGHb2k44zzB8e/Lg5Es9kJU+gVAM7DaKE6Q2SAQCHbs9iXNGaRi/KwUU67q7RfYR0H/3zQmtgrVa9a1XF4B3HY+xCzUFuB+x3NwC97MTXXUWJyqY17ddMAluhIl0EnTTBDT8C1/PBy7SQN8ykVYQuXm1KbdVfNsa2Odghe3vLxQ9206JBbcuTpbDfNxSfWvORWF/gK7sjq14krBIPSJdsnp5K4T7E68fLI1FF2nsPocQANSQFAedc
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR01MB8010.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(39850400004)(136003)(346002)(376002)(451199021)(86362001)(110136005)(316002)(4326008)(66556008)(66476007)(66946007)(52116002)(478600001)(6666004)(6486002)(8936002)(8676002)(41300700001)(5660300002)(4744005)(2906002)(38100700002)(38350700002)(2616005)(26005)(107886003)(186003)(1076003)(6506007)(83380400001)(6512007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?ZqFFElNDPbNpAxpJZeMOeE2zIB+AficPm/dCK2hPMyZgRY3ncD7EBJgUzMS4?=
 =?us-ascii?Q?X1W64OPBVpWE5zG6NgPmKirRJNdY6lMvt9x/phnnlkFDTVb4YZobu4zDIf67?=
 =?us-ascii?Q?2W+kldtahWWzrPBspOpBlX9U+y3RN6hj5iZhb/lbHdE8XpkqxxMRNy0sp+tK?=
 =?us-ascii?Q?kd1nG+kEI6a5WEj6r6NG28g5a7lgdkJ2ZbhmR7gHbD++JA3ipPud0RAdG28q?=
 =?us-ascii?Q?j/VPqR5PNHaKFW9V+hsOmZeDlEMj9r16J9I+XqcGh7yy4haBxUcRsp3mKMP2?=
 =?us-ascii?Q?LI8okGSldp/ug8hPCTun1ieqzMLM8GMhraU9D3GNoWADi0kzUIvHJvLocrtS?=
 =?us-ascii?Q?+EUY5h5d75uwOiiB3O2sfoCqQyGbjLwvNG7HvDWpv9RnRlRtKURGdNq+O4iH?=
 =?us-ascii?Q?iDAJ9ZDbiduFSY/5ZGul1ZKTSHiFbK7pWfCBV7OrtzwRDEK63MET/7XV0ok/?=
 =?us-ascii?Q?80POxkReZmIr3kiZo7znPUTAX/T43DJRZC5pT3cXIrgZPECQu3K3B9nNZvfy?=
 =?us-ascii?Q?I69qVozCOM5MxQGQEwuh03shlr4/0HI4VU05hodvzcrzGD9VQFkagk1zn03T?=
 =?us-ascii?Q?L4iEDmwe/TV4w93UOfFNql8ItQxaLURfksfGvc5PK1ObU1ALh/sG3rvPRa/T?=
 =?us-ascii?Q?HbV5nVYosN9WFW4wtzA99BebNqw8f/VC0/lgMAb2Eo1xnyu7z3SMaBA+kVZC?=
 =?us-ascii?Q?jdqQ1ra/ktqPaxpO+hs4UXsWiltXjysc7vuDvzCZUaFWTe0CvzNVj1mLXBCq?=
 =?us-ascii?Q?YQUaIQZC2mzeHWrwwmzrnTLYeXW2uOahFiiFc0T6M0ofaL4dNv6pbyNx0Ew3?=
 =?us-ascii?Q?0OWNPtsztUZcclrOPf2sLLgsBmI6XItu4tGFvayCKL8Ejags+NV0Niu68gbC?=
 =?us-ascii?Q?C6xfFs1DwuSVoeBcJu7DF095rJBFBliJBAGY9yWlDsIUh1CzjJIfhpZ2/VZI?=
 =?us-ascii?Q?BRtYs2f8TiJ+VlHLafGj3ODSEkhR2iUneG5UnlEx0DHatwHvBnXoalgvRYpx?=
 =?us-ascii?Q?sK+KTqnPRvxkNF5ngz4jlkCFz568pCBfb1zf8rz/FTRTEE8S1Mvn+tVBmDqt?=
 =?us-ascii?Q?5G5WosdyYzQ1RtpVIXAiGvLFJSh62soGDn4Uu6wl1ipcnNo68L5oyn9lyTfJ?=
 =?us-ascii?Q?aufDQWJDdjCAhvkWZjEIUQua65MJoz9KKCdr5ga5kNyqXrKmq5RCXIIzt+3z?=
 =?us-ascii?Q?AWz4/eNXixCBcJsAUIGA6zFXgvr1PC9adtF+ifSp4ctTJVLGyk95FTvqHw5d?=
 =?us-ascii?Q?0PC38t5cGDTP+t/ra9D5cxw8FS/VtNZl2BZJY1nKxXkoZBHvGf+za5EFXY0e?=
 =?us-ascii?Q?0Si/PJqAC1tZkNVDssn/8v+skPGOWKE0kmKlQDoFfGhIGWswT3/9qt67q0uV?=
 =?us-ascii?Q?Cr4/wYIudvM6qpJhp6iGH1Bg/7l3mFhzGZOvbIZ1yArdI59636fg+QDrqd6/?=
 =?us-ascii?Q?tWHBA5dvzLmbt8p3EHP33tXDM/EMxXcR3dbvRrYS2LjQZdXT/ruC1oBtHA8N?=
 =?us-ascii?Q?p0QgEhkVdMR2n27QXEFCAjPifRGeZo+sEtYdg9ih4q1d1wbdqWby19n8b3GF?=
 =?us-ascii?Q?zdhZhBG4VO+x+sxKj0HsIMkITPPgoc8cDgFOB/5tDYdLuKYQpbBcQWxHL+4b?=
 =?us-ascii?Q?sLBXdOCq+bgLDXX6frO2IJE=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 424be050-e3e6-40cd-e7af-08db58467d25
X-MS-Exchange-CrossTenant-AuthSource: DS0PR01MB8010.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 08:53:17.7312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VJr+6eaScBMOYxySfYL8t7/vDTRDz7RhXhrlf0mqcA1bQgQZvvPgVuD2aonp65potAAPyeFsIb2gEr2fSlJ8ERH2lhCeZFTA86w3ZPOIQCr8y3eXgJKB9qjGEmbtv0Ku
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

Enable MCTP driver on I2C3 bus for MCTP transaction

Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
---
Changes in v2:
   - Update reg for mctp node.                       [Andrew]
---
 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
index d3c7e7c0fd25..c0316c198a88 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
@@ -366,6 +366,13 @@
 
 &i2c3 {
 	status = "okay";
+	bus-frequency = <1000000>;
+	multi-master;
+	mctp-controller;
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
 };
 
 &i2c4 {
-- 
2.17.1

