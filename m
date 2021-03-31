Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C3A350985
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 23:31:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9fdb1Sgkz304G
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 08:31:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=Exbth5P8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::529;
 helo=mail-pg1-x529.google.com; envelope-from=wltu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Exbth5P8; dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9fdL431zz2yZD
 for <openbmc@lists.ozlabs.org>; Thu,  1 Apr 2021 08:31:15 +1100 (AEDT)
Received: by mail-pg1-x529.google.com with SMTP id f3so253830pgv.0
 for <openbmc@lists.ozlabs.org>; Wed, 31 Mar 2021 14:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=1MP5a48xpkRGPUBVlLPtPht3q4rFNCKkab/ZSnjqc/E=;
 b=Exbth5P8Ua3RPDy3iEYY+30KjoaQTVhXs7Z6j8AxrAcurGsnCTdQrc8H0H/naMxaQ6
 S9mGS7cFu+jJNxHPVw1wgJFIkhuHGIhc5uE/Ggj4j+RZtLzw6S3VevMbZR6zdjb0z2zc
 LFhRdfVgEpVAtlc4XARZZX6ocyxOJtGBAUAcBr0c7U9QtuUvAXYYq0hG+pdJk/bPtU01
 5M8ZK4oeghAyoh2fTbX9AhtqZDhsB+UZzYgZIc5fcXLHby15wG5J2v/xqPLzZWe/v+wF
 hTU5weftuTg44//6UhlW79yPUl7dEet5cW2L2WOldJ4BGlRRB4fw/Bbx0X+22yg9pmwy
 058w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=1MP5a48xpkRGPUBVlLPtPht3q4rFNCKkab/ZSnjqc/E=;
 b=bIZsPZ2vjaUBQgOAwPHlig92Uwkjvf01pRSBgz1pCqrGXILvmKZwb7xZOLBPuJMxvk
 duvnNmlx4iYzTzh3ykgcRkIEN8aMPMNK/UnOiUq0DP1MNotDAr69UJ2SbtQigUeBreD3
 4fFNx+bvtrT/gtnf2+ZnB5UDG1Buj3CgoUcso9BC9O/16hCiKNQnyQpIIoOYxGrGSXjt
 6Xw1KjMAYhtA2tIqY++lU7Us9/KTtgS3Q9w/ZxcGcKPRd64dmKRJu4NQLps8Nj8Am1El
 v73mM/yuwheR0y+fC7PYHmfNBnADeW5jIJ/SVHjAAG8/ehktuc2yfwzK4pQElRfuEpA2
 07yA==
X-Gm-Message-State: AOAM533YfD0yU7jQqnQvgXK41fe/tjdcpnkWZyEz5PD9ELghYz0Ctr1z
 SWi+UC6XClE/cXqjEDHVrvUMSlA/SCO3Mve279ptk+S2qml1lw==
X-Google-Smtp-Source: ABdhPJxCEsL5zR3pv0coWoPytUTy3VnFDyCO3QWkVps/ZAzhaR6xDjTS/KssYrJr5Qp6mgzYSXaDJ1U40lfFkKshKtk=
X-Received: by 2002:a65:4083:: with SMTP id t3mr4872422pgp.150.1617226271900; 
 Wed, 31 Mar 2021 14:31:11 -0700 (PDT)
MIME-Version: 1.0
From: Willy Tu <wltu@google.com>
Date: Wed, 31 Mar 2021 14:31:00 -0700
Message-ID: <CAHwn2X=HadjAgzSOnn6JztYLwFe7bd4c38BKb63dxXu2SonZ=Q@mail.gmail.com>
Subject: [PATCH u-boot v2016.07-aspeed-openbmc] board: aspeed: Enable SGPIO in
 SCU
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000075be8105bedbd55a"
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
Cc: Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000075be8105bedbd55a
Content-Type: text/plain; charset="UTF-8"

From a2d7336bb59df8f2ef622d4369fc035b2aafd74c Mon Sep 17 00:00:00 2001
From: Willy Tu <wltu@google.com>
Date: Mon, 22 Mar 2021 17:01:56 -0700
Subject: [PATCH] board: aspeed: Enable SGPIO in SCU

Add option to enable register for SGPIO in SCU

Signed-off-by: Willy Tu <wltu@google.com>
---
 board/aspeed/ast-g4/Kconfig  |  4 ++++
 board/aspeed/ast-g4/ast-g4.c | 13 +++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/board/aspeed/ast-g4/Kconfig b/board/aspeed/ast-g4/Kconfig
index 2bec9a733a..e78030ae34 100644
--- a/board/aspeed/ast-g4/Kconfig
+++ b/board/aspeed/ast-g4/Kconfig
@@ -19,4 +19,8 @@ config SYS_CONFIG_NAME
  default "ast-g4-phy" if ASPEED_NET_PHY
  default "ast-g4-ncsi" if ASPEED_NET_NCSI

