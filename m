Return-Path: <openbmc+bounces-1069-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 829F2CE5A82
	for <lists+openbmc@lfdr.de>; Mon, 29 Dec 2025 02:16:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dfdb143Qzz2yFy;
	Mon, 29 Dec 2025 12:16:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.93.201.113 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766714326;
	cv=pass; b=gbDFRwiy8VtfWYanwkNiQs/YF3rcG30rfscqXKBAP50IZhglL6AR07mY0I5LbnzOtsfrlzC37fHSE5J+0eGScyjrONhp79fcrxjH50LlY+ZDINSXKEkZAZdXnMXLUjBXazGaGSjHxO6WkJFrYTqoGCZULXF1rxraTeMvWXtXILfgxhm78SVBZehIiKQb2YguYY/fNPGlA8AEt5WO0BJA0AlN+yXOFAquoQs5b8ueEFnUn8cmXJdX1mVZWO4b77il5ruCSwgY4dkjgrmGUdv0EF7c6AmZGBgxfQEKJzbPOfaCSU86yXKwFt6ePz5L6juCYyqWJPLojShBwD51cIb+cw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766714326; c=relaxed/relaxed;
	bh=QsAA4fAQ6uSNr2I1iTS1gakQS9RMZET9OSRDGH/+0j8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VTn7TjSqmoPGJRwTsqCfL9Z46QKjTYkdkB6EEtNbkQDcb6gbPPJxwnjpcHWUo+RpCa55yrkKgmZMGHZi4WA5u6higWj+ov35nPK/eI0R/DYEvwuqoTd/jszUcdHDWHsycEPvh/LlD0vlPgjkMVE78+Gj2Dl6SJvDeNHU2fhqQmC0ezQfklLgK3zH1HHka7aQvGi59lUab+xB8EXv41ryq8c+bV6QYKASB+Jj4P6FYtAelLnJ+HrK2XnP15mEYvfvGAJUDxSyY/mVVLqaSVjrJh8KiUZleTG05rQrwce/WkXdkIjUC4UdkE2u2IPRXGIr97W9+AjRt4pixQtabbAAmw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=BXbiL++o; dkim-atps=neutral; spf=pass (client-ip=40.93.201.113; helo=cy3pr05cu001.outbound.protection.outlook.com; envelope-from=kchiu@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=BXbiL++o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=40.93.201.113; helo=cy3pr05cu001.outbound.protection.outlook.com; envelope-from=kchiu@axiado.com; receiver=lists.ozlabs.org)
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11023113.outbound.protection.outlook.com [40.93.201.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dcpgS5RVhz2xSX
	for <openbmc@lists.ozlabs.org>; Fri, 26 Dec 2025 12:58:44 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u0VFJf5n32QBBW3Eh44xK78VuO13bvsVTLz7XpAPSLvA1HO09AVizLyfol92ag43DBZg5b/AlUpaDksPSAoiLzuI+V+wj3gDXLIUb6nN3rTlKKrka5+wtWx+y6ugonI5scvFJC28vUxCoUT1rRgu4pSpfksAQYKaUcZB6ZRD+Myj+22jP/8sYnrtGponnnbcjflsxa5BUBeIquOAHr7qtmuymV2tGm3EmJslyX9JlDACZCgkK4nkJlvARA0Q9uh7rzTY8KRTCg41U9J45BtgIdxZpZZp4v11Fz1SsVD271KJGY9O+fn9oCOC2XyPbMLSYsWRef0cxiZI89MpLlC2Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QsAA4fAQ6uSNr2I1iTS1gakQS9RMZET9OSRDGH/+0j8=;
 b=hzr5m2f4/dP9+JS5WqokAdKjq4M0R8ejBD+9BfHHsdhZRFWPQxC902lvSoLW8mO35Up5iSf1QGhwL4/Hd7HWKcfh1Qr1ZyUfAo3vvAfy6RfN6truOciK6IoWPByknfcRxqO7L13C7+rurboUjx9DaXSHyYt7pijKyURuxCcYGIcf+cCOzN6p/Uv/kpPmbUCZXuyxNFPNWfLT+TbEJ6KLjNbc2yBP9VY0tHM1ZEUYOTqOwUr2sL/X9M0ojwCWFxBp4txPstrRa1qSKhfazllnuXByHncxmaq31xNSM5K3jn+Qsb6xxQTiFUMFh7oxZwY2Iw+GnEQsh76Se0n9PCsfWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 4.227.125.105) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QsAA4fAQ6uSNr2I1iTS1gakQS9RMZET9OSRDGH/+0j8=;
 b=BXbiL++o+bPTd882x5rNezm+cqsLI5KhmHBJDVpwyMjUejsvdwDwnR0V1I5nZlWgjFfQFlMo+0mboESROPMf3OUpiwndPttrWWdEOFgOKv5KxSi4KvPDU50F03nxQO3gIQl8vMdayq3fqY9VPHnvOWeKUXD99WuI29j1pIORYGj5HrWtNiwDhA3j6EYCNgrQq/e3RTq4NKZ+7afh/IyaqVYQ8Vbnb95wW/xAWQzNmco4Yu152Q6wbuDPuuJxiG9sqLvmjca3cpVuJDw+pW8dbzT3TU+1aJAytkZZX2pzDY+bvNqOVwepSMCZww9vsLxQxECSalHFgth4+PfALPOPjA==
