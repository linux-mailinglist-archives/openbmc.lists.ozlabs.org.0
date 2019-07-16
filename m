Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADD76AC08
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2019 17:39:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45p4M36zhSzDqdD
	for <lists+openbmc@lfdr.de>; Wed, 17 Jul 2019 01:39:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Rbc2ybc4"; 
 dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45p4LL6nV4zDqRB
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jul 2019 01:38:31 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id b3so10310598plr.4
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2019 08:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ydo1MCRZ9iMorjS9IJoX1OcWyTOg9jShyCMmSM1YF9g=;
 b=Rbc2ybc474875W5h5Zw4P/wGTLEHxGXYiTwlmT5m7SWMlOgBDOP0bZKZgt1rLe7q2q
 Xmuw+Gn8lzdm5GOJK5akJbY6KW+wEBId//bZSNO5DFdTqqW01ZUjjoCS2qRynZluR3+x
 CxpRqDBWiso3F4wisJbyi5YVfn72uSRRjZv1khr2X026Dwtll626gfy2/BNkZypmyCRl
 6bTlIoei3kESfasmOVGE4OD84SHzOvVB2CFYPhzxEbfntK7hoouV2AHdnUz7fB4Cx1j0
 Sz17uFL1B4ZRNYLV9Are4lCO7X8M0aK3z24TpYeNXXThO/lIfOY5LysJTTtTEbEXm4EK
 KE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ydo1MCRZ9iMorjS9IJoX1OcWyTOg9jShyCMmSM1YF9g=;
 b=U/8H2NeXK6PhvrrCdq5deCatPt0qVPDHEGZ7qdNxhgGbb3jk1l0qCK7zUDNISfkwiu
 9LEBwcK9jUd8rNa4fdhbu6FHj6Klcqce4CXrqpT3Qr3Y+rcOLCI78pBI4X9vj5VPOvoV
 3P9KFo9VaMofYdUDDtZOQswSBaefkB7dkekuzgWIexb6Fjlc7oyScGdWdwDAwvVG+H5J
 vcji5r1+ZhDlYKNupHhEbggQyaiedRh7da4AlvUEHArGUlovIJ+QDi4parUGDu8l/Ohn
 wtYIRrgSnyzI9bdmStTayCWjVRCJgwNlj7AcX2w7mpKZMjoQfsYbTOqyZV1pif3TBXfK
 lZCA==
X-Gm-Message-State: APjAAAUId5CeDF9wJN5YTt7lXPOSXP1dGeXeuUqmQ6340ZyIGcmB4I1G
 /j/iHtHfNauvm2lHJZy30Gd5mfnX7il1HU4nOMndBQ==
X-Google-Smtp-Source: APXvYqxTLNGTfMSSETpMk952nhfoatf23d2AUF2fD39dwFnYE4CrCpTrr6wdvbZQM6e7gxWPOksACMMrgsU749zxdyc=
X-Received: by 2002:a17:902:9897:: with SMTP id
 s23mr36261781plp.47.1563291507951; 
 Tue, 16 Jul 2019 08:38:27 -0700 (PDT)
MIME-Version: 1.0
References: <55738808da484183a4fb1a59f7097e9c@lenovo.com>
In-Reply-To: <55738808da484183a4fb1a59f7097e9c@lenovo.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 16 Jul 2019 08:38:16 -0700
Message-ID: <CAO=notzcuVK-0eV4tCjD-MuFi7RQvrX1Y7fJgU4yzLzU-vR+Vw@mail.gmail.com>
Subject: Re: configure error and the image content seems to be incorrect
To: Andrew MS1 Peng <pengms1@lenovo.com>
Content-Type: multipart/alternative; boundary="000000000000035a84058dce2b2f"
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
 Duke KH Du <dukh@lenovo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000035a84058dce2b2f
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 16, 2019 at 5:31 AM Andrew MS1 Peng <pengms1@lenovo.com> wrote:

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
> 2.      The host tool compiled with phosphor-ipmi-flash hash id b90cacdd0c1ab8ea7576d4ca9f20aa5828a84e42
> and BMC flash library compiled with phosphor-ipmi-flash hash id c9792e75361c86da7f674976eacd03c761021d2f,
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
>                     reg = <0x98000000 0x00100000>; /* 1M */
>              };
>
> BMC configuration setting:
> EXTRA_OECONF += " --enable-reboot-update  --enable-static-layout
> --enable-aspeed-lpc MAPPED_ADDRESS=0x98000000 --enable-reboot-update"
>
> Host tool setting:
> ./burn_my_bmc --command update --interface ipmilpc --image ./630.mtd --sig
> ./sig.txt --type static --address 2550136832 --length 65536
>

