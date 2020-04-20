Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FD21B14B0
	for <lists+openbmc@lfdr.de>; Mon, 20 Apr 2020 20:36:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495b4j1YPXzDqty
	for <lists+openbmc@lfdr.de>; Tue, 21 Apr 2020 04:36:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::22b;
 helo=mail-lj1-x22b.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=l9FoDrn/; dkim-atps=neutral
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495b3L2S9ZzDqbt
 for <openbmc@lists.ozlabs.org>; Tue, 21 Apr 2020 04:35:08 +1000 (AEST)
Received: by mail-lj1-x22b.google.com with SMTP id e25so11179309ljg.5
 for <openbmc@lists.ozlabs.org>; Mon, 20 Apr 2020 11:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jJu9I959bxM9+ee3LI+R7pWZ7tVpKKVyggufnleNOn4=;
 b=l9FoDrn/SspTdyxAsmXXTmV+o836eree9qlywwMmD/PHii0YViyI/pqrVvRTHLw8u7
 FTP2decpa9jSs+G6OUBATRmpdVRIPlmqMhCNvdaLI1HsTN7gsP+9p+r4wlhOXk5Pro2y
 zVOf1n9CW/JO6ua3QnktrM5nTqXcf7cgxpXTr2k9DecvRDCXGSHPow4KbWiAATECGwxg
 AAP/zStxOVvAyMHOLW+/QF+D6F1Or4N1H+mNZMDYsTcjzJQlcGGCM/+8YJMwi4477SfH
 Xxq21jX5aiBH4C/C1ZOD78m77RFi8RZw1YmjE6tCULP+c9OpC4SQ7ISmbBPijKogOvMe
 +LmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jJu9I959bxM9+ee3LI+R7pWZ7tVpKKVyggufnleNOn4=;
 b=qHl9azk+HC/wszI/NJfWTTQ2nOS5nzqENdQSrtCFuK4vScS99FVJV1xWgAXeqFtJuI
 c32ek5rsuRuUZwyl+761ZrS9LUpokNOqvYlFgy1VAJT4d1e9eVsU5AatnSrSDWUK1ghD
 n8AQIYADjNHfTRtNAqiP4lw/jeDQak8K8t2aM42KE1A6PW6FuUBhEV67nyM2+zDmn32I
 H6pKKim44YW7+vN4QKNBHPr88XZaynwyZwMvFQmClEUFqTeK3YUJEgy3kh/eX+mpGhwQ
 piLnaQwBJwgoYOhi2LVrEzCymTdTxrAdCmX9vubvw5HloWB8DwbAi/TgJVEBjp4q+JZC
 7jBg==
X-Gm-Message-State: AGi0PubF+3vUkJyyWdYTanemqUC/0vwVwAqzNGJajn+YumUfwJAdvv4r
 RWC8ItLOEupSGLFpJbPhnpW4nlViANkaupJvzMFmuw==
X-Google-Smtp-Source: APiQypJ2sO+vNSrFuneUQEmlHsvFqS201XUlmBxJH2Wx+b9mU6e278MMWEhe4ugB8WqR8Ltg/UnXECPRqXL+03V5tK8=
X-Received: by 2002:a2e:909a:: with SMTP id l26mr10681102ljg.262.1587407704071; 
 Mon, 20 Apr 2020 11:35:04 -0700 (PDT)
MIME-Version: 1.0
References: <CABoTLcSOQYY+gk=7Q2w6Ny02L15yM19vTPmJxDfZVst6FV5r+Q@mail.gmail.com>
 <70D0A47B-9C5B-418C-BC1F-7379493C60AA@fb.com>
In-Reply-To: <70D0A47B-9C5B-418C-BC1F-7379493C60AA@fb.com>
From: Oskar Senft <osk@google.com>
Date: Mon, 20 Apr 2020 14:34:47 -0400
Message-ID: <CABoTLcTa-7Fnu9rodg9PrbeZ9wYM7vYPHZK2meEZLx2XW+ZE1Q@mail.gmail.com>
Subject: Re: Access Intel ME IPMB from BMC
To: Vijay Khemka <vijaykhemka@fb.com>
Content-Type: multipart/alternative; boundary="000000000000511a8705a3bd28e4"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000511a8705a3bd28e4
Content-Type: text/plain; charset="UTF-8"

Hi Vijay

Thanks for the pointer!

I also found both https://github.com/Mellanox/ipmb-host and
https://github.com/openbmc/linux/blob/dev-5.4/drivers/char/ipmi/ipmb_dev_int.c
.

Is it right that with ipmbbridge I don't need either of them since
ipmbbridge uses the raw i2c dev?

Thanks
Oskar.

On Mon, Apr 20, 2020 at 2:12 PM Vijay Khemka <vijaykhemka@fb.com> wrote:

> Hi Oskar,
>
> You need to configure your ME channel in ipmb channel config file
> https://github.com/openbmc/ipmbbridge/blob/master/ipmb-channels.json
>
> And make sure ipmbbridge is running. Then you can send get device id
> command to ME from command line itself to test if everything is working.
>
>
>
> busctl call xyz.openbmc_project.Ipmi.Channel.Ipmb
> /xyz/openbmc_project/Ipmi/Channel/Ipmb org.openbmc.Ipmb sendRequest yyyyay
> 1 6 0 0x1 0
>
>
>
> Regards
>
> -Vijay
>
>
>
> *From: *openbmc <openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org> on
> behalf of Oskar Senft <osk@google.com>
> *Date: *Saturday, April 18, 2020 at 6:47 PM
> *To: *OpenBMC Maillist <openbmc@lists.ozlabs.org>
> *Subject: *Access Intel ME IPMB from BMC
>
>
>
> Hi everyone
>
>
>
> I'm trying to find out how I can access the Intel ME via IPMB from the BMC
> (OpenBMC).
>
>
>
> From what I gathered, Intel ME's IPMB is on the PCH's SMLink0. I know this
> is connected to one of the SMBus modules on my AST2500. But what I can't
> find out is how I actually send commands there? I'm sure I'm missing a
> document that makes this obvious.
>
>
>
> Or is it as simple as dropping IPMI packets onto the bus?
>
>
>
> Is this by any chance already implemented in OpenBMC?
>
>
>
> Thanks for any hints!
>
>
>
> Oskar
>

--000000000000511a8705a3bd28e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Vijay<div><br></div><div>Thanks for the pointer!</div><=
div><br></div><div>I also found both=C2=A0<a href=3D"https://github.com/Mel=
lanox/ipmb-host">https://github.com/Mellanox/ipmb-host</a>=C2=A0and=C2=A0<a=
 href=3D"https://github.com/openbmc/linux/blob/dev-5.4/drivers/char/ipmi/ip=
mb_dev_int.c">https://github.com/openbmc/linux/blob/dev-5.4/drivers/char/ip=
mi/ipmb_dev_int.c</a>.=C2=A0</div><div><br></div><div>Is it right that with=
=C2=A0ipmbbridge=C2=A0I don&#39;t need either of them since ipmbbridge=C2=
=A0uses the raw i2c dev?</div><div><br></div><div>Thanks</div><div>Oskar.</=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Mon, Apr 20, 2020 at 2:12 PM Vijay Khemka &lt;<a href=3D"mailto:vija=
ykhemka@fb.com">vijaykhemka@fb.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">





<div lang=3D"EN-US">
<div class=3D"gmail-m_288753816669491221WordSection1">
<p class=3D"MsoNormal">Hi Oskar,<u></u><u></u></p>
<p class=3D"MsoNormal">You need to configure your ME channel in ipmb channe=
l config file
<a href=3D"https://github.com/openbmc/ipmbbridge/blob/master/ipmb-channels.=
json" target=3D"_blank">https://github.com/openbmc/ipmbbridge/blob/master/i=
pmb-channels.json</a><u></u><u></u></p>
<p class=3D"MsoNormal">And make sure ipmbbridge is running. Then you can se=
nd get device id command to ME from command line itself to test if everythi=
ng is working.<u></u><u></u></p>
<p class=3D"gmail-m_288753816669491221p1"><span class=3D"gmail-m_2887538166=
69491221s1"><u></u>=C2=A0<u></u></span></p>
<p class=3D"gmail-m_288753816669491221p1"><span class=3D"gmail-m_2887538166=
69491221s1">busctl call xyz.openbmc_project.Ipmi.Channel.Ipmb /xyz/openbmc_=
project/Ipmi/Channel/Ipmb org.openbmc.Ipmb sendRequest yyyyay 1 6 0 0x1 0</=
span><u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Regards<u></u><u></u></p>
<p class=3D"MsoNormal">-Vijay<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(181,196,223);padding:3pt 0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:12pt;color:black">From: =
</span></b><span style=3D"font-size:12pt;color:black">openbmc &lt;openbmc-b=
ounces+vijaykhemka=3D<a href=3D"mailto:fb.com@lists.ozlabs.org" target=3D"_=
blank">fb.com@lists.ozlabs.org</a>&gt; on behalf of Oskar Senft &lt;<a href=
=3D"mailto:osk@google.com" target=3D"_blank">osk@google.com</a>&gt;<br>
<b>Date: </b>Saturday, April 18, 2020 at 6:47 PM<br>
<b>To: </b>OpenBMC Maillist &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org"=
 target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;<br>
<b>Subject: </b>Access Intel ME IPMB from BMC<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Hi everyone <u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I&#39;m trying to find out how I can access the Inte=
l ME via IPMB from the BMC (OpenBMC).<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">From what I gathered, Intel ME&#39;s IPMB is on the =
PCH&#39;s SMLink0. I know this is connected to one of the SMBus modules on =
my AST2500. But what I can&#39;t find out is how I actually send commands t=
here? I&#39;m sure I&#39;m missing a document that makes
 this obvious.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Or is it as simple as=C2=A0dropping IPMI packets ont=
o the bus?<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Is this by any chance already implemented in OpenBMC=
?<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks for any hints!<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Oskar<u></u><u></u></p>
</div>
</div>
</div>
</div>

</blockquote></div>

--000000000000511a8705a3bd28e4--
