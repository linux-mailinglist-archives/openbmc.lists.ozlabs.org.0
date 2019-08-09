Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CABA187E36
	for <lists+openbmc@lfdr.de>; Fri,  9 Aug 2019 17:39:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464qDK51XtzDqNx
	for <lists+openbmc@lfdr.de>; Sat, 10 Aug 2019 01:39:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::342; helo=mail-ot1-x342.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MfUSya2T"; 
 dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464qCj28rGzDq69
 for <openbmc@lists.ozlabs.org>; Sat, 10 Aug 2019 01:38:57 +1000 (AEST)
Received: by mail-ot1-x342.google.com with SMTP id l15so134222351otn.9
 for <openbmc@lists.ozlabs.org>; Fri, 09 Aug 2019 08:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JdicyUKL6lA5d4oVu34qA4RrJp51B/Pim4Jccw9H8N4=;
 b=MfUSya2T8MFNuJt0IeLjMMwHqctw/wEojhU1YWM5XG4R6N+e8044RqSot6A+SauZfM
 8Q6sXCM7XNEQKwqAw7y7Cvp6YzO05ued+g+hJY2H9rSDQpvPzoP4bzj7hcOckg4teNqa
 bA5v2xhvCRZYvlXaDuONEK/s7L3ci/xTFAoAuAR2fbsxv6gLv4KteohOqV/pnxkQgrpk
 z2yGoLejqYbv2+2skd4NqARAncPe1V+sHXuHH2ub5FRmQqBsOYEmg3Ear2wXLk5mt/KD
 VG9Y0XviivKeF39yHUAlByIdlTKW/zXGkp2xhPr7Lv10IIkEQXQrvJ4G+TNKFlIeBy/N
 EUhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JdicyUKL6lA5d4oVu34qA4RrJp51B/Pim4Jccw9H8N4=;
 b=DgqKsBUJ6F3jQemd5Q5f+IznIIhxWFi39yMkgHvzZS79bF/6fcUHgSUqkUEOqz47Yv
 RZihWhBY+JJ+eiAKq5jkFag8XcKxGtFVSe71Yf9tPE0u/u+mk6cK1KYsKoGfpQEZ1lZ4
 Q8Da2WQXBQu6BrI6rPD41Q5/D2U3jNkixQryP4Qz6F3OdNN14w9cTOWozg8w84UZ+1GB
 WJuUpNR0+QFGPrV0D8okPlrtdMlm0664taj8yqzKbHOOog0tEgozYM0cITFkTuCaJoZp
 LDgPuXxE+jJtHRLZgvlw/Vmp5BAkCfr6UFl9v8jMK2lv6jQuk2WEBTHCGGiflT5HlOUM
 5Hqw==
X-Gm-Message-State: APjAAAXogpAPbG2Y5gcz9Kpw3aFN8RQree93RcBttZnQXnzWniCRdARD
 vS1+Q9GBAMDwFove7i703InAP1QNJkLZN0awJLE=
X-Google-Smtp-Source: APXvYqw7EXullSUEr8CBet42UrndYYbn6uX1IIeESRajvr95ZKlfv3eMyQl65ya+AdpRMywZBzzNO7opOJThaW8saXQ=
X-Received: by 2002:a05:6830:154:: with SMTP id
 j20mr1003516otp.266.1565365133673; 
 Fri, 09 Aug 2019 08:38:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190808131448.349161-1-tmaimon77@gmail.com>
 <20190808131448.349161-3-tmaimon77@gmail.com>
 <20190808173232.4d79d698@collabora.com>
 <CAP6Zq1iW0C0FDOoqmn5r_xk5HQFWw+GgLfeapvt-8mB50N2Vvg@mail.gmail.com>
 <20190809172557.346e7c41@collabora.com>
In-Reply-To: <20190809172557.346e7c41@collabora.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Fri, 9 Aug 2019 18:47:08 +0300
Message-ID: <CAP6Zq1hc0kNHzCE6tcLZdv7NcNWEdn5nh=Wzd8pdbZTuj31Hbg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] spi: npcm-fiu: add NPCM FIU controller driver
To: Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: multipart/alternative; boundary="000000000000bc86e8058fb0f8e0"
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

--000000000000bc86e8058fb0f8e0
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 Aug 2019 at 18:26, Boris Brezillon <boris.brezillon@collabora.com>
wrote:

