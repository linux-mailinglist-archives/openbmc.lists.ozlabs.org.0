Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA1C4D4618
	for <lists+openbmc@lfdr.de>; Thu, 10 Mar 2022 12:44:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDnK36tDsz3081
	for <lists+openbmc@lfdr.de>; Thu, 10 Mar 2022 22:44:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=UXnkCesS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe59::714;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=UXnkCesS; 
 dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20714.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::714])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDnGr13zFz2xrc;
 Thu, 10 Mar 2022 22:42:12 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MQVesjGnqlnAQUk8lx58VCw/+IvocxTbs4TCZlfc65MLzRvwRWHwL37KG0ZOL04w+o88dyvRDsgm7KCtC1BdmHK0aJzXs0y4dJDoNHXmfSi485xv4dlZnclH4InALyGb1rpyTwfDeDSXo8krp0JDSxvimBKNZ+8spe5ZD6JOk/tQiq2B99WgmJQtb83EWUYZChbfNBevpCMlr099G2n2pVsC3iz6vQaHJBQ5J/kckRox7go26MbP13MBiNS5TGEQFMfIs/obDF7CLYi1UuQ468owhr/yTwsDv9wDWvldtm5IkTUmY8/FSFdF5LnL0bVIFOqk0dYDA0Cn0gQzj4N1sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E0opcG/Cvy0b1rf9v+7qbFb1Q7nos6/NCRqgdqSinto=;
 b=gn90lo98cnU6MdnGnN0JWPmjHeI6JoWOA0XmZnhRRqEs2ZuBoV7T91VUTQk6n2OTvMzvQ/MccfAAn2tUAEoy1cw1uzXfSDQgml+7aSVqLvoiuKcfT4fZzI38zyqnsTdMCMN7ONDVlSWMFBDtquQmeHlGe+iiJCyzuwQF/023qfxhDDw5m1S5QkZvfyOId6GR46PXEH9vNuPoonWZXIopLDhyhJipV7QbThwa0hE7p0MHiD5lmpbKgBn0c5w0G7dJUUj9xhH3pkSEY2seLK10T7b/O5xnZveCLWpioMNd4wK54dK9MFeyo0vCCO4UpVjaSxqZWaOHITClCclpkReT+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E0opcG/Cvy0b1rf9v+7qbFb1Q7nos6/NCRqgdqSinto=;
 b=UXnkCesS2kkNeM9fSVaCddRCRj+0YREUKyopqQd3e/J5gg2OBf7L6NZDtGlK4BcL/Uv+5uEBHNUuCuRHkF8DA3ac1xhLvl5Na3JmCGCsIoQ0K6wdSsFM2fEIfTuf9Hj7QAk8chCh0CSmFAC+M136L5MU/HPbNRkAOuTEO5xu1Kc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BL0PR01MB4305.prod.exchangelabs.com (2603:10b6:208:4d::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22; Thu, 10 Mar 2022 11:41:59 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::cd24:39ed:7042:46d6]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::cd24:39ed:7042:46d6%6]) with mapi id 15.20.5038.027; Thu, 10 Mar 2022
 11:41:59 +0000
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
Subject: [PATCH v6 2/4] bindings: ipmi: Add binding for SSIF BMC driver
Date: Thu, 10 Mar 2022 18:41:17 +0700
Message-Id: <20220310114119.13736-3-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310114119.13736-1-quan@os.amperecomputing.com>
References: <20220310114119.13736-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0125.apcprd02.prod.outlook.com
 (2603:1096:4:188::13) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 587551bb-3583-4c1e-9629-08da028afbfb
