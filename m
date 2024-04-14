Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 864478A404E
	for <lists+openbmc@lfdr.de>; Sun, 14 Apr 2024 06:25:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=rz4e5PeW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VHHJs1xqdz3vYl
	for <lists+openbmc@lfdr.de>; Sun, 14 Apr 2024 14:25:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=rz4e5PeW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:240a::701; helo=nam04-mw2-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:240a::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VHHHM2qC4z2ydQ
	for <openbmc@lists.ozlabs.org>; Sun, 14 Apr 2024 14:23:43 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HkR5B0msXjTsxhRh3u+HBvjZHNL6K1hYzZbUKyfx8sSrGLUA49sCWTpeCVjXmWsKGQkTyS9dIwuBYGxzo2xcicd0SDKh9/MAc5Mo1oES2DRy0XhNmywR7d2xGG7orL5SDYYE3Zp81lewSKkwRvejqmUrUbURRzmj6GX8dPdlYIL6HdzCbdebckLyxZnjRWhPQnBKMDyODxaEjjiSRHRQdn4L1F6miCUUW3D31hlBDgi7wOEmCETB8fw2FENSFozHlNrW+IELtV5B+cOtFJKNL/mZDLuf4hm7NH7CIJyP4Q8Gr4zCc730Yx13euUHRtukIAMOWtVFCpwWm9PEV2ZWJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RJEdQMSBX8lg3gRmciFYX61DmTuf97lbyhiSNxCFbXU=;
 b=Iga8D1aYijjI/rd6qt1ikNp7LtyymBc8pDSJ+8vElHFUEVpUarxqjlq3UlxFvQ7LMzyzzFcGestFBC7s8NZdTdTUckfJvBSc7G73nqcrNQWjDQLKKjtFOckOljW7oNqjMispNiXiNIxK+IUIQe4EO+ENFOZozyu+6j0DqODfy2nWaM/XL+Vj8wA9Gohinx/Chy0sCCyCExFMqEnW+h43hsL9NS8dHzeuu+PvAZ+IBrtYA4jBl1eoxpAr4naTL88V8fYQ6hGweMk4OTWOVEzXt7nSM0Q47Kmx2vBaxQVtf5FlyrGx6RSad6FTqU3JWLOGnugDKi8DLBH/cCr+VArsSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RJEdQMSBX8lg3gRmciFYX61DmTuf97lbyhiSNxCFbXU=;
 b=rz4e5PeWQhZaQtwk7Oz9voA//Ilddus1I6FTn5mj96dgb9TnEEWNFff8R7EyQOwHKTcNaEUvn1QjGs/9Gk0VBjVA7KHAxQ6Kb430bQREdxMOES1zt8EuKyQpHFJ4Ul59KZXR8+tVKwNNiwvzqLs92iHxZO0O7k96WTFFBFw0iLk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from DM6PR01MB5947.prod.exchangelabs.com (2603:10b6:5:1dd::12) by
 PH0PR01MB6715.prod.exchangelabs.com (2603:10b6:510:97::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.50; Sun, 14 Apr 2024 04:23:22 +0000
Received: from DM6PR01MB5947.prod.exchangelabs.com
 ([fe80::b557:13cd:8a29:ae08]) by DM6PR01MB5947.prod.exchangelabs.com
 ([fe80::b557:13cd:8a29:ae08%4]) with mapi id 15.20.7452.046; Sun, 14 Apr 2024
 04:23:22 +0000
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
Subject: [PATCH v2 1/3] dt-bindings: hwmon: Add maxim max31790 bindings
Date: Sun, 14 Apr 2024 11:22:44 +0700
Message-Id: <20240414042246.8681-2-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240414042246.8681-1-chanh@os.amperecomputing.com>
References: <20240414042246.8681-1-chanh@os.amperecomputing.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0216.apcprd06.prod.outlook.com
 (2603:1096:4:68::24) To DM6PR01MB5947.prod.exchangelabs.com
 (2603:10b6:5:1dd::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR01MB5947:EE_|PH0PR01MB6715:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e44b872-98b6-48ec-0221-08dc5c3a9e80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?6Vql/QokWNG+mc8ohfqk09zjB34YAFmcz5UkIst2Q48T5Wh8y/WWd79WCdzZ?=
 =?us-ascii?Q?EYdrbllTe5B5211ip93wTA9qIKSigXDgArPt4oU3lu0Lu+zKsZVffWYCwkcz?=
 =?us-ascii?Q?UazDsoI6T0OFgnrhhtAZl/qGW+AVZrriiJeJXCjyRpBhGQ4SJdizX9noIgDi?=
 =?us-ascii?Q?iCg3+sMZBEQgL/nPLC6hrNXINXg/4RI44RLiHwatDzCSkZ4TKo3KYVsUTP8u?=
 =?us-ascii?Q?svOhIS7TNum83Lf1St+F3WAJbasRE7GQBTGpodqAG+iVZsnb0W9cjw+Cl9D6?=
 =?us-ascii?Q?gY5lFfliCPBsexXK8ytLtYyjW5zFuEQUzNb1TrveYb6az/0SHhTFABSHVR8a?=
 =?us-ascii?Q?bJn9MMbhsGq2/NXIg1Vnts9okm8twCIMTxnWi2tJcVzcuUe/dmXpBRQ8qFfb?=
 =?us-ascii?Q?/N+9J14/pPC5k87J8VEkkQgk7gK4dil0O+MsOS7wVIg8YYEUnPsEWcOkkc+V?=
 =?us-ascii?Q?DFE1MAgeiArtMiY+S66Eya+MRr3HNahWkqtmJ9JbNP2mGK3NhzZwIjAHVgY3?=
 =?us-ascii?Q?TmTFvP3v2bH+h8SnGGL2AHjG2BMtsZ58sTpNVvLL6TkYWJ3AAISQn8jlAOIF?=
 =?us-ascii?Q?cIB9lwkccxljNk4zSfvjhMboG+pQAVZm7KbCWwjEqzUyvGZbRZKScIS+/feE?=
 =?us-ascii?Q?hIrDyHFNkc5xManDqAP9QHn4DwKL/xvo9k7D969+byymeO6RaRuLOjohzWqp?=
 =?us-ascii?Q?WrZQY1RlA1Hz1xpq9e41etWXT8pH5+wDN19rBQTLWOL4jpIqiiUWFGnBB5Cq?=
 =?us-ascii?Q?1xRgZZkUYmde6tBteDeKtMnzc4UqK8FMn55NUkpqndllp9fXcIKhanfiNpBK?=
 =?us-ascii?Q?7tS98iAQ4keGVJjV5EjWHdYXWsnw6gYmy9+KClZx53Vx5nhDNcDpuRfBqPwl?=
 =?us-ascii?Q?vLUKAsw/2xQjoxqkYbsrtCSU7Xuqp8SVLnJXO6xPc50q16pUKldhn2P0hm1R?=
 =?us-ascii?Q?JckV+vwjyRNNnf3gzXFWI7xW4MZDOgiJWRR2OytVskEiN/hZo3ItGQUYsFEF?=
 =?us-ascii?Q?Bhb2uZf6RPDT7sLQ3Zd3KM9YQJB0Zf9gQy4jblGr/fsK5elg1TszXGuVN8Ax?=
 =?us-ascii?Q?cqmn6dnumxnj8dkQu+YbEETgCFfgmTXYJAAWt+GEqxB5WKRRHGA3W5vHkVDc?=
 =?us-ascii?Q?XvFJLZQWUctcTe97tAPGU46P5rfAd2dP9b6ayHukwck1owJXxnv/xGTOe8Bh?=
 =?us-ascii?Q?Qml+Z+wENpr/9uX4YB6W7uqj228getfTKdSoEAmiEvgepwK0bWM72YJsvWRZ?=
 =?us-ascii?Q?Hz9vks/9460ip7+1/KJGrgJQIg1IEBhszvasfM8lIPHxMuiUBrB9+amJaqLj?=
 =?us-ascii?Q?GNw=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR01MB5947.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(52116005)(7416005)(376005)(366007)(921011)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?SXZUV0VGy3ZurPskgOl2q7xhKmBi0TO3rOUDCbh2G6WtNSozik4rziwZCP37?=
 =?us-ascii?Q?PYn9Cp4i2KXJcX5zvHZxzpxDvcYJ13tm7i2Obo4U8XHw8KJW/QGGAeqWw8sM?=
 =?us-ascii?Q?jrCWqRHizwRwhnlrMU4fyvLlJAcrWYlj8tgjKBM8Py0cmevX4dFoYbLqy1bN?=
 =?us-ascii?Q?loKOtb5J44dtEgl9LZmov3ZCD7iVr6x76B8mypxOPPkbXJ5rMczzHKK48Mej?=
 =?us-ascii?Q?gG/PNDM8BI2VoZoBKO8bv3n5h1Wvc3sUJWNdMjQi/dYJoy7iZ3ILmFskScrF?=
 =?us-ascii?Q?NvSoG/zGEUGJls2MUT77plz+v7biy+dpnH9Sx7wt28+4SWgklxb0XOrFwxAv?=
 =?us-ascii?Q?8UUO0FSRzSxHsqXeZG/HHMy++WPMWz7kZIJMR1iihkSvkmE/qZayMDFYEv0B?=
 =?us-ascii?Q?FFhy6ludAExwCVOJ07IycDwhUwNfq9i8rLmBuODm004gbDtoJ+gM7ZSMZIqX?=
 =?us-ascii?Q?is5wpueFlthS0QqoCsTBzCayt2JS4R7SQwNVpNr6/d1CGjfJ9t/XFZhsR5Lk?=
 =?us-ascii?Q?UfvoHFdmZ7ahnioQ5OvYVwLGy08ayMg7kyYMjmHP650tEe5jxAWD8tgpWK4y?=
 =?us-ascii?Q?m2ZD3ZNWLUB4kBANAhL0renzFYaJMFQpM7rtH62G9HJ6ky87aDVawN8JHwW8?=
 =?us-ascii?Q?w6XM93/TSOY4V+l/LbYqn4BvDceJqgbzjX+cJJ7/Jpsbp9h325SEh6wgiGHJ?=
 =?us-ascii?Q?1O6dKkmLORp6fHkE88zSUyFnsCPozcXiNTs/z94Xf8u2d9mAEj+1PpmWKrGJ?=
 =?us-ascii?Q?2/X97+9ShjiEjcoqrN0VlTYKpivA5L65q8wEYurVIGa6GEItlkyFriKCDKsX?=
 =?us-ascii?Q?+2fJR9CZeYv3kReEL3Lpq0qS+bKeE4tGJqxAVJ7w0qVqF4EsXSv22kGfdlxM?=
 =?us-ascii?Q?3TWCu7IwkPJT9Pf+imVLlzEZf5lHTrQ1J10dfl7uIyTWbxnhlK1uxxj9LQ0x?=
 =?us-ascii?Q?ZBo7i6HVkk3Ioq6KnPxJnNYREszPIwrkp1EI1lyMCeWBr8ibkI9UDnom25z9?=
 =?us-ascii?Q?8igCJwVbmJ+Kq4glKYAfh4yF5OakfoWd/RSYHhNF0ttGDPM6X8N3zxyOOYpj?=
 =?us-ascii?Q?QFRGBc5s6/I+I5+YX7b+h2WvC8Op7rxiHWGK/ILIXq/fwbQYKjVcYEJdV/hr?=
 =?us-ascii?Q?3KupIoWLzUBUafFUFnx0SjFkUQU9L4jfDAzaXDOlPp0acGDlEBfqJ6cSE+Yl?=
 =?us-ascii?Q?AVX7ca7Q0D5Lf7V1jMj5UyVH6bJiED5dTONjc+TezwPxTdMYiW+pfQNYD1Yn?=
 =?us-ascii?Q?VFyo7iWJ+OyE2EgDXbkssb5aI5ZXC/UYEdK5gtYZRtCPCggdc+nUyLLLkKCa?=
 =?us-ascii?Q?iRZDWGe1h4/sI9hgNrPpZeu9oOY88mfvqBxQz5PaQA+JtlAFD6kT/roQBiJx?=
 =?us-ascii?Q?q//F+ycKe25e/RPUXZvJWrTFnweGRlejtqJ4UdrqqMSk5JnTU4sRdiVUt/nA?=
 =?us-ascii?Q?TBV4FzaluB6B3Fu75S0OKv503MXB6FfRh65MdYJHK3g+2X6bipbUrTNnLSVj?=
 =?us-ascii?Q?CI0nsqnTpnlZYyRrY68QX0ddkVzqD4aNzLD7SzSEmKzWTHqV3VfbuPHjc9KD?=
 =?us-ascii?Q?cQoL8PsU1Z9ekAVMpj5wcm4w37rw781gw/e5ni5Utgz7p5RBPMaeyEhW6Pns?=
 =?us-ascii?Q?gPlMkK3G4BD1nCUNvQvRbyE=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e44b872-98b6-48ec-0221-08dc5c3a9e80
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5947.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2024 04:23:22.0543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NKDmzGif/iGllOQlmXvW0Uc+nYdnQ85ATzZZHOOYutgtUL8ioMcJCYp3rDNWwD0hfcteI8cFw9tuQSBM8zEutk/ReYrmQt52epdQWLxUyiO1X4fiPx5IUx9Bzay/zLua
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR01MB6715
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

Add a device tree bindings for max31790 device.

Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
---
Changes in v2:
 - Update filename of the maxim,max31790.yaml                            [Krzysztof]
 - Add the common fan schema to $ref                                     [Krzysztof]
 - Update the node name to "fan-controller" in maxim,max31790.yaml       [Krzysztof]
 - Drop "driver" in commit title                                         [Krzysztof]
---
 .../bindings/hwmon/maxim,max31790.yaml        | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml b/Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml
new file mode 100644
index 000000000000..a561e5a3e9e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml
@@ -0,0 +1,52 @@
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
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: fan-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      fan-controller@20 {
+        compatible = "maxim,max31790";
+        reg = <0x20>;
+      };
+    };
-- 
2.17.1

