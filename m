Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CA7EB22B
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 15:09:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473nJb6F5CzF5nr
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 01:09:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::241;
 helo=mail-oi1-x241.google.com; envelope-from=tmaimon77@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="D+reL/Q5"; 
 dkim-atps=neutral
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473nHt2kdQzF3Rm
 for <openbmc@lists.ozlabs.org>; Fri,  1 Nov 2019 01:09:14 +1100 (AEDT)
Received: by mail-oi1-x241.google.com with SMTP id s71so5241022oih.11
 for <openbmc@lists.ozlabs.org>; Thu, 31 Oct 2019 07:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PTF+D4EfSavM3VfsiZmUADkjugp4uiyi0N4+qQHM9Cg=;
 b=D+reL/Q5NmyPIdEUr5YnarL0Td7QSkSi1Db9zLKMBE2U2r20RSUvADgfOs8sOCPEFM
 xt81+EPl7w7wSxNptLLlAbp0ZLbNBi8vTxT51NxISdqcoFqPHdhHipnkY7Fbt3cuEswK
 598BGtLlaWuJAgLiKVTABHNrb1La9YUhtCiJ/cFW8CZWEOE68oEBZAVQwj13vmlw5yGj
 tm4lFlbAofk29qLs2h3LDZkxRuYD4KxMYSq9tQkjI/zqEeOWgNVeJ9oRQdhSyi3cyFvV
 tnzVDLNZbsv/t+uzDHz9PUVzlqxS0wbNzzVpeBtX9K28meMSBQWR716NUay3Cn8JdC2u
 s+WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PTF+D4EfSavM3VfsiZmUADkjugp4uiyi0N4+qQHM9Cg=;
 b=E5KOsL4W/1aCjfzoKGTBN5i3SI7du44unIYW+PC0mzi8TOVOJkAVZpdBExmGGc2/H/
 am/lgxTellwxp6LIHYjdzclva0LmsViYY/YFYHDJSTmKHoUlCJrk7VuNjRMDtOVRmCI+
 XOftIr3+GfNPgMclIDsd31iOpI99ynYtjnxaFF0OlESas6/L7lGZci4xhdPLvzGuMkI4
 meIUcHXb8EKpsQl71QK6ncKoRYk3o+d4kZzck0RC6e3d2avHsSFAwMEmklvK0kQvSJAn
 2ut0LS5sEgphhM27rrXYl/z57lk4bFvmxJBhl5L5O1UlV/YfrUhVGjpUbD3nBeOZKDOi
 6wQQ==
X-Gm-Message-State: APjAAAU9Y07YBRK5TupKgVJ48H5g43v/XPo9d4mgO982z8F0rv7/QknY
 Rss5EOP+pRpGzjeZMjo1nG2Z/w2XrPaXp+IfMFs=
X-Google-Smtp-Source: APXvYqwGWbQQVpUS6NVoy3ui1BgAof238YTTMwELEANxKdMmCJX/T9MnkpeKVaXF6KWbnQvm2BI489zp2dl6sjceANw=
X-Received: by 2002:aca:cc10:: with SMTP id c16mr1140775oig.85.1572530950234; 
 Thu, 31 Oct 2019 07:09:10 -0700 (PDT)
MIME-Version: 1.0
References: <20191028155403.134126-1-tmaimon77@gmail.com>
 <20191028155403.134126-2-tmaimon77@gmail.com>
 <39ba2073ca02b391d6006a124ed29d9a57f12a25.camel@pengutronix.de>
In-Reply-To: <39ba2073ca02b391d6006a124ed29d9a57f12a25.camel@pengutronix.de>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 31 Oct 2019 16:18:52 +0200
Message-ID: <CAP6Zq1iQdWFp8NbBT3vdUnaFFJL3N=Ri2Pp0TheDze6Ya92_dw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-binding: reset: add NPCM reset controller
 documentation
To: Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: multipart/alternative; boundary="000000000000afe5aa05963564ad"
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
 devicetree <devicetree@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000afe5aa05963564ad
Content-Type: text/plain; charset="UTF-8"

Hi Philipp,

Thanks a lot for your comments.

On Tue, 29 Oct 2019 at 17:15, Philipp Zabel <p.zabel@pengutronix.de> wrote:

> Hi Tomer,
>
> On Mon, 2019-10-28 at 17:54 +0200, Tomer Maimon wrote:
> > Added device tree binding documentation for Nuvoton BMC
> > NPCM reset controller.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  .../bindings/reset/nuvoton,npcm-reset.txt     | 35 +++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> >  create mode 100644
> Documentation/devicetree/bindings/reset/nuvoton,npcm-reset.txt
> >
> > diff --git
> a/Documentation/devicetree/bindings/reset/nuvoton,npcm-reset.txt
> b/Documentation/devicetree/bindings/reset/nuvoton,npcm-reset.txt
> > new file mode 100644
> > index 000000000000..94793285a2ac
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/reset/nuvoton,npcm-reset.txt
> > @@ -0,0 +1,35 @@
> > +Nuvoton NPCM Reset controller
> > +
> > +In the NPCM Reset controller boot the USB PHY, USB host
> > +and USB device initialize.
>
> Isn't this just a detail of the driver implementation?
>
> > +Required properties:
> > +- compatible : "nuvoton,npcm750-reset" for NPCM7XX BMC
>
> Is this driver expected to be reused for other SoCs?
>
Yes.

