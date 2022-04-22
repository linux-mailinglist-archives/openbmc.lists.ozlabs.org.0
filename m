Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8985550AE36
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 04:54:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KkzWV2tRYz3bYq
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 12:53:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=Bsvv1n7T;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eae::719;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=Bsvv1n7T; 
 dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20719.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::719])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KkzNg1vMhz3bYl
 for <openbmc@lists.ozlabs.org>; Fri, 22 Apr 2022 12:48:03 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C6cYjpY91GivHg3v9+U4Pv4WpyjHq1jlQfkP7ya0kkBw0XYydhe1GD7kGt2Eu5ULrxVNi4fPoaHOJdjaMOHLPkw+7bxfB3kOeZC/WBx4rNibmeVDSVyV/z1mWzK1QwqCuEfGgwuy2pv4VUf7sTr7D49FnncJuTQ11aG+JcxHNPvj6S9Rt2ok4RqhvBg0UHJL1g6fnDPfbFMAfJZU+nf5c/3C+M19nSTrJD3W39YdReNLCMy0Q3gqq5dE6q0eK2Ghe/zkpTmEVNx8iz1uySjYZ0wlb7it+YsZwMoe3XQt0NsA/t41cIxqMGDC9Gqep3aQHn4Ve+36cBKVDQFaoPx+Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jgNSkGG73SD6awNspIKOY2vTkX1NNkxBuemwBtFGzOM=;
 b=dFuPfcaW88QlSmp0j1m9xGah1l9EwXwpqivTKuIKVsp7WeEWkaSOPLih3gwoA7ovY0JOnMt8Xjz7GEUp266CBMJ+rg2aS4R6j9C246cEvrka6xdVO6fM6j2khFwwcqXFs+4uqSShoqQfyVEyLCVhRw7XfueabgJV9mh5yuwl8wt/VDdE18WkHwdbRhFpeSqh8e5/vpaPJTJNRIUlm3bVzRBgTi9jjHqUD7xSQYdumRNQqPk66JstTlg6cXbq068YFSlVcZEbxQ/mbrJNAbgyfcX2ixonvC7Zoo5ycaZtpgFdJbgH1Y361bE7VZMlPXcfKhrcRbPeAGHoyQIT51ILKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jgNSkGG73SD6awNspIKOY2vTkX1NNkxBuemwBtFGzOM=;
 b=Bsvv1n7TDCkyNw/huPSLm4zz7RgUhTdhMal3ne/x0a91xzNRB7zzPXRhaqARTAXfdFZdUy9gf37IpOWmKmCO6jwHldVU6a+cKMhFdT3lr7DUPl8oMNhJdJrvDj4/ItcJ8QIYKXF2XFmtqU9vTt9W2hR9aKaVMOxN/7ZDyBMeSVg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 SN6PR01MB4653.prod.exchangelabs.com (2603:10b6:805:cc::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.15; Fri, 22 Apr 2022 02:47:48 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::319b:4612:e6f4:f22c]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::319b:4612:e6f4:f22c%3]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 02:47:48 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Jonathan Corbet <corbet@lwn.net>, Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Quan Nguyen <quan@os.amperecomputing.com>,
 Thu Nguyen <thu@os.amperecomputing.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: [PATCH v8 7/9] dt-bindings: mfd: Add bindings for Ampere Altra SMPro
 MFD driver
Date: Fri, 22 Apr 2022 09:46:51 +0700
Message-Id: <20220422024653.2199489-8-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422024653.2199489-1-quan@os.amperecomputing.com>
References: <20220422024653.2199489-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::10)
 To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a997268-a628-4bf1-62d3-08da240a7c40
