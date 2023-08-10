Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E537776FD
	for <lists+openbmc@lfdr.de>; Thu, 10 Aug 2023 13:29:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=k5m5pUl5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RM4Ss15Mfz3cGw
	for <lists+openbmc@lfdr.de>; Thu, 10 Aug 2023 21:29:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=k5m5pUl5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2b; helo=mail-yb1-xb2b.google.com; envelope-from=mimi05633@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RM4SD2qZgz2ygv
	for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2023 21:28:43 +1000 (AEST)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-d3522283441so721084276.0
        for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2023 04:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691666920; x=1692271720;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y1DYg6PGy8Q0xvZ7xpk9Hgx8P7TGBjLV71U70DOvftw=;
        b=k5m5pUl5GOhGN+w0S2rLA9s0B9EW67dReChYooboQUdgIB8RX/aIBmcSVRdkEYmcNl
         dozCMeHfjLQj4vUG3T5tvkIlbVT3t77/JVvtiXYbwoPnlC9lqD28/3j1NlEcDhzPmRJW
         chHF5yQ6k9wlthW0n5gjUwgpAMQ9IyWIIUSyU2QQ4afCrTIdKYcQqgaFaVf9vc6UFTOV
         5p+K18TJAeCxdOqHu34z9gpT3UT2jVuop8R2UzNk4S/WRrxEXF1dlxs89ryaJPkV5HAH
         mgXHlODeSgd9ZtQX8MROnNn6eedz6VfRj/VngvIm0qq+zn/5eWXlWoY+FI2c8gAhzrSK
         +8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691666920; x=1692271720;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1DYg6PGy8Q0xvZ7xpk9Hgx8P7TGBjLV71U70DOvftw=;
        b=PtVXQaahLmiBhB/W7AScWToXNaJgC+SEIXTFr5e2egT/S4zLbh7eMoxUQERjQgkJ37
         xfoVLvxqrXRygjgPIXdik7H7sg16B216AD9gIUinX/5VVXPsUeBbmkhzZ8DvDGj+1JeS
         TLqTUmsP7y2RkGjK3zCuOEwr/t7iyQfKX6StIzId2wEB1VgGDebkda6eUo/ICPDTmt8y
         NqJFbivjhj9dq8npErqV0/+19FPZvSHNEz5J6liAyknRFwCYbOUUjRHLCdIRceXyZ/5G
         clXqGvQ4IBf2eOiSMUna3cM/N6IHZADExBhCi/v/2dUj9Jm+GTbr/Zy7O0ZyPpNJOwZW
         rQgg==
X-Gm-Message-State: AOJu0YzTAqNeBHBT+4oGxroggpP5ruFg3wYxsgTgTDgTMhiLoUjABydT
	jvowpC82eI16w5+TWeyiOg39y3VApCNDvBSGDoM=
X-Google-Smtp-Source: AGHT+IE4wRFPIxx5CZ4KD1NfedYiuvrfnxSMMUjeXj5G2u4Qadexcf1u/3weF+TJ25xuVkoWeZJiKiyTCJxCzZnPDRI=
X-Received: by 2002:a25:cbcd:0:b0:c73:e6b5:c452 with SMTP id
 b196-20020a25cbcd000000b00c73e6b5c452mr2437073ybg.2.1691666920538; Thu, 10
 Aug 2023 04:28:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7000:ba01:b0:4f9:9bd0:392f with HTTP; Thu, 10 Aug 2023
 04:28:40 -0700 (PDT)
In-Reply-To: <202308091936514bb18c4e@mail.local>
References: <20230809095112.2836-1-mimi05633@gmail.com> <20230809095112.2836-3-mimi05633@gmail.com>
 <50bedd75-bcd6-d7bc-26c0-b8c00f99779a@linaro.org> <202308091936514bb18c4e@mail.local>
From: Minying Lin <mimi05633@gmail.com>
Date: Thu, 10 Aug 2023 19:28:40 +0800
Message-ID: <CAL3ZnpwESk2+SM19qz4dSrRR=isdEs2zMy4c48a434e1Be0QPQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] rtc: nuvoton: Compatible with NCT3015Y-R and NCT3018Y-R
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000e0859a06028fe58c"
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
Cc: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, "a.zummo@towertech.it" <a.zummo@towertech.it>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "benjaminfair@google.com" <benjaminfair@google.com>, "KWLIU@nuvoton.com" <KWLIU@nuvoton.com>, "avifishman70@gmail.com" <avifishman70@gmail.com>, "venture@google.com" <venture@google.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "JJLIU0@nuvoton.com" <JJLIU0@nuvoton.com>, "mylin1@nuvoton.com" <mylin1@nuvoton.com>, "tali.perry1@gmail.com" <tali.perry1@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "KFLIN@nuvoton.com" <KFLIN@nuvoton.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "tmaimon77@gmail.com" <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000e0859a06028fe58c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> Dear Alexandre and Krzysztof,


> Thank you for your comments.

I will remove the comparison between DT compatible and chip data.



> Best regards,

Mia


> Alexandre Belloni <alexandre.belloni@bootlin.com> =E6=96=BC 2023=E5=B9=B4=
8=E6=9C=8810=E6=97=A5 =E6=98=9F=E6=9C=9F=E5=9B=9B=E5=AF=AB=E9=81=93=EF=BC=
=9A

On 09/08/2023 16:29:33+0200, Krzysztof Kozlowski wrote:

> On 09/08/2023 11:51, Mia Lin wrote:

> > - flags =3D NCT3018Y_BIT_TWO;

> > - err =3D i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, flags);

