Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A02323843
	for <lists+openbmc@lfdr.de>; Wed, 24 Feb 2021 09:04:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DlpNV2lszz3cJL
	for <lists+openbmc@lfdr.de>; Wed, 24 Feb 2021 19:04:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=iedAUBAs;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f29;
 helo=mail-qv1-xf29.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=iedAUBAs; dkim-atps=neutral
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DlpNG2G9Lz30MM
 for <openbmc@lists.ozlabs.org>; Wed, 24 Feb 2021 19:04:11 +1100 (AEDT)
Received: by mail-qv1-xf29.google.com with SMTP id k8so630345qvm.6
 for <openbmc@lists.ozlabs.org>; Wed, 24 Feb 2021 00:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=phLqcKpI627ay2DKoioqPnpb1tIorJ/2BejZN1p9VAA=;
 b=iedAUBAswrZ/YP+yVBIbO0PbeA/TitkTQLpQ3kbmgC1Fib6vDFlWeHfh0IQVnbWwrA
 TC5iDkmDuh+7h0LiZF6fjsqvBJeBpBZqP632Fw+71wvgZ/Wq9rg+0tis6zyQGInH/IFR
 vsCQNLU1/Pj79I8MO7fuFAZ0IB0AJHr/mf4pE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=phLqcKpI627ay2DKoioqPnpb1tIorJ/2BejZN1p9VAA=;
 b=BZy6GBjmbAgBm95oeErbkbxcI+TNn/qw5wgB9wUf2HOljk16EKjaNK+Iaio8eq6Kc3
 v2Rj2Mgxhis6KFcL6tKFiHJ+F8JJ3PO8yw9JFbk4/JKWiYy5Y4yZyHvuPnSKCid3sulh
 gyWCQE27Hm1sGLaT/5y91S/kRuPrE5TELXJSGEU81r9jTOL/RCRP/CZVFAhMhvCZhok6
 HaoXW13oxsn510S0CBy0IGjWifX+vyofsCZzFn72PHP2XGQUGAzeXq89Zm6YVyNO5lKA
 4NW4lXqfxIsgXRFjtW0lOq+BEVnwuc5sg1Mfw5cSVUM3mGEP2x9ZuDaC66NkomKAWTIN
 qrpA==
X-Gm-Message-State: AOAM531kBlJaW+5fv+3IeK0z4jiSk8hciCSSWEmkbS/USkQllJhCLpp9
 YZVXmmquu6dclA76SqYlQtjWFSLZ/Lr6UjfwuyM=
X-Google-Smtp-Source: ABdhPJwgAhGSkaeW8RxArD0eXtMStcHC50nUozwIWUNA6GHAy85AG+dR6kTbHwwrbBgedRavG/guODoVT4LAN7UghLY=
X-Received: by 2002:a0c:8304:: with SMTP id j4mr29006805qva.18.1614153848104; 
 Wed, 24 Feb 2021 00:04:08 -0800 (PST)
MIME-Version: 1.0
References: <OFC6D46F57.69575CC5-ON00258681.0002C252-88258681.0004EA2C@notes.na.collabserv.com>
In-Reply-To: <OFC6D46F57.69575CC5-ON00258681.0002C252-88258681.0004EA2C@notes.na.collabserv.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 24 Feb 2021 08:03:56 +0000
Message-ID: <CACPK8XdmbXK4CVfydO5yq4Qka--wT1fR-vuqFKD_rg29fAquMA@mail.gmail.com>
Subject: Re: My kexec test patches for OpenBMC
To: Bruce Mitchell <Bruce.Mitchell@ibm.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 19 Feb 2021 at 00:53, Bruce Mitchell <Bruce.Mitchell@ibm.com> wrote=
:
>
> Hello Joel,
>
> Per your request yesterday, I am emailing the details of my kexec/kdump d=
evelopment efforts.

Thanks. Here's what I tested:

https://github.com/shenki/linux/commits/ast2600-kexec

>
> I am running QEMU
>
> qemu-system-arm --version
> QEMU emulator version 5.2.0 (v5.1.0-3479-g27ca38d3db)

That looks fine. I'm using cedric's tree, but anything that will boot
your kernel is fine.

> qemu-system-arm -d cpu_reset -M tacoma-bmc -kernel /tmp/tmp.y2fpdAXM1h.ke=
rnel -dtb /tmp/tmp.BWkadwNbTf.dtb -initrd /tmp/tmp.jRpFbzfpBs.initrd -drive=
 file=3Dobmc-phosphor-image-witherspoon-tacoma.wic,if=3Dsd,format=3Draw,ind=
ex=3D2 -net nic -net user,hostfwd=3D:127.0.0.1:2222-:22,hostfwd=3D:127.0.0.=
1:2443-:443,hostname=3Dqemu -nographic -append "crashkernel=3D64M console=
=3DttyS4,115200n8 rootwait root=3DPARTLABEL=3Drofs-a"

You could simplify your qemu setup if you want. Here's how I tested:

 $ qemu-system-arm -M tacoma-bmc -nographic -net nic -nic
user,hostfwd=3D::2222-:22,tftp=3D/srv/tftp/ -kernel
aspeed-g5-dev/arch/arm/boot/zImage -dtb
aspeed-g5-dev/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dtb -initrd
~/dev/kernels/misc/rootfs.cpio.xz

This uses a small initramfs with the kexec utility, and has a copy of
the kernel, initrd and dtb inside to make testing easy.

Or, if you want, you can copy files into the system over the ssh port:

I have this in my ~/.ssh/config:

Host qemu
    Hostname localhost
    Port 2222
    User root
    UserKnownHostsFile /dev/null
    StrictHostKeyChecking no

And then you can use scp like this:

scp aspeed-g5-dev/arch/arm/boot/zImage
aspeed-g5-dev/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dtb
/home/joel/dev/kernels/misc/rootfs.cpio.xz  qemu:

> From OpenBMC within QEMU I am using the following to test kexec
>
> kexec -d -l /home/kexec_files/tmp.y2fpdAXM1h.kernel --initrd=3D/home/kexe=
c_files/tmp.jRpFbzfpBs.initrd --dtb=3D/home/kexec_files/tmp.BWkadwNbTf.dtb =
--append=3D"earlycon console=3DttyS4,115200n8 rootwait root=3DPARTLABEL=3Dr=
ofs-a 1 maxcpus=3D1 reset_devices"
> kexec -d -e

Here's how I was running it:

# kexec -l zImage --dtb aspeed-bmc-opp-tacoma.dtb --initrd rootfs.cpio.xz
# kexec -e

I haven't set a new command line, so it uses the command line from the
device tree (console=3DttyS4,115200n8).

With my patch we will not get the secondary CPU:

[    0.039517] ASPEED AST2600 rev A1 (05010303)
[    0.042030] smp: Bringing up secondary CPUs ...
[    1.163950] CPU1: failed to come online
[    1.167999] smp: Brought up 1 node, 1 CPU
[    1.168164] SMP: Total of 1 processors activated (2250.00 BogoMIPS).

That should be the next step in working on the kexec patches. We want
the secondary CPU to be in a state such that the new kernel can take
control as it would in a firmware boot.

Note that this didn't require any changes to the system beyond the
kernel patch. I'm using the same defconfig as we have in the tree.

Cheers,

Joel
