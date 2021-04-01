Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AD0351334
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 12:18:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9zfR1P6Cz3bdF
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 21:18:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=oR202F+n;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=shakeebbk@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oR202F+n; dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9zfB5fDGz2y6F
 for <openbmc@lists.ozlabs.org>; Thu,  1 Apr 2021 21:18:10 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id c17so1145476pfn.6
 for <openbmc@lists.ozlabs.org>; Thu, 01 Apr 2021 03:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8tH3LHqAHGxJ4BYd3W+Xgo8zq0FA9bTfcG77VrBvhUc=;
 b=oR202F+nJLE8GS/+w7vfwbyejYSfMRt4yCkuc1YzMlDa0t3GCbY7/7YHRxfJPQNcxb
 V/vCPv5PmCyl6bm9MSOkrWvpASx4VYyjO4Fuici7AI8X9M++dN7H0x5iNBlb78mtNdq7
 Z+R0SwIF+MEWNE/ke0DIuMZmz0H6Z+cruD0HEG0LRyZbdnV5rUYwb7LUHzhexME+Ujiq
 /kySeApWOKwplhCnUvynW1ESEWUJ2LS6Mc47lpxnPzQRBWyJh3AqXnnLb94l05tAE0P2
 fLDR30QzGMPh/tFEC7oJ3ltExyN+ICA9Cpw87yBJl8RwM3K8kMomgiSBoUeVNuGD0Nb/
 kCRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8tH3LHqAHGxJ4BYd3W+Xgo8zq0FA9bTfcG77VrBvhUc=;
 b=ePjqCauhCgpLJYXw2RvDiYUvh1fEo3RfH1oamNO2TQg9K1SJfZA0/2XC6wsQtTrYI4
 MxMkNtfROx7JQebvKBAxmYKYBT53sATXQ/Ife3u7m3Hr0UuJZ17nruKK5eQpbm8D4EFz
 axA9B7CB37uAPXXHVvzsX0qkFoosppd6KYe7uu6PJDNC9ekbizK94wXz8D/JZJTQq1+u
 tbVwLRB7wEyCceIb7xrjtIEZ6Jgj6C8NcKgTh++xwh7Qug6tkxHSi1tNx833f1JUR4CZ
 xOHa1ztBB72CcmnGCY+qHHmV/UK4/NnKV9JEn+KtCbLz05dsS7zLTFClXDR8L1zqZkAw
 yc7w==
X-Gm-Message-State: AOAM530OIPXyeGS3VrFvi1+pA05+aQE7/tDJHvPIN1+yla32ux+7PpWh
 hORKWWd9qPB1VHnDuseKn4RCjp6Hg0+WuOPjtJTcct1gQOk=
X-Google-Smtp-Source: ABdhPJwiMJKMgoPOHwqWtFE+cMR0T7K7Nh5uoA98l70zsq14TZ9zo6aWthG0wc3NoCMjvkmkGk10H+755wnWza+thI0=
X-Received: by 2002:aa7:8a4d:0:b029:211:92f2:658c with SMTP id
 n13-20020aa78a4d0000b029021192f2658cmr7023474pfa.29.1617272287012; Thu, 01
 Apr 2021 03:18:07 -0700 (PDT)
MIME-Version: 1.0
References: <CABYu0WivHn9L4hbY0E3k+G_c6RH7bu6NuxwmeSNG90c_A_4Qig@mail.gmail.com>
In-Reply-To: <CABYu0WivHn9L4hbY0E3k+G_c6RH7bu6NuxwmeSNG90c_A_4Qig@mail.gmail.com>
From: Shakeeb B K <shakeebbk@gmail.com>
Date: Thu, 1 Apr 2021 15:47:54 +0530
Message-ID: <CABYu0WhxPKePtGMGPojguaTJu21hMq4S=j6_5qRz5kPZC4yfFQ@mail.gmail.com>
Subject: Re: [ast2500] aspeed-smc fail with MX25L25635F
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000002c296805bee68c64"
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
Cc: Cedric Le Goater <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000002c296805bee68c64
Content-Type: text/plain; charset="UTF-8"

