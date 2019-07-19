Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DBB6E80A
	for <lists+openbmc@lfdr.de>; Fri, 19 Jul 2019 17:38:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qwBk3Mk7zDqvg
	for <lists+openbmc@lfdr.de>; Sat, 20 Jul 2019 01:38:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="fLmJpCuK"; 
 dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qwB31VS9zDqDM
 for <openbmc@lists.ozlabs.org>; Sat, 20 Jul 2019 01:37:44 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id i2so15827006plt.1
 for <openbmc@lists.ozlabs.org>; Fri, 19 Jul 2019 08:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Uh0KtmN+311fMIbP6woci3LoXXNH/GYrwWMSCZVJQSo=;
 b=fLmJpCuKtGMDJyT3Bx/HPsrOykiJFnOFJ6WpRW1sLsu0rOgojC3Zy8kZo7z2N08Xbp
 K5lScL0x1Rye2svyy5didR3XyTwLONozVPr39EN0jIbkIe8d9jH2GRH+Bm3z3co2TNV4
 Gk39woBi4vrdu2ERE1aCCTsifT4ehzeV5lcwbRmrFb+pG9LigKupqvgQ2b/A+vHBm2SM
 q19w/SguEo0sLSmd/P/dP2RVdamc8kUKNDLs6tu14ykby0AbV61DGLuYy/7WwYuR0rss
 oBdg5D0kjSmylr2HIRzN7Ea4eLsjdG0q5aPxa/Ttq5xc1ohUOwi4wF128PrkaCw9rB4n
 aYOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Uh0KtmN+311fMIbP6woci3LoXXNH/GYrwWMSCZVJQSo=;
 b=lNmDBxf+lvRTSFS4i60xWMzea7vhYZ99bmaXCVN3yYiXw0CXM75Xv6r0UZBl/i1RCf
 BpRF6tJQJ0KhXQP3C0laLMHdnuIyE4TdJSa7TaE9tAW/06zS9cjbzHEx8NaiQazEA8Hy
 DQ/6nipkCXLzUXa3sV2AYNeP8YIiEFzNdDxvyoTTsPYKpc1NKcT7j+8eJ6IU/mGLVyAc
 bPdncuAmqaCCKUvcuqJuyFVPo7Am6xS9lo9+uk/58qfh4TxD7J3aTN0PxBewxERyxbUQ
 0KcLj8quGCweMTy17PdLLlSoyuwNdUgvscjCaODycOloaRbtuMAFMxTHtjEFr451mp1l
 P5VA==
X-Gm-Message-State: APjAAAVJf0RsBtH09IXj6behe1sxNQgF+r4G0G2cHMjnjVsegn2R7leM
 Q2BpQqr0qmOK2+zMoEPiXs6FktV7oFV9p5qcZDIPiQ==
X-Google-Smtp-Source: APXvYqyJNSS4fcpQAGDSbILnZsCnCqGahrcrLoqyTXHOJxpoWm1aUL8g/sY3wce3TL/0ybFz/YY4olmrXDJ/h7WEJnA=
X-Received: by 2002:a17:902:9307:: with SMTP id
 bc7mr55917213plb.183.1563550660383; 
 Fri, 19 Jul 2019 08:37:40 -0700 (PDT)
MIME-Version: 1.0
References: <55738808da484183a4fb1a59f7097e9c@lenovo.com>
 <CAO=notzcuVK-0eV4tCjD-MuFi7RQvrX1Y7fJgU4yzLzU-vR+Vw@mail.gmail.com>
 <44ef02c54887404dbcfab3b22b4868c5@lenovo.com>
 <CAO=notyKxDC=-v7dQ4j-fZMAmgr6rqg808Y+-+cokgLtT7MtnQ@mail.gmail.com>
 <dc89fd1273184d9d932bf8a7c8db1c6a@lenovo.com>
In-Reply-To: <dc89fd1273184d9d932bf8a7c8db1c6a@lenovo.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 19 Jul 2019 08:37:28 -0700
Message-ID: <CAO=notxWDo8S_xNfc6PTo8i7cK4kNbqr=jjL4ZvVypAvTqOtRQ@mail.gmail.com>
Subject: Re: [External] Re: configure error and the image content seems to be
 incorrect
To: Andrew MS1 Peng <pengms1@lenovo.com>
Content-Type: multipart/alternative; boundary="000000000000b3bfad058e0a81b6"
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

--000000000000b3bfad058e0a81b6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 19, 2019 at 4:50 AM Andrew MS1 Peng <pengms1@lenovo.com> wrote:

> Hi Patrick,
>
>
>
> Please see my below comments.
>
>
>
> Thanks.
>
> Andrew
>
>
>
> *=E5=8F=91=E4=BB=B6=E4=BA=BA:* Patrick Venture <venture@google.com>
> *=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:* 2019=E5=B9=B47=E6=9C=8819=E6=97=
=A5 0:52
> *=E6=94=B6=E4=BB=B6=E4=BA=BA:* Andrew MS1 Peng <pengms1@lenovo.com>
> *=E6=8A=84=E9=80=81:* openbmc@lists.ozlabs.org; Duke KH Du <dukh@lenovo.c=
om>; Yonghui
> YH21 Liu <liuyh21@lenovo.com>
> *=E4=B8=BB=E9=A2=98:* Re: [External] Re: configure error and the image co=
ntent seems to
> be incorrect
>
>
>
>
>
>
>
> On Thu, Jul 18, 2019 at 4:27 AM Andrew MS1 Peng <pengms1@lenovo.com>
> wrote:
>
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
>
>
>
>
> Have systemd is only important for the BMC code, so it's unimportant in
> this case.
>
> It block Makefile generation, how can I do to avoid this error to generat=
e
> Makefile?
>

