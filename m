Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D13A250AEBE
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 06:10:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kl1D65yXzz3bbT
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 14:10:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=jjxjFCRL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e88::712;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=jjxjFCRL; 
 dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20712.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::712])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kl19y4mv7z2yHp;
 Fri, 22 Apr 2022 14:08:54 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cGHD3NItZTSHNcWqp/Norog4er9Ed5zo08CjJXoG88hSOsopbAz+z5WPC7E+WeXy1z0vIZT0ZxuF/mUymUqVxk3mSUqomUXuOLyZNZTmsVu1jycVi7qq8lkGZRyC/JyVcryedMQy5SLJx5a/Vj74SL8UDD7/xYqgjrQjChNPeeXP+4WD9f4VfdLOlUMkeP6W5lOOQgKOpgsngA7fiaD2nCimnqW8nEOlVgzZWa1Lbs7UgqDL7//kzVrMz0X2Z92MCcaTXh91Rc/TpwfrzBw1UU5qnufa/XraRrQAHeMW4SVP8Jy8SNCPKh/g4FTqbO+r075KNy37kNc2+e9N9d8x0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wZW1q4Dcxn8npvUt/9Ze2HVkNMUoQtQOmGY+GU0mKwk=;
 b=P7gJKkz2QjBuEOMcwp+4BXJCd56MY5LWyvBl8IpQe86QbSWa3HoKWGOSS31HChCS+6Xcp+gcVGOwjQC7zHtMOmrQ3GY6o9E3YhiwyhJ47Mqmv1QSRJc9G3vRzHNf0SSPPUF7d3MYUYUsQpGzvZD7TrdB58wmo0iYaRYSE8cWC6+xXtwXNMhkDi1MUFtblv59gGRPGOY9EOJByIhyVRG7mw8KEhnwi3ZnskSMLJmYa764/e7FsbaH6YlYPtrlVgqzE7SZIx+PMYuarz1jcnmX8xslB5VyBIvgycgj3O6rtY3hmGaSh4hsTCe27XsufJychM4PqSO6B5EyLbIVo2WO2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZW1q4Dcxn8npvUt/9Ze2HVkNMUoQtQOmGY+GU0mKwk=;
 b=jjxjFCRLsc3dsJ2XwmfQ3SyDlRYisVT8U40cpUnupHY3RBY8Deo+8j3ASgveCi7fY86s+ATsTyfMnMqq+RilKLC6gQI3JnKj2lLDuQeT7O5AoqqDW59biWB8/J3NJCQ8w6uZ3wLhRBMGRS8QjS/QcoXWHzzgv/Q4FNhxsDcTUR8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BL0PR0102MB3587.prod.exchangelabs.com (2603:10b6:207:38::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.25; Fri, 22 Apr 2022 04:08:35 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::319b:4612:e6f4:f22c]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::319b:4612:e6f4:f22c%3]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 04:08:35 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Wolfram Sang <wsa@kernel.org>, openipmi-developer@lists.sourceforge.net,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: [PATCH v7 2/3] bindings: ipmi: Add binding for SSIF BMC driver
Date: Fri, 22 Apr 2022 11:08:02 +0700
Message-Id: <20220422040803.2524940-3-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422040803.2524940-1-quan@os.amperecomputing.com>
References: <20220422040803.2524940-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0005.apcprd04.prod.outlook.com
 (2603:1096:4:197::16) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6ad2c52-dfed-4a14-b4d4-08da2415c502
