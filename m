Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B54377CA1
	for <lists+openbmc@lfdr.de>; Mon, 10 May 2021 08:57:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FdsLJ4xJ5z3bvX
	for <lists+openbmc@lfdr.de>; Mon, 10 May 2021 16:57:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=SXbNvbfg;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=HJJ0AFNV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=SXbNvbfg; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=HJJ0AFNV; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FdsCB3NLQz2yy4
 for <openbmc@lists.ozlabs.org>; Mon, 10 May 2021 16:51:02 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 6DFCF1683;
 Mon, 10 May 2021 02:51:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 10 May 2021 02:51:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=cnao/xXDBi5Ut
 isNNxs5pmuioumkhfUO3U6beHJwaRg=; b=SXbNvbfgMeLit0B77C5ASsWztH9qA
 fTKYa34BoJv74M0H/EQQQkabbir8j2qQp66rltH327aD2jJuOavBiIcdHC6M4kGz
 HxetFtrP+UnrCBU1qD7ba6raS3Zc01+8RiRTPC4KplNVoGWxyRxqqnno32eLDX3g
 eCOgY6Ssq1Ka00BZgOCmbXI+g+FUELaiZbrMS9IIwB6+/mKLiNE8m8/HaqKM5k/W
 JcZwIXOctA9aA6hkUyCnEzGZEKiGLBdyceDKhe6g7rXjCYNLOXyswp7aqwJwpnrC
 3j4TAh7tHUagJTXwPNm44gDNgHu3g8UmYHRhOaad+D/BKCVKY07Qb9eZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=cnao/xXDBi5UtisNNxs5pmuioumkhfUO3U6beHJwaRg=; b=HJJ0AFNV
 VS2/eOhNMUtShlauI7KmJ465i2HdDLzxiSHN338l6hrYRE1vse7IjM8bZTfnbrp8
 /AR05Njn2GPcdPc9RDC+ifzl8OVX0cN+ef+d6xcCCNSNLPfkxhR38oTUV+N+/Nrk
 Lvcbv/mt5hVeJyHBqdIqnA3j6C63rKVBVly3flvONAgpZa7S27vI+U21UxHI07OI
 71XqPvW5vAnCtmjAPjF6qh2Qla8Hey/gvYJCpUj8rTjZsdE8rhrLkTW2grIT2q+7
 g/ZzmZ4uNCXi2pjVGKxq4ogypkNsQqnKsRB68F0tuu4wf6HsMtj2exiopFDqevpy
 yOV4fVUeC1WTIg==
X-ME-Sender: <xms:09eYYBubn5-ujfocs-QswC9SxVyYBHfHN1ERAPGSEbYZYv0HBjyDHA>
 <xme:09eYYKdoKQuQZ818Pe_emCiCOM1zXm5xtx6rh1EmkDHiGgT0wkx0YTUMUJgdraDWQ
 FeGEEpPuJh8ErdvWg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegjedguddtlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfies
 rghjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpeeluedvvedtgffggefggfeugeevgf
 fhjeefiedtvdehvdfhtefftefffeeihfevvdenucffohhmrghinhepuggvvhhitggvthhr
 vggvrdhorhhgnecukfhppedvtdefrdehjedrvdduhedrkeenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:09eYYEzx-zcXquzc4jesaoRwVHkOCPfdSsTjNX3vPlrp6MxoPZT3yA>
 <xmx:09eYYINxA9CWVtS-fZz03I5LOri5J7Qo4gDLQAuVK-BNb-b0LHRIMQ>
 <xmx:09eYYB_LeiQ1r9c1IdsyUsRbfTNnCEOvZJ_scXXz7X4ViKaPt2hoAA>
 <xmx:1NeYYGJpPXFIZWaSNOaUPgO40iAIdWMpsyDFk811vqX7cM8UUPVxYQ>
Received: from localhost.localdomain (203-57-215-8.dyn.iinet.net.au
 [203.57.215.8]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 10 May 2021 02:50:58 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.10 v3 12/18] dt-bindings: ipmi: Convert ASPEED KCS
 binding to schema