I'll see if I need to always define it -- not sure why you're hitting this
and I wasn't, but I'll take a look.

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
>
>
> Interesting, so you're seeing the memory getting changed, but the bmc
> image doesn't match.
>
> Can you point me to your device tree? (for sanity checking)
> DT file is below:
>
> https://github.com/LenovoHS/openbmc/blob/master/meta-lenovo/meta-hr630/re=
cipes-kernel/linux/linux-aspeed/aspeed-bmc-lenovo-hr630.dts
>
>
>
> What's the SHA for your linux tree (I want to make sure it has the
> optional feature for aspeed-lpc-ctrl)
>
>     I don=E2=80=99t know where can obtain the SHA value of linux tree, co=
uld you
> give me clues or guidance?
>

You're pointing to a different linux tree for your device-tree, presumably
you're not using openbmc/linux?


>
>
> Do you see any output from journalctl?  I asked last time, but this if
> leads with ipmid can hold some details.
>
> l  *Only host **reserve memory addr 0x**40000000 with 256KB, transfer
> data failed.*
>
> ## DTS setting:
>
>         &lpc_ctrl {
>
>             status =3D "okay";
>
>         };
>
>
>
>     ## journalctl log message:
>
>         Jul 19 02:06:02 hr630 ipmid[347]: Failed to ioctl Aspeed LPC map
> with error No such device or address
>
>         Jul 19 02:06:02 hr630 ipmid[347]: mappingResult.response 22
>
>         Jul 19 02:06:02 hr630 ipmid[347]: requesting Aspeed LPC window at
> 0x40000000 of size 65536
>
>         Jul 19 02:06:02 hr630 ipmid[347]: Failed to ioctl Aspeed LPC map
> with error No such device or address
>
>         Jul 19 02:06:02 hr630 ipmid[347]: mappingResult.response 22
>
>
>
>      ## BMC Registers (It is the same as default value):
>
>         (HICR7) devmem 0x1E789088
>
>          0x3000FFF8
>
>         (HICR8) devmem 0x1E78908c
>
>          0xFFF8F007
>
>         (HICR5) devmem 0x1E789080
>
>         0x00000403
>
>
>
> l  *BMC reserve memory addr 0x**98000000 with 1MB and host **reserve
> memory addr 0x**40000000 with 256KB, transfer data successful but the
> data was incorrect.*
>
> ## DTS setting:
>
>         flash_memory: region@98000000 {
>
>                 no-map;
>
>                 reg =3D <0x98000000 0x00100000>; /* 1M */
>
>             };
>
>
>
>         &lpc_ctrl {
>
>             status =3D "okay";
>
>             memory-region =3D <&flash_memory>;
>
>             flash =3D <&spi1>;
>
>         };
>
>
>
>     ## journalctl log message:
>
>         Jul 19 02:05:26 hr630 systemd[1]: Reached target
> Phosphor-ipmi-flash Prepare BMC to receive update.
>
>         Jul 19 02:05:26 hr630 ipmid[339]: requesting Aspeed LPC window at
> 0x40000000 of size 65536
>
>         Jul 19 02:05:52 hr630 ipmid[339]: requesting Aspeed LPC window at
> 0x40000000 of size 65536
>
        Jul 19 02:05:52 hr630 systemd[1]: Reached target
> Phosphor-ipmi-flash verify the image contents.
>

Good that you're no longer seeing a problem with this.  I wonder if there's
something different with the lpc_ctrl in this case since you're specifying
the flash node (a version of the driver+config i haven't tested).


>
>
>     ## BMC Registers:
>
>         (HICR7) devmem 0x1E789088
>
>         0x98004000
>
>         (HICR8) devmem 0x1E78908c
>
>         0xFFFF0000
>
>         (HICR5) devmem 0x1E789080
>
>         0x00000503
>
>
>
>
>
> I tested this with a 4K region on aspeed-lpc with the ast2500 and it
> worked fine, so I do expect it to work... but you may have found some edg=
e
> case -- you're saying the length for the region should be 64KB, and that
> should be fine...
>
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

--000000000000b3bfad058e0a81b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 19, 2019 at 4:50 AM Andre=
w MS1 Peng &lt;<a href=3D"mailto:pengms1@lenovo.com">pengms1@lenovo.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"ZH-CN">
<div class=3D"gmail-m_2984205525165170508WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(0,112,192)">Hi
</span><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:r=
gb(0,112,192)">Patrick,</span><span lang=3D"EN-US" style=3D"font-family:Cal=
ibri,sans-serif;color:rgb(0,112,192)"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(0,112,192)"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(0,112,192)">Please see my below comments.<u></u><u></u><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(0,112,192)"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(0,112,192)">Thanks.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(0,112,192)">Andrew<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=E7=AD=89=E7=BA=BF;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></span>=
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
=E5=B9=B4<span lang=3D"EN-US">7</span>=E6=9C=88<span lang=3D"EN-US">19</spa=
n>=E6=97=A5<span lang=3D"EN-US">
 0:52<br>
</span><b>=E6=94=B6=E4=BB=B6=E4=BA=BA<span lang=3D"EN-US">:</span></b><span=
 lang=3D"EN-US"> Andrew MS1 Peng &lt;<a href=3D"mailto:pengms1@lenovo.com" =
target=3D"_blank">pengms1@lenovo.com</a>&gt;<br>
</span><b>=E6=8A=84=E9=80=81<span lang=3D"EN-US">:</span></b><span lang=3D"=
EN-US"> <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">openb=
mc@lists.ozlabs.org</a>; Duke KH Du &lt;<a href=3D"mailto:dukh@lenovo.com" =
target=3D"_blank">dukh@lenovo.com</a>&gt;; Yonghui YH21 Liu &lt;<a href=3D"=
mailto:liuyh21@lenovo.com" target=3D"_blank">liuyh21@lenovo.com</a>&gt;<br>
</span><b>=E4=B8=BB=E9=A2=98<span lang=3D"EN-US">:</span></b><span lang=3D"=
EN-US"> Re: [External] Re: configure error and the image content seems to b=
e incorrect<u></u><u></u></span></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">On Thu, Jul 18, 2019 at 4:27 AM=
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
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black">=C2=A0</span><span lang=3D"EN-US"><u></u><u></u></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black">Could you give me a hand on below problems? Thanks.</=
span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"gmail-m_2984205525165170508gmail-m-3973244268204610114msolistpa=
ragraph" style=3D"margin-right:0cm;margin-bottom:12pt;margin-left:18pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">1=
.</span><span lang=3D"EN-US" style=3D"font-size:7pt;font-family:&quot;Times=
 New Roman&quot;,serif;color:black">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
</span><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:b=
lack">I compiled the latest version of phosphor-ipmi-flash with OpenBMC SDK=
 environment to build host tool, but encounter configuration error message =
as below, could you help to take a
 look at it?</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"gmail-m_2984205525165170508gmail-m-3973244268204610114msolistpa=
ragraph" style=3D"margin-left:18pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">.=
/configure --enable-oe-sdk --host &quot;$(uname -m)&quot; --disable-build-b=
mc-blob-handler=C2=A0 AR=3Dx86_64-openbmc-linux-gcc-ar RANLIB=3Dx86_64-open=
bmc-linux-gcc-ranlib</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"gmail-m_2984205525165170508gmail-m-3973244268204610114msolistpa=
ragraph" style=3D"margin-left:42pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;background:sil=
ver">checking whether C++ compiler accepts -lgmock... yes<br>
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
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Have systemd is only important =
for the BMC code, so it&#39;s unimportant in this case.=C2=A0<u></u><u></u>=
</span></p>
<p class=3D"MsoNormal" style=3D"text-indent:24pt"><span lang=3D"EN-US" styl=
e=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192)">It block Makefile=
 generation, how can I do to avoid this error to generate Makefile?</span><=
