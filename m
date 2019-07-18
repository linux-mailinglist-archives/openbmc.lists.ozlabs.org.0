Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A926D262
	for <lists+openbmc@lfdr.de>; Thu, 18 Jul 2019 18:52:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qKtm1dqSzDqcn
	for <lists+openbmc@lfdr.de>; Fri, 19 Jul 2019 02:52:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Q+vKckj0"; 
 dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qKt50PHPzDqDZ
 for <openbmc@lists.ozlabs.org>; Fri, 19 Jul 2019 02:51:53 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id b13so12900671pfo.1
 for <openbmc@lists.ozlabs.org>; Thu, 18 Jul 2019 09:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UfE+Q9nnl87gaAxoQxO8vRLzB7gk1x6Xr2XpYwzuNNM=;
 b=Q+vKckj0zGSX6yTi/LfWJwOPKpSjKBpw2vjT1XUwNtgODYIAmKOe5pBGjgp9T1soEG
 e7B/apI+TFUOdMc/YeOdsESfzpNbtNrAHM4T/TU1P/XxWG2YqqKmt7LvSYIA9GCT8zhS
 06YCfC5sc+WCOQSx1UNrtUF+KNehTO8yN+hqn1dClRb2mBjxhPXY3gaNmvUcAq8o575U
 RFUX1PFkU6EDB0yS2nI2FX4p8hBjvuIklcGeecesS1oMi+3li2L/Ub4B3DWSTq3Essiy
 rqKNmWyLG/c0FZDSsdMU6qEECeGKYjcYHrm6EGd+JwxxZlaFkhG/UE1HUpxjYK45bPcW
 Aqww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UfE+Q9nnl87gaAxoQxO8vRLzB7gk1x6Xr2XpYwzuNNM=;
 b=dAxMam0+WWaOOwwhVP6FqhTKQb8XjiwHS7yufX5mdZMwv+TZODaYpIJS/fbyT1B1Yy
 bDxuxyWcls2D3+Z+JcmP01QrVXWE8AOtaaKTye+eBhcUNJanVA6Ys8JBceWQtit8KrxC
 2wKyZWhpEjNddbZwwpx9SHJxknV+cT0RuUXtLYbx0YTQRSXJDmViuk/FN2tHGIZIQ2W6
 j7A4gQ8jXt5551qHUyA7eSSFEXaYo9dUOniY23+ImruDZe4gK14KforlzVmWkOx4XS+B
 dAQvZkSpdjRKIjNDnLyl7XgsWrp+8sztY4bpAJYeZVAs4+eacgrBz6bp2oE4TEFKMaBc
 dI6Q==
X-Gm-Message-State: APjAAAWqd2VFX49itIb2HixU/vmDcpeZv+SqhvNY0mdpHOj2HMLUDE/b
 jHUU3Ll1UgKPRkPc55kmz0YCMoDuuid1wRY9gbRvoA==
X-Google-Smtp-Source: APXvYqyhV9LnYzYvU4LEwPVfZaoBazQNG8SlqPpASojJqZM6FSMhlYBM1uyKgphSy6LujuojTyU8AIRsRvHPx627mWA=
X-Received: by 2002:a17:90a:bf0e:: with SMTP id
 c14mr49772428pjs.55.1563468710252; 
 Thu, 18 Jul 2019 09:51:50 -0700 (PDT)
MIME-Version: 1.0
References: <55738808da484183a4fb1a59f7097e9c@lenovo.com>
 <CAO=notzcuVK-0eV4tCjD-MuFi7RQvrX1Y7fJgU4yzLzU-vR+Vw@mail.gmail.com>
 <44ef02c54887404dbcfab3b22b4868c5@lenovo.com>
In-Reply-To: <44ef02c54887404dbcfab3b22b4868c5@lenovo.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 18 Jul 2019 09:51:38 -0700
Message-ID: <CAO=notyKxDC=-v7dQ4j-fZMAmgr6rqg808Y+-+cokgLtT7MtnQ@mail.gmail.com>
Subject: Re: [External] Re: configure error and the image content seems to be
 incorrect
To: Andrew MS1 Peng <pengms1@lenovo.com>
Content-Type: multipart/alternative; boundary="00000000000017f94a058df76dcd"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Yonghui YH21 Liu <liuyh21@lenovo.com>, Duke KH Du <dukh@lenovo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000017f94a058df76dcd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 18, 2019 at 4:27 AM Andrew MS1 Peng <pengms1@lenovo.com> wrote:

