Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CA5524495
	for <lists+openbmc@lfdr.de>; Thu, 12 May 2022 06:55:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KzKGD27dbz3bYF
	for <lists+openbmc@lfdr.de>; Thu, 12 May 2022 14:55:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=NqGB+gD/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::431;
 helo=mail-wr1-x431.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=NqGB+gD/; dkim-atps=neutral
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KzKFs6N67z3bZB
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2022 14:54:56 +1000 (AEST)
Received: by mail-wr1-x431.google.com with SMTP id m1so5533768wrb.8
 for <openbmc@lists.ozlabs.org>; Wed, 11 May 2022 21:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aEyPPcgkZw0teL2AcjFWstAPzaqGbh2J/gYjTgbYIxA=;
 b=NqGB+gD/KI5JbG4OSOuWLTMlSbhHlLkBsfi1D+f8yx1aW7xGooWUVEneAuWlvAre3P
 pnoqUwdJfBjicRsPcJJ0SBA+7RZw6zcB7fSUFSu0cloM4MhJ/pVXOVZkAolzXsDuBIQB
 JUU8enN7f0G5v1kVI2kgDIdWs1niaqI+WyFwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aEyPPcgkZw0teL2AcjFWstAPzaqGbh2J/gYjTgbYIxA=;
 b=UGtTt2siYhvv+iFMHGe5PI4sv74imrNZkOjoXAT+kB3Kbi9L6cQkf+v3Bfh/Zmvhj9
 duZ1rUpRohLdIDwGLfJpq8BHtvjdFL/dLabHWm8y6w+KcmvaYrko7Ekc/Tigdv8rffcs
 Fqmz5Px5JIzOtNiagRt5RvmgR73yP2sOoP9C+jUmsblQCJ8MMbw7lqlmEedXSAVXc7qt
 2UNuROWTgmnBNTK+lmX4N32S2B9FVo2+gZ3sdjKPe/S7u8sURYwy/1M4+rk5TGC48NzZ
 wTmOkg5UdNoRJvSGVHV4u5Uqn5FcLgRdu4HMnfDKCJC776GGJdv/CDieuAtn7+c0reNS
 MbqA==
X-Gm-Message-State: AOAM532WF+db5q/QpAEIrVb53yMYr64tl1c8S86uvRdboc5D6Sl24unh
 OviLUBEkVblt22Qmzpm0ac5K3//SnubDU+27x64=
X-Google-Smtp-Source: ABdhPJxzLW6o0pICZ7o8uBI+BJY1Ln+XVkNjbk7nvdY/pWZfGpNWk4iiClbjsGLhumDVxO1bUDtw2SLEby1B0YEzigU=
X-Received: by 2002:a5d:6d05:0:b0:20c:64fd:f98a with SMTP id
 e5-20020a5d6d05000000b0020c64fdf98amr25409308wrq.474.1652331292235; Wed, 11
 May 2022 21:54:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220511220542.4394-1-zev@bewilderbeest.net>
 <CACPK8XdYMzsEQXHYwdx7si9SBUhD9xeB+0D2eGgoR-LKosq4Tg@mail.gmail.com>
In-Reply-To: <CACPK8XdYMzsEQXHYwdx7si9SBUhD9xeB+0D2eGgoR-LKosq4Tg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 12 May 2022 04:54:40 +0000
Message-ID: <CACPK8Xe5EAxA8JxZBtqrkDKO3Vd4nCmuZ7sOityYXDF4wZ=CHg@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2] ARM: dts: aspeed: add
 Delta AHE-50DC BMC
To: Zev Weiss <zev@bewilderbeest.net>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 12 May 2022 at 04:40, Joel Stanley <joel@jms.id.au> wrote:
>
> On Wed, 11 May 2022 at 22:05, Zev Weiss <zev@bewilderbeest.net> wrote:
> >
> > The Delta AHE-50DC Open19 power shelf uses a pair of AST1250 BMCs that
> > are mostly compatible with the existing ast2400-evb device tree, with
> > a couple small tweaks for the serial console UART and ethernet MACs.
> >
> > Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> > ---
> >
> > Changes since v1 [0]:
> >  - Disabled spi1, which this system doesn't use [Joel]
>
> Thanks, applied.

I have a script I use for testing:
```
#!/bin/bash

set -e

OBJ=ast2400-obj
CONFIG=evb-ast2400_defconfig
: ${DTB:=ast2400-evb}
IMG="$OBJ/test.img"

make -j8 O="$OBJ" -s clean
make -j8 O="$OBJ" -j8 -s $CONFIG
CROSS_COMPILE=arm-linux-gnueabi- ARCH=arm make -j8 O="$OBJ"  -j8
DEVICE_TREE="$DTB" -s
size "$OBJ/u-boot"

cp "$OBJ/u-boot.bin" "$OBJ/test.img"
truncate -s 32M "$OBJ/test.img"

echo "$CONFIG build complete"
echo "qemu-system-arm -M palmetto-bmc -nographic -drive
file=$IMG,if=mtd,format=raw"
```

DTB=ast2400-ahe-50dc ./build-ast2400.sh

When I boot it in qemu, there's no output:
qemu-system-arm -M palmetto-bmc -nographic -drive
file=ast2400-obj/test.img,if=mtd,format=raw

Have I missed something?

ah, when I boot with -d guest_errors,unimp I see an infinite number of:

 aspeed_soc.io: unimplemented device read  (size 1, offset 0x18e014)

That's UART3, which is your stdout for this board. I guess we can't
boot test in qemu without some changes.
