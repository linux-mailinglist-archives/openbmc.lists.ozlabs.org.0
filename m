Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC1B3A0BDE
	for <lists+openbmc@lfdr.de>; Wed,  9 Jun 2021 07:30:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G0G0q3rFvz2yxW
	for <lists+openbmc@lfdr.de>; Wed,  9 Jun 2021 15:30:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=jY2l/yzz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32b;
 helo=mail-ot1-x32b.google.com; envelope-from=leetroy@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jY2l/yzz; dkim-atps=neutral
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G0G0K3r0Vz3bpL
 for <openbmc@lists.ozlabs.org>; Wed,  9 Jun 2021 15:30:25 +1000 (AEST)
Received: by mail-ot1-x32b.google.com with SMTP id
 j11-20020a9d738b0000b02903ea3c02ded8so9186561otk.5
 for <openbmc@lists.ozlabs.org>; Tue, 08 Jun 2021 22:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qOxQYtUzCljmh4+aX+wwP/mYUjjrgC3MZB9kNgEwBms=;
 b=jY2l/yzzR9DE13jymr0IKs+/Qzp5hokfU0JOyY1DU2XSZt4+fST54Q71wlBC4wiw+C
 CvDYACoTMEBYewVCjoXzVQSwd56wDoQt1GSy2jaHJ0+znLUAxuUfxCSbwUuevZr+y2H0
 FJLYbQtNivXljrVGkcFL00z3uQbwITrYzKsEXFFNxLlv/klzhpmTE9jM83vCKU5OA87p
 H0dWDsMSmW0rIgIhK86r6tsema6irZ34PJ9YsgRnDo8BwNJJcHNFYe5zk/lX7WBVKS43
 5okhdgcNGM3WQkPWlKvNVmEP26PC+uHNosHfFOLf2qmkJ/iNBEgAc/IJOg0a26Qt8rnR
 MY8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qOxQYtUzCljmh4+aX+wwP/mYUjjrgC3MZB9kNgEwBms=;
 b=I/qs/k792hzCffzqr5zzc0MpeIQvCwwoR5mCSD/iGqC4EgLpNDl46BBdZ++CygkCZK
 RM8Y6pBOFifc/Re6A+lTI6YYF73DcI0iGUQ62gcVQmXgdTAJlvPP0ckd0mGZx2z2HVeL
 fY1fU+dZaRC4pj+Bf/QBWwktikUmmmxoHqHYgZtppXDeZ6l1qm1YySN8KiOjZxCh2UH7
 75qoveG5edEbor1I8docDwhFe9FW6VFNSqCSKhy4LqwOkyvOU3g/zc52x0v2YR8OzRxs
 U7Npb/GpTiPEyYsLkSAkM0qH2kBjqhOr6bX1AVDxdFvy5JC01gMKPaDc4v9ear/BlOSr
 uSPA==
X-Gm-Message-State: AOAM532m7aAUI70a/oGvy9I89tRqW/FJ/npcJ31XRfDTgBxNKwQUaDSr
 xWR1Lvpd5d0O7Ma44dOopGxlqkKMd/tBUpf4jrs=
X-Google-Smtp-Source: ABdhPJwHw6ina0lI9+WYUCG4jxKP4FwhBLhM+x0BI1z9ubLn5OLiRvgvLYmsgkJ6XJY7m/DedeoZN00fZSwlNSpdTiI=
X-Received: by 2002:a05:6830:1d72:: with SMTP id
 l18mr9028809oti.150.1623216622014; 
 Tue, 08 Jun 2021 22:30:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm54UGMSVkT=3WLVLrJwcW8OGcQJZOGYnhVvOrF1qVC7xtdvA@mail.gmail.com>
 <CACPK8XdVNXSfzDBPryjQh_4S0yU4Tp6VOOtju+L_DcfgHumPJw@mail.gmail.com>
