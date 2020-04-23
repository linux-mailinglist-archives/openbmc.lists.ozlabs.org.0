Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F0D1B65C4
	for <lists+openbmc@lfdr.de>; Thu, 23 Apr 2020 22:51:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497Tx30Dx2zDr6Y
	for <lists+openbmc@lfdr.de>; Fri, 24 Apr 2020 06:51:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::130;
 helo=mail-lf1-x130.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=JoT7zdf5; dkim-atps=neutral
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497Tw13jGXzDqwb
 for <openbmc@lists.ozlabs.org>; Fri, 24 Apr 2020 06:50:22 +1000 (AEST)
Received: by mail-lf1-x130.google.com with SMTP id r17so5901795lff.2
 for <openbmc@lists.ozlabs.org>; Thu, 23 Apr 2020 13:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pe2b454arj3LMndIMWIAHTxrBZq+uJVCQgo43OPbJSI=;
 b=JoT7zdf5B934msVdDYg4X+GOacddGKdz6Vh2beZZDVKJgROw7pZcRVO+qjoOMQiquv
 GPgRkdKLPt4J/klx07HySZWUMqLHiLAZA9bhGjJju0U3wlwXwidwOmwe6yjvWaLXN6f2
 WQsFjzBtlpMba4hZG9zcyQVjyCdtaO5HoJOX8I3/DrOgV2ymKZNHNliC/vaiWJhizNcr
 3k60IJw93UsW8PrAAcef7NJDePZlmg9CDX/oGBS3iVN0w2l9MMmqFpsrZCXFbPdz8Z8J
 grqCJvYf6Kaqnkcj9+mz7GMxI2/X5+7C7UMZahouOnvbRtO/ZqUgO9j7ebD7yiXED9mb
 /QgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pe2b454arj3LMndIMWIAHTxrBZq+uJVCQgo43OPbJSI=;
 b=ujeKqekh7j4PLtUqam4b69a9Gbtib7Artq1Th83X7lRbr9uEGKloB/MrhrW4veTIgj
 gXqv1fzx4368URrqzU7fiQjJWFKJnLl/0hvfERW4J7D5sqetTZG2HYE7vlKq2Rj9AP9u
 Idu9sIDRVhSEJ6GSmDMottIolFWQ70xpPywMCUv5J7HygkyspGHClOfmqTa65f1GUEcD
 TfuCqBfD54FhJ928OKww7ktEUDSmmN5YqULiUu0dKIzS7ku00F0L15V+JqU+ezctJey0
 AxCkWQ+86OkAdRXBCwgWBRcsqSDLE0rtpIuNX+Yj+mck/lnfg7k8z2+IEqmxK/i5mNKL
 VUQw==
X-Gm-Message-State: AGi0Pubreviv4jeeOYFVJAr2Q2UUL7y43zMW+N44sDN9LsKgOyWa9FRB
 SrTv2dDJsT/OZFwVuL2CE8RSDdeedIIaJU38NtCP0g==
X-Google-Smtp-Source: APiQypK42N2Qo3PRz/Xi/MwE/ziBYEujDSH4jY/ENGPd1wC514Zzt+hQuyxLdy0RM/b6s38NwNHTeHWa7wdvGdClGZs=
X-Received: by 2002:a05:6512:108a:: with SMTP id
 j10mr3642126lfg.38.1587675018794; 
 Thu, 23 Apr 2020 13:50:18 -0700 (PDT)
MIME-Version: 1.0
References: <CABoTLcSOQYY+gk=7Q2w6Ny02L15yM19vTPmJxDfZVst6FV5r+Q@mail.gmail.com>
 <70D0A47B-9C5B-418C-BC1F-7379493C60AA@fb.com>
 <CABoTLcTa-7Fnu9rodg9PrbeZ9wYM7vYPHZK2meEZLx2XW+ZE1Q@mail.gmail.com>
 <B3FB3174-1794-4A57-B850-61F0D8200339@fb.com>
 <CABoTLcStCvQ2fAVudN6q7bexNjuT1_NcEFwjMOR0yePWZ+d=Dg@mail.gmail.com>
 <CABoTLcSriF37EgG9dtwZGfPm-arBG66hsnn380nxYXP4cY1W4w@mail.gmail.com>
 <403834AD-B194-44E8-8904-21610A30D727@fb.com>
