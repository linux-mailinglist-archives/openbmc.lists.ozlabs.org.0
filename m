Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD6B53061E
	for <lists+openbmc@lfdr.de>; Sun, 22 May 2022 23:21:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L5th36BWcz3bn4
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 07:21:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FOkN1EuO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1130;
 helo=mail-yw1-x1130.google.com; envelope-from=tmaimon77@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=FOkN1EuO; dkim-atps=neutral
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L5tgg1Btpz3004
 for <openbmc@lists.ozlabs.org>; Mon, 23 May 2022 07:21:34 +1000 (AEST)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2fffcc66fe2so3961147b3.0
 for <openbmc@lists.ozlabs.org>; Sun, 22 May 2022 14:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4x23uexV66nTSsLWDt23P/FHjjhMrMncgKoD6ysADyU=;
 b=FOkN1EuOTpouKyS6NEHc8GiqDZVm4jIvmiscSri/lrHNDw5NdyOzJ8iyrN5Frwhx7N
 yv/298jyunpAgKaOoi/2whpgyk0e6EP870W/Ed8jNXr1p4I83i9CZ+lRQpKK0I8HJbGN
 rkqhMEytar8ZJxqVMQRRP1kiy8hiGyn6yi2xFSEieWs9omEXK+tZBVAQx/hB/MoVGGXF
 NiD5Qtn5yDJ+EhcE1TrYWjweuiXKKvV3muY39LMAlN0XKJQt4hnl2Uj7jPtmGl+wMTti
 P05Pbm0TX7oROAqf57YlT3awBNRj8UblZv52/Jnhh1/UKGOlTTYmcx7KftLqr1DpRjgx
 aTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4x23uexV66nTSsLWDt23P/FHjjhMrMncgKoD6ysADyU=;
 b=7PW4JNt/y1e6bJrqNcf+0VBrNKt11oS8ANK839X8WDg2YkbeL0ZcWKehnfy4QGYsp8
 BNFhuctp+gsJbQ9JeZloa2+lJavd325KF3E3nd2KfXdx/zI80iZ0AbvLiibM3bI8HMVT
 u8fdqp080ig0TN5U4C4I3Ll4jHYSCA5CawcOGncA0mv4kmIzuhC+ftsP9Ex5/xuywZBQ
 Ozs+gDdlo63eFo8WFfGoP6+9baQ4GmtZ2O7aBy+AvZj1Fa9jbEQOBS6hwm5O+WZMSDiH
 dYdGqSIGESByaEaDImXuM4eRFAtjGOLfucVnz9EiH15XLj0r5mSdLX+L7EGRl4Kl33Xe
 qJ1Q==
X-Gm-Message-State: AOAM532jFJJJTnqBWKJj78xeJSWq8u/l8gw/71Rc9T5ehlcl4tVy2j7a
 4n36X8NS77BHbtIgqxKfEg1hiKEWjPH0ERNJVNc=
X-Google-Smtp-Source: ABdhPJx0QgxV8Tn8GCrDYWgQlhreB+snU11d9541YSHaLlr0FZdbSpoNmfpsn5jtqPPyXlJjAp/WYA1pWbeT2yp3JoU=
X-Received: by 2002:a81:d86:0:b0:2ff:2258:f9b3 with SMTP id
 128-20020a810d86000000b002ff2258f9b3mr20727118ywn.355.1653254489627; Sun, 22
 May 2022 14:21:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220517101142.28421-1-warp5tw@gmail.com>
 <20220517101142.28421-10-warp5tw@gmail.com>
 <YoiAF3fcFJiH4nGP@shikoro>
 <CACD3sJb6OParLBQxe+JwcGRpnLfihFRLMOQWEwC_DJHrpzcr_w@mail.gmail.com>