/p></div></div></div></div></div></blockquote><div><br></div><div></div><di=
v>I&#39;ll see if I need to always define it -- not sure why you&#39;re hit=
ting this and I wasn&#39;t, but I&#39;ll take a look.=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><div lang=3D"ZH-CN"><div class=3D"g=
mail-m_2984205525165170508WordSection1"><div><div><div><p class=3D"MsoNorma=
l" style=3D"text-indent:24pt"><span lang=3D"EN-US" style=3D"font-size:10.5p=
t;font-family:=E7=AD=89=E7=BA=BF;color:rgb(31,73,125)"><u></u><u></u></span=
></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin:5pt 0c=
m 5pt 4.8pt">
<div>
<div>
<p class=3D"gmail-m_2984205525165170508gmail-m-3973244268204610114msolistpa=
ragraph" style=3D"margin-left:42pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">=
=C2=A0</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"gmail-m_2984205525165170508gmail-m-3973244268204610114msolistpa=
ragraph" style=3D"margin-left:18pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">2=
.</span><span lang=3D"EN-US" style=3D"font-size:7pt;font-family:&quot;Times=
 New Roman&quot;,serif;color:black">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
</span><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:b=
lack">According to your suggestion, our BIOS engineer help to reserve host =
memory addr 0x40000000 with size 256KB and initiate this region with value =
0xaa. I can see the value Oxaaaaaaaa
 from memory addr 0x40000000 via devmem2 tool. The memory region was <span =
class=3D"gmail-m_2984205525165170508gmail-m-3973244268204610114src">
<span style=3D"background:white">overwritten</span></span><span class=3D"gm=
ail-m_2984205525165170508gmail-m-3973244268204610114apple-converted-space">=
<span style=3D"background:white"> during</span></span> executable burn_my_b=
mc running, I compared the content between BMC and host image but
 it was Inconsistent. <span style=3D"background:white">Could you give me so=
me </span>
advice to solve it?</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"gmail-m_2984205525165170508gmail-m-3973244268204610114msolistpa=
ragraph" style=3D"margin-left:18pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black"><=
br>
<span style=3D"background:silver">BMC configuration setting:<br>
EXTRA_OECONF +=3D &quot; --enable-reboot-update=C2=A0 --enable-static-layou=
t --enable-aspeed-lpc MAPPED_ADDRESS=3D0x40000000 --enable-reboot-update&qu=
ot;</span></span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"gmail-m_2984205525165170508gmail-m-3973244268204610114gmail-m-3=
943518016435637397msolistparagraph" style=3D"margin-left:18pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black;ba=
ckground:silver">Host tool setting:<br>
./burn_my_bmc --command update --interface ipmilpc --image ./630.mtd --sig =
./sig.txt --type static --address 0x40000000 --length 65536</span><span lan=
g=3D"EN-US"><u></u><u></u></span></p>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Interesting, so you&#39;re seei=
ng the memory getting changed, but the bmc image doesn&#39;t match.<u></u><=
u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:24pt"><span lang=3D"EN-US">Can =
you point me to your device tree? (for sanity checking)<br>
</span><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:r=
gb(0,112,192)">DT file is below:</span><span lang=3D"EN-US" style=3D"font-f=
amily:Calibri,sans-serif"><br>
<a href=3D"https://github.com/LenovoHS/openbmc/blob/master/meta-lenovo/meta=
-hr630/recipes-kernel/linux/linux-aspeed/aspeed-bmc-lenovo-hr630.dts" targe=
t=3D"_blank"><span style=3D"color:rgb(0,112,192)">https://github.com/Lenovo=
HS/openbmc/blob/master/meta-lenovo/meta-hr630/recipes-kernel/linux/linux-as=
peed/aspeed-bmc-lenovo-hr630.dts</span></a><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">What&#39;s the SHA for your lin=
ux tree (I want to make sure it has the optional feature for aspeed-lpc-ctr=
l)<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0=C2=A0=C2=A0 </span><span=
 lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192=
)">I don=E2=80=99t know where can obtain the SHA value of linux tree, could=
 you give me clues or guidance?</span></p></div></div></div></div></div></b=
