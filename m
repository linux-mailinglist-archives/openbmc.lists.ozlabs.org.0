Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 611711B603C
	for <lists+openbmc@lfdr.de>; Thu, 23 Apr 2020 18:04:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497MYj2TGdzDqLW
	for <lists+openbmc@lfdr.de>; Fri, 24 Apr 2020 02:04:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::22a;
 helo=mail-lj1-x22a.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=A7qMaB1w; dkim-atps=neutral
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497Lvc6bg5zDqfS
 for <openbmc@lists.ozlabs.org>; Fri, 24 Apr 2020 01:34:36 +1000 (AEST)
Received: by mail-lj1-x22a.google.com with SMTP id e25so6675575ljg.5
 for <openbmc@lists.ozlabs.org>; Thu, 23 Apr 2020 08:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h3h0DpGM3lSSoP2J/HqJXlxessk6x5hAtk6CjlEQqTI=;
 b=A7qMaB1w6pQDtmJ5QPXZyy+5109llsACdRNTlCbjxq8AvW+nuYjTzpuQ3c7mOJ1/au
 XpRmes5pqxa4PQA5GUoLV0dk88iGuWw87UCZrXd/ZwBuWyCfxEx+wuoGYE3iWDJYoRXp
 KI1Izidg7moXMHNFrXz0q9cOX1pa0Nu4waWuXTb0S7dO1C+j68FiOV4iY9c71qI4VLES
 TLyIsZVMdYfzDzkqGppfwTg8SrN9RsmaafLyi6sUAx5TLDB80XBBT9BhqyDPlvWEsNF/
 NcebWef7LQ3sZPsqWvnHI06RkfrxaBF6N9/n/KkRm54t1tr6C4p6DAdMgiHVFCPOeYZe
 IChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h3h0DpGM3lSSoP2J/HqJXlxessk6x5hAtk6CjlEQqTI=;
 b=hw0y15nQ0M9rIh82f3cfYE57y4kFhdGPTyOcXZIVeVRc7E+3QQu1Kj/+pH+u8TP3IV
 yWtW+umlleBBkvrvslmDtp3rQfXxt/mpO3prDfZIYoKtue5wKB5l6Db3GRI7Sp4g3SmR
 UjYWaWH04meBOPQqy+P4Xd8+fVReb2lZvrbBA8sJMcTBd2UQPjjsktpaKcU70oyWuSCJ
 CgxVE1YAE4FgsfYqeh0XX/WHvsYDc2SscIc3TvkuOgT2rxhIrB/c/vkLo2iWCROqO1tg
 oWQY2UsqGxagwZ2jrkQpgAHfUPXKtHwn3jwSN+11jQZe9m++QXmjXrqs5hyqeFBB8cLq
 GqLw==
X-Gm-Message-State: AGi0PuamuXS77I7m8+LB6DWuLdKW/Vu6+Zo3nMOOjcjrVkFrKNpf93zZ
 gykM9ZolCSMBPDBwhRobc4gy25Vr/8mArLcUyWw8jg==
X-Google-Smtp-Source: APiQypKOYiBRoaVqisgNGtTyMtX6zQFgZKapU8a4OtpfqpOm3ecLa4XqjTAMwMNT8jHEMh/GIDrP6/DUcc7617hTYS0=
X-Received: by 2002:a2e:9842:: with SMTP id e2mr2692705ljj.273.1587656070806; 
 Thu, 23 Apr 2020 08:34:30 -0700 (PDT)
MIME-Version: 1.0
References: <CABoTLcSOQYY+gk=7Q2w6Ny02L15yM19vTPmJxDfZVst6FV5r+Q@mail.gmail.com>
 <70D0A47B-9C5B-418C-BC1F-7379493C60AA@fb.com>
 <CABoTLcTa-7Fnu9rodg9PrbeZ9wYM7vYPHZK2meEZLx2XW+ZE1Q@mail.gmail.com>
 <B3FB3174-1794-4A57-B850-61F0D8200339@fb.com>
 <CABoTLcStCvQ2fAVudN6q7bexNjuT1_NcEFwjMOR0yePWZ+d=Dg@mail.gmail.com>
