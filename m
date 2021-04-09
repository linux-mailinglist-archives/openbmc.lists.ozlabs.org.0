Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 926C53592DB
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 05:14:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGjt83nsVz3bqn
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 13:14:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=orHn4pGG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.92.120;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=orHn4pGG; 
 dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2120.outbound.protection.outlook.com [40.107.92.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGjsP183tz2yyr;
 Fri,  9 Apr 2021 13:14:17 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oYT+Sgu9PR1//jIHRy16nK6d+8RMvGoo+biyV2zhRxsuboT0IRMYNd8z/+S7DSxovSDjU9M2rsi6su0yX74LCY6WOyLbLCVcmnT0m+zPOF3EesF1vA67v03GmgFdvHBqz7hlvVW5Qnd1nNxuJzCin1gdva87/UDBIz4ac0DFv1jaM8LSan8H4pjcjtwFGj+ERR3fiMeaGKneREXJ9+uIOVeyR9PIAeE5LTUB/zWBfLcBmGOEX6T5PrbV2N1EkSSKX0VwQTmPDhjSGInj8aH1mQXlaO4mbCblIVA9uK3PfZlmq8AOz/fLAz+4XTVuehSz7fMain2zelnGJpaOAVZpxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBVSOQre6GNvan9CYMBo1V1qm6TAfhvhVmTPmLZFnPY=;
 b=nrRSRz8qLoAW4WwmUcMDTksZGMmmcQSk4Cxuq9aAXzxIdKiJOZt6JVKKFF52non6YpGaoxRJ9tTDRN3jgS3NE9ahHOikJgOHHmU6vGqNECNee5jx22R8eWERrSAy4wPPSIrKJFeyVbpN7qwKJ7XqcQIKiqEjbwck2Fsz7ZHS8THuNxluOLDAgWT2OMg2YJoeTDw4ZB61RmpPBVYkori6MR3NcF2MRnotOfSWKGWIaW+7WOeLDWTvADkT/bb2FRKt1+2dKpSXhQJn15eHNwXLuZY2D6IEKrnx780QjIr2gGFhEgsqfdJWcur312DsOnJZPg/YAvgm8u1WcgK1b20JfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBVSOQre6GNvan9CYMBo1V1qm6TAfhvhVmTPmLZFnPY=;
 b=orHn4pGGCE1IXdxpq/vLsHK3bvG1X+VkZtbKb3m002qwYh60k/8moCSYHdFSJzhrH6TSpVqKv1+kga65G6sOn1zm78mUstP4dP8qAUxPbXOb3Goh2nlLIKOESInbKXHJLmphOdirjpE/VHV+xegycQCA8OeBWw+Cmr0v94Bdg5I=
Authentication-Results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MWHPR0101MB2991.prod.exchangelabs.com (2603:10b6:301:36::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.26; Fri, 9 Apr 2021 03:14:08 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.4020.016; Fri, 9 Apr 2021
 03:14:08 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
Subject: [PATCH v3 1/4] dt-bindings: mfd: Add bindings for Ampere Altra SMPro
 drivers
Date: Fri,  9 Apr 2021 10:13:29 +0700
Message-Id: <20210409031332.21919-2-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210409031332.21919-1-quan@os.amperecomputing.com>
References: <20210409031332.21919-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK0PR01CA0054.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::18) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by
 HK0PR01CA0054.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Fri, 9 Apr 2021 03:14:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dbceae35-00af-4891-f6a4-08d8fb05880c
X-MS-TrafficTypeDiagnostic: MWHPR0101MB2991:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR0101MB299144A6E2A9B0235854EBD7F2739@MWHPR0101MB2991.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eNIFAWzcL2JCR1rWB2UGpfTu/4g+eq5MwIp1o3GJgVBmzPDoEFiZ/tjorGTDLr0neorlpLmdlGL+CCxirDxS3pOV9HfRGEMe6q/G/jUZ24ANwRHZcLJgmOUAy1i91nDlqET7b9WrLRjQTTXOmBzgM/RI5c2dJp+ycmfqXrD8KzTfqEuFz4mIpCmTYy2FuvG/P3DX7bbyM3cquvfIe4ETIj+kNDYK+2o7QP5gzA0MVClI02GUS15CsOcb6xPgGetmFXPFu/smonaXu4z8agqnwuDEqTBqlW6e3gzOfS9spJbFaKGer28SJctLLpu3Gh/9xyBpkQ8ujUALX7Hz3Z5juLr1PBysGIdreW/EXYFnTH8edV9WRC6TdCdxaoBF2ql6hBq01AM/hdQF0HrYCE0u5/K4Ip69fuxWaXV93Ph3AimKZWerXQ12DMgbrs6bUYcmVuiFgcU0jpKsRiWFXj13j4KyBHjkz1kMQ+xNEDSZZ2L2wWxzrzHnKWipSwpT8KXAQHiKOMQlA/OxKKH5scXaapFYraybHoOf6gIyfsJ/o2Ro/3crPFU1V5bKKt4zz+W/rG9mr1isLqlfa2SmIQbwb9M5PN5o9tnHFgwc6omGVLr2R9QjeJuX2Z++o5gpYksnYM9BNJnOobCy4nmG9BbFHhCJ1Ys7cI+KxZyqPtXdjifpOxHb8JEXhc4uib9TepqBgUJ2qttJGCpGduInqDSwfnU6xi4gmR8z4sQDThmS1SqR6L4h7wRU0JF+C3RvmeabJzUY3/uEK6kOJTELVD7R+g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39850400004)(396003)(136003)(346002)(376002)(6512007)(478600001)(38350700001)(921005)(6666004)(26005)(316002)(6486002)(1076003)(83380400001)(2906002)(86362001)(7416002)(186003)(16526019)(6506007)(966005)(5660300002)(107886003)(38100700001)(4326008)(66946007)(956004)(8936002)(8676002)(2616005)(52116002)(66556008)(54906003)(110136005)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?yhWugmoidZFKZzdQbJCUuWRdWlvLWrMiCDl+5aCgsnNDTXNj7xDVRfhbtXAL?=
 =?us-ascii?Q?2u6+6AJhNWedlCgArFLD8TFj8ZuYJdtfXhN5dxgTHKQJRel7l4FB7lCcUKIk?=
 =?us-ascii?Q?nd7PN/HQ0aivQm0gnZ+1WCZdImJbyDlGXSubqk4HkqQpTZ8tQ9j51KCoZckK?=
 =?us-ascii?Q?b4OSIvN5xyAcwypEOXkJrZ8zYBqDDMmpvhdPmcJbTTXk0xyaGuPVqxhy2Fss?=
 =?us-ascii?Q?kf4zneiAe6GYVlsxKypYtErLMs9pq64mywA4hkeCZLrn339QE8tSrdfe6I9A?=
 =?us-ascii?Q?qh7nrmS8lcTz6mwbfadYNz1tizpfcr6NriJfEI+QQWr6JNXQmybF56chfk2X?=
 =?us-ascii?Q?iXEgaxPNg0vIdMvoPvOjEPhs8gjRbg2KqMVrvDporWcBOOY76oTtBRXik4TU?=
 =?us-ascii?Q?KwLRwK6MKuFH95KXP/gIEWC+xcVP+hVjYdxEk42weIlx4v9BHci2jHufjHKi?=
 =?us-ascii?Q?Mh7p8+PO0cbzBnCXU80TgO8zQ//KPvN6yZP8H5M/v5dx4Q+H3NboAh/a3YS/?=
 =?us-ascii?Q?zDP+xien6bLTpcruqziGT2SvMLHggzd7yRm8m4sxfqZlIi1zd9M4MM5Enb/i?=
 =?us-ascii?Q?+NsIePKrLxccxPnO+5RQXAOPTyksuZVytI7uYYE6AmBIPako4mcXZW826mD8?=
 =?us-ascii?Q?kDBt93+ydXjLnZ0p3Z2OarOXghOT1F9wcyvzHkg71+FXOuTuPvyYoxAbLpcN?=
 =?us-ascii?Q?YTlPtzNjoAQaKtoCYDpVi029OedyZ/UlOgWc8VKFsBJbddy9rzg4nXDlUS1T?=
 =?us-ascii?Q?ehSPy6azq4e3hgzeO7c1MZpYZPsRugELItIeASti6RQM2+XHGB8yTFBjoLc9?=
 =?us-ascii?Q?Sbemh5ip2K7cVgSPnhQ9na3l/P0mMCHmkViLjBG01Z9b3IjPwxvwnExtDxSc?=
 =?us-ascii?Q?kSFxmyLz0iTi8d8nPg6s/gUyhNt5xNGjmqtHcoKM887UvNSK1lvi6CKgKL2w?=
 =?us-ascii?Q?E9iIjrUBJKxtR8M9QzQOsJrba77T0jEh0oABAATpL4qOkO0AOMt8GqyMGVvx?=
 =?us-ascii?Q?jqg7JRPSX+CvuraFnez13og/KAzq1uCenHHBJ4WiRuxbOkyk68Rc5J5sIxXw?=
 =?us-ascii?Q?dKX5SS+LN7YYxIWmB5PjqX8GSCIxIEN/xFKjNFW9/ynrZdDXTL1qhC/j62UG?=
 =?us-ascii?Q?Jb35dimnTEznt95Zl7Ro+snc56WR2y9ylOoOpFlCdQqfVn2lQVic/qSTVkGI?=
 =?us-ascii?Q?koQk45h7FF9IPgL9SVBs77Jgn89bjRulODJNIbLFiZdQ/M6oqzxVi5CUNvt6?=
 =?us-ascii?Q?3rWbGPJ49jzZkUmPjA2STMTvuGDQpoQgRPV598SypcGOHMTpaOY/N08OMddn?=
 =?us-ascii?Q?Y85+HURFsqkujgQdmT9Eyuri?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbceae35-00af-4891-f6a4-08d8fb05880c
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2021 03:14:05.2642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ue3J/n44QGTrFPf/BuG9/M1RO2P+xZMNGDx7mLgcwuHtNvQyIDcQ5b+dB7xatEVwEKt8RnPhEFrrJDk+w4gQa9TQObecdQX9qH3JClBVYl4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0101MB2991
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

