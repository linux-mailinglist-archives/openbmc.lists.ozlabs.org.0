Return-Path: <openbmc+bounces-1140-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B19C3D0CA06
	for <lists+openbmc@lfdr.de>; Sat, 10 Jan 2026 01:31:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dp01G5LBYz2yQJ;
	Sat, 10 Jan 2026 11:30:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.201.88 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767938622;
	cv=pass; b=HK4c8Yyq17tK7NE8iiewtlSypU9pYTBHRi8vmrvqg56XpqK3UJDcBD5d40xbB3+b4obYR0irtZLWaNDq62yT2PFira+Ju+72PoAy5YNen6DLzpZCMviGhFQQfBbniKuDfhCjE5CQAxLhufukfG0nHjHoTOtkfgauCLVdSbiuFP6jM3oH/D2h1TFUlkpICu9qXGnIWrKDH+YnFRkcWqtQlW2RxUpZJcX7OciiAOkdjoqeLV06ys/fZRgNTDj1zfsRyG4wETJ6nE/xSqX33oQS52yRPg0RKMyJ/gMfKfTz5rzlkCAxDF2KGsrHNGdCz1gKjQhFkWp5I55QgoSs2F73gQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767938622; c=relaxed/relaxed;
	bh=wAUkXI79DdPrn0jeEBvJLh5rjgGGxrNJxUyTLdTc1kY=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ekWQRn/KGRPx1lZ3drE/V2diQuUzzv55SJTCqGi9Wwgy9zL6l4ihBV0yfIqOOVvAmiyhsXcgZiHmf3NkNPnwNKhVKmg7OAtLw7pSbfuNS8qe0nuksbXVkuH8+XzbsaPyMJadUWzAAzBYomYI5nwlL/UtryIN4lQgatDC6IkeSuCmGoL8QoFHEdzKkAKL3d0DdAffdsZem6n2MF3sE8kAGjeaPwmo+Om5ed9fRMWLgBqESMpADfZTW0efTfik7m7drvxzsrA63wfiUY4XH6RUr5t6MFdeG/E5osG9k1q2mxhJWezKzRsR+cGdo/m5ZRayl6WPuSucWrgYJ0g3Bc7QFw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=jZttFLk/; dkim-atps=neutral; spf=pass (client-ip=52.101.201.88; helo=ph7pr06cu001.outbound.protection.outlook.com; envelope-from=kchiu@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=jZttFLk/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=52.101.201.88; helo=ph7pr06cu001.outbound.protection.outlook.com; envelope-from=kchiu@axiado.com; receiver=lists.ozlabs.org)
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11020088.outbound.protection.outlook.com [52.101.201.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnWRf2prYz2yFs
	for <openbmc@lists.ozlabs.org>; Fri, 09 Jan 2026 17:03:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SfmUdxo/osuQdy7556Z+AXqc8c/dl2o+YwWV1Ze8CviwGt6E36ccF3MXjAF+de5veBvVSEn2McS4PcmSl0SgRAgAwYbOs1kHHOwl3xvVslu8n6DNmMG+sRfEtxVMLOrTAYyboiGITkWQJBbtE1Zk503MD2o2zUZgKCk5rb0GFw/7Nshb3lyt+93lQB8RCvgGIiYrTNkyeXxS+HnBvcbWGPL8lRfxdI/YP62xLeN7ZBewA+7ABJnmldKcWAQLgkpQb0UX/okip5aeB5YdepMYfVlZoRuJDSfQYT81LdOQXzE/6NnMQpETnsuUoXYqC7ZSFaTsJIXPwDjymnOW75QISA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wAUkXI79DdPrn0jeEBvJLh5rjgGGxrNJxUyTLdTc1kY=;
 b=cCX6TThMMuVDwPvnidXZHyY5s9CekyJJ8UAGCIhLIGig7LVP4S8LrH7dsXKIrmkRDwQcQ4QCYNoZeA+w+VkwIZrThdvBDQTxxooMIpHCwHm+IyVCtiX2/fwOmTAoynqzR8JtMxN5oVugbr6mearlf7h/yTglobpWy0r+ycqyejONNxEhiLB0SxFChgeK3ct5cEVg87RCR2yIpho4bJyQqksLP1zrT2uxwBrqXrQLIKwrK4YZrwyb269jYMhG1YfjG4kNfiqZEXbgqcXRGuh2nujSRmh1mXPR54Rfv5XXHlrguAwAvxoUDyYdchYcwmxTc0Io1pMkcuXvGyfbEztUfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 4.227.125.105) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wAUkXI79DdPrn0jeEBvJLh5rjgGGxrNJxUyTLdTc1kY=;
 b=jZttFLk/lzqPifcJCoGNX2tVFb3Q3AgNu0P7xQ1XwcyLf4GG+qrRxicjkc3KQFzilzD+7wOE67D2hoDyzVvhoJ7zAv+fwLyrUI5N500KwO8Ovdgkbn7O0AnPRmTN60Znbro4DlSoTkMg5gbS9MeS58Zxm8nTXHCcJ67N21JA1VVDrHcV2O7pyApivwM+Ne5FSGdJZ8JUkEn3VXmn/7qYZh+qtxzkFeNWSG54TYOctjh+icv8YKVmppSe5zCRSYVibvKuDn/P+mbEUuPou6j11aEQ9i45MtlY1/TChYq0Zf+tr/8zYX5IoTBiuLUq5vxzk4vXa3gfq4slzamg2pQgSQ==
