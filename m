Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 008F758E744
	for <lists+openbmc@lfdr.de>; Wed, 10 Aug 2022 08:20:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2ftv6BRHz3bY5
	for <lists+openbmc@lfdr.de>; Wed, 10 Aug 2022 16:20:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=DD77UqKR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=DD77UqKR;
	dkim-atps=neutral
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M2ftT74z4z2xGm
	for <openbmc@lists.ozlabs.org>; Wed, 10 Aug 2022 16:20:01 +1000 (AEST)
Received: by mail-wm1-x32d.google.com with SMTP id q1-20020a05600c040100b003a52db97fffso472814wmb.4
        for <openbmc@lists.ozlabs.org>; Tue, 09 Aug 2022 23:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Ugxd2dBKnJJy63+zwhOPeVJP16zW53sywnt8HdL+xpA=;
        b=DD77UqKRV4rpwR8ymHjmk8tUxl8OmefcVA2eJKC6nPmQSgA/2BbPPnujmeiAKqDdAD
         2U6Sbd+1QdgVTg0f/yZpOB3jj3onpMFvKLWQ6idgWNJMCfwQ+dLcilwEcB12mttKSX9w
         aIdnE21qJxinsbKcHDXayl6CotH2gY3/gWdxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Ugxd2dBKnJJy63+zwhOPeVJP16zW53sywnt8HdL+xpA=;
        b=obbmAMac8pAtTq32jvxn/2mDsAfb/d2Hij3CwaNZ7QYeSgrIH2pi5OGBIAcJXmUZQU
         VpO4rJz6NK1gfMumzby7F4xAJqSoQs9W+B9c9VNb5KYntY28B+cS9zyc5ATSbpaFu3/L
         ImY4Lht6s6KpqkzVlLiTfyE4vijuWy/LZ/Ao1KOX7PVRuLShqdglxFCuOUqvjjVtf21d
         +R6V2Wd0CxCwuqX8umDGIHuahgcS7AOxO9Zvm7aIxTYb1EXKH7bRJifNPcteM1mq0tMb
         Ow76Y9yvvuPecM+qStPlu8RF0ocKr3hW3CSQgto8SmaBJkdIw9Nnwulk5PakRBt2OQTm
         1LJw==
X-Gm-Message-State: ACgBeo2RKS9NbzprgpPV7ByjybkmSc0dpu9ixHf6nyM4X+bCfEAGk6TY
	k/vpzarTJt/t9p+KuS86Vv0mYQaX0St65osm0CA=
X-Google-Smtp-Source: AA6agR5fyWAn/hSuyX7+lrXGsPjNJmdld7QhcGe9D6XYdQJpRVewquYhNcUWfx5AOoSdjtZDePch65PlrCg5lci5DPg=
X-Received: by 2002:a05:600c:3d93:b0:3a3:3a93:fb16 with SMTP id
 bi19-20020a05600c3d9300b003a33a93fb16mr1206019wmb.190.1660112391630; Tue, 09
 Aug 2022 23:19:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220808220839.1006341-1-peter@pjd.dev>
In-Reply-To: <20220808220839.1006341-1-peter@pjd.dev>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 10 Aug 2022 06:19:38 +0000
Message-ID: <CACPK8Xe=_bMH0BSZTcgbfLYFhf_=rSuMJz0ZFRhErWQuUzzRYw@mail.gmail.com>
Subject: Re: [PATCH 0/7] tpm: Pull tpm_tis_phy_ops and tpm_tis_i2c updates
To: Peter Delevoryas <peter@pjd.dev>, Eddie James <eajames@linux.ibm.com>
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
Cc: Alexander.Steffen@infineon.com, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 8 Aug 2022 at 22:08, Peter Delevoryas <peter@pjd.dev> wrote:
>
> OpenBMC's Linux dev-5.15 has an old tpm_tis_i2c driver from Nuvoton, but
> it was never merged upstreamed and produces compilation warnings now.
>
> Infineon took that driver, modified it, and merged it upstream. Nuvoton
> never merged theirs, so the first patch in this series reverts theirs.

