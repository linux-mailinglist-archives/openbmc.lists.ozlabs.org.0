Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B25CE3A0CA6
	for <lists+openbmc@lfdr.de>; Wed,  9 Jun 2021 08:43:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G0Hd40QbLz3bsD
	for <lists+openbmc@lfdr.de>; Wed,  9 Jun 2021 16:43:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=w/lyVdyS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::333;
 helo=mail-ot1-x333.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=w/lyVdyS; dkim-atps=neutral
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G0Hcp3vCMz301v
 for <openbmc@lists.ozlabs.org>; Wed,  9 Jun 2021 16:43:36 +1000 (AEST)
Received: by mail-ot1-x333.google.com with SMTP id
 69-20020a9d0a4b0000b02902ed42f141e1so22963947otg.2
 for <openbmc@lists.ozlabs.org>; Tue, 08 Jun 2021 23:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YcLQap0wvKf71e0qAinQs37CmwH41qVDDu/ZZ1IQKY0=;
 b=w/lyVdySNmhmU0WarlX9iV+cuMwW1vfLEYsG96iQ4xcN2kcb8Sg7RDcQf42jODEj3f
 wXwSTqt18xbshHujvDuKALuwczDBeZTTEHS/CTS3enOaZjeYeGcIHif74sgsF9UeZghG
 zKoEHEoZpQtXHYTYM8Olnk9N6qXIeqpbPGDHK6TPvlVZHTMCTgg11/dg6LsKM0/CZvOa
 g8bB1xz8roDBaEaREC+1RVXL9h9xSWHFyU1iL2d0DxEQvgCJRqbttqvuFrI98JSSFDSg
 eo/XwpGN3dMWEmimZwzY+yu2iD+EeE83H9IIfTKAuaWn88KBHyYdqMemO6PdBRvLoYU5
 bUOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YcLQap0wvKf71e0qAinQs37CmwH41qVDDu/ZZ1IQKY0=;
 b=BwE0pB5QnzRApQpGm+VtA8xKfa5LY5AKreGe+f4lKVyfECNNLaJwNohP179jUdjosA
 uK8nyLXcskfn1MEY5rrgv/Egln0EGlK05myHoE/z86VP0TH61zuYy2HxOdItwNXXqAP2
 Z8vXxuFjp4qnCx7azRYs8S13LRG4TjimhKSS2+OPMZGH4LdHtJfzZALwwtb2dJs3RAFx
 fs9K82vbIxGOwbpSk4AFQiWgv97n4RAMjJYuQlwKmA5NQCUUFW3LMWu0u1aydRka2NBq
 WTDr28/n+J1tt5Svp/SBtgNFduh9I+YmPcYUq+Mpxzf7X0lvC5GjpNaLEyFhMq4PjDpj
 HqHg==
X-Gm-Message-State: AOAM530ZkcWjldN8shwlwnfap/OHU7hiFaToOAxjvgZyfu3b8YMtRgJp
 0SUa1n03Ya3EzRZ6wcoGsd7bcks0+D9ReaeLhfHnfg==
X-Google-Smtp-Source: ABdhPJwcaZJk3AMVwlE4F71QZoPOR8epAcokknhNNnQk+rOUWBVWFz2XMozeBWhKKDTKOV2S3Hf20Ov5tCUavWwICqo=
X-Received: by 2002:a9d:6081:: with SMTP id m1mr21602656otj.226.1623221012540; 
 Tue, 08 Jun 2021 23:43:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm54UGMSVkT=3WLVLrJwcW8OGcQJZOGYnhVvOrF1qVC7xtdvA@mail.gmail.com>
 <CACPK8XdVNXSfzDBPryjQh_4S0yU4Tp6VOOtju+L_DcfgHumPJw@mail.gmail.com>
 <CAN9Jwz2aex+rXnK34ni=kzBCruqSsQvM_-hik79SJ_+4+mY9Lg@mail.gmail.com>
