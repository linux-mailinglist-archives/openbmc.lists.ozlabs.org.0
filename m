Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E17DA1B15BD
	for <lists+openbmc@lfdr.de>; Mon, 20 Apr 2020 21:17:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495bzY6hBhzDqsG
	for <lists+openbmc@lfdr.de>; Tue, 21 Apr 2020 05:16:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d2b;
 helo=mail-io1-xd2b.google.com; envelope-from=gmouse@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=PtBIR32V; dkim-atps=neutral
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495btd41C6zDqP2
 for <openbmc@lists.ozlabs.org>; Tue, 21 Apr 2020 05:12:39 +1000 (AEST)
Received: by mail-io1-xd2b.google.com with SMTP id u11so12353157iow.4
 for <openbmc@lists.ozlabs.org>; Mon, 20 Apr 2020 12:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lIw/4NibszogjkU9fORKDucJviZbwVtCclWogamzK7c=;
 b=PtBIR32VcR6umR01XtKyGm4K6rD54blxmnbDWSpllH2khzeg6almBNfsni1g4lV73g
 WDHuh3gSKku53kZLucCbXwHGF5DRfEwufxihdoJ4kY3QaGw7pmLaSTpXWFRjpjGfXbiF
 NE4nIec+n1/ASb7HmlkGKfTftMuC8zarq+wldajCpys1xnnKGyB8928s6qhHKbY+R/f2
 JLF7YAG24UmVeuXKzZ6bu5EejstXgnjNG4ksklprsm8csZT67yklty/hOBvsg/ilyvxJ
 8+aw4wxh9Kr4gGGSUYIpAcY3AUG1uR9YHT+3u6wLnov5GQ6Eq3lzGFudITsEZ8CRHo8H
 gvGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lIw/4NibszogjkU9fORKDucJviZbwVtCclWogamzK7c=;
 b=nstgtfNIiq9Aj5e2DFxVE74fJAgNsgKESlkGyAhJBAlaS9mtguwkL5imKOK4OOGUrV
 j5Gyc94DWoADKwIF5UpbiNqecb9sqFNC0Bv4FW5gpn37kSOenDkC64hCS+wmYzZVIcO0
 lkXrxAVagoiG5ks2xGwqyeTiX4fQtFhZCl2jfYnxRZMrDeiyCROTiXPzAd7k+g6G3CRB
 NcJkPqDkBFrKiclRZFHStT7MSuRQKTJPlpvK4oMsMrrJmI9KFWj/crAMQ4mJV0hASnJi
 z75xDCrMNqXQ5z9chMXfkz3Y02lWNqher3UMc8tP396O57OI2bmASGvYTRVS+lU8wz8e
 x4mA==
X-Gm-Message-State: AGi0Pua2yXq9ctC/HHpEvPYe31TmjN1KaUEMJT8nST/DYlTd7p+9UbkD
 r3as70NTvUbbKFi78HoTPwzsREg47IoRCR5CpFIHfA==
X-Google-Smtp-Source: APiQypLgsdUXHQWgVmc/NMrq9etZrqXAkqZj82zedWZXgvLRIpHuqvP0gIUAnMPQPiiHxwaOGQ3i3Bny2+AQjkZStmE=
X-Received: by 2002:a6b:7302:: with SMTP id e2mr15866193ioh.98.1587409955321; 
 Mon, 20 Apr 2020 12:12:35 -0700 (PDT)
MIME-Version: 1.0
References: <CABoTLcSOQYY+gk=7Q2w6Ny02L15yM19vTPmJxDfZVst6FV5r+Q@mail.gmail.com>
 <70D0A47B-9C5B-418C-BC1F-7379493C60AA@fb.com>
 <CABoTLcTa-7Fnu9rodg9PrbeZ9wYM7vYPHZK2meEZLx2XW+ZE1Q@mail.gmail.com>
In-Reply-To: <CABoTLcTa-7Fnu9rodg9PrbeZ9wYM7vYPHZK2meEZLx2XW+ZE1Q@mail.gmail.com>
From: Anton Kachalov <rnouse@google.com>
Date: Mon, 20 Apr 2020 21:12:22 +0200
Message-ID: <CADVsX8-2r+dTZ-waEbXAy6esk3Fg2Kysebu4nvNoKRv2fpkyDA@mail.gmail.com>
Subject: Re: Access Intel ME IPMB from BMC
To: Oskar Senft <osk@google.com>
Content-Type: multipart/alternative; boundary="000000000000807a2f05a3bdaee6"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000807a2f05a3bdaee6
Content-Type: text/plain; charset="UTF-8"