Thanks Peter!

I've been testing this version of the driver (applied to v5.19 instead
of our 5.15 tree, but it is the same code) and it doesn't work with
the hardware we have:

[    1.571105] tpm tpm0: Operation Canceled
[    1.576301] tpm_tis_i2c 1-002e: 1.2 TPM (device-id 0xFC, rev-id 1)
[    1.610168] tpm tpm0: Operation Canceled
[    1.615580] tpm tpm0: A TPM error (-125) occurred attempting to
determine the timeouts
[    1.685651] tpm_tis_i2c: probe of 1-002e failed with error -125

This appears to be detected as a "1.2 TPM", when I am pretty sure it's
a 2.0 device. I suspect I'm missing something.

The tree I was testing with is here:

https://github.com/shenki/linux/commits/dev-5.19

I've cc'd Eddie as he also has access to this hardware, and perhaps
can help with the debugging.

Cheers,

Joel



>
> Also, I included the "Remove read16, read32, write32" patch because
> otherwise Alexander's patches don't apply cleanly. But, I could actually
> resolve the merge conflicts. I figured it will be easier later to just
> include more patches from upstream to make it clean.
>
> I also noticed there was one follow-up change submitted by alibaba to
> remove one line, so I included that.
>
> Alexander didn't include the compatible strings from the old driver,
> even though it should be compatible, so I've included a patch at the end
> which fixes that. I did it as a separate patch so that we maintain a
> patch series closer to what the upstream will be.
>
> cc'ing Alexander on this thread too to see if he has any suggestions, or
> thinks I missed anything.
>
> I haven't cc'd the linux kernel mailing list aliases because I don't
> think this is relevant to them. Only the patch including the compatible
> strings will be relevant.
>
> checkpath.pl warns agains MAINTAINERS, but I'm pretty sure it's fine.
> The upstream MAINTAINERS file hasn't been updated with these changes, so
> we probably don't need to do anything there.
>
> This was a follow-up from the following OpenBMC mailing list thread:
>
> https://lore.kernel.org/openbmc/20220725225151.393384-1-peter@pjd.dev/
>
> Thanks,
> Peter
>
> Alexander Steffen (3):
>   dt-bindings: trivial-devices: Add Infineon SLB9673 TPM
>   tpm: Add tpm_tis_verify_crc to the tpm_tis_phy_ops protocol layer
>   tpm: Add tpm_tis_i2c backend for tpm_tis_core
>
> Johannes Holland (1):
>   tpm: Remove read16/read32/write32 calls from tpm_tis_phy_ops
>
> Peter Delevoryas (2):
>   Revert "tpm: tpm_tis: Add tpm_tis_i2c driver"
>   tpm_tis_i2c: Add old compatible strings back
>
> Yang Li (1):
>   tpm: fix platform_no_drv_owner.cocci warning
>
>  .../devicetree/bindings/trivial-devices.yaml  |   2 +
>  drivers/char/tpm/Kconfig                      |  24 +-
>  drivers/char/tpm/tpm_tis.c                    |  67 ++-
>  drivers/char/tpm/tpm_tis_core.c               |  14 +
>  drivers/char/tpm/tpm_tis_core.h               |  68 ++-
>  drivers/char/tpm/tpm_tis_i2c.c                | 431 ++++++++++++------
>  drivers/char/tpm/tpm_tis_spi.h                |   4 -
>  drivers/char/tpm/tpm_tis_spi_cr50.c           |   7 +-
>  drivers/char/tpm/tpm_tis_spi_main.c           |  45 +-
>  drivers/char/tpm/tpm_tis_synquacer.c          |  98 ++--
>  10 files changed, 436 insertions(+), 324 deletions(-)
>
> --
> 2.37.1
>