In-Reply-To: <CABoTLcStCvQ2fAVudN6q7bexNjuT1_NcEFwjMOR0yePWZ+d=Dg@mail.gmail.com>
From: Oskar Senft <osk@google.com>
Date: Thu, 23 Apr 2020 11:34:13 -0400
Message-ID: <CABoTLcSriF37EgG9dtwZGfPm-arBG66hsnn380nxYXP4cY1W4w@mail.gmail.com>
Subject: Re: Access Intel ME IPMB from BMC
To: Vijay Khemka <vijaykhemka@fb.com>
Content-Type: multipart/alternative; boundary="00000000000020a52205a3f6fc1b"
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

--00000000000020a52205a3f6fc1b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On a side note regarding the ipmb-dev driver: It seems that the
Documentation/IPMB.txt has gotten "lost". The only version I could find is
this:
https://github.com/openbmc/linux/blob/51bd6f291583684f495ea498984dfc22049d7=
fd2/Documentation/IPMB.txt.
But it's not in any of the recent branches (dev-5.3 or dev-5.4).

Should this file be resurrected?

Oskar.

On Thu, Apr 23, 2020 at 11:31 AM Oskar Senft <osk@google.com> wrote:

> Thanks again!
>
> ipmbbridge solved my problem. I found that my version of OpenBMC (incl.
> kernel) used a slightly older version of ipmbbridge which still used the
> i2c slave mqueue, which worked fine. Reading a bit of source code made it
> clear how it worked. The key is to configure ipbm-channels.json with the
> correct i2c device and the rest "just works".
>
> For the benefit of others: My understanding is that the current version o=
f
> ipmbbridge no longer uses the i2c slave mqueue but requires the ipmb-dev
> driver in the kernel. It's not necessary to actually attach the driver to
> an i2c device as that can happen at runtime.
>
> Oskar.
>
>
> On Mon, Apr 20, 2020 at 4:34 PM Vijay Khemka <vijaykhemka@fb.com> wrote:
>
>> Hi Oskar,
>>
>> You need to use ipmb-dev driver which is is being used by ipmbbridge. Yo=
u
>> don=E2=80=99t need ipmb-host as we are having ipmbbridge to replace that=
.
>>
>>
>>
>> Regards
>>
>> -Vijay
>>
>>
>>
>> *From: *Oskar Senft <osk@google.com>
>> *Date: *Monday, April 20, 2020 at 11:35 AM
>> *To: *Vijay Khemka <vijaykhemka@fb.com>
>> *Cc: *OpenBMC Maillist <openbmc@lists.ozlabs.org>
>> *Subject: *Re: Access Intel ME IPMB from BMC
>>
>>
>>
>> Hi Vijay
>>
>>
>>
>> Thanks for the pointer!
>>
>>
>>
>> I also found both https://github.com/Mellanox/ipmb-host and
>> https://github.com/openbmc/linux/blob/dev-5.4/drivers/char/ipmi/ipmb_dev=
_int.c
>> .
>>
>>
>>
>> Is it right that with ipmbbridge I don't need either of them since
>> ipmbbridge uses the raw i2c dev?
>>
>>
>>
>> Thanks
>>
>> Oskar.
>>
>>
>>
>> On Mon, Apr 20, 2020 at 2:12 PM Vijay Khemka <vijaykhemka@fb.com> wrote:
>>
>> Hi Oskar,
>>
>> You need to configure your ME channel in ipmb channel config file
>> https://github.com/openbmc/ipmbbridge/blob/master/ipmb-channels.json
>>
>> And make sure ipmbbridge is running. Then you can send get device id
>> command to ME from command line itself to test if everything is working.
>>
>>
>>
>> busctl call xyz.openbmc_project.Ipmi.Channel.Ipmb
>> /xyz/openbmc_project/Ipmi/Channel/Ipmb org.openbmc.Ipmb sendRequest yyyy=
ay
>> 1 6 0 0x1 0
>>
>>
>>
>> Regards
>>
>> -Vijay
>>
>>
>>
>> *From: *openbmc <openbmc-bounces+vijaykhemka=3Dfb.com@lists.ozlabs.org> =
on
>> behalf of Oskar Senft <osk@google.com>
>> *Date: *Saturday, April 18, 2020 at 6:47 PM
>> *To: *OpenBMC Maillist <openbmc@lists.ozlabs.org>
>> *Subject: *Access Intel ME IPMB from BMC
>>
>>
>>
>> Hi everyone
>>
>>
>>
>> I'm trying to find out how I can access the Intel ME via IPMB from the
>> BMC (OpenBMC).
>>
>>
>>
>> From what I gathered, Intel ME's IPMB is on the PCH's SMLink0. I know
>> this is connected to one of the SMBus modules on my AST2500. But what I
>> can't find out is how I actually send commands there? I'm sure I'm missi=
ng
>> a document that makes this obvious.
>>
>>
>>
>> Or is it as simple as dropping IPMI packets onto the bus?
>>
>>
>>
>> Is this by any chance already implemented in OpenBMC?
>>
>>
>>
>> Thanks for any hints!
>>
>>
>>
>> Oskar
>>
>>

