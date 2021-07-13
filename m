Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE693C6A2D
	for <lists+openbmc@lfdr.de>; Tue, 13 Jul 2021 08:02:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GP95C1bz9z309K
	for <lists+openbmc@lfdr.de>; Tue, 13 Jul 2021 16:02:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=NSAwvbPn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.102.124;
 helo=nam04-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=NSAwvbPn; 
 dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2124.outbound.protection.outlook.com [40.107.102.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GP94K38TPz2yMs;
 Tue, 13 Jul 2021 16:01:20 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V/R7IpzZ/FYJLRLHuoHzvDVwbT0ZPX1BF5PftosbUJwgP/1GLmSiEptVNFlWti4WyTzZNj7379zHBcfzW/Qev8CNUlj4EZOVXSS1MQXhE+C1QNABXmsLwcg7h5ZVTfssbTnQbTTzzaX7Tce7nlxs1iUSNDM+sgXYgR+8RaED1AgkGNN3urwYRWvUXi3fpfyB6jHMck2ZCqZwG6dcJwPs2f56slYokpQVuX+1ityiIZ9wm6l0nOEv2AcNGfup5ZlA5Z3FrZWzftAYruMnOsCGXgPTwSZMqUnzA53lQZmhz1bMZNH3CLU101Vj3uf39MBPHv6wnl2QFjociJxSnyXwPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ljAYR3h0DzFYWX8MK6n9YUaFUW+TdMMGl4hAHN+FUo=;
 b=YJT27kSr4Qc6xEG5mf/9+xvSUbUTGLhUoOnnLVXncnrNwF/7wKn0WAT4S11I2G8ftti16xgKX9CEe3Zj6UBVrFChqKzt2uxzHhgG0+0sm0f/TzLsq0d+ECd2/+dr40qLiT1yAkR7DukD+0p9VbYZPPA/68kul7S8DyQsi1qkI4OGjBvGcSUbjvOVsWj2Xv0gKnIO5vontcQeMVH5p5ZxM1VLJl2qY0GGlrHedsc1wpwckcp+xjH2r3j9GTPhbC/UNz9DW5WZjN5cJdD+QqjdA8BvWMEDANB6HNWqYcVUXSM3Iw7uT4U+/60yA2P/HUpyAPL9BVwXOJKezBut5SzbSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ljAYR3h0DzFYWX8MK6n9YUaFUW+TdMMGl4hAHN+FUo=;
 b=NSAwvbPnHenYMpz3E4LC/4GduVF1d3DR+Hys4hV5ffz3q29VGdQTXyBkZHUx3QAZoQXeCrjVGR3u3SvOFjDxEnHkO2F4rAPd36dXh5iVhUp5l0M0gwOukO1Xjsko0ToJG7IrDtnMnd11twWhb5EMStQePBH2957ca8SzB9QjMos=
Authentication-Results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MWHPR01MB2592.prod.exchangelabs.com (2603:10b6:300:3e::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20; Tue, 13 Jul 2021 06:01:01 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::452a:24fb:12cb:9d7e]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::452a:24fb:12cb:9d7e%5]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 06:01:01 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
Subject: [PATCH v5 1/4] dt-bindings: mfd: Add bindings for Ampere Altra SMPro
 MFD driver
