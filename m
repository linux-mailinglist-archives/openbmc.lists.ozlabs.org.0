Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBA33A0EC2
	for <lists+openbmc@lfdr.de>; Wed,  9 Jun 2021 10:32:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G0L2l47t4z3brv
	for <lists+openbmc@lfdr.de>; Wed,  9 Jun 2021 18:32:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ShwW6dWS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::231;
 helo=mail-oi1-x231.google.com; envelope-from=leetroy@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ShwW6dWS; dkim-atps=neutral
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G0L2S4mnYz301j
 for <openbmc@lists.ozlabs.org>; Wed,  9 Jun 2021 18:32:31 +1000 (AEST)
Received: by mail-oi1-x231.google.com with SMTP id r17so14135852oic.7
 for <openbmc@lists.ozlabs.org>; Wed, 09 Jun 2021 01:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=00rIpfiVFQvXsfbW7QMh51YGY6JzRSYCKEuFALUJx7M=;
 b=ShwW6dWS+D7WUzgUjGs9nV08g85ESQ1D54JW2BDg8AEfAGDEJqYUy1ZHhITYSjBWXB
 AuwZUeSqZCw6xc/JhcoCV6BvvzRGxsEhbRmTQgX2PZrMYIiOr0Ul0F5w4VCZnD/FragD
 JSHWNgLp033o+mvmJZegyDIbPr5dEldPUwNhqBRr1OzC5dmP7HxutzIk3Xxb7L2rKVx3
 Za3pW33RykBDSAPXBNEyigkk+eFLXSSTfYO74QSWlHJtjxQEKurEo6PKTVC471Eo5iUP
 br8yeav76lkodtbQzEt0Hc1UhMpMZ0ii23+64G5Go3Ayg3JvrrECkpwpQNPIYPvU5VlT
 k6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=00rIpfiVFQvXsfbW7QMh51YGY6JzRSYCKEuFALUJx7M=;
 b=cs9Y4BuFiFd2069IyQKKaFTBM+Tq8mprjWSHh20BmryR4MBaFejxUb3u39m+Vc4MPJ
 0lZgWgVSL7qAOGA3UHH7qBxcImZ4sV2LS24lNUaflnTCt2Hj/jkVMHVmAhKvxUXn7R8t
 ykji6zVvOV0hIVdTrpps/C5g/DrbV3uy12k0w5y1dlefykjqPiONAiHyLWTXw6Er/RsE
 eBfNNSOfCnHpkLzqtRS6HA/BoqU3KeIpnt2lxJqEsXt1W+Jt4YhWnP6D5URC3Hm54128
 jZG2MmDW1yBWnC+zShfibTXcTnjV5q93r5jiMclEBrG+H3hnXx+F/NimtCQl+N0qQKsm
 yoSA==
X-Gm-Message-State: AOAM533nqv0Jyx4OU4p3E+w6DM/1xomh91cryp1z6R4DpC6vouWIhCDO
 9r0LY/P6+XrYzQYV0quU3/3jLsJno/aECsR4kG2BEn/P7MAtZw==
X-Google-Smtp-Source: ABdhPJyRSv8D9ajIcMMGVA7KIc3gI2pxTcWexfen6u7I6DQ4lsE3UoMgFHOX1kEPgTCmIsFgSmAiF4DBJBPweH19EK0=
X-Received: by 2002:a05:6808:f0a:: with SMTP id
 m10mr5861508oiw.126.1623227546575; 
 Wed, 09 Jun 2021 01:32:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm54UGMSVkT=3WLVLrJwcW8OGcQJZOGYnhVvOrF1qVC7xtdvA@mail.gmail.com>
 <CACPK8XdVNXSfzDBPryjQh_4S0yU4Tp6VOOtju+L_DcfgHumPJw@mail.gmail.com>
 <CAN9Jwz2aex+rXnK34ni=kzBCruqSsQvM_-hik79SJ_+4+mY9Lg@mail.gmail.com>
 <CAGm54UFwhCKOeH_6BnFS3bDM0QS+RT3QsOM29PFLNw-PRXQorg@mail.gmail.com>
In-Reply-To: <CAGm54UFwhCKOeH_6BnFS3bDM0QS+RT3QsOM29PFLNw-PRXQorg@mail.gmail.com>
From: Troy Lee <leetroy@gmail.com>
Date: Wed, 9 Jun 2021 16:32:15 +0800
Message-ID: <CAN9Jwz3e=37d7TnpWy_gA82h=xVcGPyL4bC3f6TmuQGUfe9OYg@mail.gmail.com>
Subject: Re: Unify the 64MiB flash layout
To: Lei Yu <yulei.sh@bytedance.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>,
 Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Lei,