Received: from SJ0PR13CA0020.namprd13.prod.outlook.com (2603:10b6:a03:2c0::25)
 by SA1PR18MB927701.namprd18.prod.outlook.com (2603:10b6:806:4c1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Fri, 26 Dec
 2025 01:58:03 +0000
Received: from CO1PEPF000044F4.namprd05.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::d2) by SJ0PR13CA0020.outlook.office365.com
 (2603:10b6:a03:2c0::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.2 via Frontend Transport; Fri,
 26 Dec 2025 01:58:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.227.125.105)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 4.227.125.105 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.227.125.105; helo=axiado.com;
Received: from axiado.com (4.227.125.105) by
 CO1PEPF000044F4.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.9
 via Frontend Transport; Fri, 26 Dec 2025 01:58:02 +0000
From: Kuan-Jui Chiu <kchiu@axiado.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: Harshit Shah <hshah@axiado.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH linux dev-6.12 2/6] dt-bindings: gpio: cdns: add Axiado AX3000 GPIO variant
Date: Thu, 25 Dec 2025 17:57:46 -0800
Message-Id: <20251226015750.377679-2-kchiu@axiado.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251226015750.377679-1-kchiu@axiado.com>
References: <20251226015750.377679-1-kchiu@axiado.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F4:EE_|SA1PR18MB927701:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e52fcaaa-f016-4d74-eca3-08de44223425
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NwqWp7dql7BEjtgztZ/vPIskcHL4NVg2LORDvEo6hVpS1CZ8m8xsR8Hq6t2u?=
 =?us-ascii?Q?5WvPgjN0GQms+kgupzux0Y5uudB2xOv94JmBm/uU0kNOfFTkDTSaM6Ah7dTp?=
 =?us-ascii?Q?oONRjZR2CSJ+h4SBeOfu9bzcs3rfzjVmUW1LwK2igbG3xWfQIdWO9Y0+1tZI?=
 =?us-ascii?Q?jVf69aLYorxgq3kePwWxvIgtyxkGkPiXkNt4vdO2Mp4t3PJQzz2U7kSaunP4?=
 =?us-ascii?Q?OVsciVTsU/bTykTHl8eqLHOGL828FteISszM5rjVbFTvX8bPAIC4xIWblC7T?=
 =?us-ascii?Q?B4eETglUFJIR4uAVEsYLDqzxEKxYwx8cmWFAQ1znOeWQVSHl2PgKbL8nTgzY?=
 =?us-ascii?Q?7v8lc/UmNtkfkmANBs6TWb0bT7njJGGz4ztInRqCq/a+9/DngiGttzVujXvn?=
 =?us-ascii?Q?HBP0YE2KCikfX4+C4KoXOxfwqSNNKTb8UE4jsSVj+xLWIH3jwwk+3NAWZ3i5?=
 =?us-ascii?Q?nP+HF//R9V6dJ31+ESEFHOydK0ZkNMh17xZQx1Gjq4S3WyTpxgO0KUly+A2z?=
 =?us-ascii?Q?aPcPAaXZPOqf3EJWlQ1G2dSUIt67KgWw5vx+/sb34nrdjbnoTIrgK3IvzlAR?=
 =?us-ascii?Q?JMvoZgrCvYe8CMRv+XZ+5+XHAIqK7CCBNI20MA63reMvfMTIFgBtwQWY2SBu?=
 =?us-ascii?Q?XQVVh8yvUdaW8cXbvp+f5UIpd/VTK1sYu23ePTNXpA0IqNU3kV0XLwjwP6pq?=
 =?us-ascii?Q?7Q5tiMl9fhnZt6gP+8OcGZT/oyOtkHxPwaSk8kx16Yhn5EMg1ersmVjJNUjo?=
 =?us-ascii?Q?XzRbbEHTIHerXWHundgQjdsOha8grb2jkjM5tjfly0k2FI/4PWfTv+anRI5i?=
 =?us-ascii?Q?OjaQJxFTLnoQZ3tKNxymI6XV4Db9OxEUSVJrkv4MxGTJyqdSkD1hI5WLvzZh?=
 =?us-ascii?Q?O619e7dSKGBLzyEJfyPJg2qIYk4uhfqQQvkMOHYus3tySqxoFaR4g8tZhvmO?=
 =?us-ascii?Q?gnXT3PRQC1WwYp6GBRT6dt74t6d2x/kpvtkJcVXhxcn0NQIGhmHnjatCQe7q?=
 =?us-ascii?Q?KdX+8UMn2F2lSOlFzmDYNE/X15ObIvR+bdlcaO/NgWi46PYXZ56Hi2NL+6ML?=
 =?us-ascii?Q?edv3WRMy3cA7kw2WO6DLwxIenHX704guuwqMs5l6nt7vmzrTcKCodrc2uNXz?=
 =?us-ascii?Q?fbV8EhLjPchRpCk7fRpymZQWT2dKW0R1kSeVzr2AfxBpcLibQ998G6U7igPi?=
 =?us-ascii?Q?rZo/aVU2JAOgAjRx39MpdWB1k7mjAx4VMVirtSdHbIyT59YuA+t277DvipqY?=
 =?us-ascii?Q?bV8Z9ybYYpXI0mA3Je0dpaGqLeuDyqxt1DWyZIk2xin8JyoKCtC/JLmxxCPQ?=
 =?us-ascii?Q?994zrWWIonEv5hQgKphQhrx0TkC13I03GnzSRb88JxEfVoUBeGkZTsfbJTYd?=
 =?us-ascii?Q?xibDXTC+dl+Ul/KJY8FXYVZdQGt0/CGyK9gfJp8GiSEup4kYwHv2QLHbmUhT?=
 =?us-ascii?Q?3uQLg2UoJqfsNGUedjKWwj+XKVNOzTTPsF0WSKLEisNqvBY556KfYVR6lThP?=
 =?us-ascii?Q?jeQuPvIyXSsaYNtSQcERbYNpUAh1xLq4qkaBR2cZ+y8zu39BD/YIusr79+UR?=
 =?us-ascii?Q?atbl8s4oyvqLtg7CUiY=3D?=
X-Forefront-Antispam-Report:
	CIP:4.227.125.105;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2025 01:58:02.3239
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e52fcaaa-f016-4d74-eca3-08de44223425
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[4.227.125.105];Helo=[axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR18MB927701
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Harshit Shah <hshah@axiado.com>

Add binding for Axiado AX3000 GPIO controller. So far, no changes
are known, so it can fallback to default compatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Harshit Shah <hshah@axiado.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 Documentation/devicetree/bindings/gpio/cdns,gpio.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml b/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
index f1a64c173665..a84d60b39459 100644
--- a/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
@@ -11,7 +11,12 @@ maintainers:
 
 properties:
   compatible:
-    const: cdns,gpio-r1p02
+    oneOf:
+      - const: cdns,gpio-r1p02
+      - items:
+          - enum:
+              - axiado,ax3000-gpio
+          - const: cdns,gpio-r1p02
 
   reg:
     maxItems: 1
-- 
2.34.1


