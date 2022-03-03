Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDDA4CBA98
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 10:45:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8R1d6BDGz3c1G
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 20:45:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=iI4c2TOW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::831;
 helo=mail-qt1-x831.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=iI4c2TOW; dkim-atps=neutral
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8R1C4bx4z3bwk
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2022 20:45:17 +1100 (AEDT)
Received: by mail-qt1-x831.google.com with SMTP id 11so4073866qtt.9
 for <openbmc@lists.ozlabs.org>; Thu, 03 Mar 2022 01:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=n3HJMRpsfH5XwRq1Ry3zdSJwj6nfCmNSM2huBp2+do8=;
 b=iI4c2TOWr5UStVOsYIZPE9Y+/Phc+W7snw7n4DdGsrs/zi1HIqO43q21PP6qjmyyEt
 6u189aRO+qlbXfA2m53HwVQQwjDuyIB6mxQL/FcWuEI+aKaTkkwM2RkB739nmgptF7bL
 oKANO7kriCU+O4xkZRuZNrC8JKG8ofRIVKSwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=n3HJMRpsfH5XwRq1Ry3zdSJwj6nfCmNSM2huBp2+do8=;
 b=CaigJyXjHEo2aHSoOM8jBlSg4FVNe2giBgB0bz3S+Q7AVtuK3AZ/19QjwK4BHG1Nif
 olJB0Qaw9THkttnooc5nbFpzFbCvOutZjtDDagC04wUg3mOyLahfG2N8TNltN4CO8WGk
 mtlkvKRq+MgcECssWPceHWHYee/4zutODDqGdcd2MZG92fj04ixQe/y42TCL7w9o/bv1
 aw9TXtcwTTHwTa524vzUCGFoft/rmoq8agDc+R+wqy3NMndMy7kKockY+PBtKta3nVT/
 SHI9pzmK7Mao7ossQViUuAgeE37FmkqB704mzVV6SQ5r8FoX7Fs8rlZV0Q+alwn5R4ZW
 t3wQ==
X-Gm-Message-State: AOAM5318dQW+nagbwO+MGmJ6KcYcnvrf+rp4e9Ga+ljYB6v7WYic/p7g
 Yl/tGTbNzJGvSr/Dy9soY0TPtBpR4ZheFX64u24=
X-Google-Smtp-Source: ABdhPJzWdRffJL9mIJAeVLQVl0lOih2bun4BGs5cO0bl0E4dtNdRVRYguXpc01ODg3qkjQu73A5tXciQ9QCM0u6+vIY=
X-Received: by 2002:a05:622a:283:b0:2de:b3a2:b52d with SMTP id
 z3-20020a05622a028300b002deb3a2b52dmr23583760qtw.625.1646300713514; Thu, 03
 Mar 2022 01:45:13 -0800 (PST)
MIME-Version: 1.0
References: <20220214094231.3753686-1-clg@kaod.org>
 <CACPK8XdG=ok4P7Rd-SZ3htPsaXdy76rtMdqgcM6_QM2+fgoeJg@mail.gmail.com>
 <CAHwNHZUMhPeYmev=6Zn+Ay_Le7UBmPurBMokLOB623i0eu2ZOw@mail.gmail.com>
 <CACPK8Xf6Zp7Zeu3wrRFHsctEKXfoYkJhbV+PSby0CmP72LC7aQ@mail.gmail.com>
 <1cbb3001-f7ba-50bf-7184-3aec6342e405@kaod.org>
In-Reply-To: <1cbb3001-f7ba-50bf-7184-3aec6342e405@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 3 Mar 2022 09:45:01 +0000
Message-ID: <CACPK8XftWG2LYu6mPgxjUEBUkeF2nDjC_9C_+Yr56B94CyeAug@mail.gmail.com>
Subject: Re: Call for testing: spi-mem driver for Aspeed SMC controllers
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Lei Yu <yulei.sh@bytedance.com>,
 John Wang <wangzq.jn@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 2 Mar 2022 at 05:45, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 3/1/22 13:20, Joel Stanley wrote:

> > [    0.746796] spi-nor spi0.0: w25q512jv (65536 Kbytes)
> > [    0.808104] spi-aspeed-smc 1e620000.spi: CE0 read buswidth:2 [0x203c=
0641]
> > [    0.862687] spi-nor spi0.1: w25q512jv (65536 Kbytes)
> > [    0.923991] spi-aspeed-smc 1e620000.spi: CE1 read buswidth:2 [0x203c=
0641]
>
>
> On the FMC controller, could you please increase the clock to :
>
>         spi-max-frequency =3D <100000000>;
>
> and check the results ?

