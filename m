Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF14399A60
	for <lists+openbmc@lfdr.de>; Thu,  3 Jun 2021 08:00:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FwZxf1Ltpz2yxP
	for <lists+openbmc@lfdr.de>; Thu,  3 Jun 2021 16:00:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=AqlxlpFQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72d;
 helo=mail-qk1-x72d.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=AqlxlpFQ; dkim-atps=neutral
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwZxG1kvzz2ym4
 for <openbmc@lists.ozlabs.org>; Thu,  3 Jun 2021 16:00:01 +1000 (AEST)
Received: by mail-qk1-x72d.google.com with SMTP id q10so4918191qkc.5
 for <openbmc@lists.ozlabs.org>; Wed, 02 Jun 2021 23:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=htrvuz4I2AD7YYeAzw43Hul+KZOMb7rxWcMRWw3bpY8=;
 b=AqlxlpFQBzJ+DCdkoiJN0awJGkbNaTdT56bYNOxzmIaBANGTfv2FMlw1tkXkOufroW
 hocpa3W1kvz6ZTrIe+dBtlI+6wvXDwdeQ5X0xJsx6x7jwTXv7dZ7e5SklMnGc+qWpFPG
 smVkbBVRNYwtlhrinTMXE6cLByT/ZRGdi9Rrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=htrvuz4I2AD7YYeAzw43Hul+KZOMb7rxWcMRWw3bpY8=;
 b=RUS6Anmv7B78A6qEPVHgF8cKvESOf3XGIH0r301VXDDBoUGGFIVfu8f/DEMfkDOqIi
 2PrGrPxJErJkzgeZBBYSG+6prLz16DofPX3yavCyVj6IDniHYxSO18kNtvBxrcZTHQOz
 TvFUI6UFCVcr8V30iCgcyOgPLMvw22y4z4Rhi3p20fncuQuH2fdCeglVFhnk0B9TXKQg
 ngMmU75bjPy0R04P6whvQ5jR2XpP1gkSj9gVb+MumnjgH2bRsSBtmZ4dGvU15qy6fAp8
 WPygpH6OsfCfKRbaRKwUCJoFBkQYaa6gZTXTWf7i8b70gBWoFdSIduUWjUyKXlvv8RJ1
 6TAA==
X-Gm-Message-State: AOAM531C28Dmtx4XjpYZDVa4C/MAEvzAWhBrFLqKx7fdKAVYSJm0bRhs
 pHyjHZGvzv51eV39W5miB2abqMAemAIAngNq1uo=
X-Google-Smtp-Source: ABdhPJxOpZGEns2SZQ7oLFsq4X0vtoPMK4GMGS5t46K0rAydQyEeI1vhqyhXd+jcBqBESRibQVoaeOAmaRN8Ybw0Dm4=
X-Received: by 2002:a37:e0f:: with SMTP id 15mr10548756qko.273.1622699995739; 
 Wed, 02 Jun 2021 22:59:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm54UGMSVkT=3WLVLrJwcW8OGcQJZOGYnhVvOrF1qVC7xtdvA@mail.gmail.com>
In-Reply-To: <CAGm54UGMSVkT=3WLVLrJwcW8OGcQJZOGYnhVvOrF1qVC7xtdvA@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 3 Jun 2021 05:59:42 +0000
Message-ID: <CACPK8XdVNXSfzDBPryjQh_4S0yU4Tp6VOOtju+L_DcfgHumPJw@mail.gmail.com>
Subject: Re: Unify the 64MiB flash layout
To: Lei Yu <yulei.sh@bytedance.com>, Quan Nguyen <quan@os.amperecomputing.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 27 May 2021 at 07:14, Lei Yu <yulei.sh@bytedance.com> wrote:
>
> This email is to share some information about the OpenBMC 64MiB flash layout.
>
> In current Linux kernel, there is openbmc-flash-layout-64.dtsi that is
> being used on meta-bytedance/meta-g220a system, there is on-going
> change[1] for aspeed-bmc-ampere-mtjade.dts to use the layout as well.
>
> However, according to ast2600's change[2], the layout does not fit
> ast2600's u-boot, so it updates the layout by changing the existing
> one.
>
> On g220a system, we have tested the new layout and verifies that it
> works fine, with below changes
> 1. Pick the ast2600's change[2] in kernel;
> 2. Pick the `image_types_phosphor.bbclass` change[3];
> 3. Update the u-boot env to boot from the new location, or use the new
> u-boot-aspeed-sdk_2019.04.bb[4]
>    On g220a, we use the new u-boot.
>
> With the above changes, g220a system works fine with the new u-boot
> and the updated flash layout.
>
> To make it consistent for both ast2500 and ast2600, it's better to use
> the same flash layout (and u-boot).
> So I would suggest merge the changes of [1] and [3], for now g220a and
> meta-ampere/meta-jade could be impacted.

Thanks for the summary Lei. I will merge [2] for v5.14 and backport it
to dev-5.10.

Cheers,

Joel

>
> [1]: https://lore.kernel.org/openbmc/20210517040036.13667-4-quan@os.amperecomputing.com/
> [2]: https://lore.kernel.org/linux-arm-kernel/20210316085932.2601-1-troy_lee@aspeedtech.com/
> [3]: https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/39343
> [4]: https://github.com/openbmc/openbmc/blob/master/meta-aspeed/recipes-bsp/u-boot/u-boot-aspeed-sdk_2019.04.bb
>
> --
> BRs,
> Lei YU
