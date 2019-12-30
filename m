Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C65B12CCFD
	for <lists+openbmc@lfdr.de>; Mon, 30 Dec 2019 06:34:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47mR2L5tS7zDqBr
	for <lists+openbmc@lfdr.de>; Mon, 30 Dec 2019 16:34:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32e;
 helo=mail-ot1-x32e.google.com; envelope-from=akashgj91@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MRwni0Ar"; 
 dkim-atps=neutral
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47mR1d5yWHzDq9s
 for <openbmc@lists.ozlabs.org>; Mon, 30 Dec 2019 16:33:57 +1100 (AEDT)
Received: by mail-ot1-x32e.google.com with SMTP id r27so44888790otc.8
 for <openbmc@lists.ozlabs.org>; Sun, 29 Dec 2019 21:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wiY/9s/0z4J2D/jDu88tnyXsvyLlN9xqczTGezJzAfw=;
 b=MRwni0ArlZ/WHPx7T1Xvz8X6LDcqSpFRHs6mU+q2Oj5f8qI1C6WgtPSUpccf/QqZ8k
 81wg7uQW4YpCkS9SqoScKuKwAa3uAOT8UHmsGHlRmyq7z6gTg6oSR+r48XxK+n66hqiM
 7qCO4ZaA3jVl5eOtPZHPpfgwFIYQr6lj04Vqz4wTqMd3cubEV9Hl7WkEuLzK40JeXk64
 yWfbhMG/pPKS/J+/9OTuek+Vs1fF8IkQ5lTc+NR0HzK3OX8tmXy6lkAQgyVT7KH7Xg6Y
 S22atuRlOPpv225NOodHLKJLwZMOB+5XuV9e+9N6Rt9kEMTmbbwuqppsNdMY7OGcRGU1
 DZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wiY/9s/0z4J2D/jDu88tnyXsvyLlN9xqczTGezJzAfw=;
 b=YkfVNMnp91lo8X8nXNFPLvph923+aR+OSy/y3fLfF0XGuWtD9/Qa2gAlMgWpB+7AYI
 QHHUsweEkqr2B+/79Hvm5Y1jAJsd4TdA7JBMlgnYehx4KiY5O0zyi/1csto4uziwFuGg
 1aP4bZL/nxLBE9FnRrHcY06FcpoMY/yrnV6a7B8x5FMmiPmJaDZ82DcAyaGbqxABXisT
 TnJc2yQb3YvTmSWSk7n6vpVOumA6K8ePTTTnA5OFDKhNi0ow35Wxhk1Wdan+w1ffe/73
 f4PIlPtpEReXDVHTz8OeWW7nh4S7XifalYGiPamBjpjmVVniYTYzs/k1nkU2G5Sw7J+T
 7aGA==
X-Gm-Message-State: APjAAAXNc9qWaTgM1gb5XntLLNjZp/gorsI4taVlpEu1bSiEL2L0By0d
 n4bQvSV0a9JhNVHn8DpB574g8k7FZHPBbeor2Zo=
X-Google-Smtp-Source: APXvYqz79yAiggbBztFF4puf6uiKgiSngYEXQskbN4nhTTO8ewOVmFa2LQhNxCHX66X5EPCOnSBa3xkFNs+aKxTSZ5s=
X-Received: by 2002:a05:6830:20c6:: with SMTP id
 z6mr68546488otq.272.1577684034350; 
 Sun, 29 Dec 2019 21:33:54 -0800 (PST)
MIME-Version: 1.0
References: <CAE33tLEsCJtr9VPYj57ZcOe5iWD6282WmrMTr-Hp96Y3rkBzAA@mail.gmail.com>
 <000001d5bc87$f6fe3780$e4faa680$@linux.intel.com>
In-Reply-To: <000001d5bc87$f6fe3780$e4faa680$@linux.intel.com>
From: AKASH G J <akashgj91@gmail.com>
Date: Mon, 30 Dec 2019 05:32:33 +0530
Message-ID: <CAE33tLHvjuwFwCsSdohvYPHgs-f-8sDWMsNdAhzgQbs3=o7_tQ@mail.gmail.com>
Subject: Re: Serial Over Lan (SOL) no login prompt on Linux IRQ mode
To: Yong Li <yong.b.li@linux.intel.com>
Content-Type: multipart/alternative; boundary="0000000000006f72af059ae530c1"
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000006f72af059ae530c1
Content-Type: text/plain; charset="UTF-8"

I tried with the configuration

cat /etc/obmc-console.conf

baud = 115200

local-tty = ttyS4

local-tty-baud = 115200


Still we are not getting CentOS login prompt on SOL in IRQ mode.


