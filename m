Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F07C87DD9
	for <lists+openbmc@lfdr.de>; Fri,  9 Aug 2019 17:19:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464pml0703zDrH6
	for <lists+openbmc@lfdr.de>; Sat, 10 Aug 2019 01:19:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::341; helo=mail-ot1-x341.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="O7xJn7sA"; 
 dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464plr40p6zDr1b
 for <openbmc@lists.ozlabs.org>; Sat, 10 Aug 2019 01:18:13 +1000 (AEST)
Received: by mail-ot1-x341.google.com with SMTP id j11so33501803otp.10
 for <openbmc@lists.ozlabs.org>; Fri, 09 Aug 2019 08:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6E39xF70omRkYjcNRuorXs8u/mui8rw8S9zp9brvt5M=;
 b=O7xJn7sAdhitTQRrJtIpJVNPYJ1D+zDTZG1h9OGKwLKuijm9cuKJLt5D/rgBDHR0kC
 hlnj0HefDqQFlhOiuu3NlJHKo5jEGPjVXkr5baw0TH9mh41b8v2K0FLZ05WagSbxiHxZ
 h7U5UXaJK2ttfppA4pLAag32Yb0r7U4MNN8tad7MNMwepEyr549NnL0Q6QJQWYqGgl94
 U1DHvrvivt+PziXksV7npgXZ7Es7vOaVR6ZkoTcgJ9q1Otcsey7sdF81Aw9TsgaXxSJ1
 spOcNZyhUvv/rmTV/zRhlYOV5rVtGGR0BCDOP4xjiXExr/axBP4pGw7y0Iiakqss5Zvi
 dRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6E39xF70omRkYjcNRuorXs8u/mui8rw8S9zp9brvt5M=;
 b=Gyk9xNcbcYWwXB7H/1fRUu0luCZcKsmxiiC6VdTWfKKxla91zY7Q8s5Twr/rB0/BCF
 emBqLK/QJAyYTzFWIRCSObY64jiPDCEMqhnfpQqYmqHU22QkwQxUodGecH1KMR3vcdR1
 0nV22zz/V5UDvx3RRiSR6v45F0h+1GIjckWYVt3W6rMAv5ViF06RWOcVU52YjQqFXvZa
 0LlQwtHUnvv/90DJSxZpve5iwH3SV5k7k7hHouB4KkV9nZRx4uhWl0HVtCu+4HlEYJfs
 K5B5lTTGUnFAt5NhhGInZa9r0nKcAnZ+xESA9B2p+Pqci6fSLYu8dSCKaA+OUoDF5qAQ
 a3Ow==
X-Gm-Message-State: APjAAAXrar5WgFwmtxd+9j6NtfBfUNOiNJ4bWPwx0F4wLu470nyHI+n+
 YdylER+05GbCX3kpLiGw+FFBUuTjWiMeJBIzyFU=
X-Google-Smtp-Source: APXvYqyaU81jP/fAhSYUb+TRuTqhkwyF4WXqI2vWvAoXdjlCYScg3aWdyyvOUbxpjiKPF0OMWEnk4MryjRLIDYbSxmY=
X-Received: by 2002:a9d:3a4:: with SMTP id f33mr280749otf.269.1565363888353;
 Fri, 09 Aug 2019 08:18:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190808131448.349161-1-tmaimon77@gmail.com>
 <20190808131448.349161-3-tmaimon77@gmail.com>
 <20190808173232.4d79d698@collabora.com>
In-Reply-To: <20190808173232.4d79d698@collabora.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Fri, 9 Aug 2019 18:26:23 +0300
Message-ID: <CAP6Zq1iW0C0FDOoqmn5r_xk5HQFWw+GgLfeapvt-8mB50N2Vvg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] spi: npcm-fiu: add NPCM FIU controller driver
To: Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: multipart/alternative; boundary="0000000000008275f7058fb0aee6"
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Tali Perry <tali.perry1@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000008275f7058fb0aee6
Content-Type: text/plain; charset="UTF-8"

Hi Boris,

Thanks a lot for your comment.

On Thu, 8 Aug 2019 at 18:32, Boris Brezillon <boris.brezillon@collabora.com>
wrote:

