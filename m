Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9249F391C70
	for <lists+openbmc@lfdr.de>; Wed, 26 May 2021 17:52:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqwRy4XQyz2ymD
	for <lists+openbmc@lfdr.de>; Thu, 27 May 2021 01:51:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=MSDRPuzi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::435;
 helo=mail-pf1-x435.google.com; envelope-from=wltu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=MSDRPuzi; dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FqwRk1HWwz2xvb
 for <openbmc@lists.ozlabs.org>; Thu, 27 May 2021 01:51:46 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id d78so1230195pfd.10
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 08:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qikgUAuUnKFivOh0WfK/cu8ZcRJIQJiiSksJPaRovaQ=;
 b=MSDRPuziLweDPaBen2674hgMG1rxtQRZRn8hQ7NpreOI96FXliERihM8V5JLwJH88n
 Yg1cpPpK6a03WbQEJDV3XUdZOshZHht0I4/wstJoSoA8PUvsNYUT6O/UwTL8ICDsVSef
 KfWy2tRuYrU1RHdr+/+nEqismC6R3PEco0T4bPl1yJqEY6Xqpey5yIDIEpSG/H4u7hfe
 D96hhhmDEvGgA2cewmeQnik2YJ0sUFNND+yH8a0O06mNv3HMB9pBF3bpgphUIP7sDWS6
 /QZxswAAWKpcb33AQDHk1daZFWOTTfQlwg+HZpCoMK55Lu33kkrW6UvwqBIDIBdEDvId
 /EXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qikgUAuUnKFivOh0WfK/cu8ZcRJIQJiiSksJPaRovaQ=;
 b=bzeJO/pg9vZVMN+FN6WQ20pvG4kkbJ9uIK5yoGRhPDoijnTQLShA8t2jTlt9+WOPXU
 jWhvO+2MLy6kaNSSL+bwFSYhO9irollhyKJKeOODsmH7c4bz88zZAlwBkdIZ/g3HPq0R
 /CFJyN/L2QnSRb6aTEM8h8a358/wM1XB0/QVNdDTgohkFE0+oKxcqkk/Rg1VOzxfjFam
 cXDNYWWd7qRgurUZule3RoLZ02ewT8T46F1HCcKKCoJ7r3oYQrxamJ+0M1ZRvG4dYzPy
 vFsYd5r7zR89bdrHrqT7cAU3YN4fWwQRIWYmSithazg0W5hxSireEGCVShzqDyi3CutV
 iznA==
X-Gm-Message-State: AOAM5305PaDis87NbbJmgODO0u/r+xCjKqQTuAH+O18Up+PGcwk+CI5F
 OmkNQEHzA68gI8NggMAlVAepsECTfrof4KP9t5Sx+tuyEymJyw==
X-Google-Smtp-Source: ABdhPJy8nwL/kvsbtMRoaW+XORI8ewG/HvWHVFMGT79myEs0XfA0kFkpa1lIzRq1qP4i/2gSj5uin4DeHuegrifkZEE=
X-Received: by 2002:a63:5060:: with SMTP id q32mr25711686pgl.32.1622044302173; 
 Wed, 26 May 2021 08:51:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210413161238.2816187-1-wltu@google.com>
In-Reply-To: <20210413161238.2816187-1-wltu@google.com>
From: Willy Tu <wltu@google.com>
Date: Wed, 26 May 2021 08:51:31 -0700
Message-ID: <CAHwn2X=yDYN7V=ScrnREzAtCNZnAmRn8CzxOp033OR7POkTA5Q@mail.gmail.com>
Subject: Re: [PATCH] board: ast-g4: Enable SGPIO in SCU
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000715f7805c33d9ea9"
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

--000000000000715f7805c33d9ea9
Content-Type: text/plain; charset="UTF-8"

ping.

I also missed the branch for this patch, but this should be in
the v2016.07-aspeed-openbmc u-boot branch.

On Tue, Apr 13, 2021 at 9:12 AM Willy Tu <wltu@google.com> wrote:

