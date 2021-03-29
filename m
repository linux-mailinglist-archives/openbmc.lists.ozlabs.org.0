Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B21934C165
	for <lists+openbmc@lfdr.de>; Mon, 29 Mar 2021 03:54:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F7wc00J9nz3046
	for <lists+openbmc@lfdr.de>; Mon, 29 Mar 2021 12:54:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=A5ZLXDHy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.93.109;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=A5ZLXDHy; 
 dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2109.outbound.protection.outlook.com [40.107.93.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F7wbB3Fz2z2yxc;
 Mon, 29 Mar 2021 12:53:26 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jSUY27m6Wcv97ZD+4Ortd6IjBFW2glYQpVqf2GkdwmoYpHLS4UDZabNCtKuseIVzqT7lik6gPM4jGlwSVHVMlnE+VSnAK6YvW5JSlNaiN0KXNCmjnV3BIRdUoKEtdUJ6KHvZQyBrp4w2MbTThPxBslVdxMTfrBbuZH2An/k6G1ItO7ieW+sVuI3waqvPskubB9hhLRrU9svxbN8+3Ox4puBiqSz7JNx5nFkbk8a/fWIWqTBaRmJpco92Xb6MxcXx0AIUjLRyIj0DH5ViWPPnj1s07F9hMKMRB44EjBa14qAag3+AosRqgunaIusKho370E+oMHfr31Y3uHtUATEM4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+bs8Rj+lT2nMNLSWVFNjMqGUbRKf61Fd6MYkBuKmNlI=;
 b=jbEW5k70lA4Z095QMS9OQcmO9yYAxBUysjzwo/gKHx7CiPN2LtN9zX8Bs5utaG/LoqbBorBmoS3KLpAVD5zuA6TKdOryJMlIz4hPnRfZYzVVg/WC37pl6afpbMopfb87DwvjZstafKqKqHo18Da0oew63NYLsYNluMb/VdDNe1EXOuPB2yvj4BoY3k6/KlBS12AmL6VwOnE9y2a91Lrm0t9mZbHruw/CYgLBctl5jiqa1j6tzVlSINyvr8kdLRWh68lvZX2XZ27Rkk70dyLINBj36f2u1bZ4NRwjkUrnaQdkRjY6cmjjhTD9ZNd7cK0QEmOiRXOi41DoX5U3T1heyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+bs8Rj+lT2nMNLSWVFNjMqGUbRKf61Fd6MYkBuKmNlI=;
 b=A5ZLXDHy4iYn4wIuiI9neWAL3izFxgcltfJvFWKRVQYeJWBjGqv9mF8kb/KoiF4+nN4+K6/9GHKf3RrEnn4yXWTRWSmJD7iwShXP/JtW40CxKgw3ZaOpROb+ARzbqDq1z3xsMHOPGBKYcmStA8H6US7VnTD67YXPHfFMwlwITy0=
Authentication-Results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MW4PR01MB6226.prod.exchangelabs.com (2603:10b6:303:77::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24; Mon, 29 Mar 2021 01:53:17 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 01:53:17 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
Subject: [PATCH v2 1/4] dt-bindings: mfd: Add bindings for Ampere Altra SMPro
 drivers
Date: Mon, 29 Mar 2021 08:52:35 +0700
Message-Id: <20210329015238.19474-2-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210329015238.19474-1-quan@os.amperecomputing.com>
References: <20210329015238.19474-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK2PR0302CA0008.apcprd03.prod.outlook.com
 (2603:1096:202::18) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by
 HK2PR0302CA0008.apcprd03.prod.outlook.com (2603:1096:202::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.14 via Frontend Transport; Mon, 29 Mar 2021 01:53:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0be7b3f-7de8-4ab6-9225-08d8f2556c0d
X-MS-TrafficTypeDiagnostic: MW4PR01MB6226:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW4PR01MB6226E480C49FC6772DA3F5B7F27E9@MW4PR01MB6226.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WmDstnkCh4oe+L/274m85n1q3TPNrnKdchBYH8bovm0550CRvew27ZdmY9j1My8hmNXSwmkD60wAPSXtq8ws+hn8No8iGb0TUWKzvFkRLx6mtqvbgOmnq8ln8OqltszsXmbaJ6QRobMWVnc7DdjlthVrJbblBglmr24M23LFj7o1lxfWd5JmhSRJDDh6Jv74UW2bK5ZygmEyW4LlSJDydTAkKjIg9cppy26eA5iWDB1WNOXO2v4PoEdLv6RfUN90s1Kcb0j7pXcuYWxFEVD6nv0Pf6a4WAGUvkUZUosXI1iHIcbVTV/0mo36LKoXi/H+UVjjYQX2nkgvQ2lRIH7+LNm2u95Iv32u3MuQwIb54IMxSVLTfQzswpxr8fArZgd7DncC3FJfWOkZX9ZwGb9FTXPzPvLEvgvOidnOLWk341Bv0eh10QsoiUWmNStCSa6sUMudA6JWRDobZEymEt+XEsqDButXox9F6dYkGqHLtj9undXSfD62LSQbcjwhXowW+0EXNyI4rUKSmUxE5tu/+aXTFrQX+TW7Hp+GWFlyFTb8s81D3sBpTIh2yLPmLa8J9L8WEhx9pP6EtKVHsiUe4xNgFFCgXQ0Nukm3TBRpIyoklsR7YyGHgygfY2MRyrqIUAzqL/QdNkNauUdlqiiGFENodsxdziLLg3wNvdGWTif2t9zi9jn3eRJLYC2meLDRJ1QwOaxLFFWJvYq0jx7IPKq4zzPtzr/t4CBEEWvAP0DS3FVgd9/+naUdLmwuOCC8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(376002)(39830400003)(54906003)(6486002)(966005)(921005)(7416002)(52116002)(86362001)(6666004)(4326008)(66946007)(316002)(2906002)(8936002)(2616005)(478600001)(26005)(6506007)(66476007)(1076003)(16526019)(186003)(66556008)(107886003)(83380400001)(110136005)(8676002)(6512007)(38100700001)(5660300002)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?M6dxUJsJ56cHedQv3nw1waaHYf8dX3eDubHW4eOl0uWgr2cRaoUFBf9VG7tn?=
 =?us-ascii?Q?uQilQxgiwuqZTsx7LTt6Ex6bWFQYjHwpfLHdVXuVic5pgJNJdrDG2lcVG//e?=
 =?us-ascii?Q?AaDPVdJz8FxY4X/7mjTrMIkco4Rsq0IZZ2YHj/lssWRKulmWIQwQ5o9iLpLx?=
 =?us-ascii?Q?1pBpioG5sLYFI6NRlop4nYIXoEy490BjjZYxresdm1dVO02GsAIDecffYX62?=
 =?us-ascii?Q?IcwwWmlMhIYQbKj8RFnupdjhji1w4Jal8UKavfYHGhZEIVl6mDF0dXsMbQ7D?=
 =?us-ascii?Q?W61sX8TQpHYL+VxjHRnhIbC1jBzEUtwhxeJfq3tjwZS7dP3OmsD5TMciUHRD?=
 =?us-ascii?Q?15BBPGobDYCv7gzoLLW03UruzsF720Fh3DaE8Fru1UffIryweyMgOnOfVu1I?=
 =?us-ascii?Q?RUqAGMfUO7S/D4de0YXlbfSox2ye9YDP+0ntSSB65qwMER42zK699yZQyAXd?=
 =?us-ascii?Q?EWpwu+vUZtsgoXp4GZD99XKVYNNL1Cx0QM4wTjYAE2G2UtAfNHtBCF11B/0I?=
 =?us-ascii?Q?nKWh2YWnCeO8MWaLvZ9qA/8mKhHiB4wLZlP8RSdZxIKBYmpYssN4vI7McchS?=
 =?us-ascii?Q?UC7sW6+QsT6ygWaWVwXxaon5dnvGeUF2FhHAlQZMsDoXe5AguR+DDOW6nHCl?=
 =?us-ascii?Q?gE0R5uwwNd55rziJfo4xFOotgusfe8tKnudB/McFXhw5Mf5kPNU/UbNugXXO?=
 =?us-ascii?Q?qEM6lpJMbMbA7VUyaPAsyb4QGAH4Ux0yfOAW+5SbAJOk+tgkKadka3pbbRjb?=
 =?us-ascii?Q?lWmFtgoMSu9i/xgNW0obIk+VAKHF2UDcJwq0TJW6Rlh7civsg7B87BFcUNV7?=
 =?us-ascii?Q?u1MvEjSzmyMuZx51CEifg9nmlfFL3RO5fBDIZmPqR7NA7PNqBh7OpHSUT+Cb?=
 =?us-ascii?Q?1YcMTRcd5t6IuGr2YyJoPTIRx5pCETkHeMGsiNy0hx1C+txcK6koXviihmxz?=
 =?us-ascii?Q?tls04pKvexSiArdK6AI8NarpL5uprwF2ow4Jhi3t73A0gePs7Plg3G4E98aG?=
 =?us-ascii?Q?N4K9gK9pkNpoO2xV7nKOl64rt6SaRGBqSrKAWtgVxnLNjHqotUGfmULr+PXJ?=
 =?us-ascii?Q?Yn0uG8nfUH3d2jQPzyuaoAUGinj2fUSQqJTRs90RAY2ZwGN526EXo2yo4hwJ?=
 =?us-ascii?Q?mDAbKvoQqBOHRsDmaXkKHOHvLKwK+ClL95Qw+vlpduzjNrqVqt2VH4Ic5Jat?=
 =?us-ascii?Q?tE1Cm/KoHlVRuj4fcgLjLRCGDpCdD7XpDjlMK943gwMZiTv+l01n8Gm36OF8?=
 =?us-ascii?Q?Ibt0Xk8gpadAY+awjYBvGugmFfXgsldox4iwFuC45wDYiPV2RpTBrbd8Xi/8?=
 =?us-ascii?Q?fDjYRTTwbq+8a718s/0Etdih?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0be7b3f-7de8-4ab6-9225-08d8f2556c0d
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 01:53:17.8342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JGyS1aJmtbNbQWu1uWbzv3iyKkUz3NYS2aztZkGlKxA/F611SgCp+NgSNkXO2BquY8zTBZuCtY7j5/gavnkkdWSt2lYgjKTe43OLi0L6nVM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6226
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

Adds device tree bindings for SMPro drivers found on the Mt.Jade hardware
reference platform with Ampere's Altra Processor family.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
 .../bindings/hwmon/ampere,ac01-hwmon.yaml     | 27 ++++++
 .../devicetree/bindings/mfd/ampere,smpro.yaml | 82 +++++++++++++++++++
 2 files changed, 109 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ampere,ac01-hwmon.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/ampere,smpro.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/ampere,ac01-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/ampere,ac01-hwmon.yaml
new file mode 100644
index 000000000000..015130a281f4
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/ampere,ac01-hwmon.yaml
@@ -0,0 +1,27 @@
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
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/mfd/ampere,smpro.yaml b/Documentation/devicetree/bindings/mfd/ampere,smpro.yaml
new file mode 100644
index 000000000000..bf789c8a3d7d
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ampere,smpro.yaml
@@ -0,0 +1,82 @@
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
+    const: ampere,smpro
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
+    description: Ampere Altra SMPro Misc driver
+    properties:
+      compatible:
+        const: "ampere,ac01-misc"
+
+  "^errmon(@[0-9a-f]+)?$":
+    type: object
+    description: Ampere Altra SMPro Error Monitor driver
+    properties:
+      compatible:
+        const: "ampere,ac01-errmon"
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
+            hwmon {
+                compatible = "ampere,ac01-hwmon";
+            };
+
+            misc {
+                compatible = "ampere,ac01-misc";
+            };
+
+            errmon {
+                compatible = "ampere,ac01-errmon";
+            };
+
+        };
+    };
-- 
2.28.0

