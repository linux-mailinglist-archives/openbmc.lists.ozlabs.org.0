Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C358987F1B
	for <lists+openbmc@lfdr.de>; Fri,  9 Aug 2019 18:11:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464qxZ1gGpzDqwh
	for <lists+openbmc@lfdr.de>; Sat, 10 Aug 2019 02:11:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::342; helo=mail-ot1-x342.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="O3Gwu4tZ"; 
 dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464qwg3YDyzDr6b
 for <openbmc@lists.ozlabs.org>; Sat, 10 Aug 2019 02:10:59 +1000 (AEST)
Received: by mail-ot1-x342.google.com with SMTP id r21so128635524otq.6
 for <openbmc@lists.ozlabs.org>; Fri, 09 Aug 2019 09:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bJ6/yDaQaECOMsDxedrsmXUFgihh8zieH6s9eAOwMCE=;
 b=O3Gwu4tZlcZNAlK5d9B4mssIMHQqGe/JdVXL0knYm/PmE3jFiXu35+XSSudekSp7T+
 Vkdp8Fsb2ac2ppxK2QWgQxGxTrEx9xiyYZA/FbZXeKYWCXU2Ms2YO+ESzFWIk3VSrPHn
 cD14oxXwD6XjUzw5Hrl/ZhYLtnTIypJrEesKMa0sGPLIpeKcaxhAeNy0sajL3aUdswET
 FM183mX2gbcjp1xQrHK+7lLn64m12eaGopJRKvt28HMVUlPWE2MgHceS982YDeTuy6zE
 Px6i0Ro/RchmtEyhn6yUxHtMd/7hJ66+bqFCWU1GMZjYcej0SI/6MzZt1qnsbJDVeLWe
 yoCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bJ6/yDaQaECOMsDxedrsmXUFgihh8zieH6s9eAOwMCE=;
 b=QniwRporxdKog1yqqahep9Bc4yiBRIHMFq2+ks+BJ4yU/Xw3HAfao6M6dVw2SE+rmb
 nr0mZjneYP8VBxtcWdUeT4gHuwb5yl2hFyccFK+BORnODZh5jnAjpP+Ricj+YXFgOMRe
 xXliRvqYSVxz/SXpVWlE1kTEhMrbXD4wu1zeR5NLMytl8Ecv6vDp+W07Loy5Z19uXD5I
 +6ylxluPR6m066FfalwXKTlXjwbnNcVYc2njyEcydPoo2Jvct8I4k0Re+aN3NWl3u1tL
 2ptB54HAPIl5oA6v4jnsmPlC6mjzHlBbJ/61Wgi6GpwDo1eiDlNQUc3nQGQGQk/a0kdm
 llBA==
X-Gm-Message-State: APjAAAUWLWIb3EzN7I+Tk2XBqBCEfGWyJ+exdEHeQn8h43D/6B5Mhasc
 LkT01vhFPZ7urwrqnOgxN0iW3egTrVywhGJNE8g=
X-Google-Smtp-Source: APXvYqzQjvvgbKrW4wHS49hdwM2bwUQ5ZbuE3/g7rcwqog2ac/Q72U8zCbOf1XCOTQ5oQJ4xNJosVEYRheqwO2hfD0w=
X-Received: by 2002:a9d:3a4:: with SMTP id f33mr485043otf.269.1565367057134;
 Fri, 09 Aug 2019 09:10:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190808131448.349161-1-tmaimon77@gmail.com>
 <20190808131448.349161-3-tmaimon77@gmail.com>
 <20190808173232.4d79d698@collabora.com>
 <CAP6Zq1iW0C0FDOoqmn5r_xk5HQFWw+GgLfeapvt-8mB50N2Vvg@mail.gmail.com>
 <20190809172557.346e7c41@collabora.com>
 <CAP6Zq1hc0kNHzCE6tcLZdv7NcNWEdn5nh=Wzd8pdbZTuj31Hbg@mail.gmail.com>
 <20190809175140.77747c8d@collabora.com>
In-Reply-To: <20190809175140.77747c8d@collabora.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Fri, 9 Aug 2019 19:19:12 +0300
Message-ID: <CAP6Zq1g7atvoqYMZpe0DZGCf+6vUtVbD-j5T8ZAtLBPJ3w4S3A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] spi: npcm-fiu: add NPCM FIU controller driver
To: Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: multipart/alternative; boundary="000000000000623893058fb16bf2"
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

