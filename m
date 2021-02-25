Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D656324DCC
	for <lists+openbmc@lfdr.de>; Thu, 25 Feb 2021 11:20:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmTLy6wpLz3cZd
	for <lists+openbmc@lfdr.de>; Thu, 25 Feb 2021 21:20:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=lA+VRlgG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.243.135;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=lA+VRlgG; 
 dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2135.outbound.protection.outlook.com [40.107.243.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmTL85Hj3z3cMQ;
 Thu, 25 Feb 2021 21:19:44 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xn5LmlbSu4lCtH21anqdd33tX2GSKr/0i7M+wxdAkjKkrjP+os4q63y0Dk32EdTXPzdYz/zQNuAreJ/uTpVrZIlK8bSXKvt6xAfN+k2DzzpYySQYOfCqAI94JYOS948z/ppWtSCuOzjeNX+iJD1V3NHptMTHVCkdawYcMdNxe/qaV89c6mUwefU81GzzhlQ//50cEOKC3yN0kMTEjHoHDe1xHpYglXlCcrHBirVJTjxSRXCZ+/NMzp7QZ4w7ibmcW8aykiDxQII/bdCsw2dHepdsgClb7NkK64kuQBtDsepGVdSBs1SK3YAd8W4zfoW0rjb8QG1ksOVBn8vbToOSlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sp5lcbkOixpIQaT3xjjDCJSsAotzg9aQyRQ+Cry+6os=;
 b=bhRE4wugH1yhhZ6zwemzj5JuR3cETIX425QPmePNT86N8cGbB6tsyZiAbtnhInlIINy10waQiVNHJ1zvtEwugc0TxpUAC4Y7GMqSoEkmXiuTlaI3phGqTh9VaEvA4wMR12dfBERu5Y/JgAwae0O1kDXRxoOLR4FJLpl/WWrvp62ciU2inOEP42jC34W3qZv0357aLI9d6TBqZzbddOrPUxN0aqXga/JzxKhAPfT3+/Mo7hAaleHz7D6hnTzYUQK7eP6uL6Jr2EF4eRKH0+zcKDEfIHvRmkppXmcsHWFyqBNO8gwVd9p0Bujdxj2Kba120J7hsAN8zr0w/l8ozujhSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sp5lcbkOixpIQaT3xjjDCJSsAotzg9aQyRQ+Cry+6os=;
 b=lA+VRlgG2VrF7G45mJObqp0BpiUAD5XZQKQqNsOaa0JWkw0y8xa5DWH7CTSUAnTM58k9B9+mC5juopxMSM3h50bGDnqlSik9GA70WSgMhFO77q7Q5bmhUOFacvJRJY4EBsXPY3W7Iq+qBy+8an5KdNPMnj+JXtowX0pOyjkOriQ=
Authentication-Results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MWHPR01MB2320.prod.exchangelabs.com (2603:10b6:300:26::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19; Thu, 25 Feb 2021 10:19:36 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::682c:4e20:b53d:e660]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::682c:4e20:b53d:e660%7]) with mapi id 15.20.3890.019; Thu, 25 Feb 2021
 10:19:36 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
Subject: [PATCH 1/4] dt-bindings: mfd: Add bindings for Ampere Altra SMPro
 drivers
Date: Thu, 25 Feb 2021 17:18:51 +0700
Message-Id: <20210225101854.13896-2-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210225101854.13896-1-quan@os.amperecomputing.com>
References: <20210225101854.13896-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK0PR01CA0061.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::25) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by
 HK0PR01CA0061.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend
 Transport; Thu, 25 Feb 2021 10:19:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21d3b5fa-589d-41e7-33e7-08d8d976d9b3
