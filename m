Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDC16DFDE0
	for <lists+openbmc@lfdr.de>; Wed, 12 Apr 2023 20:46:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PxWrr1tsxz3f5P
	for <lists+openbmc@lfdr.de>; Thu, 13 Apr 2023 04:46:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=e76GfvWd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.19; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=e76GfvWd;
	dkim-atps=neutral
X-Greylist: delayed 353 seconds by postgrey-1.36 at boromir; Thu, 13 Apr 2023 04:46:01 AEST
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PxWr95n1bz3cMs
	for <openbmc@lists.ozlabs.org>; Thu, 13 Apr 2023 04:46:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1681325152; i=j.neuschaefer@gmx.net;
	bh=e3csk9QDtuoyy0hLFZXVSqs18PWEMHsMdfYpX2DjbKI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=e76GfvWdk0em9To7Aoa3PQjWPqw9aPabqv+r1B9CTW+ChcYY0pcWJlviEZL1MluoT
	 ImCmDvCjJryXfHlBBNkgJcQYFJ3dSgD3+TFJne5GhsSR2uUQGKtArrJwWhvnRhLNoO
	 0YE4YuqDwgdN6aBSty/iYXYr0SgTfhQHfWZr28Nm6Ulme+CBLi5mAWH9aZ+Sqyq3SR
	 cmdVcbRBIhwJP5dW70FiqDQ8cD4dOjefTV7Lrg6SQswbihHvHzL1xZTwaEFvujd6IC
	 g+yA5R+gP/BltsilrSYS49QuMSrfM7tooWilDMAibtcM/NBTrLP2dsDk4pM+oN0qXI
	 LBm28sEtgLZoA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([185.66.193.41]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Md6Qr-1qLRx43G5b-00aH3p; Wed, 12
 Apr 2023 20:38:41 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v3 2/2] soc: nuvoton: Add "select REGMAP" to WPCM450 SoC driver
Date: Wed, 12 Apr 2023 20:38:33 +0200
Message-Id: <20230412183834.3769519-2-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412183834.3769519-1-j.neuschaefer@gmx.net>
References: <20230412183834.3769519-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Sah6L9Z4qPYitnzI9t240ENQHo3+eFI+OoSRtsT2MmfdOy5jjO+
 VP9P4lD3CzwU7l1sYs83RBd/iKKCVbJt1jigQWaDTehB1kGqPC2W1l5Iqw2j+9hUrj0WvSc
 G1t/4bo5bl+yr0Y8kVY9jw4RA1lVPhGsgJPrfVE230KMDFaEE3dRxSC0tTetNCz3ZMVmKqK
 Uq/X2Ibd+/vcjyRE5jeUw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dSjesP8u/Ig=;xP6A8ISy7LtltFpKJNKXzVBGn/H
 QxM1NkIjmCplxy46EnLmkR7Rc01QjE6JRRdoIo+99oaVTrcIbCw/wDONcpScCQu5D8S581KLM
 JQPZgyEYvaYLYtfQNFXULrA6fOfdZWgk7wM1ZGUOQbMlNIS/oj8KZGVTbb7v588yeOA1CXP4r
 Wx2GV5DeVEDZkVV9dc/wfktZ1AszoFTrWLx0AndA/Me3A46g3ZxcD4TIQyTXIuamvCz54G5N0
 4fH/QmKZavuT2g5eAYLnMCTeYGfKRbxN/ahONiWIFJ9vAvqNNxsWkr4AZQsyqIvC0HDLRYRp+
 9Yq2y6X8VTg1Kl9R9EwXtkhKuhyiVP3Cj4RrWWd+LWdl3X7U5CepRkIVbZ2xrE3vVMtGnT8Cf
 KAPL/HHQZp9oClRq9TOcz4vXv0kU6qamlKgzU3NSY4dKqOW4YUjA1epVRayVJNnLceABjPwv2
 JpToZc13y/zLv7DYjx0vUS05ElpPpEhENAmaabvXxeeKvzY5Vi0W80c8yTBr6mrkfLpZadHJU
 aqJ67B0gcMiO+uvGO/uBumN2D+n+3h2n9uIYXNJ4nh7aEGEoyZkkWcDjzAbrLHy68R20feztM
 CRynXAVvcjaiRG3LHW9X7lc1QTd6tZv4/2INhCpxOpHo0U64r4/YQkXLxtIzabLfzvUj99avq
 sPtA1mqC4atnWWbuyQ/m4eITkKOK43eUaYCBcjUthFTQVUyOJ26Cf6gJNbF7+5bCISn0OtjzX
 +cQN3YZescMrHfYK43c+Ox2whJpKWy4Jf5FoI6mdiEM3GCy+q4dU6IJinDZ/dtSRRHpLB6Gkv
 BSKMTh3K+QQ+XALA/f01IO8+BLMyqz00D2Zd4ObaDi8bYo+k95zc9u51PUg1RTWnrNWqSJD++
 IAS4koYLCixAQsEb+yc29HKanthwPzBffK4289v5NQIzHRSMGc7TquCiUjL1Q5VAUyfcontdJ
 9lMkfQ==
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Geert Uytterhoeven <geert@linux-m68k.org>, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Select CONFIG_REGMAP from CONFIG_WPCM450_SOC, because the driver relies
on regmap to work.

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Link: https://lore.kernel.org/lkml/CAMuHMdWo5vHCeE6BeSHrUy12uT7_wFhW-VbQmQ=
5u+4Q8c7-wYQ@mail.gmail.com/
Fixes: 77b8c67b5637 ("soc: nuvoton: Add SoC info driver for WPCM450")
Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
v3:
- Split the commit into two
- Reword the commit messages a bit

v2:
- https://lore.kernel.org/lkml/20230212215234.2608565-1-j.neuschaefer@gmx.=
net/
- Commit message improvements, as suggested by Geert Uytterhoeven.
- Add Link after Reviewed-by, as checkpatch.pl now suggests
=2D--
 drivers/soc/nuvoton/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/nuvoton/Kconfig b/drivers/soc/nuvoton/Kconfig
index 853392c8a9151..2167d3d739d84 100644
=2D-- a/drivers/soc/nuvoton/Kconfig
+++ b/drivers/soc/nuvoton/Kconfig
@@ -6,6 +6,7 @@ config WPCM450_SOC
 	tristate "Nuvoton WPCM450 SoC driver"
 	default y if ARCH_WPCM450
 	select SOC_BUS
+	select REGMAP
 	help
 	  Say Y here to compile the SoC information driver for Nuvoton
 	  WPCM450 SoCs.
=2D-
2.39.2