> Hi Patrick,
>
>
>
> Could you give me a hand on below problems? Thanks.
>
> 1.      I compiled the latest version of phosphor-ipmi-flash with OpenBMC
> SDK environment to build host tool, but encounter configuration error
> message as below, could you help to take a look at it?
>
> ./configure --enable-oe-sdk --host "$(uname -m)"
> --disable-build-bmc-blob-handler  AR=3Dx86_64-openbmc-linux-gcc-ar
> RANLIB=3Dx86_64-openbmc-linux-gcc-ranlib
>
> checking whether C++ compiler accepts -lgmock... yes
> checking whether C++ compiler accepts -pthread... (cached) yes
> checking for main in -lgmock... yes
> checking for valgrind... no
> checking whether to build with code coverage support... no
> configure: Enabling OE-SDK at
> /home/pengms1/SDK/openbmc-sdk/2.8.0/sysroots/core2-64-openbmc-linux
> configure: error: conditional "HAVE_SYSTEMD" was never defined.
> Usually this means the macro was only invoked conditionally.
>


Have systemd is only important for the BMC code, so it's unimportant in
this case.

>
>
> 2.      According to your suggestion, our BIOS engineer help to reserve
> host memory addr 0x40000000 with size 256KB and initiate this region with
> value 0xaa. I can see the value Oxaaaaaaaa from memory addr 0x40000000 vi=
a
> devmem2 tool. The memory region was overwritten during executable
> burn_my_bmc running, I compared the content between BMC and host image bu=
t
> it was Inconsistent. Could you give me some advice to solve it?
>
>
> BMC configuration setting:
> EXTRA_OECONF +=3D " --enable-reboot-update  --enable-static-layout
> --enable-aspeed-lpc MAPPED_ADDRESS=3D0x40000000 --enable-reboot-update"
>
> Host tool setting:
> ./burn_my_bmc --command update --interface ipmilpc --image ./630.mtd --si=
g
> ./sig.txt --type static --address 0x40000000 --length 65536
>

Interesting, so you're seeing the memory getting changed, but the bmc image
doesn't match.
Can you point me to your device tree? (for sanity checking)
What's the SHA for your linux tree (I want to make sure it has the optional
feature for aspeed-lpc-ctrl)

Do you see any output from journalctl?  I asked last time, but this if
leads with ipmid can hold some details.

I tested this with a 4K region on aspeed-lpc with the ast2500 and it worked
fine, so I do expect it to work... but you may have found some edge case --
you're saying the length for the region should be 64KB, and that should be
fine...


>
>
> Regards,
> Andrew
>
>
>
> *=E5=8F=91=E4=BB=B6=E4=BA=BA:* Patrick Venture <venture@google.com>
> *=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:* 2019=E5=B9=B47=E6=9C=8816=E6=97=
=A5 23:38
> *=E6=94=B6=E4=BB=B6=E4=BA=BA:* Andrew MS1 Peng <pengms1@lenovo.com>
> *=E6=8A=84=E9=80=81:* openbmc@lists.ozlabs.org; Duke KH Du <dukh@lenovo.c=
om>
> *=E4=B8=BB=E9=A2=98:* [External] Re: configure error and the image conten=
t seems to be
> incorrect
>
>
>
>
>
>
>
> On Tue, Jul 16, 2019 at 5:31 AM Andrew MS1 Peng <pengms1@lenovo.com>
> wrote:
>
> Hi Patrick,
>
> 1.      I downloaded the latest version of phosphor-ipmi-flash to build
> host tool with the SDK environment you provide, but encounter configure
> error as below, could you help to take a look at it?
>
> *Source code hash id*
>
> *Compile Status*
>
> *Error message*
>
> b90cacdd0c1ab8ea7576d4ca9f20aa5828a84e42
>
> configure successful
>
> fd182168d9d1c852b1047b9eccea56812b614586
> 1999eef0e6ad3ab4ad6fcf58cce47f352ca5e137
> fa06a5f0056e91bfada390c4007fbd3472d75a56
> 7c2a00e02f1f0169b3e80ef1715002cefc6fa0d0
> c9792e75361c86da7f674976eacd03c761021d2f
>
> configure failed
>
> checking whether C++ compiler accepts -lgtest... yes
> checking whether C++ compiler accepts -pthread... (cached) yes
> checking for main in -lgtest... yes
> checking whether C++ compiler accepts -lgmock... yes
> checking whether C++ compiler accepts -pthread... (cached) yes
> checking for main in -lgmock... yes
> checking for valgrind... no
> checking whether to build with code coverage support... no
> configure: Enabling OE-SDK at
> /home/pengms1/SDK/openbmc-sdk/2.8.0/sysroots/core2-64-openbmc-linux
> configure: error: conditional "HAVE_SYSTEMD" was never defined.
> Usually this means the macro was only invoked conditionally.
>
> 2.      The host tool compiled with phosphor-ipmi-flash hash id
> b90cacdd0c1ab8ea7576d4ca9f20aa5828a84e42 and BMC flash library compiled
> with phosphor-ipmi-flash hash id c9792e75361c86da7f674976eacd03c761021d2f=
,
> the BMC image can transfer from host side to BMC side via LPC bridge. The
> image size is correct, but the image content seems to be incorrect as
> below, could you give us some clues to solve it if this is an issue?
>
> Image of host side
>
> Image of BMC side
>
> pengms1@hsbmc:/flash_tool$ hexdump -n 64 ./630.mtd
>
> 0000000 00be ea00 f014 e59f f014 e59f f014 e59f
>
> 0000010 f014 e59f f014 e59f f014 e59f f014 e59f
>
> 0000020 0060 0000 00c0 0000 0120 0000 0180 0000
>
> 0000030 01e0 0000 0240 0000 02a0 0000 beef dead
>
> root@hr630:~# hexdump -n 64 /run/initramfs/bmc-image
>
> 0000000 abc4 ef4e 11f2 b128 2538 fd9c 9f7a 2e00
>
> 0000010 78c4 af6e 01f2 a92a 7438 759c 8e76 2e00
>
> 0000020 f397 05f0 84e4 6546 0ac6 b6d0 ef19 cb80
>
> 0000030 e9d7 82f0 c4e4 75dc 1bc6 a295 7319 49c4
>
> DTS setting:
>              flash_memory: region@98000000 {
>                     no-map;
>                     reg =3D <0x98000000 0x00100000>; /* 1M */
>              };
>
> BMC configuration setting:
> EXTRA_OECONF +=3D " --enable-reboot-update  --enable-static-layout
> --enable-aspeed-lpc MAPPED_ADDRESS=3D0x98000000 --enable-reboot-update"
>
> Host tool setting:
> ./burn_my_bmc --command update --interface ipmilpc --image ./630.mtd --si=
g
> ./sig.txt --type static --address 2550136832 --length 65536
>
>
>
> The address provided for the host:
>
> >>> '0x%x' % 2550136832
>
> '0x98000000'
>
>
>
> Is a region of memory on the host that's set aside for this purpose and i=
s
> mapped via /dev/mem.  It's not the address the BMC Is using.  You'll need
> to use a region reserved for this purpose in the host kernel or bios.
>
>
>
>
>
> Thanks,
> Andrew
>
>