Whether anything is required to be done in OpenBMC firmware/BIOS to enable
irq mode for SOL ?


Thanks,


Akash

On Fri, Dec 27, 2019 at 1:03 PM Yong Li <yong.b.li@linux.intel.com> wrote:

> HI Akash,
>
>
>
> Just FYI, we are using the below conf file. You can find other related
> files from
> https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mods/meta-ast2500/recipes-phosphor/console/obmc-console/obmc-console.conf
>
>
>
> cat /etc/obmc-console.conf
>
> baud = 115200
>
> local-tty = ttyS3
>
> local-tty-baud = 115200
>
>
>
> Thanks,
>
> Yong
>
> *From:* openbmc <openbmc-bounces+yong.b.li=
> linux.intel.com@lists.ozlabs.org> *On Behalf Of *AKASH G J
> *Sent:* Friday, December 27, 2019 2:54 PM
> *To:* openbmc@lists.ozlabs.org
> *Subject:* Serial Over Lan (SOL) no login prompt on Linux IRQ mode
>
>
>
> Hi all,
>
>
>
> We are using BMC Aspeed AST-2500 in our motherboard with OpenBMC firmware.
> 'obmc-console' is used to get host messages over BMC. obmc-console.conf
> looks like
>
>
>
>
> *lpc-address = 0x3f8sirq = 4local-tty = ttyS4local-tty-baud = 115200*
>
>
>
> BIOS serial redirection is enabled over COM port 0 (*0x3f8, sirq=4,
> baudrate=115200*) for super-IO.
>
>
>
> we set */dev/ttyS0* in CentOS to work in polling mode by making its
> *irq=0* using the following command
>
>
>
> $ setserial /dev/ttyS0 uart 16550a irq 0
>
> Now we are getting CentOS login prompt on SOL.
>
> When we change /dev/ttyS0 back to interrupt mode with irq=4, we are not
> getting login prompt on SOL.
>
>
>
> Whether anything is required to be done in OpenBMC firmware/BIOS to enable
> irq mode for SOL ?
>
>
>
>
>
>
>
> Thanks,
>
>
>
> Akash
>

--0000000000006f72af059ae530c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I tried with the configuration=C2=A0<div><br></div><div><p=
 class=3D"MsoNormal">cat /etc/obmc-console.conf<u></u><u></u></p><p class=
=3D"MsoNormal">baud =3D 115200<u></u><u></u></p><p class=3D"MsoNormal">loca=
l-tty =3D ttyS4<u></u></p><p class=3D"MsoNormal">local-tty-baud =3D 115200<=
/p><p class=3D"MsoNormal"><br></p><p class=3D"MsoNormal">Still=C2=A0<span s=
tyle=3D"font-family:arial,sans-serif">we are not getting CentOS login promp=
t on SOL in IRQ mode.</span></p><p class=3D"MsoNormal"><span style=3D"font-=
family:arial,sans-serif"><br></span></p><p class=3D"MsoNormal"><span style=
=3D"font-family:arial,sans-serif">Whether anything is required to be done i=
n OpenBMC firmware/BIOS to enable irq mode for SOL</span><span style=3D"fon=
t-family:Times,serif">=C2=A0?</span>=C2=A0</p><p class=3D"MsoNormal"><br></=
p><p class=3D"MsoNormal">Thanks,</p><p class=3D"MsoNormal"><br></p><p class=
=3D"MsoNormal">Akash=C2=A0<span style=3D"font-family:arial,sans-serif"><br>=
</span></p></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Fri, Dec 27, 2019 at 1:03 PM Yong Li &lt;<a href=3D"mai=
lto:yong.b.li@linux.intel.com">yong.b.li@linux.intel.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div lang=3D"EN-US"=
><div class=3D"gmail-m_-5706133509794241926WordSection1"><p class=3D"MsoNor=
mal">HI Akash,<u></u><u></u></p><p class=3D"MsoNormal"><u></u>=C2=A0<u></u>=
</p><p class=3D"MsoNormal">Just FYI, we are using the below conf file. You =
can find other related files from <a href=3D"https://github.com/Intel-BMC/o=
penbmc/blob/intel/meta-openbmc-mods/meta-ast2500/recipes-phosphor/console/o=
bmc-console/obmc-console.conf" target=3D"_blank">https://github.com/Intel-B=
MC/openbmc/blob/intel/meta-openbmc-mods/meta-ast2500/recipes-phosphor/conso=
le/obmc-console/obmc-console.conf</a><u></u><u></u></p><p class=3D"MsoNorma=
l"><u></u>=C2=A0<u></u></p><p class=3D"MsoNormal">cat /etc/obmc-console.con=
f<u></u><u></u></p><p class=3D"MsoNormal">baud =3D 115200<u></u><u></u></p>=
<p class=3D"MsoNormal">local-tty =3D ttyS3<u></u><u></u></p><p class=3D"Mso=
Normal">local-tty-baud =3D 115200<u></u><u></u></p><p class=3D"MsoNormal"><=
u></u>=C2=A0<u></u></p><p class=3D"MsoNormal">Thanks,<u></u><u></u></p><p c=
lass=3D"MsoNormal">Yong<u></u><u></u></p><p class=3D"MsoNormal"><a name=3D"=
m_-5706133509794241926______replyseparator"></a><b>From:</b> openbmc &lt;op=
enbmc-bounces+<a href=3D"http://yong.b.li" target=3D"_blank">yong.b.li</a>=
=3D<a href=3D"mailto:linux.intel.com@lists.ozlabs.org" target=3D"_blank">li=
nux.intel.com@lists.ozlabs.org</a>&gt; <b>On Behalf Of </b>AKASH G J<br><b>=
Sent:</b> Friday, December 27, 2019 2:54 PM<br><b>To:</b> <a href=3D"mailto=
:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a><b=
r><b>Subject:</b> Serial Over Lan (SOL) no login prompt on Linux IRQ mode<u=
></u><u></u></p><p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p><div><div><p=
 class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans-s=
