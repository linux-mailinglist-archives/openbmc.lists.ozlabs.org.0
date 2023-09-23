Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20ACB7AC245
	for <lists+openbmc@lfdr.de>; Sat, 23 Sep 2023 15:32:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=CIA+S3FR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rt96V6zTwz3cRC
	for <lists+openbmc@lfdr.de>; Sat, 23 Sep 2023 23:32:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=CIA+S3FR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.19; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=lists.ozlabs.org)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rt95t51tXz3bxL
	for <openbmc@lists.ozlabs.org>; Sat, 23 Sep 2023 23:31:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
 t=1695475890; x=1696080690; i=j.neuschaefer@gmx.net;
 bh=3aoYsFvHdLQ1zTsKyLP0oEuWvOgGBDuRqueX4hDnnJE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=CIA+S3FR+thMZ7uH+pgX/pEw5WBsU34+4I+QtbASDckhCHPBr1qUqsQGZ6SdXmyyNFhOWYF794y
 XvSA3rT0EiKl0niyMD+BytOQt9bJYDbByGF9wb/PwAFP4rD20NHq91dJ02hpLtNC5SLtNK2xJS+ok
 WIjCGI9lCOg0G9iHdfTaio3NdhuTUlD4LVrDLKf04EFj+j30lpHUqSfNSDCo0HqU1qH8F+Q5sFmql
 24ueQdk2hW8wvmwFWzbExbBZ2ccMI0NvmyuxrAykSMexV5oENlP3AhMDpTmOoXb8mIzGjw4iCKXXe
 rXoemMreUq7kRTOYk//ko1IaKYJvkeTNrt1w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.47.152]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MuUj2-1ra5Lv40zS-00rVKM; Sat, 23
 Sep 2023 15:31:30 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-clk@vger.kernel.org
Subject: [PATCH] clk: npcm7xx: Fix incorrect kfree
Date: Sat, 23 Sep 2023 15:31:27 +0200
Message-Id: <20230923133127.1815621-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MzXEya1jWvyFn/iWbjLkP5u7vhVmzdkIDybc1OE3k9SmipH+0Sc
 B+2k77sBUvNBti61dTU9cnvAhlknCVcwf/ax8fVb9gp2TD9o3V1t4r0Z81vxk2h6QOSIFhg
 EDPuuxp+UvRfydLNtXIGveCAZTVRCoZWywDsdLjLteaHDsVjQdU/4qznli2Ti8ap/5FxfUo
 5Fd1tckxUgzZLNFjP17Jw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:zS98FUfADP8=;roxmjkJ5q3Zw6CKrMQ9ERd4TwhY
 GAFK3mF0uukB7e1ZsfiwObPW+ZaZAsYxIkmOIRFewdrUQsZspz/8QFWfZhXnNYpazItnyQz9C
 xajb+sm/R6JYLy9w6AlDmzupFayK+cDLnApAeOCxqpcNoXE5KOkm3Q/2AuEuJn/3FC3kgKvfS
 H+eNKrFU03zomPo6YcALUIed6QWFmEQ/D5E6s+KERYYqK9CV4PZrPxTgcys+M5DClQxSSvb9m
 AYNhWSxteNc4a/TMAcR4f48OHuP9YLaGhMIIxM8VPqgzpTP+5moF2V+TOmuLY06UT+d4Z/4Fd
 xJw5q6wK1XdaeaMLLpFy+NQ4cwT6gcRZbD59LYF2sxWqxuw4i/gih19X1tU2r0DTeeE0Rnn6B
 fGbUNfxeb3kEN74fThNfGr1svOyqqV7m0d9sF/XLTJoslztiaiCIa9CgyZoXEXd5GK90sGKFU
 MkXPdUmTE7xyad5oUG65bPV5IKLIJzaGdmAkDXXzPMH7hkEIVDMXBkv4oE6Xd9HAzfOAkwKE7
 atxbPEm+HD3+YyTpE5/LrVePP6oe2lBwhjRj0/RPb/PICwzcYaVD9Ds9je6IrCane8pdJd00d
 hnBgxg4IgQl51Bkn17t0lJqJiRblATYWfBpQUQnGyEmad17UKd2u4jVZ3ql89FhQZoHkJia+3
 ulP+UCGLGQLaSCShYWevtujTQf5mpa3JB6k2M5HRZfhPwyZ1YiqsLcSVAlGjbiZJdDb6Ijw1C
 kjcthnZXNqieZbnZcbKPsq5fyGhmiQ73TVMpCIoekBFSWwy47n47HPIA0p9A8rPMm2gxQeFnH
 eslkQGRkt0+bdsOU/RyRWgkg7NMP5tWmzInQbgqFdQ5HOU+pUhVvwnzM+28SKbZWkNJPCJRIF
 mhYc2fVZkUa1KgMo9x7pIV0fstemB0z6rc7rVIrarg5zxbHc/rrTfwvMCE6v0lAty//xUuOIE
 iyx/MNF0WSzZsZzd56ll8Yecj+4=
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Michael Turquette <mturquette@baylibre.com>, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Tali Perry <tali.perry1@gmail.com>, Stephen Boyd <sboyd@kernel.org>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The corresponding allocation is:

> npcm7xx_clk_data =3D kzalloc(struct_size(npcm7xx_clk_data, hws,
> 			     NPCM7XX_NUM_CLOCKS), GFP_KERNEL);

... so, kfree should be applied to npcm7xx_clk_data, not
npcm7xx_clk_data->hws.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 drivers/clk/clk-npcm7xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-npcm7xx.c b/drivers/clk/clk-npcm7xx.c
index e319cfa51a8a3..030186def9c69 100644
=2D-- a/drivers/clk/clk-npcm7xx.c
+++ b/drivers/clk/clk-npcm7xx.c
@@ -510,7 +510,7 @@ static void __init npcm7xx_clk_init(struct device_node=
 *clk_np)
 	return;

 npcm7xx_init_fail:
-	kfree(npcm7xx_clk_data->hws);
+	kfree(npcm7xx_clk_data);
 npcm7xx_init_np_err:
 	iounmap(clk_base);
 npcm7xx_init_error:
=2D-
2.40.1

