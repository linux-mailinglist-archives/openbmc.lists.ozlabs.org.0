Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F63A53270C
	for <lists+openbmc@lfdr.de>; Tue, 24 May 2022 12:05:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6qb14Fh9z3bdy
	for <lists+openbmc@lfdr.de>; Tue, 24 May 2022 20:05:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=c0QkGGiM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=9elements.com (client-ip=2607:f8b0:4864:20::52e;
 helo=mail-pg1-x52e.google.com; envelope-from=patrick.rudolph@9elements.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256
 header.s=google header.b=c0QkGGiM; dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6qZb0NRvz30BP
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2022 20:05:25 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id x12so15913238pgj.7
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2022 03:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=9elements.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UAQQ5xAE3jm7woxRSbJRsGDMNAomSjQZ3/qzA3Nz+V8=;
 b=c0QkGGiMKkE5U7mOeWcD3R0/61XEzo1DCOGTJyPyCt8nqxn6vzqwIINBafXkrGgtmY
 cPucqoJ6d4vSBrDLCF/XqxI8ea+nR50frAW4WbPdZKETbhcyRfp91v0eE2K75OC69/He
 gALIOMsFOm2ilLIuCMY1TwVDiDy8WGLLdyKAtTFcMNVylWg/lJgX6UKkuAgmDmLLg64X
 +1xqRHb/WmBg2iKTuk36SAhiOiUrDicQw4vDIPZOD7324HH8ElVhHQakotZIwhmnZMrw
 Qjs2mMhvjH6xwQ7E4nvQv2eUevoSCKGoev2FPxSEQ0kh0m0HYmK26DJzjgRaXy6dAmtC
 we7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UAQQ5xAE3jm7woxRSbJRsGDMNAomSjQZ3/qzA3Nz+V8=;
 b=CHsq37ciuXIc+fxpRwbSYGuAQtMicAmtpkqi7rnCvyXc5gmh5Na6W3f9TmVq5ttwc/
 hY7NNDBg40WuKZChHLL4Y9OeWzUvANWJCX1ZrWNN2i6yvybvAfZ1/UWbDmiFZflhvfBw
 P2lCKSrUlQej772HYUrgjVdM0BWRzQ2tRo86v9qVRbWVojiIWJ/XH6aNg7VoxjYiH/a+
 QRHQtUvX9vmTqC7YjeaCp08oFNnJjavJOIkG0sacEKEVtT+J5tZ1nSzhmyVYSRM6eFv/
 VB2L/lUBQTsvkDDKaDkHFjq7tpHK3DcPqqiMrbalfXqnNVxCuIvOm0OgxRsigNP5JF2V
 8meQ==
X-Gm-Message-State: AOAM531869TUpWQNqyjO2jBIkPTAhpS2z8D8eQytIxvugUEaOjVydBJY
 KOKTc9Ltr2RdVo479FZ4LKvI1iIQycyxp3MSDkRrUQ==
X-Google-Smtp-Source: ABdhPJxQ8dqZi1pWkhOSv7kXHrKjWrpAMqaPqdMRK3qxVVPu+/Tkg5d2P0VfbeF2hPUVabXLJUzdg9XUDjFGr0pMMaE=
X-Received: by 2002:a63:6b42:0:b0:3da:ebd8:2e38 with SMTP id
 g63-20020a636b42000000b003daebd82e38mr24093131pgc.273.1653386722288; Tue, 24
 May 2022 03:05:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220523134004.469176-1-patrick.rudolph@9elements.com>
 <20220523134004.469176-3-patrick.rudolph@9elements.com>
 <20220523230656.GL11809@packtop>
 <CALNFmy3mLZQ=zgXcQ1Qa2NMb5=c9tSJ34b-1-MHDZ9DxydECxQ@mail.gmail.com>
 <Yoym7lELvEgiF8Li@hatter.bewilderbeest.net>
In-Reply-To: <Yoym7lELvEgiF8Li@hatter.bewilderbeest.net>
From: Patrick Rudolph <patrick.rudolph@9elements.com>
Date: Tue, 24 May 2022 12:05:11 +0200
Message-ID: <CALNFmy3FXUnLJs2xp327tKhZi19Mhbg9OzbX_f-7okgGaa5=eA@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v4 2/2] arm/mach-aspeed:
 Add support for CONFIG_ASPEED_DEBUG_UART_TO_UART1
To: Zev Weiss <zev@bewilderbeest.net>
Content-Type: multipart/alternative; boundary="00000000000042411005dfbf18fc"
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
Cc: "takken@us.ibm.com" <takken@us.ibm.com>, Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "christian.walter@9elements.com" <christian.walter@9elements.com>,
 "joel@jms.id.au" <joel@jms.id.au>, Zev Weiss <zweiss@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000042411005dfbf18fc
Content-Type: text/plain; charset="UTF-8"

