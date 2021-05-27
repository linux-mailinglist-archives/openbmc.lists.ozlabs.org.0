Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E00D39254C
	for <lists+openbmc@lfdr.de>; Thu, 27 May 2021 05:15:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrCcB6BPQz2ymR
	for <lists+openbmc@lfdr.de>; Thu, 27 May 2021 13:15:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=fUiFAf1v;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::329;
 helo=mail-ot1-x329.google.com; envelope-from=wltu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=fUiFAf1v; dkim-atps=neutral
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrCbr2Gmtz2xv8
 for <openbmc@lists.ozlabs.org>; Thu, 27 May 2021 13:14:45 +1000 (AEST)
Received: by mail-ot1-x329.google.com with SMTP id
 i12-20020a05683033ecb02903346fa0f74dso3083300otu.10
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 20:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9JP1GbR3rEx/dCbJid3KvIT4o/F/4RY1pLrN+bpnLP8=;
 b=fUiFAf1vfVuGH7Vq5iffIYISvx/gy2fbMmdT1DjZ5ZsveSv4SxoQHX2/7YicmdBdC1
 7nqaZSfcRIz0t0HzZL9ZfaZWdowSBTR+mNaQzUdlbB6fOvDHPOdSm0CEto0qIpnXaLLA
 bGok35hzeT3qnUJelPfwVAs6hkDSiKo3QlnFZJzewGUf1tPHU16hyD1O45UgCkPDSpak
 2S6hY8BKZ1P5spQwG1Y1Ft/umtkV4qz774kjofLpdLtJ+dFt1DyBMcmrlldI7rd+FCRv
 7r89eH45SvwhQc8z2Wj+oJTIusZJ9tmQhuvf5ZDzJ7Rn8oBUIDki0q2CU/08PvcET+o1
 pPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9JP1GbR3rEx/dCbJid3KvIT4o/F/4RY1pLrN+bpnLP8=;
 b=K9tz12xrwTMZrRdMlMWVizLzh9bEen3NqNVhYEDIb7WuB+zc5tEii4K5DdUC5dY/xF
 9iRbNs9WDyZs4JFAtakVg3pxht4zQUApjQ5fiCvdX7ztDbqamUOHg4AWDL+O0+EYxKDb
 Gbke+dq5+rVgBQeCgChD51G4O7qoLy9FJrV4SLiVbjaXD9HdZSts5DHgGYx1KMPdhQze
 EONy+YSYGmX8tDUhSPbYki4FkZzTcpz2rWMAHqlwHQq5q4WDyn1HMXVnEY5++NV7Aip9
 woCo4gKJg0crJdfXAjXWPzkV0Qk541L0suuGsBRmAbNvIxZyYZ2Gom1dMQamr0utAJ76
 UpWg==
X-Gm-Message-State: AOAM533Xrdsi7dTiRpIybBIxVrRUA93/PEduzyTe6J9y/58KBE8zgDPQ
 RNMf0lRrdD79vIUMF7NVgL9EjKPoYirK+hhsORD8/g==
X-Google-Smtp-Source: ABdhPJxzZfhiog7xigjdSkdyh/ARNVn5SMx4NUjM4i3kUnLmHdre1CiMyvnusILfTrEgvrwH6nociM6zWUEC/CAGJ68=
X-Received: by 2002:a9d:2ee:: with SMTP id 101mr1167210otl.76.1622085281314;
 Wed, 26 May 2021 20:14:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210413161150.2815450-1-wltu@google.com>
 <CACPK8Xe7zhHbc4Ye3M8w6FLZyTxTxq6U8dX=L7x8cMkS3JSDaQ@mail.gmail.com>
 <CAHwn2Xnd2TGfe2Oo+3fJoLkfzng5H=fjZH8_pgQ_fSScJxiX1g@mail.gmail.com>
 <CACPK8XcfnYz9LH2eScKhiEAi1w76YPpJNUk+kjqYN1sEcGMjSw@mail.gmail.com>
