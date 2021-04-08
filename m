Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0A4357C86
	for <lists+openbmc@lfdr.de>; Thu,  8 Apr 2021 08:23:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGB622xh8z30Bp
	for <lists+openbmc@lfdr.de>; Thu,  8 Apr 2021 16:23:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=MqYy6Aso;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=wltu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=MqYy6Aso; dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGB5p5nmPz2yR6
 for <openbmc@lists.ozlabs.org>; Thu,  8 Apr 2021 16:23:10 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id m11so1033197pfc.11
 for <openbmc@lists.ozlabs.org>; Wed, 07 Apr 2021 23:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S8zwxpOZ2MLATzwLojjY+bVdCC3bLz/oFzPH1K2HskE=;
 b=MqYy6AsoAXGZJPyuckxc/4XcZwMJSTqpVroxOc0V6DGhXX1FfFXsMkimcmA0OGk0zI
 XjeXqf31MY5gcnPXOyOSHA2xUM4i75YKa192Fe8ZuB3nNv8qTIiE0X8x0Rcsw7U8PHwa
 IDQl/iurqIytE//9F6f6Dt12VhHXEIznKrpQCG8DzNrHDbXg93SPqLABRWSw0cCrJM/4
 GGrAy0YLevkuFpQuyHph4Dd16JMrkVsUILsuXe4Kb0dQsihVzBpjrUsoiFpDxBYpNEYi
 zSIKq2mQyCcMFvR/vUZH5//ZiBxCtBCayin9VZPnZwcdjgMUY2HFeCQWQeFHUFDgG9X0
 MOBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S8zwxpOZ2MLATzwLojjY+bVdCC3bLz/oFzPH1K2HskE=;
 b=avlPhK2txzVqz1YC//lmxuhbO2ahOXjL6ncMVcKp3/cI74hraWeZ6tadruauABJvcG
 Uz/22bLz4EBweAXAhwJREBOWgJuWgwtJdyLiq3vbD1uUhwEGvhH9rrHgZ+8iYfCCbhZ1
 YEUIqZ4NtrtqczO0U5hDXfRtFUrmay21JZPNyq21WNrQns5OmWo/Fl0aT/VOa2SYyXRY
 4RNIOBjrMXZyMPFeCxi8P+i0rEijteoUv8xnl62AuZTggWbD1HwBzlsh6r8WFEBbI6xF
 me7/cCsuZXLvE9f9hwkelaBdSZNjVAxhQ5wyqrDFFvkY2sgEKHJWb8pSqGitd37b3LqH
 RWEQ==
X-Gm-Message-State: AOAM531v3cSDhSMKPq4XQ3yiclhLGTWPqTyTfBe5YVTWFKERUSQ+sd2b
 o7eYyx3aQ95OtuD3CLYFZNGFaKyY8aA1C9nAXWdMYw==
X-Google-Smtp-Source: ABdhPJxFZA43y3o/Lo/F3/LzqUzMxwfFlugl6u3dMBZkZwg9ugt+Be1NtsxItUVn2CXFfBgnMEAEjuHgdO/68w4/f+k=
X-Received: by 2002:aa7:9533:0:b029:241:9d92:92e1 with SMTP id
 c19-20020aa795330000b02902419d9292e1mr6177752pfp.14.1617862988181; Wed, 07
 Apr 2021 23:23:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAHwn2X=HadjAgzSOnn6JztYLwFe7bd4c38BKb63dxXu2SonZ=Q@mail.gmail.com>
 <CAHwn2XmVxCWzpvO1AMKT44KCbH7OZE38K0kDosV1kvYw0boR_A@mail.gmail.com>
 <CACPK8XfcTXsdSviy1WGdXgkrHYQR924bpst7zeeK0bxT5MOTAw@mail.gmail.com>
 <CAHwn2Xnfq=u=JRT=qgxGMWdqGjOD9kMVVWBALiDP9uFLi-6uaQ@mail.gmail.com>
