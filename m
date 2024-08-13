Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5D4950026
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2024 10:44:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=j/+ARHoF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WjlKx1Ks7z2yPq
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2024 18:44:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=j/+ARHoF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazlp170100005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WjlJR2Pn2z2xGT
	for <openbmc@lists.ozlabs.org>; Tue, 13 Aug 2024 18:42:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XUYvqYGsPA9uThv4haqXeoRI367GePm+wDcSaZFzI4ULZ233NGxQiLNuQtzPC5dZmu+39q8sYzi5SQYbRyo5lTFYmSn0IELXZJk5hnVmxnRkVQnCUUXYWID1O8SymW3s4Wnz85URYi+GQgUAxINKoIvrol3sm2wf4nm7CnpLx4IZwxIAedDqSkMIjKwHLzjKL3R+VuHvxA92uJ6UYkITjcXtFiN6ZZ0JjIHld6JuX48xbO2237gUgNxB8/lvESY+39gYoot3PEyWPYSO+WtmUMyh4GfqLyIxFpDfkvgjbWBkVXOso0Um/vQD7aww/yQwuL0cWj6va5M8f5Sysn+krw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sb+p7UsXH7+4VpX9aFM5e/O1JCxPBTfv1JNAi+yK9kQ=;
 b=Bbwos+K0aZB9FEuESHhb9EzvKy1ginlhWg2EMiZOR9MWSu9GuqdQxvMA+07cn4c5ZWEDtydWlb9NnaQYmKuhI3xhh0hQ4PmMToCjCIxRpKxiW0KJI/NkRGdjD6KhXjCMZ6IG1u6C7pLYwhbWIAUeWH81dO7aBQzejhwaB9Jwmov7oCB8XipJOb4Vw6Y64S0NnAlMQmQ0nQwJoVcCcVgnDwVzjyH53Wb617GL1vIXmvSvAydG6F94+oB0ALqOfP7rfyPyUc8961lgu26S3n/7JNA1EDNl1mg7PpDadT5J1kslqz+6m8VyPpGVX/0HSx5wEiSdvQ1x+Ji9UOtIUrCVDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sb+p7UsXH7+4VpX9aFM5e/O1JCxPBTfv1JNAi+yK9kQ=;
 b=j/+ARHoFmAm5w555ndiVItSvKfAdXUEMbSryj9foX/Zc37N1AuF5HV9rVEMl65gPxvyi5XzJlekQLYqcBpTO7CO5A96ivOXkWZZ1afOc42n+JNuuamDn9pQ8NCEx6fwocxx+ZjzyyqLt6b1j3MOWD9sQcnbzUSVRb1kxHlH/iMU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 CH5PR01MB9029.prod.exchangelabs.com (2603:10b6:610:214::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.22; Tue, 13 Aug 2024 08:42:26 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%4]) with mapi id 15.20.7849.021; Tue, 13 Aug 2024
 08:42:26 +0000
From: Chanh Nguyen <chanh@os.amperecomputing.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Justin Ledford <justinledford@google.com>,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	OpenBMC Maillist <openbmc@lists.ozlabs.org>,
	Open Source Submission <patches@amperecomputing.com>
