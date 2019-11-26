Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 78738109955
	for <lists+openbmc@lfdr.de>; Tue, 26 Nov 2019 07:42:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MZ8k5wKpzDqjZ
	for <lists+openbmc@lfdr.de>; Tue, 26 Nov 2019 17:42:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::243;
 helo=mail-lj1-x243.google.com; envelope-from=tali.perry1@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QG3Swgek"; 
 dkim-atps=neutral
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MZ833LxDzDqfs
 for <openbmc@lists.ozlabs.org>; Tue, 26 Nov 2019 17:42:08 +1100 (AEDT)
Received: by mail-lj1-x243.google.com with SMTP id g3so18785189ljl.11
 for <openbmc@lists.ozlabs.org>; Mon, 25 Nov 2019 22:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2xGeiyNJPQkdY0veaO9g86+0OzNQfBnLFqQCQNagpdU=;
 b=QG3Swgek/rSVn1J+AJb0eQMBXhryea3c2QuiaO+V28q6EgpYLHsb/FSuKwITugS0VB
 DySh6U+r/9XPr18M0z2FAmXGa9Ku1M63aV4vrF5JwDOFw9bx78Lvde/qL3p1U+LDd8nC
 F6jngmpBqHRYv07nLbTsoiWiyQOIxmYjRP4DekPmIfzftziDwbGOPMYkXa5GDJ3TztbH
 9hYkt4Xz73G+oMgGC5xAoSjEY+wGFYHAxPevwwt2hprtxAM/+Ep0AuMOKaOX7wi82p3y
 koBUQgo/xuWzyrNhUl1pk2DBUf1vj1snYJtWvuwFl8HdBK2mRNFX8b6AeFa5A4WuM2kj
 yoKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2xGeiyNJPQkdY0veaO9g86+0OzNQfBnLFqQCQNagpdU=;
 b=Ku9R/BPmP4rLUQiogQZmVJYuQHknv6dsAambjCmzuUYS/9+2PQ4EuqLp8FEB9Ol5bM
 OQeRB7t/BmHmOwwv9px3Y8jBzfMA//H5d6aZyxIdAB0pxNNzxSjtEb3siXb/KDFnsxpY
 Nmbi94E3wz6BzVhFjE46vNEB/sL6Nf2Y3KL4NMgVplHhh6q6TlooHH5NvIY1i9Dyt/YS
 MeQcSh09/mxfsAxf8eVWdq8kNd1OzvyRkZbLMgAD5pDgRyiw/HzSul+ckoXFal9F45Hv
 qvViulmrmMnC2N59iJN/nYad2WaBKE4f3Bu9sfu6HuYs0subieGz+YhDNGpbf91gJgSv
 Ihwg==
X-Gm-Message-State: APjAAAWm33s7TXK4Ws0j+keLkIph+QmyTe+XiFm/P8kA5GG1RiroI2+A
 oZAbOJSka5UMHRXdr4TXOSAzXEdvA3wDrqGavE8=
X-Google-Smtp-Source: APXvYqwIAOVTPUbCS11da6ePMgAzGqynOQLLspbm8q5qZ7xv3lHVMqKMZ/3rmZD8ThWCOs+ZieZ5rTxNOvFNUmAPARM=
X-Received: by 2002:a05:651c:387:: with SMTP id
 e7mr25841171ljp.0.1574750523231; 
 Mon, 25 Nov 2019 22:42:03 -0800 (PST)
MIME-Version: 1.0
References: <20191121095350.158689-1-tali.perry1@gmail.com>
 <20191121095350.158689-3-tali.perry1@gmail.com> <20191125151618.GE2412@kunai>
In-Reply-To: <20191125151618.GE2412@kunai>
From: Tali Perry <tali.perry1@gmail.com>
Date: Tue, 26 Nov 2019 08:47:14 +0200
Message-ID: <CAHb3i=tGTcu2q15E5CL_od1rDgRDyx=ygoGSCu88AfBrnFn71w@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] i2c: npcm: Add Nuvoton NPCM I2C controller driver
To: Wolfram Sang <wsa@the-dreams.de>
Content-Type: multipart/alternative; boundary="0000000000008c10cc05983a2deb"
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
 devicetree <devicetree@vger.kernel.org>, benjaminfair@google.com,
 avifishman70@gmail.com, venture@google.com,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-i2c@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 syniurge@gmail.com, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000008c10cc05983a2deb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