On Tue, May 24, 2022 at 11:35 AM Zev Weiss <zev@bewilderbeest.net> wrote:

> On Tue, May 24, 2022 at 02:30:02AM PDT, Patrick Rudolph wrote:
> > On Tue, May 24, 2022 at 1:07 AM Zev Weiss <zweiss@equinix.com> wrote:
> >
> > > On Mon, May 23, 2022 at 06:40:04AM PDT, Patrick Rudolph wrote:
> > > >Introduce CONFIG_ASPEED_DEBUG_UART_TO_UART1 and reuse existing
> > > >platform code to route the debug uart to RDX1/TDX1.
> > > >This is required on IBM/Genesis3 as it uses RDX1/TDX1 as debug uart.
> > > >
> > > >Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> > > >Reviewed-by: Joel Stanley <joel@jms.id.au>
> > > >---
> > > > arch/arm/mach-aspeed/Kconfig            | 5 +++++
> > > > arch/arm/mach-aspeed/ast2500/platform.S | 2 +-
> > > > 2 files changed, 6 insertions(+), 1 deletion(-)
> > > >
> > > >diff --git a/arch/arm/mach-aspeed/Kconfig
> b/arch/arm/mach-aspeed/Kconfig
> > > >index edb5520aec..a38f070381 100644
> > > >--- a/arch/arm/mach-aspeed/Kconfig
> > > >+++ b/arch/arm/mach-aspeed/Kconfig
> > > >@@ -82,6 +82,11 @@ config ASPEED_ENABLE_DEBUG_UART
> > > >         systems, but may be useful to enable for debugging during
> > > >         development.
> > > >
> > > >+config ASPEED_DEBUG_UART_TO_UART1
> > > >+      bool "Route debug UART to UART1"
> > > >+      depends on ASPEED_AST2500
> > > >+      help
> > > >+        Route debug UART to TXD1/RXD1 pins.
> > >
> > > Any reason not to put this in 'if ASPEED_ENABLE_DEBUG_UART' as
> suggested
> > > in the previous review?  And since that one already has the
> > > ASPEED_AST2500 dependency, I think it'd obviate the need to have that
> > > specified on ASPEED_DEBUG_UART_TO_UART1.
> > >
> > > While we're at it, slightly more detail in the help text would good I
> > > think, perhaps just "... instead of the default TXD5/RXD5."
> > >
> > > Though actually, looking at the datasheet I'm now not certain if this
> > > does exactly what I had been thinking previously -- if I'm
> understanding
> > > it right, it's not so much switching the debug-UART functionality from
> > > UART5 to UART1, it's re-routing UART5 itself to the I/Os typically used
> > > for UART1?  Which seems somewhat different, and I guess would
> ultimately
> > > be independent of the debug-UART itself being enabled or disabled, in
> > > which case maybe what I said earlier wasn't entirely
> appropriate...maybe
> > > someone with more expertise on the ast2500 UARTs (e.g. Andrew?) can
> > > weigh in?
> > >
> > > As I understand it only re-routes the UART5 to UART1 I/Os. However it
> > doesn't make any
> > sense to re-route the UART5 if it's disabled.
> > I'll push a new patch.
> >
>
> Bear in mind that there's a difference between UART5 and the debug-UART
> feature that can be enabled -- UART5 is a UART pretty much like all the
> others, but it happens to be the one on which the debug feature operates
> by default (listening for a secret password and providing access to
> various special operations via a simple command-line interface).  Even
> with CONFIG_ASPEED_ENABLE_DEBUG_UART=n, UART5 is still available for use
> as a normal UART, it just doesn't have that magic debug capability
> turned on.
>
> Oh, I didn't know that. With that knowledge there should be no need to
depend on the
CONFIG_ASPEED_ENABLE_DEBUG_UART when re-routing uart5.
I'll try another aproach.

>
> Zev
>
>

--00000000000042411005dfbf18fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Tue, May 24, 2022 at 11:35 AM Zev Weis=
s &lt;<a href=3D"mailto:zev@bewilderbeest.net">zev@bewilderbeest.net</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue,=
 May 24, 2022 at 02:30:02AM PDT, Patrick Rudolph wrote:<br>
