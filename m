Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AE6B7E18
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2019 17:24:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Z0yW1YXlzF3TF
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2019 01:24:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Z0ww6mLPzDrBB
 for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2019 01:23:28 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: joel@jms.id.au
Subject: [PATCH v2 linux dev-5.3 1/4] dt-bindings: lpc: add aspeed-g6
 compatible strings
Date: Thu, 19 Sep 2019 11:23:32 -0400
Message-Id: <20190919152340.23133-2-bradleyb@fuzziesquirrel.com>
In-Reply-To: <20190919152340.23133-1-bradleyb@fuzziesquirrel.com>
References: <20190919152340.23133-1-bradleyb@fuzziesquirrel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

Assume The AST2600 SoCs contain the same LPC devices as the AST2500.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 .../devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.txt   | 3 ++-
 Documentation/devicetree/bindings/mfd/aspeed-lpc.txt      | 8 +++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bm=
c.txt b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.txt
index 028268fd99ee..4b43b7829bd9 100644
--- a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.txt
+++ b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.txt
@@ -1,6 +1,6 @@
 * Aspeed BT (Block Transfer) IPMI interface
=20
-The Aspeed SOCs (AST2400 and AST2500) are commonly used as BMCs
+The Aspeed SOCs (AST2400, AST2500 and AST2600) are commonly used as BMCs
 (BaseBoard Management Controllers) and the BT interface can be used to
 perform in-band IPMI communication with their host.
=20
@@ -9,6 +9,7 @@ Required properties:
 - compatible : should be one of
 	"aspeed,ast2400-ibt-bmc"
 	"aspeed,ast2500-ibt-bmc"
+	"aspeed,ast2600-ibt-bmc"
 - reg: physical address and size of the registers
=20
 Optional properties:
diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt b/Docum=
entation/devicetree/bindings/mfd/aspeed-lpc.txt
index 86446074e206..e1197bab57bb 100644
--- a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
+++ b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
@@ -46,6 +46,7 @@ Required properties
 - compatible:	One of:
 		"aspeed,ast2400-lpc", "simple-mfd"
 		"aspeed,ast2500-lpc", "simple-mfd"
+		"aspeed,ast2600-lpc", "simple-mfd"
=20
 - reg:		contains the physical address and length values of the Aspeed
                 LPC memory region.
@@ -64,6 +65,7 @@ BMC Node
 - compatible:	One of:
 		"aspeed,ast2400-lpc-bmc"
 		"aspeed,ast2500-lpc-bmc"
+		"aspeed,ast2600-lpc-bmc"
=20
 - reg:		contains the physical address and length values of the
                 H8S/2168-compatible LPC controller memory region
@@ -74,6 +76,7 @@ Host Node
 - compatible:   One of:
 		"aspeed,ast2400-lpc-host", "simple-mfd", "syscon"
 		"aspeed,ast2500-lpc-host", "simple-mfd", "syscon"
+		"aspeed,ast2600-lpc-host", "simple-mfd", "syscon"
=20
 - reg:		contains the address and length values of the host-related
                 register space for the Aspeed LPC controller
@@ -128,6 +131,7 @@ Required properties:
 - compatible:	One of:
 		"aspeed,ast2400-lpc-ctrl";
 		"aspeed,ast2500-lpc-ctrl";
+		"aspeed,ast2600-lpc-ctrl";
=20
 - reg:		contains offset/length values of the host interface controller
 		memory regions
@@ -168,6 +172,7 @@ Required properties:
 - compatible:	One of:
 		"aspeed,ast2400-lhc";
 		"aspeed,ast2500-lhc";
+		"aspeed,ast2600-lhc";
=20
 - reg:		contains offset/length values of the LHC memory regions. In the
 		AST2400 and AST2500 there are two regions.
@@ -187,7 +192,8 @@ state of the LPC bus. Some systems may chose to modif=
y this configuration.
=20
 Required properties:
=20
- - compatible:		"aspeed,ast2500-lpc-reset" or
+ - compatible:		"aspeed,ast2600-lpc-reset" or
+			"aspeed,ast2500-lpc-reset"
 			"aspeed,ast2400-lpc-reset"
  - reg:			offset and length of the IP in the LHC memory region
  - #reset-controller	indicates the number of reset cells expected
--=20
2.21.0
