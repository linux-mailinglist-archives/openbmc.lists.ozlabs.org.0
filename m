Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B048C532670
	for <lists+openbmc@lfdr.de>; Tue, 24 May 2022 11:30:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6ppT4FSmz3bYk
	for <lists+openbmc@lfdr.de>; Tue, 24 May 2022 19:30:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=bQcwnj1L;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=9elements.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=patrick.rudolph@9elements.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256
 header.s=google header.b=bQcwnj1L; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6pp25J2Dz308C
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2022 19:30:16 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id
 v5-20020a17090a7c0500b001df84fa82f8so1652908pjf.5
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2022 02:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=9elements.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3ziZoDfvg2Fy26KgM5cr4/IMjj75oxiLq6V8ccRkF1A=;
 b=bQcwnj1L2N+FAW2l6eGJ0N0aD3AafkxOPtMCCEJ/mkvkG7Ah1y6kbs2+TBMuWEzSnH
 PxVqq0x7zeRyl2JnJTsESx4t64DvxvmRMEp4gi6zINLmj4x+fQqTUme6ir9uiX+NySAt
 z7cKlDlJoR5XIe55OkEEB9fxHETYXeKWyIdWxC3hrZMUy2FRutwpgswGHqcbglK5uk55
 Qur0D0fJPY37r4nE1cEVIaqK25cIbrtEwEBFnAAwq+hoQBg754G1lE5tXD86cZg9hN2C
 fCwFrAIyCdSIuraIIegLvWvsfIuW0wbMjbVQWGCI7cTXAGjW21AGguC3uuS/JvLTJWYf
 Vmng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3ziZoDfvg2Fy26KgM5cr4/IMjj75oxiLq6V8ccRkF1A=;
 b=iGRRwQ8GFucgGFmwPy1wI7DePfO58aaCK0WiDxIsiGg7m0M/XpcNvLySwc6Xo/WRo9
 dXINHY+eAOLe+51SlOM6J/jcavcbgfRTYzpjMLRS01m2nFkbZVIYBd8+yT/YHdkPmlVn
 GRCqcJ/aeCGvwxnyNAcEjW73kazEPRxjNH0WenNIJLPjkEztzVlcmM92/W6dKZcU86I6
 6Nbdcs7eMwszxOJ0FtIZu9Jmw+Vj/64YsRJ1NgDtHJwRo7C3PRUWKJg5k6lG5CVyA1zy
 +RX+0pxNj4/eBzM/wr5IhXLiO0YzZSMYX98xHoKQKvy1J59McdUJjwahk5klwmZeUgWV
 agww==
X-Gm-Message-State: AOAM530GS5kOCdNK24w4LPL9dGwYGu6JBJT18nduNb6r1pBPmGHsusZ4
 yXR12nYfZyKzGzI5s+3zaene4cmJu7udMjgFwQ17l9HJvSHjng==
X-Google-Smtp-Source: ABdhPJwgXkpX1GMo2SReg/H3zDSyCRgjeEn3yRuiT6bXrbrs/v/meMBAp8+nZgBG8lrDj/dBoVxmULesDrBHdNmICbk=
X-Received: by 2002:a17:90a:ba11:b0:1df:2d09:1308 with SMTP id
 s17-20020a17090aba1100b001df2d091308mr3617378pjr.184.1653384612955; Tue, 24
 May 2022 02:30:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220523134004.469176-1-patrick.rudolph@9elements.com>
 <20220523134004.469176-3-patrick.rudolph@9elements.com>
 <20220523230656.GL11809@packtop>
In-Reply-To: <20220523230656.GL11809@packtop>
From: Patrick Rudolph <patrick.rudolph@9elements.com>
Date: Tue, 24 May 2022 11:30:02 +0200
Message-ID: <CALNFmy3mLZQ=zgXcQ1Qa2NMb5=c9tSJ34b-1-MHDZ9DxydECxQ@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v4 2/2] arm/mach-aspeed:
 Add support for CONFIG_ASPEED_DEBUG_UART_TO_UART1
To: Zev Weiss <zweiss@equinix.com>
Content-Type: multipart/alternative; boundary="0000000000008860df05dfbe9a1e"
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
Cc: "takken@us.ibm.com" <takken@us.ibm.com>,
 "zev@bewilderbeest.net" <zev@bewilderbeest.net>,
 Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "christian.walter@9elements.com" <christian.walter@9elements.com>,
 "joel@jms.id.au" <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000008860df05dfbe9a1e
