Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A12394CB68F
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 06:46:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8KjS51dCz30Lp
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 16:46:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=vt2v9ztm;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f400:febc::713;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=potin.lai@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=vt2v9ztm; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-hk2apc01on0713.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febc::713])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8KgQ1lBJz2yQH
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2022 16:44:33 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=alPeRMkiI6n3ELTKQ6ye65yo1JVZWxIQoqxX0ry/Gti8//qE97FvCPrq7ni2Sh/dlALgVa4jAqSLZzTmtLNQMvGFmWkHsUpl8YtFk3Rqxd7WIpcoxOTg3Awsh/7B7Xni+wyX05ljxNY9Ce26X9M58wEGOkUgfYzOycoM7tvv59RaPeqtzJMIuGNbQuNSSlxG2UmnsSiOXSd7Ee014nUSa3yC5E2KS2EVYYT4L2+EVhFIZ6aHW2JtOBslZNTITcY3C8pDOBjt4KKpTXf5MYJmqgXz8xqo9aErzXRaexPc5c2PAyUgpxlSF50GiginYcvjXqeFQsbIP+qcTHw8qfS5cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T2yzwDAW+FYkqNbgXwXlv5jRphtoyYj6poyIdaHulWM=;
 b=bDl9wbCqdDQOK0/iWUvessounTiVG62sr/KvXvrU/+gNa4/LGUfzwOBDzFa5T7q7twoV8voeZmk39exHEXBHwDyMV1TuIB9Txto0kujdzDM4iIbJs1rNPEnPjdORXz5NMSMvyaQvR4NIKh6JRZIb3QcdelTD0IpKV7264cBUzw39rPHqEasUK2wIqbeefosfeRpkNU+odCCjlC/tOdTOAWRMBhUxdSVlSjS/L+ormOsbjr+omnitqD61Hir/3L2mNq/PBM06mWoozzePeyF1Uc4HHJ6XBODOnq4MITN7ve55thVeTACvMx1AffkCqjF1INv+3jqUCRfviKAwFFuzLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T2yzwDAW+FYkqNbgXwXlv5jRphtoyYj6poyIdaHulWM=;
 b=vt2v9ztmSGq0Zo/QoBD+8PisS9FbQ3V6R6nDmZObElLeolZ2wjP/9EjNcr/RhjI95dIzBY+UbBQ+9r25c8sqOvALEl1MzJg4hk6WdAGyEJOW0aqn58UYksbmc9SAJuMIg8FHqlQiqSAFfdkQH4nqrRsCVUGsW7tNrGjJTe9NO2c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by SI2PR04MB4505.apcprd04.prod.outlook.com (2603:1096:4:120::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 05:44:10 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::b57e:962a:3820:eab]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::b57e:962a:3820:eab%3]) with mapi id 15.20.5017.027; Thu, 3 Mar 2022
 05:44:10 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 2/2] dt-bindings: hwmon: Add sample averaging
 properties for ADM1275
Date: Thu,  3 Mar 2022 13:43:56 +0800
Message-Id: <20220303054356.14369-3-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220303054356.14369-1-potin.lai@quantatw.com>
References: <20220303054356.14369-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0147.apcprd02.prod.outlook.com
 (2603:1096:202:16::31) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c16110a9-8dd3-4466-c402-08d9fcd8d6fa
