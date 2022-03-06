Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A54884CEBE6
	for <lists+openbmc@lfdr.de>; Sun,  6 Mar 2022 15:24:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KBP3L4xMMz3bPJ
	for <lists+openbmc@lfdr.de>; Mon,  7 Mar 2022 01:23:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=gFuohdMi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.22; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=gFuohdMi; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KBP2s38NVz2ymt
 for <openbmc@lists.ozlabs.org>; Mon,  7 Mar 2022 01:23:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1646576597;
 bh=fviFSK5y5Aaq+IIWP/+WE3VsHMV+uByyn72NZHtxZGo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=gFuohdMiQxK092zL861CnVC6HhvUDaFQXDoPR5uoy4b2ltLTxiCWQ8D8CqB0b3D/k
 bhk5v6/IL1S13BeBo3jA5DMR6z1dQ1YO+K2aiTgWa54qRuke3D830VRCnXUe7X/7Xa
 nba8RO7xfwWICGkrxRCqVJVP/uFKnrlgbmgswJpo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([89.0.78.102]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N2mBQ-1o9nuj1CJg-0139Ak; Sun, 06
 Mar 2022 15:23:17 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-spi@vger.kernel.org
Subject: [PATCH] spi: npcm-fiu: Fix typo ("npxm")
Date: Sun,  6 Mar 2022 15:23:12 +0100
Message-Id: <20220306142312.109017-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zRDIEOS8jqLfAJl4QOpA4SuB/spvp9/RlpdN88YIsCOrFgmGdrb
 ZbySwwkT42wTut3PNqASXXlG5Yq07czXCjm2JNUN1tYf1EUIgHL70Lh67dZLphRkmNRupa5
 xijxWZRxen9Tv/OLMfZ95QrsgE+r2V78K35aOA99tIrltg7sOdQhgpN5TOF25kswQm3tVaf
 RynjU6K172AYYubLOAZEg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:oD/RSu1sJY4=:mI9NtcgMTu+ubTueJ7hMFF
 uoyUXKzGDJzDdKfeQI9rRKfpD1LE8ntAX7+t+XQmGgYz8wlN41Z+aId+Kjilf/G7M+pz4D7Er
 3SAyoa8RN8NSU4ndxJhYd7SacLsqBUoK98kfoh5icQjvtk3lW5eVkWE1uwLd1jRBR6f8SCw0a
 pLYQsSlhYgevKtk7zmqyHbAtKbqo6NJATTHqffYe5Oz0sLZ+BoL+TN9+DJCRMAHSCAfVWX/R5
 dWC+CrtU5IxqZTxToJ7xVRRXOjspx9/SZ6zibOgbfrD0XWWPzmhe+y+tFAOD21cErStMckOUA
 3OP384m9Z0rG5eh6DggWT7f/zr5BGDgn7OxJNB2hmdyrZaNW+jfm3vsDKw1lrKi8/Y4YSKCuB
 3gpkj6f/RhbMhvgz5wBbAujsXLEJut/2Mh3JWjIlQChqovV2BDj/xmhtDTDgTNvjtttlM079E
 4+/At1HKSvpm5PCMmpBR8H9/PDEmlXy4s+K4nb0W0TNl36KgZouyqatw9FUB7X6DafoJ+MdIA
 hkCEK92qh+X4i/+CbZrM2RU6oXt3AK5WHRD4Y16DPubBDadcKGu8d8GphNXIyjVLYJEuGerYM
 u/3TnIpIcQJRkCmz5yFSIJPjX/lmhojoc/PRgvx/rB/wU5yPKHCtvJfVPoTzyn9NARAQ4sSGq
 v0yLfZWvxgbvv7TWMIxuS/nTXjbWo0ChyZsyjibc8HrhmmopNL1U+uEt1gCbFWrIZyTshc9AD
 xmzbQJGnNru6Jra4TpEjXZjc+dl2wMNm+bFpOS558DIx+1frX2CBEA7hinRjMtmmuGPdMxpnN
 NIndXSuFbTNTGPVrR+f75b8h5l8HIYrL2K1CeTAf+T8J2DAvF06HM5F0oCGYpb241rx766Ch2
 6jQf7jv2TjmHz4BiWvkpiGOwGFYoRDxYVZx0YCPrXuqnngqeBH2o1R8enQE+leSHwNLStOrLh
 NxZt4oTY74hSQeER9Mlq1LcCxpT9AKfgX9Gs0tIpIdEnJ6MQsKoui2ILJa+lw840M6Pir60yU
 ASsSrFV142sv+TJuZvqRhz+RNbymJRXqTSr7kwWVLP3PWEV8kZpePEdOxZ4KqPEWc2SWE1Tpv
 U9KncsdR7BOtbU=
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Tali Perry <tali.perry1@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The platform is called NPCM, not NPXM.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 drivers/spi/spi-npcm-fiu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-npcm-fiu.c b/drivers/spi/spi-npcm-fiu.c
index b62471ab6d7f2..f11246884df82 100644
=2D-- a/drivers/spi/spi-npcm-fiu.c
+++ b/drivers/spi/spi-npcm-fiu.c
@@ -201,7 +201,7 @@ struct fiu_data {
 	int fiu_max;
 };

-static const struct npcm_fiu_info npxm7xx_fiu_info[] =3D {
+static const struct npcm_fiu_info npcm7xx_fiu_info[] =3D {
 	{.name =3D "FIU0", .fiu_id =3D FIU0,
 		.max_map_size =3D MAP_SIZE_128MB, .max_cs =3D 2},
 	{.name =3D "FIU3", .fiu_id =3D FIU3,
@@ -209,8 +209,8 @@ static const struct npcm_fiu_info npxm7xx_fiu_info[] =
=3D {
 	{.name =3D "FIUX", .fiu_id =3D FIUX,
 		.max_map_size =3D MAP_SIZE_16MB, .max_cs =3D 2} };

-static const struct fiu_data npxm7xx_fiu_data =3D {
-	.npcm_fiu_data_info =3D npxm7xx_fiu_info,
+static const struct fiu_data npcm7xx_fiu_data =3D {
+	.npcm_fiu_data_info =3D npcm7xx_fiu_info,
 	.fiu_max =3D 3,
 };

@@ -664,7 +664,7 @@ static const struct spi_controller_mem_ops npcm_fiu_me=
m_ops =3D {
 };

 static const struct of_device_id npcm_fiu_dt_ids[] =3D {
-	{ .compatible =3D "nuvoton,npcm750-fiu", .data =3D &npxm7xx_fiu_data  },
+	{ .compatible =3D "nuvoton,npcm750-fiu", .data =3D &npcm7xx_fiu_data  },
 	{ /* sentinel */ }
 };

=2D-
2.34.1