In-Reply-To: <CACPK8XcfnYz9LH2eScKhiEAi1w76YPpJNUk+kjqYN1sEcGMjSw@mail.gmail.com>
From: Willy Tu <wltu@google.com>
Date: Wed, 26 May 2021 20:14:30 -0700
Message-ID: <CAHwn2Xm7gRa2-YF=OazW3DcKr0RLk6CuTe8b=Bs2HTwhr60Vtw@mail.gmail.com>
Subject: Re: [PATCH] board: ast2400: Enable SGPIO in SCU
To: Joel Stanley <joel@jms.id.au>
Content-Type: multipart/alternative; boundary="000000000000fd5e1c05c3472807"
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

--000000000000fd5e1c05c3472807
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 26, 2021 at 6:57 PM Joel Stanley <joel@jms.id.au> wrote:

> On Wed, 14 Apr 2021 at 00:06, Willy Tu <wltu@google.com> wrote:
> >
> > Hi Joel,
> >
> > thanks for the response.
> >
> > Sorry, I did not update the patch to include the branch name. I'll be
> more careful next time.
> >
> > This change should be in `v2019.04-aspeed-openbmc` and the other patch
> in
> https://lore.kernel.org/openbmc/20210413161238.2816187-1-wltu@google.com/
> should be in `v2016.07-aspeed-openbmc`.
>
> Okay.
>
> > I have not tested this change, but have tested
> https://lore.kernel.org/openbmc/20210413161238.2816187-1-wltu@google.com/
> that I based off of (Which I have tested with my setup). Will that be an
> issue?
>
> What branch are you using for your system?
>
> I strongly encourage you to use the 2019.04 branch if at all possible.
>
> Some review below.
>

The system that I was using was based on v2016.07-aspeed-openbmc . It is an
old system and we don't plan on migrating the u-boot version for it. We
don't have any system that is using aspeed other than this one.


