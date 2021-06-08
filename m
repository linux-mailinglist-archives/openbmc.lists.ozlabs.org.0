Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5025839F45B
	for <lists+openbmc@lfdr.de>; Tue,  8 Jun 2021 12:55:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FznG95MHSz3c14
	for <lists+openbmc@lfdr.de>; Tue,  8 Jun 2021 20:55:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=NKabqIOH;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=XL8ViDzX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=NKabqIOH; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=XL8ViDzX; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fzn7P5mHnz306H;
 Tue,  8 Jun 2021 20:49:53 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 276F258064A;
 Tue,  8 Jun 2021 06:49:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 08 Jun 2021 06:49:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=xmq7D+S2va/eh
 AxAbfkD2fqxiitkymAU7PzywDjgwkY=; b=NKabqIOHdDe+LyZnJzHPfHIEVnh75
 5jX0yzkG2eeTf/391Ryr1OapduqTUGyOlpeLZgfm+MCj1D4t0Je1hlEWUPUYW+zr
 KFDZmbT/dsDvPzevmwPB1o3ZuJnSWTYWX81aQgP1AfXfqcCOBDmH7iRU/kU008Sq
 PRfF71wua2JKCssTDWfVHMjg2wN1OFYelq1GmQBw6wJ+wHSqyX+OD+XHGiNF2Oei
 w64NbjnlAdjSbmyFmwjgtQQeu0Tc1g7E8E/jgTrOuOMkRrZeUu7xRx1HHQxrK8+k
 v8q8F449SGZ5d2vdYEjg1Nl3wyBvD7CgeFdJHH6NA6ZhD01K02uTmsZmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=xmq7D+S2va/ehAxAbfkD2fqxiitkymAU7PzywDjgwkY=; b=XL8ViDzX
 FrPqH90t/NwS67cHWglKGyXT+yhqTIUodZCI+nDA49AYJnYeZgfXvKMpNHlI4lRb
 AbBRm34wrnpgdHzGHzTLF7dpUzzyflwaVXPUP/XyPZSgsKiKrvEw3pkV22nZ8yyC
 QpcwqBV18TpCIbtv490YVf0wUtcc6ZmnZsunj39XeWtyTAoYxGtxfsnJQx02nTK5
 fh6XvDQdgndAIGixMtwYjuZv7mGEekyOcsYcbunUaWWSMcBAyABTVwFrQt/WBXJ/
 wga2i9BikiwOqRilQpg/Yt7AELjqX45EcGf/2ez0X3bEDhjTTVKrp9qpgiWpxHJ/
 y9jHoM0iNbnxxA==
X-ME-Sender: <xms:TUu_YK34TL8duHafZY2TGLcB5SdhRCtfrj6LiVEeRywMSi0nAJ5lig>
 <xme:TUu_YNFroyiaHs3tU3hJ1Yu-M7VjzIYUH1TF5XufNh4bKZTbIwTH4DG3qlq83cjXP
 NgjgLuCmdvqP93LxA>
X-ME-Received: <xmr:TUu_YC4Gf7r6XdwcZJm0hLArcQhVt9XMQ89Le_GcY7IwxW_QOdfLj0NzlP8l_Oxsy_Oi0gLfqAmbDFrKMNDbrfFKAamd1XR3LII>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtledgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhgurhgv
 ficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrghtth
 gvrhhnpeejgfdvveehteekveeggeellefgleetteejffelffdvudduveeiffegteelvefh
 teenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnh
 gurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:TUu_YL1h7mK0utFZ-6tWgH84onJY0XO7Wz5ljUjHhmrr-iAfX2SNUQ>
 <xmx:TUu_YNEvz4dDY4u2_fF7Uh2UdhkdypDgU31ZI4vU0B9SN14ByXC4Cg>
 <xmx:TUu_YE--v8u5ge1uCe9-ui0Lzz1jhNq6xAIie-Gvho3eG8YC5MXVvg>
 <xmx:T0u_YGJ_L5FJ1ZvesWGcK4DRT4jRsNRlPyEMcXvIm2UIzrXhPQgXGw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Jun 2021 06:49:43 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
 minyard@acm.org
Subject: [PATCH v4 13/16] dt-bindings: ipmi: Add optional SerIRQ property to
 ASPEED KCS devices
Date: Tue,  8 Jun 2021 20:17:54 +0930
Message-Id: <20210608104757.582199-14-andrew@aj.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210608104757.582199-1-andrew@aj.id.au>
References: <20210608104757.582199-1-andrew@aj.id.au>
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
 linux-aspeed@lists.ozlabs.org, KWLIU@nuvoton.com, avifishman70@gmail.com,
 venture@google.com, chiawei_wang@aspeedtech.com, linux-kernel@vger.kernel.org,
 tali.perry1@gmail.com, robh+dt@kernel.org, arnd@arndb.de, zweiss@equinix.com,
 Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org,
 benjaminfair@google.com
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
2.30.2