> Add option to enable register for SGPIO in SCU
> for ast-g4.
>
> Signed-off-by: Willy Tu <wltu@google.com>
> ---
>  board/aspeed/ast-g4/Kconfig  |  4 ++++
>  board/aspeed/ast-g4/ast-g4.c | 13 +++++++++++++
>  2 files changed, 17 insertions(+)
>
> diff --git a/board/aspeed/ast-g4/Kconfig b/board/aspeed/ast-g4/Kconfig
> index 2bec9a733a..e78030ae34 100644
> --- a/board/aspeed/ast-g4/Kconfig
> +++ b/board/aspeed/ast-g4/Kconfig
> @@ -19,4 +19,8 @@ config SYS_CONFIG_NAME
>         default "ast-g4-phy" if ASPEED_NET_PHY
>         default "ast-g4-ncsi" if ASPEED_NET_NCSI
>
> +config ENABLE_SGPIO
> +    tristate "Enable SGPIO in SCU"
> +       default n
> +
>  endif
> diff --git a/board/aspeed/ast-g4/ast-g4.c b/board/aspeed/ast-g4/ast-g4.c
> index 656495307b..e2463d4524 100644
> --- a/board/aspeed/ast-g4/ast-g4.c
> +++ b/board/aspeed/ast-g4/ast-g4.c
> @@ -22,6 +22,19 @@ int board_init(void)
>         /* address of boot parameters */
>         gd->bd->bi_boot_params = CONFIG_SYS_SDRAM_BASE + 0x100;
>         gd->flags = 0;
> +
> +#ifdef CONFIG_ENABLE_SGPIO
> +       /* Unlock SCU */
> +       writel(SCU_PROTECT_UNLOCK, AST_SCU_BASE);
> +
> +       /* Enable SGPIO Master */
> +       u32 reg = readl(AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL2);
> +       reg |= (SCU_FUN_PIN_SGPMI |
> +                       SCU_FUN_PIN_SGPMO |
> +                       SCU_FUN_PIN_SGPMLD |
> +                       SCU_FUN_PIN_SGPMCK);
> +       writel(reg, AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL2);
> +#endif
>         return 0;
>  }
>
> --
> 2.31.1.295.g9ea45b61b8-goog
>
>

--000000000000715f7805c33d9ea9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping.<div><br></div><div>I also missed the branch for this=
 patch, but this should be in the=C2=A0v2016.07-aspeed-openbmc u-boot branc=
h.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Tue, Apr 13, 2021 at 9:12 AM Willy Tu &lt;<a href=3D"mailto:wltu=
@google.com">wltu@google.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Add option to enable register for SGPIO in SCU<=
br>
for ast-g4.<br>
<br>
Signed-off-by: Willy Tu &lt;<a href=3D"mailto:wltu@google.com" target=3D"_b=
lank">wltu@google.com</a>&gt;<br>
---<br>
=C2=A0board/aspeed/ast-g4/Kconfig=C2=A0 |=C2=A0 4 ++++<br>
=C2=A0board/aspeed/ast-g4/ast-g4.c | 13 +++++++++++++<br>
=C2=A02 files changed, 17 insertions(+)<br>
<br>
diff --git a/board/aspeed/ast-g4/Kconfig b/board/aspeed/ast-g4/Kconfig<br>
index 2bec9a733a..e78030ae34 100644<br>
--- a/board/aspeed/ast-g4/Kconfig<br>
+++ b/board/aspeed/ast-g4/Kconfig<br>
@@ -19,4 +19,8 @@ config SYS_CONFIG_NAME<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 default &quot;ast-g4-phy&quot; if ASPEED_NET_PH=
Y<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 default &quot;ast-g4-ncsi&quot; if ASPEED_NET_N=
CSI<br>
<br>
+config ENABLE_SGPIO<br>
+=C2=A0 =C2=A0 tristate &quot;Enable SGPIO in SCU&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default n<br>
+<br>
=C2=A0endif<br>
diff --git a/board/aspeed/ast-g4/ast-g4.c b/board/aspeed/ast-g4/ast-g4.c<br=
>
index 656495307b..e2463d4524 100644<br>
--- a/board/aspeed/ast-g4/ast-g4.c<br>
+++ b/board/aspeed/ast-g4/ast-g4.c<br>
@@ -22,6 +22,19 @@ int board_init(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* address of boot parameters */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gd-&gt;bd-&gt;bi_boot_params =3D CONFIG_SYS_SDR=
AM_BASE + 0x100;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gd-&gt;flags =3D 0;<br>
+<br>
+#ifdef CONFIG_ENABLE_SGPIO<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Unlock SCU */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(SCU_PROTECT_UNLOCK, AST_SCU_BASE);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Enable SGPIO Master */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reg =3D readl(AST_SCU_BASE + AST_SCU_FUN_PI=
N_CTRL2);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg |=3D (SCU_FUN_PIN_SGPMI |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0SCU_FUN_PIN_SGPMO |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0SCU_FUN_PIN_SGPMLD |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0SCU_FUN_PIN_SGPMCK);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(reg, AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL=
2);<br>
+#endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
=C2=A0}<br>
<br>
--<br>
2.31.1.295.g9ea45b61b8-goog<br>
<br>
</blockquote></div>

--000000000000715f7805c33d9ea9--