Content-Type: text/plain; charset="UTF-8"

On Tue, May 24, 2022 at 1:07 AM Zev Weiss <zweiss@equinix.com> wrote:

> On Mon, May 23, 2022 at 06:40:04AM PDT, Patrick Rudolph wrote:
> >Introduce CONFIG_ASPEED_DEBUG_UART_TO_UART1 and reuse existing
> >platform code to route the debug uart to RDX1/TDX1.
> >This is required on IBM/Genesis3 as it uses RDX1/TDX1 as debug uart.
> >
> >Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> >Reviewed-by: Joel Stanley <joel@jms.id.au>
> >---
> > arch/arm/mach-aspeed/Kconfig            | 5 +++++
> > arch/arm/mach-aspeed/ast2500/platform.S | 2 +-
> > 2 files changed, 6 insertions(+), 1 deletion(-)
> >
> >diff --git a/arch/arm/mach-aspeed/Kconfig b/arch/arm/mach-aspeed/Kconfig
> >index edb5520aec..a38f070381 100644
> >--- a/arch/arm/mach-aspeed/Kconfig
> >+++ b/arch/arm/mach-aspeed/Kconfig
> >@@ -82,6 +82,11 @@ config ASPEED_ENABLE_DEBUG_UART
> >         systems, but may be useful to enable for debugging during
> >         development.
> >
> >+config ASPEED_DEBUG_UART_TO_UART1
> >+      bool "Route debug UART to UART1"
> >+      depends on ASPEED_AST2500
> >+      help
> >+        Route debug UART to TXD1/RXD1 pins.
>
> Any reason not to put this in 'if ASPEED_ENABLE_DEBUG_UART' as suggested
> in the previous review?  And since that one already has the
> ASPEED_AST2500 dependency, I think it'd obviate the need to have that
> specified on ASPEED_DEBUG_UART_TO_UART1.
>
> While we're at it, slightly more detail in the help text would good I
> think, perhaps just "... instead of the default TXD5/RXD5."
>
> Though actually, looking at the datasheet I'm now not certain if this
> does exactly what I had been thinking previously -- if I'm understanding
> it right, it's not so much switching the debug-UART functionality from
> UART5 to UART1, it's re-routing UART5 itself to the I/Os typically used
> for UART1?  Which seems somewhat different, and I guess would ultimately
> be independent of the debug-UART itself being enabled or disabled, in
> which case maybe what I said earlier wasn't entirely appropriate...maybe
> someone with more expertise on the ast2500 UARTs (e.g. Andrew?) can
> weigh in?
>
> As I understand it only re-routes the UART5 to UART1 I/Os. However it
doesn't make any
sense to re-route the UART5 if it's disabled.
I'll push a new patch.

> endif
> >
> > config ASPEED_PALLADIUM
> >diff --git a/arch/arm/mach-aspeed/ast2500/platform.S
> b/arch/arm/mach-aspeed/ast2500/platform.S
> >index aef55c4a0a..a97ebebcca 100644
> >--- a/arch/arm/mach-aspeed/ast2500/platform.S
> >+++ b/arch/arm/mach-aspeed/ast2500/platform.S
> >@@ -795,7 +795,7 @@ wait_ddr_reset:
> >     /* end delay 10ms */
> >
> > /* Debug - UART console message */
> >-#ifdef CONFIG_DRAM_UART_TO_UART1
> >+#ifdef CONFIG_ASPEED_DEBUG_UART_TO_UART1
> >     ldr   r0, =0x1e78909c                        @ route UART5 to UART
> Port1, 2016.08.29
> >     ldr   r1, =0x10000004
> >     str   r1, [r0]
> >--
> >2.35.3
> >

