Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C4E35098B
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 23:33:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9fgf12DDz30CH
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 08:33:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=vqcR/JfZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=wltu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=vqcR/JfZ; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9fgP6CGjz2yxj
 for <openbmc@lists.ozlabs.org>; Thu,  1 Apr 2021 08:33:05 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id gb6so10227543pjb.0
 for <openbmc@lists.ozlabs.org>; Wed, 31 Mar 2021 14:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P2RE7d+Nn5ZhsymVoNxxZFF1F/+Pvj6PhqKp7JubtH8=;
 b=vqcR/JfZtlXc12OpTILDjNnsPSWrvvR0o9n4DHLUnp9BrEgiACmbBTCrt2KoUMDfmv
 mXOPau3Szog/JDiwttqr6GIB1Bf2jUOfqy27fvGO32tLRkGhztU5Ps7ufmdfwRTYKnCe
 5+J/Ai5dcqWv+Cv7xbcifkCCyGGjRbcpg8uBrMuLKxj6GNkowkbSVBOiVbUzfEnGjTXH
 C7AM2+NDEtNhf12TFEdGwjb+Dh04x/uuecqusb8+OVXno9kqYAsyTqZyjGEeKcDhlYzt
 npcaFdsyOXVNy64GwyBn904cedE6qwstXguzCOL9FT7YtASZWq5WNfOvzHTpVfP8AFqe
 jdUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P2RE7d+Nn5ZhsymVoNxxZFF1F/+Pvj6PhqKp7JubtH8=;
 b=cDixKlyWdsK9Ye00o/VjhTxU6u6QdbheYSWlOmpymYXYcJr5bDQrNpAYOoo/Ltu9vL
 od0NSj9wlgxTZVphnDMdWfjFIb2QuZu1kjvsp41EKbqPZ65VM8ci0KVblX074Re6xZ5H
 eD1fSaiiD7toXfyFTSk8Le0tMws6vjAcuCbjQl4pAuztqDyOKmOlSe5CCvs3qN6yTo4p
 TQr3IPpwBANB5Yaut6Vs8epaMXbCfSDBLL0jRqRTfigKJCVd/e1BbmliezU2YepdVQQG
 j7f0JHiF7oxXpRmM/o8xGS6GM3bEo78FT/BewWHZcUgJ+9mWzluR6wZ5KPD4CGqryqM5
 wFZQ==
X-Gm-Message-State: AOAM532B5J4VYAxpIWD7kJjMUA88ogFXrwzpGJD/lIPvWKbz4FkpnBa2
 tVReq9+yfbRnggkxvHtAuJt7dZFpSjsZOQn3+s8I+kH3vIh0uQ==
X-Google-Smtp-Source: ABdhPJzmpiadP65ryaKdSz9OMKJ5f0mPDg6BSYs+U86cU6w9zuHBt5NGCKEBEtdqHsSdqJmHne8NzxG4m3E1R0+Pc30=
X-Received: by 2002:a17:90a:c289:: with SMTP id
 f9mr5445855pjt.105.1617226382111; 
 Wed, 31 Mar 2021 14:33:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAHwn2X=HadjAgzSOnn6JztYLwFe7bd4c38BKb63dxXu2SonZ=Q@mail.gmail.com>
In-Reply-To: <CAHwn2X=HadjAgzSOnn6JztYLwFe7bd4c38BKb63dxXu2SonZ=Q@mail.gmail.com>
From: Willy Tu <wltu@google.com>
Date: Wed, 31 Mar 2021 14:32:50 -0700
Message-ID: <CAHwn2XmVxCWzpvO1AMKT44KCbH7OZE38K0kDosV1kvYw0boR_A@mail.gmail.com>
Subject: Re: [PATCH u-boot v2016.07-aspeed-openbmc] board: aspeed: Enable
 SGPIO in SCU
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000000761fe05bedbdc3e"
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

--0000000000000761fe05bedbdc3e
Content-Type: text/plain; charset="UTF-8"

I am not exactly sure if this is the way to send the patch for u-boot. But
I am trying to update a patch for
https://github.com/openbmc/u-boot/tree/v2016.07-aspeed-openbmc.

It just gives the options to have the u-boot enable the SGPIO registers for
SCU.

Please take a look.

Best,

Willy Tu

On Wed, Mar 31, 2021 at 2:31 PM Willy Tu <wltu@google.com> wrote:

