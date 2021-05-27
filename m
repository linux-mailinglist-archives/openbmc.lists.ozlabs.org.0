Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 871A43924A4
	for <lists+openbmc@lfdr.de>; Thu, 27 May 2021 03:58:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fr9vW4cKcz2yyL
	for <lists+openbmc@lfdr.de>; Thu, 27 May 2021 11:58:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=PwZ5iBrq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f29;
 helo=mail-qv1-xf29.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=PwZ5iBrq; dkim-atps=neutral
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fr9vF4pzjz2xv1
 for <openbmc@lists.ozlabs.org>; Thu, 27 May 2021 11:58:00 +1000 (AEST)
Received: by mail-qv1-xf29.google.com with SMTP id k2so125240qvc.5
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 18:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UnyVQtjPCSEFlVmy7D3Ot3ZkyoqxwXZixPioBDQWsOM=;
 b=PwZ5iBrq3E+VQMWZEeIrq7bEXHvHqi98RnSY6nb1P67z3bfm6H0Mo8MsMSPfW4r+PZ
 xTW4WrGP9dDH4vSNGPeOPbeY6+xZYrgJC8U5YhCJiUqO0NtSU/twUaUmrFwsFhugzrx7
 H8MXwY4k/R7YLn/2hoCQZfyNMLB7HVdWq/Zy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UnyVQtjPCSEFlVmy7D3Ot3ZkyoqxwXZixPioBDQWsOM=;
 b=Fsu3WKVWsU5IfL5AE1eVgJsWtwyRY/5LBsIMIcJkaTmOmobVaopVvd02didwq82Rzg
 VBjthbEKCW2gyYSwFqZZ2I+4R9z8b3mKNnBMhEE92s2UIepMa9sSIGfxZn0aJaeVlEmm
 v6zbnzgJeDGHX2Ecslhxwji+aD3bYlkrLojIwRRHL9htbst/s7upnImwuntOj2LJVy1B
 FZthlhKFGriYZGoiZipwsE6G1cid/qNlv22gHo2YTdceCvvMDumQhrkLLz2nzVlA/XxM
 xvImN+uzMUl4uOwwNsiWQnNu2axsfBKQlPkHu87dZmNrlkFfzHrgNixN9smhZDLnBCQ4
 tS5g==
X-Gm-Message-State: AOAM532juZXsm/P9+HnWfFRxvneu29XTOoa/3QWZlgY0+8Efe0KMZb14
 ER8sVEIFjuJ9MQ3ZtHEd+vn7oXiLmjO4H4Wn3nYAagphFOw=
X-Google-Smtp-Source: ABdhPJzI3agsTsIJjtWai/ZBgHBT6angoAZgGGOHYha0qpNj4lj84W0EFYCkNYJ+hFlI7ImW1P4pI7rFzQpPM0bJq8E=
X-Received: by 2002:ad4:4961:: with SMTP id p1mr1257323qvy.43.1622080677168;
 Wed, 26 May 2021 18:57:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210413161150.2815450-1-wltu@google.com>
 <CACPK8Xe7zhHbc4Ye3M8w6FLZyTxTxq6U8dX=L7x8cMkS3JSDaQ@mail.gmail.com>
 <CAHwn2Xnd2TGfe2Oo+3fJoLkfzng5H=fjZH8_pgQ_fSScJxiX1g@mail.gmail.com>
In-Reply-To: <CAHwn2Xnd2TGfe2Oo+3fJoLkfzng5H=fjZH8_pgQ_fSScJxiX1g@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 27 May 2021 01:57:44 +0000
Message-ID: <CACPK8XcfnYz9LH2eScKhiEAi1w76YPpJNUk+kjqYN1sEcGMjSw@mail.gmail.com>
Subject: Re: [PATCH] board: ast2400: Enable SGPIO in SCU
To: Willy Tu <wltu@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, 14 Apr 2021 at 00:06, Willy Tu <wltu@google.com> wrote:
>
> Hi Joel,
>
> thanks for the response.
>
> Sorry, I did not update the patch to include the branch name. I'll be mor=
e careful next time.
>
> This change should be in `v2019.04-aspeed-openbmc` and the other patch in=
 https://lore.kernel.org/openbmc/20210413161238.2816187-1-wltu@google.com/ =
should be in `v2016.07-aspeed-openbmc`.

Okay.

> I have not tested this change, but have tested  https://lore.kernel.org/o=
penbmc/20210413161238.2816187-1-wltu@google.com/ that I based off of (Which=
 I have tested with my setup). Will that be an issue?

What branch are you using for your system?

