Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DBE3888C2
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 09:54:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlQBV0BtTz3bsf
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 17:54:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=jAqiZb0s;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.100.105;
 helo=nam04-bn8-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=jAqiZb0s; 
 dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2105.outbound.protection.outlook.com [40.107.100.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlQ5y6LMLz2yyx;
 Wed, 19 May 2021 17:50:46 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T+Fj0TSm13KXs8zLiO0Oa/WQp6il1j38hwEDRl+QkgqYU1ItJumDfRXT1ybWPjkmHUBdjRj/nerX2SKaL1xEl46FHs/fyebIY8Q44p3jx/Vk13Dp837vf9xBcSynkQtFyD3/7ByLU+Vem43rKCYbrgZ3/isvWupff7XST41nmdSO7y/xPt8zuwarb04D+x+nruy5yuL/ufAJPOc8DbQw3ph5Uu35Jhza4Dmcr7JOPzZMobJMcH4U3+IiLDwvNms+gwy3IHikfoZZFF1mH0KtpeZeR6I2tpEDEl4D8foGZa1d2brF6Cs6pJ1x+spPW0kAyjH+Ji+a7jFwlOnowSimiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Glrb4vzD3wcH0QfrVaYtRQA6+zo8DwoaU589Hro23QA=;
 b=ILmvNx7Ln5ul94bv7hWiE2IbEYi7ItBx6r1+udCvF4gdri9XGDg0BWWzDxxp+HOWdaV/1pb9brKhrXI3C/UQXLNqIeyVdcu1eJuaEOolKsrXVHFUoJTUnD0frtW+nBggG9Fzo9VdXiqPgvSS71xVa67SpZ8tQHBrlVOXib3fwZnWbVY5gaDRT67a0JVJLvrYPxdVm7OfpeWC/rcMDGBN//DijiJKprnqFiuzRIUNrcQM4Ht5GU998N6KdXbE+8T1FRDwS3BetF9OFJlVwFUjATwhcAFcXvgGJdKC+G8zmnx1FEvFO6ScrQL0i8POPL1ILGlyjWBO9QDQBUejh9KfPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Glrb4vzD3wcH0QfrVaYtRQA6+zo8DwoaU589Hro23QA=;
 b=jAqiZb0s8aoYE/nmV7VQ+aXCnJEJw6fS38pEo8JcK2lqStqrYJZaX8jM0DWPoifYtOb0FdKtYKUWTJ3atl42hE7ZE7/81tkHSKPu+vtHjDiPXw4foNCmYpJ0en2ntHFGhxF/PckiXYhECloEZKgkCyK9AqiqbOsaSSvCWGpR/7k=
Authentication-Results: acm.org; dkim=none (message not signed)
 header.d=none;acm.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 CO1PR01MB6743.prod.exchangelabs.com (2603:10b6:303:d5::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.26; Wed, 19 May 2021 07:50:45 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.4129.032; Wed, 19 May 2021
 07:50:45 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Wolfram Sang <wsa@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 openipmi-developer@lists.sourceforge.net, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: [PATCH v3 7/7] bindings: ipmi: Add binding for Aspeed SSIF BMC driver
Date: Wed, 19 May 2021 14:49:34 +0700
Message-Id: <20210519074934.20712-8-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210519074934.20712-1-quan@os.amperecomputing.com>
References: <20210519074934.20712-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK2PR04CA0081.apcprd04.prod.outlook.com
 (2603:1096:202:15::25) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by
 HK2PR04CA0081.apcprd04.prod.outlook.com (2603:1096:202:15::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Wed, 19 May 2021 07:50:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e021bf21-8463-48f0-3ff5-08d91a9acef0
X-MS-TrafficTypeDiagnostic: CO1PR01MB6743:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR01MB67435A4745A18B03EA8B575BF22B9@CO1PR01MB6743.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GbwcvCL6UajBIHReFTw5Ob16SdgrVkWeVUpMqGoXeXSr3gjdqprtrvWveb2hi+0/mh4TPS8jVPqB0HgEwjN94fQkwd5JAiIS6EecxnhtnA0IY3hDB3DE/5wXWC8qukHR8mFw8ozFfVq+vVcTYnR3ghUr3Qr0bx32SxPmGlZpTWgekhQbGWyU3g837Id+nbDWC1mJzDbnu0O1st9n3tR7dtj9rClPx+QUozmBKXXwyZvmbfctJxAfjKTz2jVNHHz/pHIQN+Zgh/mzP5Ditz+BklMveXQNLIHUsxvj5+8HuI3LIy7qQdxKPOuOUelx8hOnVOnW0Y9xS5z+Jq0QToN/uw7pyppbsVZy0JY6N6e+pFq1afG3wivLEmP/OHVdvQL6WeJ7ipen25ewvQrM7hvwU5NGQmrNiCt9EvOJmTm69dtxVXHPMH0FQ0p7fze5Y866H7wPOnHLaA/hEroiUkuzxEmkjGfLFbSaemHWZPl5DY8uSo57IddGfF90HshhYWvfi5w36aGODlep9P9ElmiIlsE7qhe1OJNGXv6/d7hz9aAHSvj4x6mhuIayyxnbmYUWOwb4CrWgzULPxMzApOHKdQhdhhndBIQ68wU3VDLVVyfu3kZV5pbzhJCPh1EPHh4Vourecj6apVwLAT9tRjYHn7c8p1o3gQ7r4uEhgMAg7Fn/tDa8Dqp+9rXLnQLxFX3PtbM9pgEr+2H1Wc8cGPg2eHtB62B42SQby2h0u498bp8EiUlwTy+ZUonDT6g6rwuCQ6+I39I0vK2Eok9Mu0J3tNrKzs8pi0TXBSPngBuhKXw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39850400004)(376002)(136003)(346002)(396003)(478600001)(66946007)(66476007)(8676002)(8936002)(956004)(921005)(66556008)(52116002)(6506007)(2616005)(966005)(6512007)(5660300002)(86362001)(4326008)(38100700002)(1076003)(38350700002)(7416002)(316002)(186003)(6666004)(2906002)(110136005)(54906003)(6486002)(16526019)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?SEbbo1zkv1IOWhRrWfK1Dc+Y7OtdgLlNitmFeBzjBoynVymUi1dtH55i4hVf?=
 =?us-ascii?Q?zEOt3pwE0MDg++Nb0ol+tbWyjU/Vt0V6M/YLjiZ77/5cFz+h6Ur3mRCLPoiy?=
 =?us-ascii?Q?pdWEkkZwhPGRp5aomm24g9qd7VmjDBlozxNaxYESN5FuTjTsRLEm8CbQfGvs?=
 =?us-ascii?Q?Fso42bJu1hgfyZ2DtJlnn5tmamX+MV+hWGKFndMm5V9PUTaExnY6GkwBDeOn?=
 =?us-ascii?Q?1TngXfExZy8gN2hocCxyFqqhe5Pjzcjnw9EsFMK6Ys/TrNKTgtFEEKGXIF7G?=
 =?us-ascii?Q?8ZtYi1iCingVY83qVSnwg2oX6CHqASNB7LZ4r4AUH4c2T+yhiyYsNdCERvJW?=
 =?us-ascii?Q?Wt5F0cpXFS9lktdP54PPT+5nk6PQ6R103uz0H261RCpC8oW6q7OqB25cNUmO?=
 =?us-ascii?Q?jvWxpkVNHhgv8glIQ/AokRlrTZlviMS3g+wOcHneauAHm1/kD6MfOaErp0hL?=
 =?us-ascii?Q?YZCcjhQhjyKWPeE0F0nYZ0pX/DEzYkZx/Y+PxaEuXPheIEwq23DjiIGuCuZn?=
 =?us-ascii?Q?SuVuIjGhQuFZY05h1F8kiR8x/L8IZCuHY7vdg1jdenj9PpDo9drNAJK2hpIJ?=
 =?us-ascii?Q?UR2h/yvFBUPZj10ep2lUMNY2vW0yVfsfeOXl84ylbY2q8FQoxksY8x5AAwca?=
 =?us-ascii?Q?CYcRBaZsX84ULP+1qsDms5pEnSTyaodUWj4O2wXnXTOFHqBGiUG5U2wxj4dE?=
 =?us-ascii?Q?tnCnWbeD9VpTW0gRKx48afz19zzwvprFd1tcD66lGWITthRz4mgNjPcbX0J5?=
 =?us-ascii?Q?XKQfhsIdsYbAmrRkxQdMN6F/m1lXKMSf7JgT76d/p/z0jj1myWVCGWzgiLJ/?=
 =?us-ascii?Q?v1Oxc9S4JC9tUUeFFTe89Vmw37OWRsgWKW65ieWeRKRBiy9ITly06mkX0LNo?=
 =?us-ascii?Q?RXNRgCHb2EJFtgI4fLzIdhNZ+d9RwYtEY+PEl+t1fxjEs/6mHTO4LoYwwSK9?=
 =?us-ascii?Q?TCQFFl0Y4V/QexVtywUr2JFtn13akCOmGN9CoUKb3lx39PK7UrPG7ltl9qY8?=
 =?us-ascii?Q?p73Fgr+HLM44VfGS4sZJ9uQvVJCwC4fKr8komV7F1SopKGHcdUVgYI6PWBfS?=
 =?us-ascii?Q?LehSl35ONGUBAuy1NTZxFX68LL96YjZLRw+RJFq/yTCn0oBgZ7OVqz1HeMsN?=
 =?us-ascii?Q?+xgBRHhSVAk48ws8KfwG/uJk7Uskt7KBwEMmW8ia0A3HWBB7aPfNJY4ySSOf?=
 =?us-ascii?Q?Ew5c/yX6abDXESvhRrcPy6eUB0kyRw5BLh2nHjmee4X8sxShbj3l7WL+pjbX?=
 =?us-ascii?Q?JqvgwN4J+06Wsfi6vd3T2sCJHuT7gVvCP3u/yTk/QckGtNUpYqQBwVJ/b5ac?=
 =?us-ascii?Q?yaP16tnNZpXGargjHtxf6aek?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e021bf21-8463-48f0-3ff5-08d91a9acef0
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 07:50:45.4639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1KjyS0ZFzK0oJnUTwZiWafvCw1sgaIq2XT5Jcd6/ZEFXx7QH61G8cUrLe7nUbfdNIs7kTo17xUEXr4PJfxYb7oTiFkmS0k4cCCMTlS+bMN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR01MB6743
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
 Phong Vo <phong@os.amperecomputing.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add device tree binding document for the Aspeed SSIF BMC driver.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
v3:
  + Switched to use DT schema format [Rob]

 .../bindings/ipmi/aspeed-ssif-bmc.yaml        | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.yaml

diff --git a/Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.yaml b/Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.yaml
new file mode 100644
index 000000000000..8608041fbf7e
--- /dev/null
+++ b/Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ipmi/aspeed-ssif-bmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Aspeed SSIF IPMI interface
+
+description: SSIF IPMI device bindings for Aspeed
+
+maintainers:
+  - Thang Nguyen <thang@os.amperecomputing.com>
+
+properties:
+  compatible:
+    enum:
+      - aspeed,ast2500-ssif-bmc
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
+    ssif-bmc@10 {
+        compatible = "aspeed,ast2500-ssif-bmc";
+        reg = <0x10>;
+    };
-- 
2.28.0

