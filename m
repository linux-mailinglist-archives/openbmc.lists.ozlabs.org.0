Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F1DBDE68
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 14:58:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ddR81GV4zDqZb
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 22:58:44 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ddNb2jSSzDqTq
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 22:56:31 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: joel@jms.id.au
Subject: [PATCH v4 linuux dev-5.3 02/10] dt-bindings: ipmi: Add aspeed-g6
 compatible strings
Date: Wed, 25 Sep 2019 08:56:02 -0400
Message-Id: <20190925125610.12096-3-bradleyb@fuzziesquirrel.com>
In-Reply-To: <20190925125610.12096-1-bradleyb@fuzziesquirrel.com>
References: <20190925125610.12096-1-bradleyb@fuzziesquirrel.com>
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
Cc: andrew@aj.id.au, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The AST2600 SoC contains the same IPMI devices (KCS and BT) as the
AST2500.

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
v4: add Andrew's review
v3: new for v3
---
 .../devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.txt    | 3 ++-
 Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt  | 7 ++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

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
diff --git a/Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt b/=
Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt
index d98a9bf45d6c..709c2efb80ef 100644
--- a/Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt
+++ b/Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt
@@ -1,13 +1,14 @@
 * Aspeed KCS (Keyboard Controller Style) IPMI interface
=20
-The Aspeed SOCs (AST2400 and AST2500) are commonly used as BMCs
-(Baseboard Management Controllers) and the KCS interface can be
-used to perform in-band IPMI communication with their host.
+The Aspeed SOCs (AST2400, AST2500 and AST200) are commonly used as BMCs
+(Baseboard Management Controllers) and the KCS interface can be used to
+perform in-band IPMI communication with their host.
=20
 Required properties:
 - compatible : should be one of
     "aspeed,ast2400-kcs-bmc"
     "aspeed,ast2500-kcs-bmc"
+    "aspeed,ast2600-kcs-bmc"
 - interrupts : interrupt generated by the controller
 - kcs_chan : The LPC channel number in the controller
 - kcs_addr : The host CPU IO map address
--=20
2.21.0
