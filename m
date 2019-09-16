Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BF4B3D05
	for <lists+openbmc@lfdr.de>; Mon, 16 Sep 2019 16:59:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46X8Xx3MnWzF241
	for <lists+openbmc@lfdr.de>; Tue, 17 Sep 2019 00:59:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=osk@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Mcjy9B5T"; 
 dkim-atps=neutral
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46X8Wz3GshzF1bv
 for <openbmc@lists.ozlabs.org>; Tue, 17 Sep 2019 00:58:55 +1000 (AEST)
Received: by mail-ed1-x52b.google.com with SMTP id r9so324600edl.10
 for <openbmc@lists.ozlabs.org>; Mon, 16 Sep 2019 07:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iuU3TiWDpfiLMx3PSDij3eXVBub/38KSPhchp4Xs2dY=;
 b=Mcjy9B5TrflLxb1kCSDzKTxYu7eiTLboz6a8JVnSxIpyLc1d4JdCcS1KFngZOJ1ffE
 d83oWPL0of/oMI5/83Tuo4oN/5xT4Z1oyJR/p7v9P324hE5kND4T3dj4TgN/+Ccoh3Y0
 qWSGwfyOH0dY598aB9yG/gXVtj/nDT/KoKiR1IrSpeqqq5r2azuFDd2PSi0vadDcUvOW
 bztifgQM7Zk+1v3niMPWaRjfseKWSGWhoSmmxVwZOpSEx1biKM+1FmE0Yg3FwYQ8mrWq
 fgNkAhS0VzeubfQy5Jm6FKVNueQqk6EBKx5kr7LbBGvpiEvCjCeuQ9dwILgn5H2ZZPUF
 q/Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iuU3TiWDpfiLMx3PSDij3eXVBub/38KSPhchp4Xs2dY=;
 b=pQupeoKClbg8Hs6aOD8EODCHkmayse2hNE45KSXrWmoa8/YIhInWyzRY4afc0DQrYE
 /RNTrSvoPzcBS4lzIUZ7wos+qxAlBUL3DA5+YV2rtQeL1CLOslupjZhBYwf/GQcI0oaO
 OBPs4H81kkH0SZuPG4/16OwtcASfVrW50aAFBoFsj5w7ONvm6N2BLC6Wz8Dxphckyj+s
 YOC9UNciv5Eu46n8oe4v1DhYREz1+Q7tDvFtR4jnNmjyk2nxFRcELeAswEksvFaCH9oB
 dm3p5Qa7q7X2mZVA+t0vFJaQKUeEOy4IO1ufj5eneFj9CBLETeSLkOLdW6wKcOui4zcL
 QWsQ==
X-Gm-Message-State: APjAAAVEUDM2L1m2BNoVokTWIvjZ0Tq+TDuf1e/MEclLpmN9AEIBk25V
 zDS4jk6NHFLwxV5UK57gBTOrKZGNIe6ObSIeurtFRNOH
X-Google-Smtp-Source: APXvYqyW9IWZl5fR5nhQIA86oalCt01BzbosFKtjhvk+wMFaZ2j87oxzoDL7eAXIz7WGrASMzI8Fmj7/ANvr10pOI8o=
X-Received: by 2002:a17:906:4a51:: with SMTP id
 a17mr369532ejv.279.1568645929800; 
 Mon, 16 Sep 2019 07:58:49 -0700 (PDT)
MIME-Version: 1.0
References: <69859184.bebd.16d1b45f5b3.Coremail.ouyangxuan10@163.com>
 <OF296529E4.5B358202-ON00258471.007740E2-00258471.00779A97@notes.na.collabserv.com>
 <546dbbbd-b38f-47cd-8e56-3f82ce383efb@www.fastmail.com>
 <CABoTLcRaLswO8pUQJeJ4dxoH+kbXR7J9pmRZ7ft8F2t+bQgeyA@mail.gmail.com>
 <cff298c.8724.16d3961f88b.Coremail.ouyangxuan10@163.com>
In-Reply-To: <cff298c.8724.16d3961f88b.Coremail.ouyangxuan10@163.com>
From: Oskar Senft <osk@google.com>
Date: Mon, 16 Sep 2019 10:58:33 -0400
Message-ID: <CABoTLcRyu2itAE6NkYHZUjHwaUKsGe1Upt2KwGp3FTJqsez-7Q@mail.gmail.com>
Subject: Re: Re: how to use spi flash BIOS/Host firmware??
To: www <ouyangxuan10@163.com>
Content-Type: multipart/alternative; boundary="0000000000006d06730592acd7ce"
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

--0000000000006d06730592acd7ce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Byron

I have not verified that or how exactly this would work.