> > - if (err < 0) {

> > - dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_CTRL\n");

> > - return err;

> > + flags =3D i2c_smbus_read_byte_data(client, NCT3018Y_REG_PART);

> > + if (flags < 0) {

> > + dev_dbg(&client->dev, "%s: read error\n", __func__);

> > + return flags;

> > + } else if (flags & NCT3018Y_REG_PART_NCT3018Y) {

> > + if (!(flags & data->part_number))

> > + dev_warn(&client->dev, "%s: part_num=3D0x%x but
> NCT3018Y_REG_PART=3D0x%x\n",

> > + __func__, data->part_number, flags);

> > + flags =3D NCT3018Y_BIT_HF;

> > + err =3D i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, flags);

> > + if (err < 0) {

> > + dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_CTRL\n");

> > + return err;

> > + }

> > + } else if (flags & NCT3018Y_REG_PART_NCT3015Y) {

> > + if (!(flags & data->part_number))

> > + dev_warn(&client->dev, "%s: part_num=3D0x%x but
> NCT3018Y_REG_PART=3D0x%x\n",

> > + __func__, data->part_number, flags);

>

> I don't think this is correct. Kernel's job is not to verify the DT...

> and why would it verify the device based on DT? You have here device

> detection so use it directly without this dance of comparing with

> compatible/match data.

>


> I fully agree here, either you trust your DT or the device ID but do not

use both.


>
> --

Alexandre Belloni, co-owner and COO, Bootlin

Embedded Linux and Kernel engineering

https://bootlin.com


>

--000000000000e0859a06028fe58c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Dear Alexandre and Krzysztof,</blockquote><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><br></blockquote><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">Thank you for your comments.</blockquote><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">I=
 will remove the comparison between DT compatible and chip data.</blockquot=
e><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">Best regards,</blockquote=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">Mia=C2=A0</blockquote><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex"><br></blockquote><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Alexandre Belloni=
 &lt;<a href=3D"mailto:alexandre.belloni@bootlin.com">alexandre.belloni@boo=
tlin.com</a>&gt; =E6=96=BC 2023=E5=B9=B48=E6=9C=8810=E6=97=A5 =E6=98=9F=E6=
=9C=9F=E5=9B=9B=E5=AF=AB=E9=81=93=EF=BC=9A</blockquote><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">On 09/08/2023 16:29:33+0200, Krzysztof Kozlowski wrote:</blockqu=
ote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">&gt; On 09/08/2023 11:51, Mia Lin wrote:=
</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">&gt; &gt; -   flags =3D NCT3018=
Y_BIT_TWO;</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">&gt; &gt; -   err =3D=
 i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, flags);</blockquote><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">&gt; &gt; -   if (err &lt; 0) {</blockquote><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">&gt; &gt; -           dev_dbg(&amp;client-&gt=
;dev, &quot;Unable to write NCT3018Y_REG_CTRL\n&quot;);</blockquote><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">&gt; &gt; -           return err;</blockquote><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">&gt; &gt; +   flags =3D i2c_smbus_read_byte_data(=
client, NCT3018Y_REG_PART);</blockquote><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">&gt;=
 &gt; +   if (flags &lt; 0) {</blockquote><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">&g=
t; &gt; +           dev_dbg(&amp;client-&gt;dev, &quot;%s: read error\n&quo=
t;, __func__);</blockquote><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">&gt; &gt; +      =
     return flags;</blockquote><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">&gt; &gt; +  =
 } else if (flags &amp; NCT3018Y_REG_PART_NCT3018Y) {</blockquote><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">&gt; &gt; +           if (!(flags &amp; data-&gt;part=
_number))</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">&gt; &gt; +           =
        dev_warn(&amp;client-&gt;dev, &quot;%s: part_num=3D0x%x but NCT3018=
Y_REG_PART=3D0x%x\n&quot;,</blockquote><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">&gt; =
&gt; +                            __func__, data-&gt;part_number, flags);</=
blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">&gt; &gt; +           flags =3D N=
CT3018Y_BIT_HF;</blockquote><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">&gt; &gt; +     =
      err =3D i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, flags);<=
/blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">&gt; &gt; +           if (err &l=
t; 0) {</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">&gt; &gt; +             =
      dev_dbg(&amp;client-&gt;dev, &quot;Unable to write NCT3018Y_REG_CTRL\=
n&quot;);</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">&gt; &gt; +           =
        return err;</blockquote><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">&gt; &gt; + =
          }</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">&gt; &gt; +   } else=
 if (flags &amp; NCT3018Y_REG_PART_NCT3015Y) {</blockquote><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">&gt; &gt; +           if (!(flags &amp; data-&gt;part_number=
))</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">&gt; &gt; +                  =
 dev_warn(&amp;client-&gt;dev, &quot;%s: part_num=3D0x%x but NCT3018Y_REG_P=
ART=3D0x%x\n&quot;,</blockquote><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">&gt; &gt; + =
                           __func__, data-&gt;part_number, flags);</blockqu=
ote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">&gt;</blockquote><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">&gt; I don&#39;t think this is correct. Kernel&#39;s job is not to =
verify the DT...</blockquote><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">&gt; and why wo=
uld it verify the device based on DT? You have here device</blockquote><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">&gt; detection so use it directly without this d=
ance of comparing with</blockquote><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">&gt; com=
patible/match data.</blockquote><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">&gt;</blockq=
uote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><br></blockquote><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">I fully agree here, either you trust your DT or the device ID but =
do not</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">use both.</blockquote><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><br></blockquote><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">--</blockquote><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">Alexandre Belloni, co-owner and COO, Bootlin</blockquot=
e><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">Embedded Linux and Kernel engineering</blo=
ckquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><a href=3D"https://bootlin.com">http=
s://bootlin.com</a></blockquote><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br></blockq=
uote>

--000000000000e0859a06028fe58c--