--0000000000008860df05dfbe9a1e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, May 24, 2022 at 1:07 AM Zev Weiss &lt;<a href=3D"mailto:zwei=
ss@equinix.com">zweiss@equinix.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On Mon, May 23, 2022 at 06:40:04AM PDT, P=
atrick Rudolph wrote:<br>
&gt;Introduce CONFIG_ASPEED_DEBUG_UART_TO_UART1 and reuse existing<br>
&gt;platform code to route the debug uart to RDX1/TDX1.<br>
&gt;This is required on IBM/Genesis3 as it uses RDX1/TDX1 as debug uart.<br=
>
&gt;<br>
&gt;Signed-off-by: Patrick Rudolph &lt;<a href=3D"mailto:patrick.rudolph@9e=
lements.com" target=3D"_blank">patrick.rudolph@9elements.com</a>&gt;<br>
&gt;Reviewed-by: Joel Stanley &lt;<a href=3D"mailto:joel@jms.id.au" target=
=3D"_blank">joel@jms.id.au</a>&gt;<br>
&gt;---<br>
&gt; arch/arm/mach-aspeed/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
| 5 +++++<br>
&gt; arch/arm/mach-aspeed/ast2500/platform.S | 2 +-<br>
&gt; 2 files changed, 6 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt;diff --git a/arch/arm/mach-aspeed/Kconfig b/arch/arm/mach-aspeed/Kconfi=
g<br>
&gt;index edb5520aec..a38f070381 100644<br>
&gt;--- a/arch/arm/mach-aspeed/Kconfig<br>
&gt;+++ b/arch/arm/mach-aspeed/Kconfig<br>
&gt;@@ -82,6 +82,11 @@ config ASPEED_ENABLE_DEBUG_UART<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0systems, but may be useful to enable =
for debugging during<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0development.<br>
&gt;<br>
&gt;+config ASPEED_DEBUG_UART_TO_UART1<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 bool &quot;Route debug UART to UART1&quot;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 depends on ASPEED_AST2500<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 help<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Route debug UART to TXD1/RXD1 pins.<br>
<br>
Any reason not to put this in &#39;if ASPEED_ENABLE_DEBUG_UART&#39; as sugg=
ested<br>
in the previous review?=C2=A0 And since that one already has the<br>
ASPEED_AST2500 dependency, I think it&#39;d obviate the need to have that<b=
r>
specified on ASPEED_DEBUG_UART_TO_UART1.<br>
<br>
While we&#39;re at it, slightly more detail in the help text would good I<b=
r>
think, perhaps just &quot;... instead of the default TXD5/RXD5.&quot;<br>
<br>
Though actually, looking at the datasheet I&#39;m now not certain if this<b=
r>
does exactly what I had been thinking previously -- if I&#39;m understandin=
g<br>
it right, it&#39;s not so much switching the debug-UART functionality from<=
br>
UART5 to UART1, it&#39;s re-routing UART5 itself to the I/Os typically used=
<br>
for UART1?=C2=A0 Which seems somewhat different, and I guess would ultimate=
ly<br>
be independent of the debug-UART itself being enabled or disabled, in<br>
which case maybe what I said earlier wasn&#39;t entirely appropriate...mayb=
e<br>
someone with more expertise on the ast2500 UARTs (e.g. Andrew?) can<br>
weigh in?<br>
<br></blockquote><div>As I understand it only re-routes the UART5 to UART1 =
I/Os. However it doesn&#39;t make any</div><div>sense to re-route the UART5=
 if it&#39;s disabled.</div><div>I&#39;ll push a new patch.<br></div><div><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; endif<br>
&gt;<br>
&gt; config ASPEED_PALLADIUM<br>
&gt;diff --git a/arch/arm/mach-aspeed/ast2500/platform.S b/arch/arm/mach-as=
peed/ast2500/platform.S<br>
&gt;index aef55c4a0a..a97ebebcca 100644<br>
&gt;--- a/arch/arm/mach-aspeed/ast2500/platform.S<br>
&gt;+++ b/arch/arm/mach-aspeed/ast2500/platform.S<br>
&gt;@@ -795,7 +795,7 @@ wait_ddr_reset:<br>
&gt;=C2=A0 =C2=A0 =C2=A0/* end delay 10ms */<br>
&gt;<br>
&gt; /* Debug - UART console message */<br>
&gt;-#ifdef CONFIG_DRAM_UART_TO_UART1<br>
&gt;+#ifdef CONFIG_ASPEED_DEBUG_UART_TO_UART1<br>
&gt;=C2=A0 =C2=A0 =C2=A0ldr=C2=A0 =C2=A0r0, =3D0x1e78909c=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @ route =
UART5 to UART Port1, 2016.08.29<br>
&gt;=C2=A0 =C2=A0 =C2=A0ldr=C2=A0 =C2=A0r1, =3D0x10000004<br>
&gt;=C2=A0 =C2=A0 =C2=A0str=C2=A0 =C2=A0r1, [r0]<br>
&gt;-- <br>
&gt;2.35.3<br>
&gt;</blockquote></div></div>

--0000000000008860df05dfbe9a1e--
