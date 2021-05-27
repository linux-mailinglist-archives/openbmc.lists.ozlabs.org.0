Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C7739254D
	for <lists+openbmc@lfdr.de>; Thu, 27 May 2021 05:16:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrCdt05j0z3004
	for <lists+openbmc@lfdr.de>; Thu, 27 May 2021 13:16:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=Vqb02iD4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::c34;
 helo=mail-oo1-xc34.google.com; envelope-from=wltu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Vqb02iD4; dkim-atps=neutral
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrCdZ1jX1z2xYg
 for <openbmc@lists.ozlabs.org>; Thu, 27 May 2021 13:16:18 +1000 (AEST)
Received: by mail-oo1-xc34.google.com with SMTP id
 s24-20020a4aead80000b02901fec6deb28aso798798ooh.11
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 20:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HV8/ezvYLRvB/62coiUhm50nM34ynUe9VQrteh0S8qQ=;
 b=Vqb02iD4eBsO8OJpwsG1AAvZHFomm6athB+6aUGSZJffk3Mp+9apxJm5iDSGqXfagp
 Wm7BS2qcXpMikPfid6Bev0O0zvy939b6P3PcS23nGef9ffxnq/nYwrNKasFFUDb4p328
 0jjTELYEcKfCqa5ATPKodkzOrjCAhlOo6cdNt9fbgI+MRtwp7QcyaFNuMZ+igEjSQsXT
 urJt5DwOmgQZXDYsWQuYFkW2TQZVUDb0KlhKeBETSz+lLxOM7KisJfPk0PfOHvHJESWA
 d7HSyu8WJI80D+Q5fdG6t8mD3aEgPtRUd9N6X9L+3TxcZqNCn9XCaRdgGTavWqsKZGVn
 UsHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HV8/ezvYLRvB/62coiUhm50nM34ynUe9VQrteh0S8qQ=;
 b=QiKggRuydZ/lpKi4Dehz6xZhthICkbhRi342WjvGq/5BaDXEg8QKyjEQ85NHrMZu7e
 tps7Yydfd/5RMlU4xnM9BfSieogjAfPSb9uZA+jkO4R7GT86m2nLhXHKjs21yqipj/Io
 iXvFQE6TsSdxT8njWesa94anjZNyvsUI5zlhwmDHwj0lK/cDXrsQJcNALjva5fEyU71M
 6XbEXxDMaehet2LMU7RySe+wtP7tcVXFsb+vJdbkFx3m4GRtfthMwZpVSRpYf3VkfQs0
 Xf2LnaU56iHWjr27Au/7OsAIoUBvc5DfY9YaD1e7HEr67oo+0DZjTpSJjlwXQthrkudF
 Z49w==
X-Gm-Message-State: AOAM531z17i84/SJaSeZ8oGVXJNYbGrv6BeqBJbK9ihxIAjdQX+HygQ1
 Tr4XFE1vJsrIkKSRz3cpwv3irDb2kE7ar+YAbZqr6w==
X-Google-Smtp-Source: ABdhPJwua80qIF/UybFVxnx2JcN9cVZZnJYzYfl0BfSlfynZcF9XZvYLfHJWdCjKI1K8LkAnTWZv1Ff2Jhz7+I9rm4E=
X-Received: by 2002:a4a:a511:: with SMTP id v17mr1135612ook.44.1622085374842; 
 Wed, 26 May 2021 20:16:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210413161238.2816187-1-wltu@google.com>
 <CAHwn2X=yDYN7V=ScrnREzAtCNZnAmRn8CzxOp033OR7POkTA5Q@mail.gmail.com>
 <CACPK8Xe_7he1Rp9gpzPRyvnwhSB2P+wqFUBerq9Mp8ZMjyMWHA@mail.gmail.com>
