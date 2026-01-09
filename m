Return-Path: <openbmc+bounces-1138-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76910D0CA00
	for <lists+openbmc@lfdr.de>; Sat, 10 Jan 2026 01:31:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dp0145vZ2z2yMB;
	Sat, 10 Jan 2026 11:30:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.62.133 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767938624;
	cv=pass; b=Gp7utbETK/egqmX4qJPvV9CF6CuBvSqzw44LTDTtri2Y8DQq6feEer36ASWyyV9rjslif+NGmCfMcqAaFEVc4c7Md/OK6ptL/421K8eIJadWFTeva/wO3LDVjj4oGiFUfSz2FgycVYMnlUraTTQk11knCDfHz1A6JcuKYvRsjuEvKbtAuOnGetOWBm00UvYxNTPFVTnTf8nvJ8j8zlkN1WprLsBjAoADykw2JZFmhB/gaIMDz9fy7Y7Lm2sD0U+HST0kpgA3DyxNfpVu+k1fY1YKBvbDlez4ae8SI8M5vYazbkPXVCc+AU5eMyauXA/vhERIGh/040W4KCb/q4gGqA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767938624; c=relaxed/relaxed;
	bh=usWqfwqCbimwMQwmTrHQpw987RLfMbp7loYL85FK37k=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kX0RsaPg7N+mVkliExO5zLNWqp1FNl1V4xk2AP14789HXQC3sF8f5pms845wl/5j4GWOvoijtU8UHoY5o5GtUFqd5EhAhSBRxPacPI9ADsAythmYGmtQ9dxudPjBb9IukqBSv/E3mYgzQpoT7zQW4ITPKl7y3OaDoGX5/k8WVgbJ9eIyrBjpPHy71ndeJF0IYwhB+M95OTSczBeSwRw4TMNEQ8DWONEzoRVDevS9YNrQFzZPJECnDfaZdajsVIjqnYwjrCtwGTPZ9WyVt8Iz0BtubywKMSpkorvgpyuF+W+QidO1MhfYN/4lJ6Qa/gaTjnVtcSy8WhEAqcQPzX63lw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=QisWxI6V; dkim-atps=neutral; spf=pass (client-ip=52.101.62.133; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=kchiu@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=QisWxI6V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=52.101.62.133; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=kchiu@axiado.com; receiver=lists.ozlabs.org)
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11021133.outbound.protection.outlook.com [52.101.62.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnWRg5mnRz2yFs
	for <openbmc@lists.ozlabs.org>; Fri, 09 Jan 2026 17:03:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nJpxSSvfAG/e+CTtM/Ub0iulHk2hCTK1CCWKnLmmxhdnNdqLjGlrfqyQcS1KcHpa8eXvOs1S/EdhqSHmHmgOUAi2t2iQD7cwn1xgQUdlXehMjjhuNVk55PIsqqF8YaMtYpb92BdhoO/lgCrXu4JVxC8CUXVtFxWnx9K/KRLU8OJdzkdi52mUMxR6/EQbzFQWEWU6lYwHHQbJZOqnzMKCVhb6auyTLQpIUGznA/hNVM6+8xJJ/YhsAAYd/8lYF2Beh7Z0KfH1aUaeLY/cwvgWdGmePgMRAer8GDekjOVXAPOsPtVyEflOLc5doBkk85R9R6jtjjxeo9RX98S8+PCS+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=usWqfwqCbimwMQwmTrHQpw987RLfMbp7loYL85FK37k=;
 b=kakYZlrqI5D5KK1e+fLDiZ2YML2R9QwOPKWBXNN49mcg/eias7kgtIWITERstTuvy2YioDAqMUIpjH1J7exelx77GrBSaTLWDwfne0v4aEnzEbfMKbjXcAiXgvG/6LcCDcBucOYvRzkeN++zpkFuyep5bQE8qCXsP0p1nlmOo4KbkpdQoK3iBG7LW8sEv7IT4e+XtmV6GlvWyt2dLCL7NtrmrBVVjxfPz2iNj+1ZVD5ZErMhkOlV+eHOWC46XAQ0zaHkOxkIuhjGYUX032gGKCJqcIoFNcmLsnfxtN9zEU9O5yiHI5nAdxh6mpQ/Y+3WXedq7TQRlatoW9ODAeAi+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 4.227.125.105) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=usWqfwqCbimwMQwmTrHQpw987RLfMbp7loYL85FK37k=;
 b=QisWxI6Vbw4AdUwPQ2ILbwvR6FAxGByBYBtHpm508HQ2222rsHTD8U02/oB2q/kQpki4c4XQgaMkuWWc4h438r4MKG8+Zv/bQf6IRwiphkGzSbz2zamvruqqpn/s/q6tx3Vvh7ncfI6z3hwRB99oxC6z2j49oD+J9NiIivPAiwRgkgEcqOx8lFkiL46cHnrjXWtS7BATizdTVERDhTyut1XcsgqOdhH1wT3czConHo4BEuakGQ6haUwhr/KjWSinWPE623jU8ayyqJOnBuWUlGuTP8IvqDiWG0YLTpj9Pu1GxUm/kaAirUh2EtnAjvsmloNdAz1XWR0JGhIR077edA==