--00000000000017f94a058df76dcd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 18, 2019 at 4:27 AM Andre=
w MS1 Peng &lt;<a href=3D"mailto:pengms1@lenovo.com">pengms1@lenovo.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"ZH-CN">
<div class=3D"gmail-m_-3973244268204610114WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black">Hi
</span><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:b=
lack">Patrick,</span><span lang=3D"EN-US" style=3D"font-family:Calibri,sans=
-serif;color:black"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black">Could you give me a hand on below problems? Thanks.<u=
></u><u></u></span></p>
<p class=3D"gmail-m_-3973244268204610114MsoListParagraph" style=3D"margin-l=
eft:18pt">
<u></u><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:b=
lack"><span>1.<span style=3D"font:7pt &quot;Times New Roman&quot;">=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0
</span></span></span><u></u><span lang=3D"EN-US" style=3D"font-family:Calib=
ri,sans-serif;color:black">I compiled the latest version of phosphor-ipmi-f=
lash with OpenBMC SDK environment</span><span lang=3D"EN-US" style=3D"font-=
family:Calibri,sans-serif;color:black">
 to build host tool</span><span lang=3D"EN-US" style=3D"font-family:Calibri=
,sans-serif;color:black">, but encounter configuration error message as bel=
ow, could you help to take a look at it?<br>
<br>
</span><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:b=
lack"><u></u><u></u></span></p>
<p class=3D"gmail-m_-3973244268204610114MsoListParagraph" style=3D"margin-l=
eft:18pt;text-indent:0cm"><span lang=3D"EN-US" style=3D"font-family:Calibri=
,sans-serif;color:black">./configure --enable-oe-sdk --host &quot;$(uname -=
m)&quot; --disable-build-bmc-blob-handler=C2=A0 AR=3Dx86_64-openbmc-linux-g=
cc-ar
 RANLIB=3Dx86_64-openbmc-linux-gcc-ranlib<u></u><u></u></span></p>
<p class=3D"gmail-m_-3973244268204610114MsoListParagraph" style=3D"margin-l=
eft:42pt;text-indent:0cm"><span lang=3D"EN-US" style=3D"font-family:Calibri=
,sans-serif;background:silver">checking whether C++ compiler accepts -lgmoc=
k... yes<br>
checking whether C++ compiler accepts -pthread... (cached) yes<br>
checking for main in -lgmock... yes<br>
checking for valgrind... no<br>
checking whether to build with code coverage support... no<br>
configure: Enabling OE-SDK at /home/pengms1/SDK/openbmc-sdk/2.8.0/sysroots/=
core2-64-openbmc-linux<br>
<span style=3D"color:red">configure: error: conditional &quot;HAVE_SYSTEMD&=
quot; was never defined.<br>
Usually this means the macro was only invoked conditionally.</span></span><=
/p></div></div></blockquote><div><br></div><div><br></div><div>Have systemd=
 is only important for the BMC code, so it&#39;s unimportant in this case.=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div lang=3D"=