In-Reply-To: <CAHwn2Xnfq=u=JRT=qgxGMWdqGjOD9kMVVWBALiDP9uFLi-6uaQ@mail.gmail.com>
From: Willy Tu <wltu@google.com>
Date: Wed, 7 Apr 2021 23:22:56 -0700
Message-ID: <CAHwn2Xk_bQ-s+LWFkXhUjxVxObqyiv2-aSh8cxFUf4raH=oYZw@mail.gmail.com>
Subject: Re: [PATCH u-boot v2016.07-aspeed-openbmc] board: aspeed: Enable
 SGPIO in SCU
To: Joel Stanley <joel@jms.id.au>
Content-Type: multipart/alternative; boundary="000000000000b548de05bf7014ee"
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

--000000000000b548de05bf7014ee
Content-Type: text/plain; charset="UTF-8"

I have sent out two patches 2016 and 2019 branches. For the 2019 branch, I
only added it for ast2400 as that is what Benjamin suggested.

Please let me know if the patches have not been sent out. Maybe I'll have
to try again.

Best,

Willy Tu

On Wed, Mar 31, 2021 at 4:31 PM Willy Tu <wltu@google.com> wrote:

> Hi Joel,
>
> Thanks for the update.
>
> I have tested the change in v2016.07 to bring up a system for 2400 and
> verified that it works fine. I'll fix the patch with git-send-email and
> hopefully can get the change merged.
>
> I'll take a look at v2019.04 to see where I can fit this in probably in
> https://github.com/openbmc/u-boot/tree/v2019.04-aspeed-openbmc/board/aspeed?
> I don't think we have a system to fully test the changes for 2500 and 2600
> chips. I'll look through it.
>
> Best,
>
> Willy Tu
>
>
> On Wed, Mar 31, 2021 at 3:51 PM Joel Stanley <joel@jms.id.au> wrote:
>
>> Hi Willy,
>>
>> On Wed, 31 Mar 2021 at 21:33, Willy Tu <wltu@google.com> wrote:
>> >
>> > I am not exactly sure if this is the way to send the patch for u-boot.
>> But I am trying to update a patch for
>> https://github.com/openbmc/u-boot/tree/v2016.07-aspeed-openbmc.
>> >
>> > It just gives the options to have the u-boot enable the SGPIO registers
>> for SCU.
>>
>> I strongly encourage you to bring up your new systems using a newer
>> u-boot tree; ASPEED's v2019.04 based SDK contains support for the
>> 2400, 2500 and 2600 chips.
>>
>> If you have already done the work to bring up v2016.07, I can merge
>> your fix into the v2016.07 tree. However the patch you sent is
>> corrupt. I recommend using git-send-email to send patches, as they
>> preserve whitespace in a way our email clients do not.
>>
>> Cheers,
>>
>> Joel
>>
>> >
>> > Please take a look.
>> >
>> > Best,
>> >
>> > Willy Tu
>> >
>> > On Wed, Mar 31, 2021 at 2:31 PM Willy Tu <wltu@google.com> wrote:
>> >>
>> >> From a2d7336bb59df8f2ef622d4369fc035b2aafd74c Mon Sep 17 00:00:00 2001
>> >> From: Willy Tu <wltu@google.com>
>> >> Date: Mon, 22 Mar 2021 17:01:56 -0700
>> >> Subject: [PATCH] board: aspeed: Enable SGPIO in SCU
>> >>
>> >> Add option to enable register for SGPIO in SCU
>> >>
>> >> Signed-off-by: Willy Tu <wltu@google.com>
>> >> ---
>> >>  board/aspeed/ast-g4/Kconfig  |  4 ++++
>> >>  board/aspeed/ast-g4/ast-g4.c | 13 +++++++++++++
>> >>  2 files changed, 17 insertions(+)
>> >>
>> >> diff --git a/board/aspeed/ast-g4/Kconfig b/board/aspeed/ast-g4/Kconfig
>> >> index 2bec9a733a..e78030ae34 100644
>> >> --- a/board/aspeed/ast-g4/Kconfig
>> >> +++ b/board/aspeed/ast-g4/Kconfig
>> >> @@ -19,4 +19,8 @@ config SYS_CONFIG_NAME
>> >>   default "ast-g4-phy" if ASPEED_NET_PHY
>> >>   default "ast-g4-ncsi" if ASPEED_NET_NCSI
>> >>
>> >> +config ENABLE_SGPIO
>> >> +    tristate "Enable SGPIO in SCU"
>> >> + default n
>> >> +
>> >>  endif
>> >> diff --git a/board/aspeed/ast-g4/ast-g4.c
>> b/board/aspeed/ast-g4/ast-g4.c
>> >> index 656495307b..e2463d4524 100644
>> >> --- a/board/aspeed/ast-g4/ast-g4.c
>> >> +++ b/board/aspeed/ast-g4/ast-g4.c
>> >> @@ -22,6 +22,19 @@ int board_init(void)
>> >>   /* address of boot parameters */
>> >>   gd->bd->bi_boot_params = CONFIG_SYS_SDRAM_BASE + 0x100;
>> >>   gd->flags = 0;
>> >> +
>> >> +#ifdef CONFIG_ENABLE_SGPIO
>> >> + /* Unlock SCU */
>> >> + writel(SCU_PROTECT_UNLOCK, AST_SCU_BASE);
>> >> +
>> >> + /* Enable SGPIO Master */
>> >> + u32 reg = readl(AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL2);
>> >> + reg |= (SCU_FUN_PIN_SGPMI |
>> >> + SCU_FUN_PIN_SGPMO |
>> >> + SCU_FUN_PIN_SGPMLD |
>> >> + SCU_FUN_PIN_SGPMCK);
>> >> + writel(reg, AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL2);
>> >> +#endif
>> >>   return 0;
>> >>  }
>> >>
>> >> --
>> >> 2.31.0.208.g409f899ff0-goog
>> >>
>>
>