lockquote><div><br></div><div>You&#39;re pointing to a different linux tree=
 for your device-tree, presumably you&#39;re not using openbmc/linux?</div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div lan=
g=3D"ZH-CN"><div class=3D"gmail-m_2984205525165170508WordSection1"><div><di=
v><div><p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Cal=
ibri,sans-serif;color:rgb(0,112,192)"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Do you see any output from jour=
nalctl?=C2=A0 I asked last time, but this if leads with ipmid can hold some=
 details.<u></u><u></u></span></p>
</div>
<div>
<p class=3D"gmail-m_2984205525165170508MsoListParagraph" style=3D"margin-le=
ft:42pt">
<u></u><span lang=3D"EN-US" style=3D"font-family:Wingdings"><span>l<span st=
yle=3D"font:7pt &quot;Times New Roman&quot;">=C2=A0
</span></span></span><u></u><b><span lang=3D"EN-US" style=3D"font-family:Ca=
libri,sans-serif;color:rgb(0,112,192)">Only host
</span></b><b><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;=
color:rgb(0,112,192)">reserve memory addr 0x</span></b><b><span lang=3D"EN-=
US" style=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192)">40000000 =
with 256KB, transfer data
 failed.</span></b><b><span lang=3D"EN-US" style=3D"font-family:Calibri,san=
s-serif"><u></u><u></u></span></b></p>
<p class=3D"MsoNormal" style=3D"margin-left:42pt"><span lang=3D"EN-US" styl=
e=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192)">## DTS setting:<u=
></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36pt"><span lang=3D"EN-US" styl=
e=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192)">=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 &amp;lpc_ctrl {<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36pt"><span lang=3D"EN-US" styl=
e=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192)">=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D &quot;okay&q=
uot;;<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36pt"><span lang=3D"EN-US" styl=
e=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192)">=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 };=C2=A0=C2=A0=C2=A0
<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36pt"><span lang=3D"EN-US" styl=
e=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192)">=C2=A0=C2=A0=C2=
=A0=C2=A0<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36pt"><span lang=3D"EN-US" styl=
e=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192)">=C2=A0=C2=A0=C2=
=A0=C2=A0## journalctl log message:
<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36pt"><span lang=3D"EN-US" styl=
e=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192)">=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jul 19 02:06:02 hr630 ipmid[347]: Failed t=
o ioctl Aspeed LPC map with error No such device or address<u></u><u></u></=
span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36pt"><span lang=3D"EN-US" styl=
e=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192)">=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 Jul 19 02:06:02 hr630 ipmid[347]: mappingResult=
.response 22<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36pt"><span lang=3D"EN-US" styl=
e=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192)">=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 Jul 19 02:06:02 hr630 ipmid[347]: requesting As=
peed LPC window at 0x40000000 of size 65536<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36pt"><span lang=3D"EN-US" styl=
e=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192)">=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 Jul 19 02:06:02 hr630 ipmid[347]: Failed to ioc=
tl Aspeed LPC map with error No such device or address<u></u><u></u></span>=
</p>
<p class=3D"MsoNormal" style=3D"margin-left:36pt"><span lang=3D"EN-US" styl=
e=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192)">=C2=A0 =C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0Jul 19 02:06:02 hr630 ipmid[347]: mappingResult.=
response 22<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36pt"><span lang=3D"EN-US" styl=
e=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192)">=C2=A0=C2=A0=C2=
=A0
<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36pt"><span lang=3D"EN-US" styl=
e=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192)">=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0## BMC Registers (It is the same as default value):<u></u><u=
></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36pt"><span lang=3D"EN-US" styl=
e=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192)">=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 (HICR7) devmem 0x1E789088=C2=A0
<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36pt"><span lang=3D"EN-US" styl=
e=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192)">=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x3000FFF8<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36pt"><span lang=3D"EN-US" styl=
e=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192)">=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 (HICR8) devmem 0x1E78908c=C2=A0
<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36pt"><span lang=3D"EN-US" styl=
e=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192)">=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00xFFF8F007
<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36pt"><span lang=3D"EN-US" styl=
e=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192)">=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(HICR5) devmem 0x1E789080=C2=A0
<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36pt"><span lang=3D"EN-US" styl=
e=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192)">=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x00000403<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:12pt"><span lang=3D"EN-US" styl=
e=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192)"><u></u>=C2=A0<u><=
/u></span></p>
<p class=3D"gmail-m_2984205525165170508MsoListParagraph" style=3D"margin-le=
ft:42pt">
<u></u><span lang=3D"EN-US" style=3D"font-family:Wingdings"><span>l<span st=
yle=3D"font:7pt &quot;Times New Roman&quot;">=C2=A0
</span></span></span><u></u><b><span lang=3D"EN-US" style=3D"font-family:Ca=
libri,sans-serif;color:rgb(0,112,192)">BMC reserve memory addr 0x</span></b=
><b><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:rgb(=
0,112,192)">98000000
 with 1MB and host </span></b><b><span lang=3D"EN-US" style=3D"font-family:=
Calibri,sans-serif;color:rgb(0,112,192)">reserve memory addr 0x</span></b><=
b><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:rgb(0,=
112,192)">40000000 with
 256KB, transfer data successful but the data was incorrect.</span></b><b><=
