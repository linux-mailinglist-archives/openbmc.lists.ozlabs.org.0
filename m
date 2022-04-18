Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CF9504E51
	for <lists+openbmc@lfdr.de>; Mon, 18 Apr 2022 11:20:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KhhHY47K9z2yZv
	for <lists+openbmc@lfdr.de>; Mon, 18 Apr 2022 19:20:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=MH58s8/w;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f403:704b::71f;
 helo=apc01-tyz-obe.outbound.protection.outlook.com;
 envelope-from=potin.lai@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=MH58s8/w; 
 dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2071f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::71f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KhhFT5XHhz2xSN
 for <openbmc@lists.ozlabs.org>; Mon, 18 Apr 2022 19:18:53 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=muolYrzAvtI1bS/6BnZ6f1Ttu7olejrTCIYIiKeNom5vUbR3OYWRA5ECweyeGnvvcxYS1YE08Th7fkMsha4e/mLp0csSJEukfRCHlgQCd/LH8/EeHwzht1/4zWgGNlY1kFfucxALJI2w+3t6dUgkGZl/CUhaCLlmYEJobEmrMjj9NKLfvO5H8iWoVM6CR1m/wO5xLY0JQpHi4iWuD1tYTpwqMGQ87B5qJhPz6xqzfHlVjEuOKFLIYkqsesxwIuHyWEDXP4yquEk415W3rkUjIMuXGDw6kqAOW4werzti9ZaTuXCun2CgofpsdSgZDH9hZCIiQSDb1LOZiQ3CRr9Z4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T2yzwDAW+FYkqNbgXwXlv5jRphtoyYj6poyIdaHulWM=;
 b=kcy9YjfpUOCsXHffkQJTGpw8bFrMy9wMUun4Y4gKIrW1a0Rgj/4SaMYp/l6KKocdTp3FtTFONcSjoPnMtNqmTQH1aRhJ+ADxWJpnNwXlK/HZYrCOBlsUGw96fcU9scTmuQwl5gQk6KTon9dCsOybMEy5XpOXXBdG1JeZqNwjXP0r+Dcam/Q3G5gG9Kt4K32iQGm2XX+ONe5Qws0yz0fkCO/gvOpLAfaRaCxPNXaDHbocyEEX9DrUAd176VhO+79d4uL9seDdLdqDtoV+Luv7mY167DBBu1K7u/jXjxKsUXw6ZLKxn1YuXixqmew8j+eL8FcJk6mnlsl4qrhgV8t0/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T2yzwDAW+FYkqNbgXwXlv5jRphtoyYj6poyIdaHulWM=;
 b=MH58s8/wnNVGskuudnhoqg7u/R/qVs5l2Y2Zyav9JPMNbZizOgP7z7r8OIR3MPXQ3Hsipx8J3s/cQSCYzktoT7+A6vZHfyBAOUo3XH2933HwRIr/A2RWnd3LhwMj42AyRgksoFKiAgpM1NiUdhvhRbdP4qEVVZZiub0//BY5lfk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by PUZPR04MB5229.apcprd04.prod.outlook.com (2603:1096:301:bc::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Mon, 18 Apr
 2022 09:18:26 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::1109:2541:660f:1489]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::1109:2541:660f:1489%6]) with mapi id 15.20.5164.025; Mon, 18 Apr 2022
 09:18:26 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 RESEND 2/2] dt-bindings: hwmon: Add sample
 averaging properties for ADM1275
Date: Mon, 18 Apr 2022 17:17:28 +0800
Message-Id: <20220418091728.23051-3-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220418091728.23051-1-potin.lai@quantatw.com>
References: <20220418091728.23051-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0142.apcprd02.prod.outlook.com
 (2603:1096:202:16::26) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ddce48f4-3919-4c95-6f2d-08da211c6427