Hi All,

We figured that the issue here is with part MX25L25635F not supporting 4B
dual mode opcode - 0x3c. It instead uses 0x3b.

aspeed-smc enables dual mode by default with SNOR_HWCAPS_READ_1_1_2 in the
setup,
and hence disabling dual mode from  flash_info table in spi-nor is not
helpful.

I see that there is no way to override opcode in spi-nor framework either.
There are a couple of queries here -
1. Why is SNOR_HWCAPS_READ_1_1_2 enabled by default in aspeed-smc, while we
could have done with the flash_info table?
2. Can there be an extension in spi-nor to support read opcode override?

Any thoughts on what would be the preferred fix?

Thanks,
Shakeeb

On Thu, Mar 18, 2021 at 9:32 PM Shakeeb B K <shakeebbk@gmail.com> wrote:

> Hi All,
>
> We are working with Macronix MX25L25635F, and are not able to get spi nor
> access working from linux(develop-5.10).
> u-boot flash drivers work fine - able to verify the flash contents.
> But linux aspeed-smc seems to be having issues, with read calibration
> failing all the time
> [    1.746960] aspeed-smc 1e620000.spi: Using 50 MHz SPI frequency
> [    1.753028] aspeed-smc 1e620000.spi: control register: 000b0641
> [    1.758982] aspeed-smc 1e620000.spi: control register changed to:
> 00000600
> [    1.765947] aspeed-smc 1e620000.spi: default control register: 00000600
> [    1.772810] aspeed-smc 1e620000.spi: mx25l25635e (32768 Kbytes)
> [    1.778773] aspeed-smc 1e620000.spi: CE0 window [ 0x20000000 -
> 0x22000000 ] 32MB
> [    1.786286] aspeed-smc 1e620000.spi: CE1 window [ 0x22000000 -
> 0x2a000000 ] 128MB
> [    1.793873] aspeed-smc 1e620000.spi: write control register: 00120602
> [    1.800341] aspeed-smc 1e620000.spi: read control register: 203c0641
> [    1.806791] aspeed-smc 1e620000.spi: AHB frequency: 198 MHz
> [    1.823440] aspeed-smc 1e620000.spi: Trying HCLK/5 [203c0d41] ...
> [    1.831524] aspeed-smc 1e620000.spi:   * [00080000] 0 HCLK delay, 4ns
> DI delay : FAIL
> [    1.841333] aspeed-smc 1e620000.spi:   * [00000000] 0 HCLK delay, 0ns
> DI delay : FAIL
> [    1.851152] aspeed-smc 1e620000.spi:   * [00090000] 1 HCLK delay, 4ns
> DI delay : FAIL
> [    1.860969] aspeed-smc 1e620000.spi:   * [00010000] 1 HCLK delay, 0ns
> DI delay : FAIL
> [    1.870746] aspeed-smc 1e620000.spi:   * [000a0000] 2 HCLK delay, 4ns
> DI delay : FAIL
> [    1.880579] aspeed-smc 1e620000.spi:   * [00020000] 2 HCLK delay, 0ns
> DI delay : FAIL
> [    1.890435] aspeed-smc 1e620000.spi:   * [000b0000] 3 HCLK delay, 4ns
> DI delay : FAIL
> [    1.900301] aspeed-smc 1e620000.spi:   * [00030000] 3 HCLK delay, 0ns
> DI delay : FAIL
> [    1.910182] aspeed-smc 1e620000.spi:   * [000c0000] 4 HCLK delay, 4ns
> DI delay : FAIL
> [    1.920060] aspeed-smc 1e620000.spi:   * [00040000] 4 HCLK delay, 0ns
> DI delay : FAIL
> [    1.929964] aspeed-smc 1e620000.spi:   * [000d0000] 5 HCLK delay, 4ns
> DI delay : FAIL
> [    1.939869] aspeed-smc 1e620000.spi:   * [00050000] 5 HCLK delay, 0ns
> DI delay : FAIL
> [    1.947796] aspeed-smc 1e620000.spi: Trying HCLK/4 [203c0641] ...
> [    1.955529] aspeed-smc 1e620000.spi:   * [00008000] 0 HCLK delay, 4ns
> DI delay : FAIL
> [    1.964998] aspeed-smc 1e620000.spi:   * [00000000] 0 HCLK delay, 0ns
> DI delay : FAIL
> [    1.974483] aspeed-smc 1e620000.spi:   * [00009000] 1 HCLK delay, 4ns
> DI delay : FAIL
> [    1.983967] aspeed-smc 1e620000.spi:   * [00001000] 1 HCLK delay, 0ns
> DI delay : FAIL
> [    1.993475] aspeed-smc 1e620000.spi:   * [0000a000] 2 HCLK delay, 4ns
> DI delay : FAIL
> [    2.002986] aspeed-smc 1e620000.spi:   * [00002000] 2 HCLK delay, 0ns
> DI delay : FAIL
> [    2.012508] aspeed-smc 1e620000.spi:   * [0000b000] 3 HCLK delay, 4ns
> DI delay : FAIL
> [    2.022035] aspeed-smc 1e620000.spi:   * [00003000] 3 HCLK delay, 0ns
> DI delay : FAIL
> [    2.031581] aspeed-smc 1e620000.spi:   * [0000c000] 4 HCLK delay, 4ns
> DI delay : FAIL
> [    2.041131] aspeed-smc 1e620000.spi:   * [00004000] 4 HCLK delay, 0ns
> DI delay : FAIL
> [    2.050639] aspeed-smc 1e620000.spi:   * [0000d000] 5 HCLK delay, 4ns
> DI delay : FAIL
> [    2.060203] aspeed-smc 1e620000.spi:   * [00005000] 5 HCLK delay, 0ns
> DI delay : FAIL
> [    2.068116] aspeed-smc 1e620000.spi: No good frequency, using dumb slow
> [    2.077460] 5 fixed-partitions partitions found on MTD device bmc
> [    2.083721] Creating 5 MTD partitions on "bmc":
> [    2.088289] 0x000000000000-0x000000060000 : "u-boot"
> [    2.096067] 0x000000060000-0x000000080000 : "u-boot-env"
> [    2.104054] 0x000000080000-0x0000004c0000 : "kernel"
> [    2.111699] 0x0000004c0000-0x000001c00000 : "rofs"
> [    2.119091] 0x000001c00000-0x000002000000 : "rwfs"
> ...
> rofs = mtd4 squashfs rwfs = mtd5 jffs2
> mount: mounting /dev/mtdblock4 on run/initramfs/ro failed: Invalid argument
> [    3.654132] jffs2: Node totlen on flash (0xffffffff) != totlen from
> node ref (0x0000000c)
> [    3.685843] jffs2: Node totlen on flash (0xffffffff) != totlen from
> node ref (0x00000044)
> [    3.694229] overlayfs: upper fs does not support tmpfile.
> [    3.699946] jffs2: Node totlen on flash (0xffffffff) != totlen from
> node ref (0x0000002c)
> [    3.708309] jffs2: Node totlen on flash (0xffffffff) != totlen from
> node ref (0x00000044)
> [    3.716672] overlayfs: upper fs does not support RENAME_WHITEOUT.
> [    3.722885] overlayfs: upper fs does not support xattr, falling back to
> index=off and metacopy=off.
> chroot: can't execute '/bin/sh': No such file or directory
>
> Unable to confirm /sbin/init is an executable non-empty file
> in merged file system mounted at /root.
>
> Found a related discussion on
> https://lists.ozlabs.org/pipermail/openbmc/2019-April/015925.html,
> but the workaround mentioned there - to drop read calibration with *optimize_read=false
> *didn't help.
> FYI - Able to boot the same image from tftpboot and qemu.
>
> Has anyone come across similar issue or any suggestions to try out?
>
> Thanks,
> Shakeeb
>
>