--000000000000623893058fb16bf2
Content-Type: text/plain; charset="UTF-8"

O.K.

Thanks a lot for the clarifications

I will add it in the next patch.

On Fri, 9 Aug 2019 at 18:51, Boris Brezillon <boris.brezillon@collabora.com>
wrote:

> On Fri, 9 Aug 2019 18:47:08 +0300
> Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> > On Fri, 9 Aug 2019 at 18:26, Boris Brezillon <
> boris.brezillon@collabora.com>
> > wrote:
> >
> > > On Fri, 9 Aug 2019 18:26:23 +0300
> > > Tomer Maimon <tmaimon77@gmail.com> wrote:
> > >
> > > > Hi Boris,
> > > >
> > > > Thanks a lot for your comment.
> > > >
> > > > On Thu, 8 Aug 2019 at 18:32, Boris Brezillon <
> > > boris.brezillon@collabora.com>
> > > > wrote:
> > > >
> > > > > On Thu,  8 Aug 2019 16:14:48 +0300
> > > > > Tomer Maimon <tmaimon77@gmail.com> wrote:
> > > > >
> > > > >
> > > > > > +
> > > > > > +static const struct spi_controller_mem_ops npcm_fiu_mem_ops = {
> > > > > > +     .exec_op = npcm_fiu_exec_op,
> > > > >
> > > > > No npcm_supports_op()? That's suspicious, especially after looking
> at
> > > > > the npcm_fiu_exec_op() (and the functions called from there) where
> the
> > > > > requested ->buswidth seems to be completely ignored...
> > > > >
> > > > > Sorry but I do not fully understand it, do you mean a support for
> the
> > > > buswidth?
> > > > If yes it been done in the UMA functions as follow:
> > > >
> > > >                 uma_cfg |= ilog2(op->cmd.buswidth);
> > > >                 uma_cfg |= ilog2(op->addr.buswidth) <<
> > > >                         NPCM_FIU_UMA_CFG_ADBPCK_SHIFT;
> > > >                 uma_cfg |= ilog2(op->data.buswidth) <<
> > > >                         NPCM_FIU_UMA_CFG_WDBPCK_SHIFT;
> > > >                 uma_cfg |= op->addr.nbytes <<
> > > NPCM_FIU_UMA_CFG_ADDSIZ_SHIFT;
> > > >                 regmap_write(fiu->regmap, NPCM_FIU_UMA_ADDR,
> > > op->addr.val);
> > > >
> > >
> > > Hm, the default supports_op() implementation might be just fine for
> > > your use case. But there's one thing you still need to check: the
> > > number of addr cycles (or address size as you call it in this driver).
> > > Looks like your IP is limited to 4 address cycles, if I'm right, you
> > > should reject any operation that have op->addr.nbytes > 4. I also
> > >
> > Indeed our IP limited to 4 address cycle (bytes) do we have NOR Flash
> with
> > more than 32bit address?
>
> spi-mem is not only about spi-nor, it can be used for any kind of
> memory (NOR, NAND, SRAM, ...) or even to communicate with an FGPA, so
> yes, you have to take care of that.
>
> > I will add this limitation thanks!
> >
> > > wonder if there's a limitation on the data size you can have on a
> > > single transfer. If there's one you should implement ->adjust_op() too.
> > >
> > there is a limitation in a single transfer but I handle it in the
> > npcm_fiu_manualwrite
> > function.
> > Do you suggest to use ->adjust_op() instead?
>
> Yes, should be exposed through ->adjust_op() => the caller needs to
> know when a new operation (one containing an opcode+address) is issued,
> because sometimes such splits are not supported by the memory.
>
>

--000000000000623893058fb16bf2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">O.K.<div><br></div><div>Thanks a lot for the clarification=
s</div><div><br></div><div>I will add it in the next patch.</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 9 =
Aug 2019 at 18:51, Boris Brezillon &lt;<a href=3D"mailto:boris.brezillon@co=
llabora.com">boris.brezillon@collabora.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On Fri, 9 Aug 2019 18:47:08 +0300=
<br>
Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com" target=3D"_blank">t=
maimon77@gmail.com</a>&gt; wrote:<br>
<br>
&gt; On Fri, 9 Aug 2019 at 18:26, Boris Brezillon &lt;<a href=3D"mailto:bor=
is.brezillon@collabora.com" target=3D"_blank">boris.brezillon@collabora.com=
</a>&gt;<br>
&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Fri, 9 Aug 2019 18:26:23 +0300<br>
&gt; &gt; Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com" target=3D=
"_blank">tmaimon77@gmail.com</a>&gt; wrote:<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; Hi Boris,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Thanks a lot for your comment.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Thu, 8 Aug 2019 at 18:32, Boris Brezillon &lt;<br>
&gt; &gt; <a href=3D"mailto:boris.brezillon@collabora.com" target=3D"_blank=
">boris.brezillon@collabora.com</a>&gt;<br>
&gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt; On Thu,=C2=A0 8 Aug 2019 16:14:48 +0300<br>
&gt; &gt; &gt; &gt; Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com"=
 target=3D"_blank">tmaimon77@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +static const struct spi_controller_mem_ops npcm_f=
iu_mem_ops =3D {<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0.exec_op =3D npcm_fiu_exec_op=
,=C2=A0 <br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; No npcm_supports_op()? That&#39;s suspicious, especiall=
y after looking at<br>
&gt; &gt; &gt; &gt; the npcm_fiu_exec_op() (and the functions called from t=
here) where the<br>
&gt; &gt; &gt; &gt; requested -&gt;buswidth seems to be completely ignored.=
..<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Sorry but I do not fully understand it, do you mean a s=
upport for the=C2=A0 <br>
&gt; &gt; &gt; buswidth?<br>
&gt; &gt; &gt; If yes it been done in the UMA functions as follow:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0uma_cfg |=3D ilog2(op-&gt;cmd.buswidth);<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0uma_cfg |=3D ilog2(op-&gt;addr.buswidth) &lt;&lt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM_FIU_UMA_CFG_ADBPCK_SHIFT;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0uma_cfg |=3D ilog2(op-&gt;data.buswidth) &lt;&lt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM_FIU_UMA_CFG_WDBPCK_SHIFT;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0uma_cfg |=3D op-&gt;addr.nbytes &lt;&lt;=C2=A0 <br>
&gt; &gt; NPCM_FIU_UMA_CFG_ADDSIZ_SHIFT;=C2=A0 <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0regmap_write(fiu-&gt;regmap, NPCM_FIU_UMA_ADDR,=C2=A0 <br>
&gt; &gt; op-&gt;addr.val);=C2=A0 <br>
&gt; &gt; &gt;=C2=A0 <br>
&gt; &gt;<br>
&gt; &gt; Hm, the default supports_op() implementation might be just fine f=
or<br>
&gt; &gt; your use case. But there&#39;s one thing you still need to check:=
 the<br>
&gt; &gt; number of addr cycles (or address size as you call it in this dri=
ver).<br>
&gt; &gt; Looks like your IP is limited to 4 address cycles, if I&#39;m rig=
ht, you<br>
&gt; &gt; should reject any operation that have op-&gt;addr.nbytes &gt; 4. =
I also<br>
&gt; &gt;=C2=A0 <br>
&gt; Indeed our IP limited to 4 address cycle (bytes) do we have NOR Flash =
with<br>
&gt; more than 32bit address?<br>
<br>
spi-mem is not only about spi-nor, it can be used for any kind of<br>
memory (NOR, NAND, SRAM, ...) or even to communicate with an FGPA, so<br>
yes, you have to take care of that.<br>
<br>
&gt; I will add this limitation thanks!<br>
&gt; <br>
&gt; &gt; wonder if there&#39;s a limitation on the data size you can have =
on a<br>
&gt; &gt; single transfer. If there&#39;s one you should implement -&gt;adj=
ust_op() too.<br>
&gt; &gt;=C2=A0 <br>
&gt; there is a limitation in a single transfer but I handle it in the<br>
&gt; npcm_fiu_manualwrite<br>
&gt; function.<br>
&gt; Do you suggest to use -&gt;adjust_op() instead?<br>
<br>
Yes, should be exposed through -&gt;adjust_op() =3D&gt; the caller needs to=
<br>
know when a new operation (one containing an opcode+address) is issued,<br>
because sometimes such splits are not supported by the memory.<br>
<br>
</blockquote></div>

--000000000000623893058fb16bf2--
