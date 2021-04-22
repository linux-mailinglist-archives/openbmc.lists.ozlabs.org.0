Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5968367D40
	for <lists+openbmc@lfdr.de>; Thu, 22 Apr 2021 11:10:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQs7t4tVJz2yhr
	for <lists+openbmc@lfdr.de>; Thu, 22 Apr 2021 19:10:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=mhdDYm6o;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eae::701;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=mhdDYm6o; 
 dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::701])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQs743LjHz2xZG;
 Thu, 22 Apr 2021 19:09:20 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f69BRt8hoil2Cl5XG2FneVts0RNVyeo4kIghU/7/hBTVVASVCfhAEOqALGqGcQKVdEWKSkxOP3L25qRAE7kf1ukLOCP9cXzj8ftKJncIpPEi6r/7OKhxUwT0NyAOSv8klZeY+D8hXYnP38rr3AcosZoBy7kDs4c4FH4e1gpSjJ2qPgxsMghByb5DIDEHakLS1JHPa2Z0y3YK+jizW+kgOAmI+K/lMiiJpJJbC4xmJeMpx+c5nW6Xb2yKujDXOdWsowjXG5IG6cEDj1fBSXDnlCfNBW8iyb4gd+p50MiWCfQEMTQJKJ7ilsaoaAIyMc8f1V6GkmhC/R6Mi1atP//4DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TvsFEWtR7/OzkGsfwajmEBUP81MrV2hyr6yOzzEqSCU=;
 b=g4i+2i/moad6eBasnMASVWwn5gptaK4LFJlI6tEzmobkwia/L4S1GnFYBdlY8fRZau00Y679lvUH+f/OD+BMd3nBPfWAIxz1J7sJ7F5wh7IijCZjP1oTIpWjW/Gwuizo6UrBhNppqK+HwoOYODUQCWQkiDg9Md5qrAkBHwnRwAaf6xtdNKDPaIxcp2Mn55NRVpHKHNfVL4dhvuM7fuhsNRDW6Kproe29XjDq6ySejWaJeZ9OoSdoKIEEw3X+COzE6ozjWGz3aE92RJKHxwwfrBtK/VGVSMvA3EerP6MK8pR7JixAlsi6ujKDmbePwRCgLFZzb4Hvqq5C/3KVW4BdYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TvsFEWtR7/OzkGsfwajmEBUP81MrV2hyr6yOzzEqSCU=;
 b=mhdDYm6oCqgd47q/6Z7mUzrTSRKtTVp/zVTgm3G7x/a3Ryz5vea10FH9wXXxCRSNpL/uA2fSA93AWq+YUt1MDrq0z2b0PnrucszSQcaQ4MFU/t+QOvlHf8woy7qS8B394Z0ME7BwFAU2kvV73HDM+iy05WT0wjHnbwTRHHdjTQU=
