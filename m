Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A77B56D1
	for <lists+openbmc@lfdr.de>; Tue, 17 Sep 2019 22:21:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XvdN2sQJzF3j4
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2019 06:21:12 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XvcV665rzF31X
 for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2019 06:20:25 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 1/3] ARM: aspeed-g6: lpc: add compatible strings
Date: Tue, 17 Sep 2019 16:20:37 -0400
Message-Id: <20190917202039.25266-2-bradleyb@fuzziesquirrel.com>
In-Reply-To: <20190917202039.25266-1-bradleyb@fuzziesquirrel.com>
References: <20190917202039.25266-1-bradleyb@fuzziesquirrel.com>
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
 drivers/char/ipmi/bt-bmc.c                                | 1 +
 drivers/char/ipmi/kcs_bmc_aspeed.c                        | 1 +
 drivers/reset/reset-simple.c                              | 1 +
 drivers/soc/aspeed/aspeed-lpc-ctrl.c                      | 1 +
 drivers/soc/aspeed/aspeed-lpc-snoop.c                     | 2 ++
 7 files changed, 15 insertions(+), 2 deletions(-)

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
diff --git a/drivers/char/ipmi/bt-bmc.c b/drivers/char/ipmi/bt-bmc.c
index 40b9927c072c..0e600449931b 100644
--- a/drivers/char/ipmi/bt-bmc.c
+++ b/drivers/char/ipmi/bt-bmc.c
@@ -513,6 +513,7 @@ static int bt_bmc_remove(struct platform_device *pdev=
)
 static const struct of_device_id bt_bmc_match[] =3D {
 	{ .compatible =3D "aspeed,ast2400-ibt-bmc" },
 	{ .compatible =3D "aspeed,ast2500-ibt-bmc" },
+	{ .compatible =3D "aspeed,ast2600-ibt-bmc" },
 	{ },
 };
=20
diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_b=
mc_aspeed.c
index 3c955946e647..a0a8bb89c9b3 100644
--- a/drivers/char/ipmi/kcs_bmc_aspeed.c
+++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
@@ -301,6 +301,7 @@ static int aspeed_kcs_remove(struct platform_device *=
pdev)
 static const struct of_device_id ast_kcs_bmc_match[] =3D {
 	{ .compatible =3D "aspeed,ast2400-kcs-bmc" },
 	{ .compatible =3D "aspeed,ast2500-kcs-bmc" },
+	{ .compatible =3D "aspeed,ast2600-kcs-bmc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ast_kcs_bmc_match);
diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
index 1154f7b1f4dd..2fe9c889a75a 100644
--- a/drivers/reset/reset-simple.c
+++ b/drivers/reset/reset-simple.c
@@ -125,6 +125,7 @@ static const struct of_device_id reset_simple_dt_ids[=
] =3D {
 		.data =3D &reset_simple_active_low },
 	{ .compatible =3D "aspeed,ast2400-lpc-reset" },
 	{ .compatible =3D "aspeed,ast2500-lpc-reset" },
+	{ .compatible =3D "aspeed,ast2600-lpc-reset" },
 	{ .compatible =3D "bitmain,bm1880-reset",
 		.data =3D &reset_simple_active_low },
 	{ /* sentinel */ },
diff --git a/drivers/soc/aspeed/aspeed-lpc-ctrl.c b/drivers/soc/aspeed/as=
peed-lpc-ctrl.c
index 01ed21e8bfee..12e4421dee37 100644
--- a/drivers/soc/aspeed/aspeed-lpc-ctrl.c
+++ b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
@@ -291,6 +291,7 @@ static int aspeed_lpc_ctrl_remove(struct platform_dev=
ice *pdev)
 static const struct of_device_id aspeed_lpc_ctrl_match[] =3D {
 	{ .compatible =3D "aspeed,ast2400-lpc-ctrl" },
 	{ .compatible =3D "aspeed,ast2500-lpc-ctrl" },
+	{ .compatible =3D "aspeed,ast2600-lpc-ctrl" },
 	{ },
 };
=20
diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/a=
speed-lpc-snoop.c
index 48f7ac238861..c7b4ac066b40 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -325,6 +325,8 @@ static const struct of_device_id aspeed_lpc_snoop_mat=
ch[] =3D {
 	  .data =3D &ast2400_model_data },
 	{ .compatible =3D "aspeed,ast2500-lpc-snoop",
 	  .data =3D &ast2500_model_data },
+	{ .compatible =3D "aspeed,ast2600-lpc-snoop",
+	  .data =3D &ast2500_model_data },
 	{ },
 };
=20
--=20
2.21.0