The address provided for the host:
>>> '0x%x' % 2550136832
'0x98000000'

Is a region of memory on the host that's set aside for this purpose and is
mapped via /dev/mem.  It's not the address the BMC Is using.  You'll need
to use a region reserved for this purpose in the host kernel or bios.



> Thanks,
> Andrew
>

--000000000000035a84058dce2b2f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 16, 2019 at 5:31 AM Andre=
w MS1 Peng &lt;<a href=3D"mailto:pengms1@lenovo.com">pengms1@lenovo.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"ZH-CN">
<div class=3D"gmail-m_-3943518016435637397WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black">Hi Patrick,<u></u><u></u></span></p>
<p class=3D"gmail-m_-3943518016435637397MsoListParagraph" style=3D"margin-l=
eft:18pt">
<u></u><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:b=
lack"><span>1.<span style=3D"font:7pt &quot;Times New Roman&quot;">=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0
</span></span></span><u></u><span lang=3D"EN-US" style=3D"font-family:Calib=
ri,sans-serif;color:black">I downloaded the latest version of phosphor-ipmi=
-flash to build host tool with the SDK environment you provide, but encount=
er configure error as below, could
 you help to take a look at it?<u></u><u></u></span></p>
<table class=3D"gmail-m_-3943518016435637397MsoNormalTable" border=3D"0" ce=
llspacing=3D"0" cellpadding=3D"0" style=3D"margin-left:21pt;border-collapse=
:collapse">
<tbody>
<tr>
<td width=3D"333" valign=3D"top" style=3D"width:250.55pt;border:1pt solid w=
indowtext;background:yellow;padding:0cm 5.4pt">
<p class=3D"gmail-m_-3943518016435637397gmail-m1545270694092823127gmail-m-8=
411625341099404742msolistparagraph">
<b><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black=
">Source code hash id</span></b><span lang=3D"EN-US"><u></u><u></u></span><=
/p>
</td>
<td width=3D"87" valign=3D"top" style=3D"width:124.95pt;border-top:1pt soli=
d windowtext;border-right:1pt solid windowtext;border-bottom:1pt solid wind=
owtext;border-left:none;background:yellow;padding:0cm 5.4pt">
<p class=3D"gmail-m_-3943518016435637397gmail-m1545270694092823127gmail-m-8=
411625341099404742msolistparagraph">
<b><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black=
">Compile Status</span></b><span lang=3D"EN-US"><u></u><u></u></span></p>
</td>
<td width=3D"259" valign=3D"top" style=3D"width:16cm;border-top:1pt solid w=
indowtext;border-right:1pt solid windowtext;border-bottom:1pt solid windowt=
ext;border-left:none;background:yellow;padding:0cm 5.4pt">
<p class=3D"gmail-m_-3943518016435637397gmail-m1545270694092823127gmail-m-8=
411625341099404742msolistparagraph">
<b><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black=
">Error message</span></b><span lang=3D"EN-US"><u></u><u></u></span></p>
</td>
</tr>
<tr>
<td width=3D"333" valign=3D"top" style=3D"width:250.55pt;border-right:1pt s=
olid windowtext;border-bottom:1pt solid windowtext;border-left:1pt solid wi=
ndowtext;border-top:none;padding:0cm 5.4pt">
<p class=3D"gmail-m_-3943518016435637397gmail-m1545270694092823127gmail-m-8=
411625341099404742msolistparagraph">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">b=
90cacdd0c1ab8ea7576d4ca9f20aa5828a84e42</span><span lang=3D"EN-US" style=3D=
"font-family:Calibri,sans-serif"><u></u><u></u></span></p>
</td>
<td width=3D"87" valign=3D"top" style=3D"width:124.95pt;border-top:none;bor=
der-left:none;border-bottom:1pt solid windowtext;border-right:1pt solid win=
dowtext;padding:0cm 5.4pt">
<p class=3D"gmail-m_-3943518016435637397gmail-m1545270694092823127gmail-m-8=
411625341099404742msolistparagraph">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">c=
onfigure successful</span><span lang=3D"EN-US" style=3D"font-family:Calibri=
,sans-serif"><u></u><u></u></span></p>
</td>
<td width=3D"259" valign=3D"top" style=3D"width:16cm;border-top:none;border=
-left:none;border-bottom:1pt solid windowtext;border-right:1pt solid window=
text;padding:0cm 5.4pt">
</td>
</tr>
<tr>
<td width=3D"333" valign=3D"top" style=3D"width:250.55pt;border-right:1pt s=
olid windowtext;border-bottom:1pt solid windowtext;border-left:1pt solid wi=
ndowtext;border-top:none;padding:0cm 5.4pt">
<p class=3D"gmail-m_-3943518016435637397gmail-m1545270694092823127gmail-m-8=
411625341099404742msolistparagraph">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">f=
d182168d9d1c852b1047b9eccea56812b614586<br>
</span><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:b=
lack;background:white">1999eef0e6ad3ab4ad6fcf58cce47f352ca5e137<br>
fa06a5f0056e91bfada390c4007fbd3472d75a56<br>
7c2a00e02f1f0169b3e80ef1715002cefc6fa0d0<br>
c9792e75361c86da7f674976eacd03c761021d2f</span><span lang=3D"EN-US" style=
=3D"font-family:Calibri,sans-serif"><u></u><u></u></span></p>
</td>
<td width=3D"87" valign=3D"top" style=3D"width:124.95pt;border-top:none;bor=
der-left:none;border-bottom:1pt solid windowtext;border-right:1pt solid win=
dowtext;padding:0cm 5.4pt">
<p class=3D"gmail-m_-3943518016435637397gmail-m1545270694092823127gmail-m-8=
411625341099404742msolistparagraph">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">c=
onfigure failed</span><span lang=3D"EN-US" style=3D"font-family:Calibri,san=
s-serif"><u></u><u></u></span></p>
</td>
<td width=3D"259" valign=3D"top" style=3D"width:16cm;border-top:none;border=
-left:none;border-bottom:1pt solid windowtext;border-right:1pt solid window=
text;padding:0cm 5.4pt">
<p class=3D"gmail-m_-3943518016435637397gmail-m1545270694092823127gmail-m-8=
411625341099404742msolistparagraph">
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
Usually this means the macro was only invoked conditionally.</span><u></u><=
u></u></span></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"gmail-m_-3943518016435637397gmail-m1545270694092823127gmail-m-8=
411625341099404742gmail-m1788754371567513735gmail-m6436252274273416049gmail=
-m-4871403681716629123gmail-m5865277644764564145gmail-m5232517683823064206g=
mail-m-6091798217660211465gmail-m-7106965077525685122msolistparagra" style=
=3D"margin-left:18pt">
<u></u><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:b=
lack"><span>2.<span style=3D"font:7pt &quot;Times New Roman&quot;">=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0
</span></span></span><u></u><span lang=3D"EN-US" style=3D"font-family:Calib=
ri,sans-serif;color:black">The host tool compiled with
</span><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:b=
lack">phosphor-ipmi-flash</span><span lang=3D"EN-US" style=3D"font-family:C=
alibri,sans-serif;color:black"> hash id
</span><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:b=
lack">b90cacdd0c1ab8ea7576d4ca9f20aa5828a84e42 and BMC flash library
</span><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:b=
lack">compiled with
</span><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:b=
lack">phosphor-ipmi-flash</span><span lang=3D"EN-US" style=3D"font-family:C=
alibri,sans-serif;color:black"> hash id
</span><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:b=
lack;background:white">c9792e75361c86da7f674976eacd03c761021d2f, the BMC im=
age can transfer from host side to BMC side via LPC bridge. The image size =
is correct, but the image content
 seems to be incorrect as below, could you give us some </span><span lang=