span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif"><u></u><u></u>=
</span></b></p>
<p class=3D"MsoNormal" style=3D"margin-left:21pt;text-indent:15pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:rgb(0,11=
2,192)">## DTS setting:<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36pt"><span lang=3D"EN-US" styl=
e=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192)">=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 flash_memory: region@98000000 {<u></u><u></u></=
span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36pt"><span lang=3D"EN-US" styl=
e=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192)">=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 no-map;<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36pt"><span lang=3D"EN-US" styl=
e=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192)">=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 reg =3D &lt;0x98000000 0x00100000&gt;; /* 1M */<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36pt"><span lang=3D"EN-US" styl=
e=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192)">=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0
<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36pt"><span lang=3D"EN-US" styl=
e=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192)"><u></u>=C2=A0<u><=
/u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36pt"><span lang=3D"EN-US" styl=
e=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192)">=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 &amp;lpc_ctrl {<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36pt"><span lang=3D"EN-US" styl=
e=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192)">=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D &quot;okay&q=
uot;;<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36pt"><span lang=3D"EN-US" styl=
e=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192)">=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memory-region =3D &lt;&=
amp;flash_memory&gt;;<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36pt"><span lang=3D"EN-US" styl=
e=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192)">=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flash =3D &lt;&amp;spi1=
&gt;;<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36pt"><span lang=3D"EN-US" styl=
e=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192)">=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 };<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36pt"><span lang=3D"EN-US" styl=
e=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192)">=C2=A0=C2=A0=C2=
=A0
<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36pt"><span lang=3D"EN-US" styl=
e=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192)">=C2=A0=C2=A0=C2=
=A0=C2=A0## journalctl log message:
<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36pt"><span lang=3D"EN-US" styl=
e=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192)">=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Jul 19 02:05:26 hr630 systemd[1]: Reached =
target Phosphor-ipmi-flash Prepare BMC to receive update.<u></u><u></u></sp=
an></p>
<p class=3D"MsoNormal" style=3D"margin-left:36pt"><span lang=3D"EN-US" styl=
e=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192)">=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 Jul 19 02:05:26 hr630 ipmid[339]: requesting As=
peed LPC window at 0x40000000 of size 65536<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36pt"><span lang=3D"EN-US" styl=
e=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192)">=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 Jul 19 02:05:52 hr630 ipmid[339]: requesting As=
peed LPC window at 0x40000000 of size 65536</span>=C2=A0</p></div></div></d=
iv></div></div></blockquote><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div lang=3D"ZH-CN"><div class=3D"gmail-m_2984205525165170508WordSection=
1"><div><div><div><p class=3D"MsoNormal" style=3D"margin-left:36pt"><span l=
ang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192)"=
>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Jul 19 02:05:52 hr630 systemd[1=
]: Reached target Phosphor-ipmi-flash verify the image contents.</span></p>=
</div></div></div></div></div></blockquote><div><br></div><div>Good that yo=
u&#39;re no=C2=A0longer seeing a problem with this.=C2=A0 I wonder if there=
&#39;s something different with the lpc_ctrl in this case since you&#39;re =
specifying the flash node (a version of the driver+config i haven&#39;t tes=
ted).</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div lang=3D"ZH-CN"><div class=3D"gmail-m_2984205525165170508WordSection=
1"><div><div><div><p class=3D"MsoNormal" style=3D"margin-left:36pt"><span l=
ang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192)"=
><u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36pt"><span lang=3D"EN-US" styl=
e=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192)"><u></u>=C2=A0<u><=
/u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36pt"><span lang=3D"EN-US" styl=
e=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192)">=C2=A0=C2=A0=C2=
=A0 ## BMC Registers:<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36pt"><span lang=3D"EN-US" styl=
e=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192)">=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 (HICR7) devmem 0x1E789088=C2=A0
<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36pt"><span lang=3D"EN-US" styl=
e=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192)">=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x98004000<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36pt"><span lang=3D"EN-US" styl=
e=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192)">=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 (HICR8) devmem 0x1E78908c=C2=A0
<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36pt"><span lang=3D"EN-US" styl=
e=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192)">=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00xFFFF0000
<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36pt"><span lang=3D"EN-US" styl=
e=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192)">=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(HICR5) devmem 0x1E789080=C2=A0
<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:36pt"><span lang=3D"EN-US" styl=
e=3D"font-family:Calibri,sans-serif;color:rgb(0,112,192)">=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x00000503<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I tested this with a 4K region =
on aspeed-lpc with the ast2500 and it worked fine, so I do expect it to wor=
k... but you may have found some edge case -- you&#39;re saying the length =
for the region should be 64KB, and that
 should be fine...<u></u><u></u></span></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin:5pt 0c=
m 5pt 4.8pt">
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black">=C2=A0</span><span lang=3D"EN-US"><u></u><u></u></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black">Regards,<br>
Andrew</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:Calibri,sans-serif;color:rgb(31,73,125)">=C2=A0</span><span lang=3D"=
EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:11pt;font-family:=E7=AD=
=89=E7=BA=BF">=E5=8F=91=E4=BB=B6=E4=BA=BA<span lang=3D"EN-US">:</span></spa=
n></b><span lang=3D"EN-US" style=3D"font-size:11pt;font-family:=E7=AD=89=E7=
=BA=BF"> Patrick Venture &lt;</span><span lang=3D"EN-US"><a href=3D"mailto:=
venture@google.com" target=3D"_blank"><span style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">venture@google.com</span></a></span><span lang=3D"=
EN-US" style=3D"font-size:11pt;font-family:=E7=AD=89=E7=BA=BF">&gt;
<br>
</span><b><span style=3D"font-size:11pt;font-family:=E7=AD=89=E7=BA=BF">=E5=
=8F=91=E9=80=81=E6=97=B6=E9=97=B4<span lang=3D"EN-US">:</span></span></b><s=
pan lang=3D"EN-US" style=3D"font-size:11pt;font-family:=E7=AD=89=E7=BA=BF">=
 2019</span><span style=3D"font-size:11pt;font-family:=E7=AD=89=E7=BA=BF">=
=E5=B9=B4<span lang=3D"EN-US">7</span>=E6=9C=88<span lang=3D"EN-US">16</spa=
n>=E6=97=A5<span lang=3D"EN-US">
 23:38<br>
