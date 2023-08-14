Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC8977BF28
	for <lists+openbmc@lfdr.de>; Mon, 14 Aug 2023 19:40:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=RXOiznYs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RPhWT19hPz3cN7
	for <lists+openbmc@lfdr.de>; Tue, 15 Aug 2023 03:40:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=RXOiznYs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.17.22; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=lists.ozlabs.org)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RPhT76Zq0z3cNH
	for <openbmc@lists.ozlabs.org>; Tue, 15 Aug 2023 03:38:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=s31663417; t=1692034685; x=1692639485; i=j.neuschaefer@gmx.net;
 bh=VT7XpQTEvPwv34StMvAbbUdyqgucsQ7LtJt/JXIuw1c=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=RXOiznYs963GfNlv50MVzgeBZg2vghZwAGJt7MSd7hRagmzlPaV1zWWx0SX2kyvkPl37Ya3
 tK9zYV2u65wiCwgoybK2ohm/oXp6eBej8hY4tm5HbGaganQXW0qLbR/o1/dEJdGDgY0vu/wR5
 FT9JT50LnktOZy6FDN4q0x6CBIdo7B3m6eo+Qt76P2Q59b6p/iAmW81z7XE6IxGrrE9V0uH2P
 vn4gfXW23CClKvvqshPy/mZ9LWNXrehPPvcE+lKrIwVCMqc7K0QgDw+99voeFr1lqKZS9rX3R
 QCs+hQeEjAAdxQEakEcNLL8Syk5BBTwpuvpVrTpWl8XxnijshF4A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([151.216.154.44]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mf078-1ppQ07352Y-00gUtr; Mon, 14
 Aug 2023 19:38:05 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v4 2/2] soc: nuvoton: Add "select REGMAP" to WPCM450 SoC driver
Date: Mon, 14 Aug 2023 19:37:56 +0200
Message-Id: <20230814173757.1747439-2-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230814173757.1747439-1-j.neuschaefer@gmx.net>
References: <20230814173757.1747439-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:REPYzm01i+UIbajMDjc9lKz60SR5oQH/gdKGfw7cPXhSmRHFYt7
 Gvp/zkjFCjme/0CRPXldOcC0CzaRDc68lN7LlyBWib6IhjWJYrwvQY8Pox7s8VIpP2bfBWl
 G/e17lpZAt6Kj6975hZMcwICYyN8ynXLTXn2JCiuiQoqcbz4qjAspVVswL6ACsJaKqOEFW1
 SRpCFWaAjxKIgmz8adyQQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:HSkiHSA1NtI=;R/dI7eWFgJeO3oGQD+l1rgdxb/X
 /ewvzpiY9eSH57Tc5wcpY42sknpVOXXX/Z/AxY02UVhBWE1Sq36zX+5i625ANNl5Xf20X1Fef
 7eb7cdErPlvxKLeh/zCAxG/Nhy+RU9Iit+00hFG08pOf0lOqyvNBhyRsCpHvxEYsw/Qqmoni/
 vpTW/8sEOMqUvGc8Fa6Q+iR+JQyKsGgKa5ynZSBBpdAwZ1R4hJJvt3WEodoa95vy9pA2ReWKy
 40Aqfa1VeWcWFz7xdB1qpkndo8ZQ2QB05uwVu4VT/D20pkGaaIxdx2Gz9w/lssf0EgSqIM4FQ
 XuJd8x4x+dyrB6hqIepUTnwvmpTy7yjCclu8wrLvnVI0bCeTyLdFCbOCPlXJpKcxMYFRUjLbY
 CqORpEAWuo6nI8jxjuKeyArcOJJcO908trvZhFBeUs2WugS+dJIgmAhLKZmrCNguWmpvVvqUY
 vqwIK6vSwYNMwAev0IDehc9tBaArubyIRdE8TWGnOO9AueYFdF5WACtjbImmpbubx/BnIyhEj
 Si//sTrivrDNDGPx5mR+f9ExeyigjeHLMaKN9bLCW2j6Ta3JpZT1oqmIaDtRaU6+jRhmwr3Fr
 lzNj2w2NuGLu7fKN4r7olzoVw0JeOSlMVU/qEUfnqOMp9NiFfwD8IU35mYF4PQxX6UkCvAunY
 oqVnAUDXGuTLQ6lo94V2U23rfe+ni663FQICk/Dav/fOUtgjZeWLXoN9fX+A0WvvERA98TOvM
 8CYJvCoF4qh0S/KkSuu7G2GfhlBsJAk8jAIzAeZjy5XQb9woN7uQSNmam7f9Zema7fec37DOw
 qokcbDuZc8l7/A0QxkgWN8xZrghJEFIgLFIj+q6jgYgDpkro894MS6FGrNd0WY0sYBiXKi8ii
 thYqJ5qAt/7cR0BnffiVUx6IlEd15OWUFcjzU4UKl5q/CTstCSzfcqeT63kfaNhWhEpk4whCI
 uQwyze1FmEwFKq8i2NfGLXqn+2w=
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Geert Uytterhoeven <geert@linux-m68k.org>, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Select CONFIG_REGMAP from CONFIG_WPCM450_SOC, because the driver relies
on regmap to work.

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Closes: https://lore.kernel.org/lkml/CAMuHMdWo5vHCeE6BeSHrUy12uT7_wFhW-VbQ=
mQ5u+4Q8c7-wYQ@mail.gmail.com/
Fixes: 7dbb4a38bff3 ("soc: nuvoton: Add SoC info driver for WPCM450")
Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
=2D--
v4:
- Add Geert's R-b tag
- Fix commit reference
- Change Link tag to Closes

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
2.40.1

