Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5325EB5B6
	for <lists+openbmc@lfdr.de>; Tue, 27 Sep 2022 01:25:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbzPp3qjHz3bhf
	for <lists+openbmc@lfdr.de>; Tue, 27 Sep 2022 09:25:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PIIZ/5l3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e2e; helo=mail-vs1-xe2e.google.com; envelope-from=pkarthikeyan1509@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PIIZ/5l3;
	dkim-atps=neutral
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mbgqz340zz30Qc;
	Mon, 26 Sep 2022 21:43:25 +1000 (AEST)
Received: by mail-vs1-xe2e.google.com with SMTP id o123so6266758vsc.3;
        Mon, 26 Sep 2022 04:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Kw78LNme14rxWKVFWkFL2ixkeM+00fh0d6NKIFra9dw=;
        b=PIIZ/5l3H9ElFIxAIpQYGOmHzstAKDF/TnJ9CVQlkhKEAOQ8JIQJVp4w6m4BkkdLzr
         2RG4hpKUfs+d+gXxrAXnaqJcGOR7YW84+w2LmS/18TGezmk4f9CMmmjX8BHVCsglAyh0
         f6BHtu6pFWG7Miiqjrr0kJrte21LrBVi3q6UGNgqV1vtp3DvD5cXJEAV22QwyAAiLj+3
         fBdWMUWRVI1MXKrKnNopnANMNs6WuQDcaL3+B3njT96/43EHjUrvdj3B4ptTF8QvuWuS
         fiBXe87fLKBAK+8+MUpzRvJHod08AvjFuRP3E6JRu78/8QlIT13lnsCutCVIHjFkm3Xw
         cn1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Kw78LNme14rxWKVFWkFL2ixkeM+00fh0d6NKIFra9dw=;
        b=LBYRPSaHYg4IcRWfrHyyXDV0BLKVo6AAXMmZ07foSG0Qq/qTNsUQ7m2sfozjr8C1BG
         HzyahBgz2aEiNo7ruFWuWCe7Q3bs+qJ+tlKcgY+2dAm+7ygXk1Gr+RgVSsfuEYML/Frf
         cNO+fxKukmfnBz732njtEv8KUz8bpd9Mnn8H8wrevNNiNp4A2gssYKpipOjCMMAvEya7
         8oDPrtcBas9osZkjV0DcYgOlNT4uQ6p67JuPNYu1H09t+jwuXYni1IlyTjiXKrVgWJ4r
         /o0Ug3TSuDUYSZOLL8U4Ublv06Y6g/IQK4kUtp5DpVrh3q86eYIWLeNkfkEIYRR1zkD4
         UpGA==
X-Gm-Message-State: ACrzQf3muVT3AWIaiprtW9TEncRXt8ZFjda0ZmImv9oDIFLvN8ZMXcaB
	G8jklm56fzCeCvJWyE1LaNuZdMsEhxnNOz/W6rs=
X-Google-Smtp-Source: AMsMyM4tL0TNih0vcohWp/VxPGvn1F8gpvUdKEG3mpg9yUYX9DaJvA0hm7z7euQ33QGLJdWujitU/u35Kb7o+YmWW7A=
X-Received: by 2002:a05:6102:31b6:b0:398:5151:6eb6 with SMTP id
 d22-20020a05610231b600b0039851516eb6mr7306928vsh.87.1664192601688; Mon, 26
 Sep 2022 04:43:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220921064309.GA18932@hcl-ThinkPad-T495> <Yy4qofFUIxudLxbS@heinlein>
In-Reply-To: <Yy4qofFUIxudLxbS@heinlein>
From: karthikeyan P <pkarthikeyan1509@gmail.com>
Date: Mon, 26 Sep 2022 17:13:09 +0530
Message-ID: <CA+ezb7jrp3Fo0gGvXib4MgivWSx7V23Wjc-4EJJ2EQXscmYDRg@mail.gmail.com>
Subject: Re: [PATCH v4] ARM: dts: aspeed: yosemit V2: Enable OCP debug card
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: multipart/alternative; boundary="000000000000dc8e1105e99308bf"
X-Mailman-Approved-At: Tue, 27 Sep 2022 09:22:21 +1000
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
Cc: devicetree@vger.kernel.org, kernel test robot <lkp@intel.com>, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000dc8e1105e99308bf
Content-Type: text/plain; charset="UTF-8"

Will do, thanks!

On Sat, Sep 24, 2022 at 3:22 AM Patrick Williams <patrick@stwcx.xyz> wrote:

>
> > Subject: [PATCH v4] ARM: dts: aspeed: yosemit V2: Enable OCP debug card
>
> Please double-check your spelling of commit messages.  You've misspelled
> "yosemite" here, which gives an impression that it is quite likely that
> other things are wrong with your commit.
>
> On Wed, Sep 21, 2022 at 12:13:09PM +0530, Karthikeyan Pasupathi wrote:
> > Added IPMB-13 channel for Debug Card communication.
> > which improve the readability of the machine and makes
> > easier to debug the server.  and it will display the some
> > informations about the server like "system info",
> > "Critical sensors" and "critical sel".
> >
> > ---
> > --- v4- Resolved syntax error
> > --- v3- Updated the title and commit
> > --- v2- Updated the title
> > --- v1- Initial draft
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
> Reviewed-by: Patrick Williams <patrick@stwcx.xyz>
>
> --
> Patrick Williams
>

--000000000000dc8e1105e99308bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Will do, thanks! <br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Sep 24, 2022 at 3:22 AM Patri=
ck Williams &lt;<a href=3D"mailto:patrick@stwcx.xyz">patrick@stwcx.xyz</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
&gt; Subject: [PATCH v4] ARM: dts: aspeed: yosemit V2: Enable OCP debug car=
d<br>
<br>
Please double-check your spelling of commit messages.=C2=A0 You&#39;ve miss=
pelled<br>
&quot;yosemite&quot; here, which gives an impression that it is quite likel=
y that<br>
other things are wrong with your commit.<br>
<br>
On Wed, Sep 21, 2022 at 12:13:09PM +0530, Karthikeyan Pasupathi wrote:<br>
&gt; Added IPMB-13 channel for Debug Card communication.<br>
&gt; which improve the readability of the machine and makes<br>
&gt; easier to debug the server.=C2=A0 and it will display the some<br>
&gt; informations about the server like &quot;system info&quot;,<br>
&gt; &quot;Critical sensors&quot; and &quot;critical sel&quot;.<br>
&gt; <br>
&gt; ---<br>
&gt; --- v4- Resolved syntax error<br>
&gt; --- v3- Updated the title and commit<br>
&gt; --- v2- Updated the title<br>
&gt; --- v1- Initial draft<br>
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
Reviewed-by: Patrick Williams &lt;<a href=3D"mailto:patrick@stwcx.xyz" targ=
et=3D"_blank">patrick@stwcx.xyz</a>&gt;<br>
<br>
-- <br>
Patrick Williams<br>
</blockquote></div>

--000000000000dc8e1105e99308bf--
