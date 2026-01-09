Return-Path: <openbmc+bounces-1139-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E01D0CA03
	for <lists+openbmc@lfdr.de>; Sat, 10 Jan 2026 01:31:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dp01B4hhlz2yKr;
	Sat, 10 Jan 2026 11:30:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.201.100 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767938622;
	cv=pass; b=ala1TNKj4Bp39hzk9zB8agWZGgsI+FlIv+yP1OiIZrnLG8lGo3bmhO9OzJjcn5SKhP18yGPs3fuHHIg0yTtVQQx8BUhT57qz29Z58RA0V/SXditqjB7lyZJSNsa6mpX5umiJuhrEIlg3QL8GU841QXbij+SmoR5KfqKPcxbKe3tj7rawIBZyRzbs5mFyKSnw7tel7ALkzknKkLmJHcBBDDBKuXiiBROLtRSU5SJwhuHFAtRIcareI/LtJuejoV6MvBb1GfMZczkBDXrP0ACBXa8mWynBPmGBnAEy5RJh354CRGUqQ28XJ4yaSasLEaEe/Cku4w98IJ6DKxlxF5LMaw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767938622; c=relaxed/relaxed;
	bh=zAcKso2t9qD7aUErs0JwfoulbHuuHiv7AbtOGALbb1k=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c7bCL+8NAUfDoN5ITtC9aAhfKJWb2+kZRAyA/qGNgVkzPVQLeb9d9c0emYpLcTf2r5XQv6504uEgcojJbOZRv5yqLli+Iyi0OUhYdKj8/l9BUdoAXz+LPdHp1nw+E0FjuNP4HnuLeS8I1tSSFRILYr+n0Y1d5nVvjbWlH1MorvMdjaXW04ej8JHakvxV6PTnlc0nEc2qIIcJGfpDLQd5/hDaNeNW8ZxifcpUJysfJKfulTwiP2+hke7yQr/kGrNOPWcp8TxKg9xtNYEa0w0MUZpq7/H2gPrnQyelciHzMQA2wxVoeYuS2sfYyT0O6iliY3TT3bGwgE/qacVPUiojgg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=LI0DdVk+; dkim-atps=neutral; spf=pass (client-ip=52.101.201.100; helo=ph7pr06cu001.outbound.protection.outlook.com; envelope-from=kchiu@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=LI0DdVk+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=52.101.201.100; helo=ph7pr06cu001.outbound.protection.outlook.com; envelope-from=kchiu@axiado.com; receiver=lists.ozlabs.org)
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11020100.outbound.protection.outlook.com [52.101.201.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnWRd6j48z2xP8
	for <openbmc@lists.ozlabs.org>; Fri, 09 Jan 2026 17:03:41 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PPiRer6bc1S1h3ZJ0kkUg17ajHf+qZ28olyE2sPo4LVtiIXnc9nVGEw0qSlcbjIuZP0W0X2l0lewgn22usXfqQBRf72EoIl/muoe++o2w8jkcKz5LhLajk+0H1PVA4BX+8m8CrJCTy/vQliRIEUe0gB2ImeSKTRc8imXhDfzTGO+IYR89lNWh8mw0gLwrsfFmQkbr8QFFQ+0qLQAfWFwPvr7jk0Q9OIgBPEWGXLm7RwuzrG+TGyRKGuopdXlPtOZyhJRPYPR5yRQbVKxkM7DDSBVTojnT8fEUNyZWgMHBgv5ogi3K/vObBRcKPNmKnLynaSIfUkzBCP8IeM1haZerg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zAcKso2t9qD7aUErs0JwfoulbHuuHiv7AbtOGALbb1k=;
 b=tPUFvJAK1jaR72YPQmfGS6H0y2wEjreiO41yj/L777Ye36bE3B69TxdMbjEtRsFFbSA1Tmo9YwIKGgww4y175JhxPgEer2PcQb0xfVZVI/GRmBc/tYGLS4A49yL4JtScOANWN7WZXZUwA1aLhdkbZ9WrlLSX5UTlldf3ACkAf78Bu1Atg+kbPh9fabrtqJPflgyrMnR56RkcFwV39aFM4OUNpVRalNH3sQi4r4jDu6IBCmj803qZ8qtEEtK8s4VEjDw60y3/vGBYjTTvigpgypAbySl5wWo1F24aHRFsBLFHJQW12WVTqzQpbTC1gl5f04/qhXcqPJgh7ix7b4jDGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 4.227.125.105) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zAcKso2t9qD7aUErs0JwfoulbHuuHiv7AbtOGALbb1k=;
 b=LI0DdVk+BWRkVT25DrbfTo604IvVFtm/l2M50QDAPsHiNig9pKBtvfZ87bQ6RQ+EyZa+Q9otjICUJQieP6Wm9fyd/oLg7IunXCqVLDprqzhER76qnvv23A+l12HmbCC5HtZkXmUKQswnW1dXpEu7Pkj2MNtKXQK5TMSj/cm9ZlwLVXjRhyjY0EmbbxN3L2kbW4eV+Qq/uyaxgNiovRGfTgn2/JcUUwfCgEZxXBtQosa98l0GgQ3lFzIHOIJlMDSy31OZSSRIYJoIG30sR8aewHEuoEGCbsiYKKLwtpg88uL0WgdzzC4Lsyn2PHzMy4rNoXBPc+wtvq0hlo7Lop0klg==