Thanks for your comments.

The NPCM7XX BMC I2C\SMB controller HW module supports both SMB and I2C.
It's main features are:
1. Supports Fast-Mode (400 KHz clock) I2C and Fast-Mode-plus (1 MHz clock) =
I
2C
2. Supports the =E2=80=98fairness=E2=80=99 arbitration protocol defined by =
the MCTP
SMBus/I2C Transport Binding Specification v1.0.0
3. 32KB packets : this is an I2C spec limitation. The HW has no limit on
packets size. It has a 16 bytes FIFO which can be reloaded over and over.
4. w\o size byte (for SMB block protocol).
5. Both master and slave. It can also replace modes in run time
(requirement for IPMB and MCTP).
6. Bus timing is selected to support both specs.

Originally the HW spec stated SMB everywhere .

Should I rename the SMB to I2C all over the driver?

Thanks,
Tali Perry


On Mon, Nov 25, 2019 at 5:16 PM Wolfram Sang <wsa@the-dreams.de> wrote:

> On Thu, Nov 21, 2019 at 11:53:50AM +0200, Tali Perry wrote:
> > Add Nuvoton NPCM BMC i2c controller driver.
> >
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
>
> Looking at all this SMB_* naming of the registers and also the quirks,
> this looks more like an SMBUS controller to me?
>
> > +     // currently I2C slave IF only supports single byte operations.
> > +     // in order to utilyze the npcm HW FIFO, the driver will ask for
> 16bytes
> > +     // at a time, pack them in buffer, and then transmit them all
> together
> > +     // to the FIFO and onward to the bus .
> > +     // NACK on read will be once reached to
> bus->adap->quirks->max_read_len
> > +     // sending a NACK whever the backend requests for it is not
> supported.
>
> This for example...
>
> > +static const struct i2c_adapter_quirks npcm_i2c_quirks =3D {
> > +     .max_read_len =3D 32768,
> > +     .max_write_len =3D 32768,
> > +     .max_num_msgs =3D 2,
> > +     .flags =3D I2C_AQ_COMB_WRITE_THEN_READ
> > +};
>
> ... and this. Like SMBus with the only exception of being able to send
> 32K in a row. Or?
>
>

--0000000000008c10cc05983a2deb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D""><=
font face=3D"monospace">Hi Wolfram,</font></div><div class=3D"gmail_default=
" style=3D""><font face=3D"monospace"><br></font></div><div class=3D"gmail_=
default" style=3D""><font face=3D"monospace">Thanks for your comments.</fon=
t></div><div class=3D"gmail_default" style=3D""><font face=3D"monospace"><b=
r></font></div><div class=3D"gmail_default" style=3D""><font face=3D"monosp=
ace">The NPCM7XX BMC I2C\SMB controller HW module supports both SMB and I2C=
.=C2=A0</font></div><div class=3D"gmail_default" style=3D""><font face=3D"m=
onospace">It&#39;s main features are:</font></div><div class=3D"gmail_defau=
lt" style=3D""><font face=3D"monospace">1.=C2=A0<span style=3D"color:rgb(0,=
0,0);font-size:9pt">Supports Fast-Mode (400 KHz clock) I</span><span style=
=3D"color:rgb(0,0,0);font-variant-numeric:normal;font-variant-east-asian:no=
rmal;font-size:7pt">2<span style=3D"font-size:9pt;font-variant-numeric:norm=
al;font-variant-east-asian:normal">C and Fast-Mode-plus (1 MHz clock) I<spa=
n style=3D"font-size:7pt;font-variant-numeric:normal;font-variant-east-asia=
n:normal">2<span style=3D"font-size:9pt;font-variant-numeric:normal;font-va=
riant-east-asian:normal">C</span></span></span></span></font></div><div cla=
ss=3D"gmail_default" style=3D""><font face=3D"monospace"><span style=3D"col=
or:rgb(0,0,0);font-variant-numeric:normal;font-variant-east-asian:normal;fo=
nt-size:7pt"><span style=3D"font-size:9pt;font-variant-numeric:normal;font-=
variant-east-asian:normal"><span style=3D"font-size:7pt;font-variant-numeri=
c:normal;font-variant-east-asian:normal"><span style=3D"font-size:9pt;font-=
variant-numeric:normal;font-variant-east-asian:normal">2.=C2=A0</span></spa=
n></span></span><span style=3D"color:rgb(0,0,0);font-size:9pt">Supports the=
 =E2=80=98fairness=E2=80=99 arbitration protocol defined by the MCTP SMBus/=
