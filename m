Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAF55A6DE
	for <lists+openbmc@lfdr.de>; Sat, 29 Jun 2019 00:25:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45bBCc3r4bzDqdG
	for <lists+openbmc@lfdr.de>; Sat, 29 Jun 2019 08:25:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="hzRNSznr"; 
 dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45bBC36wdHzDqdG
 for <openbmc@lists.ozlabs.org>; Sat, 29 Jun 2019 08:24:31 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id 81so3649937pfy.13
 for <openbmc@lists.ozlabs.org>; Fri, 28 Jun 2019 15:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n0nWnBCkDcX8CLzzoygePCL8eL6pX1QuvsZzl9OKjoU=;
 b=hzRNSznrVhkOTi1hFgfF0+iWvzQ/T54vkNeagZoPx7sdQ9BlbKqPfOKBdi+MAF3w08
 7lcnoEOtgyjMIUo/tcoKhnX2vYQKsuuc2S+Y6isUSltts4oudb+qfUvG3R6ArB36pLyx
 qV48SPg67KHkZHbOuk0TE1QRu855givpkv1z5O/XceP2FKgEUgmIExBAhlz0RUFa5WBc
 NC2YqmPNx4BZjXjbAUSVwkYn/TdBPET/bEGh9+rj3+ieVRfX4YtopBnQDmFAacCGuuJ0
 gr8H8oKuWR2UTPfaTIZ7y2ZNWyMY+ZQTBaSkd7V80ZHoJWg4YUGwZwF499PqcM/FuMRZ
 qpWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n0nWnBCkDcX8CLzzoygePCL8eL6pX1QuvsZzl9OKjoU=;
 b=eXAQpunhHky2UCJ4X6nsYZdTpTltCz3SvUSp2ZSyM7ytArxYofPPAqrb/WquLjmTGM
 RHzj9j43Saq7B3rshVJxwJTfFFoJGhuwsIOTAP6fXegdkTLrhu6nh7WJ0bpk5xo6ACbe
 KiK2U0P8GdUdOhOtL3lTTUx/xZkcUQOCC51gEuOBXEDx6ai3RhKvQYL8Eul9R9NyBfjB
 wguIp97rSaMLKDEfW6A2U88C2exMOvpU4RHn3JTFFpHI/WUMmrLNPgY3rXlUsRe6IDyk
 VqIZgkkl/tEHAlqghIShPhySbTD+dVQyCKfkmmhUxT79qPQfBx+X2dmOrN2AbyuodSYz
 9Thg==
X-Gm-Message-State: APjAAAUQ7bXUhhnjGi71ncC1zYXoDL4w9t94PRGPaL2PVUukKrQhre7Y
 P7BsLdhilieaq5TN8CuZ5GIdOkZHj10b6ABmcH6uBQ==
X-Google-Smtp-Source: APXvYqx8fFoxFyV6ZcIl+B2Tozzkrj5HdmTWJJqob9tSYNpa5ThXg4WPO80ocjo+vGkVFvEOBpsAyW9IJxEZHLLi/94=
X-Received: by 2002:a63:5b0e:: with SMTP id p14mr11248578pgb.353.1561760667492; 
 Fri, 28 Jun 2019 15:24:27 -0700 (PDT)
MIME-Version: 1.0
References: <26428e13a88d4ea7bcee9c792b892c7c@lenovo.com>
 <CAO=notyr4whyR8TN5awOVTTrQDMU8kXQYiqBAOUR_fU3dZo0cg@mail.gmail.com>
 <CAO=notwh-2iLhAMHbXd8RzvbBgZWAMLkAwGSLwoPyhL=+SAp8g@mail.gmail.com>
 <027a78e697414daaa44d775062fdb93e@lenovo.com>
 <CAO=notzPUQi1qDCUjVFAHKEauXot26jSSuJthXV8O5ya9woLUg@mail.gmail.com>
In-Reply-To: <CAO=notzPUQi1qDCUjVFAHKEauXot26jSSuJthXV8O5ya9woLUg@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 28 Jun 2019 15:24:16 -0700
Message-ID: <CAO=notyf1=t+nrw7sh4TR+cwOCDs=LtXnz3oQZEpj6bFG0RQyQ@mail.gmail.com>
Subject: Re: [External] Re: Clarify some questions about in-band firmware
 update
To: Andrew MS1 Peng <pengms1@lenovo.com>
Content-Type: multipart/alternative; boundary="000000000000cfcc11058c69bd10"
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
 Adriana Kobylak <anoo@us.ibm.com>,
 "benjaminfair@google.com" <benjaminfair@google.com>,
 Duke KH Du <dukh@lenovo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000cfcc11058c69bd10
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2019 at 7:09 AM Patrick Venture <venture@google.com> wrote:

>
>
> On Fri, Jun 28, 2019 at 4:30 AM Andrew MS1 Peng <pengms1@lenovo.com>
> wrote:
>
>> Hi Patrick,
>>
>>
>> I synchronized our Openbmc repository with *upstream* repository then
>> compiled and checked the result yesterday, we can generate *dynamically
>> linked binary but still failed to generate statically linked binary.  *I
>> used *OpenBmc *environment to compile and also created a SDK environment
>> by using x86-64 toolchain (oecore-x86_64-core2-64-toolchain-nodistro.0.s=
h)
>> to compile, the compile result is the same. *It seems to the linker not
>> find the *archive file libpci.a, *could you take a look my problem?
>> Thanks.*
>>
>>
>>
>> *I will get error message when I run the tool in my host platform as
>> below. The** dynamically linked binary** is not convenience to use since
>> I have to modify *rpath and interpreter of already compiled ELF.
>>
>> pengms1@hsbmc: $ ./burn_my_bmc
>>
>> -bash: ./burn_my_bmc: No such file or directory
>>
>> pengms1@hsbmc: $ ldd ./burn_my_bmc
>> *./burn_my_bmc: /lib/x86_64-linux-gnu/libpci.so.3: version `LIBPCI_3.5'
>> not found (required by ./burn_my_bmc)*
>>
>> *       linux-vdso.so.1 =3D>  (0x00007ffcd2363000)*
>>
>> *       libipmiblob.so.0 =3D>
>> /home/pengms1/SDK/OpenBmc/rootfs/lib/libipmiblob.so.0 (0x00007f25d373a00=
0)*
>>
>> *       libpci.so.3 =3D> /lib/x86_64-linux-gnu/libpci.so.3
>> (0x00007f25d3512000)*
>>
>> *       libstdc++.so.6 =3D> /usr/lib/x86_64-linux-gnu/libstdc++.so.6
>> (0x00007f25d3190000)*
>>
>> *       libgcc_s.so.1 =3D> /lib/x86_64-linux-gnu/libgcc_s.so.1
>> (0x00007f25d2f79000)*
>>
>> *       libc.so.6 =3D> /lib/x86_64-linux-gnu/libc.so.6 (0x00007f25d2baf0=
00)*
>>
>> *       libm.so.6 =3D> /lib/x86_64-linux-gnu/libm.so.6 (0x00007f25d28a60=
00)*
>>
>> *       libz.so.1 =3D> /lib/x86_64-linux-gnu/libz.so.1 (0x00007f25d268b0=
00)*
>>
>> *       libresolv.so.2 =3D> /lib/x86_64-linux-gnu/libresolv.so.2
>> (0x00007f25d2470000)*
>>
>> *       libudev.so.1 =3D> /lib/x86_64-linux-gnu/libudev.so.1
>> (0x00007f25d2450000)*
>>
>> *       /lib/ld-linux-x86-64.so.2 =3D> /lib64/ld-linux-x86-64.so.2
>> (0x000055731193b000)*
>>
>> *       librt.so.1 =3D> /lib/x86_64-linux-gnu/librt.so.1
>> (0x00007f25d2247000)*
>>
>> *       libpthread.so.0 =3D> /lib/x86_64-linux-gnu/libpthread.so.0
>> (0x00007f25d202a000)*
>>
>>
>>
>> *The compile error message is below:*
>>
>> x86_64-openbmc-linux-libtool: link: x86_64-openbmc-linux-g++ -m64
>> -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse
>> --sysroot=3D/home/pengms1/openbmc_trunk_x86/build/tmp/work/core2-64-open=
bmc-linux/phosphor-ipmi-flash/0.1+gitAUTOINC+7c79b252c1-r1/recipe-sysroot
>> -std=3Dc++17 -I../../git -O2 -pipe -g -feliminate-unused-debug-types
>> -fmacro-prefix-map=3D/home/pengms1/openbmc_trunk_x86/build/tmp/work/core=
2-64-openbmc-linux/phosphor-ipmi-flash/0.1+gitAUTOINC+7c79b252c1-r1=3D/usr/=
src/debug/phosphor-ipmi-flash/0.1+gitAUTOINC+7c79b252c1-r1
>> -fdebug-prefix-map=3D/home/pengms1/openbmc_trunk_x86/build/tmp/work/core=
2-64-openbmc-linux/phosphor-ipmi-flash/0.1+gitAUTOINC+7c79b252c1-r1=3D/usr/=
src/debug/phosphor-ipmi-flash/0.1+gitAUTOINC+7c79b252c1-r1
>> -fdebug-prefix-map=3D/home/pengms1/openbmc_trunk_x86/build/tmp/work/core=
2-64-openbmc-linux/phosphor-ipmi-flash/0.1+gitAUTOINC+7c79b252c1-r1/recipe-=
sysroot=3D
>> -fdebug-prefix-map=3D/home/pengms1/openbmc_trunk_x86/build/tmp/work/core=
2-64-openbmc-linux/phosphor-ipmi-flash/0.1+gitAUTOINC+7c79b252c1-r1/recipe-=
sysroot-native=3D
>> -fvisibility-inlines-hidden -Wall -Werror -DENABLE_REBOOT_UPDATE
>> -DENABLE_STATIC_LAYOUT -DENABLE_LPC_BRIDGE -DASPEED_LPC -static -o
>> burn_my_bmc burn_my_bmc-main.o  ./.libs/libupdater.a -lipmiblob -lpci
>>
>> |
>> /home/pengms1/openbmc_trunk_x86/build/tmp/work/core2-64-openbmc-linux/ph=
osphor-ipmi-flash/0.1+gitAUTOINC+7c79b252c1-r1/recipe-sysroot-native/usr/bi=
n/x86_64-openbmc-linux/../../libexec/x86_64-openbmc-linux/gcc/x86_64-openbm=
c-linux/9.1.0/ld:
>> *cannot find -lpci*
>>
>
> That's indicating that it couldn't find the pciutils installed.  Like I
> said yesterday, I hadn't tried to build the host-tool in this environment
> and had to clean up the dependency checks for it.  That said, I went
> through and fixed it all and got it to build as expected from a pure ubun=
tu
> docker container.  Those patches are up for review and not yet in OpenBMC=
.
> That said, I dont' know why the lpci might not be found for that
> compilation other than possibly the pciutils recipe is broken.  I found
> yesterday while getting this to work that the instructions on the pciutil=
s
> README weren't quite right for building the library AND installing that
> library.
>
> So I wrote up custom instructions in the README for phosphor-ipmi-flash,
> that patch is under review.
>
> If you want to debut your current environment, you need to see if you can
> find the pkgconfig file and libraries defined:
> https://github.com/pciutils/pciutils/blob/master/lib/libpci.pc.in
>
> Basically search for libpci.pc and then read that file.  Verify the share=
d
> library objects are in the SDK environment.
>
> If you need the libpci archive object for static compilation, that may no=
t
> be installed by default, you'll want to read the pciutils README.
>
>
>>
>>
>> *My OpenBmc build **environment is below.*
>>
>> OpenBmc Setting
>>
>> phosphor-ipmi-flash setting (build *static binary*)
>>
>> Extra setting
>>
>> *Build Configuration:*
>>
>> *BB_VERSION           =3D "1.43.0"*
>>
>> *BUILD_SYS            =3D "x86_64-linux"*
>>
>> *NATIVELSBSTRING      =3D "ubuntu-16.04"*
>>
>> *TARGET_SYS           =3D "x86_64-openbmc-linux"*
>>
>> *MACHINE              =3D "qemux86-64"*
>>
>> *DISTRO               =3D "openbmc-phosphor"*
>>
>> *DISTRO_VERSION       =3D "0.1.2"*
>>
>> *TUNE_FEATURES        =3D "m64 core2"*
>>
>> *TARGET_FPU           =3D ""*
>>
>> EXTRA_OECONF +=3D " --enable-build-host-tool --enable-static-layout
>> --enable-lpc-bridge
>> --enable-aspeed-lpc MAPPED_ADDRESS=3D0x98000000 --enable-reboot-update "
>>
>> EXTRA_OEMAKE +=3D " LDFLAGS=3D-all-static " (Build a *statically linked
>> binary*)
>>
>> DISABLE_STATIC =3D ""  (Build *statically library for *ipmi-blob-tool)
>>
>> phosphor-ipmi-flash setting (build *dynamic binary*)
>>
>> EXTRA_OECONF +=3D " --enable-build-host-tool --enable-static-layout
>> --enable-lpc-bridge
>> --enable-aspeed-lpc MAPPED_ADDRESS=3D0x98000000 --enable-reboot-update "
>>
>>
>>
>> Regards,
>> Andrew
>>
>>
>>
>> *=E5=8F=91=E4=BB=B6=E4=BA=BA:* Patrick Venture <venture@google.com>
>> *=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:* 2019=E5=B9=B46=E6=9C=8827=E6=97=
=A5 9:59
>> *=E6=94=B6=E4=BB=B6=E4=BA=BA:* Andrew MS1 Peng <pengms1@lenovo.com>; Ope=
nBMC Maillist <
>> openbmc@lists.ozlabs.org>
>> *=E6=8A=84=E9=80=81:* Duke KH Du <dukh@lenovo.com>; benjaminfair@google.=
com; Adriana
>> Kobylak <anoo@us.ibm.com>
>> *=E4=B8=BB=E9=A2=98:* [External] Re: Clarify some questions about in-ban=
d firmware update
>>
>>
>>
>>
>>
>>
>>
>> On Wed, Jun 26, 2019 at 7:44 AM Patrick Venture <venture@google.com>
>> wrote:
>>
>>
>>
>>
>>
>> On Wed, Jun 26, 2019 at 4:28 AM Andrew MS1 Peng <pengms1@lenovo.com>
>> wrote:
>>
>> Hi Patrick,
>>
>>
>>
>> I have some questions as below, could you help to clarify. Thanks.
>>
>> 1.      Do you have any plans to support BIOS update in
>> phosphor-ipmi-flash?
>>
>> If the answer is no, we would like to help to add this feature. Could yo=
u
>> give us some advice or clues to implement it.
>>
>>
>>
>> This could be added to the design (first step).
>>
>> I could probably roll out this in a day or two, it's not a difficult
>> extension with a few caveats. We'd have to define new services, such as
>> update_bios.service instead of update_bmc.service.
>>
>>
>>
>> I have some cycles, so I don't mind reviewing the changes required and
>> rolling something out --
>>
>>
>>
>> 2.      The FPGA rom image is embedded in BMC image, we would like to
>> add fpga-update.service and fpga-verify.service in phosphor-ipmi-flash, =
we
>> expect that run both services after update BMC image completely. Do you
>> have any concerns about it?
>>
>>
>>
>> There are a couple things to unpack here.  The FPGA rom is embedded in
>> the BMC image.  How is the BMC updated?  I ask because a machine can (an=
d
>> is expected to) provide its own update_bmc.service implementation.  This
>> service could trigger the fpga-verify and fpga-update services within
>> whatever code is called from the update_bmc service you specify.
>>
>>
>>
>> 3.      How can I make a static executable host tool (burn_my_bmc)?
>> Currently, I can=E2=80=99t to make a *statically linked binary successfu=
lly*,
>> but I have made it before you added p2a function.
>>
>> For the host tool you need to specify very little, you should be able to
>> build it via:
>>
>> ./bootstrap.sh
>>
>> ./configure
>>
>> ./make
>>
>>
>>
>> You will need to checkout and install ipmi-blob-tool first
>> (openbmc/ipmi-blob-tool)
>>
>>
>>
>>
>>
>> ^^ --- those steps should go on the README.  Will add them shortly.
>>
>>
>>
>> Based on different OS environment as below, I would like to have a
>> static executable since *dynamically linked binary can=E2=80=99t work no=
rmally
>> in host OS.*
>>
>> Host OS environment
>>
>> Build environment (OpenBmc)
>>
>> Gcc  v4.8.5
>>
>> Gcc   v8.3.0
>>
>> Glibc  v2.17
>>
>> Glibc  v2.29
>>
>>
>>
>> The bitbake recipe isn't meant to be used for the host tool.  It
>> explicitly disables building the host-tool by default.  You should be ab=
le
>> to check out the repo and build from there.  Let me know if you run into
>> issues with that.
>>
>>
>>
>> 4.      I didn=E2=80=99t find the below service files in source tree, wh=
ere can
>> find default services or should we provide our own services?
>>
>> update_bmc.service
>> verify_image.service
>> prepare_update.service
>>
>>
>>
>> That's correct.  There are currently no default service files.  I am
>> thinking of providing a default prepare_update service in a later CL,
>> however updating the BMC or verifying the image depend entirely on the
>> system -- which makes it difficult to have a default.  In point of fact,
>> there isn't really a valid default phosphor-ipmi-flash build for a BMC.
>> Everything needs to be specified.
>>
>>
>>
>> ^--- I can work on making the ubi bmc option available if the ubi distro
>> feature is enabled, etc -- providing some defaults.
>>
>> ^--- I have a plan to provide a prepare_update.service once I finish
>> testing Aspeed LPC support.
>>
>>
>>
>>
>>
>> I've been reviewing the build process for the host-tool and the configur=
e
>> file and other pieces require the BMC-stuff to be installed first
>> (sdbusplus, etc).  I'm going to cleanup the configure file so that if
>> you're building the host-tool it doesn't try to build the BMC stuff.
>>
>>
>>
>>
>>
>> Regards,
>> Andrew
>>
>>
Andrew, the steps here should work for you to build out the host-tool:
https://github.com/openbmc/phosphor-ipmi-flash#building-and-using-the-host-=
tool

That said, because you requested we support BIOS images too, I'm looking at
re-working some of the blobIDs involved.  That said, the host-tool and BMC
version are locked together.

--000000000000cfcc11058c69bd10
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 28, 2019 at 7:09 AM Patri=
ck Venture &lt;<a href=3D"mailto:venture@google.com">venture@google.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 28, 2019 at 4:30 AM Andrew MS=
1 Peng &lt;<a href=3D"mailto:pengms1@lenovo.com" target=3D"_blank">pengms1@=
lenovo.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">





<div lang=3D"ZH-CN">
<div class=3D"gmail-m_5865277644764564145gmail-m_5232517683823064206WordSec=
tion1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black">Hi Patrick,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black"><br>
I synchronized our Openbmc </span><span lang=3D"EN-US" style=3D"font-family=
:Calibri,sans-serif;color:black;background:white">repository=C2=A0</span><s=
pan lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">wit=
h
</span><em><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;col=
or:black;background:white;font-style:normal">upstream</span></em><span lang=
=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black;background:w=
hite">=C2=A0repository=C2=A0then compiled and
 checked the result yesterday, we can generate </span><em><span lang=3D"EN-=
US" style=3D"font-family:Calibri,sans-serif;color:black;background:white;fo=
nt-style:normal">dynamically linked binary but still failed to generate sta=
tically linked binary.=C2=A0
</span></em><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif">I=
 used
<em><span style=3D"font-family:Calibri,sans-serif;color:black;background:wh=
ite;font-style:normal">OpenBmc
</span></em></span><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-s=
erif">environment</span><span lang=3D"EN-US" style=3D"font-family:Calibri,s=
ans-serif"> to compile and also created a SDK
</span><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif">enviro=
nment by using x86-64 toolchain (<a href=3D"http://oecore-x86_64-core2-64-t=
oolchain-nodistro.0.sh" target=3D"_blank">oecore-x86_64-core2-64-toolchain-=
nodistro.0.sh</a>) to compile, the compile result is the same.
</span><em><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;col=
or:black;background:white;font-style:normal">It seems to the linker not fin=
d the
</span></em><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;le=
tter-spacing:-0.05pt;background:white">archive file libpci.a,
</span><em><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;col=
or:black;background:white;font-style:normal">could you take a look my probl=
em? Thanks.</span></em><em><span lang=3D"EN-US" style=3D"font-family:=E5=AE=
=8B=E4=BD=93;color:black;background:white;font-style:normal"><u></u><u></u>=
</span></em></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:white;font-style:normal"><u></u>=C2=A0<=
u></u></span></em></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:white;font-style:normal">I will get err=
or message when I run the tool in my host platform as below. The</span></em=
><em><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:bla=
ck;background:white;font-style:normal">
 dynamically linked binary</span></em><em><span lang=3D"EN-US" style=3D"fon=
t-family:Calibri,sans-serif;color:black;background:white;font-style:normal"=
> is not convenience to use since I have to modify
</span></em><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;co=
lor:rgb(36,39,41);background:white">rpath and interpreter=C2=A0of already c=
ompiled ELF.
</span><em><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;col=
or:black;background:white;font-style:normal"><u></u><u></u></span></em></p>
<p class=3D"MsoNormal" style=3D"margin-left:12pt"><span lang=3D"EN-US" styl=
e=3D"font-family:Calibri,sans-serif;color:black;background:silver">pengms1@=
hsbmc: $ ./burn_my_bmc
</span><span lang=3D"EN-US" style=3D"background:silver"><u></u><u></u></spa=
n></p>
<p class=3D"MsoNormal" style=3D"margin-left:12pt"><span lang=3D"EN-US" styl=
e=3D"font-family:Calibri,sans-serif;color:black;background:silver">-bash: .=
/burn_my_bmc: No such file or directory<br>
<br>
pengms1@hsbmc: $ ldd ./burn_my_bmc<br>
<em><span style=3D"font-family:Calibri,sans-serif;font-style:normal">./burn=
_my_bmc: /lib/x86_64-linux-gnu/libpci.so.3: version `LIBPCI_3.5&#39; not fo=
und (required by ./burn_my_bmc)</span></em></span><em><span lang=3D"EN-US" =
style=3D"font-family:=E5=AE=8B=E4=BD=93;background:silver;font-style:normal=
"><u></u><u></u></span></em></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:silver;font-style:normal">=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 linux-vdso.so.1 =3D&gt;=C2=A0 (0x00007ffcd2363000)=
<u></u><u></u></span></em></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:silver;font-style:normal">=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 libipmiblob.so.0 =3D&gt; /home/pengms1/SDK/OpenBmc=
/rootfs/lib/libipmiblob.so.0 (0x00007f25d373a000)<u></u><u></u></span></em>=
</p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:silver;font-style:normal">=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 libpci.so.3 =3D&gt; /lib/x86_64-linux-gnu/libpci.s=
o.3 (0x00007f25d3512000)<u></u><u></u></span></em></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:silver;font-style:normal">=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 libstdc++.so.6 =3D&gt; /usr/lib/x86_64-linux-gnu/l=
ibstdc++.so.6 (0x00007f25d3190000)<u></u><u></u></span></em></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:silver;font-style:normal">=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 libgcc_s.so.1 =3D&gt; /lib/x86_64-linux-gnu/libgcc=
_s.so.1 (0x00007f25d2f79000)<u></u><u></u></span></em></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:silver;font-style:normal">=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 libc.so.6 =3D&gt; /lib/x86_64-linux-gnu/libc.so.6 =
(0x00007f25d2baf000)<u></u><u></u></span></em></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:silver;font-style:normal">=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 libm.so.6 =3D&gt; /lib/x86_64-linux-gnu/libm.so.6 =
(0x00007f25d28a6000)<u></u><u></u></span></em></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:silver;font-style:normal">=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 libz.so.1 =3D&gt; /lib/x86_64-linux-gnu/libz.so.1 =
(0x00007f25d268b000)<u></u><u></u></span></em></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:silver;font-style:normal">=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 libresolv.so.2 =3D&gt; /lib/x86_64-linux-gnu/libre=
solv.so.2 (0x00007f25d2470000)<u></u><u></u></span></em></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:silver;font-style:normal">=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 libudev.so.1 =3D&gt; /lib/x86_64-linux-gnu/libudev=
.so.1 (0x00007f25d2450000)<u></u><u></u></span></em></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:silver;font-style:normal">=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 /lib/ld-linux-x86-64.so.2 =3D&gt; /lib64/ld-linux-=
x86-64.so.2 (0x000055731193b000)<u></u><u></u></span></em></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:silver;font-style:normal">=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 librt.so.1 =3D&gt; /lib/x86_64-linux-gnu/librt.so.=
1 (0x00007f25d2247000)<u></u><u></u></span></em></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:silver;font-style:normal">=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 libpthread.so.0 =3D&gt; /lib/x86_64-linux-gnu/libp=
thread.so.0 (0x00007f25d202a000)</span></em><em><span lang=3D"EN-US" style=
=3D"font-family:Calibri,sans-serif;color:black;background:white;font-style:=
normal"><u></u><u></u></span></em></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:=E5=AE=
=8B=E4=BD=93;color:black;background:white;font-style:normal"><u></u>=C2=A0<=
u></u></span></em></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-family:Calibri=
,sans-serif">The compile error message is below:<u></u><u></u></span></b></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif">x86_64-openbmc-linux-libtool: link: x86_64-openbmc-linux-g++ -m64=
 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/peng=
