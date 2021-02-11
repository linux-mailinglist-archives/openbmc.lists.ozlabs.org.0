Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F96318A2B
	for <lists+openbmc@lfdr.de>; Thu, 11 Feb 2021 13:14:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbwYF72KczDsb0
	for <lists+openbmc@lfdr.de>; Thu, 11 Feb 2021 23:14:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d2c;
 helo=mail-io1-xd2c.google.com; envelope-from=gmouse@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=TwHNmtiR; dkim-atps=neutral
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbwW40fQgzDvWK
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2021 23:12:45 +1100 (AEDT)
Received: by mail-io1-xd2c.google.com with SMTP id m17so5404345ioy.4
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2021 04:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6UdsfIsmgysJfvTPC7wOpUk5i9RqG9vRd8Dvk82R9Zw=;
 b=TwHNmtiR/nV2YN3e5tChzIBS79HI1O3ZHOif69WTZGk9hoa1KtePQZsSDleRyFJoIh
 PNZ83dnGchCh2l9kO/dsnH35FLT0sq21QdK5fzOJV5PD8udUamdkKvPWL5t4PkdoUpbE
 ufP3TTS3IdUl9HUY3RfXpiY/fMh3ZM4VaYUK9SrwfxTR1vwb/uph3GXizyZ0lA8JzHub
 Fry3xN0FB7dnH54VNwJxpeeMPyYM2JmcmqnM30PMdBmh5WMV0eGV8Y/PwVXEYO2g5iPV
 sBFHlILKah4XHmxWkiLHd/6PsTbV5vcKteBsfyQ9YHBllJfodHNPQW1JLckwsl23hizB
 g3mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6UdsfIsmgysJfvTPC7wOpUk5i9RqG9vRd8Dvk82R9Zw=;
 b=LR5XXtFq7pj8Pv23giwcd9DiH9+vVhnNNERTRRGK1xJGfyhjoFydytGegW6Tq4VINH
 aF6Ou5laSpi/F84+DHiZ368pqxPnpAwhd3KW1Jhp/VGVYrPWayj6ONwx4silOiI036Kb
 WVfFbRRYWUFKbUT5hFqOCaMbpyMp9v01iWL1CGZbKMk07DquTpFyCovBJ938tCvAqslN
 q7vawFywHvSWhxZ+GEVFNLXvfzLNehswmhdKTy+Yatn4JSgGm3m6VDdvkHND2ooFJMHV
 qF4CHG0i0VISrioYATSFpCmKX6lREfJMgtNxVWgqtydQUc9A57lX9E4xG/5BxyVbBsY4
 uMkw==
X-Gm-Message-State: AOAM531g7PZv0a1UdJVeetHYPvVyhUdNACays+pYgglgxlvJZHfnLirv
 GvvgKJjvyvpuM/oxHr0kE8UrpUlbMLhUlioKk3R6vw==
X-Google-Smtp-Source: ABdhPJxn4uN9BEk1Lp+7qc+GN47DR4RJfvRtUVWEaMOyJUtuBOQySmbbVGX12tYC9qsTqj9KW9cieq21uUbULHF+t1U=
X-Received: by 2002:a02:9042:: with SMTP id y2mr8453189jaf.94.1613045559634;
 Thu, 11 Feb 2021 04:12:39 -0800 (PST)
MIME-Version: 1.0
References: <20210211083454.37117-1-gmouse@google.com>
 <20210211083454.37117-2-gmouse@google.com>
 <CACPK8XdjeidAdPYXV1-WXrbxcPyy4PBE0S-u-3FoH3UcEj0d6g@mail.gmail.com>
In-Reply-To: <CACPK8XdjeidAdPYXV1-WXrbxcPyy4PBE0S-u-3FoH3UcEj0d6g@mail.gmail.com>
From: Anton Kachalov <gmouse@google.com>
Date: Thu, 11 Feb 2021 13:12:27 +0100
Message-ID: <CADVsX88AWU79pKquryvUCaT9Z4czj_16bXZv9fX+4q924XmRrw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: nuvoton: Add Fii Kudo system
To: Joel Stanley <joel@jms.id.au>
Content-Type: multipart/alternative; boundary="00000000000096fb2e05bb0e6fda"
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
Cc: Mohaimen alsmarai <Mohaimen.alsamarai@fii-na.com>,
 Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Vivekanand Veeracholan <vveerach@google.com>,
 Lancelot Kao <lancelot.kao@fii-usa.com>,
 Mustatfa Shehabi <Mustafa.Shehabi@fii-na.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000096fb2e05bb0e6fda
Content-Type: text/plain; charset="UTF-8"

Oh, I did tried to send a specific patch. git send-email shown a correct
body message (without actual patch hunks) before sending, but then it sends
wrong data (e.g.last commit instead of provided patch file).

I had to subscribe to ML with primary email. Internal issues were caused by
using an email alias that I use to sign-offs the commits.


On Thu, Feb 11, 2021, 10:24 Joel Stanley <joel@jms.id.au> wrote:

> Hello Anton,
>
> On Thu, 11 Feb 2021 at 08:35, <gmouse@google.com> wrote:
> >
> > From: Lancelot Kao <lancelot.kao@fii-usa.com>
> >
> > Add device tree for the Kudo BMC. Kudo is an Ampere (Altra)
> > server platform manufactured by Fii and is based on a Nuvoton
> > NPCM730 SoC.
>
> I see you got git send email working :)
>
> Where did you want this patch applied? We already have it in the
> openbmc tree (both 5.8 and 5.10).
>
> If you would like to see it merged upstream, a few notes:
>
>  - remove the OpenBMC-Staging-Count tag. That's for us to use in
> openbmc land, but will confuse mainline devs
>  - When sending someone else's patch, be sure to add your own signed
> off by. This applies for the openbmc kernel tree as well as mainline.
>  - Use scripts/get_maintainer.pl in the kernel tree to work out where
> to send the patch. In this case, it should go to linux-arm-kernel. You
> can cc me as I've been helping out with Nuvoton pull requests.
>
> Cheers,
>
> Joel
>
>
> >
> > OpenBMC-Staging-Count: 1
> > Signed-off-by: Mustatfa Shehabi <Mustafa.Shehabi@fii-na.com>
> > Signed-off-by: Mohaimen alsmarai <Mohaimen.alsamarai@fii-na.com>
> > Signed-off-by: Lancelot Kao <lancelot.kao@fii-usa.com>
> > Reviewed-by: Vivekanand Veeracholan <vveerach@google.com>
> > Reviewed-by: Benjamin Fair <benjaminfair@google.com>
> > Reviewed-by: Joel Stanley <joel@jms.id.au>
> > Link:
> https://lore.kernel.org/r/20201116232127.7066-1-lancelot.kao@fii-usa.com
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
>

--00000000000096fb2e05bb0e6fda
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Oh, I did tried to send a specific patch. git send-e=
mail shown a correct body message (without actual patch hunks) before sendi=
ng, but then it sends wrong data (e.g.last commit instead of provided patch=
 file).<div dir=3D"auto"><br></div><div dir=3D"auto">I had to subscribe to =
ML with primary email. Internal issues were caused by using an email alias =
that I use to sign-offs the commits.</div><br><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 11, 2021, 10:24 Joel St=
anley &lt;<a href=3D"mailto:joel@jms.id.au">joel@jms.id.au</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">Hello Anton,<br>
<br>
On Thu, 11 Feb 2021 at 08:35, &lt;<a href=3D"mailto:gmouse@google.com" targ=
et=3D"_blank" rel=3D"noreferrer">gmouse@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Lancelot Kao &lt;<a href=3D"mailto:lancelot.kao@fii-usa.com" tar=
get=3D"_blank" rel=3D"noreferrer">lancelot.kao@fii-usa.com</a>&gt;<br>
&gt;<br>
&gt; Add device tree for the Kudo BMC. Kudo is an Ampere (Altra)<br>
&gt; server platform manufactured by Fii and is based on a Nuvoton<br>
&gt; NPCM730 SoC.<br>
<br>
I see you got git send email working :)<br>
<br>
Where did you want this patch applied? We already have it in the<br>
openbmc tree (both 5.8 and 5.10).<br>
<br>
If you would like to see it merged upstream, a few notes:<br>
<br>
=C2=A0- remove the OpenBMC-Staging-Count tag. That&#39;s for us to use in<b=
r>
openbmc land, but will confuse mainline devs<br>
=C2=A0- When sending someone else&#39;s patch, be sure to add your own sign=
ed<br>
off by. This applies for the openbmc kernel tree as well as mainline.<br>
=C2=A0- Use scripts/<a href=3D"http://get_maintainer.pl" rel=3D"noreferrer =
noreferrer" target=3D"_blank">get_maintainer.pl</a> in the kernel tree to w=
ork out where<br>
to send the patch. In this case, it should go to linux-arm-kernel. You<br>
can cc me as I&#39;ve been helping out with Nuvoton pull requests.<br>
<br>
Cheers,<br>
<br>
Joel<br>
<br>
<br>
&gt;<br>
&gt; OpenBMC-Staging-Count: 1<br>
&gt; Signed-off-by: Mustatfa Shehabi &lt;<a href=3D"mailto:Mustafa.Shehabi@=
fii-na.com" target=3D"_blank" rel=3D"noreferrer">Mustafa.Shehabi@fii-na.com=
</a>&gt;<br>
&gt; Signed-off-by: Mohaimen alsmarai &lt;<a href=3D"mailto:Mohaimen.alsama=
rai@fii-na.com" target=3D"_blank" rel=3D"noreferrer">Mohaimen.alsamarai@fii=
-na.com</a>&gt;<br>
&gt; Signed-off-by: Lancelot Kao &lt;<a href=3D"mailto:lancelot.kao@fii-usa=
.com" target=3D"_blank" rel=3D"noreferrer">lancelot.kao@fii-usa.com</a>&gt;=
<br>
&gt; Reviewed-by: Vivekanand Veeracholan &lt;<a href=3D"mailto:vveerach@goo=
gle.com" target=3D"_blank" rel=3D"noreferrer">vveerach@google.com</a>&gt;<b=
r>
&gt; Reviewed-by: Benjamin Fair &lt;<a href=3D"mailto:benjaminfair@google.c=
om" target=3D"_blank" rel=3D"noreferrer">benjaminfair@google.com</a>&gt;<br=
>
&gt; Reviewed-by: Joel Stanley &lt;<a href=3D"mailto:joel@jms.id.au" target=
=3D"_blank" rel=3D"noreferrer">joel@jms.id.au</a>&gt;<br>
&gt; Link: <a href=3D"https://lore.kernel.org/r/20201116232127.7066-1-lance=
lot.kao@fii-usa.com" rel=3D"noreferrer noreferrer" target=3D"_blank">https:=
//lore.kernel.org/r/20201116232127.7066-1-lancelot.kao@fii-usa.com</a><br>
&gt; Signed-off-by: Joel Stanley &lt;<a href=3D"mailto:joel@jms.id.au" targ=
et=3D"_blank" rel=3D"noreferrer">joel@jms.id.au</a>&gt;<br>
</blockquote></div></div></div>

--00000000000096fb2e05bb0e6fda--
