Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 086D51EDFD9
	for <lists+openbmc@lfdr.de>; Thu,  4 Jun 2020 10:33:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49czZ61hKCzDqng
	for <lists+openbmc@lfdr.de>; Thu,  4 Jun 2020 18:33:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::642;
 helo=mail-ej1-x642.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=fGkqeUca; dkim-atps=neutral
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49czYM4STTzDqW3
 for <openbmc@lists.ozlabs.org>; Thu,  4 Jun 2020 18:32:39 +1000 (AEST)
Received: by mail-ej1-x642.google.com with SMTP id x1so5112720ejd.8
 for <openbmc@lists.ozlabs.org>; Thu, 04 Jun 2020 01:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1AuRE0AuSz1Dcafc63dQERov0niyM7+8vmaBb8F6Fzc=;
 b=fGkqeUca0o35s+UryeUeoBdAohiaNg3kfMd+bxQWJyNHWhpzLy1Cr1ZcAjKHF8+WnL
 QA+DS5hlfW9VNepBJ+oGxqr+ac8FDcs1OIPBlQl52vV/mW34uykJiE5ZJT3mW7lhSYZL
 N4vom68WUkZGhqUpfeFd2DUOEWyFbBMFDByyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1AuRE0AuSz1Dcafc63dQERov0niyM7+8vmaBb8F6Fzc=;
 b=uWFuBMSv00ga7JW4ly8F9AnrtyuE3W132SGPpU06yASkfLOvDFaB7Os1W8jgm8PQWU
 TRFfoee53MkBhhUyGKyDX6GGkjGzFsBceFnXl+2k3pjDi9qYQnRe0rqylbUlT3QCyy5H
 xZQSkFLDYAnuXuVH0QJcWbbzW2Cl/HSByH6f89V/Oxc0znDMyMoyPKKd9qe5RiscyHDL
 3PwAww3ykDYS61KUcfhTeX8a2j1FjbRPZokg2ySelaItrN6v7Z4s5QqT2nXhy/KY7gFX
 ZwjqHas6dUG4P6Wp7r0byex6mlvzN4DpWhq4RzV38DMtPoxoB7wsHELrwyR4m9k9DdYn
 7nDg==
X-Gm-Message-State: AOAM531+9WewsMjgaJ/fz/TexrM66iZ43V1SG68KhUIfaprGZ/GxXZJk
 lgIjSacoqA9QO0/1UyWmhzlzhmd3TDNEKosP21A=
X-Google-Smtp-Source: ABdhPJy5ctc5383qKNluaPDwm98VmrQIOXT9qbgA+PmD3daSJjnvtPCKWdZ3etbzj/j/2E6sMLG804CjxluMDKg+46Q=
X-Received: by 2002:a17:906:3603:: with SMTP id
 q3mr2981318ejb.477.1591259554440; 
 Thu, 04 Jun 2020 01:32:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200527200820.47359-1-tali.perry1@gmail.com>
 <20200603202553.GB7684@kunai>
In-Reply-To: <20200603202553.GB7684@kunai>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 4 Jun 2020 08:32:22 +0000
Message-ID: <CACPK8Xe=66y+MkfogP4Gh6A9X7UDhOyAdUDwp=iqe7zitdxA8g@mail.gmail.com>
Subject: Re: [PATCH v14 0/3] i2c: npcm7xx: add NPCM i2c controller driver
To: Wolfram Sang <wsa@the-dreams.de>
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>, Tomer Maimon <tmaimon77@gmail.com>,
 kfting@nuvoton.com, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>, ofery@google.com,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-i2c@vger.kernel.org, andriy.shevchenko@linux.intel.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 kbuild test robot <lkp@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 3 Jun 2020 at 20:26, Wolfram Sang <wsa@the-dreams.de> wrote:
>
> On Wed, May 27, 2020 at 11:08:17PM +0300, Tali Perry wrote:
> > This patch set adds i2c controller support
> > for the Nuvoton NPCM Baseboard Management Controller (BMC).
> >
> > NPCM7xx includes 16 I2C controllers. This driver operates the controller.
> > This module also includes a slave mode.
> >
> > ---
> > v14 -> v13:
> >       - Fix yaml example: add missing include.
> >       - Replace all udelay to usleep_range, except one which is called from
> >         irq.
> >       - Fix compilation error (module_platfrom_init conflict).
> >       - debugfs counters always updated. Counting till max value,
> >         then stop counting.
> >       - Rename bus-frequency to clock-frequency.
> >       - Remove unused variables.
>
> I don't have time for a deeper review, but from what I can tell this
> driver is good to go and we can fix things incrementally from now on.
>
> Applied to for-next (will go into 5.8), thanks!

Thanks Wolfram. I encourage this approach to working with patches, and
especially for our vendors who are trying to do the correct thing in
mainlining their code.

Congrats Tali on getting the driver in the tree. This has a been a long journey!

Cheers,

Joel