Date: Mon, 10 May 2021 16:19:49 +0930
Message-Id: <20210510064955.1704652-13-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210510064955.1704652-1-andrew@aj.id.au>
References: <20210510064955.1704652-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Given the deprecated binding, improve the ability to detect issues in
the platform devicetrees. Further, a subsequent patch will introduce a
new interrupts property for specifying SerIRQ behaviour, so convert
before we do any further additions.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Zev Weiss <zweiss@equinix.com>
---
 .../bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml | 92 +++++++++++++++++++
 .../bindings/ipmi/aspeed-kcs-bmc.txt          | 33 -------
 2 files changed, 92 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
 delete mode 100644 Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt

diff --git a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
new file mode 100644
index 000000000000..697ca575454f
--- /dev/null
+++ b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED BMC KCS Devices
+
+maintainers:
+  - Andrew Jeffery <andrew@aj.id.au>
+
+description: |
+  The Aspeed BMC SoCs typically use the Keyboard-Controller-Style (KCS)
+  interfaces on the LPC bus for in-band IPMI communication with their host.
+
+properties:
+  compatible:
+    oneOf:
+      - description: Channel ID derived from reg
+        items:
+          enum:
+            - aspeed,ast2400-kcs-bmc-v2
+            - aspeed,ast2500-kcs-bmc-v2
+            - aspeed,ast2600-kcs-bmc
+
+      - description: Old-style with explicit channel ID, no reg
+        deprecated: true
+        items:
+          enum:
+            - aspeed,ast2400-kcs-bmc
+            - aspeed,ast2500-kcs-bmc
+
+  interrupts:
+    maxItems: 1
+
+  reg:
+    # maxItems: 3
+    items:
+      - description: IDR register
+      - description: ODR register
+      - description: STR register
+
+  aspeed,lpc-io-reg:
+    $ref: '/schemas/types.yaml#/definitions/uint32-array'
+    minItems: 1
+    maxItems: 2
+    description: |
+      The host CPU LPC IO data and status addresses for the device. For most
+      channels the status address is derived from the data address, but the
+      status address may be optionally provided.
+
+  kcs_chan:
+    deprecated: true
+    $ref: '/schemas/types.yaml#/definitions/uint32'
+    description: The LPC channel number in the controller
+
+  kcs_addr:
+    deprecated: true
+    $ref: '/schemas/types.yaml#/definitions/uint32'
+    description: The host CPU IO map address
+
+required:
+  - compatible
+  - interrupts
+
+additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - aspeed,ast2400-kcs-bmc
+              - aspeed,ast2500-kcs-bmc
+    then:
+      required:
+        - kcs_chan
+        - kcs_addr
+    else:
+      required:
+        - reg
+        - aspeed,lpc-io-reg
+
+examples:
+  - |
+    kcs3: kcs@24 {
+        compatible = "aspeed,ast2600-kcs-bmc";
+        reg = <0x24 0x1>, <0x30 0x1>, <0x3c 0x1>;
+        aspeed,lpc-io-reg = <0xca2>;
+        interrupts = <8>;
+    };
diff --git a/Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt b/Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt
deleted file mode 100644
index 193e71ca96b0..000000000000
--- a/Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-# Aspeed KCS (Keyboard Controller Style) IPMI interface
-
-The Aspeed SOCs (AST2400 and AST2500) are commonly used as BMCs
-(Baseboard Management Controllers) and the KCS interface can be
-used to perform in-band IPMI communication with their host.
-
-## v1
-Required properties:
-- compatible : should be one of
-    "aspeed,ast2400-kcs-bmc"
-    "aspeed,ast2500-kcs-bmc"
-- interrupts : interrupt generated by the controller
-- kcs_chan : The LPC channel number in the controller
-- kcs_addr : The host CPU IO map address
-
-## v2
-Required properties:
-- compatible : should be one of
-    "aspeed,ast2400-kcs-bmc-v2"
-    "aspeed,ast2500-kcs-bmc-v2"
-- reg : The address and size of the IDR, ODR and STR registers
-- interrupts : interrupt generated by the controller
-- aspeed,lpc-io-reg : The host CPU LPC IO address for the device
-
-Example:
-
-    kcs3: kcs@24 {
-        compatible = "aspeed,ast2500-kcs-bmc-v2";
-        reg = <0x24 0x1>, <0x30 0x1>, <0x3c 0x1>;
-        aspeed,lpc-reg = <0xca2>;
-        interrupts = <8>;
-        status = "okay";
-    };
-- 
2.27.0