On Wed, Jun 9, 2021 at 2:43 PM Lei Yu <yulei.sh@bytedance.com> wrote:
>
> On Wed, Jun 9, 2021 at 1:30 PM Troy Lee <leetroy@gmail.com> wrote:
> >
> > Hi Team,
> >
> > On Thu, Jun 3, 2021 at 2:00 PM Joel Stanley <joel@jms.id.au> wrote:
> > >
> > > On Thu, 27 May 2021 at 07:14, Lei Yu <yulei.sh@bytedance.com> wrote:
> > > >
> > > > This email is to share some information about the OpenBMC 64MiB flash layout.
> > > >
> > > > In current Linux kernel, there is openbmc-flash-layout-64.dtsi that is
> > > > being used on meta-bytedance/meta-g220a system, there is on-going
> > > > change[1] for aspeed-bmc-ampere-mtjade.dts to use the layout as well.
> > > >
> > > > However, according to ast2600's change[2], the layout does not fit
> > > > ast2600's u-boot, so it updates the layout by changing the existing
> > > > one.
> > > >
> > > > On g220a system, we have tested the new layout and verifies that it
> > > > works fine, with below changes
> > > > 1. Pick the ast2600's change[2] in kernel;
> > > > 2. Pick the `image_types_phosphor.bbclass` change[3];
> > > > 3. Update the u-boot env to boot from the new location, or use the new
> > > > u-boot-aspeed-sdk_2019.04.bb[4]
> > > >    On g220a, we use the new u-boot.
> > > >
> > > > With the above changes, g220a system works fine with the new u-boot
> > > > and the updated flash layout.
> > > >
> > > > To make it consistent for both ast2500 and ast2600, it's better to use
> > > > the same flash layout (and u-boot).
> > > > So I would suggest merge the changes of [1] and [3], for now g220a and
> > > > meta-ampere/meta-jade could be impacted.
> > >
> > > Thanks for the summary Lei. I will merge [2] for v5.14 and backport it
> > > to dev-5.10.
> > >
> > > Cheers,
> > >
> > > Joel
> > >
> > > >
> > > > [1]: https://lore.kernel.org/openbmc/20210517040036.13667-4-quan@os.amperecomputing.com/
> > > > [2]: https://lore.kernel.org/linux-arm-kernel/20210316085932.2601-1-troy_lee@aspeedtech.com/
> > > > [3]: https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/39343
> > Thanks for Lei and Joel's help. For change [3], I have resubmitted it
> > against openbmc/openbmc repository.
> > Please refer to: https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/43876
> >
> > And the patch has been verified with evb-ast2600 machine running with
> > AST2600-A3 EVB. However, to run on A3 EVB, the machine has to enable
> > SPL for u-boot by the following patch:
> > ```
> > diff --git a/meta-aspeed/conf/machine/evb-ast2600.conf
> > b/meta-aspeed/conf/machine/evb-ast2600.conf
> > index e011045d2..2915b599f 100644
> > --- a/meta-aspeed/conf/machine/evb-ast2600.conf
> > +++ b/meta-aspeed/conf/machine/evb-ast2600.conf
> > @@ -1,6 +1,7 @@
> >  KERNEL_DEVICETREE = "aspeed-ast2600-evb.dtb"
> > -UBOOT_MACHINE = "ast2600_openbmc_defconfig"
> > -UBOOT_DEVICETREE = "ast2600a1-evb"
> > +UBOOT_MACHINE = "ast2600_openbmc_spl_defconfig"
> > +UBOOT_DEVICETREE = "ast2600-evb"
> > +SPL_BINARY = "spl/u-boot-spl.bin"
> >
> >  require conf/machine/include/ast2600.inc
> > ```
>
> Thanks for the information.
> @Troy May I ask what the "spl/u-boot-spl.bin" is and do we have source
> code of it?

SPL stands for Secondary Program Loader in u-boot, it can be seem as a
small boot loader which runs in SRAM and inits DRAM, then it loads
u-boot.bin from SPI Flash/eMMC into DRAM.
You could turn enable it by setting "CONFIG_SPL=y" in defconfig.
The source code can be found in
- arch/arm/mach-aspeed/ast2600/spl
- common/spl
The u-boot.bin can be built as a FIT image, so that the SPL can verify
u-boot to achieve chain of trust.

After enables the CONFIG_SPL, you also have to tell yocto to copy
u-boot-spl.bin to the very beginning of image-u-boot and u-boot.bin at
64KB offset.
By setting the SPL_BINARY variable in machine config,
obmc-phosphor-image will handle the feature.
https://github.com/openbmc/openbmc/blob/77a1904b1833cd3b70b0dfd68671745eaacc9b19/meta-phosphor/classes/image_types_phosphor.bbclass#L239-L244

Troy
>
> @Joel Does OpenBMC has its own open-sourced u-boot-spl that does the
> verification of the u-boot-proper?
>
>
>
> --
> BRs,
> Lei YU