X-MS-TrafficTypeDiagnostic: BL0PR0102MB3587:EE_
X-Microsoft-Antispam-PRVS: <BL0PR0102MB35879F63757648FFFF12E095F2F79@BL0PR0102MB3587.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ANFBNVuxUwYeCbXd70v3HHibjKu6DkJx9N34nB480rwcMzGnvIKwpeLcFz9O9SOuNTEm7Ctezo8PRrhWi/R9eZ6vuLC9kBoqcjEFzK6okabgYSVLiajNZ7PGLafMO5dCOPgSv7s23eZK+rvbXhFt2eOuib6bRgXLkEzvCsTFKcxT7Q042/EmTf12RlaynRv45NXPxktFpA0Kjfl+zXaKjwxhSqmIOftzIyYMkHiAwl6GOgIO4oLRzF4ZmxSQsRTypqIP/22WrtbBRM+AhpNivPYayWRIkZdIezCoEYOlZyNvBM1UdX3wRN9eDiysRmf2bqVvesCTbFvLLKmnRztTP9hz2wj4UL1igBuTxxHqYrfjqKv7WZsz1S6Dtd/MsCTjn/8Zgj+dntuz5WWApmp3aZIH2+VuJHP+nRSbwN8F/DiOK9G1By9eYQBuAM0DjZbTxlQrzOkD6fbri/5Dc1ntf0uPx9abLgQm9CAD9Ne5ns4zEhXjYbAkoi27dC2X8HmtXax8f5JrYeOh2ZuuL/sU+M1TQ+rNMN0m0iOFDoBvpe63OzlnbV5pMy65rT9+OECikpUv9qnxM7Iy3QwwGYuiXRCJTp9r358FM3LdD1LDLdX/QwPWFYbjWsNV5m8EVesT6bvG/SRg2si+mRc5Y0P5QpHcX87Jlyfp9q/mjkKvgKwx2UA0VkK7852uKj4yfF88X5WPfNNos5lM/wevYTqVzgcdcx5zb8KQv6yEOEBPITv3gRb/xG/9U8QRQML3ycR8yeJTeeEZgHSYYN1Fm6uno+zVzGPHcZdWPWsc70vCrwJTPUGUnmPwJAqoMSCakKTXeyEOKfufq2X9Kuau/iCGkg6My8FCP2wtSnqXtUaovBk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(186003)(4326008)(921005)(38100700002)(54906003)(66946007)(7416002)(86362001)(110136005)(8676002)(6486002)(38350700002)(8936002)(966005)(83380400001)(52116002)(2906002)(66476007)(66556008)(5660300002)(508600001)(1076003)(6512007)(6506007)(2616005)(26005)(6666004)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lyRFAfbNQUfQ2f+OTn4iCGNDkAKiEQUvknmePvjOOdcNiI/nZDIyOte1Qo4U?=
 =?us-ascii?Q?uW4v3LdpRrtCV21cIU0Ipm5BrhfvjgMCork1ORhVyKRDJxJU5Ibx4sbTmmnB?=
 =?us-ascii?Q?qbUsL3lEtAMZuWuBYxAD4/KJBObtf0Nf4soOUwqD+lIa9uR+Bm4Y0EpEOlKy?=
 =?us-ascii?Q?ePNtr/pPfUIwbH5LApsJp8IkZk4MPfslPcA5BIu3dHzgcBYPksv7SI250FoT?=
 =?us-ascii?Q?qmkHP9ZLMR0OiZIMaDLq6vq93o11iLk29ISI8iMcMnXmpgP2Hujeybj9Hxs/?=
 =?us-ascii?Q?NEN+JlnkyIxgdoSLRnAdt2lR4DeXGJQUXNl3Z3QlHnU2drxR0Q4futLECFYm?=
 =?us-ascii?Q?M+4sa0/eH55d2pNVjf2IodJH/ECUCrZE12O2XccuDwlxn/XseuhscgPUk56b?=
 =?us-ascii?Q?bC3Hq3XUZiEj3c/T3XMwYstWLdc3qTwmq5BHgj6nYwvuu0ue1hatiDY9q6Xe?=
 =?us-ascii?Q?avFcQlQ2XGHrbnW61GfI/x4CagzIV1edrcCCXCVFp/lTjeP9ArZ2OBAXRIr5?=
 =?us-ascii?Q?VSt+SH99uRypiJx1wptJF0dlT52cjZE/7S0PermOtfCAv/qn7IgH6wnZHbTa?=
 =?us-ascii?Q?Qfw4wkNHZi3DmT+YksQSKODOkCfY6R7FuziXT2+dTWlDTKm10uv3vXvt7GMa?=
 =?us-ascii?Q?FwqNA8i1OhaAWeVTVVsv9sW0IHhNfatmfMg0I3q5o3XGIvvfUulS24nU3hGV?=
 =?us-ascii?Q?IfZum6Q75/37IpWVkQzmLe30aESIrHYTIgQY2JopucpIJZSqO9JgGXkfEfm+?=
 =?us-ascii?Q?m8/R66s3PyuDAR7ZgkOuzSd5Yx/R5P8fNpM5hXWyZyhwwa5ozylEmMerZBaz?=
 =?us-ascii?Q?ehMH9c0AbkmDC87k3CBZdBmrS1BRajngk7JUBlmJ0nwfhftAFcbVKzwOohTX?=
 =?us-ascii?Q?RyFREi/W/lbSvEfvxssKl3tSm5n8DJVz+xt+ynqAPU3Evf+L9fvH7/a3x+c7?=
 =?us-ascii?Q?GFM5k+PiCjpzI66ouHuE447r+lyclK4IEYUBS6cX0g8Vj3M2j2SRonHD4M+I?=
 =?us-ascii?Q?cOtgajDw0Dc9yxmT9wXJ3oezUSlD728D3Quqf3hwWV14t199ArVphaD/aLig?=
 =?us-ascii?Q?aSBIPqLk3+y3zr+IIMqWxCwWaEM2EQ1m19TNsCXg+2BPG+3olnvjMgNpP/wi?=
 =?us-ascii?Q?aNI1Hdz/nkI2r8V6nwDpM2rlzcoxVpcJKpSG0D04NglG/C+Cx8h0L12EFhHx?=
 =?us-ascii?Q?WMi6XRRjbIYTKyx0Ql/C/G2dB7z2eLrWE4Cd0rHgjV5Eh+vo4vCoA7c3o4t8?=
 =?us-ascii?Q?GGH67gxbVNlhmOFDnefHbVFpIeNenDGSOeFI3bJfKXAdhtnmf4WTWD1/QJRN?=
 =?us-ascii?Q?qNvZaftewjmBBz0o+gRfLeHdISivC0VeM5r4zqzXh7BoX8zGMqeh3Qu/sFbG?=
 =?us-ascii?Q?P4hdGDl3pSas8HPau9T2MUjsxCy8FUuX/xK/b5gUNsTyb2fAA9T2XkfKsj/l?=
 =?us-ascii?Q?cOdwyuLB5lvjCELW4hst4u/AbkjiAtQVmbeQkGoWUvLVdk6jhvlKhFbRO4Cu?=
 =?us-ascii?Q?8GoBTlI7JffXMSOchtRB4aF8raFq2cOmT6QSJWenCnN9yegT2bTX+YP/lKwL?=
 =?us-ascii?Q?7aquiyRd5iHBo0caOproka/y87MKEIdpJwnBGG6Zj3DLoOuVlFXli1JAbT2R?=
 =?us-ascii?Q?ITblKT58QP34maVy5TYyTURy1BjDiw3saHbD0tAt7PQ/yc25Q9pneoLWq5bu?=
 =?us-ascii?Q?+vF0rUl8zG9+o3eanJ1R4Kf4oZ7dDDYSqEay9S0HfjR0z3iz/OfchhCU1JKm?=
 =?us-ascii?Q?eNrc/RHgI0nu/hIAxXOpYt28DYCm47MpcUr1YzTs2SqWXK8pRVFu?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6ad2c52-dfed-4a14-b4d4-08da2415c502
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 04:08:34.9406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L3C9WhhKHQprS/IVUXnSainGpQ8De1P3qBkHQ4iBiMzJeJyIcVCGJfNKqwG9XKlr26xk3kkBdKNBDQS+v+TS4gZSiiiEBVUeRhkVo3OtOh0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR0102MB3587
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

