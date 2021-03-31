Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB34350AD1
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 01:32:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9jJx34qbz30C0
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 10:32:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=V9Fi20Ps;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=wltu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=V9Fi20Ps; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9jJj2st8z2yxB
 for <openbmc@lists.ozlabs.org>; Thu,  1 Apr 2021 10:32:02 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id
 kk2-20020a17090b4a02b02900c777aa746fso2104220pjb.3
 for <openbmc@lists.ozlabs.org>; Wed, 31 Mar 2021 16:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TTTj2E/oxnOUOHK0XJSQAcYlw3czpjSn2p3IStzuXbU=;
 b=V9Fi20Psr+RjFdHUFVWabei2oN8Odao2bNFXQn24+NNrBUuyG/N7OOY/1d8GueidrX
 OVRoe3AkHy7hJMhE0rqk+JdXvkKDJ3buMz7sd3o9Dp3WAPf+LhpW8HGvVIxYj+TcFcCw
 x9yzoc7Y+eSE8rOv4JrYRUiBFHCt4KS1M5H8wWw8ewg1By4T8pXHUfLZR+bfTt3+pzL2
 wJwtvbaWM0K20rdMjzeCjmV1zsWOLRBqo7H5EgFUlerQlgqixyUuZNFKffYN0k1DgqLD
 +Figs/0cdrkx0QWkctIlPkz8rCK9v4x1b/0Ulmf6r8INRMWOY/ZAuXA1jEieQmuzNsSY
 U0Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TTTj2E/oxnOUOHK0XJSQAcYlw3czpjSn2p3IStzuXbU=;
 b=snzO6PiO5BmddJGEUuWnqyYuvlHMa7gngslgLNnuRreos/FkEBLjcZsyyBlARkiYlC
 XjFgvvuKzQyz41J3xGzDUooun9+PwpCq6z9Z+CsyzThZrUFuqsIKkpuwxyYDNCFH3jTQ
 gZlImcXKvCL6xBZLGP7kfkc0UbISzTcndlwJ0XRO3kXcPRc5mjQ/lJaE1ueDaomVuRfs
 IkNswFtrNyS7VERnjb8c99a4KyrMQTb8LUWBn+HwXjVXvpfRl6HzmiPpgk4IKATF4L9U
 ys39yCN301WRn2Ugz1Jdz6IOS5Tgcv3bzyiKdfkzwH7crLkQiXb2lhdVYfTgHvbwjGM3
 e4IQ==
X-Gm-Message-State: AOAM531mSoCteam6n0AZ4Fj/oU+kf0dAe6eYW7vYbI13oOfsq6CqYrAa
 1YvFuBYzsmsrug2+C2L9BPyY4nYFtrvofDGQwxC9Mg==
X-Google-Smtp-Source: ABdhPJzu3lZhg88uJpthrLEhsa+jETjINrrOfsa7vtoSyeKjDn9m6b6twzGHHWxkPB2twSyhNFejWGMEdZsQrVobwhc=
X-Received: by 2002:a17:902:74cb:b029:e4:7a16:9925 with SMTP id
 f11-20020a17090274cbb02900e47a169925mr5574118plt.39.1617233517540; Wed, 31
 Mar 2021 16:31:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAHwn2X=HadjAgzSOnn6JztYLwFe7bd4c38BKb63dxXu2SonZ=Q@mail.gmail.com>
 <CAHwn2XmVxCWzpvO1AMKT44KCbH7OZE38K0kDosV1kvYw0boR_A@mail.gmail.com>
 <CACPK8XfcTXsdSviy1WGdXgkrHYQR924bpst7zeeK0bxT5MOTAw@mail.gmail.com>
In-Reply-To: <CACPK8XfcTXsdSviy1WGdXgkrHYQR924bpst7zeeK0bxT5MOTAw@mail.gmail.com>
From: Willy Tu <wltu@google.com>
Date: Wed, 31 Mar 2021 16:31:46 -0700
Message-ID: <CAHwn2Xnfq=u=JRT=qgxGMWdqGjOD9kMVVWBALiDP9uFLi-6uaQ@mail.gmail.com>
Subject: Re: [PATCH u-boot v2016.07-aspeed-openbmc] board: aspeed: Enable
 SGPIO in SCU
To: Joel Stanley <joel@jms.id.au>
Content-Type: multipart/alternative; boundary="0000000000005574c605bedd8509"
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

--0000000000005574c605bedd8509
Content-Type: text/plain; charset="UTF-8"

Hi Joel,

Thanks for the update.

I have tested the change in v2016.07 to bring up a system for 2400 and
verified that it works fine. I'll fix the patch with git-send-email and
hopefully can get the change merged.