ZH-CN"><div class=3D"gmail-m_-3973244268204610114WordSection1"><p class=3D"=
gmail-m_-3973244268204610114MsoListParagraph" style=3D"margin-left:42pt;tex=
t-indent:0cm"><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;=
color:red"><u></u><u></u></span></p>
<p class=3D"gmail-m_-3973244268204610114MsoListParagraph" style=3D"margin-l=
eft:42pt;text-indent:0cm"><span lang=3D"EN-US" style=3D"font-family:Calibri=
,sans-serif;color:black"><u></u>=C2=A0<u></u></span></p>
<p class=3D"gmail-m_-3973244268204610114MsoListParagraph" style=3D"margin-l=
eft:18pt">
<u></u><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:b=
lack"><span>2.<span style=3D"font:7pt &quot;Times New Roman&quot;">=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0
</span></span></span><u></u><span lang=3D"EN-US" style=3D"font-family:Calib=
ri,sans-serif;color:black">According to your suggestion, our BIOS engineer =
help to reserve host memory addr 0x40000000 with size 256KB and initiate th=
is region
 with value 0xaa. I can see the value Oxaaaaaaaa from memory addr 0x4000000=
0 via devmem2 tool. The memory region was
</span><span class=3D"gmail-m_-3973244268204610114src"><span lang=3D"EN-US"=
 style=3D"font-family:Calibri,sans-serif;color:black;background:white">over=
written</span></span><span class=3D"gmail-m_-3973244268204610114apple-conve=
rted-space"><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;co=
lor:black;background:white">
 during</span></span><span lang=3D"EN-US" style=3D"font-family:Calibri,sans=
-serif;color:black"> executable burn_my_bmc running, I compared the content=
 between BMC and host image but it was Inconsistent.
<span style=3D"background:white">Could you give me some </span>advice to so=
lve it?</span><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;=
color:black"><u></u><u></u></span></p>
<p class=3D"gmail-m_-3973244268204610114MsoListParagraph" style=3D"margin-l=
eft:18pt;text-indent:0cm"><span lang=3D"EN-US" style=3D"font-family:Calibri=
,sans-serif;color:black"><br>
<span style=3D"background:silver">BMC configuration setting:<br>
EXTRA_OECONF +=3D &quot; --enable-reboot-update=C2=A0 --enable-static-layou=
t --enable-aspeed-lpc MAPPED_ADDRESS=3D0x40000000 --enable-reboot-update&qu=
ot;<u></u><u></u></span></span></p>
<p class=3D"gmail-m_-3973244268204610114gmail-m-3943518016435637397msolistp=
aragraph" style=3D"margin-left:18pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black;ba=
ckground:silver">Host tool setting:<br>
./burn_my_bmc --command update --interface ipmilpc --image ./630.mtd --sig =
./sig.txt --type static --address 0x40000000 --length 65536</span></p></div=
></div></blockquote><div><br></div><div>Interesting, so you&#39;re seeing t=
he memory getting changed, but the bmc image doesn&#39;t match.</div><div>C=
an you point me to your device tree? (for sanity checking)</div><div>What&#=
39;s the SHA for your linux tree (I want to make sure it has the optional f=
eature for aspeed-lpc-ctrl)</div><div><br></div><div>Do you see any output =
from journalctl?=C2=A0 I asked last time, but this if leads with ipmid can =
hold some details.</div><div><br></div><div>I tested this with a 4K region =
on aspeed-lpc with the ast2500 and it worked fine, so I do expect it to wor=
k... but you may have found some edge case -- you&#39;re saying the length =
for the region should be 64KB, and that should be fine...</div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div lang=3D"ZH-CN">=
<div class=3D"gmail-m_-3973244268204610114WordSection1"><p class=3D"gmail-m=
_-3973244268204610114gmail-m-3943518016435637397msolistparagraph" style=3D"=
margin-left:18pt"><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-se=
rif"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black">Regards,<br>
Andrew<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:Calibri,sans-serif;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></span>=
</p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:11pt;font-family:=E7=AD=
=89=E7=BA=BF">=E5=8F=91=E4=BB=B6=E4=BA=BA<span lang=3D"EN-US">:</span></spa=
n></b><span lang=3D"EN-US" style=3D"font-size:11pt;font-family:=E7=AD=89=E7=
=BA=BF"> Patrick Venture &lt;<a href=3D"mailto:venture@google.com" target=
=3D"_blank">venture@google.com</a>&gt;
<br>
</span><b><span style=3D"font-size:11pt;font-family:=E7=AD=89=E7=BA=BF">=E5=
=8F=91=E9=80=81=E6=97=B6=E9=97=B4<span lang=3D"EN-US">:</span></span></b><s=
pan lang=3D"EN-US" style=3D"font-size:11pt;font-family:=E7=AD=89=E7=BA=BF">=
 2019</span><span style=3D"font-size:11pt;font-family:=E7=AD=89=E7=BA=BF">=