ms1/openbmc_trunk_x86/build/tmp/work/core2-64-openbmc-linux/phosphor-ipmi-f=
lash/0.1+gitAUTOINC+7c79b252c1-r1/recipe-sysroot
 -std=3Dc++17 -I../../git -O2 -pipe -g -feliminate-unused-debug-types -fmac=
ro-prefix-map=3D/home/pengms1/openbmc_trunk_x86/build/tmp/work/core2-64-ope=
nbmc-linux/phosphor-ipmi-flash/0.1+gitAUTOINC+7c79b252c1-r1=3D/usr/src/debu=
g/phosphor-ipmi-flash/0.1+gitAUTOINC+7c79b252c1-r1
 -fdebug-prefix-map=3D/home/pengms1/openbmc_trunk_x86/build/tmp/work/core2-=
64-openbmc-linux/phosphor-ipmi-flash/0.1+gitAUTOINC+7c79b252c1-r1=3D/usr/sr=
c/debug/phosphor-ipmi-flash/0.1+gitAUTOINC+7c79b252c1-r1 -fdebug-prefix-map=
=3D/home/pengms1/openbmc_trunk_x86/build/tmp/work/core2-64-openbmc-linux/ph=
osphor-ipmi-flash/0.1+gitAUTOINC+7c79b252c1-r1/recipe-sysroot=3D
 -fdebug-prefix-map=3D/home/pengms1/openbmc_trunk_x86/build/tmp/work/core2-=