Add device tree binding document for the SSIF BMC driver.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
v7:
  + Change compatible string from "ampere,ssif-bmc" to "ssif-bmc"  [Jae]

v6:
  + None

v5:
  + None

v4:
  + Fix warning with dt_binding_check [Rob]
  + Change aspeed-ssif-bmc.yaml to ssif-bmc.yaml [Quan]

v3:
  + Switched to use DT schema format [Rob]

v2:
  + None

 .../devicetree/bindings/ipmi/ssif-bmc.yaml    | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/ipmi/ssif-bmc.yaml

diff --git a/Documentation/devicetree/bindings/ipmi/ssif-bmc.yaml b/Documentation/devicetree/bindings/ipmi/ssif-bmc.yaml
new file mode 100644
index 000000000000..02b662d780bb
--- /dev/null
+++ b/Documentation/devicetree/bindings/ipmi/ssif-bmc.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ipmi/ssif-bmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SSIF IPMI BMC interface
+
+description: SSIF IPMI BMC device bindings
+
+maintainers:
+  - Quan Nguyen <quan@os.amperecomputing.com>
+
+properties:
+  compatible:
+    enum:
+      - ssif-bmc
+
+  reg:
+    maxItems: 1
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
+        ssif-bmc@10 {
+            compatible = "ssif-bmc";
+            reg = <0x10>;
+        };
+    };
-- 
2.35.1

