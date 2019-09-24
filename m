Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0C9BD315
	for <lists+openbmc@lfdr.de>; Tue, 24 Sep 2019 21:52:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dBgN08g4zDqPW
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 05:52:48 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dBYY0JNWzDqZx
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 05:47:44 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: joel@jms.id.au
Subject: [PATCH v3 linux dev-5.3 04/10] ipmi: aspeed-g6: Add compatible strings
Date: Tue, 24 Sep 2019 15:47:53 -0400
Message-Id: <20190924194759.26854-5-bradleyb@fuzziesquirrel.com>
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

The AST2600 SoC contains the same IPMI (BT/KCS) devices as the AST2500.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
v3: new for v3
---
 drivers/char/ipmi/bt-bmc.c         | 1 +
 drivers/char/ipmi/kcs_bmc_aspeed.c | 1 +
 2 files changed, 2 insertions(+)

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
--=20
2.21.0
