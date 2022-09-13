Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AF15B91FC
	for <lists+openbmc@lfdr.de>; Thu, 15 Sep 2022 03:05:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSfC7626Vz308b
	for <lists+openbmc@lfdr.de>; Thu, 15 Sep 2022 11:05:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jvdTS9Po;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com; envelope-from=pkarthikeyan1509@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jvdTS9Po;
	dkim-atps=neutral
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRfHW6ltzz2y6N;
	Tue, 13 Sep 2022 20:05:59 +1000 (AEST)
Received: by mail-lj1-x22c.google.com with SMTP id bn9so13726781ljb.6;
        Tue, 13 Sep 2022 03:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=rlCYIezKXUB1wEtMepw03QU0c1WLv0X3vNaHwX8TlU4=;
        b=jvdTS9PobM27JWSl7WbBN2SYEV4wqfagQxNCctvUe1EYJkXNMs1oP1UvxNIc9TtzDh
         /su2jcKEl2rA/aAf3XHVpxj/G9jR9ozjTJW91lf7lNIhUMMo9cMCUshq0PcI/R602poc
         HnUKuOz19xEkWxlxjQ7BJQNJJJo0mRnjEmhozgutPWyBjdfMr7WP87lkuzzVu798IKDl
         iSM8/Vhpzwctm+kwPxbc32/ln5diDCyc4P1FBcZgEiWmWcNoVOmsLODh8Uddvu+yxzNO
         9Nyv/iwg3XUqjHb48786DL6YEoHFr5Rr0+9MWjS13wYeY/PLBPJej/aSxEHZCKTllh2P
         GKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=rlCYIezKXUB1wEtMepw03QU0c1WLv0X3vNaHwX8TlU4=;
        b=1bjbT429q7APYr/wXPgFCBEMm3gDmHKm3O+2KZadpiE48+DLTTL/TWqfnoErzKgBac
         i000kL2AnTkZW4TS8blbRM1IHKh+kQts4z3MLSkyrqRKtrmT1LXxp+SfA5hCqjVFnNW/
         P3izCChuFp0WZR2owvGh4mojRjn8jdqK4dS2YgcFPpjKznP9e+VmV4QHssryp+EEuD+o
         pPALgZRjYdxa0rLhbtzgATX/Q45Xa9mfXhpD5QdNqQTOIfzquyapmI35nIl+qUN1jltf
         HQ5dlRzmrSmf0xXOXsu+UTQh4Rm/AdFaxZnlF7+qSxuduhgTA/lohQZRdF2/VVQELtUH
         LT7A==
X-Gm-Message-State: ACgBeo1hhpkkbGzHBHc5UGeHq8hAzNY/80Q+sFwAO5LAk7ojS6E8u3H1
	4/Gyb/A+2vj1IOgMpfp2Qw7pBj2O60v0OJ9FvkU=
X-Google-Smtp-Source: AA6agR4LVExiTG4jc6yRVCVnbNT/PwWhJ8Y8ISBmMHbZpm1VuNoUOwvlM+4EOpIgTMo1Oxf2mvaWtojI6X4ng385cQs=
X-Received: by 2002:a2e:8957:0:b0:261:d3c7:4d92 with SMTP id
 b23-20020a2e8957000000b00261d3c74d92mr1317963ljk.23.1663063552187; Tue, 13
 Sep 2022 03:05:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220907123810.GA27621@hcl-ThinkPad-T495> <Yx+zrEViePskgaWq@heinlein.stwcx.org.github.beta.tailscale.net>
In-Reply-To: <Yx+zrEViePskgaWq@heinlein.stwcx.org.github.beta.tailscale.net>
From: karthikeyan P <pkarthikeyan1509@gmail.com>
Date: Tue, 13 Sep 2022 15:35:37 +0530
Message-ID: <CA+ezb7h91jZ7g_p_vzQipW70=_dLrSLKz18xBXLTRddEPaO86w@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: yosemitev2: Enable i2c13 controller
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: multipart/alternative; boundary="0000000000004460d405e88c2885"
X-Mailman-Approved-At: Thu, 15 Sep 2022 11:04:43 +1000
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000004460d405e88c2885
Content-Type: text/plain; charset="UTF-8"

Yes, I agree.

On Tue, Sep 13, 2022 at 4:03 AM Patrick Williams <patrick@stwcx.xyz> wrote:

> On Wed, Sep 07, 2022 at 06:08:10PM +0530, Karthikeyan Pasupathi wrote:
> > Added IPMB-13 channel for Debug Card communication.
>
> Wouldn't this be better to be the title?  'enable OCP debug card'  Might
> need some reference to what an "OCP debug card" is in the commit
> message.
>
> >
> > ---
> > --- v2-Updated the title
> > ---
> >
> > ---
> > --- v1 - Initial draft.
> > ---
> >
> > Signed-off-by: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
> > ---
> >  arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
> b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
> > index 8864e9c312a8..84236df522dc 100644
> > --- a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
> > +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
> > @@ -215,6 +215,17 @@
> >       };
> >  };
> >
> > +&i2c13 {
> > +     status = "okay";
> > +     // Debug Card
> > +     multi-master;
> > +     ipmb13@10 {
> > +             compatible = "ipmb-dev";
> > +             reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> > +             i2c-protocol;
> > +     };
> > +};
> > +
> >  &pwm_tacho {
> >       status = "okay";
> >       //FSC
> > --
> > 2.17.1
> >
>
> --
> Patrick Williams
>

--0000000000004460d405e88c2885
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes, I agree. <br></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 13, 2022 at 4:03 AM Patrick =
Williams &lt;<a href=3D"mailto:patrick@stwcx.xyz">patrick@stwcx.xyz</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, =
Sep 07, 2022 at 06:08:10PM +0530, Karthikeyan Pasupathi wrote:<br>
&gt; Added IPMB-13 channel for Debug Card communication.<br>
<br>
Wouldn&#39;t this be better to be the title?=C2=A0 &#39;enable OCP debug ca=
rd&#39;=C2=A0 Might<br>
need some reference to what an &quot;OCP debug card&quot; is in the commit<=
br>
message.<br>
<br>
&gt; <br>
&gt; ---<br>
&gt; --- v2-Updated the title<br>
&gt; ---<br>
&gt; <br>
&gt; ---<br>
&gt; --- v1 - Initial draft.<br>
&gt; ---<br>
&gt; <br>
&gt; Signed-off-by: Karthikeyan Pasupathi &lt;<a href=3D"mailto:pkarthikeya=
n1509@gmail.com" target=3D"_blank">pkarthikeyan1509@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts | 11 ++++++=
+++++<br>
&gt;=C2=A0 1 file changed, 11 insertions(+)<br>
&gt; <br>
&gt; diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts b/ar=
ch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts<br>
&gt; index 8864e9c312a8..84236df522dc 100644<br>
&gt; --- a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts<br>
&gt; +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts<br>
&gt; @@ -215,6 +215,17 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; +&amp;i2c13 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0// Debug Card<br>
&gt; +=C2=A0 =C2=A0 =C2=A0multi-master;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ipmb13@10 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
ipmb-dev&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;(0x10 | I=
2C_OWN_SLAVE_ADDRESS)&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i2c-protocol;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +};<br>
&gt; +<br>
&gt;=C2=A0 &amp;pwm_tacho {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0//FSC<br>
&gt; -- <br>
&gt; 2.17.1<br>
&gt; <br>
<br>
-- <br>
Patrick Williams<br>
</blockquote></div>

--0000000000004460d405e88c2885--