Received: from BN9PR03CA0514.namprd03.prod.outlook.com (2603:10b6:408:131::9)
 by BY1PR18MB5839.namprd18.prod.outlook.com (2603:10b6:a03:4b5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 06:03:01 +0000
Received: from BN1PEPF00005FFE.namprd05.prod.outlook.com
 (2603:10b6:408:131:cafe::c2) by BN9PR03CA0514.outlook.office365.com
 (2603:10b6:408:131::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.4 via Frontend Transport; Fri, 9
 Jan 2026 06:02:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.227.125.105)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 4.227.125.105 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.227.125.105; helo=axiado.com;
Received: from axiado.com (4.227.125.105) by
 BN1PEPF00005FFE.mail.protection.outlook.com (10.167.243.230) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Fri, 9 Jan 2026 06:03:00 +0000
From: Kuan-Jui Chiu <kchiu@axiado.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Subject: [PATCH linux dev-6.12 v2 4/6] dt-bindings: i3c: cdns: add Axiado AX3000 I3C controller
Date: Thu,  8 Jan 2026 22:02:51 -0800
Message-Id: <20260109060254.1575868-5-kchiu@axiado.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFE:EE_|BY1PR18MB5839:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 72171801-350d-4a03-8e2b-08de4f44bebc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DkLE1vMESq3zVHp68tPsF5FuxgZeBC549LQMFYP++oCcROdNMUbyuS1JO2PZ?=
 =?us-ascii?Q?1216YojWBX06irJXxohunwrfWMMySz1mORWBsYTiqGF3RmsE/xjWWEfzvm96?=
 =?us-ascii?Q?Ns22x2klKy0jl0NVo9NLaYFCJvYXf2ZnzXrtL8giQ0Mv7nBLQ7a5Bh3D9CgP?=
 =?us-ascii?Q?jnxud49XnjXUFqH5MgWzUFTGFKbzGBICWoi+HfxN7p8l87hbObHkNouRTpjp?=
 =?us-ascii?Q?YUgOs31N+fkL5IPCiLC4ykD5Ybnfw7c0j4iRKCxftj5Lk0ikRpq4CeVMNqNZ?=
 =?us-ascii?Q?mxb68cJm02bgiER88Bx+CSd8KNYQyx1qlEoNZpIz7cPWNCKWZNaONKLZRlGQ?=
 =?us-ascii?Q?kkFld4l1YCVMsL4Y7yrsZsrime9npnIqKfyGPVloQeWaP1juU/Y5/YN4XmjW?=
 =?us-ascii?Q?765KaS6HFUg494uO41hV6ZO1nuBhl77KYighxyFHgyFwfYR9cpTLhF6V88LH?=
 =?us-ascii?Q?rauhuFFO85rCXOKPt02yElcXsdXFoDp+qLAL8OjJMlWkHmJuJd1fYiClqcZR?=
 =?us-ascii?Q?fua+Osdkf+/edYO/9MniA9qM/pU97AsdRczz8NuFTlpg43rr7DeAmWvOFkrw?=
 =?us-ascii?Q?60nyGUG/3ze3wmXx8JZ+NSpP67MSs1XbkT/5l7KgJaFhiE9hw6Hlez71soqQ?=
 =?us-ascii?Q?iuOwyHxoinwA16a27X73sFGKkLobW+5+Gm9dg32Vbp1YA8xgWLtJioBspnVM?=
 =?us-ascii?Q?rpcs6mfib3j6fNN2411JHSgid6XJe+2e81xsf4F2A2QIIsuhkc7LVJ9PKxzZ?=
 =?us-ascii?Q?Ui5pOOXvt+zCASm9Pb+iy/8C8FnlsZlp83bQqwlhG+81pgDZLGKH3cnpszGt?=
 =?us-ascii?Q?2bumgJukV28lKqvtYKkb6TxiWDoAyIf2ijdhNyYsOewgn/sueaEziJtrygg+?=
 =?us-ascii?Q?tSSqVE+BOxIoGX5HF4A4E2cXOnWJ3bEDxBzKtrUm/EjiOrh8B82WWMNV2MLq?=
 =?us-ascii?Q?8U4T0Zm1XUqjQO6Pk8tx4ayne1T2i8yUMyc8+m1Cok+uy/8xILQ16Pl5iSMI?=
 =?us-ascii?Q?9psZTaBV5xYIWlr/1cwFR62/yX1Dbfkqj1szNKDPgRg869NpRQMbgmYAEeno?=
 =?us-ascii?Q?fYIub055qT52K7B5U27ubTgCfU8nd3t5U7JoJMUTv/Sk/Hs7iomzAJd0i95X?=
 =?us-ascii?Q?3S6Yb6h00yheaClpLq+czS2AMaasu6pYclRvNRj/ij4p/bX9A1JmtDd6RiV6?=
 =?us-ascii?Q?gcK8+u2NH5ZgN2G3G34OGXOPpmeOK6JdHjKJLwgND0xXsRWnJC8C3VhODzIg?=
 =?us-ascii?Q?oLQ76CujPmNr7LNiCY+4osFmkmvsfX1GoWVo8//ia0nO4rRNRUZBKZo3buGd?=
 =?us-ascii?Q?jlFJqy6MXiLvi7On8C9icZtb1avC4EAadTRtnEecF/3xkq1ah4Id8a/rxOTr?=
 =?us-ascii?Q?rx/sP6HxveorhAgpqom7AGhAqASNWllHpO8x8bODGHScL9USJ+RW9ie5VmT3?=
 =?us-ascii?Q?HpSk+u3yKDX5DopmDx9q8uEvgqV4B38c8EDnmmGvCgLQf4Rs34zBhA3Wsgxf?=
 =?us-ascii?Q?6e+BzznWZA82cK1HyNkhtctJH922QmLjS1XURSIy/It4c1mrr+mIN/pRX0/K?=
 =?us-ascii?Q?uMD2EmYcm4CiXGf9UTk=3D?=
X-Forefront-Antispam-Report:
	CIP:4.227.125.105;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 06:03:00.6427
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72171801-350d-4a03-8e2b-08de4f44bebc
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[4.227.125.105];Helo=[axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR18MB5839
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Harshit Shah <hshah@axiado.com>

Add binding for AX3000 I3C controller. So far, no changes known,
so it can fallback to default compatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Harshit Shah <hshah@axiado.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
(cherry picked from commit 678fefdfe9de73e8043b971a217436f82d93f6e8)
Signed-off-by: Kuan-Jui Chiu <kchiu@axiado.com>
---
 Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
index cad6d53d0e2e..6fa3078074d0 100644
--- a/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
@@ -14,7 +14,12 @@ allOf:
 
 properties:
   compatible:
-    const: cdns,i3c-master
+    oneOf:
+      - const: cdns,i3c-master
+      - items:
+          - enum:
+              - axiado,ax3000-i3c
+          - const: cdns,i3c-master
 
   reg:
     maxItems: 1
-- 
2.34.1