In-Reply-To: <CACPK8Xe_7he1Rp9gpzPRyvnwhSB2P+wqFUBerq9Mp8ZMjyMWHA@mail.gmail.com>
From: Willy Tu <wltu@google.com>
Date: Wed, 26 May 2021 20:16:03 -0700
Message-ID: <CAHwn2XmKBptke_92CATSp4u=jS02puoo6YqysU5Hp1cV2FYRdQ@mail.gmail.com>
Subject: Re: [PATCH] board: ast-g4: Enable SGPIO in SCU
To: Joel Stanley <joel@jms.id.au>
Content-Type: multipart/alternative; boundary="0000000000009079ac05c3472ea1"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000009079ac05c3472ea1
Content-Type: text/plain; charset="UTF-8"

Thanks!

We have an old system using this branch and we don't plan on migrating the
u-boot version for it. We don't have any system that is using aspeed other
than this one.

Wily Tu

On Wed, May 26, 2021 at 7:03 PM Joel Stanley <joel@jms.id.au> wrote:

> On Wed, 26 May 2021 at 15:51, Willy Tu <wltu@google.com> wrote:
> >
> > ping.
> >
> > I also missed the branch for this patch, but this should be in the
> v2016.07-aspeed-openbmc u-boot branch.
> >
> > On Tue, Apr 13, 2021 at 9:12 AM Willy Tu <wltu@google.com> wrote:
> >>
> >> Add option to enable register for SGPIO in SCU
> >> for ast-g4.
> >>
> >> Signed-off-by: Willy Tu <wltu@google.com>
>
> I've applied this, but I strongly encourage you to move to a newer
> branch. The 2019.04 branch is based off the latest aspeed SDK which
> claims support for the ast2400.
>
> >> ---
> >>  board/aspeed/ast-g4/Kconfig  |  4 ++++
> >>  board/aspeed/ast-g4/ast-g4.c | 13 +++++++++++++
> >>  2 files changed, 17 insertions(+)
> >>
> >> diff --git a/board/aspeed/ast-g4/Kconfig b/board/aspeed/ast-g4/Kconfig
> >> index 2bec9a733a..e78030ae34 100644
> >> --- a/board/aspeed/ast-g4/Kconfig
> >> +++ b/board/aspeed/ast-g4/Kconfig
> >> @@ -19,4 +19,8 @@ config SYS_CONFIG_NAME
> >>         default "ast-g4-phy" if ASPEED_NET_PHY
> >>         default "ast-g4-ncsi" if ASPEED_NET_NCSI
> >>
> >> +config ENABLE_SGPIO
> >> +    tristate "Enable SGPIO in SCU"
> >> +       default n
> >> +
> >>  endif
> >> diff --git a/board/aspeed/ast-g4/ast-g4.c b/board/aspeed/ast-g4/ast-g4.c
> >> index 656495307b..e2463d4524 100644
> >> --- a/board/aspeed/ast-g4/ast-g4.c
> >> +++ b/board/aspeed/ast-g4/ast-g4.c
> >> @@ -22,6 +22,19 @@ int board_init(void)
> >>         /* address of boot parameters */
> >>         gd->bd->bi_boot_params = CONFIG_SYS_SDRAM_BASE + 0x100;
> >>         gd->flags = 0;
> >> +
> >> +#ifdef CONFIG_ENABLE_SGPIO
> >> +       /* Unlock SCU */
> >> +       writel(SCU_PROTECT_UNLOCK, AST_SCU_BASE);
> >> +
> >> +       /* Enable SGPIO Master */
> >> +       u32 reg = readl(AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL2);
> >> +       reg |= (SCU_FUN_PIN_SGPMI |
> >> +                       SCU_FUN_PIN_SGPMO |
> >> +                       SCU_FUN_PIN_SGPMLD |
> >> +                       SCU_FUN_PIN_SGPMCK);
> >> +       writel(reg, AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL2);
> >> +#endif
> >>         return 0;
> >>  }
> >>
> >> --
> >> 2.31.1.295.g9ea45b61b8-goog
> >>
>

