Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E22687794A
	for <lists+openbmc@lfdr.de>; Mon, 11 Mar 2024 01:23:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=U0+naqu2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TtHYM0sHQz3d3Q
	for <lists+openbmc@lfdr.de>; Mon, 11 Mar 2024 11:23:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=U0+naqu2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.19; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=lists.ozlabs.org)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TtHWp6b6rz3cLj
	for <openbmc@lists.ozlabs.org>; Mon, 11 Mar 2024 11:21:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1710116478; x=1710721278; i=j.neuschaefer@gmx.net;
	bh=7vtle+VHuBY6t0ucAA0nAPGWrAMPibARvVodmEV/ewI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=U0+naqu22VBavENikeAP+jlWQeRTv1aqnLL9mB0QbkQVSJLrGx81hgf9AMdYz5Cc
	 rwX5AT5IJ1n7rjeLqVBkLy4GxUmiCgxz5d2fj6uzVg87zIlLlJNEkbxauch49By7u
	 N4OW6yG2w2frf+zoQxQ6Gy1MDX7AIRMpgSdQLgvKtA9XnSUh8vXLf0Flq40SlCA92
	 gRSiFqIjMcP2Wj/OdIpmeAyLHzzDQxHMN+yvwjIc0oe8CEqp/xhn8khhjcUhZ6ST6
	 bHv725U516T+ROdaw4Dp7bXm6AAqucESm0gjgjgAGSeiYf8p9lhA3PnYcmyNOGOCs
	 pMgfa47CSUhXHgiUSg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([78.35.216.168]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N9MpS-1qnIF82ES4-015HGJ; Mon, 11
 Mar 2024 01:21:18 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/2] soc: nuvoton: Add "select REGMAP" to WPCM450 SoC driver
Date: Mon, 11 Mar 2024 01:21:00 +0100
Message-ID: <20240311002104.2829298-2-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240311002104.2829298-1-j.neuschaefer@gmx.net>
References: <20240311002104.2829298-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Fm898HXtkh9qFM4PMdffxxzwkcsHvlCnk9FGqZ1wyudJ9oQJAp5
 fL6BQ5LzAgl7dJGoYs4bHhHYpID5xUT5mg8ckLe+k8ubk9M1KR3C9LrrtfA5WSOAU0IeHcG
 XbFIH9HSdg8wua8To9wRvoDCAYcsHwDZFJ1Oc7+puVlvUwOjDaFJxxc96+qjAQPhCPL0MRd
 2DCyHyY+BMIoaRTpVj78w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:SkrLU6WQY/4=;h9Xvce7K7NWKZlOSUSrsS1aHbEb
 udgXA72MxjjRV/NQB/fSNf/Qg/ZKp71+h3TD5orcy9Own02XFsJtbNCMwXnvZ7NPBPkkR7BPb
 9J0XS8SLDTGkypkZeObywhHUFlocbciSEYq+D0dEckFg/x3IVAL6EZkNq/vlEmxed6YzXpsw2
 HjBCuJj0uvSgeEi8WxfxGeFmAGSdPcZPPb4grU1tJXioihTGmkGhNqNDaK067vUCkkRzmTSiO
 riT1uyRiXlz4khRqb92SV0OZxfe9/gUJl7aS89zLgxG8LJWFQWKI5pF1rcy7kR7mWbvReVLoD
 ZPjX2j8TvtAjCgEXxqOStPGLPXqKrKPbqfFjbXV+tckC1gw6YHwKU30Tz7nVMPxTYbHYxLtWN
 N58iJRzjc8Pm5g5V98aPQ4CAJz5MyCfeX9hVqXNQoM7P7jhhVEqHBSnj34xByZfty/JB9pjZb
 wzUU7O1KUbMEB1FGCbhWSsAx0LrR8/N8P82HvyJzT7JfeV6a+I6pN6rPUH2ykYaoIrxZiM9/o
 s29oStPte3xCw1QqwKABE5xMuUL4+2pvP+RG/J4oyZh1sUZhlxkDcTW2U1i1hVfYLyEZasMwW
 AKhO/s1pKgPONn0oXQMQgnaBrjCagz/2B17xEdbHv/HkFzxmHXqW0NrtMS2gikXEwZeJkooOy
 AuWp1/oCTyJR7MY5rCbDzuygJu9HDk+TE0QujZJXnn/VfCxZH+z+B+IkDoifFMVrjSb0zvYJw
 abHvrvm3npcwRZY2d1gqPcvMSJpZmSZYa1zTy57MJnN7XM0U+ha8FAO+6tzBPbxxnIkdKEdpA
 VK2cAUyowcM3pO8W54b/kAbH76Kzz6OMxu0k/2ODPdI14=
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert+renesas@glider.be>, openbmc@lists.ozlabs.org, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Geert Uytterhoeven <geert@linux-m68k.org>, Joel Stanley <joel@jms.id.au>
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
v6:
- no changes

v5:
- Rebase on v6.6-rc2

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
index 853392c8a9151a..2167d3d739d84b 100644
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
2.43.0