--000000000000b548de05bf7014ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have sent out two patches 2016 and 2019 branches. For th=
e 2019 branch, I only added it for ast2400 as that is what Benjamin suggest=
ed.<div><br></div><div>Please let me know if the patches have not been sent=
 out. Maybe I&#39;ll have to try again.</div><div><br></div><div>Best,</div=
><div><br></div><div>Willy Tu</div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 31, 2021 at 4:31 PM Willy Tu=
 &lt;<a href=3D"mailto:wltu@google.com">wltu@google.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi =
Joel,<div><br></div><div>Thanks for the update.</div><div><br></div><div>I =
have tested the change in v2016.07 to bring up a system for 2400 and verifi=
ed that it works fine. I&#39;ll fix the patch with git-send-email and hopef=
ully can get the change merged.<br></div><div><br></div><div>I&#39;ll take =
a look at v2019.04 to see where I can fit this in probably in=C2=A0<a href=
=3D"https://github.com/openbmc/u-boot/tree/v2019.04-aspeed-openbmc/board/as=
peed" target=3D"_blank">https://github.com/openbmc/u-boot/tree/v2019.04-asp=
eed-openbmc/board/aspeed</a>? I don&#39;t think we have a system to fully t=
est the changes for 2500 and 2600 chips. I&#39;ll look through it.</div><di=
v><br></div><div>Best,</div><div><br></div><div>Willy Tu</div><div><br></di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Wed, Mar 31, 2021 at 3:51 PM Joel Stanley &lt;<a href=3D"mailto:joel@j=
ms.id.au" target=3D"_blank">joel@jms.id.au</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">Hi Willy,<br>
<br>
On Wed, 31 Mar 2021 at 21:33, Willy Tu &lt;<a href=3D"mailto:wltu@google.co=
m" target=3D"_blank">wltu@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; I am not exactly sure if this is the way to send the patch for u-boot.=
 But I am trying to update a patch for <a href=3D"https://github.com/openbm=