>
> > On Tue, Apr 13, 2021 at 4:32 PM Joel Stanley <joel@jms.id.au> wrote:
> >>
> >> Hi Willy,
> >>
> >> On Tue, 13 Apr 2021 at 16:11, Willy Tu <wltu@google.com> wrote:
> >> >
> >> > Add option to enable register for SGPIO in SCU.
> >> >
> >> > Included new function register values for ast2400
> >> > SCU and enable the SGPIO function in board init.
> >>
> >> Which branch would you like this patch applied to?
> >>
> >> >
> >> > Signed-off-by: Willy Tu <wltu@google.com>
> >> > ---
> >> >  arch/arm/include/asm/arch-aspeed/scu_ast2400.h |  4 ++++
> >> >  arch/arm/mach-aspeed/ast2400/Kconfig           |  4 ++++
> >> >  arch/arm/mach-aspeed/ast2400/board_common.c    | 15 +++++++++++++++
> >> >  3 files changed, 23 insertions(+)
> >> >
> >> > diff --git a/arch/arm/include/asm/arch-aspeed/scu_ast2400.h
> b/arch/arm/include/asm/arch-aspeed/scu_ast2400.h
> >> > index 9c5d96ae84..17eaaf3e9d 100644
> >> > --- a/arch/arm/include/asm/arch-aspeed/scu_ast2400.h
> >> > +++ b/arch/arm/include/asm/arch-aspeed/scu_ast2400.h
> >> > @@ -75,6 +75,10 @@
> >> >  #define SCU_PIN_FUN_SCL2               (1 << 14)
> >> >  #define SCU_PIN_FUN_SDA1               (1 << 13)
> >> >  #define SCU_PIN_FUN_SDA2               (1 << 15)
> >> > +#define SCU_PIN_FUN_SGPMCK             (0x1 << 8)
> >> > +#define SCU_PIN_FUN_SGPMLD             (0x1 << 9)
> >> > +#define SCU_PIN_FUN_SGPMO              (0x1 << 10)
> >> > +#define SCU_PIN_FUN_SGPMI              (0x1 << 11)
> >> >
> >> >  #define SCU_D2PLL_EXT1_OFF             (1 << 0)
> >> >  #define SCU_D2PLL_EXT1_BYPASS          (1 << 1)
> >> > diff --git a/arch/arm/mach-aspeed/ast2400/Kconfig
> b/arch/arm/mach-aspeed/ast2400/Kconfig
> >> > index f76276860c..c4e88b5140 100644
> >> > --- a/arch/arm/mach-aspeed/ast2400/Kconfig
> >> > +++ b/arch/arm/mach-aspeed/ast2400/Kconfig
> >> > @@ -17,6 +17,10 @@ config TARGET_EVB_AST2400
> >> >           20 pin JTAG, pinouts for 14 I2Cs, 3 SPIs and eSPI, 8 PWMs.
> >> >  endchoice
> >> >
> >> > +config ENABLE_SGPIO
> >> > +    tristate "Enable SGPIO in SCU"
> >> > +       default n
>
> Note that this is the default default in kconfig, you only need to
> specify a default if you want some other behaviour.
>
> >> > @@ -14,6 +14,21 @@ __weak int board_init(void)
> >> >  {
> >> >         gd->bd->bi_boot_params =3D CONFIG_SYS_SDRAM_BASE + 0x100;
> >> >
> >> > +#ifdef CONFIG_ENABLE_SGPIO
> >> > +#define SCU_BASE 0x1e6e2000
> >> > +#define SCU_FUN_PIN_CTRL2 0x84 /* Multi-function Pin Control#2*/
> >> > +       /* Unlock SCU */
> >> > +       writel(SCU_UNLOCK_VALUE, SCU_BASE);
> >> > +
> >> > +       /* Enable SGPIO Master */
> >> > +       u32 reg =3D readl(SCU_BASE + SCU_FUN_PIN_CTRL2);
> >> > +
> >> > +       reg |=3D (SCU_PIN_FUN_SGPMI  |
> >> > +                       SCU_PIN_FUN_SGPMO  |
> >> > +                       SCU_PIN_FUN_SGPMLD |
> >> > +                       SCU_PIN_FUN_SGPMCK);
> >> > +       writel(reg, SCU_BASE + SCU_FUN_PIN_CTRL2);
> >> > +#endif
>
> Here's what I saw when attempting to compile test your patch:
>
> In file included from ../arch/arm/mach-aspeed/ast2400/board_common.c:6:
> ../arch/arm/mach-aspeed/ast2400/board_common.c: In function =E2=80=98boar=
d_init=E2=80=99:
> ../arch/arm/mach-aspeed/ast2400/board_common.c:21:16: error:
> =E2=80=98SCU_UNLOCK_VALUE=E2=80=99 undeclared (first use in this function=
)
>    21 |         writel(SCU_UNLOCK_VALUE, SCU_BASE);
>       |                ^~~~~~~~~~~~~~~~
> ../arch/arm/include/asm/io.h:117:38: note: in definition of macro =E2=80=
=98writel=E2=80=99
>   117 | #define writel(v,c)     ({ u32 __v =3D v; __iowmb();
> __arch_putl(__v,c); __v; })
>       |                                      ^
> ../arch/arm/mach-aspeed/ast2400/board_common.c:21:16: note: each
> undeclared identifier is reported only once for each function it
> appears in
>    21 |         writel(SCU_UNLOCK_VALUE, SCU_BASE);
>       |                ^~~~~~~~~~~~~~~~
> ../arch/arm/include/asm/io.h:117:38: note: in definition of macro =E2=80=
=98writel=E2=80=99
>   117 | #define writel(v,c)     ({ u32 __v =3D v; __iowmb();
> __arch_putl(__v,c); __v; })
>       |                                      ^
> ../arch/arm/mach-aspeed/ast2400/board_common.c:26:17: error:
> =E2=80=98SCU_PIN_FUN_SGPMI=E2=80=99 undeclared (first use in this functio=
n)
>    26 |         reg |=3D (SCU_PIN_FUN_SGPMI  |
>       |                 ^~~~~~~~~~~~~~~~~
> ../arch/arm/mach-aspeed/ast2400/board_common.c:27:25: error:
> =E2=80=98SCU_PIN_FUN_SGPMO=E2=80=99 undeclared (first use in this functio=
n)
>    27 |                         SCU_PIN_FUN_SGPMO  |
>       |                         ^~~~~~~~~~~~~~~~~
> ../arch/arm/mach-aspeed/ast2400/board_common.c:28:25: error:
> =E2=80=98SCU_PIN_FUN_SGPMLD=E2=80=99 undeclared (first use in this functi=
on)
>    28 |                         SCU_PIN_FUN_SGPMLD |
>       |                         ^~~~~~~~~~~~~~~~~~
> ../arch/arm/mach-aspeed/ast2400/board_common.c:29:25: error:
> =E2=80=98SCU_PIN_FUN_SGPMCK=E2=80=99 undeclared (first use in this functi=
on)
>    29 |                         SCU_PIN_FUN_SGPMCK);
>       |                         ^~~~~~~~~~~~~~~~~~
>
>
> >> >         return 0;
> >> >  }
> >> >
> >> > --
> >> > 2.31.1.295.g9ea45b61b8-goog
> >> >
>

