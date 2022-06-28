Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FF355E5ED
	for <lists+openbmc@lfdr.de>; Tue, 28 Jun 2022 18:22:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXVHG3PN4z3dq3
	for <lists+openbmc@lfdr.de>; Wed, 29 Jun 2022 02:22:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXVFl5s5hz3btt
	for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2022 02:20:59 +1000 (AEST)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4LXVFl5bMfz4xZ7;
	Wed, 29 Jun 2022 02:20:59 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LXVFj3r7pz4xYL;
	Wed, 29 Jun 2022 02:20:57 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 3/5] spi: dt-bindings: aspeed: Add a ranges property
Date: Tue, 28 Jun 2022 18:20:42 +0200
Message-Id: <20220628162044.1121337-4-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220628162044.1121337-1-clg@kaod.org>
References: <20220628162044.1121337-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, Naresh Solanki <naresh.solanki@9elements.com>, Joel Stanley <joel@jms.id.au>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

"ranges" predefines settings of the decoding ranges for each CS.

Cc: Naresh Solanki <naresh.solanki@9elements.com>
Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 .../devicetree/bindings/spi/aspeed,ast2600-fmc.yaml      | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml b/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
index fa8f4ac20985..bf53b07c64a4 100644
--- a/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
+++ b/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
@@ -38,6 +38,14 @@ properties:
   interrupts:
     maxItems: 1
 
+  ranges:
+    minItems: 1
+    maxItems: 5
+    description: |
+      Defines the address mapping for child devices with four integer
+      values for each chip-select line in use:
+      <cs-number> 0 <physical address of mapping> <size>
+
 required:
   - compatible
   - reg
@@ -58,6 +66,7 @@ examples:
         compatible = "aspeed,ast2600-fmc";
         clocks = <&syscon ASPEED_CLK_AHB>;
         interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+        ranges = <0 0 0x20000000 0x2000000>, <1 0 0x22000000 0x2000000>;
 
         flash@0 {
                 reg = < 0 >;
-- 
2.35.3