In-Reply-To: <403834AD-B194-44E8-8904-21610A30D727@fb.com>
From: Oskar Senft <osk@google.com>
Date: Thu, 23 Apr 2020 16:50:02 -0400
Message-ID: <CABoTLcQNXYh1DBJArBrOV=pLnTcivT+T3WjrXSidh8PFhf15wA@mail.gmail.com>
Subject: Re: Access Intel ME IPMB from BMC
To: Vijay Khemka <vijaykhemka@fb.com>, johnathanx.mantey@intel.com
Content-Type: multipart/alternative; boundary="00000000000084055a05a3fb6590"
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

--00000000000084055a05a3fb6590
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the explanation. I could test what I needed to test on an Intel
C620 based platform.

Specifically I'm trying to run a board in eSPI + SAFS mode. SAFS is "Slave
Attached Flash Sharing" where the PCH loads all of its firmware (ME, GbE,
BIOS etc) via eSPI, e.g. from a BMC. See Intel document 329957 ("Enhanced
Serial Peripheral Interface (eSPI) - Addendum for Server Platforms") from
https://downloadcenter.intel.com/download/27055/eSPI for reference.
However, even though the PCH (C620 series) reads quite a lot of data via
SAFS, the ME doesn't release the CPU and the host wouldn't turn on. I had
hoped that this is just the result of not having FDRV (aka. FD0V) enabled
in the PCH. In that case the ME should have responded to IPMB and reported
such. But the ME doesn't respond at all on i2c in SAFS mode (checked via
logic analyzer), so I'm at a loss of what's wrong with it. In MAFS mode
(i.e. when using SPI flash for  the PCH), the IPMB works as expected, so I
know my setup is correct and it's actually the ME being unhappy in SAFS
mode. I tried with ME in both "operational" and "recovery" mode. I do see
different behavior in that the ME in "recovery" mode completely rewrites
the MFS section, so "something" must actually be running in the ME. I guess
the only other thing I haven't tried is to compare SAFS operations with SPI
operations (MAFS) to see what else it would be doing on SPI.

Oskar.

On Thu, Apr 23, 2020 at 2:59 PM Vijay Khemka <vijaykhemka@fb.com> wrote:

