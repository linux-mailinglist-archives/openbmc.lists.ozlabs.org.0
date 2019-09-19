Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A09A6B7E4B
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2019 17:36:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Z1Cr2PV5zF56R
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2019 01:36:24 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Z0x341w7zDrPp
 for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2019 01:23:35 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: joel@jms.id.au
Subject: [PATCH v2 linux dev-5.3 2/4] ARM: aspeed-g6: lpc: add compatible
 strings
Date: Thu, 19 Sep 2019 11:23:38 -0400
Message-Id: <20190919152340.23133-8-bradleyb@fuzziesquirrel.com>
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

Assume the AST2600 SoC contains the same LPC devices as the AST2500.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
v2:
  - removed DT binding documentation changes
---
 drivers/char/ipmi/bt-bmc.c            | 1 +
 drivers/char/ipmi/kcs_bmc_aspeed.c    | 1 +
 drivers/reset/reset-simple.c          | 1 +
 drivers/soc/aspeed/aspeed-lpc-ctrl.c  | 1 +
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 2 ++
 5 files changed, 6 insertions(+)

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