> On Thu,  8 Aug 2019 16:14:48 +0300
> Tomer Maimon <tmaimon77@gmail.com> wrote:
>
>
> > +
> > +static const struct spi_controller_mem_ops npcm_fiu_mem_ops = {
> > +     .exec_op = npcm_fiu_exec_op,
>
> No npcm_supports_op()? That's suspicious, especially after looking at
> the npcm_fiu_exec_op() (and the functions called from there) where the
> requested ->buswidth seems to be completely ignored...
>
> Sorry but I do not fully understand it, do you mean a support for the
buswidth?
If yes it been done in the UMA functions as follow:

                uma_cfg |= ilog2(op->cmd.buswidth);
                uma_cfg |= ilog2(op->addr.buswidth) <<
                        NPCM_FIU_UMA_CFG_ADBPCK_SHIFT;
                uma_cfg |= ilog2(op->data.buswidth) <<
                        NPCM_FIU_UMA_CFG_WDBPCK_SHIFT;
                uma_cfg |= op->addr.nbytes << NPCM_FIU_UMA_CFG_ADDSIZ_SHIFT;
                regmap_write(fiu->regmap, NPCM_FIU_UMA_ADDR, op->addr.val);

> +     .dirmap_create = npcm_fiu_dirmap_create,
> > +     .dirmap_read = npcm_fiu_direct_read,
> > +     .dirmap_write = npcm_fiu_direct_write,
> > +};
> > +
>

Thanks,

Tomer

--0000000000008275f7058fb0aee6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div>Hi Boris,<div><br></div><div>Th=
anks a lot for your comment.</div><div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Thu, 8 Aug 2019 at 18:32, Boris Brezill=
on &lt;<a href=3D"mailto:boris.brezillon@collabora.com">boris.brezillon@col=
labora.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Thu,=C2=A0 8 Aug 2019 16:14:48 +0300<br>
Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com" target=3D"_blank">t=
maimon77@gmail.com</a>&gt; wrote:<br>
<br>
<br>
&gt; +<br>
&gt; +static const struct spi_controller_mem_ops npcm_fiu_mem_ops =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.exec_op =3D npcm_fiu_exec_op,<br>
<br>
No npcm_supports_op()? That&#39;s suspicious, especially after looking at<b=
r>
the npcm_fiu_exec_op() (and the functions called from there) where the<br>
requested -&gt;buswidth seems to be completely ignored...<br>
<br></blockquote><div>Sorry but I do not fully understand it, do you mean a=
 support for the buswidth?</div><div>If yes it been done in the UMA functio=
ns as follow:</div><div><div style=3D"font-family:&quot;Courier New&quot;;f=
ont-size:11pt;color:rgb(0,0,0)">
<pre>                uma_cfg |=3D <span style=3D"font-weight:bolder">ilog2<=
/span>(op-&gt;cmd.buswidth);
                uma_cfg |=3D <span style=3D"font-weight:bolder">ilog2</span=
>(op-&gt;addr.buswidth) &lt;&lt;
                        NPCM_FIU_UMA_CFG_ADBPCK_SHIFT;
                uma_cfg |=3D <span style=3D"font-weight:bolder">ilog2</span=
>(op-&gt;data.buswidth) &lt;&lt;
                        NPCM_FIU_UMA_CFG_WDBPCK_SHIFT;
                uma_cfg |=3D op-&gt;addr.nbytes &lt;&lt; NPCM_FIU_UMA_CFG_A=
DDSIZ_SHIFT;
                <span style=3D"font-weight:bolder">regmap_write</span>(fiu-=
&gt;regmap, NPCM_FIU_UMA_ADDR, op-&gt;addr.val);
</pre></div></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0.dirmap_create =3D npcm_fiu_dirmap_create,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.dirmap_read =3D npcm_fiu_direct_read,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.dirmap_write =3D npcm_fiu_direct_write,<br>
&gt; +};<br>
&gt; +<br></blockquote><div><br></div><div>Thanks,</div><div><br></div><div=
>Tomer=C2=A0</div></div></div></div>

--0000000000008275f7058fb0aee6--