c/u-boot/tree/v2016.07-aspeed-openbmc" rel=3D"noreferrer" target=3D"_blank"=
>https://github.com/openbmc/u-boot/tree/v2016.07-aspeed-openbmc</a>.<br>
&gt;<br>
&gt; It just gives the options to have the u-boot enable the SGPIO register=
s for SCU.<br>
<br>
I strongly encourage you to bring up your new systems using a newer<br>
u-boot tree; ASPEED&#39;s v2019.04 based SDK contains support for the<br>
2400, 2500 and 2600 chips.<br>
<br>
If you have already done the work to bring up v2016.07, I can merge<br>
your fix into the v2016.07 tree. However the patch you sent is<br>
corrupt. I recommend using git-send-email to send patches, as they<br>
preserve whitespace in a way our email clients do not.<br>
<br>
Cheers,<br>
<br>
Joel<br>
<br>
&gt;<br>
&gt; Please take a look.<br>
&gt;<br>
&gt; Best,<br>
&gt;<br>
&gt; Willy Tu<br>
&gt;<br>
&gt; On Wed, Mar 31, 2021 at 2:31 PM Willy Tu &lt;<a href=3D"mailto:wltu@go=
ogle.com" target=3D"_blank">wltu@google.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; From a2d7336bb59df8f2ef622d4369fc035b2aafd74c Mon Sep 17 00:00:00 =
2001<br>
&gt;&gt; From: Willy Tu &lt;<a href=3D"mailto:wltu@google.com" target=3D"_b=
lank">wltu@google.com</a>&gt;<br>
&gt;&gt; Date: Mon, 22 Mar 2021 17:01:56 -0700<br>
&gt;&gt; Subject: [PATCH] board: aspeed: Enable SGPIO in SCU<br>
&gt;&gt;<br>
&gt;&gt; Add option to enable register for SGPIO in SCU<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Willy Tu &lt;<a href=3D"mailto:wltu@google.com" tar=
get=3D"_blank">wltu@google.com</a>&gt;<br>
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
&gt;&gt;=C2=A0 =C2=A0default &quot;ast-g4-phy&quot; if ASPEED_NET_PHY<br>
&gt;&gt;=C2=A0 =C2=A0default &quot;ast-g4-ncsi&quot; if ASPEED_NET_NCSI<br>
&gt;&gt;<br>
&gt;&gt; +config ENABLE_SGPIO<br>
&gt;&gt; +=C2=A0 =C2=A0 tristate &quot;Enable SGPIO in SCU&quot;<br>
&gt;&gt; + default n<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 endif<br>
&gt;&gt; diff --git a/board/aspeed/ast-g4/ast-g4.c b/board/aspeed/ast-g4/as=
t-g4.c<br>
&gt;&gt; index 656495307b..e2463d4524 100644<br>
&gt;&gt; --- a/board/aspeed/ast-g4/ast-g4.c<br>
&gt;&gt; +++ b/board/aspeed/ast-g4/ast-g4.c<br>
&gt;&gt; @@ -22,6 +22,19 @@ int board_init(void)<br>
&gt;&gt;=C2=A0 =C2=A0/* address of boot parameters */<br>
&gt;&gt;=C2=A0 =C2=A0gd-&gt;bd-&gt;bi_boot_params =3D CONFIG_SYS_SDRAM_BASE=
 + 0x100;<br>
&gt;&gt;=C2=A0 =C2=A0gd-&gt;flags =3D 0;<br>
&gt;&gt; +<br>
&gt;&gt; +#ifdef CONFIG_ENABLE_SGPIO<br>
&gt;&gt; + /* Unlock SCU */<br>
&gt;&gt; + writel(SCU_PROTECT_UNLOCK, AST_SCU_BASE);<br>
&gt;&gt; +<br>
&gt;&gt; + /* Enable SGPIO Master */<br>
&gt;&gt; + u32 reg =3D readl(AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL2);<br>
&gt;&gt; + reg |=3D (SCU_FUN_PIN_SGPMI |<br>
&gt;&gt; + SCU_FUN_PIN_SGPMO |<br>
&gt;&gt; + SCU_FUN_PIN_SGPMLD |<br>
&gt;&gt; + SCU_FUN_PIN_SGPMCK);<br>
&gt;&gt; + writel(reg, AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL2);<br>
&gt;&gt; +#endif<br>
&gt;&gt;=C2=A0 =C2=A0return 0;<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; 2.31.0.208.g409f899ff0-goog<br>
&gt;&gt;<br>
</blockquote></div>
</blockquote></div>

--000000000000b548de05bf7014ee--
