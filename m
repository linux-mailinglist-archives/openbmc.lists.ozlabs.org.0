Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8D2340988
	for <lists+openbmc@lfdr.de>; Thu, 18 Mar 2021 17:03:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1Wyx2jSQz3bnS
	for <lists+openbmc@lfdr.de>; Fri, 19 Mar 2021 03:03:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=sx0tdi/c;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d;
 helo=mail-pg1-x52d.google.com; envelope-from=shakeebbk@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sx0tdi/c; dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1Wyj3Ywpz30D6
 for <openbmc@lists.ozlabs.org>; Fri, 19 Mar 2021 03:03:08 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id u19so1734725pgh.10
 for <openbmc@lists.ozlabs.org>; Thu, 18 Mar 2021 09:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=bdLNC5J+6xlDj46TSIKRsc2ajvFa7GUKZ5ND2lfuPw4=;
 b=sx0tdi/cVrTJZHeICeproguxSqs2yWMPCeVL5VwfhFVdgKXzeleIc/fFu9XKYUcMFH
 1PIBTkS5TiBkFx4zWbbfZneCiV5s0yrQM+r5tkdrVWPixwXqxv60rMGsiIYSxAx5V1Ka
 dVF+bntoAFh5mlH+tItzz3epVOWXL/wFHsi/Vb7f3NxZlO01EAUN5h3vkbk2cNSD2Bg1
 BOF8UMhGdnbA73aH+civH0xNslJB7muMLN3ObI9t5C46k8ICE7oHfL/yeq0X6eYy+mVi
 6HnhcmXfEMWnkFTv4BUwC1gMka3coVG5/pIDCFnZ3MFiurYAw5iSniHY1lU7LB83NJE1
 Ebbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=bdLNC5J+6xlDj46TSIKRsc2ajvFa7GUKZ5ND2lfuPw4=;
 b=sfOsc1emV+QlNHrAJbe0U+7LWfyb0rY1YcP+0vDAUHSNgqWcW3vYVtX5/Ficg92HuT
 jkvoF+c5KjAMiG9Lo9fcVSXqEqGTEW+kqaAUN+Uri9mK7othVaJln4CoGdD8uRUHRwVR
 TBD82Moz9id8JiVWQ/WGIFZy/VBvDZPGRMzkT0o6J7OkuCqI6NeX8p0q6MWlHBfNyMv8
 Mtgewiv+SFayiVe3ZAFvHv9bdxoaycaJX+0rv3m3OJW3U44oZaZTvsj2RYs60nM8q+IC
 kHdpxTY+601zXCimPQVJq+gtr54Ya+2Yq6ssLvTiPOiFQOhGWefN28vd4oeBIeLPwYbE
 fQCQ==
X-Gm-Message-State: AOAM5327TWUvwi2T8nJjsONWoSHBGrL1iJmmy2O2DShJ4ILuwCHBGmy/
 vJGVH8B/6agvfOzJRaifQemfwqx1JAAZxZpdYhbzk8XeBQ0krA==
X-Google-Smtp-Source: ABdhPJxG0tqjSyI8PGDlDlEwf4HG/BcUyese7qVrBAKkkVG8BNyllZNZe+nOAM/jP/iT52QvdEf0VKL+Hu/zzwMryf4=
X-Received: by 2002:a63:5c3:: with SMTP id 186mr7332182pgf.173.1616083384255; 
 Thu, 18 Mar 2021 09:03:04 -0700 (PDT)
MIME-Version: 1.0
From: Shakeeb B K <shakeebbk@gmail.com>
Date: Thu, 18 Mar 2021 21:32:52 +0530
Message-ID: <CABYu0WivHn9L4hbY0E3k+G_c6RH7bu6NuxwmeSNG90c_A_4Qig@mail.gmail.com>
Subject: [ast2500] aspeed-smc fail with MX25L25635F
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000000bc5d205bdd1bcb1"
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000000bc5d205bdd1bcb1
Content-Type: text/plain; charset="UTF-8"

