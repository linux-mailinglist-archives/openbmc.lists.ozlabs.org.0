Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4EF391C6A
	for <lists+openbmc@lfdr.de>; Wed, 26 May 2021 17:50:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqwPp2wrTz2ymR
	for <lists+openbmc@lfdr.de>; Thu, 27 May 2021 01:50:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=K4fhmDmY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=wltu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=K4fhmDmY; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FqwPR6zbyz2y6B
 for <openbmc@lists.ozlabs.org>; Thu, 27 May 2021 01:49:47 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id d20so812928pls.13
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 08:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A+7N1LTngdO4E13SPtSsb3UIZElhxwOJThqt0owbdFE=;
 b=K4fhmDmYW3XCaC+nTQ2vH1V5yz8M5pgdB8fF126UxH0xWCrPht/X5/pjx/rGiyeZln
 evwsV/hyvWJ+Wf4TWdN+Wv0Bri+AI8KNbRrD5aT/uX4hBPWrZKgt9kHmz4/zHMEzhryg
 gfZPT1gRMgRQea5vn9H3LBZS0gdCOrFEa96npILCWHfTji+u6h10pXZp4omT7q9gR4hN
 IpnKTEi5wZSQfosLzsKnn+O6OAUH8AxnoSz1+ff5g+tag0A5Zmhg4sx7+RSulnBwxXog
 89ic/+OIi9r63VI0mpHLZCE82Od1IwXa8Ar2M9CyJ3dnWUFJnvmVNmHll3l4ZNuEOC+b
 Y6oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A+7N1LTngdO4E13SPtSsb3UIZElhxwOJThqt0owbdFE=;
 b=OEEdSwUmU1mC/eZBYdfUTocbGIwkku8geSm7pntZY5S1xulvi7sG4PzXQOkhwSBdEa
 lC2t+mOlw3thKw9Q9UEDzWaQyNOHGHIrwQG3gQ4+YHZZdCfLfDTell8uD5kCw4UYrcsT
 OPoBrD8X7OCB+Gv7KC8DpwuRR83K0zbAf41Z3sKtafC1Sk8p+1IzawiooggRXvBxHCCw
 EgXAFWzOoJ5pO/v3RS8c4N2ok1neUMSf/N/EA3W436tmP5SUGYVCd8nt+W/5fflywn26
 94t2F3GWWH4zHTmaWq64A9HRttPxCdtUesz0u5qC0dqTOdQLaWVgm7yFlfVQtOopaKQx
 GwPw==
X-Gm-Message-State: AOAM532rtmMlE4zlJ54VxR3Ydy691cD5I1LFJA6pqWcEVg8mnnzTy9HD
 0RPUV5HXB6JsO+zdJtLdGHTZHP2aX3lJU3kNbdW0Jw==
X-Google-Smtp-Source: ABdhPJyexezYbAFdao7C4zTyo1DPsCqDilfO9SIh8ptU+2tzkuKB13YoOGcZXFO1ieulvidcMN4ZXBryl8wIMAHWPr4=
X-Received: by 2002:a17:902:c104:b029:ef:836e:15d6 with SMTP id
 4-20020a170902c104b02900ef836e15d6mr36723034pli.39.1622044184606; Wed, 26 May
 2021 08:49:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210413161150.2815450-1-wltu@google.com>
 <CACPK8Xe7zhHbc4Ye3M8w6FLZyTxTxq6U8dX=L7x8cMkS3JSDaQ@mail.gmail.com>
 <CAHwn2Xnd2TGfe2Oo+3fJoLkfzng5H=fjZH8_pgQ_fSScJxiX1g@mail.gmail.com>
In-Reply-To: <CAHwn2Xnd2TGfe2Oo+3fJoLkfzng5H=fjZH8_pgQ_fSScJxiX1g@mail.gmail.com>
From: Willy Tu <wltu@google.com>
Date: Wed, 26 May 2021 08:49:33 -0700
Message-ID: <CAHwn2XnT-Fu_Ys_HRFWA7g7dwsNNXJ0V4FtS9_PdX29x_eYgQA@mail.gmail.com>
Subject: Re: [PATCH] board: ast2400: Enable SGPIO in SCU
To: Joel Stanley <joel@jms.id.au>
Content-Type: multipart/alternative; boundary="0000000000006f805605c33d9770"
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

--0000000000006f805605c33d9770
Content-Type: text/plain; charset="UTF-8"

ping

On Tue, Apr 13, 2021 at 5:06 PM Willy Tu <wltu@google.com> wrote:

> Hi Joel,
>
> thanks for the response.
>
> Sorry, I did not update the patch to include the branch name. I'll be more
> careful next time.
>
> This change should be in `v2019.04-aspeed-openbmc` and the other patch in
> https://lore.kernel.org/openbmc/20210413161238.2816187-1-wltu@google.com/ should
> be in `v2016.07-aspeed-openbmc`.
>
> I have not tested this change, but have tested
> https://lore.kernel.org/openbmc/20210413161238.2816187-1-wltu@google.com/ that
> I based off of (Which I have tested with my setup). Will that be an issue?
>
> Best,
>
> Willy Tu
>
> On Tue, Apr 13, 2021 at 4:32 PM Joel Stanley <joel@jms.id.au> wrote:
>
>> Hi Willy,
>>
>> On Tue, 13 Apr 2021 at 16:11, Willy Tu <wltu@google.com> wrote:
>> >
>> > Add option to enable register for SGPIO in SCU.
>> >
>> > Included new function register values for ast2400
>> > SCU and enable the SGPIO function in board init.
>>
>> Which branch would you like this patch applied to?
>>
>> >
>> > Signed-off-by: Willy Tu <wltu@google.com>
>> > ---
>> >  arch/arm/include/asm/arch-aspeed/scu_ast2400.h |  4 ++++
>> >  arch/arm/mach-aspeed/ast2400/Kconfig           |  4 ++++
>> >  arch/arm/mach-aspeed/ast2400/board_common.c    | 15 +++++++++++++++
>> >  3 files changed, 23 insertions(+)
>> >
>> > diff --git a/arch/arm/include/asm/arch-aspeed/scu_ast2400.h
>> b/arch/arm/include/asm/arch-aspeed/scu_ast2400.h
>> > index 9c5d96ae84..17eaaf3e9d 100644
>> > --- a/arch/arm/include/asm/arch-aspeed/scu_ast2400.h
>> > +++ b/arch/arm/include/asm/arch-aspeed/scu_ast2400.h
>> > @@ -75,6 +75,10 @@
>> >  #define SCU_PIN_FUN_SCL2               (1 << 14)
>> >  #define SCU_PIN_FUN_SDA1               (1 << 13)
>> >  #define SCU_PIN_FUN_SDA2               (1 << 15)
>> > +#define SCU_PIN_FUN_SGPMCK             (0x1 << 8)
>> > +#define SCU_PIN_FUN_SGPMLD             (0x1 << 9)
>> > +#define SCU_PIN_FUN_SGPMO              (0x1 << 10)
>> > +#define SCU_PIN_FUN_SGPMI              (0x1 << 11)
>> >
>> >  #define SCU_D2PLL_EXT1_OFF             (1 << 0)
>> >  #define SCU_D2PLL_EXT1_BYPASS          (1 << 1)
>> > diff --git a/arch/arm/mach-aspeed/ast2400/Kconfig
>> b/arch/arm/mach-aspeed/ast2400/Kconfig
>> > index f76276860c..c4e88b5140 100644
>> > --- a/arch/arm/mach-aspeed/ast2400/Kconfig
>> > +++ b/arch/arm/mach-aspeed/ast2400/Kconfig
>> > @@ -17,6 +17,10 @@ config TARGET_EVB_AST2400
>> >           20 pin JTAG, pinouts for 14 I2Cs, 3 SPIs and eSPI, 8 PWMs.
>> >  endchoice
>> >
>> > +config ENABLE_SGPIO
>> > +    tristate "Enable SGPIO in SCU"
>> > +       default n
>> > +
>> >  source "board/aspeed/evb_ast2400/Kconfig"
>> >
>> >  endif
>> > diff --git a/arch/arm/mach-aspeed/ast2400/board_common.c
>> b/arch/arm/mach-aspeed/ast2400/board_common.c
>> > index 3829b06934..eca2ef03e5 100644
>> > --- a/arch/arm/mach-aspeed/ast2400/board_common.c
>> > +++ b/arch/arm/mach-aspeed/ast2400/board_common.c
>> > @@ -14,6 +14,21 @@ __weak int board_init(void)
>> >  {
>> >         gd->bd->bi_boot_params = CONFIG_SYS_SDRAM_BASE + 0x100;
>> >
>> > +#ifdef CONFIG_ENABLE_SGPIO
>> > +#define SCU_BASE 0x1e6e2000
>> > +#define SCU_FUN_PIN_CTRL2 0x84 /* Multi-function Pin Control#2*/
>> > +       /* Unlock SCU */
>> > +       writel(SCU_UNLOCK_VALUE, SCU_BASE);
>> > +
>> > +       /* Enable SGPIO Master */
>> > +       u32 reg = readl(SCU_BASE + SCU_FUN_PIN_CTRL2);
>> > +
>> > +       reg |= (SCU_PIN_FUN_SGPMI  |
>> > +                       SCU_PIN_FUN_SGPMO  |
>> > +                       SCU_PIN_FUN_SGPMLD |
>> > +                       SCU_PIN_FUN_SGPMCK);
>> > +       writel(reg, SCU_BASE + SCU_FUN_PIN_CTRL2);
>> > +#endif
>> >         return 0;
>> >  }
>> >
>> > --
>> > 2.31.1.295.g9ea45b61b8-goog
>> >
>>
>

--0000000000006f805605c33d9770
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Apr 13, 2021 at 5:06 PM Willy Tu &lt;<a href=
=3D"mailto:wltu@google.com">wltu@google.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi Joel,<div><b=
r></div><div>thanks for the response.<div><br></div><div>Sorry, I did not u=
pdate the patch to include the branch name. I&#39;ll be more careful next t=
ime.<br></div><div><br></div><div>This change should be in `v2019.04-aspeed=
-openbmc` and the other patch in=C2=A0<a href=3D"https://lore.kernel.org/op=
enbmc/20210413161238.2816187-1-wltu@google.com/" target=3D"_blank">https://=
lore.kernel.org/openbmc/20210413161238.2816187-1-wltu@google.com/</a>=C2=A0=
should be in `v2016.07-aspeed-openbmc`.</div><div><br></div><div>I have not=
 tested this change, but have tested=C2=A0=C2=A0<a href=3D"https://lore.ker=
nel.org/openbmc/20210413161238.2816187-1-wltu@google.com/" target=3D"_blank=
">https://lore.kernel.org/openbmc/20210413161238.2816187-1-wltu@google.com/=
</a>=C2=A0that I based off of (Which I have tested with my setup). Will tha=
t be an issue?</div><div><br></div><div>Best,</div><div><br></div><div>Will=
y Tu</div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Apr 13, 2021 at 4:32 PM Joel Stanley &lt;<a href=3D=
"mailto:joel@jms.id.au" target=3D"_blank">joel@jms.id.au</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Willy,<br>
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
</blockquote></div>

--0000000000006f805605c33d9770--
