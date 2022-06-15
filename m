Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F7C54C43B
	for <lists+openbmc@lfdr.de>; Wed, 15 Jun 2022 11:05:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNKCk11nLz3c00
	for <lists+openbmc@lfdr.de>; Wed, 15 Jun 2022 19:05:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=h/QI2OXR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e8c::72c; helo=nam04-mw2-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=h/QI2OXR;
	dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2072c.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8c::72c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LNK9R1rCjz30F8;
	Wed, 15 Jun 2022 19:03:55 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BsXi5Ga6KRp/VtFG7UzBz/g3wyBM+qnLTpKZ3lfH/HUXdlWjwuG+wAAZa5A5s4r7ZzE+8mHhcgLXCe+IP65ncu3CISir3Br2+ZtCKZLicXw7p1DIMFfhq6mi67dy2nOKWl3azQ19RqYwqyblavsgj7EN5mXxzXm1PqVjJhk47q/cI80z2R9C1/VtS9d+Oenn5YmhS1a9WSr1D9hdaA7V7lgYOYvfCPig17cMvmXazow5NhfbniY94ntmLJwWo/VGaG0vTOt9VF1rEODccPdALPeDcdaqkoQTXVRQ0ZUm8l3Od6pqxnReGCNuIMCgTyUy/LKm3vgEyhiWqB/ZtHitCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wkjq0qshKkkEnrp6tWg9ZoVy1g9YcPkZ/ZuHSoon950=;
 b=QPAgaxb+bufbzgr/PgVGkmg/BWbZyEKJC4DHCm/Sy0GilRoLojYNx1dJdnLhgHkWCX0LLaA7xcLXT6FsNKTfmjFWMlz8JFnq6vvlQVoFoyTkoewgf1Rz4l5jl8NF4a+1o2joifNjKNtycdzLoMmXEznOS9nthGMf4GSl41NwSQao8L5+K+q9HrJLp1KAyAOBY5Um2uJ0jHFU40Ymoy1bExA3lteRiyiSlbw3tGeczHeRdF9ySw047bCMm+mywp/oVcPgFug9KTS1c2fd1bnNG+Y5UNYrDvhR01+FLk18OFYvtAlNFlzbEIrhDyoaAVnVHcLZcH6h8ppC9tPcCk3KJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wkjq0qshKkkEnrp6tWg9ZoVy1g9YcPkZ/ZuHSoon950=;
 b=h/QI2OXRlMa4XRgQ3oUi6qE5GkBLXpt0ysS9/7VU6O3a7cPxo85oPgvEET3txsZgED1BdbIi6jHmcDdXOPN8Y+oVucWbDJvU+2WU3+AUttFFTZG7oaiNwvwCCb15aOIRSqJLEmjTFGGJCQNxPFGGk8YA0NpN4g5LUWFcVCkeVOs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BN0PR01MB6909.prod.exchangelabs.com (2603:10b6:408:166::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.13; Wed, 15 Jun 2022 09:03:36 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7535:773:f979:893e]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7535:773:f979:893e%7]) with mapi id 15.20.5332.020; Wed, 15 Jun 2022
 09:03:36 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Quan Nguyen <quan@os.amperecomputing.com>,
	Corey Minyard <minyard@acm.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Brendan Higgins <brendanhiggins@google.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Wolfram Sang <wsa@kernel.org>,
	openipmi-developer@lists.sourceforge.net,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org
Subject: [PATCH v8 2/3] bindings: ipmi: Add binding for SSIF BMC driver
Date: Wed, 15 Jun 2022 16:02:58 +0700
Message-Id: <20220615090259.1121405-3-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220615090259.1121405-1-quan@os.amperecomputing.com>
References: <20220615090259.1121405-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0189.apcprd06.prod.outlook.com (2603:1096:4:1::21)
 To SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3ba8358-1e2f-4efb-1335-08da4eadee42