Hi All,

We are working with Macronix MX25L25635F, and are not able to get spi nor
access working from linux(develop-5.10).
u-boot flash drivers work fine - able to verify the flash contents.
But linux aspeed-smc seems to be having issues, with read calibration
failing all the time
[    1.746960] aspeed-smc 1e620000.spi: Using 50 MHz SPI frequency
[    1.753028] aspeed-smc 1e620000.spi: control register: 000b0641
[    1.758982] aspeed-smc 1e620000.spi: control register changed to:
00000600
[    1.765947] aspeed-smc 1e620000.spi: default control register: 00000600
[    1.772810] aspeed-smc 1e620000.spi: mx25l25635e (32768 Kbytes)
[    1.778773] aspeed-smc 1e620000.spi: CE0 window [ 0x20000000 -
0x22000000 ] 32MB
[    1.786286] aspeed-smc 1e620000.spi: CE1 window [ 0x22000000 -
0x2a000000 ] 128MB
[    1.793873] aspeed-smc 1e620000.spi: write control register: 00120602
[    1.800341] aspeed-smc 1e620000.spi: read control register: 203c0641
[    1.806791] aspeed-smc 1e620000.spi: AHB frequency: 198 MHz
[    1.823440] aspeed-smc 1e620000.spi: Trying HCLK/5 [203c0d41] ...
[    1.831524] aspeed-smc 1e620000.spi:   * [00080000] 0 HCLK delay, 4ns DI
delay : FAIL
[    1.841333] aspeed-smc 1e620000.spi:   * [00000000] 0 HCLK delay, 0ns DI
delay : FAIL
[    1.851152] aspeed-smc 1e620000.spi:   * [00090000] 1 HCLK delay, 4ns DI
delay : FAIL
[    1.860969] aspeed-smc 1e620000.spi:   * [00010000] 1 HCLK delay, 0ns DI
delay : FAIL
[    1.870746] aspeed-smc 1e620000.spi:   * [000a0000] 2 HCLK delay, 4ns DI
delay : FAIL
[    1.880579] aspeed-smc 1e620000.spi:   * [00020000] 2 HCLK delay, 0ns DI
delay : FAIL
[    1.890435] aspeed-smc 1e620000.spi:   * [000b0000] 3 HCLK delay, 4ns DI
delay : FAIL
[    1.900301] aspeed-smc 1e620000.spi:   * [00030000] 3 HCLK delay, 0ns DI
delay : FAIL
[    1.910182] aspeed-smc 1e620000.spi:   * [000c0000] 4 HCLK delay, 4ns DI
delay : FAIL
[    1.920060] aspeed-smc 1e620000.spi:   * [00040000] 4 HCLK delay, 0ns DI
delay : FAIL
[    1.929964] aspeed-smc 1e620000.spi:   * [000d0000] 5 HCLK delay, 4ns DI
delay : FAIL
[    1.939869] aspeed-smc 1e620000.spi:   * [00050000] 5 HCLK delay, 0ns DI
delay : FAIL
[    1.947796] aspeed-smc 1e620000.spi: Trying HCLK/4 [203c0641] ...
[    1.955529] aspeed-smc 1e620000.spi:   * [00008000] 0 HCLK delay, 4ns DI
delay : FAIL
[    1.964998] aspeed-smc 1e620000.spi:   * [00000000] 0 HCLK delay, 0ns DI
delay : FAIL
[    1.974483] aspeed-smc 1e620000.spi:   * [00009000] 1 HCLK delay, 4ns DI
delay : FAIL
[    1.983967] aspeed-smc 1e620000.spi:   * [00001000] 1 HCLK delay, 0ns DI
delay : FAIL
[    1.993475] aspeed-smc 1e620000.spi:   * [0000a000] 2 HCLK delay, 4ns DI
delay : FAIL
[    2.002986] aspeed-smc 1e620000.spi:   * [00002000] 2 HCLK delay, 0ns DI
delay : FAIL
[    2.012508] aspeed-smc 1e620000.spi:   * [0000b000] 3 HCLK delay, 4ns DI
delay : FAIL
[    2.022035] aspeed-smc 1e620000.spi:   * [00003000] 3 HCLK delay, 0ns DI
delay : FAIL
[    2.031581] aspeed-smc 1e620000.spi:   * [0000c000] 4 HCLK delay, 4ns DI
delay : FAIL
[    2.041131] aspeed-smc 1e620000.spi:   * [00004000] 4 HCLK delay, 0ns DI
delay : FAIL
[    2.050639] aspeed-smc 1e620000.spi:   * [0000d000] 5 HCLK delay, 4ns DI
delay : FAIL
[    2.060203] aspeed-smc 1e620000.spi:   * [00005000] 5 HCLK delay, 0ns DI
delay : FAIL
[    2.068116] aspeed-smc 1e620000.spi: No good frequency, using dumb slow
[    2.077460] 5 fixed-partitions partitions found on MTD device bmc
[    2.083721] Creating 5 MTD partitions on "bmc":
[    2.088289] 0x000000000000-0x000000060000 : "u-boot"
[    2.096067] 0x000000060000-0x000000080000 : "u-boot-env"
[    2.104054] 0x000000080000-0x0000004c0000 : "kernel"
[    2.111699] 0x0000004c0000-0x000001c00000 : "rofs"
[    2.119091] 0x000001c00000-0x000002000000 : "rwfs"
...
rofs = mtd4 squashfs rwfs = mtd5 jffs2
mount: mounting /dev/mtdblock4 on run/initramfs/ro failed: Invalid argument
[    3.654132] jffs2: Node totlen on flash (0xffffffff) != totlen from node
ref (0x0000000c)
[    3.685843] jffs2: Node totlen on flash (0xffffffff) != totlen from node
ref (0x00000044)
[    3.694229] overlayfs: upper fs does not support tmpfile.
[    3.699946] jffs2: Node totlen on flash (0xffffffff) != totlen from node
ref (0x0000002c)
[    3.708309] jffs2: Node totlen on flash (0xffffffff) != totlen from node
ref (0x00000044)
[    3.716672] overlayfs: upper fs does not support RENAME_WHITEOUT.
[    3.722885] overlayfs: upper fs does not support xattr, falling back to
index=off and metacopy=off.
chroot: can't execute '/bin/sh': No such file or directory

