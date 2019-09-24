Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2DCBD31D
	for <lists+openbmc@lfdr.de>; Tue, 24 Sep 2019 21:53:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dBhc1y18zDqHP
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 05:53:52 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dBYZ3DXjzDqZx
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 05:47:45 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: joel@jms.id.au
Subject: [PATCH v3 linux dev-5.3 05/10] reset: simple: Add AST2600
 compatibility string
Date: Tue, 24 Sep 2019 15:47:54 -0400
Message-Id: <20190924194759.26854-6-bradleyb@fuzziesquirrel.com>
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

The AST2600 SoC contains the same LPC register set as the AST2500.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
v3: new for v3
---
 drivers/reset/reset-simple.c | 1 +
 1 file changed, 1 insertion(+)

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
--=20
2.21.0
