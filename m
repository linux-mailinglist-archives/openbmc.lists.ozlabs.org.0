Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 753F4111F4
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2019 05:49:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vh8G0KWwzDqSk
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2019 13:49:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="SdjSV+z0"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="PU3vxKkL"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vh7R5cN6zDqPG
 for <openbmc@lists.ozlabs.org>; Thu,  2 May 2019 13:48:19 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0209922F0F;
 Wed,  1 May 2019 23:48:17 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 01 May 2019 23:48:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=cxd2Q
 rruPhfmDzND+CLK3gdJGUuwhbgx98VTWyzMCTw=; b=SdjSV+z0anR6lzV/0MW1v
 OG3Gqh2s8pLFd+Df2L8cXKQVHcrqSuiRBVOxPyHQqpalR6TOuovMtMuc9eAB7yy5
 HUW+5xfUqFbplk8CQfeSuOWH17ka7M6bIAW/xfkJKY6+WeDaQ3TWs0eKsJvZW4oo
 wUDIMp2Y9h8XCAvXbFzP79qnUlMz4OcOP0k9ZH8w6xV6OmfEEYS7n1OedDvIjOzz
 Ehix7bLK9bvpDMBSMHCkUg0JxPbg5afotd3SaxDPDlb9cxKQRerk3af/6aAIvWC+
 4KT6j4YbWm4MT0GIplNJsGV9zamJAX/ek8+kgL0pd1fSypMQjK0whkZPrB0Af20T
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=cxd2QrruPhfmDzND+CLK3gdJGUuwhbgx98VTWyzMC
 Tw=; b=PU3vxKkLNJLU5EiTr/wGkw1hJj8xbx8ehielUjXmVgAH21Hg3OD/nbtRl
 LP3q2OaN9uHSHZ3czhLy/FwK8zfqhuGXz9x2xhgq8Fz3umWzJGz+AIpqWTMe+RoM
 GsBVuohqczj2+VFN9QpBFAb+JDRu161y7x42jJW8mHoNGT33hbzVRuCmH/vwD2AM
 IWy6R1H6sV5NffbPAJlZwfFiHbFSXHI2mNjKTikaBSqY24ueO6vSSspwxVEZ9Xc0
 Mvz9Ga1WG/muQNluqTXodCTxDT91KziaxHnDCFN/hGHlLCV2QS0h/Wu6vh0j6mnh
 e3/UPhJ8MsJm2I2r/3X3PiFJSLjcg==
X-ME-Sender: <xms:gGjKXBJgo_U9xFcYcgDe98FL9lL3V5Zqn47lHkDjBB9Md29_h3q83A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrieekgdeihecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddugedmnecujfgurhepofgfggfkjghffffhvffutgfgsehtqhertder
 reejnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrg
 hjrdhiugdrrghuqeenucffohhmrghinhepohhpvghnsghmtgdqphhrohhjvggtthdrgiih
 iidpshhouhhrtggvfhhorhhgvgdrnhgvthdpghhithhhuhgsrdgtohhmnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfu
 ihiivgeptd
X-ME-Proxy: <xmx:gGjKXBun822ybEQj1YCXlLuiFtGTa6tfkYQr9jjpdFm2hj6_eLOCgw>
 <xmx:gGjKXG3opHAtLK-XtI5JWzZTlIGK7_V3K3oyqjOtd9BEbYO5YQEQPA>
 <xmx:gGjKXJN1QCzwxHeeKS31aQmQnjhcwZNLQdglIFgLDmnR9Qpsr61fMw>
 <xmx:gGjKXFJWAVQgyrED_Lni2su0Fjdyl_ucaQ-qDr2J_shnut9XNMWdrA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E1B697C6D9; Wed,  1 May 2019 23:48:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-449-gfb3fc5a-fmstable-20190430v1