X-MS-TrafficTypeDiagnostic: SN6PR01MB4653:EE_
X-Microsoft-Antispam-PRVS: <SN6PR01MB46532060F03B085A9CF2E1C7F2F79@SN6PR01MB4653.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qhdxbGXKvz8enatkCqTsJJ46uoKdOGOb5IhnFVd0dpTztdT/oUlWITufVSNMrgtIZJq5+mlVjrxK0+WOXdrggdTHKO6jz5bR59L112Tmat2U9BxvGxUUUWIG5fh4aWXm7vSx9PszvTt9EVMLDkpKNzuV7FO+urb47+/nNP7+QndrowDX0ar9zgSxllkeI/ih0OXPp65aImKS9945heutfHykjhlI6qC0Ehtbsh8xrv3tUwhdbPioi5whZ4gpO08CqjWq6++9mjBRAo/R8h0mKlGEi3wu1UbA92Gtly/Wgvc8Aw9SSgGGSqCGFaJSbK2SWue2rMScF8jN044a/lbHvh/xHmHQCkJCvstyrrYFWHlWGsRyRdTzKDVmnleMrQLF4LFqOSxb9DafrZ0r2ZA3VJxeZLAXIfRSZNhmvh9kNrS7lXbh63HgyQABTuY0UrdMCqCaTuBoMKHDip+EWUUzOXpi9ji9YZlSjCgqX2iC2KeoU0o0wRAAPZH40ML+ocI0lkVjEkjtUJNUrY12TwKsDNxjXVCGAHH4mD1I8L7d5NI5HP/X41YIK20k1V13O0HTtKLNDumawkqca2ngsHiSlGORPfj7Pfa1LfKsK9KGyJzNLQb/47tD9AJlJ6PtKHM7dWCGBUi09C+ojQCib0ZJfxFj/3DU2a5MGbxh7Hk9a1xd/kFA2+r8+/DsxauSFBZOFVPH49ToFvmloRfMF8Ny1K/W4AKAKgT1/qKBWOgP6qaNmUUhUeLmK2nFq2N69Zykq3v0DduE46c4OfB60PqI0Z5QaX1FIB6FKMkWG0HoP9yzF825gKitzCEVNqr9NGJmgS6HkkDUJPFRG2MQG326qPHHTg7azsqjbOF/PSaZ4s4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(966005)(6506007)(6512007)(508600001)(54906003)(8936002)(7416002)(66946007)(66476007)(107886003)(8676002)(316002)(110136005)(2616005)(1076003)(6666004)(66556008)(52116002)(186003)(26005)(86362001)(2906002)(5660300002)(921005)(83380400001)(4326008)(38350700002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kdmMundZx8Gk6YZoliL+I8SpKLvhiZQKV1F4nU27O0jqBMoM+OnKHwWsDwDB?=
 =?us-ascii?Q?vXfJaAKHSj1MPVZFnoMIotK81O/Wf1LFH9nJCj0p2dS6R+X8Ih+IwzLdkImN?=
 =?us-ascii?Q?/2ZHSKTU2iQN07RBOzLOkG8y6qobI3ciEf/HCBRf2weRhZ+ymL9aUAn0fteX?=
 =?us-ascii?Q?iQ2RIa2adbEp45qXgUOr8lkYkV6EsoFPIw1bt6GALotI3kxkL7lGu6uauYIE?=
 =?us-ascii?Q?hUYtFlHppOyVSB2WX+1OOTS9XYCI+NSlbfBpqIKMj3x4ZHuUH62DCmOW9sOw?=
 =?us-ascii?Q?kkaUiDyLXq5qBqnygMIqUUxH8dOwpUTG3TeiHoBgzXaDC+FNTKAMjOx/6DmM?=
 =?us-ascii?Q?gV/D6SP+2wp0ldQPdSIwph0sXDKe0DdaWhBbP52qO1vb4M+uS591jOk6QXE6?=
 =?us-ascii?Q?X20T7/IQc2Ty9WYuOZdLqnNZAQDem6/NBH+9ccwuUXbtds43UXOBOmWJ8ndv?=
 =?us-ascii?Q?8PGNzB3v9Ks9UsM1N2rVHbfUeU0pB+WJjyO57SowgptJNCCmOKR9SZ370BJc?=
 =?us-ascii?Q?9fGo7hrY3x7ySkHs8wx1NdzZc+FCKhltBSGzV8/qBYKB/9ENOiu4CqOQArC2?=
 =?us-ascii?Q?PZBNHtYIm46zZAAZLXTCFu+Ix7c0iP1mosMibuF7UwE6/YYZhCqT0IgEKpFi?=
 =?us-ascii?Q?dV8OZ7OpdIAMH0owUMjwvbebQUD7eFy+Iqg16uaisOA1cZCTIkygv8Cb9uv9?=
 =?us-ascii?Q?6GADHDifniTyud4wn62YFYo4bBFgGpLt4LDJ3H85bTnTYNRkkzr69K1sPgSH?=
 =?us-ascii?Q?7+InEHL1cMNdbP0McW7McdljuxOo/TvnONxRUgh2G4z5fy153z8c8OLofYD7?=
 =?us-ascii?Q?ehCOBmpxXxLoZUM/vVcc9qvkqOjKllj6r9Lhly1TpC7jrm6BXrFWxk16RHf6?=
 =?us-ascii?Q?yGutmw1MKmmKIzoeJFkFJO/37FgfjeEtGi9E+MpiEVSDdK1SUsT02NE8SR8q?=
 =?us-ascii?Q?2uqOpMfu4i3ZwuNYKFFh72ks7NklT6vlWVpVwEVARA4XKkEY4+9N6sdoP91b?=
 =?us-ascii?Q?vzd/ACDmkywdeUKnk+fqmlftlTI5vumqqyViBNdgax/+fQ8V5Iukp4c5+Iwr?=
 =?us-ascii?Q?TQ950zDncWGccq/JKSK23k0S6NcIKa3FYO4muCJAUE4ddmPbChu7KfZDuKxM?=
 =?us-ascii?Q?tCYTTiBgLEao//u6Or1dgtqLQIw4qaN99R/HiQKOjHqvcSHKHqeiymCXnF2g?=
 =?us-ascii?Q?15Vh3H1o5QWjWKtXoyXRrDrx6l/sLdGSSP2pmswRDTrWdablGfQj9H5OO3Kh?=
 =?us-ascii?Q?IzJJ0M7vjtWpTWrGah6VBlhrXg7iUqvrUF7TOY4eUjC3BUR+9048a/H8yoAG?=
 =?us-ascii?Q?qzTBvwv2FgsKUnBzxz9AtLPd+8klrwsNz5iagqNyOQZZMbWfC1TSN/yUEMWv?=
 =?us-ascii?Q?u+pv9xU0dKQ2rKtOqrJqkaM5bACrfpb9QNugZcLK8tG463Drz3fiBpO62dJe?=
 =?us-ascii?Q?rrzcigcZyRCuv8quQB/q72lDb9IudTag0vmitDZxpC4mDX3XXU8zkBfpkrBt?=
 =?us-ascii?Q?l5W4CWtGflbkCDqI3Jv+bPNtdbSYo/EM4Qxs+SYFtwauzV2I6Z/qtc+Ouct7?=
 =?us-ascii?Q?4uPy3N/UoJEqqnc46jxMq2uL6T3uPakOh/LGMGFmQUudlQwDJnW11qfYOKfr?=
 =?us-ascii?Q?cGWJ88mLDUjxuXe7m3HmfRp5rCr6OLFJeEt9hsyLDeaVwejYf7UV+zgauRoh?=
 =?us-ascii?Q?JgG7lWh+wUlf70+gIrzMuoXZRnPwCuILq4Hys+Z8UavwXwlbHH7esHY2YsGQ?=
 =?us-ascii?Q?/5PuOjKUA55up33vCGQLwcXgIMXBJ1pHf6YV95j3Mt7/4jQiT+vl?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a997268-a628-4bf1-62d3-08da240a7c40
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 02:47:48.2806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5JNI76UqxHi8SRCt0Q0hANUn1nl4XT0QXJonogw8CAmmOW2TtYqj7Bejw3Htl1vCJVb4hKb1ZkHmYAjcUCg9pFcu5ipfEY0o2yUQ01bpk+k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB4653
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
Cc: Open Source Submission <patches@amperecomputing.com>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Adds device tree bindings for SMPro MFD driver found on the Mt.Jade
hardware reference platform with Ampere's Altra Processor family.

The SMpro co-processor on Ampere Altra processor family is to monitor
and report various data included hwmon-related info, RAS errors, and
other miscellaneous information.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes in v8:
  + Removed unused #*_cells                              [Krzysztof]

Changes in v7:
  + None

Changes in v6:
  + None

 .../devicetree/bindings/mfd/ampere,smpro.yaml | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/ampere,smpro.yaml

diff --git a/Documentation/devicetree/bindings/mfd/ampere,smpro.yaml b/Documentation/devicetree/bindings/mfd/ampere,smpro.yaml
new file mode 100644
index 000000000000..c442c3cdffed
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ampere,smpro.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/ampere,smpro.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ampere Altra SMPro firmware driver
+
+maintainers:
+  - Quan Nguyen <quan@os.amperecomputing.com>
+
+description: |
+  Ampere Altra SMPro firmware may contain different blocks like hardware
+  monitoring, error monitoring and other miscellaneous features.
+
+properties:
+  compatible:
+    enum:
+      - ampere,smpro
+
+  reg:
+    description:
+      I2C device address.
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
+        smpro@4f {
+            compatible = "ampere,smpro";
+            reg = <0x4f>;
+        };
+    };
-- 
2.35.1