Unable to confirm /sbin/init is an executable non-empty file
in merged file system mounted at /root.

Found a related discussion on
https://lists.ozlabs.org/pipermail/openbmc/2019-April/015925.html,
but the workaround mentioned there - to drop read calibration with
*optimize_read=false
*didn't help.
FYI - Able to boot the same image from tftpboot and qemu.

Has anyone come across similar issue or any suggestions to try out?

Thanks,
Shakeeb

--0000000000000bc5d205bdd1bcb1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<br><div><br></div><div>We are working with Macroni=
x=C2=A0MX25L25635F, and are not able to get spi nor access working from lin=
ux(develop-5.10).</div><div>u-boot flash drivers work fine - able to verify=
 the flash contents.</div><div>But linux aspeed-smc seems to be having=C2=
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
labs.org/pipermail/openbmc/2019-April/015925.html">https://lists.ozlabs.org=
/pipermail/openbmc/2019-April/015925.html</a>,=C2=A0</div><div>but the work=
around mentioned there - to drop read calibration with=C2=A0<i>optimize_rea=
d=3Dfalse </i>didn&#39;t help.</div><div>FYI - Able to boot the same image =
from tftpboot=C2=A0and qemu.</div><div><br></div><div>Has anyone come acros=
s similar issue or any suggestions to try out?</div><div><br></div><div>Tha=
nks,</div><div>Shakeeb</div><div><br></div></div>

--0000000000000bc5d205bdd1bcb1--