> On Fri, 9 Aug 2019 18:26:23 +0300
> Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> > Hi Boris,
> >
> > Thanks a lot for your comment.
> >
> > On Thu, 8 Aug 2019 at 18:32, Boris Brezillon <
> boris.brezillon@collabora.com>
> > wrote:
> >
> > > On Thu,  8 Aug 2019 16:14:48 +0300
> > > Tomer Maimon <tmaimon77@gmail.com> wrote:
> > >
> > >
> > > > +
> > > > +static const struct spi_controller_mem_ops npcm_fiu_mem_ops = {
> > > > +     .exec_op = npcm_fiu_exec_op,
> > >
> > > No npcm_supports_op()? That's suspicious, especially after looking at
> > > the npcm_fiu_exec_op() (and the functions called from there) where the
> > > requested ->buswidth seems to be completely ignored...
> > >
> > > Sorry but I do not fully understand it, do you mean a support for the
> > buswidth?
> > If yes it been done in the UMA functions as follow:
> >
> >                 uma_cfg |= ilog2(op->cmd.buswidth);
> >                 uma_cfg |= ilog2(op->addr.buswidth) <<
> >                         NPCM_FIU_UMA_CFG_ADBPCK_SHIFT;
> >                 uma_cfg |= ilog2(op->data.buswidth) <<
> >                         NPCM_FIU_UMA_CFG_WDBPCK_SHIFT;
> >                 uma_cfg |= op->addr.nbytes <<
> NPCM_FIU_UMA_CFG_ADDSIZ_SHIFT;
> >                 regmap_write(fiu->regmap, NPCM_FIU_UMA_ADDR,
> op->addr.val);
> >
>
> Hm, the default supports_op() implementation might be just fine for
> your use case. But there's one thing you still need to check: the
> number of addr cycles (or address size as you call it in this driver).
> Looks like your IP is limited to 4 address cycles, if I'm right, you
> should reject any operation that have op->addr.nbytes > 4. I also
>
Indeed our IP limited to 4 address cycle (bytes) do we have NOR Flash with
more than 32bit address?
I will add this limitation thanks!

> wonder if there's a limitation on the data size you can have on a
> single transfer. If there's one you should implement ->adjust_op() too.
>
there is a limitation in a single transfer but I handle it in the
npcm_fiu_manualwrite
function.
Do you suggest to use ->adjust_op() instead?

--000000000000bc86e8058fb0f8e0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, 9 Aug 2019 at 18:26, Boris Br=
ezillon &lt;<a href=3D"mailto:boris.brezillon@collabora.com">boris.brezillo=
n@collabora.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">On Fri, 9 Aug 2019 18:26:23 +0300<br>
Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com" target=3D"_blank">t=
maimon77@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Hi Boris,<br>
&gt; <br>
&gt; Thanks a lot for your comment.<br>
&gt; <br>
&gt; On Thu, 8 Aug 2019 at 18:32, Boris Brezillon &lt;<a href=3D"mailto:bor=
is.brezillon@collabora.com" target=3D"_blank">boris.brezillon@collabora.com=
</a>&gt;<br>
&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Thu,=C2=A0 8 Aug 2019 16:14:48 +0300<br>
&gt; &gt; Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com" target=3D=
"_blank">tmaimon77@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +static const struct spi_controller_mem_ops npcm_fiu_mem_ops=
 =3D {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0.exec_op =3D npcm_fiu_exec_op,=C2=A0 <b=
r>
&gt; &gt;<br>
&gt; &gt; No npcm_supports_op()? That&#39;s suspicious, especially after lo=
oking at<br>
&gt; &gt; the npcm_fiu_exec_op() (and the functions called from there) wher=
e the<br>
&gt; &gt; requested -&gt;buswidth seems to be completely ignored...<br>
&gt; &gt;<br>
&gt; &gt; Sorry but I do not fully understand it, do you mean a support for=
 the=C2=A0 <br>
&gt; buswidth?<br>
&gt; If yes it been done in the UMA functions as follow:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uma_cfg |=
=3D ilog2(op-&gt;cmd.buswidth);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uma_cfg |=
=3D ilog2(op-&gt;addr.buswidth) &lt;&lt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0NPCM_FIU_UMA_CFG_ADBPCK_SHIFT;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uma_cfg |=
=3D ilog2(op-&gt;data.buswidth) &lt;&lt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0NPCM_FIU_UMA_CFG_WDBPCK_SHIFT;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uma_cfg |=
=3D op-&gt;addr.nbytes &lt;&lt; NPCM_FIU_UMA_CFG_ADDSIZ_SHIFT;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_wr=
ite(fiu-&gt;regmap, NPCM_FIU_UMA_ADDR, op-&gt;addr.val);<br>
&gt;<br>
<br>
Hm, the default supports_op() implementation might be just fine for<br>
your use case. But there&#39;s one thing you still need to check: the<br>
number of addr cycles (or address size as you call it in this driver).<br>
Looks like your IP is limited to 4 address cycles, if I&#39;m right, you<br=
>
should reject any operation that have op-&gt;addr.nbytes &gt; 4. I also<br>=
</blockquote><div>Indeed our IP limited to 4 address cycle (bytes) do we ha=
ve NOR Flash with more than 32bit address?</div><div>I will add this limita=
tion thanks!=C2=A0=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
wonder if there&#39;s a limitation on the data size you can have on a<br>
single transfer. If there&#39;s one you should implement -&gt;adjust_op() t=
oo.<br></blockquote><div>there is a limitation in a single transfer but I h=
andle it in the=C2=A0<span style=3D"font-weight:bolder;color:rgb(0,0,0);fon=
t-family:&quot;Courier New&quot;;font-size:11pt">npcm_fiu_manualwrite </spa=
n><span style=3D"font-weight:bolder;color:rgb(0,0,0);font-size:11pt"><font =
face=3D"arial, sans-serif">function</font></span><span style=3D"font-weight=
:bolder;color:rgb(0,0,0);font-family:&quot;Courier New&quot;;font-size:11pt=
">.</span></div><div><font face=3D"arial, sans-serif"><font color=3D"#00000=
0" style=3D"">Do you suggest to use=C2=A0</font>-&gt;adjust_op() instead?</=
font></div><div><font face=3D"arial, sans-serif"><br></font></div><div><br>=
</div></div></div>

--000000000000bc86e8058fb0f8e0--
