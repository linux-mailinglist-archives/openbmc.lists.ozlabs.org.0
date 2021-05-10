Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09056377CA3
	for <lists+openbmc@lfdr.de>; Mon, 10 May 2021 08:57:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FdsLm0Vgyz3bsr
	for <lists+openbmc@lfdr.de>; Mon, 10 May 2021 16:57:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=ij0cCIvC;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=tvohWg3T;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=ij0cCIvC; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=tvohWg3T; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FdsCF2SZ1z303Q
 for <openbmc@lists.ozlabs.org>; Mon, 10 May 2021 16:51:05 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 6F3C8F74;
 Mon, 10 May 2021 02:51:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 10 May 2021 02:51:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=E8QunPh9AaMnR
 gR+ENPZuJJI09F8EPSuDjGchklbXy8=; b=ij0cCIvC9e6wZxnSQ45XCYenURCy+
 +NgbJ4O4RTaxrsOreVJ+NTmwYmZZcVX5aNxavxLK4Et5cNur7jD6L7MGIWwTSP78
 rgLpcgpT6cibvXcI5+z1qOZvVgK8wfVOq0VeAvZLzjJrtlECmOn8QIGfMDliCwD/
 buXGIeSVmFHqP/DsKvU005BUruFsEe13XegQpBi784dGjhVCOA7sbK9E7kcfgVHn
 mkoPMyftiJrYrX8ivX87jpZRqVOBbKulis/Ez/TP1NZBB3uSxFEqHBES9d7liGL3
 S9hK6okqN53TYKcTTX3kISayZUtxllRrQP76ng4YZO13QwMaL2+P1eGrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=E8QunPh9AaMnRgR+ENPZuJJI09F8EPSuDjGchklbXy8=; b=tvohWg3T
 e9IB83Jlv4wvPtE366vWhBZqvCBkQtLhYVTdQN3EHQV2oTvH+zc4W6DFDFb+Hzpz
 AmbCetvW9ZrNqg+7NS1O8fdRagyDQSVQpKLaXlWSB4CVBlnNJy40SRqKTNo2Uukj
 2gtyEUgVoR6xmdnm51w3wv0guKLUGwpeghFLyZQF87GyB2kB4/+ffHZhSO8xAZhB
 aHJ7xKGtxxpHuttzKiTlk0wkaazFQYT0tNGEdIbT965kbPsTGPK/BX/VK2OQDixL
 W2ILis/XBDSe5pmYBxB+oEAtzd9UgDFP/0C+vRG/ln4FtlajMDZ3JSETGC41k6Hr
 xCIue/T7+IZo7Q==
X-ME-Sender: <xms:1teYYAs-S58ErJDFyokreX5g_my2vkZtpEKE_nAlwQ1lAscq4zj8Sg>
 <xme:1teYYNdo4XDSNSWHw1BMiW0-en7GTXK1FAkxAUKndENC-TbwYxmDiSchMhJ-Yqv7g
 FtGx9qk007c0NIuew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegjedguddtlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfies
 rghjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgle
 etteejffelffdvudduveeiffegteelvefhteenucfkphepvddtfedrheejrddvudehrdek
 necuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomheprghnug
 hrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:19eYYLwlv6O-DzxDIUsoEROpV8E4czxKSgng4LMAKUtgV4Tx5MPyrw>
 <xmx:19eYYDNlfYoNJZO1YKMm1O5CAv_AT-yFmzEjo6ZVo3QB1ldpD8p55g>
 <xmx:19eYYA-tl2Ga7JAupAWcJOqbvJ5zAuCxBBsYqYSNdnS77QMRy0GR1w>
 <xmx:19eYYJI_A60HJEUB9rCVTu9ICWZ0pHFEt-yDT2CpRllBLxnBCR-D1g>
Received: from localhost.localdomain (203-57-215-8.dyn.iinet.net.au
 [203.57.215.8]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 10 May 2021 02:51:01 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.10 v3 13/18] dt-bindings: ipmi: Add optional
 SerIRQ property to ASPEED KCS devices
Date: Mon, 10 May 2021 16:19:50 +0930
Message-Id: <20210510064955.1704652-14-andrew@aj.id.au>
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

Allocating IO and IRQ resources to LPC devices is in-theory an operation
for the host, however ASPEED don't appear to expose this capability
outside the BMC (e.g. SuperIO). Instead, we are left with BMC-internal
registers for managing these resources, so introduce a devicetree
property for KCS devices to describe SerIRQ properties.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml      | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
index 697ca575454f..4ff6fabfcb30 100644
--- a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
+++ b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
@@ -49,6 +49,18 @@ properties:
       channels the status address is derived from the data address, but the
       status address may be optionally provided.
 
+  aspeed,lpc-interrupts:
+    $ref: "/schemas/types.yaml#/definitions/uint32-array"
+    minItems: 2
+    maxItems: 2
+    description: |
+      A 2-cell property expressing the LPC SerIRQ number and the interrupt
+      level/sense encoding (specified in the standard fashion).
+
+      Note that the generated interrupt is issued from the BMC to the host, and
+      thus the target interrupt controller is not captured by the BMC's
+      devicetree.
+
   kcs_chan:
     deprecated: true
     $ref: '/schemas/types.yaml#/definitions/uint32'
@@ -84,9 +96,11 @@ allOf:
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/irq.h>
     kcs3: kcs@24 {
         compatible = "aspeed,ast2600-kcs-bmc";
         reg = <0x24 0x1>, <0x30 0x1>, <0x3c 0x1>;
         aspeed,lpc-io-reg = <0xca2>;
+        aspeed,lpc-interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
         interrupts = <8>;
     };
-- 
2.27.0