--0000000000002c296805bee68c64
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<br><div><br></div><div>We figured that the issue h=
ere is with=C2=A0part MX25L25635F not supporting 4B dual mode opcode - 0x3c=
. It instead=C2=A0uses=C2=A00x3b.</div><div><br></div><div>aspeed-smc enabl=
es dual mode by default with SNOR_HWCAPS_READ_1_1_2 in the setup,=C2=A0</di=
v><div>and hence disabling dual mode from=C2=A0

flash_info table in spi-nor is not helpful.</div><div><br></div><div>I see =
that there is no way to override opcode in spi-nor framework either.</div><=
div>There are a couple of queries here -</div><div>1. Why is SNOR_HWCAPS_RE=
AD_1_1_2 enabled by default in aspeed-smc, while we could have done with th=
e flash_info table?</div><div>2. Can there be an extension in spi-nor to su=
pport read opcode=C2=A0override?<br></div><div><br></div><div>Any thoughts =
on what would be the preferred fix?=C2=A0<br></div><div><br></div><div>Than=
ks,</div><div>Shakeeb</div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Thu, Mar 18, 2021 at 9:32 PM Shakeeb B K &lt;=
<a href=3D"mailto:shakeebbk@gmail.com" target=3D"_blank">shakeebbk@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><div dir=3D"ltr">Hi All,<br><div><br></div><div>We are working with Macron=
ix=C2=A0MX25L25635F, and are not able to get spi nor access working from li=
nux(develop-5.10).</div><div>u-boot flash drivers work fine - able to verif=
y the flash contents.</div><div>But linux aspeed-smc seems to be having=C2=
=A0issues, with read calibration failing all the time</div><div><font face=
=3D"monospace" size=3D"1">[ =C2=A0 =C2=A01.746960] aspeed-smc 1e620000.spi:=
 Using 50 MHz SPI frequency<br>[ =C2=A0 =C2=A01.753028] aspeed-smc 1e620000=