</span><b>=E6=94=B6=E4=BB=B6=E4=BA=BA<span lang=3D"EN-US">:</span></b><span=
 lang=3D"EN-US"> Andrew MS1 Peng &lt;</span></span><span lang=3D"EN-US"><a =
href=3D"mailto:pengms1@lenovo.com" target=3D"_blank"><span style=3D"font-si=
ze:11pt;font-family:=E7=AD=89=E7=BA=BF">pengms1@lenovo.com</span></a></span=
><span lang=3D"EN-US" style=3D"font-size:11pt;font-family:=E7=AD=89=E7=BA=
=BF">&gt;<br>
</span><b><span style=3D"font-size:11pt;font-family:=E7=AD=89=E7=BA=BF">=E6=
=8A=84=E9=80=81<span lang=3D"EN-US">:</span></span></b><span lang=3D"EN-US"=
 style=3D"font-size:11pt;font-family:=E7=AD=89=E7=BA=BF">
</span><span lang=3D"EN-US"><a href=3D"mailto:openbmc@lists.ozlabs.org" tar=
get=3D"_blank"><span style=3D"font-size:11pt;font-family:=E7=AD=89=E7=BA=BF=
">openbmc@lists.ozlabs.org</span></a></span><span lang=3D"EN-US" style=3D"f=
ont-size:11pt;font-family:=E7=AD=89=E7=BA=BF">; Duke KH Du &lt;</span><span=
 lang=3D"EN-US"><a href=3D"mailto:dukh@lenovo.com" target=3D"_blank"><span =
style=3D"font-size:11pt;font-family:=E7=AD=89=E7=BA=BF">dukh@lenovo.com</sp=
an></a></span><span lang=3D"EN-US" style=3D"font-size:11pt;font-family:=E7=
=AD=89=E7=BA=BF">&gt;<br>
</span><b><span style=3D"font-size:11pt;font-family:=E7=AD=89=E7=BA=BF">=E4=
=B8=BB=E9=A2=98<span lang=3D"EN-US">:</span></span></b><span lang=3D"EN-US"=
 style=3D"font-size:11pt;font-family:=E7=AD=89=E7=BA=BF"> [External] Re: co=
nfigure error and the image content seems to be incorrect</span><span lang=
=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
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
<p class=3D"gmail-m_2984205525165170508gmail-m-3973244268204610114gmail-m-3=
943518016435637397msolistparagraph" style=3D"margin-left:18pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">1=
.</span><span lang=3D"EN-US" style=3D"font-size:7pt;font-family:&quot;Times=
 New Roman&quot;,serif;color:black">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
</span><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:b=
lack">I downloaded the latest version of phosphor-ipmi-flash to build host =
tool with the SDK environment you provide, but encounter configure error as=
 below, could you help to take a look
 at it?</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<table class=3D"gmail-m_2984205525165170508MsoNormalTable" border=3D"0" cel=
