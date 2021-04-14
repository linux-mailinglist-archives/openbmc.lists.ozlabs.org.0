Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C66635E9DD
	for <lists+openbmc@lfdr.de>; Wed, 14 Apr 2021 02:06:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKjSr337Qz30J6
	for <lists+openbmc@lfdr.de>; Wed, 14 Apr 2021 10:06:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=AR5mn7tM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=wltu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=AR5mn7tM; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKjSc0P1Zz2xfd
 for <openbmc@lists.ozlabs.org>; Wed, 14 Apr 2021 10:06:37 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id
 kk2-20020a17090b4a02b02900c777aa746fso9854484pjb.3
 for <openbmc@lists.ozlabs.org>; Tue, 13 Apr 2021 17:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sBGQ7fDdRGD+KgywlN1tLDWytIyy4ZgKTHWHSLZ15eI=;
 b=AR5mn7tMU/83clEz5CLHO1eJiDBbHESlDEfIKaozwfURe/CGxsmmv6+LF5s7KQeswB
 2yEFT+HFiavcwDBSl5/HuZAhQTe0c39vVzxDt2XDCMqRP2a7eTf8YCDYErUvcdly9yr+
 JYTr2HbUW6WhZsSBkqFh6hnALm7Q5g/R9UyK/ghnI5dVrgeURSD5GZFjb2+35X86TrUH
 DFW6bKflY6jEw3G4Egv6ihGvVhxsERfJmB6ukv4xvI9VJ+dsxJQ7jQB1K9MwvQ+jRyLP
 PayPtO0256i80xOR/8LTVpHYBebsKyQ4uKxIB7tNhyafq4hXNwGD9pjICrIitzvj9Nvt
 ABEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sBGQ7fDdRGD+KgywlN1tLDWytIyy4ZgKTHWHSLZ15eI=;
 b=WFZHWof0yvexponlmpWByxhK3frgLGfasbyTQnPTBL6hHPIQ/LT5oqjrhPIxId/YZL
 9MXFqM3KGRbY5403BMMhAO3IrcN+SB4ZdKlvM4YICBAZEaDvr5+A/tdMJ1A0k8wwE6bK
 KQ5lEnkpH/nENVHWi91lFX+c1rS/uiU95rwNswN5niPJFM04O+S/T9vH/bWJwTBwZb5I
 edvjpNPb5qm1+ypg3D3HGf2RklQiskAqkQWAAQnX7P7lYCi00K/51stXlSaWc0vcN8aO
 cV/Sox1lwdr87f1nc5qT3BJaH+9AF5CTml9wibJlTWVMT76z6+GNP7OjqND7IvOnzqEd
 Cqog==
X-Gm-Message-State: AOAM533jr7PDA9bA74VN/4OoV9PntzngfUBp9BescotNEZ+7yU77fCnZ
 vwgHCqKPPCiwbHtg3qSQEOz/0VTtP63/HIk+rzmtSQ==
X-Google-Smtp-Source: ABdhPJwLltPLw/2QdNyfVTZNqmbHM3+LnbrGuVoGHALLjNo8pa+X4SwshgkJPjbkAWtFD3D9AsZS2xlM70uy2BSgliY=
X-Received: by 2002:a17:90b:34b:: with SMTP id
 fh11mr341578pjb.105.1618358795443; 
 Tue, 13 Apr 2021 17:06:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210413161150.2815450-1-wltu@google.com>
 <CACPK8Xe7zhHbc4Ye3M8w6FLZyTxTxq6U8dX=L7x8cMkS3JSDaQ@mail.gmail.com>
In-Reply-To: <CACPK8Xe7zhHbc4Ye3M8w6FLZyTxTxq6U8dX=L7x8cMkS3JSDaQ@mail.gmail.com>
From: Willy Tu <wltu@google.com>
Date: Tue, 13 Apr 2021 17:06:24 -0700
Message-ID: <CAHwn2Xnd2TGfe2Oo+3fJoLkfzng5H=fjZH8_pgQ_fSScJxiX1g@mail.gmail.com>
Subject: Re: [PATCH] board: ast2400: Enable SGPIO in SCU
To: Joel Stanley <joel@jms.id.au>
Content-Type: multipart/alternative; boundary="0000000000001f8c2205bfe38537"
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