=E5=B9=B4<span lang=3D"EN-US">7</span>=E6=9C=88<span lang=3D"EN-US">16</spa=
n>=E6=97=A5<span lang=3D"EN-US">
 23:38<br>
</span><b>=E6=94=B6=E4=BB=B6=E4=BA=BA<span lang=3D"EN-US">:</span></b><span=
 lang=3D"EN-US"> Andrew MS1 Peng &lt;<a href=3D"mailto:pengms1@lenovo.com" =
target=3D"_blank">pengms1@lenovo.com</a>&gt;<br>
</span><b>=E6=8A=84=E9=80=81<span lang=3D"EN-US">:</span></b><span lang=3D"=
EN-US"> <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">openb=
mc@lists.ozlabs.org</a>; Duke KH Du &lt;<a href=3D"mailto:dukh@lenovo.com" =
target=3D"_blank">dukh@lenovo.com</a>&gt;<br>
</span><b>=E4=B8=BB=E9=A2=98<span lang=3D"EN-US">:</span></b><span lang=3D"=
EN-US"> [External] Re: configure error and the image content seems to be in=
correct<u></u><u></u></span></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">On Tue, Jul 16, 2019 at 5:31 AM=
 Andrew MS1 Peng &lt;<a href=3D"mailto:pengms1@lenovo.com" target=3D"_blank=
">pengms1@lenovo.com</a>&gt; wrote:<u></u><u></u></span></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin:5pt 0c=
m 5pt 4.8pt">
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black">Hi Patrick,</span><span lang=3D"EN-US"><u></u><u></u>=
</span></p>
<p class=3D"gmail-m_-3973244268204610114gmail-m-3943518016435637397msolistp=
aragraph" style=3D"margin-left:18pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">1=
.</span><span lang=3D"EN-US" style=3D"font-size:7pt;font-family:&quot;Times=
 New Roman&quot;,serif;color:black">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
</span><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:b=
lack">I downloaded the latest version of phosphor-ipmi-flash to build host =
tool with the SDK environment you provide, but encounter configure error as=
 below, could you help to take a look
 at it?</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<table class=3D"gmail-m_-3973244268204610114MsoNormalTable" border=3D"0" ce=