Received: from BN9PR03CA0527.namprd03.prod.outlook.com (2603:10b6:408:131::22)
 by MW4PR18MB5232.namprd18.prod.outlook.com (2603:10b6:303:1b6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 06:03:00 +0000
Received: from BN1PEPF00005FFE.namprd05.prod.outlook.com
 (2603:10b6:408:131:cafe::2e) by BN9PR03CA0527.outlook.office365.com
 (2603:10b6:408:131::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.4 via Frontend Transport; Fri, 9
 Jan 2026 06:02:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.227.125.105)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 4.227.125.105 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.227.125.105; helo=axiado.com;
Received: from axiado.com (4.227.125.105) by
 BN1PEPF00005FFE.mail.protection.outlook.com (10.167.243.230) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Fri, 9 Jan 2026 06:02:59 +0000
From: Kuan-Jui Chiu <kchiu@axiado.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Subject: [PATCH linux dev-6.12 v2 3/6] dt-bindings: serial: cdns: add Axiado AX3000 UART controller
Date: Thu,  8 Jan 2026 22:02:50 -0800
Message-Id: <20260109060254.1575868-4-kchiu@axiado.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFE:EE_|MW4PR18MB5232:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3e04d20a-9d87-4d74-a152-08de4f44be17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hh61xvL45Kpt1FYhBEcf01zP/NoDreiORTlGl+A82NxUaFy6Lbk3/IKbt/Ao?=
 =?us-ascii?Q?DoMaq1efxzPIKD508oo28Ceik0s23Qd7DcdxnHC5InIra7y+ovV6NUD8xmLh?=
 =?us-ascii?Q?QtDLELMRlLbjoJvj48lC6a6an7f5znPoQM/jph+wTit4pSt/dBAqY9JM8Roy?=
 =?us-ascii?Q?B9simG7EjT+XyW2UXvGr7gRJ3JwBMqykfsw4HlVuccun2Rs6mSKzQUFZDiyr?=
 =?us-ascii?Q?yP2Ukgb4MemDWAQe75gYGJvmAWqbsvH9Z+7ldFhTWs6vVVXEC1XHMvry5GW/?=
 =?us-ascii?Q?5R9JCvjaA36V98UNHUmenyMhzAOJ/hZWQJtFJocE8lisPmSqZ/07rjVWYU64?=
 =?us-ascii?Q?vE888S0PuKz1ZaPLekkTpaXOAO0RzKxWNwWzYvO96U8KfLiCdy8BVTYtNWMp?=
 =?us-ascii?Q?NtE0WkVWvAgfEyzS60WXnb/xa6bSCFyuJt57+jYETypFcfQbzM/HPyxQrS16?=
 =?us-ascii?Q?mJKZc8DwBCzdfDWurJr7zhREWzkaZU8OLqG2LAPxyIgVyhKU/DZQVvih1kUi?=
 =?us-ascii?Q?A/fDs4YxsMzaSw0z62jrdqFlU+KOWPs+RH4qRF4dEmFDzTVmb2TCjWLN+HT1?=
 =?us-ascii?Q?P/sdY81UYdiUhXztco/ayWjMsq2ZpaJSE9CGmvN5g/I36joxIq9Axmmt/527?=
 =?us-ascii?Q?QP5m5WK+Ph5hIbc5jSokCjmhx+U1oD5TY2a/U1Zryrq2CfMyOiNGuNUqHOP0?=
 =?us-ascii?Q?PXgAHN8ajMS8ViQnQP0yMpHXklYIYozx4NpQG+WyNXkbyFUFFFaZSQHml3oJ?=
 =?us-ascii?Q?SXlKASpPub1ZPNaaj8AAVfyU26DyypXwurkgo/rxOYGwWweBP40z0n15OV8a?=
 =?us-ascii?Q?tn/aubHEmZxS2B4Emn83Z91FNG00DYLrQDrvbs569gGz7gTWgYulp/vpJedN?=
 =?us-ascii?Q?HM+KHp9peO5P4O82fz9xWqy5nHFymdUYmdleb7YQv1VTydFzTCN1a9TWJkd+?=
 =?us-ascii?Q?ea2gfOVManaz4+xrI4cGQGcq44cELfTGBYH64wj9B9TWWfHsU4GbMckWCmpr?=
 =?us-ascii?Q?+FAf0XoEDICxe7pZytuqCmWcrp4bazn6edVmft7eaGW6B/S27Jyg9e2lLzzl?=
 =?us-ascii?Q?zd2md4YzmtKZUsintcWCxDVtVK2d1NJ5mkGHoZSln26iFSrFqieWKENI7Lgk?=
 =?us-ascii?Q?aiTlqLwVlN44Hx4NQzvF2YslmJLfGL6sFKREXRm2Bc3ccxXrwL4PBp0pQnCU?=
 =?us-ascii?Q?6W3YjVUsz9eCcdvcTBYn8yfWHOYIAnpxa/pIw2/1RwsJG+QQ2rKxpuEzhVDu?=
 =?us-ascii?Q?ruTrj53SyhT5wVjcGc44OjI1aJ0rF/a3ObQ6XADByTwFSyzMokWhuZ+x58FS?=
 =?us-ascii?Q?4Ukw6iomYGQzPLQdNzHRNtJlgsJ5NWH41SK9CAvPvwU/uwinPqMcqB/lX018?=
 =?us-ascii?Q?UvG9z08eT4k0oSUwsqhVwalJ7suDPG5sXKsbT/I7Vb+Jn+Xr9vlg+GH45CA6?=
 =?us-ascii?Q?adX4MlFEMLT/TSY/f3E0GbIwMijp2U5CzEPDvT2uuxHQX2PTOUXPK0Mu6lGU?=
 =?us-ascii?Q?9HlO8FGzbq+fi+qRkvHahxcCcNt9HL0vyE3ZYJLRBsc+WDEz4bZog+WYAn79?=
 =?us-ascii?Q?WcDkifFk7t9VOeLUyjY=3D?=
X-Forefront-Antispam-Report:
	CIP:4.227.125.105;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 06:02:59.5619
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e04d20a-9d87-4d74-a152-08de4f44be17
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[4.227.125.105];Helo=[axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR18MB5232
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Harshit Shah <hshah@axiado.com>

Add binding for AX3000 UART controller. So far, no changes known,
so it can fallback to default compatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Harshit Shah <hshah@axiado.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
(cherry picked from commit 7346be495b9ad23077d8fbfd953f341c92027067)
Signed-off-by: Kuan-Jui Chiu <kchiu@axiado.com>
---
 Documentation/devicetree/bindings/serial/cdns,uart.yaml | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/cdns,uart.yaml b/Documentation/devicetree/bindings/serial/cdns,uart.yaml
index d7f047b0bf24..9d3e5c1d8502 100644
--- a/Documentation/devicetree/bindings/serial/cdns,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/cdns,uart.yaml
@@ -16,9 +16,10 @@ properties:
         items:
           - const: xlnx,xuartps
           - const: cdns,uart-r1p8
-      - description: UART controller for Zynq Ultrascale+ MPSoC
-        items:
-          - const: xlnx,zynqmp-uart
+      - items:
+          - enum:
+              - axiado,ax3000-uart
+              - xlnx,zynqmp-uart
           - const: cdns,uart-r1p12
 
   reg:
-- 
2.34.1