lspacing=3D"0" cellpadding=3D"0" style=3D"margin-left:21pt;border-collapse:=
collapse">
<tbody>
<tr>
<td width=3D"333" valign=3D"top" style=3D"width:250.55pt;border:1pt solid w=
indowtext;background:yellow;padding:0cm 5.4pt">
<p class=3D"gmail-m_2984205525165170508gmail-m-3973244268204610114gmail-m-3=
943518016435637397gmail-m1545270694092823127gmail-m-8411625341099404742msol=
istparagraph">
<b><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black=
">Source code hash id</span></b><span lang=3D"EN-US"><u></u><u></u></span><=
/p>
</td>
<td width=3D"84" valign=3D"top" style=3D"width:124.95pt;border-top:1pt soli=
d windowtext;border-right:1pt solid windowtext;border-bottom:1pt solid wind=
owtext;border-left:none;background:yellow;padding:0cm 5.4pt">
<p class=3D"gmail-m_2984205525165170508gmail-m-3973244268204610114gmail-m-3=
943518016435637397gmail-m1545270694092823127gmail-m-8411625341099404742msol=
istparagraph">
<b><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black=
">Compile Status</span></b><span lang=3D"EN-US"><u></u><u></u></span></p>
</td>
<td width=3D"245" valign=3D"top" style=3D"width:16cm;border-top:1pt solid w=
indowtext;border-right:1pt solid windowtext;border-bottom:1pt solid windowt=
ext;border-left:none;background:yellow;padding:0cm 5.4pt">
<p class=3D"gmail-m_2984205525165170508gmail-m-3973244268204610114gmail-m-3=
943518016435637397gmail-m1545270694092823127gmail-m-8411625341099404742msol=
istparagraph">
<b><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black=
">Error message</span></b><span lang=3D"EN-US"><u></u><u></u></span></p>
</td>
</tr>
<tr>
<td width=3D"333" valign=3D"top" style=3D"width:250.55pt;border-right:1pt s=
olid windowtext;border-bottom:1pt solid windowtext;border-left:1pt solid wi=
ndowtext;border-top:none;padding:0cm 5.4pt">
<p class=3D"gmail-m_2984205525165170508gmail-m-3973244268204610114gmail-m-3=
943518016435637397gmail-m1545270694092823127gmail-m-8411625341099404742msol=
istparagraph">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">b=
90cacdd0c1ab8ea7576d4ca9f20aa5828a84e42</span><span lang=3D"EN-US"><u></u><=
u></u></span></p>
</td>
<td width=3D"84" valign=3D"top" style=3D"width:124.95pt;border-top:none;bor=
der-left:none;border-bottom:1pt solid windowtext;border-right:1pt solid win=
dowtext;padding:0cm 5.4pt">
<p class=3D"gmail-m_2984205525165170508gmail-m-3973244268204610114gmail-m-3=
943518016435637397gmail-m1545270694092823127gmail-m-8411625341099404742msol=
istparagraph">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">c=
onfigure successful</span><span lang=3D"EN-US"><u></u><u></u></span></p>
</td>
<td width=3D"245" valign=3D"top" style=3D"width:16cm;border-top:none;border=
-left:none;border-bottom:1pt solid windowtext;border-right:1pt solid window=
text;padding:0cm 5.4pt">
</td>
</tr>
<tr>
<td width=3D"333" valign=3D"top" style=3D"width:250.55pt;border-right:1pt s=
olid windowtext;border-bottom:1pt solid windowtext;border-left:1pt solid wi=
ndowtext;border-top:none;padding:0cm 5.4pt">
<p class=3D"gmail-m_2984205525165170508gmail-m-3973244268204610114gmail-m-3=
943518016435637397gmail-m1545270694092823127gmail-m-8411625341099404742msol=
istparagraph">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">f=
d182168d9d1c852b1047b9eccea56812b614586<br>
<span style=3D"background:white">1999eef0e6ad3ab4ad6fcf58cce47f352ca5e137<b=
r>
fa06a5f0056e91bfada390c4007fbd3472d75a56<br>
7c2a00e02f1f0169b3e80ef1715002cefc6fa0d0<br>
c9792e75361c86da7f674976eacd03c761021d2f</span></span><span lang=3D"EN-US">=
<u></u><u></u></span></p>
</td>
<td width=3D"84" valign=3D"top" style=3D"width:124.95pt;border-top:none;bor=
der-left:none;border-bottom:1pt solid windowtext;border-right:1pt solid win=
dowtext;padding:0cm 5.4pt">
<p class=3D"gmail-m_2984205525165170508gmail-m-3973244268204610114gmail-m-3=
943518016435637397gmail-m1545270694092823127gmail-m-8411625341099404742msol=
istparagraph">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">c=
onfigure failed</span><span lang=3D"EN-US"><u></u><u></u></span></p>
</td>
<td width=3D"245" valign=3D"top" style=3D"width:16cm;border-top:none;border=
-left:none;border-bottom:1pt solid windowtext;border-right:1pt solid window=
text;padding:0cm 5.4pt">
<p class=3D"gmail-m_2984205525165170508gmail-m-3973244268204610114gmail-m-3=
943518016435637397gmail-m1545270694092823127gmail-m-8411625341099404742msol=
istparagraph">
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
<p class=3D"gmail-m_2984205525165170508gmail-m-3973244268204610114gmail-m-3=
943518016435637397gmail-m1545270694092823127gmail-m-8411625341099404742gmai=
l-m1788754371567513735gmail-m6436252274273416049gmail-m-4871403681716629123=
gmail-m5865277644764564145gmail-m5232517683823064206gmail-m-609179" style=
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
<table class=3D"gmail-m_2984205525165170508MsoNormalTable" border=3D"0" cel=
lspacing=3D"0" cellpadding=3D"0" style=3D"margin-left:18pt;border-collapse:=
collapse">
<tbody>
<tr>
<td width=3D"356" valign=3D"top" style=3D"width:307.65pt;border:1pt solid w=
indowtext;padding:0cm 5.4pt">
<p class=3D"gmail-m_2984205525165170508gmail-m-3973244268204610114gmail-m-3=
943518016435637397gmail-m1545270694092823127gmail-m-8411625341099404742gmai=
l-m1788754371567513735gmail-m6436252274273416049gmail-m-4871403681716629123=
gmail-m5865277644764564145gmail-m5232517683823064206gmail-m-609179">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">I=
mage of host side</span><span lang=3D"EN-US"><u></u><u></u></span></p>
</td>
<td width=3D"309" valign=3D"top" style=3D"width:318.95pt;border-top:1pt sol=
id windowtext;border-right:1pt solid windowtext;border-bottom:1pt solid win=
dowtext;border-left:none;padding:0cm 5.4pt">
<p class=3D"gmail-m_2984205525165170508gmail-m-3973244268204610114gmail-m-3=
943518016435637397gmail-m1545270694092823127gmail-m-8411625341099404742gmai=
l-m1788754371567513735gmail-m6436252274273416049gmail-m-4871403681716629123=
gmail-m5865277644764564145gmail-m5232517683823064206gmail-m-609179">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">I=
mage of BMC side</span><span lang=3D"EN-US"><u></u><u></u></span></p>
</td>
</tr>
<tr>
<td width=3D"356" valign=3D"top" style=3D"width:307.65pt;border-right:1pt s=
olid windowtext;border-bottom:1pt solid windowtext;border-left:1pt solid wi=
ndowtext;border-top:none;padding:0cm 5.4pt">
<p class=3D"gmail-m_2984205525165170508gmail-m-3973244268204610114gmail-m-3=
943518016435637397gmail-m1545270694092823127gmail-m-8411625341099404742gmai=
l-m1788754371567513735gmail-m6436252274273416049gmail-m-4871403681716629123=
gmail-m5865277644764564145gmail-m5232517683823064206gmail-m-609179">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">p=
engms1@hsbmc:/flash_tool$ hexdump -n 64 ./630.mtd
</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"gmail-m_2984205525165170508gmail-m-3973244268204610114gmail-m-3=
943518016435637397gmail-m1545270694092823127gmail-m-8411625341099404742gmai=
l-m1788754371567513735gmail-m6436252274273416049gmail-m-4871403681716629123=
gmail-m5865277644764564145gmail-m5232517683823064206gmail-m-609179">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">0=
000000 00be ea00 f014 e59f f014 e59f f014 e59f</span><span lang=3D"EN-US"><=
u></u><u></u></span></p>
<p class=3D"gmail-m_2984205525165170508gmail-m-3973244268204610114gmail-m-3=
943518016435637397gmail-m1545270694092823127gmail-m-8411625341099404742gmai=
l-m1788754371567513735gmail-m6436252274273416049gmail-m-4871403681716629123=
gmail-m5865277644764564145gmail-m5232517683823064206gmail-m-609179">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">0=
000010 f014 e59f f014 e59f f014 e59f f014 e59f</span><span lang=3D"EN-US"><=
u></u><u></u></span></p>
<p class=3D"gmail-m_2984205525165170508gmail-m-3973244268204610114gmail-m-3=
943518016435637397gmail-m1545270694092823127gmail-m-8411625341099404742gmai=
l-m1788754371567513735gmail-m6436252274273416049gmail-m-4871403681716629123=
gmail-m5865277644764564145gmail-m5232517683823064206gmail-m-609179">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">0=
000020 0060 0000 00c0 0000 0120 0000 0180 0000</span><span lang=3D"EN-US"><=
u></u><u></u></span></p>
<p class=3D"gmail-m_2984205525165170508gmail-m-3973244268204610114gmail-m-3=
943518016435637397gmail-m1545270694092823127gmail-m-8411625341099404742gmai=
l-m1788754371567513735gmail-m6436252274273416049gmail-m-4871403681716629123=
gmail-m5865277644764564145gmail-m5232517683823064206gmail-m-609179">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">0=
000030 01e0 0000 0240 0000 02a0 0000 beef dead</span><span lang=3D"EN-US"><=
u></u><u></u></span></p>
</td>
<td width=3D"309" valign=3D"top" style=3D"width:318.95pt;border-top:none;bo=
rder-left:none;border-bottom:1pt solid windowtext;border-right:1pt solid wi=
ndowtext;padding:0cm 5.4pt">
<p class=3D"gmail-m_2984205525165170508gmail-m-3973244268204610114gmail-m-3=
943518016435637397gmail-m1545270694092823127gmail-m-8411625341099404742gmai=
l-m1788754371567513735gmail-m6436252274273416049gmail-m-4871403681716629123=
gmail-m5865277644764564145gmail-m5232517683823064206gmail-m-609179">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">r=
oot@hr630:~# hexdump -n 64 /run/initramfs/bmc-image</span><span lang=3D"EN-=
US"><u></u><u></u></span></p>
<p class=3D"gmail-m_2984205525165170508gmail-m-3973244268204610114gmail-m-3=
943518016435637397gmail-m1545270694092823127gmail-m-8411625341099404742gmai=
l-m1788754371567513735gmail-m6436252274273416049gmail-m-4871403681716629123=
gmail-m5865277644764564145gmail-m5232517683823064206gmail-m-609179">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">0=
000000 abc4 ef4e 11f2 b128 2538 fd9c 9f7a 2e00</span><span lang=3D"EN-US"><=
u></u><u></u></span></p>
<p class=3D"gmail-m_2984205525165170508gmail-m-3973244268204610114gmail-m-3=
943518016435637397gmail-m1545270694092823127gmail-m-8411625341099404742gmai=
l-m1788754371567513735gmail-m6436252274273416049gmail-m-4871403681716629123=
gmail-m5865277644764564145gmail-m5232517683823064206gmail-m-609179">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">0=
000010 78c4 af6e 01f2 a92a 7438 759c 8e76 2e00</span><span lang=3D"EN-US"><=
u></u><u></u></span></p>
<p class=3D"gmail-m_2984205525165170508gmail-m-3973244268204610114gmail-m-3=
943518016435637397gmail-m1545270694092823127gmail-m-8411625341099404742gmai=
l-m1788754371567513735gmail-m6436252274273416049gmail-m-4871403681716629123=
gmail-m5865277644764564145gmail-m5232517683823064206gmail-m-609179">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">0=
000020 f397 05f0 84e4 6546 0ac6 b6d0 ef19 cb80</span><span lang=3D"EN-US"><=
u></u><u></u></span></p>
<p class=3D"gmail-m_2984205525165170508gmail-m-3973244268204610114gmail-m-3=
943518016435637397gmail-m1545270694092823127gmail-m-8411625341099404742gmai=
l-m1788754371567513735gmail-m6436252274273416049gmail-m-4871403681716629123=
gmail-m5865277644764564145gmail-m5232517683823064206gmail-m-609179">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">0=
000030 e9d7 82f0 c4e4 75dc 1bc6 a295 7319 49c4</span><span lang=3D"EN-US"><=
u></u><u></u></span></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"gmail-m_2984205525165170508gmail-m-3973244268204610114gmail-m-3=
943518016435637397gmail-m1545270694092823127gmail-m-8411625341099404742gmai=
l-m1788754371567513735gmail-m6436252274273416049gmail-m-4871403681716629123=
gmail-m5865277644764564145gmail-m5232517683823064206gmail-m-609179" style=
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
<p class=3D"gmail-m_2984205525165170508gmail-m-3973244268204610114gmail-m-3=
943518016435637397msolistparagraph" style=3D"margin-left:18pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">B=
MC configuration setting:<br>
EXTRA_OECONF +=3D &quot; --enable-reboot-update=C2=A0 --enable-static-layou=
t --enable-aspeed-lpc MAPPED_ADDRESS=3D0x98000000 --enable-reboot-update&qu=
ot;</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"gmail-m_2984205525165170508gmail-m-3973244268204610114gmail-m-3=
943518016435637397msolistparagraph" style=3D"margin-left:18pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">H=
ost tool setting:<br>
./burn_my_bmc --command update --interface ipmilpc --image ./630.mtd --sig =
./sig.txt --type static --address 2550136832 --length 65536</span><span lan=
g=3D"EN-US"><u></u><u></u></span></p>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Is a region of memory on the ho=
st that&#39;s set aside for this purpose and is mapped via /dev/mem.=C2=A0 =
It&#39;s not the address the BMC Is using.=C2=A0 You&#39;ll need to use a
 region reserved for this purpose in the host kernel or bios.<u></u><u></u>=
</span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
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
</blockquote>
</div>
</div>
</div>
</div>

</blockquote></div></div>

--000000000000b3bfad058e0a81b6--