&gt; On Tue, May 24, 2022 at 1:07 AM Zev Weiss &lt;<a href=3D"mailto:zweiss=
@equinix.com" target=3D"_blank">zweiss@equinix.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Mon, May 23, 2022 at 06:40:04AM PDT, Patrick Rudolph wrote:<br=
>
&gt; &gt; &gt;Introduce CONFIG_ASPEED_DEBUG_UART_TO_UART1 and reuse existin=
g<br>
&gt; &gt; &gt;platform code to route the debug uart to RDX1/TDX1.<br>
&gt; &gt; &gt;This is required on IBM/Genesis3 as it uses RDX1/TDX1 as debu=
g uart.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;Signed-off-by: Patrick Rudolph &lt;<a href=3D"mailto:patrick.=
rudolph@9elements.com" target=3D"_blank">patrick.rudolph@9elements.com</a>&=
gt;<br>
&gt; &gt; &gt;Reviewed-by: Joel Stanley &lt;<a href=3D"mailto:joel@jms.id.a=
u" target=3D"_blank">joel@jms.id.au</a>&gt;<br>
&gt; &gt; &gt;---<br>
&gt; &gt; &gt; arch/arm/mach-aspeed/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 5 +++++<br>
&gt; &gt; &gt; arch/arm/mach-aspeed/ast2500/platform.S | 2 +-<br>
&gt; &gt; &gt; 2 files changed, 6 insertions(+), 1 deletion(-)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;diff --git a/arch/arm/mach-aspeed/Kconfig b/arch/arm/mach-asp=
eed/Kconfig<br>
&gt; &gt; &gt;index edb5520aec..a38f070381 100644<br>
&gt; &gt; &gt;--- a/arch/arm/mach-aspeed/Kconfig<br>
&gt; &gt; &gt;+++ b/arch/arm/mach-aspeed/Kconfig<br>
&gt; &gt; &gt;@@ -82,6 +82,11 @@ config ASPEED_ENABLE_DEBUG_UART<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0systems, but may be useful =
to enable for debugging during<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0development.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;+config ASPEED_DEBUG_UART_TO_UART1<br>
&gt; &gt; &gt;+=C2=A0 =C2=A0 =C2=A0 bool &quot;Route debug UART to UART1&qu=
ot;<br>
&gt; &gt; &gt;+=C2=A0 =C2=A0 =C2=A0 depends on ASPEED_AST2500<br>
&gt; &gt; &gt;+=C2=A0 =C2=A0 =C2=A0 help<br>
&gt; &gt; &gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Route debug UART to TXD1/RXD1 pi=
ns.<br>
&gt; &gt;<br>
&gt; &gt; Any reason not to put this in &#39;if ASPEED_ENABLE_DEBUG_UART&#3=
9; as suggested<br>
&gt; &gt; in the previous review?=C2=A0 And since that one already has the<=
br>
&gt; &gt; ASPEED_AST2500 dependency, I think it&#39;d obviate the need to h=
ave that<br>
&gt; &gt; specified on ASPEED_DEBUG_UART_TO_UART1.<br>
&gt; &gt;<br>
&gt; &gt; While we&#39;re at it, slightly more detail in the help text woul=
d good I<br>
&gt; &gt; think, perhaps just &quot;... instead of the default TXD5/RXD5.&q=
uot;<br>
&gt; &gt;<br>
&gt; &gt; Though actually, looking at the datasheet I&#39;m now not certain=
 if this<br>
&gt; &gt; does exactly what I had been thinking previously -- if I&#39;m un=
derstanding<br>
&gt; &gt; it right, it&#39;s not so much switching the debug-UART functiona=
lity from<br>
&gt; &gt; UART5 to UART1, it&#39;s re-routing UART5 itself to the I/Os typi=
cally used<br>
&gt; &gt; for UART1?=C2=A0 Which seems somewhat different, and I guess woul=
d ultimately<br>
&gt; &gt; be independent of the debug-UART itself being enabled or disabled=
, in<br>
&gt; &gt; which case maybe what I said earlier wasn&#39;t entirely appropri=
ate...maybe<br>
&gt; &gt; someone with more expertise on the ast2500 UARTs (e.g. Andrew?) c=
an<br>
&gt; &gt; weigh in?<br>
&gt; &gt;<br>
&gt; &gt; As I understand it only re-routes the UART5 to UART1 I/Os. Howeve=
r it<br>
&gt; doesn&#39;t make any<br>
&gt; sense to re-route the UART5 if it&#39;s disabled.<br>
&gt; I&#39;ll push a new patch.<br>
&gt; <br>
<br>
Bear in mind that there&#39;s a difference between UART5 and the debug-UART=
 <br>
feature that can be enabled -- UART5 is a UART pretty much like all the <br=
>
others, but it happens to be the one on which the debug feature operates <b=
r>
by default (listening for a secret password and providing access to <br>
various special operations via a simple command-line interface).=C2=A0 Even=
 <br>
with CONFIG_ASPEED_ENABLE_DEBUG_UART=3Dn, UART5 is still available for use =
<br>
as a normal UART, it just doesn&#39;t have that magic debug capability <br>
turned on.<br>
<br></blockquote><div>Oh, I didn&#39;t know that. With that knowledge there=
 should be no need to depend on the</div><div>CONFIG_ASPEED_ENABLE_DEBUG_UA=
RT when re-routing uart5.</div><div>I&#39;ll try another aproach.<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Zev<br>
<br>
</blockquote></div></div>

--00000000000042411005dfbf18fc--