I2C Transport Binding Specification v1.0.0</span></font></div><div class=3D=
"gmail_default" style=3D""><font face=3D"monospace">3. 32KB packets : this =
is an I2C spec limitation. The HW has no limit on packets size. It has a 16=
 bytes FIFO which can be reloaded over and over.</font></div><div class=3D"=
gmail_default" style=3D""><font face=3D"monospace">4. w\o size byte (for SM=
B block protocol).</font></div><div class=3D"gmail_default" style=3D""><fon=
t face=3D"monospace">5. Both master and slave. It can also replace modes in=
 run time (requirement for IPMB and MCTP).</font></div><div class=3D"gmail_=
default" style=3D""><font face=3D"monospace">6. Bus timing is selected to s=
upport both specs.</font></div><div class=3D"gmail_default" style=3D""><fon=
t face=3D"monospace"><br></font></div><div class=3D"gmail_default" style=3D=
""><font face=3D"monospace">Originally the HW spec stated SMB everywhere .=
=C2=A0</font></div><div class=3D"gmail_default" style=3D""><font face=3D"mo=
nospace"><br></font></div><div class=3D"gmail_default" style=3D""><font fac=
e=3D"monospace">Should I rename the SMB to I2C all over the driver?</font><=
/div><div class=3D"gmail_default" style=3D""><font face=3D"monospace"><br><=
/font></div><div class=3D"gmail_default" style=3D""><font face=3D"monospace=
">Thanks,</font></div><div class=3D"gmail_default" style=3D""><font face=3D=
"monospace">Tali Perry</font></div><div class=3D"gmail_default" style=3D"fo=
nt-family:monospace,monospace"><br></div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 25, 2019 at 5:16 PM Wo=
lfram Sang &lt;<a href=3D"mailto:wsa@the-dreams.de">wsa@the-dreams.de</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu=
, Nov 21, 2019 at 11:53:50AM +0200, Tali Perry wrote:<br>
&gt; Add Nuvoton NPCM BMC i2c controller driver.<br>
&gt; <br>
&gt; Signed-off-by: Tali Perry &lt;<a href=3D"mailto:tali.perry1@gmail.com"=
 target=3D"_blank">tali.perry1@gmail.com</a>&gt;<br>
<br>
Looking at all this SMB_* naming of the registers and also the quirks,<br>
this looks more like an SMBUS controller to me?<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0// currently I2C slave IF only supports single by=
te operations.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0// in order to utilyze the npcm HW FIFO, the driv=
er will ask for 16bytes<br>
&gt; +=C2=A0 =C2=A0 =C2=A0// at a time, pack them in buffer, and then trans=
mit them all together<br>
&gt; +=C2=A0 =C2=A0 =C2=A0// to the FIFO and onward to the bus .<br>
&gt; +=C2=A0 =C2=A0 =C2=A0// NACK on read will be once reached to bus-&gt;a=
dap-&gt;quirks-&gt;max_read_len<br>
&gt; +=C2=A0 =C2=A0 =C2=A0// sending a NACK whever the backend requests for=
 it is not supported.<br>
<br>
This for example...<br>
<br>
&gt; +static const struct i2c_adapter_quirks npcm_i2c_quirks =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.max_read_len =3D 32768,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.max_write_len =3D 32768,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.max_num_msgs =3D 2,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.flags =3D I2C_AQ_COMB_WRITE_THEN_READ<br>
&gt; +};<br>
<br>
... and this. Like SMBus with the only exception of being able to send<br>
32K in a row. Or?<br>
<br>
</blockquote></div></div>

--0000000000008c10cc05983a2deb--