Mime-Version: 1.0
Message-Id: <7994b013-3a31-44ac-a9c5-a28232c91470@www.fastmail.com>
In-Reply-To: <BYAPR02MB58475E4DBCCE9FEB3C5DA17CAE220@BYAPR02MB5847.namprd02.prod.outlook.com>
References: <CAO=notwmhWoeCry_Z+xL=7N1Pp+74tJ9BCF7nr4Jq1MwqRjfOA@mail.gmail.com>
 <BYAPR02MB58478B07866A63D01DA3EB25AE210@BYAPR02MB5847.namprd02.prod.outlook.com>
 <CAO=notzqWthZ29ghauXdzS7Y8WYeVrnMbbmz6Tgt=R6n_mRRAA@mail.gmail.com>
 <BYAPR02MB5847D889707010DEF7F58A95AE220@BYAPR02MB5847.namprd02.prod.outlook.com>
 <CAO=notyZ8Qj96iGYqcPMnkMFSL-Q38-OC8F88oAgpsmu030pxQ@mail.gmail.com>
 <BYAPR02MB58475342BB3F33226E6446C9AE220@BYAPR02MB5847.namprd02.prod.outlook.com>
 <CAJoAoZnBEWP+x_R=55Cp9rh=iyh7QZMqfvMrnWqAjmjQ=qvvGw@mail.gmail.com>
 <BYAPR02MB58475E4DBCCE9FEB3C5DA17CAE220@BYAPR02MB5847.namprd02.prod.outlook.com>
Date: Wed, 01 May 2019 23:48:11 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Mark Brown" <mkbrown32@hotmail.com>,
 "Emily Shaffer" <emilyshaffer@google.com>
Subject: Re: Seeking openbmc programmer's editor info
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Tue, 23 Apr 2019, at 04:14, Mark Brown wrote:
> Thanks for your response.
> Are there updated openbmc build instructions that the new developer
> should follow, posted elsewhere ?
>=20
> Here is the C-scope errors paste,=20
> I sent to someone else here but,  you are right,
> it is unclear whether someone who may post here pervasively
> is more of an administrative person (e.g. git project manager) ,
> and may not be familiar with the issue raised.

