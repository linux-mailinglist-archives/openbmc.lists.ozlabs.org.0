Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7201AD7D
	for <lists+openbmc@lfdr.de>; Sun, 12 May 2019 19:23:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4529lX3gGJzDq9m
	for <lists+openbmc@lfdr.de>; Mon, 13 May 2019 03:23:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::142; helo=mail-it1-x142.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SfYenLb0"; 
 dkim-atps=neutral
Received: from mail-it1-x142.google.com (mail-it1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4529kl64qfzDqJ7
 for <openbmc@lists.ozlabs.org>; Mon, 13 May 2019 03:22:53 +1000 (AEST)
Received: by mail-it1-x142.google.com with SMTP id q132so16806815itc.5
 for <openbmc@lists.ozlabs.org>; Sun, 12 May 2019 10:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E0eNPTAAklKo9tRG6G5JtlTMW+0R0n0qRtcf736CXMY=;
 b=SfYenLb0WZo8dbU477/pyT03KIR9DQn2i7JkSvgDVUOtFDSVrHAcxNilauINspy3Lw
 THucVxQ5Krc8ZUsGKCu5nNCKoxRJGHeNr+QQstx+gxZVW/btKwMJ4rjbdiGYoflVHx+j
 JrKciaMnY9hUtA0CtgC7JXxfMiTe5P7fWhb1iyb8F+TEOXr2b5baaE3fZPErsxK3oPEy
 trIzWj+YP8rS/s52yIMCRb6TwEHmxFrwnLnwey9fcKpki2Hu+EIB22Q/Zm62v1aIyRwc
 b94pOka7eT9urxyI61JZdTtzKeTFEfgiCxBd3Ruw4tnzeWNjV4n6/yP05rDgI/iMpumw
 2scw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E0eNPTAAklKo9tRG6G5JtlTMW+0R0n0qRtcf736CXMY=;
 b=UmAmufFu6lzzvVnmSuatiS6BulDPCG5tMCScIya76jww0dXdDig2w0yl8D1KuWuCZQ
 1zY+hJe5aX2ZT4gITHxyDz0cjm0CUm5+AX7yPsgRHrskOvmOjwhqC4qI553Fk9H6qZXt
 hbFaAxv1IohqNtKDru9ZNvXcGrmsk1VQ4nvGN85Ei3IYMU+2otPNfp835f3YKhf0s9wa
 eAtZ38UJhKqVksI38fsgdEipRxYBSfkGUbWybR5FRFgL1YyauxJ8CKgtg/Q3xuvKaeG7
 KoXfLjmJGfVubgmYhFATr4k+LmkEbQNvq0KiJ3ayYsIgIf/+VqTh1kCJ+j/TkVHnm35F
 1J1Q==
X-Gm-Message-State: APjAAAWE8aKdapyzqczY31iaaU/BIZzs4UdbU3CUzkxNDrxlIOcpaCl2
 Mzp2ono8kPq8sue8sJw91zwCuExWDaD+2JshajA=
X-Google-Smtp-Source: APXvYqyKTRuwNOIZ0AfoHk1l5tkMJCS2/Biq8Lop8BEJOTyoJtAiSCt5LgUhlaFV1emnwT9SkDKHtT1RShPZfT5kO9I=
X-Received: by 2002:a24:b109:: with SMTP id o9mr6624338itf.68.1557681770129;
 Sun, 12 May 2019 10:22:50 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8XeSFx7LUKch3Vy+OVKaV=3P4UVWOXBkUF0WO3iKx47NVw@mail.gmail.com>
 <9a1adf03-ee54-0674-54bc-d5c37a9ae516@linux.intel.com>
 <CACPK8XfQVySsmzUGLenPA5cM2AdCfgTzf1hO2cbqg1_D62tK8w@mail.gmail.com>
In-Reply-To: <CACPK8XfQVySsmzUGLenPA5cM2AdCfgTzf1hO2cbqg1_D62tK8w@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Sun, 12 May 2019 20:29:55 +0300
Message-ID: <CAP6Zq1g70=DOyqriH9g5OEhfHOjgBcfzfDyMK-BrP6WqTQNVKQ@mail.gmail.com>
Subject: Re: Moving kernel to 5.1
To: Joel Stanley <joel@jms.id.au>
Content-Type: multipart/alternative; boundary="00000000000094ec270588b40cbc"
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Tomer Maimon <tomer.maimon@nuvoton.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000094ec270588b40cbc
Content-Type: text/plain; charset="UTF-8"

Hi Joel,



Sorry for the late reply, we were on holiday.



We had checked dev-5.1 on Nuvoton NPCM750 EVB and it looks fine.

There is a minor change that need to done in the spi node in the dts file.



About Nuvoton drivers:

                1. Ethernet mac (EMC) - on work, hopefully first upstream
version will sent soon.

                2. I2C - on upstream process, the maintainer have not send
feedback yet.

                3. PCI mailbox - cannot upstream, it the same reason as
Aspeed.

                4. BIOS post code - on upstream process, the maintainer
have not send feedback yet.

                5. SPI-NOR - hopefully first upstream version to SPI will
sent soon.



Thanks,



Tomer

On Fri, 10 May 2019 at 08:47, Joel Stanley <joel@jms.id.au> wrote:

> On Wed, 8 May 2019 at 21:45, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> wrote:
> >
> > On 5/8/2019 1:29 AM, Joel Stanley wrote:
> > > Hello OpenBMC developers,
> > >
> > > Linux 5.1 was tagged a few days ago. I've rebased the openbmc tree on
> > > this release and pushed a dev-5.1 branch to github.
> > >
> > > Please take a look at the bump commit, give it a spin on your
> > > hardware, and +1 if it looks good to you:
> > >
> > >   https://gerrit.openbmc-project.xyz/c/openbmc/meta-aspeed/+/21212
> >
> > Intel platforms booted well. Thanks a lot!
>
> Thanks to Jae, Tao and Patrick for the testing. George also tested
> Witherspoon and reported all good.
>
> We've now merged the bump for the aspeed kernel into master.
>
> Nuvoton will be merged once someone with hardware reports in.
>
> Cheers,
>
> Joel
>

--00000000000094ec270588b40cbc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><p class=3D"gmail-MsoPlainText" style=3D"=
margin:0cm 0cm 0.0001pt;font-size:11pt;font-family:Calibri,sans-serif">Hi J=
oel,</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm 0cm 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm 0cm 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">Sorry for the late reply, we were on h=
oliday.</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm 0cm 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm 0cm 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">We had checked dev-5.1 on Nuvoton NPCM=
750 EVB and it
looks fine. </p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm 0cm 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">There is a minor change that need to d=
one in the spi node
in the dts file.</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm 0cm 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm 0cm 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">About Nuvoton drivers: </p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm 0cm 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.
Ethernet mac (EMC) - on work, hopefully first upstream version will sent so=
on.</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm 0cm 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.
I2C - on upstream process, the maintainer have not send feedback yet.</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm 0cm 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.
PCI mailbox - cannot upstream, it the same reason as Aspeed.</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm 0cm 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.
BIOS post code - on upstream process, the maintainer have not send feedback
yet.</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm 0cm 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.
SPI-NOR - hopefully first upstream version to SPI will sent soon.</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm 0cm 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm 0cm 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">Thanks,</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm 0cm 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm 0cm 0.0001pt;font-size:=
11pt;font-family:Calibri,sans-serif">Tomer</p></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 10 May 2019 at 08:47,=
 Joel Stanley &lt;<a href=3D"mailto:joel@jms.id.au">joel@jms.id.au</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, 8=
 May 2019 at 21:45, Jae Hyun Yoo &lt;<a href=3D"mailto:jae.hyun.yoo@linux.i=
ntel.com" target=3D"_blank">jae.hyun.yoo@linux.intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On 5/8/2019 1:29 AM, Joel Stanley wrote:<br>
&gt; &gt; Hello OpenBMC developers,<br>
&gt; &gt;<br>
&gt; &gt; Linux 5.1 was tagged a few days ago. I&#39;ve rebased the openbmc=
 tree on<br>
&gt; &gt; this release and pushed a dev-5.1 branch to github.<br>
&gt; &gt;<br>
&gt; &gt; Please take a look at the bump commit, give it a spin on your<br>
&gt; &gt; hardware, and +1 if it looks good to you:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0<a href=3D"https://gerrit.openbmc-project.xyz/c/openb=
mc/meta-aspeed/+/21212" rel=3D"noreferrer" target=3D"_blank">https://gerrit=
.openbmc-project.xyz/c/openbmc/meta-aspeed/+/21212</a><br>
&gt;<br>
&gt; Intel platforms booted well. Thanks a lot!<br>
<br>
Thanks to Jae, Tao and Patrick for the testing. George also tested<br>
Witherspoon and reported all good.<br>
<br>
We&#39;ve now merged the bump for the aspeed kernel into master.<br>
<br>
Nuvoton will be merged once someone with hardware reports in.<br>
<br>
Cheers,<br>
<br>
Joel<br>
</blockquote></div></div>

--00000000000094ec270588b40cbc--