X-MS-TrafficTypeDiagnostic: BN0PR01MB6909:EE_
X-Microsoft-Antispam-PRVS: 	<BN0PR01MB69095F7A9E0D3920B3D744FDF2AD9@BN0PR01MB6909.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	YjdQnxq8ml3RVcqgdJAyMuI9VbtNl9TcaFSU8NqJRYGn/VZPh8vxF8WilAfBFsbrpk0/6VQn84mDYdgovrjMCnhDsDvJzBOoZnihGlqO9MnWQxWWzqCFRQTevJaEqDJkH9UGawRN7l0xiDCAw67Uz4GuSJxtaGF+7gYYE6YyVW+C8Z4IPpOlTYiLL0Pr0OR+6ryiHt4G+PKAEazvBDthKe6AEvKgUs7VbiTDilFNYbkJFmUPVuQKSsLup+sdhdfOLWN3Tjj2/cIWKD5H5jMKseOq6gj7NEV7qRDQI5WK7vwZe+7aJF8QVuKT8MPXHmnoHwrNYWo37tPxc/LeLJrVhy74lnWycmBtz8PyRUhTu+amIeLqIQBIZhqVyZI3RLWLtCzh/0vfHFEpJhkP5lMduGCqabifaYnXoe67vZnlbeEQ7BSjFfQ0muVezc/ur2GDrzq9Afyeg8/P2uhe+X7OYYR66pY5GZ9erMC2gitgNza1kIh8GL7fWVeKQnxO+woVQNB+R+HyTV25G43oa5ezth4p/SBt17E15rqwkbWCEnyBJ17RQmR6w7owQW+L36ZUQWZV+jJPo3+mUURGw9KOp7Y9p/p9QlRPygFWrymr/KEu0UjVfSlaMDsBtG4qQ1wN3XGX4Yxccc1T5bSzt8uIz2GKvM2HqLtxBrxTua3TaL4DTFswGwnWonJCj72ikdUIYnUoct3rkzy+I00qpSvwjkQlbnWvLlNNf2OjcVjf0CM9HmgIbGIDX5WCri5cZEeGjVzgC25fWziSNPhIscaTxjCm1knlY3577MaMfI/lqpY9gITHqHnWVBdAYDDPMPqfDvtnE27VfygC4N4FJpzEMqIk11EftWyfcF9E7k0VX2Y=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(110136005)(6486002)(966005)(508600001)(2906002)(7416002)(6666004)(8936002)(186003)(316002)(54906003)(4326008)(5660300002)(66946007)(66556008)(66476007)(8676002)(38100700002)(52116002)(86362001)(6512007)(921005)(1076003)(107886003)(6506007)(2616005)(38350700002)(26005)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?diS24eXfVXIBHORkMT761Ix6uXIQ8+RyNaDUV9m7v3vnb89dmX1KwxenBiDX?=
 =?us-ascii?Q?ZG/SOsVRBtcAyI6rd/RXJPIzI/8XCxNVI8CwSAEYrAP/5ESTnEb7WHsSda6Z?=
 =?us-ascii?Q?N2ttTMDmHQwmOZ+8UDRuXbtaqq2GOyCLzXWsGm+BtsYhcBfD3OV+5tk78gtA?=
 =?us-ascii?Q?iDWGkI4AB+u12GZg9a1PdF5fPk520DtRQdmyYCpLyu0+IUATJNvN2xSofCwE?=
 =?us-ascii?Q?656S3DbpjjlQkvtavpgiHivb/WDoCVz2LJOzzoFzfrN2Y4pSqNt9JyQbkoXa?=
 =?us-ascii?Q?DbSsHceurHTr29f6pYu4zMoWKF3VEbbxxJAPrRGmBwjTlCYBRAVuPD2c5n6B?=
 =?us-ascii?Q?iTuqkBkRiknIetGabp7NHYuVdzOJUxecigDzoRiO/Sxu1uM6I0+QHZCTAn+B?=
 =?us-ascii?Q?Gp2/odMx6kVKiTVSzUjvHul8tlt6juCdmo9XqlKkHtVXo8hSFSX3xNxJCPwr?=
 =?us-ascii?Q?JXQHBTZZupUc9nXUHb54gqUrgh8vyrjQQS0cc8ombeU6qFHt3URio2nIfZjb?=
 =?us-ascii?Q?YSa2QXYQqxii/7yKpp02Y/VLWcf5OGeIIKVbaih6FiqydtZa2qIHj24zFg+W?=
 =?us-ascii?Q?vKSngGwU8Cj0QUlRzTJjsoxkcvqcjIypQ5mUj+sS5DEtTgjpfgfCtc6I4tXo?=
 =?us-ascii?Q?kvIZk6Mrj9focb2DaDYQwxSNQTVN7xSqcdx1GkACkvARB0frdJQqvwXWDDe9?=
 =?us-ascii?Q?QAXmYKWZYcNX6zW86n8Hf8bI0m/CA4WSe0PuN3F3w4qHu7LhHFOQIM4NsuWU?=
 =?us-ascii?Q?r9aWJAM09OCoXc+8ujlX69KPzHqj7mwzoSUdegNqJ4gretdTIWzdg29K6ACC?=
 =?us-ascii?Q?e+1DZxzXblfdUWcJSNM2C79FXsXPZAft+JNjxN1ZUO3sanuaKphjzRMzucB+?=
 =?us-ascii?Q?FX5PxXHc9IFHGsDetR476iY3rjzSA7vVpTWHZtLE1bw78xiKT3a2QmytRgpQ?=
 =?us-ascii?Q?vV17p3HHzKaX2xSVzYtxedGqana/5nWF3rzcHhWi6PKG2MfokEgKEHjUPrXm?=
 =?us-ascii?Q?in/dXr2OV30dJUDlV8GtDCMFCQEmG/ruV6CKUYdf3dlRzf+l3Qsd/5n9k7qD?=
 =?us-ascii?Q?z7UxusTZqDqzmBcEuJ81px23rcpGap5gyH/CWPhLm7ufPqAvrHuo50uxfXk2?=
 =?us-ascii?Q?JFoBluBKE7rvk1JPTLz1ugXgYW4t4+mtez3FD7vAyL0t4vu4+PQ+ZasnJx0S?=
 =?us-ascii?Q?Z/oAx4p2bgGty3LcQIvkzc9XSZj4iwe3U07q5I/xKjcQcvxiUoAWEOUK6PLw?=
 =?us-ascii?Q?KryXn6WUtEb2tgeztRAA8VeFNTxxxRIVPtC8DsyvGP3/Oww3eG/9EmxGt2Og?=
 =?us-ascii?Q?N8itMdiYVpTbKFX9wBPgt9paqcJwm+p0rupLrkFF5/sJhH/gbGMNc4h48vxh?=
 =?us-ascii?Q?Umv+0aNb0X46L7w3vaKIcc1WChLiad4y5nCecQs1cG//uZijy6dXR6VLqus5?=
 =?us-ascii?Q?gOru4GS1FDDGiQKucuvtHUCz9pXvVbqr7GR/6cHRR1jzKABWHdW93orQ3GqS?=
 =?us-ascii?Q?TGVC6tyn8Oh/iE3Q2CVyJm9TaoDmTz7I4Ugo7wvH1/+FoI6mCWHr6AQKzUGu?=
 =?us-ascii?Q?qEmebCKITCkxl0h1+JbZ5yBHZOwz9DVWYhR4r6VAsuUCRGwCnLFOJkd/XWg6?=
 =?us-ascii?Q?YGrr7stKrcAYEapa7ypDW8J/EV/fy65/DQBvTJo3g0QOTDBrLkyJwPC5kQYk?=
 =?us-ascii?Q?WalMWmNqmEug0ORzs5erzYz7UQwoxx5eNrca7re7Vl7a3U4PQPkKz8uYdCfJ?=
 =?us-ascii?Q?M7nFem1Zj8ZqBHB/nv4n9GMszKL7kfzfw7EyLIneRkaRsH5Gu8pM?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3ba8358-1e2f-4efb-1335-08da4eadee42
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 09:03:36.4024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ycb8JCP8vX7wh0RVKQxLqoV0BbHom2mraQn0vripKwxHhD4CLqUCEYyeVL1YUoZszT0OxvVSJ/uFEBJ5xmVRfob39UPLgyEehWYbs9YK9ZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR01MB6909
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
Cc: Open Source Submission <patches@amperecomputing.com>, "Thang Q . Nguyen" <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add device tree binding document for the SSIF BMC driver.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
v8:
  + None

v7:
  + Change compatible string from "ampere,ssif-bmc" to "ssif-bmc"  [Jae]

v6:
  + None

v5:
  + None

v4:
  + Fix warning with dt_binding_check [Rob]
  + Change aspeed-ssif-bmc.yaml to ssif-bmc.yaml [Quan]

v3:
  + Switched to use DT schema format [Rob]

v2:
  + None

 .../devicetree/bindings/ipmi/ssif-bmc.yaml    | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/ipmi/ssif-bmc.yaml

diff --git a/Documentation/devicetree/bindings/ipmi/ssif-bmc.yaml b/Documentation/devicetree/bindings/ipmi/ssif-bmc.yaml
new file mode 100644
index 000000000000..02b662d780bb
--- /dev/null
+++ b/Documentation/devicetree/bindings/ipmi/ssif-bmc.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ipmi/ssif-bmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SSIF IPMI BMC interface
+
+description: SSIF IPMI BMC device bindings
+
+maintainers:
+  - Quan Nguyen <quan@os.amperecomputing.com>
+
+properties:
+  compatible:
+    enum:
+      - ssif-bmc
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ssif-bmc@10 {
+            compatible = "ssif-bmc";
+            reg = <0x10>;
+        };
+    };
-- 
2.35.1