=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">clues to so=
lve it if this is an issue?
</span><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:b=
lack"><u></u><u></u></span></p>
<table class=3D"gmail-m_-3943518016435637397MsoTableGrid" border=3D"1" cell=
spacing=3D"0" cellpadding=3D"0" style=3D"margin-left:18pt;border-collapse:c=
ollapse;border:none">
<tbody>
<tr>
<td width=3D"347" valign=3D"top" style=3D"width:307.65pt;border:1pt solid w=
indowtext;padding:0cm 5.4pt">
<p class=3D"gmail-m_-3943518016435637397gmail-m1545270694092823127gmail-m-8=
411625341099404742gmail-m1788754371567513735gmail-m6436252274273416049gmail=
-m-4871403681716629123gmail-m5865277644764564145gmail-m5232517683823064206g=
mail-m-6091798217660211465gmail-m-7106965077525685122msolistparagra">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">I=
mage of host side<u></u><u></u></span></p>
</td>
<td width=3D"336" valign=3D"top" style=3D"width:318.95pt;border-top:1pt sol=
id windowtext;border-right:1pt solid windowtext;border-bottom:1pt solid win=
dowtext;border-left:none;padding:0cm 5.4pt">
<p class=3D"gmail-m_-3943518016435637397gmail-m1545270694092823127gmail-m-8=
411625341099404742gmail-m1788754371567513735gmail-m6436252274273416049gmail=
-m-4871403681716629123gmail-m5865277644764564145gmail-m5232517683823064206g=
mail-m-6091798217660211465gmail-m-7106965077525685122msolistparagra">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">I=
mage of BMC side<u></u><u></u></span></p>
</td>
</tr>
<tr>
<td width=3D"347" valign=3D"top" style=3D"width:307.65pt;border-right:1pt s=
olid windowtext;border-bottom:1pt solid windowtext;border-left:1pt solid wi=
ndowtext;border-top:none;padding:0cm 5.4pt">
<p class=3D"gmail-m_-3943518016435637397gmail-m1545270694092823127gmail-m-8=
411625341099404742gmail-m1788754371567513735gmail-m6436252274273416049gmail=
-m-4871403681716629123gmail-m5865277644764564145gmail-m5232517683823064206g=
mail-m-6091798217660211465gmail-m-7106965077525685122msolistparagra">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">p=
engms1@hsbmc:/flash_tool$ hexdump -n 64 ./630.mtd
<u></u><u></u></span></p>
<p class=3D"gmail-m_-3943518016435637397gmail-m1545270694092823127gmail-m-8=
411625341099404742gmail-m1788754371567513735gmail-m6436252274273416049gmail=
-m-4871403681716629123gmail-m5865277644764564145gmail-m5232517683823064206g=
mail-m-6091798217660211465gmail-m-7106965077525685122msolistparagra">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">0=
000000 00be ea00 f014 e59f f014 e59f f014 e59f<u></u><u></u></span></p>
<p class=3D"gmail-m_-3943518016435637397gmail-m1545270694092823127gmail-m-8=
411625341099404742gmail-m1788754371567513735gmail-m6436252274273416049gmail=
-m-4871403681716629123gmail-m5865277644764564145gmail-m5232517683823064206g=
mail-m-6091798217660211465gmail-m-7106965077525685122msolistparagra">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">0=
000010 f014 e59f f014 e59f f014 e59f f014 e59f<u></u><u></u></span></p>
<p class=3D"gmail-m_-3943518016435637397gmail-m1545270694092823127gmail-m-8=
411625341099404742gmail-m1788754371567513735gmail-m6436252274273416049gmail=
-m-4871403681716629123gmail-m5865277644764564145gmail-m5232517683823064206g=
mail-m-6091798217660211465gmail-m-7106965077525685122msolistparagra">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">0=
000020 0060 0000 00c0 0000 0120 0000 0180 0000<u></u><u></u></span></p>
<p class=3D"gmail-m_-3943518016435637397gmail-m1545270694092823127gmail-m-8=
411625341099404742gmail-m1788754371567513735gmail-m6436252274273416049gmail=
-m-4871403681716629123gmail-m5865277644764564145gmail-m5232517683823064206g=
mail-m-6091798217660211465gmail-m-7106965077525685122msolistparagra">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">0=
000030 01e0 0000 0240 0000 02a0 0000 beef dead<u></u><u></u></span></p>
</td>
<td width=3D"336" valign=3D"top" style=3D"width:318.95pt;border-top:none;bo=
rder-left:none;border-bottom:1pt solid windowtext;border-right:1pt solid wi=
ndowtext;padding:0cm 5.4pt">
<p class=3D"gmail-m_-3943518016435637397gmail-m1545270694092823127gmail-m-8=
411625341099404742gmail-m1788754371567513735gmail-m6436252274273416049gmail=
-m-4871403681716629123gmail-m5865277644764564145gmail-m5232517683823064206g=
mail-m-6091798217660211465gmail-m-7106965077525685122msolistparagra">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">r=
oot@hr630:~# hexdump -n 64 /run/initramfs/bmc-image<u></u><u></u></span></p=
>
<p class=3D"gmail-m_-3943518016435637397gmail-m1545270694092823127gmail-m-8=
411625341099404742gmail-m1788754371567513735gmail-m6436252274273416049gmail=
-m-4871403681716629123gmail-m5865277644764564145gmail-m5232517683823064206g=
mail-m-6091798217660211465gmail-m-7106965077525685122msolistparagra">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">0=
000000 abc4 ef4e 11f2 b128 2538 fd9c 9f7a 2e00<u></u><u></u></span></p>
<p class=3D"gmail-m_-3943518016435637397gmail-m1545270694092823127gmail-m-8=
411625341099404742gmail-m1788754371567513735gmail-m6436252274273416049gmail=
-m-4871403681716629123gmail-m5865277644764564145gmail-m5232517683823064206g=
mail-m-6091798217660211465gmail-m-7106965077525685122msolistparagra">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">0=
000010 78c4 af6e 01f2 a92a 7438 759c 8e76 2e00<u></u><u></u></span></p>
<p class=3D"gmail-m_-3943518016435637397gmail-m1545270694092823127gmail-m-8=
411625341099404742gmail-m1788754371567513735gmail-m6436252274273416049gmail=
-m-4871403681716629123gmail-m5865277644764564145gmail-m5232517683823064206g=
mail-m-6091798217660211465gmail-m-7106965077525685122msolistparagra">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">0=
000020 f397 05f0 84e4 6546 0ac6 b6d0 ef19 cb80<u></u><u></u></span></p>
<p class=3D"gmail-m_-3943518016435637397gmail-m1545270694092823127gmail-m-8=
411625341099404742gmail-m1788754371567513735gmail-m6436252274273416049gmail=
-m-4871403681716629123gmail-m5865277644764564145gmail-m5232517683823064206g=
mail-m-6091798217660211465gmail-m-7106965077525685122msolistparagra">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">0=
000030 e9d7 82f0 c4e4 75dc 1bc6 a295 7319 49c4<u></u><u></u></span></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"gmail-m_-3943518016435637397gmail-m1545270694092823127gmail-m-8=
411625341099404742gmail-m1788754371567513735gmail-m6436252274273416049gmail=
-m-4871403681716629123gmail-m5865277644764564145gmail-m5232517683823064206g=
mail-m-6091798217660211465gmail-m-7106965077525685122msolistparagra" style=
=3D"margin-left:24pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">D=
TS setting:</span><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-se=
rif;color:black"><br>
</span><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:b=
lack">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 flash_memory: region@98000000 {<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 no-map;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D &lt;0x98000000 0x00100000&g=
t;; /* 1M */<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };=
<u></u><u></u></span></p>
<p class=3D"gmail-m_-3943518016435637397MsoListParagraph" style=3D"margin-l=
eft:18pt;text-indent:0cm">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">B=
MC configuration setting:<br>
EXTRA_OECONF +=3D &quot; --enable-reboot-update=C2=A0 --enable-static-layou=
t --enable-aspeed-lpc MAPPED_ADDRESS=3D0x98000000 --enable-reboot-update&qu=
ot;<u></u><u></u></span></p>
<p class=3D"gmail-m_-3943518016435637397MsoListParagraph" style=3D"margin-l=
eft:18pt;text-indent:0cm">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">H=
ost tool setting:<br>
./burn_my_bmc --command update --interface ipmilpc --image ./630.mtd --sig =
./sig.txt --type static --address 2550136832 --length 65536</span></p></div=
></div></blockquote><div><br></div><div>The address provided for the host:<=
/div><div>&gt;&gt;&gt; &#39;0x%x&#39; % 2550136832</div>&#39;0x98000000&#39=
;</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Is a=
 region of memory on the host that&#39;s set aside for this purpose and is =
mapped via /dev/mem.=C2=A0 It&#39;s not the address the BMC Is using.=C2=A0=
 You&#39;ll need to use a region reserved for this purpose in the host kern=
el or bios.</div><div class=3D"gmail_quote"><br><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><div lang=3D"ZH-CN"><div class=3D"g=
mail-m_-3943518016435637397WordSection1"><p class=3D"gmail-m_-3943518016435=
637397MsoListParagraph" style=3D"margin-left:18pt;text-indent:0cm"><span la=
ng=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black"><u></u><u=
></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif">Thanks,<br>
Andrew<u></u><u></u></span></p>
</div>
</div>

</blockquote></div></div>

--000000000000035a84058dce2b2f--