--0000000000001f8c2205bfe38537
Content-Type: text/plain; charset="UTF-8"

Hi Joel,

thanks for the response.

Sorry, I did not update the patch to include the branch name. I'll be more
careful next time.

This change should be in `v2019.04-aspeed-openbmc` and the other patch in
https://lore.kernel.org/openbmc/20210413161238.2816187-1-wltu@google.com/
should
be in `v2016.07-aspeed-openbmc`.

I have not tested this change, but have tested
https://lore.kernel.org/openbmc/20210413161238.2816187-1-wltu@google.com/ that
I based off of (Which I have tested with my setup). Will that be an issue?

Best,

Willy Tu

On Tue, Apr 13, 2021 at 4:32 PM Joel Stanley <joel@jms.id.au> wrote:

> Hi Willy,
>
> On Tue, 13 Apr 2021 at 16:11, Willy Tu <wltu@google.com> wrote:
> >
> > Add option to enable register for SGPIO in SCU.
> >
> > Included new function register values for ast2400
> > SCU and enable the SGPIO function in board init.
>
> Which branch would you like this patch applied to?
>
> >
> > Signed-off-by: Willy Tu <wltu@google.com>
> > ---
> >  arch/arm/include/asm/arch-aspeed/scu_ast2400.h |  4 ++++
> >  arch/arm/mach-aspeed/ast2400/Kconfig           |  4 ++++
> >  arch/arm/mach-aspeed/ast2400/board_common.c    | 15 +++++++++++++++
> >  3 files changed, 23 insertions(+)
> >
> > diff --git a/arch/arm/include/asm/arch-aspeed/scu_ast2400.h
> b/arch/arm/include/asm/arch-aspeed/scu_ast2400.h
> > index 9c5d96ae84..17eaaf3e9d 100644
> > --- a/arch/arm/include/asm/arch-aspeed/scu_ast2400.h
> > +++ b/arch/arm/include/asm/arch-aspeed/scu_ast2400.h
> > @@ -75,6 +75,10 @@
> >  #define SCU_PIN_FUN_SCL2               (1 << 14)
> >  #define SCU_PIN_FUN_SDA1               (1 << 13)
> >  #define SCU_PIN_FUN_SDA2               (1 << 15)
> > +#define SCU_PIN_FUN_SGPMCK             (0x1 << 8)
> > +#define SCU_PIN_FUN_SGPMLD             (0x1 << 9)
> > +#define SCU_PIN_FUN_SGPMO              (0x1 << 10)
> > +#define SCU_PIN_FUN_SGPMI              (0x1 << 11)
> >
> >  #define SCU_D2PLL_EXT1_OFF             (1 << 0)
> >  #define SCU_D2PLL_EXT1_BYPASS          (1 << 1)
> > diff --git a/arch/arm/mach-aspeed/ast2400/Kconfig
> b/arch/arm/mach-aspeed/ast2400/Kconfig
> > index f76276860c..c4e88b5140 100644
> > --- a/arch/arm/mach-aspeed/ast2400/Kconfig
> > +++ b/arch/arm/mach-aspeed/ast2400/Kconfig
> > @@ -17,6 +17,10 @@ config TARGET_EVB_AST2400
> >           20 pin JTAG, pinouts for 14 I2Cs, 3 SPIs and eSPI, 8 PWMs.
> >  endchoice
> >
> > +config ENABLE_SGPIO
> > +    tristate "Enable SGPIO in SCU"
> > +       default n
> > +
> >  source "board/aspeed/evb_ast2400/Kconfig"
> >
> >  endif
> > diff --git a/arch/arm/mach-aspeed/ast2400/board_common.c
> b/arch/arm/mach-aspeed/ast2400/board_common.c
> > index 3829b06934..eca2ef03e5 100644
> > --- a/arch/arm/mach-aspeed/ast2400/board_common.c
> > +++ b/arch/arm/mach-aspeed/ast2400/board_common.c
> > @@ -14,6 +14,21 @@ __weak int board_init(void)
> >  {
> >         gd->bd->bi_boot_params = CONFIG_SYS_SDRAM_BASE + 0x100;
> >
> > +#ifdef CONFIG_ENABLE_SGPIO
> > +#define SCU_BASE 0x1e6e2000
> > +#define SCU_FUN_PIN_CTRL2 0x84 /* Multi-function Pin Control#2*/
> > +       /* Unlock SCU */
> > +       writel(SCU_UNLOCK_VALUE, SCU_BASE);
> > +
> > +       /* Enable SGPIO Master */
> > +       u32 reg = readl(SCU_BASE + SCU_FUN_PIN_CTRL2);
> > +
> > +       reg |= (SCU_PIN_FUN_SGPMI  |
> > +                       SCU_PIN_FUN_SGPMO  |
> > +                       SCU_PIN_FUN_SGPMLD |
> > +                       SCU_PIN_FUN_SGPMCK);
> > +       writel(reg, SCU_BASE + SCU_FUN_PIN_CTRL2);
> > +#endif
> >         return 0;
> >  }
> >
> > --
> > 2.31.1.295.g9ea45b61b8-goog
> >
>