The idea I heard floating around was to NOT use a kernel driver, but
instead use a user-space tool like flashrom to access the BIOS SPI flash
from the BMC.

If you (or someone else) does go down this route, it would be great if it
was reported back here.

Oskar.

On Mon, Sep 16, 2019 at 5:23 AM www <ouyangxuan10@163.com> wrote:

> Dear Oskar=EF=BC=8C
>
> In current BMC kernel, if I add a bios flash partition on dts, it need ge=
t
> bios flash chip ip when loading spi driver, It may have a bad effect on
> BIOS startup.
> Could you explain in detail how this safe flash method is implemented? ho=
w
> can I modify it on bmc kernel(I guess need modify kernel) and user space?
>
> thanks=EF=BC=8C
> Byron
>
>
>
> At 2019-09-11 23:28:27, "Oskar Senft" <osk@google.com> wrote:
>
> One option I heard of (unverified by me) is to use user-space-only
> implementation (e.g. flashrom) on the BMC to dynamically access the host'=
s
> SPI "when it is safe to do so", without requiring a kernel driver on the
> BMC.
>
> The tricky part is "when it is safe to do so", but you could define
> certain points in time, e.g. when the host is powered off or in reset.
>
> Oskar.
>
> On Tue, Sep 10, 2019 at 7:56 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>
>>
>>
>> On Wed, 11 Sep 2019, at 07:16, Milton Miller II wrote:
>> > On September 10, 2019, Byron <ouyangxuan10@163.com> wrote:
>> >
>> > >Dear all,
>> > >
>> > >    I want to ask a question about how to spi driver flash host/bios
>> > >firmware? I don't want use mtd mode flash it, because the mtd mode
>> > >need read spi-id when BMC load spi driver, may be it is risky, it
>> > >need switch the  system spi to BMC when the host running, It may
>> > >break host startup. Do we have other solutions to solve this problem?
>> > >
>> >
>> > Indeed, we did have some initial hand-off issues especially as the
>> > Linux kernel spi nor layer matured.  Over time the assumptions that
>> > the bios had that the chip would be set to 4-byte addressing by
>> > default were not met by the kernel driver which switched to using
>> > 4-byte specific read and write commands.
>> >
>> > You probably have a few options:
>> >
>> > If you host is read-only, you can allocate a block of dram
>> > and point the lpc window to the dram.  The aspeed lpc
>> > controller drivers has ioctl calls for this.
>> >
>> > If you host is directly connected to the chip and you are
>> > using the spi mode mux, then you would need to handshake
>> > with your bios.
>> >
>> > If your host is using lpc to the aspeed chip and programming
>> > the controller directly, you probably have given full overtake
>> > of your bmc to the host.
>>
>> This is the case for ASPEED BMCs, so be conscious of threat models.
>>
>> >
>> > In Openpower systems, we have implemented a protocol to map
>> > sections of the SPI rom into memory, and use IPMI messages
>> > to page in and out windows from this access window in memory
>> > to the backing SPI chip. We also have a method.
>>
>> That sentence looks incomplete :)
>>
>> Anyway, yes, in OpenPOWER platform designs the BMC owns the flash
>> and we provide an abstract means for the host to access flash data such
>> that the BMC always remains in control. If you have questions on what
>> we've done there, don't hesitate to ask me.
>>
>> Any other mechanisms will require an explicit handshake as Milton
>> mentions and there may be some corner cases in the event of ungraceful
>> shutdowns of the host.
>>
>> Andrew
>>
>
>
>
>

--0000000000006d06730592acd7ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Byron<div><br></div><div>I have not=C2=A0verified that =
or how exactly this would work.</div><div><br></div><div>The idea I heard f=
loating around was to NOT use a kernel driver, but instead use a user-space=
 tool like flashrom to access the BIOS SPI flash from the BMC.</div><div><b=