erif">Hi all,</span><u></u><u></u></p></div><div><p class=3D"MsoNormal"><u>=
</u>=C2=A0<u></u></p></div><div><p class=3D"MsoNormal"><span style=3D"font-=
size:10pt;font-family:Arial,sans-serif">We are using BMC Aspeed AST-2500 in=
 our motherboard with OpenBMC firmware. &#39;obmc-console&#39; is used to g=
et host messages over BMC. obmc-console.conf looks like <br><br><i><span st=
yle=3D"color:blue">lpc-address =3D 0x3f8<br>sirq =3D 4<br>local-tty =3D tty=
S4<br>local-tty-baud =3D 115200</span></i></span><u></u><u></u></p></div><d=
iv><p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p></div><div><p class=3D"Ms=
oNormal"><span style=3D"font-size:10pt;font-family:Arial,sans-serif">BIOS s=
erial redirection is enabled over COM port 0 (<i>0x3f8, sirq=3D4, baudrate=
=3D115200</i>) for super-IO.</span><u></u><u></u></p></div><div><p class=3D=
"MsoNormal"><u></u>=C2=A0<u></u></p></div><div><div><p class=3D"MsoNormal">=
<span style=3D"font-size:10pt;font-family:Arial,sans-serif">we set <i>/dev/=
ttyS0</i> in CentOS to work in polling mode by making its <i>irq=3D0</i> us=
ing the following command </span><u></u><u></u></p></div><div><p class=3D"M=
soNormal"><u></u>=C2=A0<u></u></p></div><p class=3D"MsoNormal" style=3D"mar=
gin-bottom:12pt"><span style=3D"font-size:10pt;font-family:Arial,sans-serif=
;color:blue">$ setserial /dev/ttyS0 uart 16550a irq 0 </span><span style=3D=
"font-size:10pt;font-family:Arial,sans-serif"><br><br>Now we are getting Ce=
ntOS login prompt on SOL. </span><u></u><u></u></p><div><p class=3D"MsoNorm=
al"><span style=3D"font-size:10pt;font-family:Arial,sans-serif">When we cha=
nge /dev/ttyS0 back to interrupt mode with irq=3D4, we are not getting logi=
n prompt on SOL.</span><u></u><u></u></p></div><div><p class=3D"MsoNormal">=
<u></u>=C2=A0<u></u></p></div><div><p class=3D"MsoNormal"><span style=3D"fo=
nt-size:10pt;font-family:Arial,sans-serif">Whether anything is required to =
be done in OpenBMC firmware/BIOS to enable irq mode for SOL</span><span sty=
le=3D"font-size:10pt;font-family:&quot;Times New Roman&quot;,serif"> ?</spa=
n><u></u><u></u></p></div><div><p class=3D"MsoNormal"><u></u>=C2=A0<u></u><=
/p></div><div><p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p></div><div><p =
class=3D"MsoNormal"><u></u>=C2=A0<u></u></p></div><div><p class=3D"MsoNorma=
l"><span style=3D"font-size:10pt;font-family:Arial,sans-serif">Thanks,</spa=
n><u></u><u></u></p></div><div><p class=3D"MsoNormal"><u></u>=C2=A0<u></u><=
/p></div><div><p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-fam=
ily:Arial,sans-serif">Akash</span><u></u><u></u></p></div></div></div></div=
></div></blockquote></div>

--0000000000006f72af059ae530c1--