--0000000000001f8c2205bfe38537
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Joel,<div><br></div><div>thanks for the response.<div><=
br></div><div>Sorry, I did not update the patch to include the branch name.=
 I&#39;ll be more careful next time.<br></div><div><br></div><div>This chan=
ge should be in `v2019.04-aspeed-openbmc` and the other patch in=C2=A0<a hr=
ef=3D"https://lore.kernel.org/openbmc/20210413161238.2816187-1-wltu@google.=
com/">https://lore.kernel.org/openbmc/20210413161238.2816187-1-wltu@google.=
com/</a>=C2=A0should be in `v2016.07-aspeed-openbmc`.</div><div><br></div><=
div>I have not tested this change, but have tested=C2=A0=C2=A0<a href=3D"ht=
tps://lore.kernel.org/openbmc/20210413161238.2816187-1-wltu@google.com/">ht=
tps://lore.kernel.org/openbmc/20210413161238.2816187-1-wltu@google.com/</a>=
=C2=A0that I based off of (Which I have tested with my setup). Will that be=
 an issue?</div><div><br></div><div>Best,</div><div><br></div><div>Willy Tu=
</div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Tue, Apr 13, 2021 at 4:32 PM Joel Stanley &lt;<a href=3D"mai=
lto:joel@jms.id.au">joel@jms.id.au</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">Hi Willy,<br>
<br>
On Tue, 13 Apr 2021 at 16:11, Willy Tu &lt;<a href=3D"mailto:wltu@google.co=
m" target=3D"_blank">wltu@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Add option to enable register for SGPIO in SCU.<br>
&gt;<br>
&gt; Included new function register values for ast2400<br>
&gt; SCU and enable the SGPIO function in board init.<br>
<br>
Which branch would you like this patch applied to?<br>
<br>
&gt;<br>
&gt; Signed-off-by: Willy Tu &lt;<a href=3D"mailto:wltu@google.com" target=
=3D"_blank">wltu@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 arch/arm/include/asm/arch-aspeed/scu_ast2400.h |=C2=A0 4 ++++<br=
>
&gt;=C2=A0 arch/arm/mach-aspeed/ast2400/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 4 ++++<br>
&gt;=C2=A0 arch/arm/mach-aspeed/ast2400/board_common.c=C2=A0 =C2=A0 | 15 ++=
+++++++++++++<br>
&gt;=C2=A0 3 files changed, 23 insertions(+)<br>
&gt;<br>
&gt; diff --git a/arch/arm/include/asm/arch-aspeed/scu_ast2400.h b/arch/arm=
/include/asm/arch-aspeed/scu_ast2400.h<br>
&gt; index 9c5d96ae84..17eaaf3e9d 100644<br>
&gt; --- a/arch/arm/include/asm/arch-aspeed/scu_ast2400.h<br>
&gt; +++ b/arch/arm/include/asm/arch-aspeed/scu_ast2400.h<br>
&gt; @@ -75,6 +75,10 @@<br>
&gt;=C2=A0 #define SCU_PIN_FUN_SCL2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(1 &lt;&lt; 14)<br>
&gt;=C2=A0 #define SCU_PIN_FUN_SDA1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(1 &lt;&lt; 13)<br>
&gt;=C2=A0 #define SCU_PIN_FUN_SDA2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(1 &lt;&lt; 15)<br>
&gt; +#define SCU_PIN_FUN_SGPMCK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(0x1 &lt;&lt; 8)<br>
&gt; +#define SCU_PIN_FUN_SGPMLD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(0x1 &lt;&lt; 9)<br>
&gt; +#define SCU_PIN_FUN_SGPMO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (0x1 &lt;&lt; 10)<br>
&gt; +#define SCU_PIN_FUN_SGPMI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (0x1 &lt;&lt; 11)<br>
&gt;<br>
&gt;=C2=A0 #define SCU_D2PLL_EXT1_OFF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(1 &lt;&lt; 0)<br>
&gt;=C2=A0 #define SCU_D2PLL_EXT1_BYPASS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
(1 &lt;&lt; 1)<br>
&gt; diff --git a/arch/arm/mach-aspeed/ast2400/Kconfig b/arch/arm/mach-aspe=
ed/ast2400/Kconfig<br>
&gt; index f76276860c..c4e88b5140 100644<br>
&gt; --- a/arch/arm/mach-aspeed/ast2400/Kconfig<br>
&gt; +++ b/arch/arm/mach-aspeed/ast2400/Kconfig<br>
&gt; @@ -17,6 +17,10 @@ config TARGET_EVB_AST2400<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A020 pin JTAG, pinouts for 14 I2=
Cs, 3 SPIs and eSPI, 8 PWMs.<br>
&gt;=C2=A0 endchoice<br>
&gt;<br>
&gt; +config ENABLE_SGPIO<br>
&gt; +=C2=A0 =C2=A0 tristate &quot;Enable SGPIO in SCU&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default n<br>
&gt; +<br>
&gt;=C2=A0 source &quot;board/aspeed/evb_ast2400/Kconfig&quot;<br>
&gt;<br>
&gt;=C2=A0 endif<br>
&gt; diff --git a/arch/arm/mach-aspeed/ast2400/board_common.c b/arch/arm/ma=
ch-aspeed/ast2400/board_common.c<br>
&gt; index 3829b06934..eca2ef03e5 100644<br>
&gt; --- a/arch/arm/mach-aspeed/ast2400/board_common.c<br>
&gt; +++ b/arch/arm/mach-aspeed/ast2400/board_common.c<br>
&gt; @@ -14,6 +14,21 @@ __weak int board_init(void)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gd-&gt;bd-&gt;bi_boot_params =3D CONF=
IG_SYS_SDRAM_BASE + 0x100;<br>
&gt;<br>
&gt; +#ifdef CONFIG_ENABLE_SGPIO<br>
&gt; +#define SCU_BASE 0x1e6e2000<br>
&gt; +#define SCU_FUN_PIN_CTRL2 0x84 /* Multi-function Pin Control#2*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Unlock SCU */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(SCU_UNLOCK_VALUE, SCU_BASE);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Enable SGPIO Master */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reg =3D readl(SCU_BASE + SCU_FUN_PIN_C=
TRL2);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg |=3D (SCU_PIN_FUN_SGPMI=C2=A0 |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0SCU_PIN_FUN_SGPMO=C2=A0 |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0SCU_PIN_FUN_SGPMLD |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0SCU_PIN_FUN_SGPMCK);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(reg, SCU_BASE + SCU_FUN_PIN_CTRL2);=
<br>
&gt; +#endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; --<br>
&gt; 2.31.1.295.g9ea45b61b8-goog<br>
&gt;<br>
</blockquote></div>

--0000000000001f8c2205bfe38537--