r></div><div>If you (or someone else) does go down this route, it would be =
great if it was reported back here.</div><div><br></div><div>Oskar.</div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Mon, Sep 16, 2019 at 5:23 AM www &lt;<a href=3D"mailto:ouyangxuan10@163.co=
m" target=3D"_blank">ouyangxuan10@163.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><div style=3D"line-height:1.7;colo=
r:rgb(0,0,0);font-size:14px;font-family:Arial"><div>Dear=C2=A0<span style=
=3D"font-family:Helvetica,&quot;Microsoft Yahei&quot;,verdana">Oskar=EF=BC=
=8C</span></div><div><span style=3D"font-family:Helvetica,&quot;Microsoft Y=
ahei&quot;,verdana"><br></span></div><div><span style=3D"font-family:Helvet=
ica,&quot;Microsoft Yahei&quot;,verdana">In current BMC kernel, if I add a =
bios flash partition on dts, it need get bios flash chip ip when loading sp=
i driver,=C2=A0</span><span style=3D"font-family:Helvetica,&quot;Microsoft =
Yahei&quot;,verdana">It may have a bad effect on BIOS startup.</span></div>=
<div><font face=3D"Helvetica, Microsoft Yahei, verdana">Could you explain i=
n detail how this safe flash method is implemented? how can I modify it on =
bmc kernel(I guess need modify kernel) and user space?=C2=A0</font></div><b=
r><div>thanks=EF=BC=8C</div><div>Byron</div><br><br><div style=3D"zoom:1"><=
/div><div id=3D"gmail-m_-6212424926330754351gmail-m_-2843237972321854470div=
NeteaseMailCard"></div><br>At 2019-09-11 23:28:27, &quot;Oskar Senft&quot; =
&lt;<a href=3D"mailto:osk@google.com" target=3D"_blank">osk@google.com</a>&=
gt; wrote:<br> <blockquote id=3D"gmail-m_-6212424926330754351gmail-m_-28432=
37972321854470isReplyContent" style=3D"padding-left:1ex;margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204)"><div dir=3D"ltr">One option I=
 heard of (unverified by me) is to use user-space-only implementation (e.g.=
 flashrom) on the BMC to dynamically access the host&#39;s SPI &quot;when i=
t is safe to do so&quot;, without requiring=C2=A0a kernel driver on the BMC=
.<div><br></div><div>The tricky part is &quot;when it is safe to do so&quot=
;, but you could define certain points in time, e.g. when the host is power=
ed off or in reset.</div><div><br></div><div>Oskar.</div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 10, 20=
19 at 7:56 PM Andrew Jeffery &lt;<a href=3D"mailto:andrew@aj.id.au" target=
=3D"_blank">andrew@aj.id.au</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><br>
<br>
On Wed, 11 Sep 2019, at 07:16, Milton Miller II wrote:<br>
&gt; On September 10, 2019, Byron &lt;<a href=3D"mailto:ouyangxuan10@163.co=
m" target=3D"_blank">ouyangxuan10@163.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt;Dear all,<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 I want to ask a question about how to spi driver fla=
sh host/bios<br>
&gt; &gt;firmware? I don&#39;t want use mtd mode flash it, because the mtd =
mode<br>
&gt; &gt;need read spi-id when BMC load spi driver, may be it is risky, it<=
br>
&gt; &gt;need switch the=C2=A0 system spi to BMC when the host running, It =
may<br>
&gt; &gt;break host startup. Do we have other solutions to solve this probl=
em?<br>
&gt; &gt;<br>
&gt; <br>
&gt; Indeed, we did have some initial hand-off issues especially as the <br=
>
&gt; Linux kernel spi nor layer matured.=C2=A0 Over time the assumptions th=
at <br>
&gt; the bios had that the chip would be set to 4-byte addressing by <br>
&gt; default were not met by the kernel driver which switched to using <br>
&gt; 4-byte specific read and write commands.<br>
&gt; <br>
&gt; You probably have a few options:<br>
&gt; <br>
&gt; If you host is read-only, you can allocate a block of dram <br>
&gt; and point the lpc window to the dram.=C2=A0 The aspeed lpc <br>
&gt; controller drivers has ioctl calls for this.<br>
&gt; <br>
&gt; If you host is directly connected to the chip and you are <br>
&gt; using the spi mode mux, then you would need to handshake <br>
&gt; with your bios.<br>
&gt; <br>
&gt; If your host is using lpc to the aspeed chip and programming <br>
&gt; the controller directly, you probably have given full overtake <br>
&gt; of your bmc to the host.<br>
<br>
This is the case for ASPEED BMCs, so be conscious of threat models.<br>
<br>
&gt; <br>
&gt; In Openpower systems, we have implemented a protocol to map <br>
&gt; sections of the SPI rom into memory, and use IPMI messages <br>
&gt; to page in and out windows from this access window in memory <br>
&gt; to the backing SPI chip. We also have a method.<br>
<br>
That sentence looks incomplete :)<br>
<br>
Anyway, yes, in OpenPOWER platform designs the BMC owns the flash<br>
and we provide an abstract means for the host to access flash data such<br>
that the BMC always remains in control. If you have questions on what<br>
we&#39;ve done there, don&#39;t hesitate to ask me.<br>
<br>
Any other mechanisms will require an explicit handshake as Milton<br>
mentions and there may be some corner cases in the event of ungraceful<br>
shutdowns of the host.<br>
<br>
Andrew<br>
</blockquote></div>
</blockquote></div><br><br><span title=3D"neteasefooter"><p>=C2=A0</p></spa=
n></blockquote></div>

--0000000000006d06730592acd7ce--