.spi: control register: 000b0641<br>[ =C2=A0 =C2=A01.758982] aspeed-smc 1e6=
20000.spi: control register changed to: 00000600<br>[ =C2=A0 =C2=A01.765947=
] aspeed-smc 1e620000.spi: default control register: 00000600<br>[ =C2=A0 =
=C2=A01.772810] aspeed-smc 1e620000.spi: mx25l25635e (32768 Kbytes)<br>[ =
=C2=A0 =C2=A01.778773] aspeed-smc 1e620000.spi: CE0 window [ 0x20000000 - 0=
x22000000 ] 32MB<br>[ =C2=A0 =C2=A01.786286] aspeed-smc 1e620000.spi: CE1 w=
indow [ 0x22000000 - 0x2a000000 ] 128MB<br>[ =C2=A0 =C2=A01.793873] aspeed-=
smc 1e620000.spi: write control register: 00120602<br>[ =C2=A0 =C2=A01.8003=
41] aspeed-smc 1e620000.spi: <font color=3D"#9900ff">read control register:=
 203c0641</font><br>[ =C2=A0 =C2=A01.806791] aspeed-smc 1e620000.spi: AHB f=
requency: 198 MHz<br>[ =C2=A0 =C2=A01.823440] aspeed-smc 1e620000.spi: Tryi=
ng HCLK/5 [203c0d41] ...<br>[ =C2=A0 =C2=A01.831524] aspeed-smc 1e620000.sp=
i: =C2=A0 * [00080000] 0 HCLK delay, 4ns DI delay : FAIL<br>[ =C2=A0 =C2=A0=
1.841333] aspeed-smc 1e620000.spi: =C2=A0 * [00000000] 0 HCLK delay, 0ns DI=
 delay : FAIL<br>[ =C2=A0 =C2=A01.851152] aspeed-smc 1e620000.spi: =C2=A0 *=
 [00090000] 1 HCLK delay, 4ns DI delay : FAIL<br>[ =C2=A0 =C2=A01.860969] a=