I strongly encourage you to use the 2019.04 branch if at all possible.

Some review below.

> On Tue, Apr 13, 2021 at 4:32 PM Joel Stanley <joel@jms.id.au> wrote:
>>
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
>> > diff --git a/arch/arm/include/asm/arch-aspeed/scu_ast2400.h b/arch/arm=
/include/asm/arch-aspeed/scu_ast2400.h
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
>> > diff --git a/arch/arm/mach-aspeed/ast2400/Kconfig b/arch/arm/mach-aspe=
ed/ast2400/Kconfig
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

Note that this is the default default in kconfig, you only need to
specify a default if you want some other behaviour.

>> > @@ -14,6 +14,21 @@ __weak int board_init(void)
>> >  {
>> >         gd->bd->bi_boot_params =3D CONFIG_SYS_SDRAM_BASE + 0x100;
>> >
>> > +#ifdef CONFIG_ENABLE_SGPIO
>> > +#define SCU_BASE 0x1e6e2000
>> > +#define SCU_FUN_PIN_CTRL2 0x84 /* Multi-function Pin Control#2*/
>> > +       /* Unlock SCU */
>> > +       writel(SCU_UNLOCK_VALUE, SCU_BASE);
>> > +
>> > +       /* Enable SGPIO Master */
>> > +       u32 reg =3D readl(SCU_BASE + SCU_FUN_PIN_CTRL2);
>> > +
>> > +       reg |=3D (SCU_PIN_FUN_SGPMI  |
>> > +                       SCU_PIN_FUN_SGPMO  |
>> > +                       SCU_PIN_FUN_SGPMLD |
>> > +                       SCU_PIN_FUN_SGPMCK);
>> > +       writel(reg, SCU_BASE + SCU_FUN_PIN_CTRL2);
>> > +#endif

Here's what I saw when attempting to compile test your patch:

In file included from ../arch/arm/mach-aspeed/ast2400/board_common.c:6:
../arch/arm/mach-aspeed/ast2400/board_common.c: In function =E2=80=98board_=
init=E2=80=99:
../arch/arm/mach-aspeed/ast2400/board_common.c:21:16: error:
=E2=80=98SCU_UNLOCK_VALUE=E2=80=99 undeclared (first use in this function)
   21 |         writel(SCU_UNLOCK_VALUE, SCU_BASE);
      |                ^~~~~~~~~~~~~~~~
../arch/arm/include/asm/io.h:117:38: note: in definition of macro =E2=80=98=
writel=E2=80=99
  117 | #define writel(v,c)     ({ u32 __v =3D v; __iowmb();
__arch_putl(__v,c); __v; })
      |                                      ^
../arch/arm/mach-aspeed/ast2400/board_common.c:21:16: note: each
undeclared identifier is reported only once for each function it
appears in
   21 |         writel(SCU_UNLOCK_VALUE, SCU_BASE);
      |                ^~~~~~~~~~~~~~~~
../arch/arm/include/asm/io.h:117:38: note: in definition of macro =E2=80=98=
writel=E2=80=99
  117 | #define writel(v,c)     ({ u32 __v =3D v; __iowmb();
__arch_putl(__v,c); __v; })
      |                                      ^
../arch/arm/mach-aspeed/ast2400/board_common.c:26:17: error:
=E2=80=98SCU_PIN_FUN_SGPMI=E2=80=99 undeclared (first use in this function)
   26 |         reg |=3D (SCU_PIN_FUN_SGPMI  |
      |                 ^~~~~~~~~~~~~~~~~
../arch/arm/mach-aspeed/ast2400/board_common.c:27:25: error:
=E2=80=98SCU_PIN_FUN_SGPMO=E2=80=99 undeclared (first use in this function)
   27 |                         SCU_PIN_FUN_SGPMO  |
      |                         ^~~~~~~~~~~~~~~~~
../arch/arm/mach-aspeed/ast2400/board_common.c:28:25: error:
=E2=80=98SCU_PIN_FUN_SGPMLD=E2=80=99 undeclared (first use in this function=
)
   28 |                         SCU_PIN_FUN_SGPMLD |
      |                         ^~~~~~~~~~~~~~~~~~
../arch/arm/mach-aspeed/ast2400/board_common.c:29:25: error:
=E2=80=98SCU_PIN_FUN_SGPMCK=E2=80=99 undeclared (first use in this function=
)
   29 |                         SCU_PIN_FUN_SGPMCK);
      |                         ^~~~~~~~~~~~~~~~~~


>> >         return 0;
>> >  }
>> >
>> > --
>> > 2.31.1.295.g9ea45b61b8-goog
>> >