When I suggested cscope I did so in the (probably implicit) context of n=
avigating
the C and C++ code that makes up OpenBMC. cscope does not support naviga=
ting
bitbake recipes as far as I'm aware. Your best tools there are `git ls-f=
iles` and
`git grep`. Note that the C and C++ code all resides in separate repos t=
hat are
pointed to by the bitbake recipes.

I hope that clarifies, sorry for any confusion.

Andrew

>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Cscope 15.8a   generated a lot of errors -- maybe Vim  7.4.52  =20
> is not compatible with Ubuntu 14.04.6 .
> Any ideas ?
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> markbmc@markbmc-Precision-5520:~$
> markbmc@markbmc-Precision-5520:~$ wget -P ~/.vim/plugin=20
> http://cscope.sourceforge.net/cscope_maps.vim
> --2019-04-18 01:09:51--  http://cscope.sourceforge.net/cscope_maps.vim=

> Resolving cscope.sourceforge.net (cscope.sourceforge.net)...=20
> 216.105.38.10
> Connecting to cscope.sourceforge.net=20
> (cscope.sourceforge.net)|216.105.38.10|:80... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 7336 (7.2K)
> Saving to: =E2=80=98/home/markbmc/.vim/plugin/cscope_maps.vim=E2=80=99=

>=20
> 100%[=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D>] 7,336       --.-K/s   in 0s
>=20
> 2019-04-18 01:09:51 (1.21 GB/s) -=20
> =E2=80=98/home/markbmc/.vim/plugin/cscope_maps.vim=E2=80=99 saved [733=
6/7336]
>=20
> markbmc@markbmc-Precision-5520:~$
> markbmc@markbmc-Precision-5520:~$
> markbmc@markbmc-Precision-5520:~$
> markbmc@markbmc-Precision-5520:~$ cd openbmc
> markbmc@markbmc-Precision-5520:~/openbmc$
> markbmc@markbmc-Precision-5520:~/openbmc$
> markbmc@markbmc-Precision-5520:~/openbmc$
> markbmc@markbmc-Precision-5520:~/openbmc$ find . -type f -print | grep=
=20
> -E '\.(c(pp)?|h)$' > cscope.files
> markbmc@markbmc-Precision-5520:~/openbmc$ ls -la
> total 124420
> drwxrwxr-x 29 markbmc markbmc      4096 Apr 18 01:30 .
> drwxr-xr-x 22 markbmc markbmc      4096 Apr 18 01:01 ..
> lrwxrwxrwx  1 markbmc markbmc        13 Apr 11 09:45 bitbake ->=20
> poky/bitbake/
> drwxrwxr-x  7 markbmc markbmc      4096 Apr 11 13:35 build
> -rw-rw-r--  1 markbmc markbmc 127253925 Apr 18 01:42 cscope.files
> drwxrwxr-x  8 markbmc markbmc      4096 Apr 11 13:21 .git
> drwxrwxr-x  2 markbmc markbmc      4096 Apr 11 09:45 .github
> -rw-rw-r--  1 markbmc markbmc        31 Apr 11 09:45 .gitignore
> -rw-rw-r--  1 markbmc markbmc       101 Apr 11 09:45 .gitreview
> lrwxrwxrwx  1 markbmc markbmc        12 Apr 11 09:45 LICENSE ->=20
> poky/LICENSE
> -rw-rw-r--  1 markbmc markbmc      2000 Apr 11 09:45 MAINTAINERS
> lrwxrwxrwx  1 markbmc markbmc         9 Apr 11 09:45 meta -> poky/meta=

> drwxrwxr-x  4 markbmc markbmc      4096 Apr 11 09:45 meta-arm
> drwxrwxr-x  6 markbmc markbmc      4096 Apr 11 09:45 meta-aspeed
> drwxrwxr-x  7 markbmc markbmc      4096 Apr 11 09:45 meta-evb
> drwxrwxr-x  4 markbmc markbmc      4096 Apr 11 09:45 meta-facebook
> drwxrwxr-x  5 markbmc markbmc      4096 Apr 11 09:45 meta-google
> drwxrwxr-x  4 markbmc markbmc      4096 Apr 11 09:45 meta-hxt
> drwxrwxr-x  9 markbmc markbmc      4096 Apr 11 09:45 meta-ibm
> drwxrwxr-x  4 markbmc markbmc      4096 Apr 11 09:45 meta-ingrasys
> drwxrwxr-x  5 markbmc markbmc      4096 Apr 11 09:45 meta-inspur
> drwxrwxr-x  5 markbmc markbmc      4096 Apr 11 09:45 meta-intel
> drwxrwxr-x  4 markbmc markbmc      4096 Apr 11 09:45 meta-inventec
> drwxrwxr-x  4 markbmc markbmc      4096 Apr 11 09:45 meta-mellanox
> drwxrwxr-x  5 markbmc markbmc      4096 Apr 11 09:45 meta-nuvoton
> drwxrwxr-x 14 markbmc markbmc      4096 Apr 11 09:45 meta-openembedded=

> drwxrwxr-x  6 markbmc markbmc      4096 Apr 11 09:45 meta-openpower
> drwxrwxr-x 15 markbmc markbmc      4096 Apr 11 09:45 meta-phosphor
> lrwxrwxrwx  1 markbmc markbmc        15 Apr 11 09:45 meta-poky ->=20
> poky/meta-poky/
> drwxrwxr-x  3 markbmc markbmc      4096 Apr 11 09:45 meta-portwell
> drwxrwxr-x  4 markbmc markbmc      4096 Apr 11 09:45 meta-qualcomm
> drwxrwxr-x  7 markbmc markbmc      4096 Apr 11 09:45 meta-quanta
> drwxrwxr-x 17 markbmc markbmc      4096 Apr 11 09:45 meta-raspberrypi
> drwxrwxr-x 14 markbmc markbmc      4096 Apr 11 09:45 meta-security
> lrwxrwxrwx  1 markbmc markbmc        18 Apr 11 09:45 meta-skeleton ->=20=

> poky/meta-skeleton
> drwxrwxr-x  3 markbmc markbmc      4096 Apr 11 09:45 meta-x86
> drwxrwxr-x  5 markbmc markbmc      4096 Apr 11 09:45 meta-xilinx
> lrwxrwxrwx  1 markbmc markbmc        22 Apr 11 09:45 oe-init-build-env=
=20
> -> poky/oe-init-build-env
> -rw-rw-r--  1 markbmc markbmc       327 Apr 11 09:45 openbmc-env
> drwxrwxr-x 10 markbmc markbmc      4096 Apr 11 09:45 poky
> -rw-rw-r--  1 markbmc markbmc      4177 Apr 11 09:45 README.md
> lrwxrwxrwx  1 markbmc markbmc        13 Apr 11 09:45 scripts ->=20
> poky/scripts/
> -rwxrwxr-x  1 markbmc markbmc      1609 Apr 11 09:45 setup
> -rw-rw-r--  1 markbmc markbmc        49 Apr 11 09:45 .templateconf
> markbmc@markbmc-Precision-5520:~/openbmc$
> markbmc@markbmc-Precision-5520:~/openbmc$
> markbmc@markbmc-Precision-5520:~/openbmc$
> markbmc@markbmc-Precision-5520:~/openbmc$ cscope -bq
> cscope: cannot find file=20
> build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-debug-collector/1.=
0+gitAUTOINC+fa180596fe-r1/packages-split/phosphor-debug-collector-src/u=
sr/src/debug/phosphor-debug-collector/1.0+gitAUTOINC+fa180596fe-r1/build=
/xyz/openbmc_project/Dump/Internal
> cscope: cannot find file /Create/server.cpp
> cscope: cannot find file=20
> build/tmp/work/armv6-openbmc-linux-gnueabi/openpower-debug-collector/1=
.0+gitAUTOINC+b618ccbaa7-r1/packages-split/openpower-debug-collector-src=
/usr/src/debug/openpower-debug-collector/1.0+gitAUTOINC+b618ccbaa7-r1/bu=
ild/org/open_power/Host/Boot/error
> cscope: cannot find file .cpp
> cscope: cannot find file=20
> build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-led-manager/1.0+gi=
tAUTOINC+ab3b247f04-r1/packages-split/phosphor-led-manager-src/usr/src/d=
ebug/phosphor-led-manager/1.0+gitAUTOINC+ab3b247f04-r1/build/fault-monit=
or/xyz/openbmc_project/Led/Fru/Mon
> cscope: cannot find file itor/error.cpp
> cscope: cannot find file=20
> build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-led-manager/1.0+gi=
tAUTOINC+ab3b247f04-r1/packages-split/phosphor-led-manager-src/usr/src/d=
ebug/phosphor-led-manager/1.0+gitAUTOINC+ab3b247f04-r1/build/fault-monit=
or/xyz/openbmc_project/Led/Mapper
> cscope: cannot find file error.cpp
> cscope: cannot find file=20
> build/tmp/work/x86_64-linux/gcc-cross-arm/8.3.0-r0/image/home/markbmc/=
openbmc/build/tmp/work/x86_64-linux/gcc-cross-arm/8.3.0-r0/recipe-sysroo=
t-native/usr/lib/arm-openbmc-linux-gnueabi/gcc/arm-openbmc-linux-gnueabi=
/8.3.0/plugin/include/gimple-build
> cscope: cannot find file er.h
> cscope: cannot find file=20
> build/tmp/work/x86_64-linux/gcc-cross-arm/8.3.0-r0/image/home/markbmc/=
openbmc/build/tmp/work/x86_64-linux/gcc-cross-arm/8.3.0-r0/recipe-sysroo=
t-native/usr/lib/arm-openbmc-linux-gnueabi/gcc/arm-openbmc-linux-gnueabi=
/8.3.0/plugin/include/gt-fortran-t
> cscope: cannot find file rans-stmt.h
> cscope: cannot find file=20
> build/tmp/work/x86_64-linux/gcc-cross-arm/8.3.0-r0/image/home/markbmc/=
openbmc/build/tmp/work/x86_64-linux/gcc-cross-arm/8.3.0-r0/recipe-sysroo=
t-native/usr/lib/arm-openbmc-linux-gnueabi/gcc/arm-openbmc-linux-gnueabi=
/8.3.0/plugin/include/gt-cp-method
> cscope: cannot find file .h
> cscope: cannot find file=20
> build/tmp/work/x86_64-linux/gcc-cross-arm/8.3.0-r0/image/home/markbmc/=
openbmc/build/tmp/work/x86_64-linux/gcc-cross-arm/8.3.0-r0/recipe-sysroo=
t-native/usr/lib/arm-openbmc-linux-gnueabi/gcc/arm-openbmc-linux-gnueabi=
/8.3.0/plugin/include/cp/name-look
> ...
> ...
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> ________________________________________
> From: Emily Shaffer <emilyshaffer@google.com>
> Sent: Monday, April 22, 2019 11:03 AM
> To: Mark Brown
> Cc: Patrick Venture; OpenBMC Maillist
> Subject: Re: Seeking openbmc programmer's editor info
>=20
> OpenBMC is cross-compiled to target the embedded chip that it will run=

> on (often an Aspeed or Nuvoton part). I really doubt anybody is doing
> their coding on an AST2400 :) Those stale-Ubuntu-targeted instructions=

> might still work, and if they don't, please let us know which
> libraries are missing.
>=20
> I use a Debian derivative and Vim. However, it's worth noting that
> openbmc/openbmc references a bunch of other Git repos. Bitbake will
> pull these down and build for you, but if you want to edit anything,
> you'll need to either check them out on your own or use devtool.
>=20
> Can you paste the errors you're seeing with C-Scope? (I don't use it,
> but the text of the error might help us suss out what's going wrong.)
>=20
> By the way, even for questions like this, it's better to mail the
> entire list than choose one person at random to ask in a direct email.=

> Later developers may have the same question and your email will help
> answer it for them. :)
>=20
> Welcome to the project!
>=20
> On Mon, Apr 22, 2019 at 9:22 AM Mark Brown <mkbrown32@hotmail.com> wro=
te:
> >
> > On the official github   openbmc/openbmc   page:
> >
> > https://github.com/openbmc/openbmc
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > 1) Prerequisite
> > Ubuntu 14.04
> > sudo apt-get install -y git build-essential libsdl1.2-dev texinfo ga=
wk chrpath diffstat
> > Fedora 28
> > sudo dnf install -y git patch diffstat texinfo chrpath SDL-devel bit=
bake rpcgen
> > sudo dnf groupinstall "C Development Tools and Libraries"
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> >
> > ________________________________________
> > From: Patrick Venture <venture@google.com>
> > Sent: Monday, April 22, 2019 9:16 AM
> > To: Mark Brown
> > Cc: OpenBMC Maillist
> > Subject: Re: Seeking openbmc programmer's editor info
> >
> > + openbmc mailing list
> >
> > On Mon, Apr 22, 2019 at 9:11 AM Mark Brown <mkbrown32@hotmail.com> w=
rote:
> > >
> > > The openbmc build instructions state that Ubuntu 14
> > > should be used.
> > > Are you saying that you read, navigate, modify source code
> > > in a different development platform from the build ?
> >
> > Yes, what documentation are you reading that says to use ubuntu 14?
> > It's likely just out of date.
> >
> > >
> > > Also, someone else mentioned Vim/C-scope -- however, I experience
> > > many "cannot find file" errors and then hangs of the Term window
> > > under C-scope.
> >
> > I don't use C-scope.
> >
> > >
> > >
> > > ________________________________________
> > > From: Patrick Venture <venture@google.com>
> > > Sent: Monday, April 22, 2019 7:26 AM
> > > To: Mark Brown
> > > Subject: Re: Seeking openbmc programmer's editor info
> > >
> > > I don't use Ubuntu 14, but generally grep/sed/vim are used most.
> > >
> > > On Sat, Apr 20, 2019 at 5:30 PM Mark Brown <mkbrown32@hotmail.com>=
 wrote:
> > > >
> > > > I am a firmware guy watching the traffic on this email list.
> > > > I am interested to know what programmer's editor is most useful,=

> > > > under Ubuntu 14,
> > > > to navigate and read the source code here, perform multi-file se=
arches,
> > > > and help find bugs.
> > > > Which editor is most commonly used here ?
> > > >
> > > > Mark
> > > >
> > > > ________________________________________
> > > > From: openbmc <openbmc-bounces+mkbrown32=3Dhotmail.com@lists.ozl=
abs.org> on behalf of Patrick Venture <venture@google.com>
> > > > Sent: Friday, April 19, 2019 12:43 PM
> > > > To: Joel Stanley; Brad Bishop; Andrew Jeffery
> > > > Cc: OpenBMC Maillist
> > > > Subject: meta-ingrasys patches required for new merged drivers
> > > >
> > > > If you don't work on or maintain meta-ingrasys/meta-zaius you ca=
n stop
> > > > reading and go on with your Friday. :D
> > > >
> > > > All;
> > > >
> > > > https://gerrit.openbmc-project.xyz/20692 and below are all ready=
-to-go
> > > > and some are required for the meta-aspeed bump staged for
> > > > openbmc/openbmc.
> > > >
> > > > I wanted to throw this into an email to it jumps out more.
> > > >
> > > > Patrick
>=20
>=20
>=20
> --
> Emily Shaffer
>