X-MS-TrafficTypeDiagnostic: SI2PR04MB4505:EE_
X-Microsoft-Antispam-PRVS: <SI2PR04MB45058BE3740E5D6A14884D2D8E049@SI2PR04MB4505.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8CaBRVn3c85H8BGexa3n3c0DKIo6RdsEDNAIN/BlXD0ERibQoEyH346Bntb6St5oAQKK9bq7caGjWWej5tYUV7SUaebZOo0pobT2MzJ9nbg1Egn8+qu7+dudPPrjFsV3mY4eLzWpUW5cWDXBPUxgv756Ow+TzyBWQZ9IpJyA3sCkR8VKv50dJSQvhvv4IreQWoMwywxQXqaooSeUI9UP0ZGsyRYkTCxC5QHQ8FCnhdvaIw5Dtsb9GBh4kvx8Tq8iEpRNgnzaH2TJhPdpIDRnPi7+vj70GpLOLGDE8JUuviXrcGAwQVNB1/2jWtuYAOvhwX2vRbjCdr4jgn7fOoibYzeZbzp2UPxK3BAXa2foENdY1qAp3/cf228rGFZpNS+8XVR4Tyryc7s+hEPmfLfo813gmVIh/ZEJtAEHaAqH8vMTeQqiYbVm67P0BhNaGtUsA4Fmixcjv2RUC5T+nS+VTh/vZ2uZTxWQtPcgOrvL7qPuYKDu9WoQTwmSBnV+XdnEvoF1/jzPAMhclo0oFdtx/GsnKY0dqNSpGsOcmvGeQdsmqHHPy5RMKcGrVMQ19QoW0Rci+JpkE5VMrIQCTtvDTnUKcwVk5nd1iF0xxhvow33bSx6iQ5bwyz9MxTvMKrmlccuY4RsWGAks6M/onyG/mvqKgzgzXQgpSq5aOtF+Ay32s0a2d0/QKsBS+W+JfVThGIxie5c5HlRFV1PVD3ysBtLTN2cfOTLYEN6nzFFpcmVjK7zdkCdTiL7CoVNHwRXTzXvS2c9zm6iJs15xfPn/LzKzfTJypR6E/bsFEDuZW2c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(316002)(6486002)(6506007)(1076003)(6666004)(966005)(6512007)(508600001)(52116002)(2616005)(44832011)(8936002)(5660300002)(2906002)(66556008)(66946007)(66476007)(26005)(38100700002)(38350700002)(186003)(36756003)(8676002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mZ+4dheryPIbExQSGenLuNCxT4Svg8qpcGTa7hkNYj/iil1O1ufsEthUUO7T?=
 =?us-ascii?Q?cZGQKP3dsnJuTiyYKuTi8GQgljp7jQW3Z53LbdD9jSWGCvP513tXPI57s3su?=
 =?us-ascii?Q?3GASYpjAhhXnqF4msge3pJG3afIpoRwYh2ePgSXe2WszYMtjKfNZMEtptIwI?=
 =?us-ascii?Q?qS/AuwXD3BTQ/JJi4/ckXV0v1+b56MKpKNhUQpMQzCPuLhhAXrP8Ix5VhOy5?=
 =?us-ascii?Q?W+KE6Dak8oTMoLDzTqgSywU8se/41FF1ZMoliS+d0eL63lzmdv6GGW/6/esH?=
 =?us-ascii?Q?SDIVmviYZkpeGVoaQX2WXGYm36pH5IGiJfxOvCoDBTosREt8FKJN7yose72L?=
 =?us-ascii?Q?RvCRYOX/CkEszQfT4vTVWDXIHxddT3KjrwtLM6aySknpOYK+Vx4cpVhHbL56?=
 =?us-ascii?Q?RDol6+vMiujo/XeNuVJJ0uhtAylA727Uqs8om0mumYe4/94ql+KO2JgDTvGE?=
 =?us-ascii?Q?TnkAEIhHoKgujTF/tSubOM+l41lH0+Btlo5czPdww3gG/TTIeOOfPgZHwLoA?=
 =?us-ascii?Q?DRirmifarK8zCwS4NL4/Aczcn8zSJT4eDQzHEvyms5IA6Briolm499Dk5ugG?=
 =?us-ascii?Q?TxTJ+Rd56yh+lr9tDzRbRIMLjiOcBSFEPO4pxwkF0w2mLfLY2JkZmXXDhsw3?=
 =?us-ascii?Q?0LWAxDkOaExlPNlBih6vU/tjzI3BNT/92gtM80qGRdghJZdU4FiN2M6ePL6n?=
 =?us-ascii?Q?GVKVF38bUZR6pQa75PpYhUmmeRSo1PGm47uES7wB8pUV2+0ARmw0J6PHV9Yh?=
 =?us-ascii?Q?VRBCMfLtDkrmyrksPJtd1o4Z+LNX2E+MW0yP2EzWHo8Q4aOGqsLiZSShNZRt?=
 =?us-ascii?Q?wKAn4dt+bVWye4+ec8cA+ikr02FrDHqnHJD7wPpjupnAUaScArn9hOXlDJNV?=
 =?us-ascii?Q?fJ6UJEtt8fWLpCxPVV7UHfcpk2HgXB+/CRjwkQRcQmJ4kurwkiCcGCqESASj?=
 =?us-ascii?Q?cXUiEoipILMnxDArkhLLMUmdDIlai/sLxDyj+ne7jxQULORdIxHWOcHsCLja?=
 =?us-ascii?Q?EkLpF0fMQMNtPhD/mpmY39HbRSwfqyd2WOch6p4qEQNUhg2zb/BXigxqJySw?=
 =?us-ascii?Q?vaJb2kTtlgpMkYOQ0v7pPChcoRx4Wt+NgR4ZkMrHH/Log8lphdpYE399PxFi?=
 =?us-ascii?Q?P9ZiOD9swGT0cEEaJHG26f8y/RN0hDl6kbGqbM1n2GGq6Bs3fPlYYVMUDMTy?=
 =?us-ascii?Q?viIn8nhvNOi99Vie+na8vdWvTPlsQaYcP7HDrnHerPOPXWpQU0YYO+/1CVGM?=
 =?us-ascii?Q?/0CLuLWdF7i0Pxvlp67klCIMnXKx3Ph2UOpU1glwZS5WXyBP4Ett/LgZaacJ?=
 =?us-ascii?Q?vdq65J1nBjvolPXrp1CPBiefKpS639VbdC/u5s3osBk7mfvD8C/VyG9YonMe?=
 =?us-ascii?Q?gfwYIU2WFu37exCRlFXzGRQSP+7xU6yZa2Ij0Rs1CypLFw57CU4kfDloUUaE?=
 =?us-ascii?Q?R1INRCH9WviL1m1j0KptgtslDWBpHoDLIeuYjIG/Ldr4qHJ6vCjKrmQzA5WH?=
 =?us-ascii?Q?OI3VnsuDnHzags9ilOXa+P9DhrLon93k9S0JbiP/6KVFSlmK3S1D/RconZWf?=
 =?us-ascii?Q?JphjVIcZpsYpDqgPw74Z/azuebYupqA7y3dolyxPPUgIjEk7ByVGUVxUIomD?=
 =?us-ascii?Q?1TIy4W28zH4Yr+WAmdkEynY=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c16110a9-8dd3-4466-c402-08d9fcd8d6fa
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 05:44:10.0935 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /wH7bNt6X2bxz4365puXJGAYxKJEvqqFtrfR4NgA/n/zRDOvaL+v+iXyXtjtOkqptXXp6QPS9K2D9CcdbmjpKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR04MB4505
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