X-MS-TrafficTypeDiagnostic: PUZPR04MB5229:EE_
X-Microsoft-Antispam-PRVS: <PUZPR04MB5229F83424208A98850D04E38EF39@PUZPR04MB5229.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wmpjtTL1O29uNpT90HzYLx1RMFHN6HTKkrd01xFKk77ro0+YRUK6HdYrL0nt1m8MjVWqEnNLYg7DAVz64I8Fl9KVCDmaM7cxaTBysfQ1Mh0tu5+mXgAp5OJ41rNoeHiT8BHsrd/XQtAhhq9j2Uc6qgDT+FLfXZf3pQVOKGPFet9G+WnXluUTAZ190SneDUxx1+Tlfkitu0t0Hrjm+eff+qZotxqBbsVS4bg4d0aHSzFRNwY8+eJnTZnvKA+2fdGvqFryPbP8s+Ux21sZA7MsrqSIeH+TKAmNbZGH2HxJ5vu4qjfEyRIV+CSO+Aa2jG8rlBU29vDNAb88TXamMsT/N2RxUc/MO+j67hgwa/6TyDxkkz112+sCiA6YBHdbnPTpk0pmEBMbgFkaeq+OCZWHmX9v7udHEccBAkOsUOe8AI0OhJMyouri7TyIcDClaWrELRK9QrXLNvI2JKuF5ivR8BMVRbJyMO0sO/lTwJ43ED3hPfL0O4fMnWKVNYqFsj54Vdo1iGmHx8qwB8tEGIEsVoWga8cDw3I0yr1RwCt5PbprBftwZ4MSRsNdGxz3Ka8uRW4d+b8xkcPMU8ITXz5BCROWmPBbG7843F49r9GLUrjv0lcO6mFOlU4BiOTjdIiXdknM2H96/QII+iFoZ0RN/GgeU/IFGjN+JPeazX790irs5+mLARYHKbUM54uG6U/EMzSBlrDDkPm/gly8wCz+FXQjv7zB+KBskgjYMdeOMNA/vRe6F1rN0BScybF+4uzoU9QugyWmYE+GxZKUpHPzgo4M5cWXwkZT8+FpH/1YG9w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(66946007)(66556008)(86362001)(966005)(66476007)(6512007)(6506007)(316002)(36756003)(2906002)(38100700002)(38350700002)(8676002)(6486002)(8936002)(44832011)(52116002)(508600001)(186003)(26005)(2616005)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DWIwixJ6ZMElfgPLVHQv6hvKuAxThYs3aPNITw7Fjyk4Qeno0zz0nH/l7vFs?=
 =?us-ascii?Q?EhGrnRlu1sXRXX+0rruzfVMYpOKT3SpESRBfWP6cc1zB/gVX5qGdizirQSSc?=
 =?us-ascii?Q?UU6W7ostZ6Y5lkg1nAv9SnL26NjiBYXDFTsm07xVkfR4F29LpQRMu4mh7nW4?=
 =?us-ascii?Q?AahF+jbxbzQDsfGYbs1ms4+TsPJok16lzbaNZsWdfrUmijO6b6MoGtugUZ4+?=
 =?us-ascii?Q?v9MUhJT7K/QI1SBp6CYKA5SPXab29re1XaziFDN+jDgY/bEjdOp+Q7g+xHWP?=
 =?us-ascii?Q?jHnK6fgb6nx0mxOohKJ/mLVkrcMxBXy/cVRIAcZFL2mWd+s6kfU3x8hThuEk?=
 =?us-ascii?Q?kZZE5Yt4OONtjmf/cTFOm/UYzleoUmGiIlyG5tZiV+Oimqo2+6FlqZMKpFXJ?=
 =?us-ascii?Q?hiNbRucI4eL3KNM7C4KMVEHdHrMPiUgRSwmvNjJrtXSxEqXwhf3rmboLUTNW?=
 =?us-ascii?Q?h7IQU1v8DEoMsjniPJd6d2LH0F/oXeXzmSmFcbhHRalVvG0pA4kDLJVVdsUS?=
 =?us-ascii?Q?0c/5E46Mzbb7QDbOfjl46cmsSMcPNQ6B44Sufege1mtzsTYM1lPdKFHxjY2s?=
 =?us-ascii?Q?PPqEo1aVbHAuirsjHjjROR6VqDomK4bxResHlO8/VKZ1rJoT5Lgk9A39t3es?=
 =?us-ascii?Q?0rXCk+cYaA6fWHuzu+OfHb3ypVD6hQdPvyQNn4wSqNV1vrOGnT9qgoQOpQvt?=
 =?us-ascii?Q?uhEgBaq52fMQaiUB5Hit9ZOgaye7mzM197nPD7zZ8uBEwud9XKubnvdNKCpo?=
 =?us-ascii?Q?rUYy0uHCiSrjWqhdj5mptRm6EM/jewWRegLDbZhXiC+8XsrHn7Jmc4KG3SsV?=
 =?us-ascii?Q?kXTZajl0V+CuJpNcIkyuZ2JxlzxGwrALdlAZE0RCDSjbMcLbQvHictTyqu0I?=
 =?us-ascii?Q?jLc5kNR62Cety0ULz7RK7Mi1VoOytWqTGS7IIqmrJuBACZeabb7PzAiod4kG?=
 =?us-ascii?Q?D4SpHfwoeIrRh0aDp99/SF5y9+zagUHIrMZjs6LOpdY1pDZmJXp/6tTbkqQ8?=
 =?us-ascii?Q?uEfyD3/kR1cFWfjL94Zy9xHSbnbFvZAeqXktH7fcE0z+GA8t2NkSWgpT9atQ?=
 =?us-ascii?Q?b5ZjS14R+Iwg5Z64ZH6lHoOUg0oiIFaecbH3YlKlR9tMiWI8rO1fqk6egwOn?=
 =?us-ascii?Q?r1hEwV9x8QO9XvnBNK+OPtzyUMiH88FvPv9g2IW/CCytwvtPbi4DImr/3LOW?=
 =?us-ascii?Q?cEdtab1Zrr2+M4rTFdYbUs++Gm5hJC0PidqJb1k+GEPTNh16qwY8vypUmCKS?=
 =?us-ascii?Q?IHYDjW1N0iPM51+/qU26zL5NHZickMZo/tvi41v5y3B2qqwdiJdsUU50O6QV?=
 =?us-ascii?Q?nUYDK8n+8YIiYLBwp7x6dLr3vy9tBfZk5FNOtF95Dh1gdsjOD6nOdRdj3S8f?=
 =?us-ascii?Q?8PZoafD/T2xv9Ey+zs39S79M7XiN7eiF09x3EZSzxXczxRxgJ26GciORB7vJ?=
 =?us-ascii?Q?thrW//b3fC82leFM1BTUf2hpemKEiugf2P7jnbxiY8Syq7YetmLgkzcF7dZj?=
 =?us-ascii?Q?1Xkd5FWekdkv4xscT+KBbLs37y+mcPaPna127+AawJbSXXnC8i/sRgVOzSQe?=
 =?us-ascii?Q?aH96lWUU89WKrXNqQQg8/qwpfWKU7ep2tr11SPYWM/zMETWUjAQdq/e2JUS5?=
 =?us-ascii?Q?jlClY86hJ3sz3qir41qHjRrc7mt4bZV8lxKcc50j/BqfHMKQOZWDf6CgeOwe?=
 =?us-ascii?Q?IcScQYjKochy0eDUjE73hZauZ4oWuvqhL0pRHOcvOfRecfwJlIjAbbHQxA12?=
 =?us-ascii?Q?Zgqq+hJbJYemXaUNgMElgyFhYKglDd0=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddce48f4-3919-4c95-6f2d-08da211c6427
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2022 09:18:25.1015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9LFN4E8hHB2ds9azdzpz+/5xmv/bjAFxKyMwk+6CAuBpccha7yQ1KMPcIxxT1NT14lji1YVoN0yUPBcba3pIMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR04MB5229
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add documentation of new properties for sample averaging in PMON_CONFIG
register.