> From a2d7336bb59df8f2ef622d4369fc035b2aafd74c Mon Sep 17 00:00:00 2001
> From: Willy Tu <wltu@google.com>
> Date: Mon, 22 Mar 2021 17:01:56 -0700
> Subject: [PATCH] board: aspeed: Enable SGPIO in SCU
>
> Add option to enable register for SGPIO in SCU
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
>   default "ast-g4-phy" if ASPEED_NET_PHY
>   default "ast-g4-ncsi" if ASPEED_NET_NCSI
>
> +config ENABLE_SGPIO
> +    tristate "Enable SGPIO in SCU"
> + default n
> +
>  endif
> diff --git a/board/aspeed/ast-g4/ast-g4.c b/board/aspeed/ast-g4/ast-g4.c
> index 656495307b..e2463d4524 100644
> --- a/board/aspeed/ast-g4/ast-g4.c
> +++ b/board/aspeed/ast-g4/ast-g4.c
> @@ -22,6 +22,19 @@ int board_init(void)
>   /* address of boot parameters */
>   gd->bd->bi_boot_params = CONFIG_SYS_SDRAM_BASE + 0x100;
>   gd->flags = 0;
> +
> +#ifdef CONFIG_ENABLE_SGPIO
> + /* Unlock SCU */
> + writel(SCU_PROTECT_UNLOCK, AST_SCU_BASE);
> +
> + /* Enable SGPIO Master */
> + u32 reg = readl(AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL2);
> + reg |= (SCU_FUN_PIN_SGPMI |
> + SCU_FUN_PIN_SGPMO |
> + SCU_FUN_PIN_SGPMLD |
> + SCU_FUN_PIN_SGPMCK);
> + writel(reg, AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL2);
> +#endif
>   return 0;
>  }
>
> --
> 2.31.0.208.g409f899ff0-goog
>
>

--0000000000000761fe05bedbdc3e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I am not exactly sure if this is the way to send the patch=
 for u-boot. But I am trying to update a patch for=C2=A0<a href=3D"https://=
github.com/openbmc/u-boot/tree/v2016.07-aspeed-openbmc">https://github.com/=
openbmc/u-boot/tree/v2016.07-aspeed-openbmc</a>.<div><br></div><div>It just=
 gives the options to have the u-boot enable the SGPIO registers for SCU.</=
div><div><br></div><div>Please take a look.</div><div><br></div><div>Best,<=
/div><div><br></div><div>Willy Tu</div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 31, 2021 at 2:31 PM Will=
y Tu &lt;<a href=3D"mailto:wltu@google.com">wltu@google.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"=
>From a2d7336bb59df8f2ef622d4369fc035b2aafd74c Mon Sep 17 00:00:00 2001<br>=
From: Willy Tu &lt;<a href=3D"mailto:wltu@google.com" target=3D"_blank">wlt=
u@google.com</a>&gt;<br>Date: Mon, 22 Mar 2021 17:01:56 -0700<br>Subject: [=
PATCH] board: aspeed: Enable SGPIO in SCU<br><br>Add option to enable regis=
ter for SGPIO in SCU<br><br>Signed-off-by: Willy Tu &lt;<a href=3D"mailto:w=
ltu@google.com" target=3D"_blank">wltu@google.com</a>&gt;<div>---<br>=C2=A0=
board/aspeed/ast-g4/Kconfig =C2=A0| =C2=A04 ++++<br>=C2=A0board/aspeed/ast-=
g4/ast-g4.c | 13 +++++++++++++<br>=C2=A02 files changed, 17 insertions(+)<b=
r><br>diff --git a/board/aspeed/ast-g4/Kconfig b/board/aspeed/ast-g4/Kconfi=
g<br>index 2bec9a733a..e78030ae34 100644<br>--- a/board/aspeed/ast-g4/Kconf=
ig<br>+++ b/board/aspeed/ast-g4/Kconfig<br>@@ -19,4 +19,8 @@ config SYS_CON=
FIG_NAME<br>=C2=A0	default &quot;ast-g4-phy&quot; if ASPEED_NET_PHY<br>=C2=
=A0	default &quot;ast-g4-ncsi&quot; if ASPEED_NET_NCSI<br>=C2=A0<br>+config=
 ENABLE_SGPIO<br>+ =C2=A0 =C2=A0tristate &quot;Enable SGPIO in SCU&quot;<br=
>+	default n<br>+<br>=C2=A0endif<br>diff --git a/board/aspeed/ast-g4/ast-g4=
.c b/board/aspeed/ast-g4/ast-g4.c<br>index 656495307b..e2463d4524 100644<br=
>--- a/board/aspeed/ast-g4/ast-g4.c<br>+++ b/board/aspeed/ast-g4/ast-g4.c<b=
r>@@ -22,6 +22,19 @@ int board_init(void)<br>=C2=A0	/* address of boot para=
meters */<br>=C2=A0	gd-&gt;bd-&gt;bi_boot_params =3D CONFIG_SYS_SDRAM_BASE =
+ 0x100;<br>=C2=A0	gd-&gt;flags =3D 0;<br>+<br>+#ifdef CONFIG_ENABLE_SGPIO<=
br>+	/* Unlock SCU */<br>+	writel(SCU_PROTECT_UNLOCK, AST_SCU_BASE);<br>+<b=
r>+	/* Enable SGPIO Master */<br>+	u32 reg =3D readl(AST_SCU_BASE + AST_SCU=
_FUN_PIN_CTRL2);<br>+	reg |=3D (SCU_FUN_PIN_SGPMI |<br>+			SCU_FUN_PIN_SGPM=
O |<br>+			SCU_FUN_PIN_SGPMLD |<br>+			SCU_FUN_PIN_SGPMCK);<br>+	writel(reg=
, AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL2);<br>+#endif<br>=C2=A0	return 0;<br>=
=C2=A0}<br>=C2=A0<br>-- <br>2.31.0.208.g409f899ff0-goog<br><br></div></div>
</blockquote></div>

--0000000000000761fe05bedbdc3e--