Authentication-Results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MW4PR01MB6356.prod.exchangelabs.com (2603:10b6:303:66::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16; Thu, 22 Apr 2021 09:09:10 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.4042.024; Thu, 22 Apr 2021
 09:09:10 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
Subject: [PATCH v4 1/4] dt-bindings: mfd: Add bindings for Ampere Altra SMPro
 drivers
Date: Thu, 22 Apr 2021 16:08:40 +0700
Message-Id: <20210422090843.4614-2-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210422090843.4614-1-quan@os.amperecomputing.com>
References: <20210422090843.4614-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HKAPR04CA0011.apcprd04.prod.outlook.com
 (2603:1096:203:d0::21) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by
 HKAPR04CA0011.apcprd04.prod.outlook.com (2603:1096:203:d0::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.22 via Frontend Transport; Thu, 22 Apr 2021 09:09:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec5a3f3e-c2ad-44fb-14cb-08d9056e4a2e
X-MS-TrafficTypeDiagnostic: MW4PR01MB6356:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW4PR01MB6356D453C8DF1A19902E0D7BF2469@MW4PR01MB6356.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:765;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rz1MqroghHi6Qv/VN6stBFYZkDYMI8uNOfFzQ0ZLrBWUd4uVhvNqLdeTlSPCwKDpFQVfxyxO5uelHX5MOoK/EwyGF65YSfsXADMPf1hXR0od9jtm5L+H5wceRzwkRDHeJaa7I+SVBvSyu163oQTjjVNwIC4Aq6FdAbH9dqv2s2qYjStQvvdECyCnlamNr9E84phnJIDUU9pWmBNVEz0cs+yS4T/enOdOU1GePAdM1ZjDeDsqGJJd6U7ZIFkWUuG+AaZOQ8JFmYxsPr2GdDAtDo8D/+vYusvRfblAqrDTZHr2QgVKol5rtcRfxXc4o4/Ew67x2DQ0eS/9pJvn+IX9AwtxZD3EUA6gdX77BDvYHYBgLCKmnoL00fer4ZvXniFvQQJviSgtek1wvF83lNJ7g1fHonMDYWddzPIf16LZq+O5REI+M2jnFYnAXnCEbQ4sURoZIllISne3AZDhHmCty8Z0hgLh8fEYB28s3Vi4laNQA8hCTlqFz0QYLX0L+jpLn8t9htsfoHAZGjRrtOj7r0F6sdWX3MDrJbt+Iy9fPNWdxsZ5ATPy6+JhGRD5c1kJWTdRNgKlGFHHrzjrnRRH/ROl9EMO2gGGyNcLDFPGQLQtBSjp37rGelWqf+9o0K49ibRSJ7O4BFRknQyIuvcU27z6w/7Y6mF19bm7wGxSIcQK2H7rOY5DGVZR9h5MaTppvilZzivNW/B34Av9thDALw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39850400004)(376002)(366004)(346002)(110136005)(38100700002)(26005)(107886003)(5660300002)(86362001)(956004)(2906002)(6512007)(1076003)(6666004)(316002)(8676002)(186003)(83380400001)(66476007)(4326008)(16526019)(66556008)(52116002)(966005)(38350700002)(921005)(7416002)(2616005)(8936002)(478600001)(6486002)(66946007)(54906003)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?0LkDuBovKvIdhraorrp0/0rlFg86RvtgOgdTm0pFXv6aZHH3MKo5rRBhyxNK?=
 =?us-ascii?Q?XFaiFDb2+b9pYM8lvWljZ9RV8XN+b7Pt1CzUmusUZaXTmvtamU+g8WxGxtg4?=
 =?us-ascii?Q?yNGowyrMcUDwm9fC3D/CDc+q2xNihJ+84Q9ZWBZaN2yMBu4y6iH6a02/TNYO?=
 =?us-ascii?Q?qPwFSlCtlb7wA8c3ik1Dgjz3J6AYe9vpUQ7yBSwtubhpJpczkocMPR3kV7L6?=
 =?us-ascii?Q?v9WwcHjnQOUE+shNZ/Qcyp6RoQ7nMuhCbC72GBADTRg5hUzb214t7OvFcpYf?=
 =?us-ascii?Q?Nb4NdK7VkSrnBKBQVBC/fzj1KQVK4YczJHKzVb7mRGA/Bg0l5YCA5+9D7vpX?=
 =?us-ascii?Q?JbRum10WVfYCj9hBvTpnbU5TO5HntWiffqAeUPRL5gT0LLMI1gn8XNEC1QUW?=
 =?us-ascii?Q?Yhd6hNTzTalzS2HmcsaNUBI+/gDXXYLBkqaFxHT8upQcCb6WAWws5ogU7A+M?=
 =?us-ascii?Q?4BXO5WLT8crHTlu7unJo4oaVumBB+AIprDgPft3kaVdgyJh7Xf3pmLRYIKOc?=
 =?us-ascii?Q?YWdy9nOSMbWxMDhUzSB8TBrN25qK1etxjSaPTIVDWpyoNiV/1zwYq14hptsQ?=
 =?us-ascii?Q?Ep0KDCL/8Qk6ZhsvN/m5rt5/WvdFAI1gkdCxqvAIbbuAuQfopdw3jJkKXr2Q?=
 =?us-ascii?Q?7WsqSbJ78ffjj8In0GIFUMtJS9tW/dtSVqClHJhlpa2m9BHrS62QE69DHLJG?=
 =?us-ascii?Q?qszub4oqg8FzzwH9iOxw3p5H6qcGVypoBCTKbOrQhXbWr/NA+MYoQQJOWa7M?=
 =?us-ascii?Q?KdbaMqQVb2Px5fHicFQJHR/v/xxWb3yVbjaElFzHPll+bVNcxlvRz9sIfmTr?=
 =?us-ascii?Q?/b3sIUKXFMztytvrQAG/3Dxn5AKEBSJYWAWPqJfLVri3nQYYC2M+rrYrzcZg?=
 =?us-ascii?Q?D+ACXzUPwiDzE5xrnepFG6QFb6ZQjzvppGcS/TZIoP3fUST3RUhG7p1qR5zd?=
 =?us-ascii?Q?RYuBmTkwpaZpYnKfpye5OzUupDX+au/OGDgSHazflOsLPRHK1o6zW4OmU537?=
 =?us-ascii?Q?3/xL7fAyK0K2xDarBvu+zTKWv7uYGR5ACqm5xMFSSXd8Q+wi9I67J6hSwTJB?=
 =?us-ascii?Q?kRXu4wmi3lnY7XXMnjFngl4CGXTJt7Q1+bmmvKYjZXH97xpCDQYxj0o4eJt+?=
 =?us-ascii?Q?YN4rGhUXwe0qzVItD3CGOMl8upGchf/TLkvDm/sERMXLvQpk3u8myVc/cIzP?=
 =?us-ascii?Q?T98UzHnhjD911oa/2x+quLqmMSruTMGH87hxXJQ4XwLL68ArKcvo/JG5gecG?=
 =?us-ascii?Q?4LRrIwv7DKFjxsktiRDOqqhh1nu7i3S8N+DftIVrYcpbKBXQk26ifEgeGKro?=
 =?us-ascii?Q?NJ0dGEzCnYe9lLhCTICaMkWa?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec5a3f3e-c2ad-44fb-14cb-08d9056e4a2e
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 09:09:10.2688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: otNcfXVF4Rp1LGELML/VfgnMW/raX6/rkNtMT4C+RwoTqF92UiP+ytbl1p/B8/W6F5NQ0RDsqZKu5qW5Y7bfsMyqznCEPKpwPEtuZaa0iqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6356
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

Adds device tree bindings for SMPro driver found on the Mt.Jade hardware
reference platform with Ampere's Altra Processor family.

The SMpro co-processor on Ampere Altra processor family is to monitor
and report various data included hwmon-related info, RAS errors, and
other miscellaneous information. This parent SMPro MFD driver creates
a single simple register map to be shared by all sub-devices and leave
all the specific to be handled by the child drivers.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
Changes in v4:
  + Revised the commit message to clarify how the specific info will
    be handled commented by Rob.

Changes in v3:
  + Supported list of compatible string [Rob]
  + Introduced reg property in DT to specify reg offset [Rob]
  + Updated description and other minor changes in yaml file [Rob]

Changes in v2:
  + Changed "ampere,ac01-smpro" to "ampere,smpro" [Quan]

 .../bindings/hwmon/ampere,ac01-hwmon.yaml     |  28 +++++
 .../devicetree/bindings/mfd/ampere,smpro.yaml | 105 ++++++++++++++++++
 2 files changed, 133 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ampere,ac01-hwmon.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/ampere,smpro.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/ampere,ac01-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/ampere,ac01-hwmon.yaml
new file mode 100644
index 000000000000..fbf7ec754160
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/ampere,ac01-hwmon.yaml
@@ -0,0 +1,28 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/ampere,ac01-hwmon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Hardware monitoring driver for the Ampere Altra SMPro
+
+maintainers:
+  - Quan Nguyen <quan@os.amperecomputing.com>
+
+description: |
+  This module is part of the Ampere Altra SMPro multi-function device. For more
+  details see ../mfd/ampere,smpro.yaml.
+
+properties:
+  compatible:
+    enum:
+      - ampere,ac01-hwmon
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/mfd/ampere,smpro.yaml b/Documentation/devicetree/bindings/mfd/ampere,smpro.yaml
new file mode 100644
index 000000000000..5613c420869e
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ampere,smpro.yaml
@@ -0,0 +1,105 @@
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
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^hwmon(@[0-9a-f]+)?$":
+    $ref: ../hwmon/ampere,ac01-hwmon.yaml
+
+  "^misc(@[0-9a-f]+)?$":
+    type: object
+    description: |
+      This module is part of the Ampere Altra SMPro multi-function device
+      to support miscellaneous features
+    properties:
+      compatible:
+        enum:
+          - ampere,ac01-misc
+      reg:
+        maxItems: 1
+
+    required:
+      - compatible
+      - reg
+
+  "^errmon(@[0-9a-f]+)?$":
+    type: object
+    description: |
+      This module is part of the Ampere Altra SMPro multi-function device
+      that supports error monitoring feature.
+
+    properties:
+      compatible:
+        enum:
+          - ampere,ac01-errmon
+      reg:
+        maxItems: 1
+
+    required:
+      - compatible
+      - reg
+
+required:
+  - "#address-cells"
+  - "#size-cells"
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
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            hwmon@10 {
+                compatible = "ampere,ac01-hwmon";
+                reg = <0x10>;
+            };
+
+            misc@b0 {
+                compatible = "ampere,ac01-misc";
+                reg = <0xb0>;
+            };
+
+            errmon@80 {
+                compatible = "ampere,ac01-errmon";
+                reg = <0x80>;
+            };
+
+        };
+    };
-- 
2.28.0

