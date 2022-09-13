Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E6A5B91FB
	for <lists+openbmc@lfdr.de>; Thu, 15 Sep 2022 03:05:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSfBQ1hYXz3bXg
	for <lists+openbmc@lfdr.de>; Thu, 15 Sep 2022 11:05:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=apbvr37Q;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e29; helo=mail-vs1-xe29.google.com; envelope-from=pkarthikeyan1509@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=apbvr37Q;
	dkim-atps=neutral
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRfGf5Nfcz2xYy;
	Tue, 13 Sep 2022 20:05:12 +1000 (AEST)
Received: by mail-vs1-xe29.google.com with SMTP id 67so11831848vsv.2;
        Tue, 13 Sep 2022 03:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=H2GPXKvSx3sZyJASz8yHW4ewCUCpl9rAFhOHArq7AKk=;
        b=apbvr37QxWB5aTCX9oc852/gmiihE3p7KxM/8xYsCWh1nrI9KhB6Z0g3r+vskWbe3K
         5JTcQ+LhU4Lwzsc+DvmNWcKVlfBuYnTFfkGX74iclzo1oEBUXUtddRFZd+Lh/mYc8Mby
         1/JKFwUeTUVIox4UnVsOfY1ab4vUj+wmpGts1t3o2HhsUJaIxU1+lVo6qJbwmWDDhpOI
         5h2xxzbWvq0oRQb5ZPoFe6n5HEYsaEt0bd4IH9Vvt8vhcOTOAJrTbPl1nvX9HBgRcJMo
         9J2L2RFA8J5Z4mnkIgBI44LchNE4WC3tP4qAstFXuAqA3JrPhCSqcvpPwxvufU9mPzFu
         96iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=H2GPXKvSx3sZyJASz8yHW4ewCUCpl9rAFhOHArq7AKk=;
        b=3g3GoQ69YyJUaSUSgCcA/keESLicjD+e8aLK1/eiTB2dfm6zRSGRNc2ZSTm8f7c36D
         JxBOYJd+53qdMYgsyTL+qKGd1tSqtxIKDmxFiNod4delUg/2N7nbLXHd6+Hq2VhqxsuV
         DEIB4S2bn4OTqabykFYZ9rGp2LzVAwGDVKkXYqZruSl7u/JMGLXSEGPAJS7P5S4e3zVF
         EI98J3PLKtxQ48JrnYhSFRQT/tD/EmR+wVAQE1/HkGbRynmCDwzfl3/tE8d1NNrPxC9l
         JwdcZE9BSOIR5bDY0yo+3MsPF5tZP3dNrYzV1v4WeJRUHjoLpHahaT3IBa2ElUsZNeC9
         QZhA==
X-Gm-Message-State: ACgBeo2RLSxRBK9iSbGANSb9ODE/+rq8i284I0VLMW8tIUtowZFrdAy0
	Eig97iBNm975rYUdb0ZTHDbhv4jzAylfnDwm3Xo=
X-Google-Smtp-Source: AA6agR4oLhV6uYVniP7HPMf9G4ll61n9UNgRugIdm/xfeSVB1WcbXL0dAboBL3giGgZUjEJc7UDwoMXZ6aAI0pAUt/Y=
X-Received: by 2002:a67:af12:0:b0:398:1072:47af with SMTP id
 v18-20020a67af12000000b00398107247afmr8618254vsl.39.1663063508087; Tue, 13
 Sep 2022 03:05:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220907125035.GA28461@hcl-ThinkPad-T495> <Yx+zYP5qTuDrjP10@heinlein.stwcx.org.github.beta.tailscale.net>
In-Reply-To: <Yx+zYP5qTuDrjP10@heinlein.stwcx.org.github.beta.tailscale.net>
From: karthikeyan P <pkarthikeyan1509@gmail.com>
Date: Tue, 13 Sep 2022 15:34:55 +0530
Message-ID: <CA+ezb7iEFDPPv0MAv78U8j6wSy9AqExTTE=wK2rojm9Qyv4W9Q@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: yosemit V2: Update for Facebook
 Yosemite V2 BMC
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: multipart/alternative; boundary="000000000000a3795a05e88c2554"
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

--000000000000a3795a05e88c2554
Content-Type: text/plain; charset="UTF-8"

Done.

On Tue, Sep 13, 2022 at 4:02 AM Patrick Williams <patrick@stwcx.xyz> wrote:

> On Wed, Sep 07, 2022 at 06:20:35PM +0530, Karthikeyan Pasupathi wrote:
>
> Please improve the title and commit message here.  "Update" is
> insufficient for a title.  There is no description of _why_ in the commit
> message.
>
> > Removed NIC EEPROM driver IPMB-12 channel and keeping it as
> > "status ok".
> >
> > ---
> > --- v2- Updated the title
> > ---
> >
> > ---
> > --- v1- Initial draft
> > ---
> >
> > Signed-off-by: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
> > ---
> >  arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts | 6 ------
> >  1 file changed, 6 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
> b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
> > index 8864e9c312a8..2293f10e94d6 100644
> > --- a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
> > +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
> > @@ -207,12 +207,6 @@
> >
> >  &i2c12 {
> >       status = "okay";
> > -     //MEZZ_FRU
> > -     eeprom@51 {
> > -             compatible = "atmel,24c64";
> > -             reg = <0x51>;
> > -             pagesize = <32>;
> > -     };
> >  };
> >
> >  &pwm_tacho {
> > --
> > 2.17.1
> >
>
> --
> Patrick Williams
>

--000000000000a3795a05e88c2554
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Done. <br></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Tue, Sep 13, 2022 at 4:02 AM Patrick Williams=
 &lt;<a href=3D"mailto:patrick@stwcx.xyz">patrick@stwcx.xyz</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Sep 07, =
2022 at 06:20:35PM +0530, Karthikeyan Pasupathi wrote:<br>
<br>
Please improve the title and commit message here.=C2=A0 &quot;Update&quot; =
is<br>
insufficient for a title.=C2=A0 There is no description of _why_ in the com=
mit<br>
message.<br>
<br>
&gt; Removed NIC EEPROM driver IPMB-12 channel and keeping it as<br>
&gt; &quot;status ok&quot;.<br>
&gt; <br>
&gt; ---<br>
&gt; --- v2- Updated the title<br>
&gt; ---<br>
&gt; <br>
&gt; ---<br>
&gt; --- v1- Initial draft<br>
&gt; ---<br>
&gt; <br>
&gt; Signed-off-by: Karthikeyan Pasupathi &lt;<a href=3D"mailto:pkarthikeya=
n1509@gmail.com" target=3D"_blank">pkarthikeyan1509@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts | 6 ------<=
br>
&gt;=C2=A0 1 file changed, 6 deletions(-)<br>
&gt; <br>
&gt; diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts b/ar=
ch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts<br>
&gt; index 8864e9c312a8..2293f10e94d6 100644<br>
&gt; --- a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts<br>
&gt; +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts<br>
&gt; @@ -207,12 +207,6 @@<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 &amp;i2c12 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0//MEZZ_FRU<br>
&gt; -=C2=A0 =C2=A0 =C2=A0eeprom@51 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
atmel,24c64&quot;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x51&gt;;=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pagesize =3D &lt;32&g=
t;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0};<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 &amp;pwm_tacho {<br>
&gt; -- <br>
&gt; 2.17.1<br>
&gt; <br>
<br>
-- <br>
Patrick Williams<br>
</blockquote></div>

--000000000000a3795a05e88c2554--