In-Reply-To: <CAN9Jwz2aex+rXnK34ni=kzBCruqSsQvM_-hik79SJ_+4+mY9Lg@mail.gmail.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Wed, 9 Jun 2021 14:43:23 +0800
Message-ID: <CAGm54UFwhCKOeH_6BnFS3bDM0QS+RT3QsOM29PFLNw-PRXQorg@mail.gmail.com>
Subject: Re: Unify the 64MiB flash layout
To: Troy Lee <leetroy@gmail.com>
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

On Wed, Jun 9, 2021 at 1:30 PM Troy Lee <leetroy@gmail.com> wrote:
>
> Hi Team,
>
> On Thu, Jun 3, 2021 at 2:00 PM Joel Stanley <joel@jms.id.au> wrote:
> >
> > On Thu, 27 May 2021 at 07:14, Lei Yu <yulei.sh@bytedance.com> wrote:
> > >
> > > This email is to share some information about the OpenBMC 64MiB flash layout.
> > >
> > > In current Linux kernel, there is openbmc-flash-layout-64.dtsi that is
> > > being used on meta-bytedance/meta-g220a system, there is on-going
> > > change[1] for aspeed-bmc-ampere-mtjade.dts to use the layout as well.
> > >
> > > However, according to ast2600's change[2], the layout does not fit
> > > ast2600's u-boot, so it updates the layout by changing the existing
> > > one.
> > >
> > > On g220a system, we have tested the new layout and verifies that it
> > > works fine, with below changes
> > > 1. Pick the ast2600's change[2] in kernel;
> > > 2. Pick the `image_types_phosphor.bbclass` change[3];
> > > 3. Update the u-boot env to boot from the new location, or use the new
> > > u-boot-aspeed-sdk_2019.04.bb[4]
> > >    On g220a, we use the new u-boot.
> > >
> > > With the above changes, g220a system works fine with the new u-boot
> > > and the updated flash layout.
> > >
> > > To make it consistent for both ast2500 and ast2600, it's better to use
> > > the same flash layout (and u-boot).
> > > So I would suggest merge the changes of [1] and [3], for now g220a and
> > > meta-ampere/meta-jade could be impacted.
> >
> > Thanks for the summary Lei. I will merge [2] for v5.14 and backport it
> > to dev-5.10.
> >
> > Cheers,
> >
> > Joel
> >
> > >
> > > [1]: https://lore.kernel.org/openbmc/20210517040036.13667-4-quan@os.amperecomputing.com/
> > > [2]: https://lore.kernel.org/linux-arm-kernel/20210316085932.2601-1-troy_lee@aspeedtech.com/
> > > [3]: https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/39343
> Thanks for Lei and Joel's help. For change [3], I have resubmitted it
> against openbmc/openbmc repository.
> Please refer to: https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/43876
>
> And the patch has been verified with evb-ast2600 machine running with
> AST2600-A3 EVB. However, to run on A3 EVB, the machine has to enable
> SPL for u-boot by the following patch:
> ```
> diff --git a/meta-aspeed/conf/machine/evb-ast2600.conf
> b/meta-aspeed/conf/machine/evb-ast2600.conf
> index e011045d2..2915b599f 100644
> --- a/meta-aspeed/conf/machine/evb-ast2600.conf
> +++ b/meta-aspeed/conf/machine/evb-ast2600.conf
> @@ -1,6 +1,7 @@
>  KERNEL_DEVICETREE = "aspeed-ast2600-evb.dtb"
> -UBOOT_MACHINE = "ast2600_openbmc_defconfig"
> -UBOOT_DEVICETREE = "ast2600a1-evb"
> +UBOOT_MACHINE = "ast2600_openbmc_spl_defconfig"
> +UBOOT_DEVICETREE = "ast2600-evb"
> +SPL_BINARY = "spl/u-boot-spl.bin"
>
>  require conf/machine/include/ast2600.inc
> ```

Thanks for the information.
@Troy May I ask what the "spl/u-boot-spl.bin" is and do we have source
code of it?

@Joel Does OpenBMC has its own open-sourced u-boot-spl that does the
verification of the u-boot-proper?



-- 
BRs,
Lei YU