Thanks for the feedback. I'll address the issue and apply a new patch.

Willy Tu

--000000000000fd5e1c05c3472807
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, May 26, 2021 at 6:57 PM Joel Stan=
ley &lt;<a href=3D"mailto:joel@jms.id.au">joel@jms.id.au</a>&gt; wrote:<br>=
</div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Wed, 14 Apr 2021 at 00:06, Willy Tu &lt;<a href=3D"mailto:wltu@g=
oogle.com" target=3D"_blank">wltu@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Joel,<br>
&gt;<br>
&gt; thanks for the response.<br>
&gt;<br>
&gt; Sorry, I did not update the patch to include the branch name. I&#39;ll=
 be more careful next time.<br>
&gt;<br>
&gt; This change should be in `v2019.04-aspeed-openbmc` and the other patch=
 in <a href=3D"https://lore.kernel.org/openbmc/20210413161238.2816187-1-wlt=
u@google.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org=
/openbmc/20210413161238.2816187-1-wltu@google.com/</a> should be in `v2016.=
07-aspeed-openbmc`.<br>
<br>
Okay.<br>
<br>
&gt; I have not tested this change, but have tested=C2=A0 <a href=3D"https:=
//lore.kernel.org/openbmc/20210413161238.2816187-1-wltu@google.com/" rel=3D=
"noreferrer" target=3D"_blank">https://lore.kernel.org/openbmc/202104131612=
38.2816187-1-wltu@google.com/</a> that I based off of (Which I have tested =
with my setup). Will that be an issue?<br>
<br>
What branch are you using for your system?<br>
<br>
I strongly encourage you to use the 2019.04 branch if at all possible.<br>
<br>
Some review below.<br></blockquote><div><br></div><div>The system that I wa=
s using was based on v2016.07-aspeed-openbmc . It is an old system and we d=
on&#39;t plan on migrating the u-boot version for it. We don&#39;t have any=
 system that is using aspeed other than this one.</div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; On Tue, Apr 13, 2021 at 4:32 PM Joel Stanley &lt;<a href=3D"mailto:joe=
