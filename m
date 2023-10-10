Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDF87C04BE
	for <lists+openbmc@lfdr.de>; Tue, 10 Oct 2023 21:36:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ejsJED0k;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4mPC6XbPz3ckl
	for <lists+openbmc@lfdr.de>; Wed, 11 Oct 2023 06:36:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ejsJED0k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4mNc30Whz2ygY
	for <openbmc@lists.ozlabs.org>; Wed, 11 Oct 2023 06:36:16 +1100 (AEDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2bfea381255so74122271fa.3
        for <openbmc@lists.ozlabs.org>; Tue, 10 Oct 2023 12:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696966568; x=1697571368; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EnCyCL9CqSgjOWusL/DcIe34tmAuDeD2eNNCQWG/+So=;
        b=ejsJED0kQHUxPrL/3B6xrSQiYGUTKV0kqYpmBCrf6Jl655OhGFaol1rTGqVAxElOX+
         7oJGR1+YAAwXnsrifik6iG1psYCjWVOLzG/uuvkreTmGkCkKcfUOzVVtLL8FRZvFqqP3
         iXV9XYC9NFXYCjmY/9Vf+V7ePeVcYrE9npQdd5v6Syt5ANMAYCik9kBjn2j76+Y25kre
         AV7LiGLAVqOObb0/Y1YwnlEy8lFPDjuvnYPeZpLn2RLczFHnywSlaYchMPJeb6oYG8Fq
         aHB2vl/N0hlGMNN8CIbffVcnM6mVeir5TO8zTX0gKRik8qU7rBg0b1dkx2CfPO53umj/
         ZsJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696966568; x=1697571368;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EnCyCL9CqSgjOWusL/DcIe34tmAuDeD2eNNCQWG/+So=;
        b=ESlytU0SiQQcK9sgwvj1+Hh3pjQtj1naGLJINeXwFRCEnN6vzxFW9IbGWFgqDYsewp
         XLv2i9Q4HC+AD0A3DByUylzaDRhXwjcc+BwntADZTWbfza/ZRBiCFEltYvRq7jcUEIqa
         jUUNMZYmVs3kpjZGwSX96Y+Oinv4McwtOAO5On7hoDsVDk9jSnNLHpG3mzrMSjtXCYez
         HmSQ1p9ofjRlKa8uM7c5ceIHq8wfyDrUfW4lAUZbzp/IvEEobguU/bQ7Vv8N3qTFyiZZ
         K/tCWeQt6piuLPU8af/fJ8TK8Y1HvNJNR972qQVBZZGUXwP+M4b2rX4Tx1BlF4Qxy3st
         jIUw==
X-Gm-Message-State: AOJu0YzbNoXNfaqwbFxYYYRILAjNDJ0n9T2lDvQ4xeLl7A5pxOxt5gYt
	TWBoW1PclINY74PIY5cmp3AYHf9ArZ3pR74SlL8=
X-Google-Smtp-Source: AGHT+IFh0GPOwwi4vGUKtm0FShcUPBvpdzJkQpyfIUh9wMFu4ei5Fw3aFTsOCszk/QW3i1AUiC1n+Anw6KOmvvZ82v4=
X-Received: by 2002:a05:651c:141:b0:2c0:2583:520e with SMTP id
 c1-20020a05651c014100b002c02583520emr14990485ljd.41.1696966567771; Tue, 10
 Oct 2023 12:36:07 -0700 (PDT)
MIME-Version: 1.0
References: <20231002200610.129799-1-tmaimon77@gmail.com> <CAPDyKForPWPHoAuRuyXBHRpNVA9MvYa-eTXDrHx8Z94nSWpXBg@mail.gmail.com>
In-Reply-To: <CAPDyKForPWPHoAuRuyXBHRpNVA9MvYa-eTXDrHx8Z94nSWpXBg@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 10 Oct 2023 22:35:56 +0300
Message-ID: <CAP6Zq1hZF=v6T+Bn8AuZNUKCaTChpyLZKLvPcSo-SbfNS1-V+g@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] add NPCM SDHCI driver support
To: Ulf Hansson <ulf.hansson@linaro.org>
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
Cc: andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, benjaminfair@google.com, arnd@arndb.de, krakoczy@antmicro.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, briannorris@chromium.org, linux-mmc@vger.kernel.org, adrian.hunter@intel.com, tali.perry1@gmail.com, gsomlo@gmail.com, joel@jms.id.au, davidgow@google.com, skhan@linuxfoundation.org, devicetree@vger.kernel.org, pbrobinson@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Thank a lot Ulf

Appreciate it!

On Tue, 10 Oct 2023 at 17:28, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Mon, 2 Oct 2023 at 22:06, Tomer Maimon <tmaimon77@gmail.com> wrote:
> >
> > This patch set adds SDHCI support for the Nuvoton NPCM Baseboard
> > Management Controller (BMC).
> >
> > Deeply sorry it took that long until sending version three, promise to try
> > to do better on the next versions (if needed) :-),
> >
> > The NPCM SDHCI driver tested on NPCM750 and NPCM845 EVB.
> >
> > Addressed comments from:
> >  - Andy Shevchenko : https://www.spinics.net/lists/devicetree/msg638000.html
> >
> > Changes since version 4:
> >  - Remove unnecessary clk_disable_unprepare function.
> >
> > Changes since version 3:
> >  - Use devm_clk_get_optional_enabled function.
> >  - Add mod_devicetable.h.
> >  - Modify copyright year.
> >
> > Changes since version 2:
> >  - Add data to handle architecture-specific SDHCI parameters.
> >  - Change config place in make and kconfig files.
> >  - Calling sdhci_pltfm_free to to avoid a memory leak on error.
> >
> > Changes since version 1:
> >  - Use correct spaces in the dt-bindings.
> >  - Drop unused labels from dt-bindings.
> >  - Order by module name in the make a configuration.
> >  - Remove unnecessary blank lines.
> >  - Using devm_clk_get_optional instead of devm_clk_get.
> >
> > Tomer Maimon (2):
> >   dt-bindings: mmc: npcm,sdhci: Document NPCM SDHCI controller
> >   mmc: sdhci-npcm: Add NPCM SDHCI driver
> >
> >  .../devicetree/bindings/mmc/npcm,sdhci.yaml   | 45 +++++++++
> >  drivers/mmc/host/Kconfig                      |  8 ++
> >  drivers/mmc/host/Makefile                     |  1 +
> >  drivers/mmc/host/sdhci-npcm.c                 | 94 +++++++++++++++++++
> >  4 files changed, 148 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mmc/npcm,sdhci.yaml
> >  create mode 100644 drivers/mmc/host/sdhci-npcm.c
> >
>
> Applied for next (and by amending patch2 to remove some commas), thanks!
>
> Kind regards
> Uffe