64-openbmc-linux/phosphor-ipmi-flash/0.1+gitAUTOINC+7c79b252c1-r1/recipe-sy=
sroot-native=3D -fvisibility-inlines-hidden -Wall -Werror -DENABLE_REBOOT_U=
PDATE -DENABLE_STATIC_LAYOUT -DENABLE_LPC_BRIDGE
 -DASPEED_LPC -static -o burn_my_bmc burn_my_bmc-main.o=C2=A0 ./.libs/libup=
dater.a -lipmiblob -lpci<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif">| /home/pengms1/openbmc_trunk_x86/build/tmp/work/core2-64-openbmc=
-linux/phosphor-ipmi-flash/0.1+gitAUTOINC+7c79b252c1-r1/recipe-sysroot-nati=
ve/usr/bin/x86_64-openbmc-linux/../../libexec/x86_64-openbmc-linux/gcc/x86_=
64-openbmc-linux/9.1.0/ld:
<b><span style=3D"color:red">cannot find -lpci</span></b></span></p></div><=
/div></blockquote><div><br></div><div>That&#39;s indicating that it couldn&=
#39;t find the pciutils installed.=C2=A0 Like I said yesterday, I hadn&#39;=
t tried to build the host-tool in this environment and had to clean up the =
dependency checks for it.=C2=A0 That said, I went through and fixed it all =
and got it to build as expected from a pure ubuntu docker container.=C2=A0 =
Those patches are up for review and not yet in OpenBMC.=C2=A0 That said, I =
dont&#39; know why the lpci might not be found for that compilation other t=
han possibly the pciutils recipe is broken.=C2=A0 I found yesterday while g=
etting this to work that the instructions on the pciutils README weren&#39;=
t quite right for building the library AND installing that library.</div><d=
iv><br></div><div>So I wrote up custom instructions in the README for phosp=
hor-ipmi-flash, that patch is under review.</div><div><br></div><div>If you=
 want to debut your current environment, you need to see if you can find th=