l@jms.id.au" target=3D"_blank">joel@jms.id.au</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hi Willy,<br>
&gt;&gt;<br>
&gt;&gt; On Tue, 13 Apr 2021 at 16:11, Willy Tu &lt;<a href=3D"mailto:wltu@=
google.com" target=3D"_blank">wltu@google.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Add option to enable register for SGPIO in SCU.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Included new function register values for ast2400<br>
&gt;&gt; &gt; SCU and enable the SGPIO function in board init.<br>
&gt;&gt;<br>
&gt;&gt; Which branch would you like this patch applied to?<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Willy Tu &lt;<a href=3D"mailto:wltu@google.com=
" target=3D"_blank">wltu@google.com</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 arch/arm/include/asm/arch-aspeed/scu_ast2400.h |=C2=A0 =
4 ++++<br>
&gt;&gt; &gt;=C2=A0 arch/arm/mach-aspeed/ast2400/Kconfig=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++++<br>
&gt;&gt; &gt;=C2=A0 arch/arm/mach-aspeed/ast2400/board_common.c=C2=A0 =C2=
=A0 | 15 +++++++++++++++<br>
&gt;&gt; &gt;=C2=A0 3 files changed, 23 insertions(+)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/arch/arm/include/asm/arch-aspeed/scu_ast2400.h b=
/arch/arm/include/asm/arch-aspeed/scu_ast2400.h<br>
&gt;&gt; &gt; index 9c5d96ae84..17eaaf3e9d 100644<br>
&gt;&gt; &gt; --- a/arch/arm/include/asm/arch-aspeed/scu_ast2400.h<br>
&gt;&gt; &gt; +++ b/arch/arm/include/asm/arch-aspeed/scu_ast2400.h<br>
&gt;&gt; &gt; @@ -75,6 +75,10 @@<br>
&gt;&gt; &gt;=C2=A0 #define SCU_PIN_FUN_SCL2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 14)<br>
&gt;&gt; &gt;=C2=A0 #define SCU_PIN_FUN_SDA1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 13)<br>
&gt;&gt; &gt;=C2=A0 #define SCU_PIN_FUN_SDA2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 15)<br>
&gt;&gt; &gt; +#define SCU_PIN_FUN_SGPMCK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0(0x1 &lt;&lt; 8)<br>
&gt;&gt; &gt; +#define SCU_PIN_FUN_SGPMLD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0(0x1 &lt;&lt; 9)<br>
&gt;&gt; &gt; +#define SCU_PIN_FUN_SGPMO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 (0x1 &lt;&lt; 10)<br>
&gt;&gt; &gt; +#define SCU_PIN_FUN_SGPMI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 (0x1 &lt;&lt; 11)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 #define SCU_D2PLL_EXT1_OFF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 0)<br>
&gt;&gt; &gt;=C2=A0 #define SCU_D2PLL_EXT1_BYPASS=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (1 &lt;&lt; 1)<br>
&gt;&gt; &gt; diff --git a/arch/arm/mach-aspeed/ast2400/Kconfig b/arch/arm/=
mach-aspeed/ast2400/Kconfig<br>
&gt;&gt; &gt; index f76276860c..c4e88b5140 100644<br>
&gt;&gt; &gt; --- a/arch/arm/mach-aspeed/ast2400/Kconfig<br>
&gt;&gt; &gt; +++ b/arch/arm/mach-aspeed/ast2400/Kconfig<br>
&gt;&gt; &gt; @@ -17,6 +17,10 @@ config TARGET_EVB_AST2400<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A020 pin JTAG, pinouts =
for 14 I2Cs, 3 SPIs and eSPI, 8 PWMs.<br>
&gt;&gt; &gt;=C2=A0 endchoice<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; +config ENABLE_SGPIO<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 tristate &quot;Enable SGPIO in SCU&quot;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default n<br>
<br>
Note that this is the default default in kconfig, you only need to<br>
specify a default if you want some other behaviour.<br>
<br>
&gt;&gt; &gt; @@ -14,6 +14,21 @@ __weak int board_init(void)<br>
&gt;&gt; &gt;=C2=A0 {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gd-&gt;bd-&gt;bi_boot_params=
 =3D CONFIG_SYS_SDRAM_BASE + 0x100;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; +#ifdef CONFIG_ENABLE_SGPIO<br>
&gt;&gt; &gt; +#define SCU_BASE 0x1e6e2000<br>
&gt;&gt; &gt; +#define SCU_FUN_PIN_CTRL2 0x84 /* Multi-function Pin Control=
#2*/<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Unlock SCU */<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(SCU_UNLOCK_VALUE, SCU_BASE=
);<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Enable SGPIO Master */<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reg =3D readl(SCU_BASE + SCU_=
FUN_PIN_CTRL2);<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg |=3D (SCU_PIN_FUN_SGPMI=C2=A0=
 |<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0SCU_PIN_FUN_SGPMO=C2=A0 |<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0SCU_PIN_FUN_SGPMLD |<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0SCU_PIN_FUN_SGPMCK);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(reg, SCU_BASE + SCU_FUN_PI=
N_CTRL2);<br>
&gt;&gt; &gt; +#endif<br>
<br>
Here&#39;s what I saw when attempting to compile test your patch:<br>
<br>
In file included from ../arch/arm/mach-aspeed/ast2400/board_common.c:6:<br>
../arch/arm/mach-aspeed/ast2400/board_common.c: In function =E2=80=98board_=
init=E2=80=99:<br>
../arch/arm/mach-aspeed/ast2400/board_common.c:21:16: error:<br>
=E2=80=98SCU_UNLOCK_VALUE=E2=80=99 undeclared (first use in this function)<=
br>
=C2=A0 =C2=A021 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0writel(SCU_UNLOCK_VALUE,=
 SCU_BASE);<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ^~~~~~~~~~~~~~~~<br>
