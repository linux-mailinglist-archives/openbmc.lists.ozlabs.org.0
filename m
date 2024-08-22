Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C9395B0E9
	for <lists+openbmc@lfdr.de>; Thu, 22 Aug 2024 10:49:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqH1g3NMCz30V1
	for <lists+openbmc@lfdr.de>; Thu, 22 Aug 2024 18:49:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c000::1" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=Pg6cCUhZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:c000::1; helo=byapr05cu005.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c000::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqH1Z4pfpz2yYs
	for <openbmc@lists.ozlabs.org>; Thu, 22 Aug 2024 18:49:05 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RJaSeZxP2pLZ14AXhoMaQLOlj/Al3IhSzii6Z4vddLKyy7WnDgguVsh/ayHSrz9ldUtTH5Wq8JXLY0LImyWX0NC9x6oJagJLB+JPzlWN1+oBuZsXV4SE2sboriofq4zL/jEGmbdSjqG1cyQ+cxqiKEJAUjstrjkfiNHAo4hMlnk1zLWxqggrD99LvBV3n/N8pXrUsYrAYM8dA078bITByZj4Klkw6NQn57yH11CVRGwRXe5Q6zKau5TosOWujZYq79b8gC0dxM54Zj40Uy+juPa9zP1gL1BvmMDhebLmY6wp6oPnvXo3RAyhd1vma56/2JjjgydH9S9U6t+Tjuy/JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AAYSBkKhV6aYFHU10poPXcyMm/nVrJf6MD9nx8xUg58=;
 b=skseJMdlaW7Bn9oaUwfsvE3HyvLntm5Y5lUyCaGot/hmPuPdHPtD6UiMVqXrbg5A9/wr5TswExbkLDJ52XIDS470WboCj9HWZaYmvK62Cz+6tXa/CTrA+2eL5OEt8CnvKroL8YUgGq84w02L/V2Afq/LI5pOPXiqkmNRApg2azjyL+8ck1T/XFntVkIHrCvpn+t0jaRU/2onZtfYSJIwaW4HPrNqYpx12TORVXYJX6k4U5wLrp2EMDe+3fjeaiCC2yDr+CSQljGN591oKSmwqvf9XpckNNepuIIC+n294l6TOc+LKYro24C96Ka4ODNoHRyDKBczbz7JC6nEGwdhYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AAYSBkKhV6aYFHU10poPXcyMm/nVrJf6MD9nx8xUg58=;
 b=Pg6cCUhZdpMGct8C3KPGYMYl578hUesPPvTW83ULtcQ7RWFgA3fqjir/LLm+L8LdkW78GTmhiCFTVrl6AKI3uepXTEmibw4RwCKU7i9+kOKI+cPFco6IGSSYJDNmZ0bcH6sWSWhHN68ciYO3Nn1/bKOJVYpga6dQnPHvf6oqoqk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 CH7PR01MB8882.prod.exchangelabs.com (2603:10b6:610:24b::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.19; Thu, 22 Aug 2024 08:48:39 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%4]) with mapi id 15.20.7875.019; Thu, 22 Aug 2024
 08:48:39 +0000
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
Subject: [PATCH v4] dt-bindings: hwmon: Add maxim max31790
Date: Thu, 22 Aug 2024 08:48:08 +0000
Message-ID: <20240822084808.299884-1-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:4:194::8) To BL3PR01MB7057.prod.exchangelabs.com
 (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|CH7PR01MB8882:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ea5f676-a0aa-4a28-75fb-08dcc2873760
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|366016|1800799024|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?Lhp5ymdLMcKFkeiSln7vXBwRdwxZWqPW/EIjcpDmkIom9Tj6teVzMNGWxIXn?=
 =?us-ascii?Q?en10HmNB1x6Kg+pJj8TYMRztX36ueMSR+yxuYUxaEr/lWYMF36bqUfPWcFRt?=
 =?us-ascii?Q?dPIE7IYfdrP3lRmc8javF8wvCm3mKe6yuijqmmxsslucBwTtVDGofmkTKSGW?=
 =?us-ascii?Q?JMtfTPi7xQFZt0Z9qYQsYNkRnU7WnEXteBJdkZFZ2mjaAnI9yqrlBxA2NCrQ?=
 =?us-ascii?Q?qxSA7RLzwsA43hf6Ql4HWm7N0/mSQi7LIteIooL/euqtEdau+0k4Jlu3OUWv?=
 =?us-ascii?Q?GQefvPsGq5lcjeK9hl0mm1d+0yjVJ9LT4gypybTPfr0gim18AoNpuPnCfc8W?=
 =?us-ascii?Q?7c83FamgDkIdvLjrFvzg0/TljMkgqRZOlinuxiUQSpyyWTOTvKmpoqZM8EcF?=
 =?us-ascii?Q?aoTOj/+La+j1dyX4HTdVqYfaPL11CrrvFUGZKuxMz5F0/57R+u/XHz3GKpUK?=
 =?us-ascii?Q?FOdIuCyFH/+gKRmUTyyt/kklW+314/kRgdmjjSO8a5+WMTgEVd7w24wkedFf?=
 =?us-ascii?Q?eSibvHpCSAx+Jxt7O47QUUUb4WPpT8BU6CDGgZ1XzyYkc3fNaztM3wJsmvaK?=
 =?us-ascii?Q?nVfAf2vKonbKpC5azlnF96rcXKFxbd/lLkDBJ0HBImQlTACAnVSTQHCkEGSp?=
 =?us-ascii?Q?21f34K8AWtRd/WGHznsYKeL8uY1C6YvUJTMqCEI2yBLgUT9Fhv8bOP92JeUp?=
 =?us-ascii?Q?hY5TXN3evsQEd6/PBEJA4li8TwyKpVURhVuY1T4ogphC5QFJKghXBLkTly6l?=
 =?us-ascii?Q?F2t6TMHiS3zq4k7FiaYwTk99mNN2TeAvngLIqNppBlsmiEP8NctUzDB5YazX?=
 =?us-ascii?Q?6VPyqwveofq+Rqm2rTybEUj5OC2Q8WdZ4BtW1JbtvYlTpRM1uBob1rfWm3KN?=
 =?us-ascii?Q?2iNo/WLWXwIulVXDRWxTKL1zt3gMFRnS9VX1RkH8Fwr0iRZaaQWbTgtzqid0?=
 =?us-ascii?Q?qS67+ykqds7oEpvqH2QKVfO8/dcH2iyfU2fgKIFI0uBYcsjgxtCB46P6+7mU?=
 =?us-ascii?Q?/iIaCx2o1/xKpNdvXXTknJAheV+xY2z3sUlGi7SihsvrtP+8g8ERi5JAAO7r?=
 =?us-ascii?Q?PhnLFGANCUm6hndUYIkTrXKIIKPgB+wFmvkwahlZFWrHkKLsZ0axXC+dR7u2?=
 =?us-ascii?Q?1NA8+hCRpM9tJXSLUi5uGuEVsXpN51AFC0yNEDnaZ6uTaX4sQTJ8nOA83/vJ?=
 =?us-ascii?Q?VvoZgeRFwtNZ85sDaSD9ls9WazchtRU+7XoNfFfpKnh80dUP48LgeaJym3CQ?=
 =?us-ascii?Q?9scTfnf6H6ndInJcEndN1XwtWhWHZMOfxOwFK5Ww8Ol5a1RvYtOZDk4DtNjJ?=
 =?us-ascii?Q?7l+XCjQuRru4nMNka3a5EMzFANpVG5ZKsGHmyGi5g6q3517kXDk+L3o8PELL?=
 =?us-ascii?Q?GKtecPM=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?qvAt/gsXQ/bCLZlX4tlfO7AQkjSC+aqCkIFyupo1FCX/6O6rRb06wPiRopuq?=
 =?us-ascii?Q?Az7wMWoqgV8L2lMGV5u4opV/h/BlrNZ7i4Rfx6wAKUBGLIiRq6kTsmc+jORw?=
 =?us-ascii?Q?7AJiNUDqE1IoL1E2H/ZKhb/Yc+e93ULH8ibFJr+2W6uDQ1RehX+3KdU1hMvh?=
 =?us-ascii?Q?ZBcL0A3Igh+1rWp8OFLYZchq2ZgmJopBdtPTiKOjci9SVcdLDP5b3casxKj4?=
 =?us-ascii?Q?QFs/gN264YiduwvxIdJ3zCUNuT43xO/QSulTZ07dbG1GmazFMbS7jFGXUInx?=
 =?us-ascii?Q?ZLjgDrZt9ld9bzT2QvlhoYnYAd3kquYYchWdYJdhveiiQXI7f2xlXPNGtxAS?=
 =?us-ascii?Q?bKbZ/j8H7RHLf5ZeyTMq08NHmb13wwl8056A4e5gW/QxVe2gQBxj4uA/RV2A?=
 =?us-ascii?Q?5RVtSPmjBil6fzxoqZmxDdaG+a6Wb5DEUTiGq9cwJoux5OSx8PRFx7VVE9Lt?=
 =?us-ascii?Q?zRedoojdh4rf10mJv6VzYUw8ElEyewUjoh/6XO18PNFu5x3BPVAnNH1b68XR?=
 =?us-ascii?Q?YuoxRhHl6AlQbXz9A53Rn8rTPT9GjJYOdmbRHtXkhJDkaBNUU56fA1E49zE4?=
 =?us-ascii?Q?I2PiqKQPMZqOkMTzVpFGbtiSt6EM5N86TGwuGPrJxEZ+QxKa13W/npyi+0wv?=
 =?us-ascii?Q?e9ytzSBrCOnYZQ8PcApEStPjRupRT0HVIBFY2WkVs/fjRDGRgjwmYmTmk3/A?=
 =?us-ascii?Q?2rv6Ye6tRC58eVY/OVWT61B1KPakaCoMlxIGisqSNeJerJe8OG9tG1/a7Olk?=
 =?us-ascii?Q?tJG9aCb4JPk2LA8cjkXeRipPGF5l8KBbd/XgrshP+C9ueM3yw8+jpd3/ma7E?=
 =?us-ascii?Q?K+aVAu+9KYPjAZVoyI4u3lVl2vywP70KFvAt/jTPWQFJN8HU3tSp1e3XaLYQ?=
 =?us-ascii?Q?2ja9Dg8KRZZ9d6KfA7Wj258ZeTXuPliRsXTVUrW5737fq7vr7UYCd09ja1QR?=
 =?us-ascii?Q?5sIOb4cVgQUkVZFI2C6RzEFg40Kw7QbgIvGgdbcxztWag3mY5uEl/HFfnvEk?=
 =?us-ascii?Q?Lfi++klXgCxDGvIfouWETn/yEFdzOLa664vhC4INjMFp9GJNLciP5LX72jJx?=
 =?us-ascii?Q?FQWDAH1HBp7CDwvMFZZ5V5i5adZqmDByXTabmI3I7rYJuD2+tEb4ihizxXAJ?=
 =?us-ascii?Q?zIMFfnEKqNBX2uVW16QnqvQIeQFSERxq+bLiXDYmOOf/J04A5P9F+zywQAG4?=
 =?us-ascii?Q?xjJ3XCMAEtXCGw0LtXjTE+CdY/n+zOC7hJUe5o8d3hFmttcIsuT9rr7hwtJ1?=
 =?us-ascii?Q?hx8HGZc81Pjn9i7/obdrzlhFLY257k/Gc7sL+VBFicG3fqN/qMrIeY/RwdiY?=
 =?us-ascii?Q?7ZLzC9NqlQrrF86ziiAT/avF3N1cfRLeT6uZsvPTU7SGr0TSY4LovJ+SwABk?=
 =?us-ascii?Q?+GK6C/T3TjIAMK/Mk0IDGRKN/fUCaAGU7kxzxXbzNNCnhJL3TM5dPXeEIW3O?=
 =?us-ascii?Q?/+szZBjCEjKGX0k1A/hdkK6iVgFFMaKh7w1FDCttPVX3xRji1MgCchvTnaMT?=
 =?us-ascii?Q?Iy+N0l266m2KbxcUU9EUW3J+SOwGbi3Yya6I3F73aNlJxhllN0Wg588/heML?=
 =?us-ascii?Q?dp6MuEb9Ry/rWLZKHSBb8tLBgg+82q0HMm9sMZ4hJxg+Hz20ji49ktyS0bDz?=
 =?us-ascii?Q?KO0tLpXN0pCF+jrzgMsfnr8=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ea5f676-a0aa-4a28-75fb-08dcc2873760
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 08:48:39.1412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TvUEzY5S6U8qWZ/UIOECVdHA6pl/VPghtBgiOeaVKcBgl6oVICaOWkNmjVwO+i1dUX5WqTSJnu/lueo9VmvgWcW/kjOUOiLBkpgv5k1T5C+JRWv8ERf3Crm4d6G0h8DS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH7PR01MB8882
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
Cc: Thang Nguyen <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Quan Nguyen <quan@os.amperecomputing.com>, Khanh Pham <khpham@amperecomputing.com>, Chanh Nguyen <chanh@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add device tree bindings and an example for max31790 device.

Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Changes in v4:
 - Add Chanh Nguyen to maintainers list                              [Chanh]
 - Drop incomplete example                                           [Krzysztof, Conor]
 - Drop the cover letter because only a patch existed                [Chanh]
---
 .../bindings/hwmon/maxim,max31790.yaml        | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml b/Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml
new file mode 100644
index 000000000000..b1ff496f87f9
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml
@@ -0,0 +1,70 @@
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
+  - Chanh Nguyen <chanh@os.amperecomputing.com>
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

