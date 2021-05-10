Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8FC377BEA
	for <lists+openbmc@lfdr.de>; Mon, 10 May 2021 07:50:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FdqsF73gnz3bwW
	for <lists+openbmc@lfdr.de>; Mon, 10 May 2021 15:50:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=e5nklvh4;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Cirz+97x;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=e5nklvh4; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Cirz+97x; 
 dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FdqkJ6Lbcz308M;
 Mon, 10 May 2021 15:44:24 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id DA1A85803EE;
 Mon, 10 May 2021 01:44:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 10 May 2021 01:44:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=cnao/xXDBi5Ut
 isNNxs5pmuioumkhfUO3U6beHJwaRg=; b=e5nklvh4SQ4zz8l9uTze8tyOci7DB
 eUXY4h43tR+/ZsmfQ30jJg9np4SCLUSgCRKSUOfvBU7Od8yXTEZQ1sDu+L2R8C+h
 f7wrwy964O7rDooG/h1vboXRS7rHw67w3qHFUIX19tMMo7jyzznFj7NBbbdseJTg
 idBwerMitl0fXc/OZQk45D3bnGZeDVXtuAmlDWnACfwMbAqyUqqKXQbYWVT4wyDN
 7L3PgYBsj82lta3P4Ac5vA7QzmzRak4kdGM8SLHLLYYKNiyMvdIs1QSmPDQKUw+Q
 iOf0FXr4NkwR6EIAY1NjMYKBruly69c/Ud1EV5d6oJg56sRxCx5evyGgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=cnao/xXDBi5UtisNNxs5pmuioumkhfUO3U6beHJwaRg=; b=Cirz+97x
 R4YGgjnQZ9/WWXFqWUVWzD/y1eDzp1To7E4wAjat3cjmhZM4XOkhWdzEbFj40atQ
 61LJ+ZU/k0uMnmAUOXQHu97/Mo3V0v8vIXJ2F7mvVbYVj8aSi2OfEeGomaG7hLaH
 s0kpmVriEKLYIVLdUqArHqfyQ+vii/hEpGEDMzT75Jm/v+8AHrPo8M9zOtOg82nU
 J6LOHBYdCsbi8BZxdq3jSLXks54zqTnl0XOd1aqOfYyn1TDsADsO9FTMrGdC+HIb
 vhWsU7Ri7gHQWO0sBL+9tzRs71OVwziDbTd/Tj3HRDjI4jB3bLpHii2Pwx0tg7C5
 LICKFhH+cI1y3Q==
X-ME-Sender: <xms:NsiYYHX3JbZWzA21TEmTKrxcucDSMl81CpNnIMdSkVyv4HhJbI9vjw>
 <xme:NsiYYPmWT4gv4XB3trQQa_SJYBaLUHxBPIpS78hIJ06VDXsAFITgD_n5O7u_8RP_X
 Bb5q5IPi7VLBhuJRA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegjedgleeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhgurhgv
 ficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrghtth
 gvrhhnpeeluedvvedtgffggefggfeugeevgffhjeefiedtvdehvdfhtefftefffeeihfev
 vdenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgnecukfhppedvtdefrdehje
 drvdduhedrkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:NsiYYDZWc56wohXBsKz5x_TABTs2WatX6IBj0WOM6Pc25es73FyCkA>
 <xmx:NsiYYCWlO6mryasEOSKRcbo_gV_3a4qkn-tzGIJjQfy30AwCg648fQ>
 <xmx:NsiYYBlTJDVZFHCaNjI0ywZV8fn0rhp01pYptUxuzoQda_ArIQ-vkQ>
 <xmx:NsiYYG9UX_Wwe3L-QFIXorhv-H1EAjWXJriwHn_9WtxVrvmaNkNs7Q>
Received: from localhost.localdomain (unknown [203.57.215.8])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 10 May 2021 01:44:16 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
 minyard@acm.org
Subject: [PATCH v3 12/16] dt-bindings: ipmi: Convert ASPEED KCS binding to
 schema
Date: Mon, 10 May 2021 15:12:09 +0930
Message-Id: <20210510054213.1610760-13-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210510054213.1610760-1-andrew@aj.id.au>
References: <20210510054213.1610760-1-andrew@aj.id.au>
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
Cc: devicetree@vger.kernel.org, tmaimon77@gmail.com,
 linux-aspeed@lists.ozlabs.org, Rob Herring <robh@kernel.org>,
 avifishman70@gmail.com, venture@google.com, chiawei_wang@aspeedtech.com,
 linux-kernel@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org,
 arnd@arndb.de, zweiss@equinix.com, linux-arm-kernel@lists.infradead.org,
 benjaminfair@google.com
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