../arch/arm/include/asm/io.h:117:38: note: in definition of macro =E2=80=98=
writel=E2=80=99<br>
=C2=A0 117 | #define writel(v,c)=C2=A0 =C2=A0 =C2=A0({ u32 __v =3D v; __iow=
mb();<br>
__arch_putl(__v,c); __v; })<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ^<br>
../arch/arm/mach-aspeed/ast2400/board_common.c:21:16: note: each<br>
undeclared identifier is reported only once for each function it<br>
appears in<br>
=C2=A0 =C2=A021 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0writel(SCU_UNLOCK_VALUE,=
 SCU_BASE);<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ^~~~~~~~~~~~~~~~<br>
../arch/arm/include/asm/io.h:117:38: note: in definition of macro =E2=80=98=
writel=E2=80=99<br>
=C2=A0 117 | #define writel(v,c)=C2=A0 =C2=A0 =C2=A0({ u32 __v =3D v; __iow=
mb();<br>
__arch_putl(__v,c); __v; })<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ^<br>
../arch/arm/mach-aspeed/ast2400/board_common.c:26:17: error:<br>
=E2=80=98SCU_PIN_FUN_SGPMI=E2=80=99 undeclared (first use in this function)=
<br>
=C2=A0 =C2=A026 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg |=3D (SCU_PIN_FUN_SG=
PMI=C2=A0 |<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0^~~~~~~~~~~~~~~~~<br>
../arch/arm/mach-aspeed/ast2400/board_common.c:27:25: error:<br>
=E2=80=98SCU_PIN_FUN_SGPMO=E2=80=99 undeclared (first use in this function)=
<br>
=C2=A0 =C2=A027 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SCU_PIN_FUN_SGPMO=C2=A0 |<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~<br>
../arch/arm/mach-aspeed/ast2400/board_common.c:28:25: error:<br>
=E2=80=98SCU_PIN_FUN_SGPMLD=E2=80=99 undeclared (first use in this function=
)<br>
=C2=A0 =C2=A028 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SCU_PIN_FUN_SGPMLD |<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~<br>
../arch/arm/mach-aspeed/ast2400/board_common.c:29:25: error:<br>
=E2=80=98SCU_PIN_FUN_SGPMCK=E2=80=99 undeclared (first use in this function=
)<br>
=C2=A0 =C2=A029 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SCU_PIN_FUN_SGPMCK);<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~<br>
<br>
<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;&gt; &gt;=C2=A0 }<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 2.31.1.295.g9ea45b61b8-goog<br>
&gt;&gt; &gt;<br></blockquote><div><br></div><div>Thanks for the feedback. =
I&#39;ll address the issue and apply a new patch.</div><div><br></div><div>=
Willy Tu</div></div></div>

--000000000000fd5e1c05c3472807--