e pkgconfig file and libraries defined:</div><div><a href=3D"https://github=
.com/pciutils/pciutils/blob/master/lib/libpci.pc.in" target=3D"_blank">http=
s://github.com/pciutils/pciutils/blob/master/lib/libpci.pc.in</a><br></div>=
<div><br></div><div>Basically search for libpci.pc and then read that file.=
=C2=A0 Verify the shared library objects are in the=C2=A0<span lang=3D"EN-U=
S" style=3D"font-family:Calibri,sans-serif">SDK
</span><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif">enviro=
nment.</span></div><div><span lang=3D"EN-US" style=3D"font-family:Calibri,s=
ans-serif"><br></span></div><div><span lang=3D"EN-US" style=3D"font-family:=
Calibri,sans-serif">If you need the libpci archive object for static compil=
ation, that may not be installed by default, you&#39;ll want to read the pc=
iutils README.</span></div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div lang=3D"ZH-CN"><div class=3D"gmail-m_58652776447645=
64145gmail-m_5232517683823064206WordSection1"><p class=3D"MsoNormal"><span =
lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif"><u></u><u></u></spa=
n></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:=E5=AE=
=8B=E4=BD=93;color:black;background:white;font-style:normal"><u></u>=C2=A0<=
u></u></span></em></p>
<p class=3D"MsoNormal"><em><b><span lang=3D"EN-US" style=3D"font-family:Cal=
ibri,sans-serif;color:black;background:white;font-style:normal">My OpenBmc =
build
</span></b></em><b><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-s=
erif">environment is below.</span><span lang=3D"EN-US"><u></u><u></u></span=
></b></p>
<table class=3D"gmail-m_5865277644764564145gmail-m_5232517683823064206MsoTa=
bleGrid" border=3D"1" cellspacing=3D"0" cellpadding=3D"0" style=3D"border-c=
ollapse:collapse;border:none">
<tbody>
<tr>
<td width=3D"251" valign=3D"top" style=3D"width:232.4pt;border:1pt solid wi=
ndowtext;background:yellow;padding:0cm 5.4pt">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif">OpenBmc Setting<u></u><u></u></span></p>
</td>
<td width=3D"310" valign=3D"top" style=3D"width:263.35pt;border-top:1pt sol=
id windowtext;border-right:1pt solid windowtext;border-bottom:1pt solid win=
dowtext;border-left:none;background:yellow;padding:0cm 5.4pt">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif">phosphor-ipmi-flash setting (<span style=3D"color:red">build
<em><span style=3D"font-family:Calibri,sans-serif;background:yellow;font-st=
yle:normal">static binary</span></em></span>)<u></u><u></u></span></p>
</td>
<td width=3D"146" valign=3D"top" style=3D"width:120.5pt;border-top:1pt soli=
d windowtext;border-right:1pt solid windowtext;border-bottom:1pt solid wind=
owtext;border-left:none;background:yellow;padding:0cm 5.4pt">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif">Extra setting
<u></u><u></u></span></p>
</td>
</tr>
<tr style=3D"height:130.5pt">
<td width=3D"251" rowspan=3D"3" valign=3D"top" style=3D"width:232.4pt;borde=
r-right:1pt solid windowtext;border-bottom:1pt solid windowtext;border-left=
:1pt solid windowtext;border-top:none;padding:0cm 5.4pt;height:130.5pt">
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:white;font-style:normal">Build Configur=
ation:</span></em><em><span lang=3D"EN-US" style=3D"font-family:=E5=AE=8B=
=E4=BD=93;color:black;background:white;font-style:normal"><u></u><u></u></s=
pan></em></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:white;font-style:normal">BB_VERSION=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;1.43.0&=
quot;<u></u><u></u></span></em></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:white;font-style:normal">BUILD_SYS=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;x=
86_64-linux&quot;<u></u><u></u></span></em></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:white;font-style:normal">NATIVELSBSTRIN=
G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;ubuntu-16.04&quot;<u></u><u></u><=
/span></em></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:white;font-style:normal">TARGET_SYS=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;x86_64-=
openbmc-linux&quot;<u></u><u></u></span></em></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:white;font-style:normal">MACHINE=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D &quot;qemux86-64&quot;<u></u><u></u></span></em></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:white;font-style:normal">DISTRO=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 =3D &quot;openbmc-phosphor&quot;<u></u><u></u></span></em></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:white;font-style:normal">DISTRO_VERSION=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;0.1.2&quot;<u></u><u></u></s=
pan></em></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:white;font-style:normal">TUNE_FEATURES=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;m64 core2&quot;<u></u>=
<u></u></span></em></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:Calibr=
i,sans-serif;color:black;background:white;font-style:normal">TARGET_FPU=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;&quot;<=
/span></em><span lang=3D"EN-US"><u></u><u></u></span></p>
</td>
<td width=3D"310" valign=3D"top" style=3D"width:263.35pt;border-top:none;bo=
rder-left:none;border-bottom:1pt solid windowtext;border-right:1pt solid wi=
ndowtext;padding:0cm 5.4pt;height:130.5pt">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif">EXTRA_OECONF +=3D &quot; --enable-build-host-tool --enable-static=
-layout --enable-lpc-bridge
<br>
--enable-aspeed-lpc MAPPED_ADDRESS=3D0x98000000 --enable-reboot-update &quo=
t;<br>
<br>
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif">EXTRA_OEMAKE +=3D &quot; LDFLAGS=3D-all-static &quot;
<span style=3D"color:red">(Build a <em><span style=3D"font-family:Calibri,s=
ans-serif;background:white;font-style:normal">statically linked binary</spa=
n></em>)</span><u></u><u></u></span></p>
</td>
<td width=3D"146" rowspan=3D"3" valign=3D"top" style=3D"width:120.5pt;borde=
r-top:none;border-left:none;border-bottom:1pt solid windowtext;border-right=
:1pt solid windowtext;padding:0cm 5.4pt;height:130.5pt">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif">DISABLE_STATIC =3D &quot;&quot;=C2=A0 (<span style=3D"color:red">=
Build
<em><span style=3D"font-family:Calibri,sans-serif;background:white;font-sty=
le:normal">statically library for
</span></em>ipmi-blob-tool)</span><u></u><u></u></span></p>
</td>
</tr>
<tr style=3D"height:23.25pt">
<td width=3D"310" valign=3D"top" style=3D"width:263.35pt;border-top:none;bo=
rder-left:none;border-bottom:1pt solid windowtext;border-right:1pt solid wi=
ndowtext;background:yellow;padding:0cm 5.4pt;height:23.25pt">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif">phosphor-ipmi-flash setting (<span style=3D"color:red">build
<em><span style=3D"font-family:Calibri,sans-serif;background:yellow;font-st=
yle:normal">dynamic binary</span></em></span>)<u></u><u></u></span></p>
</td>
</tr>
<tr style=3D"height:79.75pt">
<td width=3D"310" valign=3D"top" style=3D"width:263.35pt;border-top:none;bo=
rder-left:none;border-bottom:1pt solid windowtext;border-right:1pt solid wi=
ndowtext;padding:0cm 5.4pt;height:79.75pt">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif">EXTRA_OECONF +=3D &quot; --enable-build-host-tool --enable-static=
-layout --enable-lpc-bridge
<br>
--enable-aspeed-lpc MAPPED_ADDRESS=3D0x98000000 --enable-reboot-update &quo=
t;<u></u><u></u></span></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black"><u></u>=
=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black">Regards,<br>
Andrew<u></u><u></u></span></p>
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
=E5=B9=B4<span lang=3D"EN-US">6</span>=E6=9C=88<span lang=3D"EN-US">27</spa=
n>=E6=97=A5<span lang=3D"EN-US">
 9:59<br>
</span><b>=E6=94=B6=E4=BB=B6=E4=BA=BA<span lang=3D"EN-US">:</span></b><span=
 lang=3D"EN-US"> Andrew MS1 Peng &lt;<a href=3D"mailto:pengms1@lenovo.com" =
target=3D"_blank">pengms1@lenovo.com</a>&gt;; OpenBMC Maillist &lt;<a href=
=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs=
.org</a>&gt;<br>
</span><b>=E6=8A=84=E9=80=81<span lang=3D"EN-US">:</span></b><span lang=3D"=
EN-US"> Duke KH Du &lt;<a href=3D"mailto:dukh@lenovo.com" target=3D"_blank"=
>dukh@lenovo.com</a>&gt;; <a href=3D"mailto:benjaminfair@google.com" target=
=3D"_blank">benjaminfair@google.com</a>; Adriana Kobylak &lt;<a href=3D"mai=
lto:anoo@us.ibm.com" target=3D"_blank">anoo@us.ibm.com</a>&gt;<br>
</span><b>=E4=B8=BB=E9=A2=98<span lang=3D"EN-US">:</span></b><span lang=3D"=
EN-US"> [External] Re: Clarify some questions about in-band firmware update=
<u></u><u></u></span></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">On Wed, Jun 26, 2019 at 7:44 AM=
 Patrick Venture &lt;<a href=3D"mailto:venture@google.com" target=3D"_blank=
">venture@google.com</a>&gt; wrote:<u></u><u></u></span></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin:5pt 0c=
m 5pt 4.8pt">
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">On Wed, Jun 26, 2019 at 4:28 AM=
 Andrew MS1 Peng &lt;<a href=3D"mailto:pengms1@lenovo.com" target=3D"_blank=
">pengms1@lenovo.com</a>&gt; wrote:<u></u><u></u></span></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin:5pt 0c=
m 5pt 4.8pt">
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif">Hi Patrick,</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif">=C2=A0</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:black">I have some questions as below, could you help to cla=
rify. Thanks.</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"gmail-m_5865277644764564145gmail-m_5232517683823064206gmail-m-6=
091798217660211465gmail-m-7106965077525685122msolistparagraph" style=3D"mar=
gin-left:18pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">1=
.</span><span lang=3D"EN-US" style=3D"font-size:7pt;font-family:&quot;Times=
 New Roman&quot;,serif;color:black">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
</span><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:b=
lack">Do you have any plans to support BIOS update in phosphor-ipmi-flash?<=
/span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"gmail-m_5865277644764564145gmail-m_5232517683823064206gmail-m-6=
091798217660211465gmail-m-7106965077525685122msolistparagraph" style=3D"mar=
gin-left:18pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">I=
f the answer is no, we would like to help to add this feature. Could you gi=
ve us some advice or clues to implement it.</span><span lang=3D"EN-US"><u><=
/u><u></u></span></p>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">This could be added to the desi=
gn (first step).<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I could probably roll out this =
in a day or two, it&#39;s not a difficult extension with a few caveats. We&=
#39;d have to define new services, such as update_bios.service instead=C2=
=A0of update_bmc.service.<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I have some cycles, so I don&#3=
9;t mind reviewing the changes required and rolling something out --=C2=A0<=
u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin:5pt 0c=
m 5pt 4.8pt">
<div>
<div>
<p class=3D"gmail-m_5865277644764564145gmail-m_5232517683823064206gmail-m-6=
091798217660211465gmail-m-7106965077525685122msolistparagraph" style=3D"mar=
gin-left:18pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">2=
.</span><span lang=3D"EN-US" style=3D"font-size:7pt;font-family:&quot;Times=
 New Roman&quot;,serif;color:black">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
</span><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:b=
lack">The FPGA rom image is embedded in BMC image, we would like to add fpg=
a-update.service and fpga-verify.service in phosphor-ipmi-flash, we expect =
that run both services after update
 BMC image completely. Do you have any concerns about it?</span><span lang=
=3D"EN-US"><u></u><u></u></span></p>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">There are a couple things to un=
pack here.=C2=A0 The FPGA rom is embedded in the BMC image.=C2=A0 How is th=
e BMC updated?=C2=A0 I ask because a machine can (and is expected to) provi=
de its own update_bmc.service implementation.=C2=A0 This
 service could trigger the fpga-verify and fpga-update services within what=
ever code is called from the update_bmc service you specify.<u></u><u></u><=
/span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin:5pt 0c=
m 5pt 4.8pt">
<div>
<div>
<p class=3D"gmail-m_5865277644764564145gmail-m_5232517683823064206gmail-m-6=
091798217660211465gmail-m-7106965077525685122msolistparagraph" style=3D"mar=
gin-left:18pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">3=
.</span><span lang=3D"EN-US" style=3D"font-size:7pt;font-family:&quot;Times=
 New Roman&quot;,serif;color:black">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
</span><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:b=
lack">How can I make a static executable host tool (burn_my_bmc)? Currently=
, I can=E2=80=99t to make a
<em><span style=3D"font-family:Calibri,sans-serif;background:white;font-sty=
le:normal">statically linked binary successfully</span></em>, but I have ma=
de it before you added p2a function.</span><span lang=3D"EN-US"><u></u><u><=
/u></span></p>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">For the host tool you need to s=
pecify very little, you should be able to build it via:<u></u><u></u></span=
></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">./bootstrap.sh<u></u><u></u></s=
pan></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">./configure<u></u><u></u></span=
></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">./make<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">You will need to checkout and i=
nstall ipmi-blob-tool first (openbmc/ipmi-blob-tool)<u></u><u></u></span></=
p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">^^ --- those steps should go on=
 the README.=C2=A0 Will add them shortly.<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin:5pt 0c=
m 5pt 4.8pt">
<div>
<div>
<p class=3D"gmail-m_5865277644764564145gmail-m_5232517683823064206gmail-m-6=
091798217660211465gmail-m-7106965077525685122msolistparagraph" style=3D"mar=
gin-left:18pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif;color:black">B=
ased on different OS
</span><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif">enviro=
nment as below,
<span style=3D"color:black">I would like to have a static executable since =
<em><span style=3D"font-family:Calibri,sans-serif;background:white;font-sty=
le:normal">dynamically linked binary can=E2=80=99t work normally in host OS=
.</span></em></span></span><span lang=3D"EN-US"><u></u><u></u></span></p>
<table class=3D"gmail-m_5865277644764564145gmail-m_5232517683823064206MsoNo=
rmalTable" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D"margin=
-left:18pt;border-collapse:collapse">
<tbody>
<tr>
<td width=3D"288" valign=3D"top" style=3D"width:215.75pt;border:1pt solid w=
indowtext;padding:0cm 5.4pt">
<p class=3D"gmail-m_5865277644764564145gmail-m_5232517683823064206gmail-m-6=
091798217660211465gmail-m-7106965077525685122msolistparagraph">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif">Host OS envir=
onment</span><span lang=3D"EN-US"><u></u><u></u></span></p>
</td>
<td width=3D"288" valign=3D"top" style=3D"width:215.75pt;border-top:1pt sol=
id windowtext;border-right:1pt solid windowtext;border-bottom:1pt solid win=
dowtext;border-left:none;padding:0cm 5.4pt">
<p class=3D"gmail-m_5865277644764564145gmail-m_5232517683823064206gmail-m-6=
091798217660211465gmail-m-7106965077525685122msolistparagraph">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif">Build environ=
ment (OpenBmc)</span><span lang=3D"EN-US"><u></u><u></u></span></p>
</td>
</tr>
<tr>
<td width=3D"288" valign=3D"top" style=3D"width:215.75pt;border-right:1pt s=
olid windowtext;border-bottom:1pt solid windowtext;border-left:1pt solid wi=
ndowtext;border-top:none;padding:0cm 5.4pt">
<p class=3D"gmail-m_5865277644764564145gmail-m_5232517683823064206gmail-m-6=
091798217660211465gmail-m-7106965077525685122msolistparagraph">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif">Gcc=C2=A0 v4.=
8.5</span><span lang=3D"EN-US"><u></u><u></u></span></p>
</td>
<td width=3D"288" valign=3D"top" style=3D"width:215.75pt;border-top:none;bo=
rder-left:none;border-bottom:1pt solid windowtext;border-right:1pt solid wi=
ndowtext;padding:0cm 5.4pt">
<p class=3D"gmail-m_5865277644764564145gmail-m_5232517683823064206gmail-m-6=
091798217660211465gmail-m-7106965077525685122msolistparagraph">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif">Gcc=C2=A0=C2=
=A0 v8.3.0</span><span lang=3D"EN-US"><u></u><u></u></span></p>
</td>
</tr>
<tr>
<td width=3D"288" valign=3D"top" style=3D"width:215.75pt;border-right:1pt s=
olid windowtext;border-bottom:1pt solid windowtext;border-left:1pt solid wi=
ndowtext;border-top:none;padding:0cm 5.4pt">
<p class=3D"gmail-m_5865277644764564145gmail-m_5232517683823064206gmail-m-6=
091798217660211465gmail-m-7106965077525685122msolistparagraph">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif">Glibc=C2=A0 v=
2.17</span><span lang=3D"EN-US"><u></u><u></u></span></p>
</td>
<td width=3D"288" valign=3D"top" style=3D"width:215.75pt;border-top:none;bo=
rder-left:none;border-bottom:1pt solid windowtext;border-right:1pt solid wi=
ndowtext;padding:0cm 5.4pt">
<p class=3D"gmail-m_5865277644764564145gmail-m_5232517683823064206gmail-m-6=
091798217660211465gmail-m-7106965077525685122msolistparagraph">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif">Glibc=C2=A0 v=
2.29</span><span lang=3D"EN-US"><u></u><u></u></span></p>
</td>
</tr>
</tbody>
</table>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The bitbake recipe isn&#39;t me=
ant to be used for the host tool.=C2=A0 It explicitly disables building the=
 host-tool by default.=C2=A0 You should be able to check out the repo and b=
uild from there.=C2=A0 Let me know if you run into issues
 with that.<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin:5pt 0c=
m 5pt 4.8pt">
<div>
<div>
<p class=3D"gmail-m_5865277644764564145gmail-m_5232517683823064206gmail-m-6=
091798217660211465gmail-m-7106965077525685122msolistparagraph" style=3D"mar=
gin-left:18pt">
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif">4.</span><spa=
n lang=3D"EN-US" style=3D"font-size:7pt;font-family:&quot;Times New Roman&q=
uot;,serif">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
</span><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif">I didn=
=E2=80=99t find the below service files in source tree, where can find defa=
ult services or should we provide our own services?
</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"gmail-m_5865277644764564145gmail-m_5232517683823064206gmail-m-6=
091798217660211465gmail-m-7106965077525685122msolistparagraph" style=3D"mar=
gin-left:18pt">
<code><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif">update_=
bmc.service</span></code><span lang=3D"EN-US" style=3D"font-family:Calibri,=
sans-serif"><br>
<code><span style=3D"font-family:Calibri,sans-serif">verify_image.service</=
span></code><br>
<code><span style=3D"font-family:Calibri,sans-serif">prepare_update.service=
</span></code></span><span lang=3D"EN-US"><u></u><u></u></span></p>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">That&#39;s correct.=C2=A0 There=
 are currently no default service files.=C2=A0 I am thinking of providing a=
 default prepare_update service in a later CL, however updating the BMC or =
verifying the image depend entirely on the system
 -- which makes it difficult to have a default.=C2=A0 In point of fact, the=
re isn&#39;t really a valid default phosphor-ipmi-flash build for a BMC.=C2=
=A0 Everything needs to be specified.<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">^--- I can work on making the u=
bi bmc option available if the ubi distro feature is enabled, etc -- provid=
ing some defaults.<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">^--- I have a plan to provide a=
 prepare_update.service once I finish testing Aspeed LPC support.<u></u><u>=
</u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I&#39;ve been reviewing the bui=
ld process for the host-tool and the configure file and other pieces requir=
e the BMC-stuff to be installed first (sdbusplus, etc).=C2=A0 I&#39;m going=
 to cleanup the configure file so that if you&#39;re
 building the host-tool it doesn&#39;t try to build the BMC stuff.=C2=A0<u>=
</u><u></u></span></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin:5pt 0c=
m 5pt 4.8pt">
<div>
<div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin:5pt 0c=
m 5pt 4.8pt">
<div>
<div>
<p class=3D"gmail-m_5865277644764564145gmail-m_5232517683823064206gmail-m-6=
091798217660211465gmail-m-7106965077525685122msolistparagraph" style=3D"mar=
gin-left:18pt">
<span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif">=C2=A0</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif">Regards,<br>
Andrew</span></p></div></div></blockquote></div></div></blockquote></div></=
div></div></div></blockquote></div></div></blockquote><div><br></div><div>A=
ndrew, the steps here should work for you to build out the host-tool:=C2=A0=
<a href=3D"https://github.com/openbmc/phosphor-ipmi-flash#building-and-usin=
g-the-host-tool">https://github.com/openbmc/phosphor-ipmi-flash#building-an=
d-using-the-host-tool</a></div><div><br></div><div>That said, because you r=
equested we support BIOS images too, I&#39;m looking at re-working some of =
the blobIDs involved.=C2=A0 That said, the host-tool and BMC version are lo=
cked together.=C2=A0</div></div></div>

--000000000000cfcc11058c69bd10--