+config ENABLE_SGPIO
+    tristate "Enable SGPIO in SCU"
+ default n
+
 endif
diff --git a/board/aspeed/ast-g4/ast-g4.c b/board/aspeed/ast-g4/ast-g4.c
index 656495307b..e2463d4524 100644
--- a/board/aspeed/ast-g4/ast-g4.c
+++ b/board/aspeed/ast-g4/ast-g4.c
@@ -22,6 +22,19 @@ int board_init(void)
  /* address of boot parameters */
  gd->bd->bi_boot_params = CONFIG_SYS_SDRAM_BASE + 0x100;
  gd->flags = 0;
+
+#ifdef CONFIG_ENABLE_SGPIO
+ /* Unlock SCU */
+ writel(SCU_PROTECT_UNLOCK, AST_SCU_BASE);
+
+ /* Enable SGPIO Master */
+ u32 reg = readl(AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL2);
+ reg |= (SCU_FUN_PIN_SGPMI |
+ SCU_FUN_PIN_SGPMO |
+ SCU_FUN_PIN_SGPMLD |
+ SCU_FUN_PIN_SGPMCK);
+ writel(reg, AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL2);
+#endif
  return 0;
 }

-- 
2.31.0.208.g409f899ff0-goog

--00000000000075be8105bedbd55a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">From a2d7336bb59df8f2ef622d4369fc035b2aafd74c Mon Sep 17 0=
0:00:00 2001<br>From: Willy Tu &lt;<a href=3D"mailto:wltu@google.com">wltu@=
google.com</a>&gt;<br>Date: Mon, 22 Mar 2021 17:01:56 -0700<br>Subject: [PA=
TCH] board: aspeed: Enable SGPIO in SCU<br><br>Add option to enable registe=
r for SGPIO in SCU<br><br>Signed-off-by: Willy Tu &lt;<a href=3D"mailto:wlt=
u@google.com">wltu@google.com</a>&gt;<div>---<br>=C2=A0board/aspeed/ast-g4/=
Kconfig =C2=A0| =C2=A04 ++++<br>=C2=A0board/aspeed/ast-g4/ast-g4.c | 13 +++=
++++++++++<br>=C2=A02 files changed, 17 insertions(+)<br><br>diff --git a/b=
oard/aspeed/ast-g4/Kconfig b/board/aspeed/ast-g4/Kconfig<br>index 2bec9a733=
a..e78030ae34 100644<br>--- a/board/aspeed/ast-g4/Kconfig<br>+++ b/board/as=
peed/ast-g4/Kconfig<br>@@ -19,4 +19,8 @@ config SYS_CONFIG_NAME<br>=C2=A0	d=
efault &quot;ast-g4-phy&quot; if ASPEED_NET_PHY<br>=C2=A0	default &quot;ast=
-g4-ncsi&quot; if ASPEED_NET_NCSI<br>=C2=A0<br>+config ENABLE_SGPIO<br>+ =
=C2=A0 =C2=A0tristate &quot;Enable SGPIO in SCU&quot;<br>+	default n<br>+<b=
r>=C2=A0endif<br>diff --git a/board/aspeed/ast-g4/ast-g4.c b/board/aspeed/a=
st-g4/ast-g4.c<br>index 656495307b..e2463d4524 100644<br>--- a/board/aspeed=
/ast-g4/ast-g4.c<br>+++ b/board/aspeed/ast-g4/ast-g4.c<br>@@ -22,6 +22,19 @=
@ int board_init(void)<br>=C2=A0	/* address of boot parameters */<br>=C2=A0=
	gd-&gt;bd-&gt;bi_boot_params =3D CONFIG_SYS_SDRAM_BASE + 0x100;<br>=C2=A0	=
gd-&gt;flags =3D 0;<br>+<br>+#ifdef CONFIG_ENABLE_SGPIO<br>+	/* Unlock SCU =
*/<br>+	writel(SCU_PROTECT_UNLOCK, AST_SCU_BASE);<br>+<br>+	/* Enable SGPIO=
 Master */<br>+	u32 reg =3D readl(AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL2);<br=
>+	reg |=3D (SCU_FUN_PIN_SGPMI |<br>+			SCU_FUN_PIN_SGPMO |<br>+			SCU_FUN_=
PIN_SGPMLD |<br>+			SCU_FUN_PIN_SGPMCK);<br>+	writel(reg, AST_SCU_BASE + AS=
T_SCU_FUN_PIN_CTRL2);<br>+#endif<br>=C2=A0	return 0;<br>=C2=A0}<br>=C2=A0<b=
r>-- <br>2.31.0.208.g409f899ff0-goog<br><br></div></div>

--00000000000075be8105bedbd55a--