llspacing=3D"0" cellpadding=3D"0" style=3D"margin-left:21pt;border-collapse=
:collapse">
<tbody>
<tr>
<td width=3D"333" valign=3D"top" style=3D"width:250.55pt;border:1pt solid w=
indowtext;background:yellow;padding:0cm 5.4pt">
<p class=3D"gmail-m_-3973244268204610114gmail-m-3943518016435637397gmail-m1=
545270694092823127gmail-m-8411625341099404742msolistparagraph">
<b><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black=
">Source code hash id</span></b><span lang=3D"EN-US"><u></u><u></u></span><=
/p>
</td>
<td width=3D"85" valign=3D"top" style=3D"width:124.95pt;border-top:1pt soli=
d windowtext;border-right:1pt solid windowtext;border-bottom:1pt solid wind=
owtext;border-left:none;background:yellow;padding:0cm 5.4pt">
<p class=3D"gmail-m_-3973244268204610114gmail-m-3943518016435637397gmail-m1=
545270694092823127gmail-m-8411625341099404742msolistparagraph">
<b><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black=
">Compile Status</span></b><span lang=3D"EN-US"><u></u><u></u></span></p>
</td>
<td width=3D"252" valign=3D"top" style=3D"width:16cm;border-top:1pt solid w=
indowtext;border-right:1pt solid windowtext;border-bottom:1pt solid windowt=
ext;border-left:none;background:yellow;padding:0cm 5.4pt">
<p class=3D"gmail-m_-3973244268204610114gmail-m-3943518016435637397gmail-m1=
545270694092823127gmail-m-8411625341099404742msolistparagraph">
<b><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black=
">Error message</span></b><span lang=3D"EN-US"><u></u><u></u></span></p>
</td>
</tr>
<tr>
<td width=3D"333" valign=3D"top" style=3D"width:250.55pt;border-right:1pt s=
olid windowtext;border-bottom:1pt solid windowtext;border-left:1pt solid wi=
ndowtext;border-top:none;padding:0cm 5.4pt">
<p class=3D"gmail-m_-3973244268204610114gmail-m-3943518016435637397gmail-m1=
545270694092823127gmail-m-8411625341099404742msolistparagraph">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">b=
90cacdd0c1ab8ea7576d4ca9f20aa5828a84e42</span><span lang=3D"EN-US"><u></u><=
u></u></span></p>
</td>
<td width=3D"85" valign=3D"top" style=3D"width:124.95pt;border-top:none;bor=
der-left:none;border-bottom:1pt solid windowtext;border-right:1pt solid win=
dowtext;padding:0cm 5.4pt">
<p class=3D"gmail-m_-3973244268204610114gmail-m-3943518016435637397gmail-m1=
545270694092823127gmail-m-8411625341099404742msolistparagraph">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">c=
onfigure successful</span><span lang=3D"EN-US"><u></u><u></u></span></p>
</td>
<td width=3D"252" valign=3D"top" style=3D"width:16cm;border-top:none;border=
-left:none;border-bottom:1pt solid windowtext;border-right:1pt solid window=
text;padding:0cm 5.4pt">
</td>
</tr>
<tr>
<td width=3D"333" valign=3D"top" style=3D"width:250.55pt;border-right:1pt s=
olid windowtext;border-bottom:1pt solid windowtext;border-left:1pt solid wi=
ndowtext;border-top:none;padding:0cm 5.4pt">
<p class=3D"gmail-m_-3973244268204610114gmail-m-3943518016435637397gmail-m1=
545270694092823127gmail-m-8411625341099404742msolistparagraph">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">f=
d182168d9d1c852b1047b9eccea56812b614586<br>
<span style=3D"background:white">1999eef0e6ad3ab4ad6fcf58cce47f352ca5e137<b=
r>
fa06a5f0056e91bfada390c4007fbd3472d75a56<br>
7c2a00e02f1f0169b3e80ef1715002cefc6fa0d0<br>
c9792e75361c86da7f674976eacd03c761021d2f</span></span><span lang=3D"EN-US">=
<u></u><u></u></span></p>
</td>
<td width=3D"85" valign=3D"top" style=3D"width:124.95pt;border-top:none;bor=
der-left:none;border-bottom:1pt solid windowtext;border-right:1pt solid win=
dowtext;padding:0cm 5.4pt">
<p class=3D"gmail-m_-3973244268204610114gmail-m-3943518016435637397gmail-m1=
545270694092823127gmail-m-8411625341099404742msolistparagraph">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">c=
onfigure failed</span><span lang=3D"EN-US"><u></u><u></u></span></p>
</td>
<td width=3D"252" valign=3D"top" style=3D"width:16cm;border-top:none;border=
-left:none;border-bottom:1pt solid windowtext;border-right:1pt solid window=
text;padding:0cm 5.4pt">
<p class=3D"gmail-m_-3973244268204610114gmail-m-3943518016435637397gmail-m1=
545270694092823127gmail-m-8411625341099404742msolistparagraph">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif">checking whet=
her C++ compiler accepts -lgtest... yes<br>
checking whether C++ compiler accepts -pthread... (cached) yes<br>
checking for main in -lgtest... yes<br>
checking whether C++ compiler accepts -lgmock... yes<br>
checking whether C++ compiler accepts -pthread... (cached) yes<br>
checking for main in -lgmock... yes<br>
checking for valgrind... no<br>
checking whether to build with code coverage support... no<br>
configure: Enabling OE-SDK at /home/pengms1/SDK/openbmc-sdk/2.8.0/sysroots/=
core2-64-openbmc-linux<br>
<span style=3D"color:red">configure: error: conditional &quot;HAVE_SYSTEMD&=
quot; was never defined.<br>
Usually this means the macro was only invoked conditionally.</span></span><=
span lang=3D"EN-US"><u></u><u></u></span></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"gmail-m_-3973244268204610114gmail-m-3943518016435637397gmail-m1=
545270694092823127gmail-m-8411625341099404742gmail-m1788754371567513735gmai=
l-m6436252274273416049gmail-m-4871403681716629123gmail-m5865277644764564145=
gmail-m5232517683823064206gmail-m-6091798217660211465gmail-m-710696" style=
=3D"margin-left:18pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">2=
.</span><span lang=3D"EN-US" style=3D"font-size:7pt;font-family:&quot;Times=
 New Roman&quot;,serif;color:black">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
</span><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:b=
lack">The host tool compiled with phosphor-ipmi-flash hash id b90cacdd0c1ab=
8ea7576d4ca9f20aa5828a84e42 and BMC flash library compiled with phosphor-ip=
mi-flash hash id
<span style=3D"background:white">c9792e75361c86da7f674976eacd03c761021d2f, =
the BMC image can transfer from host side to BMC side via LPC bridge. The i=
mage size is correct, but the image content seems to be incorrect as below,=
 could you give us some