In-Reply-To: <CACPK8XdVNXSfzDBPryjQh_4S0yU4Tp6VOOtju+L_DcfgHumPJw@mail.gmail.com>
From: Troy Lee <leetroy@gmail.com>
Date: Wed, 9 Jun 2021 13:30:10 +0800
Message-ID: <CAN9Jwz2aex+rXnK34ni=kzBCruqSsQvM_-hik79SJ_+4+mY9Lg@mail.gmail.com>
Subject: Re: Unify the 64MiB flash layout
To: Joel Stanley <joel@jms.id.au>
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Lei Yu <yulei.sh@bytedance.com>,
 Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Team,

On Thu, Jun 3, 2021 at 2:00 PM Joel Stanley <joel@jms.id.au> wrote:
>
> On Thu, 27 May 2021 at 07:14, Lei Yu <yulei.sh@bytedance.com> wrote:
> >
> > This email is to share some information about the OpenBMC 64MiB flash layout.
> >
> > In current Linux kernel, there is openbmc-flash-layout-64.dtsi that is
> > being used on meta-bytedance/meta-g220a system, there is on-going
> > change[1] for aspeed-bmc-ampere-mtjade.dts to use the layout as well.
> >
> > However, according to ast2600's change[2], the layout does not fit
> > ast2600's u-boot, so it updates the layout by changing the existing
> > one.
> >
> > On g220a system, we have tested the new layout and verifies that it
> > works fine, with below changes
> > 1. Pick the ast2600's change[2] in kernel;
> > 2. Pick the `image_types_phosphor.bbclass` change[3];
> > 3. Update the u-boot env to boot from the new location, or use the new
> > u-boot-aspeed-sdk_2019.04.bb[4]
> >    On g220a, we use the new u-boot.
> >
> > With the above changes, g220a system works fine with the new u-boot
> > and the updated flash layout.
> >
> > To make it consistent for both ast2500 and ast2600, it's better to use
> > the same flash layout (and u-boot).
> > So I would suggest merge the changes of [1] and [3], for now g220a and
> > meta-ampere/meta-jade could be impacted.
>
> Thanks for the summary Lei. I will merge [2] for v5.14 and backport it
> to dev-5.10.
>
> Cheers,
>
> Joel
>
> >
> > [1]: https://lore.kernel.org/openbmc/20210517040036.13667-4-quan@os.amperecomputing.com/
> > [2]: https://lore.kernel.org/linux-arm-kernel/20210316085932.2601-1-troy_lee@aspeedtech.com/
> > [3]: https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/39343
Thanks for Lei and Joel's help. For change [3], I have resubmitted it
against openbmc/openbmc repository.
Please refer to: https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/43876

And the patch has been verified with evb-ast2600 machine running with
AST2600-A3 EVB. However, to run on A3 EVB, the machine has to enable
SPL for u-boot by the following patch:
```
diff --git a/meta-aspeed/conf/machine/evb-ast2600.conf
b/meta-aspeed/conf/machine/evb-ast2600.conf
index e011045d2..2915b599f 100644
--- a/meta-aspeed/conf/machine/evb-ast2600.conf
+++ b/meta-aspeed/conf/machine/evb-ast2600.conf
@@ -1,6 +1,7 @@
 KERNEL_DEVICETREE = "aspeed-ast2600-evb.dtb"
-UBOOT_MACHINE = "ast2600_openbmc_defconfig"
-UBOOT_DEVICETREE = "ast2600a1-evb"
+UBOOT_MACHINE = "ast2600_openbmc_spl_defconfig"
+UBOOT_DEVICETREE = "ast2600-evb"
+SPL_BINARY = "spl/u-boot-spl.bin"

 require conf/machine/include/ast2600.inc
```

> > [4]: https://github.com/openbmc/openbmc/blob/master/meta-aspeed/recipes-bsp/u-boot/u-boot-aspeed-sdk_2019.04.bb
> >
> > --
> > BRs,
> > Lei YU

Thanks,
Troy Lee