Received: from BN9PR03CA0513.namprd03.prod.outlook.com (2603:10b6:408:131::8)
 by BL1PR18MB4118.namprd18.prod.outlook.com (2603:10b6:208:313::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Fri, 9 Jan
 2026 06:03:03 +0000
Received: from BN1PEPF00005FFE.namprd05.prod.outlook.com
 (2603:10b6:408:131:cafe::f5) by BN9PR03CA0513.outlook.office365.com
 (2603:10b6:408:131::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.4 via Frontend Transport; Fri, 9
 Jan 2026 06:02:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.227.125.105)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 4.227.125.105 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.227.125.105; helo=axiado.com;
Received: from axiado.com (4.227.125.105) by
 BN1PEPF00005FFE.mail.protection.outlook.com (10.167.243.230) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Fri, 9 Jan 2026 06:03:03 +0000
From: Kuan-Jui Chiu <kchiu@axiado.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Subject: [PATCH linux dev-6.12 v2 6/6] arm64: dts: axiado: Add missing UART aliases
Date: Thu,  8 Jan 2026 22:02:53 -0800
Message-Id: <20260109060254.1575868-7-kchiu@axiado.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260109060254.1575868-1-kchiu@axiado.com>
References: <20260109060254.1575868-1-kchiu@axiado.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFE:EE_|BL1PR18MB4118:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a67f301c-1989-4202-f059-08de4f44c027
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IodrKSgbjRNSvhDZ89v29eDufAQzg1MLRBj95OrWAJ6cOp9VO4rL6Kq+EYd9?=
 =?us-ascii?Q?Vos6kBJ+AAIWfrjtywl7o7hy5O/qzvGRBM2zQA1UXcdZ1RivZftyI7kyEg2b?=
 =?us-ascii?Q?8ySK1z1JoOL/OJilyEegEFqhPCL1Z7JrGsO2JpIbHjxJRkkBOlpgajS9XUl1?=
 =?us-ascii?Q?xY/kM4eGibCMnXSaNZbgvkKDOh+FazvpjCLAJfax1nX7Ns6n73QwuQYwn+b0?=
 =?us-ascii?Q?MSSk/MhZKvnRIff6x6l5cAcRDiCNTTEO/pWavX0JUXMzqlG+hTlo61ByVJeg?=
 =?us-ascii?Q?z+5dhFgJvBbZyszU+yslewuH2FxarAvvbYcZKUl/qUDXJyS7pTtbbrxhn/Hg?=
 =?us-ascii?Q?MEAcFzCqpq/xFfOG22tdaErivEzALPwfbanXEOeOUb2+13kQjtL/bA0BC0uv?=
 =?us-ascii?Q?JDXfZEUjtqsIN8qeHYrQresRelmIBYI06/NB2ssAUADrM64fI0kn0YWdQNwM?=
 =?us-ascii?Q?47qckiBDSlTq5qtleYH3t947IMuifzCzLG9O69oZefKpgYCtjwaOyaKZ94+L?=
 =?us-ascii?Q?xVlnla7dpJegi+wC5R31EqzSSXxZYRRZkbdnCk2xeG4K5KspQN/k6bWfwXCK?=
 =?us-ascii?Q?JFVbTAcoKr6HCcQ9II8G9B/Jx1H4qeHHHMorlZ3rZxJdlDuP/1V0Fn/cks7n?=
 =?us-ascii?Q?vS2RtXrmvvODs/GtPITc8pVuJGkdezG/uuTO0zXBzo4l6gEWjq457UgH4G1/?=
 =?us-ascii?Q?ZHlgU5yrD3Orw5ZWeJoYppybngObUCgjNVUhMd33lw8+6iQjEKqsFzq7xlOj?=
 =?us-ascii?Q?F186DdOuOuo3/vgyQ9kmx8bX71fx3GpPfNq4yMRAjSTNkdKMxsIyWWecocdB?=
 =?us-ascii?Q?hrEB5b23clqSuFXJBgofg4HffWAPDiFTcMW8yZVpzbdG+xz/MHPYuuagCNlF?=
 =?us-ascii?Q?pjeMl8TDPPH/g1D4rcpGFCSaA+dMNBgXdXCfmYkXpeAQWAAoQDq1Ois8+SVn?=
 =?us-ascii?Q?gfac++E409TJX/JqkCfyFO3bIm1hcWZwwSutecOpN8hH/UvEg/jswmEPiMSy?=
 =?us-ascii?Q?+dj4JS+Io25oUB85N0ch1XTFLkuKW/Mub831J80plZfLQDJIs2Yw1byU0YWl?=
 =?us-ascii?Q?0A4zSNmaRC9NEFoRVqre5tMPnFYp8ZHV/VZ+ipTuBBmORJuDcpe8Cv4CUzWI?=
 =?us-ascii?Q?uzdGUQ1NB14ML1W0VKN3mM+iZrlXcCrEK70TCF3ulzH3ZCYWQ5X2RcQrf093?=
 =?us-ascii?Q?OGUoEyjIwS30Zf5MXzv1l7jZeXQWVEzWEAd7m7OAkJTZ/rD4BTXbcElWOZyW?=
 =?us-ascii?Q?gCQsyF0K6LKu0+G1o4VT9poY898eSAjgE+UyVF/oy2EMIcw0By9emWXskkMk?=
 =?us-ascii?Q?+zUlx5nJi8Zuyz4jBmsmmfDr9HPyuvxkaJ2TASAgUC1ioP9kh1MG8tyNW9dh?=
 =?us-ascii?Q?cJhRR69LyIulrjevYxGA+Ea9l6KA6S8IDfpaMwSVlKwcDZgJaxS2A43mMOj0?=
 =?us-ascii?Q?YI9OzYCROimFmD/IWfzU19FnQWQmyCosbv2iaMqS7P2L0f3MQuyDhwx6WRG4?=
 =?us-ascii?Q?JjHe3olhJ9zOjeJFmx2cUmnWmkymhnZPjpcRuSzhjQh09tEAvBfrjytzun93?=
 =?us-ascii?Q?9UutmaR4ORur+Tbg0Jw=3D?=
X-Forefront-Antispam-Report:
	CIP:4.227.125.105;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 06:03:03.0211
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a67f301c-1989-4202-f059-08de4f44c027
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[4.227.125.105];Helo=[axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR18MB4118
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Harshit Shah <hshah@axiado.com>

Axiado AX3000 EVK has total of 4 UART ports. Add missing alias for uart0,
uart1, uart2.

This fixes the probe failures on the remaining UARTs.

Fixes: 1f7055779001 ("arm64: dts: axiado: Add initial support for AX3000 SoC and eval board")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Harshit Shah <hshah@axiado.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
(cherry picked from commit 75e81743e3815a934f5ec688a9837bc5fa56dbb3)
Signed-off-by: Kuan-Jui Chiu <kchiu@axiado.com>
---
 arch/arm64/boot/dts/axiado/ax3000-evk.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/axiado/ax3000-evk.dts b/arch/arm64/boot/dts/axiado/ax3000-evk.dts
index 92101c5b534b..b86e96962557 100644
--- a/arch/arm64/boot/dts/axiado/ax3000-evk.dts
+++ b/arch/arm64/boot/dts/axiado/ax3000-evk.dts
@@ -14,6 +14,9 @@ / {
 	#size-cells = <2>;
 
 	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
 		serial3 = &uart3;
 	};
 
-- 
2.34.1