</span>clues to solve it if this is an issue? </span><span lang=3D"EN-US"><=
u></u><u></u></span></p>
<table class=3D"gmail-m_-3973244268204610114MsoNormalTable" border=3D"0" ce=
llspacing=3D"0" cellpadding=3D"0" style=3D"margin-left:18pt;border-collapse=
:collapse">
<tbody>
<tr>
<td width=3D"358" valign=3D"top" style=3D"width:307.65pt;border:1pt solid w=
indowtext;padding:0cm 5.4pt">
<p class=3D"gmail-m_-3973244268204610114gmail-m-3943518016435637397gmail-m1=
545270694092823127gmail-m-8411625341099404742gmail-m1788754371567513735gmai=
l-m6436252274273416049gmail-m-4871403681716629123gmail-m5865277644764564145=
gmail-m5232517683823064206gmail-m-6091798217660211465gmail-m-710696">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">I=
mage of host side</span><span lang=3D"EN-US"><u></u><u></u></span></p>
</td>
<td width=3D"316" valign=3D"top" style=3D"width:318.95pt;border-top:1pt sol=
id windowtext;border-right:1pt solid windowtext;border-bottom:1pt solid win=
dowtext;border-left:none;padding:0cm 5.4pt">
<p class=3D"gmail-m_-3973244268204610114gmail-m-3943518016435637397gmail-m1=
545270694092823127gmail-m-8411625341099404742gmail-m1788754371567513735gmai=
l-m6436252274273416049gmail-m-4871403681716629123gmail-m5865277644764564145=
gmail-m5232517683823064206gmail-m-6091798217660211465gmail-m-710696">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">I=
mage of BMC side</span><span lang=3D"EN-US"><u></u><u></u></span></p>
</td>
</tr>
<tr>
<td width=3D"358" valign=3D"top" style=3D"width:307.65pt;border-right:1pt s=
olid windowtext;border-bottom:1pt solid windowtext;border-left:1pt solid wi=
ndowtext;border-top:none;padding:0cm 5.4pt">
<p class=3D"gmail-m_-3973244268204610114gmail-m-3943518016435637397gmail-m1=
545270694092823127gmail-m-8411625341099404742gmail-m1788754371567513735gmai=
l-m6436252274273416049gmail-m-4871403681716629123gmail-m5865277644764564145=
gmail-m5232517683823064206gmail-m-6091798217660211465gmail-m-710696">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">p=
engms1@hsbmc:/flash_tool$ hexdump -n 64 ./630.mtd
</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"gmail-m_-3973244268204610114gmail-m-3943518016435637397gmail-m1=
545270694092823127gmail-m-8411625341099404742gmail-m1788754371567513735gmai=
l-m6436252274273416049gmail-m-4871403681716629123gmail-m5865277644764564145=
gmail-m5232517683823064206gmail-m-6091798217660211465gmail-m-710696">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">0=
000000 00be ea00 f014 e59f f014 e59f f014 e59f</span><span lang=3D"EN-US"><=
u></u><u></u></span></p>
<p class=3D"gmail-m_-3973244268204610114gmail-m-3943518016435637397gmail-m1=
545270694092823127gmail-m-8411625341099404742gmail-m1788754371567513735gmai=
l-m6436252274273416049gmail-m-4871403681716629123gmail-m5865277644764564145=
gmail-m5232517683823064206gmail-m-6091798217660211465gmail-m-710696">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">0=
000010 f014 e59f f014 e59f f014 e59f f014 e59f</span><span lang=3D"EN-US"><=
u></u><u></u></span></p>
<p class=3D"gmail-m_-3973244268204610114gmail-m-3943518016435637397gmail-m1=
545270694092823127gmail-m-8411625341099404742gmail-m1788754371567513735gmai=
l-m6436252274273416049gmail-m-4871403681716629123gmail-m5865277644764564145=
gmail-m5232517683823064206gmail-m-6091798217660211465gmail-m-710696">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">0=
000020 0060 0000 00c0 0000 0120 0000 0180 0000</span><span lang=3D"EN-US"><=
u></u><u></u></span></p>
<p class=3D"gmail-m_-3973244268204610114gmail-m-3943518016435637397gmail-m1=
545270694092823127gmail-m-8411625341099404742gmail-m1788754371567513735gmai=
l-m6436252274273416049gmail-m-4871403681716629123gmail-m5865277644764564145=
gmail-m5232517683823064206gmail-m-6091798217660211465gmail-m-710696">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">0=
000030 01e0 0000 0240 0000 02a0 0000 beef dead</span><span lang=3D"EN-US"><=
u></u><u></u></span></p>
</td>
<td width=3D"316" valign=3D"top" style=3D"width:318.95pt;border-top:none;bo=
rder-left:none;border-bottom:1pt solid windowtext;border-right:1pt solid wi=
ndowtext;padding:0cm 5.4pt">
<p class=3D"gmail-m_-3973244268204610114gmail-m-3943518016435637397gmail-m1=
545270694092823127gmail-m-8411625341099404742gmail-m1788754371567513735gmai=
l-m6436252274273416049gmail-m-4871403681716629123gmail-m5865277644764564145=
gmail-m5232517683823064206gmail-m-6091798217660211465gmail-m-710696">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">r=
oot@hr630:~# hexdump -n 64 /run/initramfs/bmc-image</span><span lang=3D"EN-=
US"><u></u><u></u></span></p>
<p class=3D"gmail-m_-3973244268204610114gmail-m-3943518016435637397gmail-m1=
545270694092823127gmail-m-8411625341099404742gmail-m1788754371567513735gmai=
l-m6436252274273416049gmail-m-4871403681716629123gmail-m5865277644764564145=
gmail-m5232517683823064206gmail-m-6091798217660211465gmail-m-710696">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">0=
000000 abc4 ef4e 11f2 b128 2538 fd9c 9f7a 2e00</span><span lang=3D"EN-US"><=
u></u><u></u></span></p>
<p class=3D"gmail-m_-3973244268204610114gmail-m-3943518016435637397gmail-m1=
545270694092823127gmail-m-8411625341099404742gmail-m1788754371567513735gmai=
l-m6436252274273416049gmail-m-4871403681716629123gmail-m5865277644764564145=
gmail-m5232517683823064206gmail-m-6091798217660211465gmail-m-710696">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">0=
000010 78c4 af6e 01f2 a92a 7438 759c 8e76 2e00</span><span lang=3D"EN-US"><=
u></u><u></u></span></p>
<p class=3D"gmail-m_-3973244268204610114gmail-m-3943518016435637397gmail-m1=
545270694092823127gmail-m-8411625341099404742gmail-m1788754371567513735gmai=
l-m6436252274273416049gmail-m-4871403681716629123gmail-m5865277644764564145=
gmail-m5232517683823064206gmail-m-6091798217660211465gmail-m-710696">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">0=
000020 f397 05f0 84e4 6546 0ac6 b6d0 ef19 cb80</span><span lang=3D"EN-US"><=
u></u><u></u></span></p>
<p class=3D"gmail-m_-3973244268204610114gmail-m-3943518016435637397gmail-m1=
545270694092823127gmail-m-8411625341099404742gmail-m1788754371567513735gmai=
l-m6436252274273416049gmail-m-4871403681716629123gmail-m5865277644764564145=
gmail-m5232517683823064206gmail-m-6091798217660211465gmail-m-710696">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">0=
000030 e9d7 82f0 c4e4 75dc 1bc6 a295 7319 49c4</span><span lang=3D"EN-US"><=
u></u><u></u></span></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"gmail-m_-3973244268204610114gmail-m-3943518016435637397gmail-m1=
545270694092823127gmail-m-8411625341099404742gmail-m1788754371567513735gmai=
l-m6436252274273416049gmail-m-4871403681716629123gmail-m5865277644764564145=
gmail-m5232517683823064206gmail-m-6091798217660211465gmail-m-710696" style=
=3D"margin-left:24pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">D=
TS setting:<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fl=
ash_memory: region@98000000 {<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 no-map;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D &lt;0x98000000 0x00100000&g=
t;; /* 1M */<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };=
</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"gmail-m_-3973244268204610114gmail-m-3943518016435637397msolistp=
aragraph" style=3D"margin-left:18pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">B=
MC configuration setting:<br>
EXTRA_OECONF +=3D &quot; --enable-reboot-update=C2=A0 --enable-static-layou=
t --enable-aspeed-lpc MAPPED_ADDRESS=3D0x98000000 --enable-reboot-update&qu=
ot;</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"gmail-m_-3973244268204610114gmail-m-3943518016435637397msolistp=
aragraph" style=3D"margin-left:18pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">H=
ost tool setting:<br>
./burn_my_bmc --command update --interface ipmilpc --image ./630.mtd --sig =
./sig.txt --type static --address 2550136832 --length 65536</span><span lan=
g=3D"EN-US"><u></u><u></u></span></p>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The address provided for the ho=
st:<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&gt;&gt;&gt; &#39;0x%x&#39; % 2=
550136832<u></u><u></u></span></p>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#39;0x98000000&#39;<u></u><u><=
/u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Is a region of memory on the ho=
st that&#39;s set aside for this purpose and is mapped via /dev/mem.=C2=A0 =
It&#39;s not the address the BMC Is using.=C2=A0 You&#39;ll need to use a r=
egion reserved for this purpose in the host kernel or bios.<u></u><u></u></=
span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin:5pt 0c=
m 5pt 4.8pt">
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif">Thanks,<br>
Andrew</span><span lang=3D"EN-US"><u></u><u></u></span></p>
</div>
</div>
</blockquote>
</div>
</div>
</div>
</div>

</blockquote></div></div>

--00000000000017f94a058df76dcd--