New properties:
- adi,volt-curr-sample-average
- adi,power-sample-average

Signed-off-by: Potin Lai <potin.lai@quantatw.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/r/20220302123817.27025-3-potin.lai@quantatw.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 .../bindings/hwmon/adi,adm1275.yaml           | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml b/Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml
index 223393d7cafd..ab87f51c5aef 100644
--- a/Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml
+++ b/Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml
@@ -37,6 +37,72 @@ properties:
     description:
       Shunt resistor value in micro-Ohm.
 
+  adi,volt-curr-sample-average:
+    description: |
+      Number of samples to be used to report voltage and current values.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2, 4, 8, 16, 32, 64, 128]
+
+  adi,power-sample-average:
+    description: |
+      Number of samples to be used to report power values.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2, 4, 8, 16, 32, 64, 128]
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - adi,adm1075
+              - adi,adm1276
+    then:
+      properties:
+        adi,volt-curr-sample-average:
+          default: 128
+        adi,power-sample-average: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - adi,adm1275
+    then:
+      properties:
+        adi,volt-curr-sample-average:
+          default: 16
+        adi,power-sample-average: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - adi,adm1272
+    then:
+      properties:
+        adi,volt-curr-sample-average:
+          default: 128
+        adi,power-sample-average:
+          default: 128
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - adi,adm1278
+              - adi,adm1293
+              - adi,adm1294
+    then:
+      properties:
+        adi,volt-curr-sample-average:
+          default: 128
+        adi,power-sample-average:
+          default: 1
+
 required:
   - compatible
   - reg
@@ -53,5 +119,7 @@ examples:
             compatible = "adi,adm1272";
             reg = <0x10>;
             shunt-resistor-micro-ohms = <500>;
+            adi,volt-curr-sample-average = <128>;
+            adi,power-sample-average = <128>;
         };
     };
-- 
2.17.1

