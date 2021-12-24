Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E6D47EB46
	for <lists+openbmc@lfdr.de>; Fri, 24 Dec 2021 05:16:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JKtzK1yn1z2yb3
	for <lists+openbmc@lfdr.de>; Fri, 24 Dec 2021 15:16:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=QOhYHbSo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.220.136;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=QOhYHbSo; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2136.outbound.protection.outlook.com [40.107.220.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JKty71lJnz2xXZ;
 Fri, 24 Dec 2021 15:15:11 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qd/71vuYQ0AU1IlmZ3sO+8f2d/scIJD6a4Iybia07CnRcpRpwglJOyL4fah6Eg/m83+/2/p3HePaFJ7xPsiJTODjCQRVO8pKACcNG2Ly8ZU7A1ErTsoz6rjHBd7uCLD2W5UujL7XcFP7Ngg4aCDR6P6NiVkq66TeejljKwIUIYqOg4TZGicTjSYnj2bu2IkPwDjUdODZEXprhCaGG4HQMIw2LjE+0V20wsFRhYDsNuc7Edfi5/GPNxzvMjzAl/xuIX+GbLvejlES8XAg6Zkshedz8pu6RMprBtX5gTZf61tw3i0JQl9SFiond4Zj/cwTo1pWki+w3cCR6zoXZ5SzuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6H8GRmT/A262yhSEl19wp4rAZR4NmV5TTyKNRouBYjw=;
 b=KyYZeA3tEEn0UUCMbEQ7xDLmudDE9mX5bm9Q2AUWpt7GQhjGFBejJ3dg0cS6ntNbFwXIaMOp4FF6D+JrgEzIFPmv08g7u6aDXJjcNQS4cxjtu6oYlMQskx5CAEGZoyBouE+GfA82HnBfAl71cDDAHbFC0MFd9hQC+RyJqHjCcaUA5Ax5QOKCBtQbqQ6qvwU11lv2YOyanyUunLLqeMBGkPNn2cOc130iuUFRKCJHOPLTuZo+UCzTH3vhMwVpy0KQB2XzgeLPXhkb7Eque8sslUGLvPMELuzbEbmIRfRWFqayYag96PrP4uEuij3ERgbCd9g6SWblkV0/crsM8ErZIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6H8GRmT/A262yhSEl19wp4rAZR4NmV5TTyKNRouBYjw=;
 b=QOhYHbSoqoBHNMl9pyb90xqyzmt+dI/CgcQcfzjzz10UzgJQnJRLPsGFNz7USYzXP6a/W5LtXkfeh1YU1GBi14hB29/gnc48h6ox91cmt3hCRQmjKywtLQ2G1iMC7IQYwdluj65IBhBkSMPO5FZ9ucLChA2YwuZTMFDJ57Q3Tdk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BYAPR01MB5189.prod.exchangelabs.com (2603:10b6:a03:78::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4823.21; Fri, 24 Dec 2021 04:14:54 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::f957:680d:69b0:9999]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::f957:680d:69b0:9999%4]) with mapi id 15.20.4801.019; Fri, 24 Dec 2021
 04:14:53 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Arnd Bergmann <arnd@arndb.de>,
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
Subject: [PATCH v6 1/9] dt-bindings: mfd: Add bindings for Ampere Altra SMPro
 MFD driver
Date: Fri, 24 Dec 2021 11:13:44 +0700
Message-Id: <20211224041352.29405-2-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20211224041352.29405-1-quan@os.amperecomputing.com>
References: <20211224041352.29405-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0134.apcprd06.prod.outlook.com
 (2603:1096:1:1f::12) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd9cc141-0f9f-4e9b-a4bc-08d9c693efbc