speed-smc 1e620000.spi: =C2=A0 * [00010000] 1 HCLK delay, 0ns DI delay : FA=
IL<br>[ =C2=A0 =C2=A01.870746] aspeed-smc 1e620000.spi: =C2=A0 * [000a0000]=
 2 HCLK delay, 4ns DI delay : FAIL<br>[ =C2=A0 =C2=A01.880579] aspeed-smc 1=
e620000.spi: =C2=A0 * [00020000] 2 HCLK delay, 0ns DI delay : FAIL<br>[ =C2=
=A0 =C2=A01.890435] aspeed-smc 1e620000.spi: =C2=A0 * [000b0000] 3 HCLK del=
ay, 4ns DI delay : FAIL<br>[ =C2=A0 =C2=A01.900301] aspeed-smc 1e620000.spi=
: =C2=A0 * [00030000] 3 HCLK delay, 0ns DI delay : FAIL<br>[ =C2=A0 =C2=A01=
.910182] aspeed-smc 1e620000.spi: =C2=A0 * [000c0000] 4 HCLK delay, 4ns DI =
delay : FAIL<br>[ =C2=A0 =C2=A01.920060] aspeed-smc 1e620000.spi: =C2=A0 * =
[00040000] 4 HCLK delay, 0ns DI delay : FAIL<br>[ =C2=A0 =C2=A01.929964] as=
peed-smc 1e620000.spi: =C2=A0 * [000d0000] 5 HCLK delay, 4ns DI delay : FAI=
L<br>[ =C2=A0 =C2=A01.939869] aspeed-smc 1e620000.spi: =C2=A0 * [00050000] =
5 HCLK delay, 0ns DI delay : FAIL<br>[ =C2=A0 =C2=A01.947796] aspeed-smc 1e=
620000.spi: Trying HCLK/4 [203c0641] ...<br>[ =C2=A0 =C2=A01.955529] aspeed=
-smc 1e620000.spi: =C2=A0 * [00008000] 0 HCLK delay, 4ns DI delay : FAIL<br=
>[ =C2=A0 =C2=A01.964998] aspeed-smc 1e620000.spi: =C2=A0 * [00000000] 0 HC=
LK delay, 0ns DI delay : FAIL<br>[ =C2=A0 =C2=A01.974483] aspeed-smc 1e6200=
00.spi: =C2=A0 * [00009000] 1 HCLK delay, 4ns DI delay : FAIL<br>[ =C2=A0 =
=C2=A01.983967] aspeed-smc 1e620000.spi: =C2=A0 * [00001000] 1 HCLK delay, =
0ns DI delay : FAIL<br>[ =C2=A0 =C2=A01.993475] aspeed-smc 1e620000.spi: =
=C2=A0 * [0000a000] 2 HCLK delay, 4ns DI delay : FAIL<br>[ =C2=A0 =C2=A02.0=
02986] aspeed-smc 1e620000.spi: =C2=A0 * [00002000] 2 HCLK delay, 0ns DI de=
lay : FAIL<br>[ =C2=A0 =C2=A02.012508] aspeed-smc 1e620000.spi: =C2=A0 * [0=
000b000] 3 HCLK delay, 4ns DI delay : FAIL<br>[ =C2=A0 =C2=A02.022035] aspe=
ed-smc 1e620000.spi: =C2=A0 * [00003000] 3 HCLK delay, 0ns DI delay : FAIL<=
br>[ =C2=A0 =C2=A02.031581] aspeed-smc 1e620000.spi: =C2=A0 * [0000c000] 4 =
HCLK delay, 4ns DI delay : FAIL<br>[ =C2=A0 =C2=A02.041131] aspeed-smc 1e62=
0000.spi: =C2=A0 * [00004000] 4 HCLK delay, 0ns DI delay : FAIL<br>[ =C2=A0=
 =C2=A02.050639] aspeed-smc 1e620000.spi: =C2=A0 * [0000d000] 5 HCLK delay,=
 4ns DI delay : FAIL<br>[ =C2=A0 =C2=A02.060203] aspeed-smc 1e620000.spi: =