In-Reply-To: <CACD3sJb6OParLBQxe+JwcGRpnLfihFRLMOQWEwC_DJHrpzcr_w@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 23 May 2022 00:21:18 +0300
Message-ID: <CAP6Zq1jupqKEKcj03ETa-vZHn33S2tK68fozB=ayPt28GtzEBA@mail.gmail.com>
Subject: Re: [PATCH v5 09/10] i2c: npcm: Support NPCM845
To: Tyrone Ting <warp5tw@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000093e15505dfa04e59"
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
Cc: devicetree <devicetree@vger.kernel.org>, Tali Perry <tali.perry1@gmail.com>,
 jsd@semihalf.com, krzysztof.kozlowski+dt@linaro.org, rafal@milecki.pl,
 Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, JJLIU0@nuvoton.com,
 lukas.bulwahn@gmail.com, Tomer Maimon <tomer.maimon@nuvoton.com>,
 KWLIU@nuvoton.com, Arnd Bergmann <arnd@arndb.de>, sven@svenpeter.dev,
 Rob Herring <robh+dt@kernel.org>, Avi Fishman <Avi.Fishman@nuvoton.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 semen.protsenko@linaro.org, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wolfram Sang <wsa@kernel.org>, kfting@nuvoton.com,
 Tali Perry <tali.perry@nuvoton.com>, jarkko.nikula@linux.intel.com,
 Olof Johansson <olof@lixom.net>, Linux I2C <linux-i2c@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000093e15505dfa04e59
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

Appreciate your review!

On Sat, 21 May 2022 at 16:10, Tyrone Ting <warp5tw@gmail.com> wrote:

> Hi Wolfram:
>
> Thank you for your reminder.
>
> Wolfram Sang <wsa@kernel.org> =E6=96=BC 2022=E5=B9=B45=E6=9C=8821=E6=97=
=A5 =E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=882:01=E5=AF=AB=E9=81=93=EF=BC=9A
>
> >
> > On Tue, May 17, 2022 at 06:11:41PM +0800, Tyrone Ting wrote:
> > > From: Tyrone Ting <kfting@nuvoton.com>
> > >
> > > Add NPCM8XX I2C support.
> > > The NPCM8XX uses a similar i2c module as NPCM7XX.
> > > The internal HW FIFO is larger in NPCM8XX.
> > >
> > > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
>
>
> > Would be great to get an ack from one of the listed Nuvoton maintainers=
.
> >
>
> Best Regards,
> Tyrone
>

Acked-by:  Tomer Maimon <tmaimon77@gmail.com>

Best Regards,

Tomer

--00000000000093e15505dfa04e59
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi=C2=A0Wolfram,<div><br></div><div>Appre=
ciate your review!</div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sat, 21 May 2022 at 16:10, Tyrone Ting &lt;<a hr=
ef=3D"mailto:warp5tw@gmail.com" target=3D"_blank">warp5tw@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Wolfr=
am:<br>
<br>
Thank you for your reminder.<br>
<br>
Wolfram Sang &lt;<a href=3D"mailto:wsa@kernel.org" target=3D"_blank">wsa@ke=
rnel.org</a>&gt; =E6=96=BC 2022=E5=B9=B45=E6=9C=8821=E6=97=A5 =E9=80=B1=E5=
=85=AD =E4=B8=8B=E5=8D=882:01=E5=AF=AB=E9=81=93=EF=BC=9A<br>
<br>
&gt;<br>
&gt; On Tue, May 17, 2022 at 06:11:41PM +0800, Tyrone Ting wrote:<br>
&gt; &gt; From: Tyrone Ting &lt;<a href=3D"mailto:kfting@nuvoton.com" targe=
t=3D"_blank">kfting@nuvoton.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; Add NPCM8XX I2C support.<br>
&gt; &gt; The NPCM8XX uses a similar i2c module as NPCM7XX.<br>
&gt; &gt; The internal HW FIFO is larger in NPCM8XX.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Tyrone Ting &lt;<a href=3D"mailto:kfting@nuvoton.c=
om" target=3D"_blank">kfting@nuvoton.com</a>&gt;<br></blockquote><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">&gt;<br>
&gt; Would be great to get an ack from one of the listed Nuvoton maintainer=
s.<br>
&gt;<br>
<br>
Best Regards,<br>
Tyrone<br></blockquote><div><br></div><div>Acked-by:=C2=A0 Tomer Maimon &lt=
;<a href=3D"mailto:tmaimon77@gmail.com" target=3D"_blank"><span class=3D"gm=
ail-il">tmaimon77@gmail.com</span></a>&gt;=C2=A0</div><div><br></div><div>B=
est Regards,</div><div><br></div><div>Tomer=C2=A0</div></div></div>

--00000000000093e15505dfa04e59--