X-MS-TrafficTypeDiagnostic: BYAPR01MB5189:EE_
X-Microsoft-Antispam-PRVS: <BYAPR01MB5189DC1E93E595F0A2CDE332F27F9@BYAPR01MB5189.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:883;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XNQdT5R9caFfxx0hb4nHJW518EonrbWJxPih3myGHBQPfVsc612QrAzCn2AYLu6ATUi1czsc1KmQStfdkvIQCH1dhUxEqj9ZlxzQIzYDTRc5iWR7IO62EPhaOd7+Ld9zqDEJDJCzxcOKY+k+ECh3jerRy3Cmxx4M+GZ9xdcxKgRNOQ980RPcnU7NsmHe6Fi2tKgs9bre6jcLhI1xO2IYgZ8fC2RP9cNGl2EDBviuowAK/2wJCEe/CJ7HMa5lRXug58/iYGtJktuPgWgydKiENK0FQo7DsJymbqAPzxcqZzEdrcVwRc/ac2bEvgmNUF1/xm6hn4gN/UMl+wsrkFiweaBZqzeODTWm6G6Jt4d5L9fK0fIWTeOlnMNnuUHdNb5LBOQejBjijqvKaeAovgZ1OkhEFPmrB2V3Z8VixM1P0oe55/l+WaOVga8R/mpmYv+UguDu/mVHDqcpzoANqmonqQqcrPpP+lAvpF8NTRuEpX60m7VarFxZG1//3NtOI8oeNtBV7v7cc8IhWHJ2DitD4kNJU/H4JbGOroNo44KidO865fx0aDPntFHgKovTMPaox6wFjKQa9QHQI4h/mI0Ksuw1yJ92vV9DfeUEp8VBE86UBAL5Ezz0ZQxmN4liJqPbYcDSvhXFgd2+fdxopypuozlQKOeN0MRwK8Tmm52UjhnI/aeuqPmiYXraVQxEQUdrw4Ki9oalOkfypEJy91kzo+b5NiI6sz/TMYb3YHEsoYQ9VIqK4XruoUBxO31mHcJn+ulLyeXMBq/TCZyaNVWoFPri7YR0AiCt76v408C6VzA5n3a41RDb5ErN15AK2Eb+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(110136005)(54906003)(86362001)(38100700002)(38350700002)(83380400001)(66476007)(52116002)(5660300002)(2616005)(8676002)(66946007)(6666004)(66556008)(966005)(2906002)(508600001)(1076003)(4326008)(316002)(6506007)(8936002)(6486002)(26005)(186003)(6512007)(7416002)(921005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?or+a+Qw2v1zUO1gy30hPGW4yuL+0JGWyfXTuhIXYah8K7IXQ2+Z5vbnGK4xz?=
 =?us-ascii?Q?zXh9BPHYXE6o3vpAQoGFZdw1+sEolqWRjzf1K+WarYoNGjx62J05Pn7BVQmn?=
 =?us-ascii?Q?oTu1v0BF23Z1K1LJ0Cm5pzzkPJkQQ/485HZn8WJBE1z+vOvdK6Mf5qThmfji?=
 =?us-ascii?Q?iQD/+427ELMYvhuWrDcWf74Z9/o48a/OFrVE40MZjpfumkBzHa88ebXlT/+L?=
 =?us-ascii?Q?lx/pfNQJtsRn1lzsdmEUpBemPQZXR0rv7d1f7kHn81NtKaYaELOm5S3dhU1j?=
 =?us-ascii?Q?Uo5Zpad6+hIjeuF1o1lyH7ye49B/ESXHd/gmDv4whNSLQ7PHpOFyDp0dzxU2?=
 =?us-ascii?Q?eeQBCfF9VYV6cOM2AEzrm0poeCv/1+3BwnKXUS5DWry+DPogblZE4BI4SbX+?=
 =?us-ascii?Q?dGDgfJKjRULWdlhUJPe1Ezud/y21877Hpcu1B39Ok2ICkmMfvDBRDIWmxQR1?=
 =?us-ascii?Q?RXwSLKq5SifRiprBJl7lIxVsKRCcIQAEGw5A5D1HnB/BXpa4ERneuJVuQrWM?=
 =?us-ascii?Q?HIZ1Tz9/tmXWbU/32wPUrSnIYNWfInVC2rVbzixbui0FCt7N5Kf+CtFa/iFs?=
 =?us-ascii?Q?rdMZVZo0lfhgNeflyv5CmwIKbo6CVXt8/WElz6EysdxrYzHeoPJWaHlAMyK2?=
 =?us-ascii?Q?2upoM6Ad89fM4jbhzCDaJJ8Cjicn8Tgy6JU4cp61c+46zmutUnoY3W9fRmZ2?=
 =?us-ascii?Q?tZ3g1YA//Y8djA2C93MVzQFYu8gjG4dDR1GEyBytP1Ki/r8bn4p9xUvvuzoc?=
 =?us-ascii?Q?wZdtFietXk8gBRi5p/vpEmZB4iO+8xyOALB9503dTdmjbMHUy2VIooL5s9i1?=
 =?us-ascii?Q?+L5m0VCxJPBl2eESM4Ny2evPozLP0llDWZspeuZT1NPoH5GzyM4ypQ5moP9j?=
 =?us-ascii?Q?x9rzlx7fWFZgZ4pwbdH89wqX/AX97xZmj8t1HI3S7FeZ+CMYRZnhOPnTXxbH?=
 =?us-ascii?Q?4qRBIXjx/E4KJ/C0OyEQWpti6wzTpldAz7sHKdcJhkxx7KW9FNTWuF6uv1mi?=
 =?us-ascii?Q?1tgLLoj4wYUr3w7UKzl0XaOUZGjsIK1MpJb+wg3eEzOtJdaYjWHP89bCuQHc?=
 =?us-ascii?Q?irCHfHx0dWizuTgBSJroEKAQtntCUx2EBXnS/VQCb2SBgm/P2pPFz+BjAOof?=
 =?us-ascii?Q?/0gkoJOJ9KCteWAKixHhwkQTFHgmTorrXPBq7iNdQMLZSEG0FnEaZThRuFeL?=
 =?us-ascii?Q?KGMN0gg7E/m79qHHUAKb4/jre/kenfMfvdylBYeGUslLkt640gVb6S4tg+f1?=
 =?us-ascii?Q?S9NEUrx2EypR8k2tuxqRtN9WlTviry6gB042lzv2rjyFmhhupw8IXB7PMftQ?=
 =?us-ascii?Q?Ilp1xOqY/RQ+U/pPHyxUmBzSES1yjJtcgqzqSFUhb+vvATH4KaoMYdoBNRp2?=
 =?us-ascii?Q?EcgmMZchEkUuWow40dmkTYrGgiGnt1Y7xoSJSm0PIANfv3rMewbI5a6+JzUN?=
 =?us-ascii?Q?UB1BrwNP7jHmYbT2oWfDElnBFzgqlfYgJCZs8OC8pOgHYDc3qnLTP6E1x7N5?=
 =?us-ascii?Q?HWt/uL5xFy6if0pM8Yanfeu5fFwdOjasPizXoFZ09Kn1pZTfCCVnQ1sGn95n?=
 =?us-ascii?Q?1hcsQ6G6SOfGB6Re8Wg0QyeKuU40IogVqELkCD4uP6oPTuON18v/ivVp59ez?=
 =?us-ascii?Q?hLYvMCM1W4IU04ViknPa/pHYyBN3NFZyJ3/IQVD2mZrkimqkGXH5xj6MN/3w?=
 =?us-ascii?Q?f1hfV2blH/twVYvmqlh2ktJHhFU=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd9cc141-0f9f-4e9b-a4bc-08d9c693efbc
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2021 04:14:53.7851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ow3FTHgczCaYVMNVaKgQWROLdRu+X1qR2CV/lPv5BzDwOvph9BfvvigFao48DQEHO0bQYkKwOFtqvLXT+l3xM1Hsp/5x2lcdoUF9H5+P/7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB5189
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
Cc: Rob Herring <robh@kernel.org>,
 Open Source Submission <patches@amperecomputing.com>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>
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
Changes in v6:
  + None

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

 .../devicetree/bindings/mfd/ampere,smpro.yaml | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/ampere,smpro.yaml

diff --git a/Documentation/devicetree/bindings/mfd/ampere,smpro.yaml b/Documentation/devicetree/bindings/mfd/ampere,smpro.yaml
new file mode 100644
index 000000000000..c29d975c1bc3
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ampere,smpro.yaml
@@ -0,0 +1,48 @@
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
2.28.0