--00000000000020a52205a3f6fc1b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>On a side note regarding the ipmb-dev driver: It seem=
s that the Documentation/IPMB.txt has gotten &quot;lost&quot;. The only ver=
sion I could find is this:=C2=A0<a href=3D"https://github.com/openbmc/linux=
/blob/51bd6f291583684f495ea498984dfc22049d7fd2/Documentation/IPMB.txt" targ=
et=3D"_blank">https://github.com/openbmc/linux/blob/51bd6f291583684f495ea49=
8984dfc22049d7fd2/Documentation/IPMB.txt</a>. But it&#39;s not in any of th=
e recent branches (dev-5.3 or dev-5.4).</div><div><br></div><div>Should thi=
s file be resurrected?</div><div><br></div><div>Oskar.</div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 23,=
 2020 at 11:31 AM Oskar Senft &lt;<a href=3D"mailto:osk@google.com">osk@goo=
gle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div dir=3D"ltr">Thanks again!<div><br></div><div>ipmbbridge solved =
my problem. I found that my version of OpenBMC (incl. kernel) used a slight=
ly older version of ipmbbridge which still used the i2c slave mqueue, which=
 worked fine. Reading a bit of source code made it clear how it worked. The=
 key is to configure ipbm-channels.json with the correct i2c device and the=
 rest &quot;just works&quot;.</div><div><br></div><div>For the benefit of o=
thers: My understanding is that the current version of ipmbbridge no longer=
 uses the i2c slave mqueue but requires the ipmb-dev driver in the kernel. =
It&#39;s not necessary to actually attach the driver to an i2c device as th=
at can happen at runtime.</div><div><br></div><div>Oskar.<br><div><div><br>=
</div><div></div></div></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Apr 20, 2020 at 4:34 PM Vijay Khemka =
&lt;<a href=3D"mailto:vijaykhemka@fb.com" target=3D"_blank">vijaykhemka@fb.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">





<div lang=3D"EN-US">
<div>
<p class=3D"MsoNormal">Hi Oskar,<u></u><u></u></p>
<p class=3D"MsoNormal">You need to use ipmb-dev driver which is is being us=
ed by ipmbbridge. You don=E2=80=99t need ipmb-host as we are having ipmbbri=
dge to replace that.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Regards<u></u><u></u></p>
<p class=3D"MsoNormal">-Vijay<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(181,196,223);padding:3pt 0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:12pt;color:black">From: =
</span></b><span style=3D"font-size:12pt;color:black">Oskar Senft &lt;<a hr=
ef=3D"mailto:osk@google.com" target=3D"_blank">osk@google.com</a>&gt;<br>
<b>Date: </b>Monday, April 20, 2020 at 11:35 AM<br>
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
<p class=3D"MsoNormal">Hi Vijay <u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks for the pointer!<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
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
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Is it right that with=C2=A0ipmbbridge=C2=A0I don&#39=
;t need either of them since ipmbbridge=C2=A0uses the raw i2c dev?<u></u><u=
></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Oskar.<u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Mon, Apr 20, 2020 at 2:12 PM Vijay Khemka &lt;<a =
href=3D"mailto:vijaykhemka@fb.com" target=3D"_blank">vijaykhemka@fb.com</a>=
&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0in 0in 0in 6pt;margin-left:4=
.8pt;margin-right:0in">
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
<p><span>=C2=A0</span><u></u><u></u></p>
<p><span>busctl call xyz.openbmc_project.Ipmi.Channel.Ipmb /xyz/openbmc_pro=
ject/Ipmi/Channel/Ipmb org.openbmc.Ipmb sendRequest yyyyay 1 6 0 0x1 0</spa=
n><u></u><u></u></p>
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

</blockquote></div>
</blockquote></div>

--00000000000020a52205a3f6fc1b--