X-MS-TrafficTypeDiagnostic: MWHPR01MB2320:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR01MB2320F3BB552D9E0A4EC98DEBF29E9@MWHPR01MB2320.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AVWkIgmV7GTeyjNFVs7NknQdHSb5u9j+mDh1GKCz6iBPCc6P7pnVSt6OU/1j+jpjcH3lOAQvZaivGkpWOx3r7zPEieZrgk4Jclr5OzbYbLB9Q+p9gJnu+vlERaF7lXh1ICQhukFwqHP/Z4WjCMmkoNkY+DhrZn602b37swlrht7tJgg+tt5egNNTVxSOfPDxEj2frpcCO6B7mXH0C+OktSZN5Z+/W1yZo1MODsbv8N0YlyDI6u4hVu7D682Fhk+ZJXaoQQ6dFzVoVodBuCJ7q7/0xCSKgcFpvnbsQsJ9qYOxHWCsLROIac9cfxreotAlvyRXVA7EeNu/BVotz1E1gPyNvB8JZv8qmlpTyUK3ufyW18YfmPvtYWHavrlPohVRU2j32dUNkRjwpgtBs2ytiA5bng7/CrMb3mLHuM9gvLNOcAJwvwtC/bLeXbq9NybQUl/3Yr0l+cb1M5N68C0c+s+ImeI/P3H42AWlE878/Dkund/KBAx2zeSc0uZV1wqU4ej63ILkDw+J4j8R3Cc8Bn7rMCpw1oWQNIYPfr7FxUHGlAL7deyU+RMAKPFgi2SqlorRU6QJF+17U/Exs3KkyD1S8PA9gzElM4VBg1UThbdeJzThUZjy6t7VwlyiFAWtyjQIanj1Kq2Rfpkkj6wMuA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(136003)(39830400003)(366004)(83380400001)(956004)(2616005)(66556008)(6512007)(966005)(6666004)(107886003)(110136005)(66946007)(66476007)(52116002)(8936002)(921005)(316002)(86362001)(26005)(2906002)(1076003)(5660300002)(6486002)(186003)(4326008)(6506007)(16526019)(8676002)(7416002)(478600001)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?xPJ+j/F1QODEnfwQuHdJ3cBPXHGRQV+O/Sx/czO/a17kouk4gJk5dZWzaReq?=
 =?us-ascii?Q?PyszaXFp4rCgvxZXMBN20iOI0t37TB59Qvr4fGXOuh3nWV+10ukxReoEwQtY?=
 =?us-ascii?Q?lPe+j5t05aK/gdJMqlelBEH2w8Qq/Db41UIpyMb8eDvblt9kz8ch1kpMIliD?=
 =?us-ascii?Q?+wrgXqw2Zng2rx4fljY1MOUcd+5GoZZ4n4QY3HO2m7EqDRMVafBQwkQ++0jQ?=
 =?us-ascii?Q?vqR0vhXpkJlHFhZHgpxjmqOhHGsyNwopokFxg/bxEB5rmv307HsZKdO/hiOs?=
 =?us-ascii?Q?KvvWoSF4iwzDBvLVujlLZvVgcJi5r+mB7IKw/8q2bmu84Mvdw3huKoMnkMo+?=
 =?us-ascii?Q?QlWot63WG17ZekCfOJbs71rOisdU4wsK2eFPd8aJfUQ8uPuaqI6tHoGii0si?=
 =?us-ascii?Q?hdEQpLT5r/Oi9521yx616dJ8LKYLmE5TzitwoibH3MnE6L7WTjcuHjXXHix2?=
 =?us-ascii?Q?442a+rr9AF4PWU6oZrgGPbLhJoNEnzncuGPj15BdCjusZ6hvEW4YYZnGFUXQ?=
 =?us-ascii?Q?dEPoG1g8fwlfvSaeooMJDir6ndHZr5KMuhUGlJfDzjn4RLWglOAbbE7O1TgT?=
 =?us-ascii?Q?AgX7ajVO/Ipq7VOYkVHuKsc44jssQr/1/BbxAajybs8p91agm+5yOch8JPaO?=
 =?us-ascii?Q?nStKgnqd3baG2xx35ioXj4G3k5O2YupOW8cP8w5UEUvF5TmrqTrtLfCHDTVh?=
 =?us-ascii?Q?GUrsemKokRD0tUNF2p3nY0MCIb5QgugPYy6KAB8PNCQMDBpNZ6YhoTm0NQOT?=
 =?us-ascii?Q?Y9DVt+RL8HSJBX9NtfN04AQS8kPx6TnufR/5hhWmMo728Qo+t5AfyLXmUVai?=
 =?us-ascii?Q?o6DctJvjJzPfgwzFxXvx423Q4jd81GiEOh2S3p255QmD0S2dKvWiMFxx8PIa?=
 =?us-ascii?Q?trzHcYqm3Rle5YRUmiH5ioUaIaEq0bdGV4zSGcgyI+2Vm6dZNz2QHgjYcKxW?=
 =?us-ascii?Q?G7NI1BmFxUtQXvt2Z7u7I2irrKLE/3YcapdL26BcnbfH9mEy0PgS1xGRTAkY?=
 =?us-ascii?Q?UNlEsVfD9xFq2ll2lCP/MAi0TWWwDQiHiVVr2AoVdEDTTnrDSw5NWwCC/OJP?=
 =?us-ascii?Q?DjJyWEpmFsLM/kOhvlIVdtjWicvBZZX1XdHsm9klV8Bilqt4/ybJ0sTjA1Q0?=
 =?us-ascii?Q?EkzVHXzyKq9qfX/odkcXy+QPa9ZOvm4Mk6YvEFr2+OXi0ynHZzgjeEFFc1Q9?=
 =?us-ascii?Q?VK8FVR7X8+8x58BT4Jo8Gwu5IheiN/J4qCEAb+mr2ImxcJb0X1ba/pxf6oNo?=
 =?us-ascii?Q?RAJD8jXckti2xI+45PP9lxFDjL6pwHfD6/a2WXEMY9o79o74gNqcCTUDQwDW?=
 =?us-ascii?Q?EkB+NnW2NdG5Ne8gCphqwPAy?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21d3b5fa-589d-41e7-33e7-08d8d976d9b3
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 10:19:35.9570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tK8bX6EkWmjfB5LnHdy2nh6jQN8ZfhxvMoYKIrn8DfFT8XjK/SlfQCYQAWM+v97+AEHMtnp8yRu/AjgFKevTB4CVsX+sh1OkCZ7Tr/u03zo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR01MB2320
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
 .../bindings/mfd/ampere,ac01-smpro.yaml       | 82 +++++++++++++++++++
 2 files changed, 109 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ampere,ac01-hwmon.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/ampere,ac01-smpro.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/ampere,ac01-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/ampere,ac01-hwmon.yaml
new file mode 100644
index 000000000000..d13862ba646b
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
+  details see ../mfd/ampere,ac01-smpro.yaml.
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
diff --git a/Documentation/devicetree/bindings/mfd/ampere,ac01-smpro.yaml b/Documentation/devicetree/bindings/mfd/ampere,ac01-smpro.yaml
new file mode 100644
index 000000000000..06b0239413ae
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ampere,ac01-smpro.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/ampere,ac01-smpro.yaml#
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
+    const: ampere,ac01-smpro
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
+            compatible = "ampere,ac01-smpro";
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