Date: Tue, 13 Jul 2021 13:00:28 +0700
Message-Id: <20210713060031.31568-2-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210713060031.31568-1-quan@os.amperecomputing.com>
References: <20210713060031.31568-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR03CA0052.apcprd03.prod.outlook.com
 (2603:1096:202:17::22) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by
 HK2PR03CA0052.apcprd03.prod.outlook.com (2603:1096:202:17::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.10 via Frontend Transport; Tue, 13 Jul 2021 06:00:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: afdaf19b-ad83-4871-b738-08d945c3970f
X-MS-TrafficTypeDiagnostic: MWHPR01MB2592:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR01MB259257F66CF482644F8F9566F2149@MWHPR01MB2592.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:883;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y/rIHuBp/5dXAaGOOCKCbzvLgawc86Urw9Qq3PBiTtNr6fLaniPMamj2benqyz72fp4D6q4dBj1dxJ9iZX3y9XF0MFNyryDxoRaP3oFLXVVzK/M41gYB9J5JYz7vXjqUMaC9Kz/KYjwgnxOupxAlqpIOStxffKwchzBqbIvvH73qnktUm+lgvDY8GucVMWwJqmB9ODFYRH6A/QikfTQcQ8qsfnG2Ulg1YsOc5PIFaXu58EURfzo14euHQ+o1MjWyJjnBsp37BdcrTUBR/frO6a/Zm7rMGXnj907htTCfl99EoNBFbt+RUh/kTntJJxgTmx78G4alz47RK8mjzCM2ILnL0fRdUV5eFiHdPB3+djSoTEQaMSdgYizAthby66GcE/mb72uA591oxSF83ABrb48NK53Yo1TAVgHRxgWLfxkDbT9RXhVZ5FAXLjBtdlyydSPy0anvSH5RZxwmBgY0Q7+GQVIsmbDzXi1Jb1HR9wvxP3OsCbLFQmuP6er3kxrba8LIh8PB3oyjfdQZAJ6OKCFyU/FHW3V/nU9Sauegzlm8BfEhYjGFzzGWgSnu8190UON9IYKigiT1hWFRKv+Pfh4alVsSipQMH5ntdtzwllMdkEmagTNO8VyE7TrFOpBJx1YXy013I6cTkMoc/KZZj9oGoCU2s6dYgN9I0f87sMTZYguf9yDdZQKTBmJMkPbfU84Gm+pZScXdeOwGmysc8vHpZKJWEtMVPFo2Mr98WeemMkwzRP0vErD4+pcEDwosi5Hlke7/PtfNSEKEcpCAtlqn0il03Jnda5bbyhJe1/0hjX/ULSDdlMLFr9mTuiI7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39850400004)(376002)(136003)(396003)(366004)(966005)(2616005)(86362001)(110136005)(956004)(316002)(5660300002)(107886003)(66946007)(54906003)(66556008)(66476007)(4326008)(478600001)(38100700002)(38350700002)(6666004)(921005)(6512007)(52116002)(6506007)(83380400001)(26005)(2906002)(8676002)(7416002)(8936002)(186003)(1076003)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4clz9Dy0YsJefnY5Rd/qQ5cxj4f10hcjPLR7p9QuJWQ0pfvArztQZBu7r0dM?=
 =?us-ascii?Q?ExIwkB3UTdhEn5Os/B8FfVEc5yZuC65NQfIpfM/xCcdhOjGzcajzBvlpltxx?=
 =?us-ascii?Q?9ICy10+gy8MRaHhBzcW7/ip7fQz5BxqxN8IAP0cxhXRpcL1y4NpDBtoorJvr?=
 =?us-ascii?Q?i7ToxCxGH+aDhn7WZCmz1sRw6OLsG32CLeUPV3kH7uCqdc4Dcu3q+vxubAyJ?=
 =?us-ascii?Q?zgs6abT59P4oiWv0qkPDGFsEQITl0fTy3hl0HUdElDMYNsiWtN6p2azAoPY6?=
 =?us-ascii?Q?ID/iE2F1dXidERaYLQ1ouoIFKHA1cF7zKJ4t3HIiv6IelxqyGxN6Tdt5yxJj?=
 =?us-ascii?Q?qyYxKePYluwSV0sTmXGnNuS0sgSrimZVaYHsKCCccqUb5Fug4qSBKCnZb38G?=
 =?us-ascii?Q?df3neADoYiz74WNJh+pjUo6D3cmmeFAstg28670CQ/VsJGtFGGJpE3RHeb7I?=
 =?us-ascii?Q?XBZt8N14lcw7E6gO7gzdHHumXRsTl/uGhjLdBLKO2IjiHlt9ubfNLivt2aNi?=
 =?us-ascii?Q?998usgVYJeoiYvrpwsyK07ohUscx0X6QdocJ6KuzMFL4Vbu1Zue8w/wO+byd?=
 =?us-ascii?Q?0juAO7YZ6dbLZvtQVDVek1sbkL6HQ/aSX24bd6vbLZdscYaTpDW5nTJ/rNX+?=
 =?us-ascii?Q?oUF609HvYHwsGZ884S+yMgzLfhNihb6ivFn43rSeAiElMZeboKmd0Ws+gAUf?=
 =?us-ascii?Q?BBl47Cstl4L9PzIQ6PoAgbap3jFFLjXMe1HsWdGMj6PbRoISSlcmpo5TktY+?=
 =?us-ascii?Q?Zlaev+1SiwkUbT48+DPQMLcBUqcSzqJ2EvM+0uhBQVYIIxOB0Kp5e+R4SGtH?=
 =?us-ascii?Q?dODwxheewPCYIeqwxTCV6v9Wnka8+LBlFumA7hk3sXxhHRn9hGncpTJxvTSe?=
 =?us-ascii?Q?UjAwShqUSIZXlcp7poxAWBQVp9Cw7kGSIbamYrjCXE7A+CQ9oWmMyAYVZR4z?=
 =?us-ascii?Q?KcN+SFisLb/UNQqXcBE5b6GGnbO/CfTABPaX0TSDfVJ0dCsvLgOB87dXKpsS?=
 =?us-ascii?Q?pCccx32H0z5YwSrX9d7j5dT9DHRSXap9Zk8aMN6/QfnyJrZW+vB4xhzd+6uH?=
 =?us-ascii?Q?fDraLTY38K2TMs5G6MELDRfUSefSztUNgtUVG+VdxrgxA1ykz/B+ReXstwOm?=
 =?us-ascii?Q?Rpr7TZ6B+Z0/q3foxRFahmkxo+QV5InpNhtPhHlQ4N8TnT5pPTMhN2min5D5?=
 =?us-ascii?Q?x/wsehE1isC1qtUAX9Qg92IU8vTEpFBBwu0zowsMjcDRK6SkKW2oAt13c//1?=
 =?us-ascii?Q?oe39Mj/b5LwOfHiPn7WDVbvzo8cOgTjhojDbYEIIHHkxvcztZpAIBRjx5GeR?=
 =?us-ascii?Q?0VeRbsoJHh14YLwJDMtk9Fk1?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afdaf19b-ad83-4871-b738-08d945c3970f
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 06:01:00.9581 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gPreIjFyH8cbNFHkltl2wlddjg263r8l76FmKpO6O6JTPQ3b7tQHj1uqeIl7Xa5ccU9xoDvllPE83HPxVLxUZdh0hem/EgTONwtLyE5GGUM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR01MB2592
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
---
Changes in v5:
  + Dropped ../bindings/hwmon/ampere,ac01-hwmon.yaml file [Quan]
  + Removed patternProperties section and child DT nodes in example
  section [Quan]
  + Revised commit message [Quan]

Changes in v4:
  + Revised the commit message to clarify how the specific info will
    be handled commented by Rob.

Changes in v3:
  + Supported list of compatible string [Rob]
  + Introduced reg property in DT to specify reg offset [Rob]
  + Updated description and other minor changes in yaml file [Rob]

Changes in v2:
  + Changed "ampere,ac01-smpro" to "ampere,smpro" [Quan]

 .../devicetree/bindings/mfd/ampere,smpro.yaml | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/ampere,smpro.yaml

diff --git a/Documentation/devicetree/bindings/mfd/ampere,smpro.yaml b/Documentation/devicetree/bindings/mfd/ampere,smpro.yaml
new file mode 100644
index 000000000000..8b48747e5de3
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ampere,smpro.yaml
@@ -0,0 +1,52 @@
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
+        };
+    };
-- 
2.28.0