> As i2c slave mqueue driver is not upstreamed and with already having same
> functionality in ipmb-dev driver which is already in uostream kernel, I
> don=E2=80=99t see any reason to use i2c slave mqueue driver. I highly inc=
ourage
> people to use ipmb-dev driver with latest ipmbbridge. If there are any
> issues, please let us know.
>
>
>
> Regards
>
> -Vijay
>
>
>
> *From: *Oskar Senft <osk@google.com>
> *Date: *Thursday, April 23, 2020 at 8:34 AM
> *To: *Vijay Khemka <vijaykhemka@fb.com>
> *Cc: *OpenBMC Maillist <openbmc@lists.ozlabs.org>
> *Subject: *Re: Access Intel ME IPMB from BMC
>
>
>
> On a side note regarding the ipmb-dev driver: It seems that the
> Documentation/IPMB.txt has gotten "lost". The only version I could find i=
s
> this:
> https://github.com/openbmc/linux/blob/51bd6f291583684f495ea498984dfc22049=
d7fd2/Documentation/IPMB.txt.
> But it's not in any of the recent branches (dev-5.3 or dev-5.4).
>
>
>
> Should this file be resurrected?
>
>
>
> Oskar.
>
>
>
> On Thu, Apr 23, 2020 at 11:31 AM Oskar Senft <osk@google.com> wrote:
>
> Thanks again!
>
>
>
> ipmbbridge solved my problem. I found that my version of OpenBMC (incl.
> kernel) used a slightly older version of ipmbbridge which still used the
> i2c slave mqueue, which worked fine. Reading a bit of source code made it
> clear how it worked. The key is to configure ipbm-channels.json with the
> correct i2c device and the rest "just works".
>
>
>
> For the benefit of others: My understanding is that the current version o=
f
> ipmbbridge no longer uses the i2c slave mqueue but requires the ipmb-dev
> driver in the kernel. It's not necessary to actually attach the driver to
> an i2c device as that can happen at runtime.
>
>
>
> Oskar.
>
>
>
>
>
> On Mon, Apr 20, 2020 at 4:34 PM Vijay Khemka <vijaykhemka@fb.com> wrote:
>
> Hi Oskar,
>
> You need to use ipmb-dev driver which is is being used by ipmbbridge. You
> don=E2=80=99t need ipmb-host as we are having ipmbbridge to replace that.
>
>
>
> Regards
>
> -Vijay
>
>
>
> *From: *Oskar Senft <osk@google.com>
> *Date: *Monday, April 20, 2020 at 11:35 AM
> *To: *Vijay Khemka <vijaykhemka@fb.com>
> *Cc: *OpenBMC Maillist <openbmc@lists.ozlabs.org>
> *Subject: *Re: Access Intel ME IPMB from BMC
>
>
>
> Hi Vijay
>
>
>
> Thanks for the pointer!
>
>
>
> I also found both https://github.com/Mellanox/ipmb-host and
> https://github.com/openbmc/linux/blob/dev-5.4/drivers/char/ipmi/ipmb_dev_=
int.c
> .
>
>
>
> Is it right that with ipmbbridge I don't need either of them since
> ipmbbridge uses the raw i2c dev?
>
>
>
> Thanks
>
> Oskar.
>
>
>
> On Mon, Apr 20, 2020 at 2:12 PM Vijay Khemka <vijaykhemka@fb.com> wrote:
>
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
> /xyz/openbmc_project/Ipmi/Channel/Ipmb org.openbmc.Ipmb sendRequest yyyya=
y
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
> *From: *openbmc <openbmc-bounces+vijaykhemka=3Dfb.com@lists.ozlabs.org> o=
n
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
> I'm trying to find out how I can access the Intel ME via IPMB from the BM=
C
> (OpenBMC).
>
>
>
> From what I gathered, Intel ME's IPMB is on the PCH's SMLink0. I know thi=
s
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
>

--00000000000084055a05a3fb6590
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the explanation. I could test what I needed to =
test on an Intel C620 based platform.<div><br></div><div>Specifically I&#39=
;m trying to run a board in eSPI=C2=A0+ SAFS mode. SAFS is &quot;Slave Atta=
ched Flash Sharing&quot; where the PCH loads all of its=C2=A0firmware (ME, =
GbE, BIOS etc) via eSPI, e.g. from a BMC. See Intel document 329957 (&quot;=
Enhanced Serial Peripheral Interface (eSPI) - Addendum for Server Platforms=
&quot;) from=C2=A0<a href=3D"https://downloadcenter.intel.com/download/2705=
5/eSPI" target=3D"_blank">https://downloadcenter.intel.com/download/27055/e=
SPI</a>=C2=A0for reference. However, even though the PCH (C620 series) read=
s quite a lot of data via SAFS, the ME doesn&#39;t release the CPU and the =
host wouldn&#39;t turn on. I had hoped that this is just the result of not =
having FDRV (aka. FD0V) enabled in the PCH. In that case the ME should have=
 responded to IPMB and reported such. But the ME doesn&#39;t respond at all=
 on i2c in SAFS mode (checked via logic analyzer), so I&#39;m at a loss of =
what&#39;s wrong with it. In MAFS mode (i.e. when using SPI flash for=C2=A0=
 the PCH), the IPMB works as expected, so I know my setup is correct and it=
&#39;s actually the ME being unhappy in SAFS mode. I tried with ME in both =
&quot;operational&quot; and &quot;recovery&quot; mode. I do see different b=
ehavior in that the ME in &quot;recovery&quot; mode completely rewrites the=
 MFS section, so &quot;something&quot; must actually be running in the ME. =
I guess the only other thing I haven&#39;t tried is to compare SAFS operati=
ons with SPI operations (MAFS) to see what else it would be doing on SPI.</=
div><div><br></div><div></div><div>Oskar.<br></div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 23, 2020 at =
2:59 PM Vijay Khemka &lt;<a href=3D"mailto:vijaykhemka@fb.com">vijaykhemka@=
fb.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">