X-MS-TrafficTypeDiagnostic: BL0PR01MB4305:EE_
X-Microsoft-Antispam-PRVS: <BL0PR01MB4305FC322644F48517309C2AF20B9@BL0PR01MB4305.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kTsMVvrOXmQPYBk/166e48jMo87stUMFgfb648/Tm42k5tTvyYYdjbULMrv4Nuv4NxtaVccDATgtGZwwATXSfyNBvsr7TfIDHkx+j/HulMUph76gNExtNNeiIBNxOPiaPOUfj5pNBV2A+P8RTOLak6Jh6xa40T6eLnj2mT6y6/RaBd+1ggvlEbKC5O49Sz09W0CtCKrqTP3DjkuV+SAINtAD2fChlPtQI8Im39qQ3/wuG+LKP2o5ChjKrox1+HOBO/lTWGBJvaDU4f84Uw/F+L9RFuOivjNi5/pXKjseAaacAHdYDxYc3tnms4JD2oll319tbCA69SE54unSKAdOiftOl+3JdikFjpDog42p5+0+RsoVRVQQ7ZBkoxO1d+GIelNLAf2A8Sq7NcG8sdVXk3phhZZLHB5+mpKEWprpcvDdSKnc0kqf11EEBNZYx/rADi+MObPkVy3QH56f4yTvd3R2JD6am1iCHJbs/b1Pdth/Z2PS+DmxNtmT/A7b0jsvQYDmxAcz6XY/1OnrXqe3UZUTMlATxD3B4ksUw4C26rXT2nZjddUnnV07TcmPD3KUuzAnkel2DSFK8ME5BMIKKut5F23pWARH8vM781Z/Cv3FuWNBcaboYHwoX7MKeRbzjlEF2affMyjvkJVLVI0cKABo+PNfddDx32vVri/9BE3r6jz9dMXJOTpSbd3G4eBha/COVR/kAzfd78SlF2H5A4MLEJM+JgiIpaPkx42nGRrVnAG32vUFmGIoMGjKskmszDWYTgdMrzy7cuGEdfAYrJj6NQbA8nWXC+hAnZNetD9yDZg3VWy52qS/zGHNkzfx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(107886003)(6666004)(66556008)(66476007)(66946007)(1076003)(5660300002)(2616005)(7416002)(316002)(38350700002)(38100700002)(86362001)(4326008)(8676002)(8936002)(83380400001)(26005)(186003)(921005)(2906002)(52116002)(6512007)(508600001)(110136005)(6506007)(6486002)(966005)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zcyFbJhktMmJffr9g+3/Uo5ZAovBi8uoIgh1IPBWecK4s6LN4CeFaAyU78NO?=
 =?us-ascii?Q?n45IsLAL7PtTO2ZAKEUHrEL6pjmHEMaLJaTKOmFgpPdSZKqT4UzfNrylhUfv?=
 =?us-ascii?Q?Ty2wZ+okPIk55p3Cl6+TfCHjpwazqgDth93W3UNriJHMi0ZaaJ46AVQJ1Lxi?=
 =?us-ascii?Q?C7net86KxzKxej1pjaCEbP0wRkFYKqi4T5RqbofEZNW2l+3bbGqEAnFKWLUz?=
 =?us-ascii?Q?pVcRHL3Pk2anbqW0K+mcRQWYsbfmgXmG0IHfGAHDGNq4qPLwKGefvWToiq2E?=
 =?us-ascii?Q?Rl6I7Ch5Qvh73wayviyyoDZbhZmyclZwH2Tg7pD/0+Y0pO0g/dwiHktghSaG?=
 =?us-ascii?Q?pV9qPNPZ/zIdHsxDBv0UQcNJlvtFQ9zXv38DoeiHgHlqGhU6KF2HMQH7V5O8?=
 =?us-ascii?Q?taZ7Xss9dVVrNud0G3jOlmcZk1gsIS+PhZtG6H6zMM3ejfFFCvH1+eyvZE1/?=
 =?us-ascii?Q?tyUkjhLH1Ffw38yejZVaCCuHx3HlD760f0Efm2fGav6o3HlCwVLJ2rqESpMa?=
 =?us-ascii?Q?xbgftoVf4qcIIBe7WiT+T9dGZ6NbKR0peibKKHCoUSolRMNxjg1CiSx8sCqT?=
 =?us-ascii?Q?Old9Lx6b07SAepIbiJ19JWDjDw1y5fDlGti1QoJn6RE6OtU+9Mq0U8bJuFxa?=
 =?us-ascii?Q?oChaRBrit5E/DwVoViKCMMr0/Fcqfe8azDhf/bWqeUNWY5IBIOHs6cxEwKzz?=
 =?us-ascii?Q?xbWnsvv+VO0nETwOjE9AZdWeOxJoPXq/jibKtm8kJBB0mVnpFvs6tCq3ix1T?=
 =?us-ascii?Q?peyLxf9pGMk1QtXxOuPIUXvbZdp6ExipoDrYcQMaxJsBTQZ4ntZsVvi3QVGH?=
 =?us-ascii?Q?HVurUVPgn8tEV3qi8A1CIddJ6CHjwWaHRJF4j3RtmGBZ8OO1cdxF3LPtjaxf?=
 =?us-ascii?Q?Sd1kifievdShdDW67mA8E/i5wwAvIWYkbhpxeb4c7vIabRWaNjNl6zmXqXym?=
 =?us-ascii?Q?JkKjL7Tcbcr42SBrNIt+3F7dh3mhImMW5408ZbBlTlwOomh9kasdIqZpcRvf?=
 =?us-ascii?Q?0hpZpOnkALuUprOYHSSIu3UZ0vx7y77/4cU97kIW70UP29RjICIJcD/C16Am?=
 =?us-ascii?Q?mTN03w8BlD6JxfOQFxOS+ZUaau4eeCAlF6Wg7VVFEqgB4Wisdklfdy5qWW4f?=
 =?us-ascii?Q?sGuawo9WeJ9TKy+Fd3FI0zXEZ08RZDP4WArcvzXT82aWHp4tr2vLUsgsoZoh?=
 =?us-ascii?Q?HoFKs91wr7LFsnQMFKerAnAvnzbCZinyKgnH/46CItc+K5FS5Q/p5yZbHMDy?=
 =?us-ascii?Q?jAwqxkxFHk3TgVUbX+lwkSAd+mLUO36UYVEwbsiJLVgG5fc5cP3B1Y2YPSKc?=
 =?us-ascii?Q?2ioZZIxyS8mJQzh3eG3ftfno+kmbI7ZkodQQwKxaKTHP7gRYfPP+J51rM2Vk?=
 =?us-ascii?Q?S59YupC5HUYO3YwlN8EoY8NC2VMUAlKxnmjZORfQzuRlnvPV8Nf5Qhjw49g/?=
 =?us-ascii?Q?HWbXltUkyS1Aqr9YLJ20BMGfg4hevmLa3SRQADndbBoyp1kn/7hcCUnYSJ0h?=
 =?us-ascii?Q?lcyRhjrpNTR31f0=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 587551bb-3583-4c1e-9629-08da028afbfb
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 11:41:58.9531 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +1EgMWXFDPcSqkch2J7VSIo/Ln3J3k5+OrUGyy33tADGOXtFx0tRHXrgKyy7qGkvYp1SbkYXJo4VNEiFGaH7o3LzUkKfy9bV7Yl7Cuyo0vU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR01MB4305
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
Message-Id: <20210714033833.11640-4-quan@os.amperecomputing.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
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
index 000000000000..917a577c2f29
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
+      - ampere,ssif-bmc
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
+            compatible = "ampere,ssif-bmc";
+            reg = <0x10>;
+        };
+    };
-- 
2.35.1