=C2=A0 * [00005000] 5 HCLK delay, 0ns DI delay : FAIL<br>[ =C2=A0 =C2=A02.0=
68116] aspeed-smc 1e620000.spi: <font color=3D"#9900ff">No good frequency, =
using dumb slow</font><br>[ =C2=A0 =C2=A02.077460] 5 fixed-partitions parti=
tions found on MTD device bmc<br>[ =C2=A0 =C2=A02.083721] Creating 5 MTD pa=
rtitions on &quot;bmc&quot;:<br>[ =C2=A0 =C2=A02.088289] 0x000000000000-0x0=
00000060000 : &quot;u-boot&quot;<br>[ =C2=A0 =C2=A02.096067] 0x000000060000=
-0x000000080000 : &quot;u-boot-env&quot;<br>[ =C2=A0 =C2=A02.104054] 0x0000=
00080000-0x0000004c0000 : &quot;kernel&quot;<br>[ =C2=A0 =C2=A02.111699] 0x=
0000004c0000-0x000001c00000 : &quot;rofs&quot;<br>[ =C2=A0 =C2=A02.119091] =
0x000001c00000-0x000002000000 : &quot;rwfs&quot;<br></font></div><div><font=
 face=3D"monospace" size=3D"1">...</font></div><div><font face=3D"monospace=
" size=3D"1">rofs =3D mtd4 squashfs rwfs =3D mtd5 jffs2<br><font color=3D"#=
9900ff">mount: mounting /dev/mtdblock4 on run/initramfs/ro failed: Invalid =
argument</font><br>[ =C2=A0 =C2=A03.654132] jffs2: Node totlen on flash (0x=
ffffffff) !=3D totlen from node ref (0x0000000c)<br>[ =C2=A0 =C2=A03.685843=
] jffs2: Node totlen on flash (0xffffffff) !=3D totlen from node ref (0x000=
00044)<br>[ =C2=A0 =C2=A03.694229] overlayfs: upper fs does not support tmp=
file.<br>[ =C2=A0 =C2=A03.699946] jffs2: Node totlen on flash (0xffffffff) =
!=3D totlen from node ref (0x0000002c)<br>[ =C2=A0 =C2=A03.708309] jffs2: N=
ode totlen on flash (0xffffffff) !=3D totlen from node ref (0x00000044)<br>=
[ =C2=A0 =C2=A03.716672] overlayfs: upper fs does not support RENAME_WHITEO=
UT.<br>[ =C2=A0 =C2=A03.722885] overlayfs: upper fs does not support xattr,=
 falling back to index=3Doff and metacopy=3Doff.<br>chroot: can&#39;t execu=
te &#39;/bin/sh&#39;: No such file or directory</font><br><font face=3D"mon=
ospace" size=3D"1"><br>Unable to confirm /sbin/init is an executable non-em=
pty file<br>in merged file system mounted at /root.</font><br></div><div><b=
r></div><div>Found a related discussion on=C2=A0<a href=3D"https://lists.oz=
labs.org/pipermail/openbmc/2019-April/015925.html" target=3D"_blank">https:=
//lists.ozlabs.org/pipermail/openbmc/2019-April/015925.html</a>,=C2=A0</div=
><div>but the workaround mentioned there - to drop read calibration with=C2=
=A0<i>optimize_read=3Dfalse </i>didn&#39;t help.</div><div>FYI - Able to bo=
ot the same image from tftpboot=C2=A0and qemu.</div><div><br></div><div>Has=
 anyone come across similar issue or any suggestions to try out?</div><div>=
<br></div><div>Thanks,</div><div>Shakeeb</div><div><br></div></div>
</blockquote></div>

--0000000000002c296805bee68c64--