<div lang=3D"EN-US">
<div class=3D"gmail-m_-5042845028599178880WordSection1">
<p class=3D"MsoNormal">As i2c slave mqueue driver is not upstreamed and wit=
h already having same functionality in ipmb-dev driver which is already in =
uostream kernel, I don=E2=80=99t see any reason to use i2c slave mqueue dri=
ver. I highly incourage people to use ipmb-dev
 driver with latest ipmbbridge. If there are any issues, please let us know=
.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Regards<u></u><u></u></p>
<p class=3D"MsoNormal">-Vijay<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(181,196,223);padding:3pt 0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:12pt;color:black">From: =
</span></b><span style=3D"font-size:12pt;color:black">Oskar Senft &lt;<a hr=
ef=3D"mailto:osk@google.com" target=3D"_blank">osk@google.com</a>&gt;<br>
<b>Date: </b>Thursday, April 23, 2020 at 8:34 AM<br>
<b>To: </b>Vijay Khemka &lt;<a href=3D"mailto:vijaykhemka@fb.com" target=3D=
"_blank">vijaykhemka@fb.com</a>&gt;<br>
<b>Cc: </b>OpenBMC Maillist &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org"=
 target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;<br>
<b>Subject: </b>Re: Access Intel ME IPMB from BMC<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal">On a side note regarding the ipmb-dev driver: It see=
ms that the Documentation/IPMB.txt has gotten &quot;lost&quot;. The only ve=
rsion I could find is this:=C2=A0<a href=3D"https://github.com/openbmc/linu=
x/blob/51bd6f291583684f495ea498984dfc22049d7fd2/Documentation/IPMB.txt" tar=
get=3D"_blank">https://github.com/openbmc/linux/blob/51bd6f291583684f495ea4=
98984dfc22049d7fd2/Documentation/IPMB.txt</a>.
 But it&#39;s not in any of the recent branches (dev-5.3 or dev-5.4).<u></u=
><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Should this file be resurrected?<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Oskar.<u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Thu, Apr 23, 2020 at 11:31 AM Oskar Senft &lt;<a =
href=3D"mailto:osk@google.com" target=3D"_blank">osk@google.com</a>&gt; wro=
te:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0in 0in 0in 6pt;margin-left:4=
.8pt;margin-right:0in">
<div>
<p class=3D"MsoNormal">Thanks again! <u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">ipmbbridge solved my problem. I found that my versio=
n of OpenBMC (incl. kernel) used a slightly older version of ipmbbridge whi=
ch still used the i2c slave mqueue, which worked fine. Reading a bit of sou=
rce code made it clear how it worked.
 The key is to configure ipbm-channels.json with the correct i2c device and=
 the rest &quot;just works&quot;.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">For the benefit of others: My understanding is that =
the current version of ipmbbridge no longer uses the i2c slave mqueue but r=
equires the ipmb-dev driver in the kernel. It&#39;s not necessary to actual=
ly attach the driver to an i2c device
 as that can happen at runtime.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Oskar.<u></u><u></u></p>
<div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Mon, Apr 20, 2020 at 4:34 PM Vijay Khemka &lt;<a =
href=3D"mailto:vijaykhemka@fb.com" target=3D"_blank">vijaykhemka@fb.com</a>=
&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0in 0in 0in 6pt;margin-left:4=
.8pt;margin-right:0in">
<div>
<div>
<p class=3D"MsoNormal">Hi Oskar,<u></u><u></u></p>
<p class=3D"MsoNormal">You need to use ipmb-dev driver which is is being us=
ed by ipmbbridge. You don=E2=80=99t need ipmb-host as we are having ipmbbri=
dge to replace that.<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">Regards<u></u><u></u></p>
<p class=3D"MsoNormal">-Vijay<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(181,196,223);padding:3pt 0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:12pt;color:black">From:
</span></b><span style=3D"font-size:12pt;color:black">Oskar Senft &lt;<a hr=
ef=3D"mailto:osk@google.com" target=3D"_blank">osk@google.com</a>&gt;<br>
<b>Date: </b>Monday, April 20, 2020 at 11:35 AM<br>
<b>To: </b>Vijay Khemka &lt;<a href=3D"mailto:vijaykhemka@fb.com" target=3D=
"_blank">vijaykhemka@fb.com</a>&gt;<br>
<b>Cc: </b>OpenBMC Maillist &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org"=
 target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;<br>
