Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E34FBD312
	for <lists+openbmc@lfdr.de>; Tue, 24 Sep 2019 21:51:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dBfH55jdzDqTK
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 05:51:51 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dBYW5wYvzDqZx
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 05:47:43 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: joel@jms.id.au
Subject: [PATCH v3 linux dev-5.3 03/10] soc: aspeed: lpc: Add G6 compatible
 strings
Date: Tue, 24 Sep 2019 15:47:52 -0400
Message-Id: <20190924194759.26854-4-bradleyb@fuzziesquirrel.com>
In-Reply-To: <20190924194759.26854-1-bradleyb@fuzziesquirrel.com>
References: <20190924194759.26854-1-bradleyb@fuzziesquirrel.com>
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

The AST2600(G6) has the same lpc-ctrl and lpc-snoop devices as the
AST2500.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
v3:
  - move ipmi, reset to a separate patch
v2:
  - removed DT binding documentation changes
---
 drivers/soc/aspeed/aspeed-lpc-ctrl.c  | 1 +
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 2 ++
 2 files changed, 3 insertions(+)

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