--0000000000009079ac05c3472ea1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks!</div><div><br></div>We have an old system usi=
ng this branch and we don&#39;t plan on migrating the u-boot version for it=
. We don&#39;t have any system that is using aspeed other than this one.<br=
><div><br></div><div>Wily Tu</div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, May 26, 2021 at 7:03 PM Joel Stan=
ley &lt;<a href=3D"mailto:joel@jms.id.au">joel@jms.id.au</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, 26 May 2021=
 at 15:51, Willy Tu &lt;<a href=3D"mailto:wltu@google.com" target=3D"_blank=
">wltu@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; ping.<br>
&gt;<br>
&gt; I also missed the branch for this patch, but this should be in the v20=
16.07-aspeed-openbmc u-boot branch.<br>
&gt;<br>
&gt; On Tue, Apr 13, 2021 at 9:12 AM Willy Tu &lt;<a href=3D"mailto:wltu@go=
ogle.com" target=3D"_blank">wltu@google.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Add option to enable register for SGPIO in SCU<br>
&gt;&gt; for ast-g4.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Willy Tu &lt;<a href=3D"mailto:wltu@google.com" tar=
get=3D"_blank">wltu@google.com</a>&gt;<br>
<br>
I&#39;ve applied this, but I strongly encourage you to move to a newer<br>
branch. The 2019.04 branch is based off the latest aspeed SDK which<br>
claims support for the ast2400.<br>
<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 board/aspeed/ast-g4/Kconfig=C2=A0 |=C2=A0 4 ++++<br>
&gt;&gt;=C2=A0 board/aspeed/ast-g4/ast-g4.c | 13 +++++++++++++<br>
&gt;&gt;=C2=A0 2 files changed, 17 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/board/aspeed/ast-g4/Kconfig b/board/aspeed/ast-g4/Kco=
nfig<br>
&gt;&gt; index 2bec9a733a..e78030ae34 100644<br>
&gt;&gt; --- a/board/aspeed/ast-g4/Kconfig<br>
&gt;&gt; +++ b/board/aspeed/ast-g4/Kconfig<br>
&gt;&gt; @@ -19,4 +19,8 @@ config SYS_CONFIG_NAME<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default &quot;ast-g4-phy&quot; if=
 ASPEED_NET_PHY<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default &quot;ast-g4-ncsi&quot; i=
f ASPEED_NET_NCSI<br>
&gt;&gt;<br>
&gt;&gt; +config ENABLE_SGPIO<br>
&gt;&gt; +=C2=A0 =C2=A0 tristate &quot;Enable SGPIO in SCU&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default n<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 endif<br>
&gt;&gt; diff --git a/board/aspeed/ast-g4/ast-g4.c b/board/aspeed/ast-g4/as=
t-g4.c<br>
&gt;&gt; index 656495307b..e2463d4524 100644<br>
&gt;&gt; --- a/board/aspeed/ast-g4/ast-g4.c<br>
&gt;&gt; +++ b/board/aspeed/ast-g4/ast-g4.c<br>
&gt;&gt; @@ -22,6 +22,19 @@ int board_init(void)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* address of boot parameters */<=
br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gd-&gt;bd-&gt;bi_boot_params =3D =
CONFIG_SYS_SDRAM_BASE + 0x100;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gd-&gt;flags =3D 0;<br>
&gt;&gt; +<br>
&gt;&gt; +#ifdef CONFIG_ENABLE_SGPIO<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Unlock SCU */<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(SCU_PROTECT_UNLOCK, AST_SCU_BAS=
E);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Enable SGPIO Master */<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reg =3D readl(AST_SCU_BASE + AST_S=
CU_FUN_PIN_CTRL2);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg |=3D (SCU_FUN_PIN_SGPMI |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0SCU_FUN_PIN_SGPMO |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0SCU_FUN_PIN_SGPMLD |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0SCU_FUN_PIN_SGPMCK);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(reg, AST_SCU_BASE + AST_SCU_FUN=
_PIN_CTRL2);<br>
&gt;&gt; +#endif<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; 2.31.1.295.g9ea45b61b8-goog<br>
&gt;&gt;<br>
</blockquote></div>

--0000000000009079ac05c3472ea1--