+++ b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
@@ -162,7 +162,7 @@ flash@0 {
                status =3D "okay";
                m25p,fast-read;
                label =3D "bmc";
-               spi-max-frequency =3D <50000000>;
+               spi-max-frequency =3D <100000000>;
 #include "openbmc-flash-layout-64.dtsi"
        };

@@ -170,6 +170,7 @@ flash@1 {
                status =3D "okay";
                m25p,fast-read;
                label =3D "alt-bmc";
+               spi-max-frequency =3D <100000000>;
        };
 };



# dmesg |grep spi
[    0.746939] spi-nor spi0.0: w25q512jv (65536 Kbytes)
[    0.904547] spi-aspeed-smc 1e620000.spi: CE0 read buswidth:2 [0x203c0741=
]
[    0.959048] spi-nor spi0.1: w25q512jv (65536 Kbytes)
[    1.116603] spi-aspeed-smc 1e620000.spi: CE1 read buswidth:2 [0x203c0741=
]
[    1.130483] spi-nor spi1.0: w25q256 (32768 Kbytes)
[    1.255015] spi-aspeed-smc 1e630000.spi: CE0 read buswidth:2 [0x203c0741=
]
[    1.269188] spi-nor spi2.0: gd25q256 (32768 Kbytes)
[    1.366623] spi-aspeed-smc 1e631000.spi: CE0 read buswidth:2 [0x203c0741=
]

# fdtget /sys/firmware/fdt /ahb/spi@1e620000/flash@0 spi-max-frequency
100000000
# fdtget /sys/firmware/fdt /ahb/spi@1e620000/flash@0 spi-max-frequency
100000000

l# ./mtd-stress.sh mtd5 mtd6
22+0 records in
22+0 records out
23068672 bytes (23 MB, 22 MiB) copied, 2.39988 s, 9.6 MB/s
28deb0d7b7ac61a3a748661d17caad9b  /tmp/tmp.F0iA2sCa75
Erasing blocks: 352/352 (100%)
Writing data: 22528k/22528k (100%)
Verifying data: 22528k/22528k (100%)

real    2m51.548s
user    0m0.010s
sys     2m46.316s
28deb0d7b7ac61a3a748661d17caad9b  /dev/mtd5

real    0m2.473s
user    0m0.158s
sys     0m2.286s
64+0 records in
64+0 records out
67108864 bytes (67 MB, 64 MiB) copied, 5.34609 s, 12.6 MB/s
33e2d1b6b58feaf69ae03bce376cbad3  /tmp/tmp.bCJiVeGiSh
Erasing blocks: 1024/1024 (100%)
Writing data: 65536k/65536k (100%)
Verifying data: 65536k/65536k (100%)

real    7m50.545s
user    0m0.200s
sys     7m35.033s
33e2d1b6b58feaf69ae03bce376cbad3  /dev/mtd6

real    0m7.187s
user    0m0.485s
sys     0m6.635s


Do we expect it to take the same amount of time?

>
> > [    0.937639] spi-nor spi1.0: w25q256 (32768 Kbytes)
> > [    1.062246] spi-aspeed-smc 1e630000.spi: CE0 read buswidth:2 [0x203c=
0741]
> > [    1.076507] spi-nor spi2.0: gd25q256 (32768 Kbytes)
> > [    1.173951] spi-aspeed-smc 1e631000.spi: CE0 read buswidth:2 [0x203c=
0741]
> >
> > ./mtd-stress.sh mtd5 mtd6 mtd7 mtd8
>
> A good test would be to read from /dev/mtd0 and reflash the resulting fil=
e.
> Keep an external programmer close at hand just in case :)

I did this, while crossing my legs, arms, fingers and toes.

root@apolo:~# ./mtd-stress.sh mtd0
64+0 records in
64+0 records out
67108864 bytes (67 MB, 64 MiB) copied, 5.15611 s, 13.0 MB/s
8a439fdfec504f3e8574c4260d0389ee  /tmp/tmp.kbTNY4G8Qd
Erasing blocks: 1024/1024 (100%)
Writing data: 65536k/65536k (100%)
Verifying data: 5590k/65536k (8%)File does not seem to match flash
data. First mismatch at 0x00573000-0x00575800

real    7m56.061s
user    0m0.050s
sys     7m54.697s
343335c0dc778b95afc83a95307921a7  /dev/mtd0

real    0m7.191s
user    0m0.482s
sys     0m6.597s

Oh no! A failure!

I ran it again and it succeeded. Both tests were with random data. I
wrote to it a third time, this time restoring the original file, and
it succeeded.

Cheers,

Joel