ipmbbridge works over ipmb-dev:
https://github.com/openbmc/ipmbbridge/blob/master/ipmbbridged.cpp#L548

Seems like the difference between ipmb-dev and ipmb-host is the only way
they act: as an IPMB device (receive requests and sends answers) or as an
initiator (sends requests and receives answers).

Perhaps, the upstreamed ipmb-dev works in either way (technically, the
difference only in send/receive order).

On Mon, 20 Apr 2020 at 20:35, Oskar Senft <osk@google.com> wrote:

> Hi Vijay
>
> Thanks for the pointer!
>
> I also found both https://github.com/Mellanox/ipmb-host and
> https://github.com/openbmc/linux/blob/dev-5.4/drivers/char/ipmi/ipmb_dev_int.c
> .
>
> Is it right that with ipmbbridge I don't need either of them since
> ipmbbridge uses the raw i2c dev?
>
> Thanks
> Oskar.
>
> On Mon, Apr 20, 2020 at 2:12 PM Vijay Khemka <vijaykhemka@fb.com> wrote:
>
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
>> /xyz/openbmc_project/Ipmi/Channel/Ipmb org.openbmc.Ipmb sendRequest yyyyay
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
>> *From: *openbmc <openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org> on
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
>> can't find out is how I actually send commands there? I'm sure I'm missing
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
>

--000000000000807a2f05a3bdaee6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ipmbbridge=C2=A0works over ipmb-dev:<div><a href=3D"https:=
//github.com/openbmc/ipmbbridge/blob/master/ipmbbridged.cpp#L548">https://g=
ithub.com/openbmc/ipmbbridge/blob/master/ipmbbridged.cpp#L548</a></div><div=
><br></div><div>Seems like the difference between ipmb-dev and ipmb-host is=
 the only way they act: as an IPMB device (receive requests and sends answe=
rs) or as an initiator (sends requests and receives answers).</div><div><br=
></div><div>Perhaps, the upstreamed ipmb-dev works in either way (technical=
ly, the difference only in send/receive order).</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 20 Apr 2020 =
at 20:35, Oskar Senft &lt;<a href=3D"mailto:osk@google.com">osk@google.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
div dir=3D"ltr">Hi Vijay<div><br></div><div>Thanks for the pointer!</div><d=
iv><br></div><div>I also found both=C2=A0<a href=3D"https://github.com/Mell=
anox/ipmb-host" target=3D"_blank">https://github.com/Mellanox/ipmb-host</a>=
=C2=A0and=C2=A0<a href=3D"https://github.com/openbmc/linux/blob/dev-5.4/dri=
vers/char/ipmi/ipmb_dev_int.c" target=3D"_blank">https://github.com/openbmc=
/linux/blob/dev-5.4/drivers/char/ipmi/ipmb_dev_int.c</a>.=C2=A0</div><div><=
br></div><div>Is it right that with=C2=A0ipmbbridge=C2=A0I don&#39;t need e=
ither of them since ipmbbridge=C2=A0uses the raw i2c dev?</div><div><br></d=
iv><div>Thanks</div><div>Oskar.</div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 20, 2020 at 2:12 PM Vijay =
Khemka &lt;<a href=3D"mailto:vijaykhemka@fb.com" target=3D"_blank">vijaykhe=
mka@fb.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">





<div lang=3D"EN-US">
<div>
<p class=3D"MsoNormal">Hi Oskar,<u></u><u></u></p>
<p class=3D"MsoNormal">You need to configure your ME channel in ipmb channe=
l config file
<a href=3D"https://github.com/openbmc/ipmbbridge/blob/master/ipmb-channels.=
json" target=3D"_blank">https://github.com/openbmc/ipmbbridge/blob/master/i=
pmb-channels.json</a><u></u><u></u></p>
<p class=3D"MsoNormal">And make sure ipmbbridge is running. Then you can se=
nd get device id command to ME from command line itself to test if everythi=
ng is working.<u></u><u></u></p>
<p><span><u></u>=C2=A0<u></u></span></p>
<p><span>busctl call xyz.openbmc_project.Ipmi.Channel.Ipmb /xyz/openbmc_pro=
ject/Ipmi/Channel/Ipmb org.openbmc.Ipmb sendRequest yyyyay 1 6 0 0x1 0</spa=
n><u></u><u></u></p>
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
</blockquote></div>

--000000000000807a2f05a3bdaee6--