<b>Subject: </b>Re: Access Intel ME IPMB from BMC</span><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Hi Vijay
<u></u><u></u></p>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks for the pointer!<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I also found both=C2=A0<a href=3D"https://github.com=
/Mellanox/ipmb-host" target=3D"_blank">https://github.com/Mellanox/ipmb-hos=
t</a>=C2=A0and=C2=A0<a href=3D"https://github.com/openbmc/linux/blob/dev-5.=
4/drivers/char/ipmi/ipmb_dev_int.c" target=3D"_blank">https://github.com/op=
enbmc/linux/blob/dev-5.4/drivers/char/ipmi/ipmb_dev_int.c</a>.=C2=A0<u></u>=
<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Is it right that with=C2=A0ipmbbridge=C2=A0I don&#39=
;t need either of them since ipmbbridge=C2=A0uses the raw i2c dev?<u></u><u=
></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Oskar.<u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Mon, Apr 20, 2020 at 2:12 PM Vijay Khemka &lt;<a =
href=3D"mailto:vijaykhemka@fb.com" target=3D"_blank">vijaykhemka@fb.com</a>=
&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0in 0in 0in 6pt;margin:5pt 0i=
n 5pt 4.8pt">
<div>
<div>
<p class=3D"MsoNormal">Hi Oskar,<u></u><u></u></p>
<p class=3D"MsoNormal">You need to configure your ME channel in ipmb channe=
l config file
<a href=3D"https://github.com/openbmc/ipmbbridge/blob/master/ipmb-channels.=
json" target=3D"_blank">
https://github.com/openbmc/ipmbbridge/blob/master/ipmb-channels.json</a><u>=
</u><u></u></p>
<p class=3D"MsoNormal">And make sure ipmbbridge is running. Then you can se=
nd get device id command to ME from command line itself to test if everythi=
ng is working.<u></u><u></u></p>
<p>=C2=A0<u></u><u></u></p>
<p>busctl call xyz.openbmc_project.Ipmi.Channel.Ipmb /xyz/openbmc_project/I=
pmi/Channel/Ipmb org.openbmc.Ipmb sendRequest yyyyay 1 6 0 0x1 0<u></u><u><=
/u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">Regards<u></u><u></u></p>
<p class=3D"MsoNormal">-Vijay<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(181,196,223);padding:3pt 0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:12pt;color:black">From:
</span></b><span style=3D"font-size:12pt;color:black">openbmc &lt;openbmc-b=
ounces+vijaykhemka=3D<a href=3D"mailto:fb.com@lists.ozlabs.org" target=3D"_=
blank">fb.com@lists.ozlabs.org</a>&gt; on behalf of Oskar Senft &lt;<a href=
=3D"mailto:osk@google.com" target=3D"_blank">osk@google.com</a>&gt;<br>
<b>Date: </b>Saturday, April 18, 2020 at 6:47 PM<br>
<b>To: </b>OpenBMC Maillist &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org"=
 target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;<br>
<b>Subject: </b>Access Intel ME IPMB from BMC</span><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Hi everyone
<u></u><u></u></p>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I&#39;m trying to find out how I can access the Inte=
l ME via IPMB from the BMC (OpenBMC).<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">From what I gathered, Intel ME&#39;s IPMB is on the =
PCH&#39;s SMLink0. I know this is connected to one of the SMBus modules on =
my AST2500. But what I can&#39;t find out is how I actually send
 commands there? I&#39;m sure I&#39;m missing a document that makes this ob=
vious.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Or is it as simple as=C2=A0dropping IPMI packets ont=
o the bus?<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Is this by any chance already implemented in OpenBMC=
?<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks for any hints!<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Oskar<u></u><u></u></p>
</div>
</div>
</div>
</div>
</blockquote>
</div>
</div>
</div>
</blockquote>
</div>
</blockquote>
</div>
</div>
</div>

</blockquote></div>

--00000000000084055a05a3fb6590--