I'll take a look at v2019.04 to see where I can fit this in probably in
https://github.com/openbmc/u-boot/tree/v2019.04-aspeed-openbmc/board/aspeed?
I don't think we have a system to fully test the changes for 2500 and 2600
chips. I'll look through it.

Best,

Willy Tu


On Wed, Mar 31, 2021 at 3:51 PM Joel Stanley <joel@jms.id.au> wrote:

> Hi Willy,
>
> On Wed, 31 Mar 2021 at 21:33, Willy Tu <wltu@google.com> wrote:
> >
> > I am not exactly sure if this is the way to send the patch for u-boot.
> But I am trying to update a patch for
> https://github.com/openbmc/u-boot/tree/v2016.07-aspeed-openbmc.
> >
> > It just gives the options to have the u-boot enable the SGPIO registers
> for SCU.
>
> I strongly encourage you to bring up your new systems using a newer
> u-boot tree; ASPEED's v2019.04 based SDK contains support for the
> 2400, 2500 and 2600 chips.
>
> If you have already done the work to bring up v2016.07, I can merge
> your fix into the v2016.07 tree. However the patch you sent is
> corrupt. I recommend using git-send-email to send patches, as they
> preserve whitespace in a way our email clients do not.
>
> Cheers,
>
> Joel
>
> >
> > Please take a look.
> >
> > Best,
> >
> > Willy Tu
> >
> > On Wed, Mar 31, 2021 at 2:31 PM Willy Tu <wltu@google.com> wrote:
> >>
> >> From a2d7336bb59df8f2ef622d4369fc035b2aafd74c Mon Sep 17 00:00:00 2001
> >> From: Willy Tu <wltu@google.com>
> >> Date: Mon, 22 Mar 2021 17:01:56 -0700
> >> Subject: [PATCH] board: aspeed: Enable SGPIO in SCU
> >>
> >> Add option to enable register for SGPIO in SCU
> >>
> >> Signed-off-by: Willy Tu <wltu@google.com>
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
> >>   default "ast-g4-phy" if ASPEED_NET_PHY
> >>   default "ast-g4-ncsi" if ASPEED_NET_NCSI
> >>
> >> +config ENABLE_SGPIO
> >> +    tristate "Enable SGPIO in SCU"
> >> + default n
> >> +
> >>  endif
> >> diff --git a/board/aspeed/ast-g4/ast-g4.c b/board/aspeed/ast-g4/ast-g4.c
> >> index 656495307b..e2463d4524 100644
> >> --- a/board/aspeed/ast-g4/ast-g4.c
> >> +++ b/board/aspeed/ast-g4/ast-g4.c
> >> @@ -22,6 +22,19 @@ int board_init(void)
> >>   /* address of boot parameters */
> >>   gd->bd->bi_boot_params = CONFIG_SYS_SDRAM_BASE + 0x100;
> >>   gd->flags = 0;
> >> +
> >> +#ifdef CONFIG_ENABLE_SGPIO
> >> + /* Unlock SCU */
> >> + writel(SCU_PROTECT_UNLOCK, AST_SCU_BASE);
> >> +
> >> + /* Enable SGPIO Master */
> >> + u32 reg = readl(AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL2);
> >> + reg |= (SCU_FUN_PIN_SGPMI |
> >> + SCU_FUN_PIN_SGPMO |
> >> + SCU_FUN_PIN_SGPMLD |
> >> + SCU_FUN_PIN_SGPMCK);
> >> + writel(reg, AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL2);
> >> +#endif
> >>   return 0;
> >>  }
> >>
> >> --
> >> 2.31.0.208.g409f899ff0-goog
> >>
>

--0000000000005574c605bedd8509
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Joel,<div><br></div><div>Thanks for the update.</div><d=
iv><br></div><div>I have tested the change in v2016.07 to bring up a system=
 for 2400 and verified that it works fine. I&#39;ll fix the patch with git-=
send-email and hopefully can get the change merged.<br></div><div><br></div=
><div>I&#39;ll take a look at v2019.04 to see where I can fit this in proba=
bly in=C2=A0<a href=3D"https://github.com/openbmc/u-boot/tree/v2019.04-aspe=
ed-openbmc/board/aspeed">https://github.com/openbmc/u-boot/tree/v2019.04-as=
peed-openbmc/board/aspeed</a>? I don&#39;t think we have a system to fully =
test the changes for 2500 and 2600 chips. I&#39;ll look through it.</div><d=
iv><br></div><div>Best,</div><div><br></div><div>Willy Tu</div><div><br></d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Wed, Mar 31, 2021 at 3:51 PM Joel Stanley &lt;<a href=3D"mailto:joel@=
jms.id.au">joel@jms.id.au</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">Hi Willy,<br>
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

--0000000000005574c605bedd8509--