Subject: [PATCH v3 1/1] dt-bindings: hwmon: Add maxim max31790
Date: Tue, 13 Aug 2024 08:41:52 +0000
Message-ID: <20240813084152.25002-2-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240813084152.25002-1-chanh@os.amperecomputing.com>
References: <20240813084152.25002-1-chanh@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0013.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::9) To BL3PR01MB7057.prod.exchangelabs.com
 (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|CH5PR01MB9029:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c1275a0-7947-4394-52f4-08dcbb73dba4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?eOsZWcArKOANZTD/KAWOfAz2hXk9es9udGlW9NiInxqc080vNOZeM4ui0Y+b?=
 =?us-ascii?Q?HpkpHP5nsFdm34e+9IDTo6+FHUU9mGWmpD7Es1tMTf9R451kAf1kL0sHHQ4J?=
 =?us-ascii?Q?zVIySVFk6cz9B1FUtRV+Ov9uQH3jJRMaNO6pKCV1MYmFSodFgLkSaaQJKyF5?=
 =?us-ascii?Q?c6k5etHxHIlH9ksuWh6D1mXLTE21TM5F4Uci/75YMgg78aOSeYBQ9OqjtjKg?=
 =?us-ascii?Q?IZJwNUY+GPYoW+BgpwieVWGGicAJQhKx4wdk0/R7fbosV1BLyPxEmobtoudu?=
 =?us-ascii?Q?nziLIvDHInVP2E0Xx5UN0iOkczc+ibKjVobtUcr+UAJlmGXLUk8cIllHHTCj?=
 =?us-ascii?Q?15YrqAroKBHaJXBQUd1Doyv2hkWN1FT3d7rRr7EOhxjWee3sZaw0FSt9vnbg?=
 =?us-ascii?Q?Fd2ss+EKhe1LmYmd5iwiwuMSH2dnKJ+n4rLCwJeC8NrtenLsNlCju+giNz7g?=
 =?us-ascii?Q?xc0CFqf46pf5/5D0Rg7ov0ObHxpd+MbOOXowZabmulx4RHVmoYlD2tjx9BOo?=
 =?us-ascii?Q?LlXzcvdsY0geUlzI0JjhCrOj3LelVyyGHOSEvJuoPsTaG5g2CR801fsFw/CI?=
 =?us-ascii?Q?eRC1Eg3Tey8MvorRTiJw9Z9nTz7jGcxP2JvL2FAD2xGrIciTwoDOu/sqe5iM?=
 =?us-ascii?Q?+L3AA2z23uO14OjGdd6jy7Iaa9pc9V1wAURVTIOJdGgBDnrJZOmugeOPINvP?=
 =?us-ascii?Q?fLP+YyUZI4TBLWs3PMgiCTBkKXBmyTbdBOhXsfeSbSYyrE+9Z36cQ6XA4GUp?=
 =?us-ascii?Q?9aonl/o0aSEf2ZEyoJ/FUhgmgTEO4vfhJed12HsGEzV3cOtWXhInAUr/VU5g?=
 =?us-ascii?Q?bTg6mnh7wyZCiWseWJhIsop+gnwK4bhCmYt9kEOpDW1CwzhBZ+qgB9B5bcv6?=
 =?us-ascii?Q?6qktdSlgpCY2okmBPMtMusgiS5S+TS9u+zBAzhuHZ7bzKaP5raQVOuHca4P2?=
 =?us-ascii?Q?dHiIDs5uqZSFXSivwvH1P+nMcgBGqI/HxR1i+SN3b2b3BO02zzTG7wFS7Y1H?=
 =?us-ascii?Q?Mu2u/DgKYkctI4tOzIUx++IqvS/JcsAyYdJgTQlTTJRuAq4ANnwSuuTpPklX?=
 =?us-ascii?Q?YAkAfKAbWdCzm15a8uiaC9MKS0VkoSF7Cw5EApIpHFMEaCKKm8U6m4e/UiCN?=
 =?us-ascii?Q?EjyuY0q3F57FKcAcPml3pkAKPkYDvKX3ldNcyT92hudCFfogh8Ul+ahr2bSW?=
 =?us-ascii?Q?BxYPYdvqPbU+R33RsjVC/Y1GnI5iooABJ4zV4LRrv2DFp829cu/HpJkjWKbE?=
 =?us-ascii?Q?n7zBi2k6ZUP4g2u6TLY56F2TPjxImjgF7lnw/A9GF92cV8aJ+qd6h1dSG5fI?=
 =?us-ascii?Q?KKzyPfuYjVguwLlFU+tMsHrU?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?C7nCrA8Z8LoGqBBaV6qJRP1wEqPnXFPHn3LyhAEq9krtXzFl9E/Ub/gZhUiq?=
 =?us-ascii?Q?reJIbl5/8Vpb9t2Yqfy4mlWn7uI8ac2fYfYH+bVj64JU4OCpO18oaufVh5eS?=
 =?us-ascii?Q?vQMwY+g1EyCUWUxZzTpkg7xEkkZE99Y6TddaLXt51KGguG9d3QoYQ/ydTaCT?=
 =?us-ascii?Q?KoJs+372pi0mFamOq7GwbP30EY/xtE6oXN0wUk6Ir+gwhlmiU7ad7zVDscq8?=
 =?us-ascii?Q?UXGfCT1N/EJkHt+NNpFjOXpkz0h9AZxEvTMp4x/y+X76daqfZuVqcsBVdeIh?=
 =?us-ascii?Q?X4QIayE8ER75Qjf4O4p6foMU7MvZSGUGxpaUYBQ+0rlmlTZ8ma18+kIlYBta?=
 =?us-ascii?Q?rziUnIcgkjinyIpxXA44NrrxsCb2ZjRc/tS684HZPFjJcyuCySPWOdCGP0BA?=
 =?us-ascii?Q?J011h3i5g6EayUlPx4zQdU7csMHLSCc1W6D8Jda+NgrwHfWlbj0uWNv8egp+?=
 =?us-ascii?Q?2+uEeWycFX7IwV6yHoGWVMoQao4C92Fdu4Uqbqx5Xucuzz0coxxOdgui+y0q?=
 =?us-ascii?Q?OFneguTEsFyZV92vQTuj57kIV1TDNrW3dSrVOVzJwnlrt4zEUzskkWVryAq4?=
 =?us-ascii?Q?UiwqjiNY9cbuc3CJnryATgOp6hkRZj1XrF4m5T6RpklJLkI5vv2pqizwV5MH?=
 =?us-ascii?Q?oZzOyhhKvHe+p7l6OKp92PlyRinPHKMF5UHWJToZIuub4BOEWf30O3TpZuxR?=
 =?us-ascii?Q?ngCRBdcTSjbsNaTPXMTqZqGmHZngAN4q2FwrbBNAc2Gka0/hifm2dn76t9vn?=
 =?us-ascii?Q?4/dT/HWqGU5ziwqZVIziDjuuFUDToPJ9s040ppBClC5Ky63n5C6ifoenQORN?=
 =?us-ascii?Q?zGHnghPaR7n+vsqbXXcvlZkG+Sj5kaYGlMYaeH6iF63GqwUcgD8lz1i+JSMq?=
 =?us-ascii?Q?O+fpV+9azc23EZtgiMG5UPIolIK0MrsQyNIMgFmagmiZchMt9b23pmEsCj9b?=
 =?us-ascii?Q?7OCFTE7URZqtMgFsyPd4DX0t9xGz9NVwwTiJwdl2jpzEnSfbHfqPmHWY1PPh?=
 =?us-ascii?Q?Z44SPDeYI6kwImxPkGVJ4uEJRT42pSHU60Z/WUaNs/pXEhD5795PmCnvzt4M?=
 =?us-ascii?Q?k7a4jlLVDwzFI8MWwUwOUQYeJxXNM8cdGBsyL5SU+HGYgIrKKzm4jz1YbZKp?=
 =?us-ascii?Q?5uOwP9zLvJHkcTLYZ9bFKwbLnHVokgTmVdw1z8Ln35alX9f/bdYZpd1MMxxg?=
 =?us-ascii?Q?LKAbG1Kt0mo9Z1tc1Sj8kUcHuGSck5a0omyQT0e5aTjLCJfoWAGulwAcYacp?=
 =?us-ascii?Q?BsZdhrUmYWIXRCf0aN122/s3GjnSuZ7Zzrp+sZd76NLS7PeRkEIjyOZvx+Yq?=
 =?us-ascii?Q?jTq0T8Z5JVwzmlX57ZCNqE9Z/OHuWMVMmNjpDCGCADqALk1/CRKsk2xjETkF?=
 =?us-ascii?Q?VkmiDXstf08eNA0VBO9fk49rqp7jb0bxTP+eb0BwlU5Or9gcllLGkIlga9K5?=
 =?us-ascii?Q?4cC+Ym1BkhFGUx4GiT0SGGAM12L3txCYDsQ0jmBeSug/cwUFAd0YTJ6Aijt3?=
 =?us-ascii?Q?Xl8LN4mPwDAAcbHntGC1yc/pkKDjaU3nAveEiIf8HZ8FB1OC3dLW3AUNNnN4?=
 =?us-ascii?Q?gAfxNH8U0lZvR2GPbIEj0M7sXDtmosoY2MM7b6hFc511lgdBqi3d2MiRlfzZ?=
 =?us-ascii?Q?QGJN39eOncPiu3f3X+kafHA=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c1275a0-7947-4394-52f4-08dcbb73dba4
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 08:42:26.4237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p+WLFB5oD6cGZE6tjBzKas91HKO8Xa+eRn+UeIvD+dXsV+UFPTawGdQbR3Td0XINyKbRm37aRYgmVs19GaP1GNMHORSDYCuXU2MQGotva3LlJjGpjaWljdEtnIXz2Dzj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR01MB9029
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
Cc: Chanh Nguyen <chanh@os.amperecomputing.com>, Thang Nguyen <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add device tree bindings and an example for max31790 device.

Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
---
Changes in v2:
 - Update filename of the maxim,max31790.yaml                        [Krzysztof]
 - Add the common fan schema to $ref                                 [Krzysztof]
 - Update the node name to "fan-controller" in maxim,max31790.yaml   [Krzysztof]
 - Drop "driver" in commit title                                     [Krzysztof]
Changes in v3:
 - Drop redundant "bindings" in commit title                         [Krzysztof]
 - Add the clocks and resets property in example                     [Krzysztof]
 - Add child node refer to fan-common.yaml                           [Krzysztof, Conor]
---
 .../bindings/hwmon/maxim,max31790.yaml        | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml b/Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml
new file mode 100644
index 000000000000..d28a6373edd3
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/maxim,max31790.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: The Maxim MAX31790 Fan Controller
+
+maintainers:
+  - Guenter Roeck <linux@roeck-us.net>
+
+description: >
+  The MAX31790 controls the speeds of up to six fans using six
+  independent PWM outputs. The desired fan speeds (or PWM duty cycles)
+  are written through the I2C interface.
+
+  Datasheets:
+    https://datasheets.maximintegrated.com/en/ds/MAX31790.pdf
+
+properties:
+  compatible:
+    const: maxim,max31790
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 1
+
+patternProperties:
+  "^fan-[0-9]+$":
+    $ref: fan-common.yaml#
+    unevaluatedProperties: false
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
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      fan-controller@21 {
+        compatible = "maxim,max31790";
+        reg = <0x21>;
+        clocks = <&sys_clk>;
+        resets = <&reset 0>;
+      };
+    };
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      pwm_provider: fan-controller@20 {
+        compatible = "maxim,max31790";
+        reg = <0x20>;
+        clocks = <&sys_clk>;
+        resets = <&reset 0>;
+        #pwm-cells = <1>;
+
+        fan-0 {
+          pwms = <&pwm_provider 1>;
+        };
+
+        fan-1 {
+          pwms = <&pwm_provider 2>;
+        };
+      };
+    };
+
-- 
2.43.0