>
> > +- reg : specifies physical base address and size of the register.
> > +- #reset-cells: must be set to 1
> > +
> > +Optional property:
> > +- nuvoton,sw-reset-number - Contains the software reset number to
> restart the SoC.
> > +  NPCM7xx contain four software reset that represent numbers 1 to 4.
>
> What's the difference between the four restart bits? Is this something
> that has to be configured per board?
>
The SW reset lines are the same, but we like to give full flexibility to
choose the line to use for board reset.

>
> > +  If 'nuvoton,sw-reset-number' is not specfied software reset is
> disabled.
> > +
> > +Example:
> > +     rstc: rstc@f0801000 {
> > +             compatible = "nuvoton,npcm750-reset";
> > +             reg = <0xf0801000 0x70>;
> > +             #reset-cells = <1>;
> > +             nuvoton,sw-reset-number = <2>;
> > +     };
> > +
> > +Specifying reset lines connected to IP NPCM7XX modules
> > +======================================================
> > +example:
> > +
> > +        spi0: spi@..... {
> > +                ...
> > +                resets = <&rstc NPCM7XX_RESET_PSPI1>;
> > +                ...
> > +        };
> > +
> > +The index could be found in <dt-bindings/reset/nuvoton,npcm7xx-reset.h>.
>
> regards
> Philipp
>
>
Regards,

Tomer

--000000000000afe5aa05963564ad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Philipp,</div><div dir=3D"ltr"><br></d=
iv><div>Thanks a lot for your comments.</div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 29 Oct 2019 at 17:15, Philip=
p Zabel &lt;<a href=3D"mailto:p.zabel@pengutronix.de">p.zabel@pengutronix.d=
e</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Hi Tomer,<br>
<br>
On Mon, 2019-10-28 at 17:54 +0200, Tomer Maimon wrote:<br>
&gt; Added device tree binding documentation for Nuvoton BMC<br>
&gt; NPCM reset controller.<br>
&gt; <br>
&gt; Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com"=
 target=3D"_blank">tmaimon77@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../bindings/reset/nuvoton,npcm-reset.txt=C2=A0 =C2=A0 =C2=A0| 3=
5 +++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 35 insertions(+)<br>
&gt;=C2=A0 create mode 100644 Documentation/devicetree/bindings/reset/nuvot=
on,npcm-reset.txt<br>
&gt; <br>
&gt; diff --git a/Documentation/devicetree/bindings/reset/nuvoton,npcm-rese=
t.txt b/Documentation/devicetree/bindings/reset/nuvoton,npcm-reset.txt<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..94793285a2ac<br>
&gt; --- /dev/null<br>
&gt; +++ b/Documentation/devicetree/bindings/reset/nuvoton,npcm-reset.txt<b=
r>
&gt; @@ -0,0 +1,35 @@<br>
&gt; +Nuvoton NPCM Reset controller<br>
&gt; +<br>
&gt; +In the NPCM Reset controller boot the USB PHY, USB host<br>
&gt; +and USB device initialize.<br>
<br>
Isn&#39;t this just a detail of the driver implementation?<br>
<br>
&gt; +Required properties:<br>
&gt; +- compatible : &quot;nuvoton,npcm750-reset&quot; for NPCM7XX BMC<br>
<br>
Is this driver expected to be reused for other SoCs?<br></blockquote><div>Y=
es.=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +- reg : specifies physical base address and size of the register.<br>
&gt; +- #reset-cells: must be set to 1<br>
&gt; +<br>
&gt; +Optional property:<br>
&gt; +- nuvoton,sw-reset-number - Contains the software reset number to res=
tart the SoC.<br>
&gt; +=C2=A0 NPCM7xx contain four software reset that represent numbers 1 t=
o 4.<br>
<br>
What&#39;s the difference between the four restart bits? Is this something<=
br>
that has to be configured per board?<br></blockquote><div>The SW reset line=
s are the same, but we like to give full flexibility to choose the line to =
use for board reset.</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
<br>
&gt; +=C2=A0 If &#39;nuvoton,sw-reset-number&#39; is not specfied software =
reset is disabled.<br>
&gt; +<br>
&gt; +Example:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rstc: rstc@f0801000 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
nuvoton,npcm750-reset&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0xf080100=
0 0x70&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#reset-cells =3D &lt;=
1&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nuvoton,sw-reset-numb=
er =3D &lt;2&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +Specifying reset lines connected to IP NPCM7XX modules<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D<br>
&gt; +example:<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 spi0: spi@..... {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ...<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 resets =3D &l=
t;&amp;rstc NPCM7XX_RESET_PSPI1&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ...<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; +<br>
&gt; +The index could be found in &lt;dt-bindings/reset/nuvoton,npcm7xx-res=
et.h&gt;.<br>
<br>
regards<br>
Philipp<br>
<br></blockquote><div><br></div><div>Regards,</div><div><br></div><div>Tome=
r=C2=A0</div></div></div>

--000000000000afe5aa05963564ad--
