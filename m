Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 607605B5A58
	for <lists+openbmc@lfdr.de>; Mon, 12 Sep 2022 14:44:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MR5sF746pz30DP
	for <lists+openbmc@lfdr.de>; Mon, 12 Sep 2022 22:44:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QzGJ4K2u;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a36; helo=mail-vk1-xa36.google.com; envelope-from=pkarthikeyan1509@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QzGJ4K2u;
	dkim-atps=neutral
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com [IPv6:2607:f8b0:4864:20::a36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMHBp1QYtz2xD3;
	Tue,  6 Sep 2022 17:31:44 +1000 (AEST)
Received: by mail-vk1-xa36.google.com with SMTP id s11so904928vkb.5;
        Tue, 06 Sep 2022 00:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=v8jjPnQbyQhdmUR0CkT9JoQA+mxLTEDlQbLuNU3+6c8=;
        b=QzGJ4K2ud0goqEVb8quHuKLgWdOTP0uxW7ygcirJMQtA5k1idxR3v/8Te8j6V1xGNz
         A2bq6vGjjScXthDNt8OfOQSgwkgeveOIaJYI0K45xDsvMvk9Tt3nGmeqkupNUG8vj256
         5YsfAwt9XzGtn7RdqhnPoICwkka9V/ZdNmdQTjADBs03c0ogtjDAUXhx8oltjYSmCXlB
         jHzkV2f2h8TP+Cbzr0yz19d3NnCQ+0N2StTNzS7BF7ozefHWJ7vPUqiNiUg0qfaEQj34
         bnpV41fWYB8YgRJIV4OeiVDOJsloSEa5bVtbtYMJLCC/PpdLEVgMs674no9DrbUV1+cX
         A1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=v8jjPnQbyQhdmUR0CkT9JoQA+mxLTEDlQbLuNU3+6c8=;
        b=uygNe0W9bAnsyknIahZaYa3PfGNQYfsRjTvCv0MqOmBtxHfcd5pN8m1WFB1tkI/JwU
         C1kWLWJPLejy490AZKAavBEQImtuIAT2WBf/mDDBsB03AES35o6dEi3ffOy3pkV8SMNs
         VigER9HrKMsBy0/IQDSBiPKzxrUJ+0KYiZuUVqoioZX82+tt4HhN2slVAINAv0Mj+iSO
         G45CsAheHtBh/XdYhWomwHn6vFOYfobS4b4trzWredKm7JxrNBcgzkoZDyXug7MssuZ4
         QbWh1Gk8mDyfAxfaNrgz/SNlg9X2OzrukTx/TAoKyBXeQ3xQopYl1ZUyp/4SLCfhlGIy
         CudQ==
X-Gm-Message-State: ACgBeo0gTeL04Oj4vR8aRwrLsK14DSzqu9b070mJQbYdfRo5M2quXWO5
	nppEfaywCcAzCrbAX6gm/FqGaNJ99kpZYaqTRVM=
X-Google-Smtp-Source: AA6agR6a16gEwVM4J3Vll7qXITKtRkUS8hjt8L/dHfUHtjOuoJ/nFQEu7XU3cpZuYKckCs4VswCfeZDNL8xIxYbxDYY=
X-Received: by 2002:a1f:d7c5:0:b0:38b:77e8:8efa with SMTP id
 o188-20020a1fd7c5000000b0038b77e88efamr14660577vkg.7.1662449500526; Tue, 06
 Sep 2022 00:31:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220906050702.GA10565@hcl-ThinkPad-T495> <YxboXspF+0Y/+spD@taoren-fedora-PC23YAB4>
In-Reply-To: <YxboXspF+0Y/+spD@taoren-fedora-PC23YAB4>
From: karthikeyan P <pkarthikeyan1509@gmail.com>
Date: Tue, 6 Sep 2022 13:01:28 +0530
Message-ID: <CA+ezb7hdon3duH_oOLdGJGv_6HxCqa=HB6Tu0stbSuj2tMaSeQ@mail.gmail.com>
Subject: Re: [PATCH v1] Update for Facebook yosemite V2 BMC.
To: Tao Ren <rentao.bupt@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000ef9c6805e7fd2f38"
X-Mailman-Approved-At: Mon, 12 Sep 2022 22:41:37 +1000
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

--000000000000ef9c6805e7fd2f38
Content-Type: text/plain; charset="UTF-8"

Noted.

On Tue, Sep 6, 2022 at 11:57 AM Tao Ren <rentao.bupt@gmail.com> wrote:

> Hi Karthikeyan,
>
> I don't have much experience with ipmb-dev, but I'd suggest updating the
> patch tile so it's consistent with other dts patches. For example:
>
> "ARM: dts: aspeed: yosemitev2: Enable i2c13 controller"
>
>
> Cheers,
>
> - Tao
>
> On Tue, Sep 06, 2022 at 10:37:02AM +0530, Karthikeyan Pasupathi wrote:
> > Added IPMB-13 channel for Debug Card communication.
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

--000000000000ef9c6805e7fd2f38
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Noted. <br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Sep 6, 2022 at 11:57 AM Tao Ren &lt;<=
a href=3D"mailto:rentao.bupt@gmail.com">rentao.bupt@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Karthikeyan=
,<br>
<br>
I don&#39;t have much experience with ipmb-dev, but I&#39;d suggest updatin=
g the<br>
patch tile so it&#39;s consistent with other dts patches. For example:<br>
<br>
&quot;ARM: dts: aspeed: yosemitev2: Enable i2c13 controller&quot;<br>
<br>
<br>
Cheers,<br>
<br>
- Tao<br>
<br>
On Tue, Sep 06, 2022 at 10:37:02AM +0530, Karthikeyan Pasupathi wrote:<br>
&gt; Added IPMB-13 channel for Debug Card communication.<br>
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
</blockquote></div>

--000000000000ef9c6805e7fd2f38--
