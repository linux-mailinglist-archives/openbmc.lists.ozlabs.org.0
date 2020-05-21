Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB091DD08D
	for <lists+openbmc@lfdr.de>; Thu, 21 May 2020 16:56:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49SXkC3zTmzDqnx
	for <lists+openbmc@lfdr.de>; Fri, 22 May 2020 00:56:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::242;
 helo=mail-lj1-x242.google.com; envelope-from=tali.perry1@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hNauZCE4; dkim-atps=neutral
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49SXS55RWczDqVH
 for <openbmc@lists.ozlabs.org>; Fri, 22 May 2020 00:43:48 +1000 (AEST)
Received: by mail-lj1-x242.google.com with SMTP id o14so8610208ljp.4
 for <openbmc@lists.ozlabs.org>; Thu, 21 May 2020 07:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tuQ1zvOklpezgOq1qrrrAXi9Q/2zL0O9meBuAgy373s=;
 b=hNauZCE4ZyQrnO0nntQayyVk53MtCYFx0x+QupMIZuQorwHuDn4bhd0+45d7gZ6d8m
 L6FJKZwUbwT0yCAebmlFe/U6MIDVfJOulUCJ9E6SQ5+CZAc5oTbh9r4VX1H+J+9/unKS
 OtVccceu5GPEqBPyaLM8ED/+C7SRnRPsQL+dDOic0gp0369C/z+gCWjmEsqcMLSXWCyR
 xny6xU29xdDdJPSNElcbiaSIP3X8p+JpzsMp8hNSzPEJra2Ys18vzOJkZcgtxG4AIRzr
 r4c9E/zTfdzTR9j8Bx5HE4BOlhs5/j7qSSM0Q7hagrta2JhNIsPXZXw0yNeOAqCIV5hp
 G74g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tuQ1zvOklpezgOq1qrrrAXi9Q/2zL0O9meBuAgy373s=;
 b=OPbKclRnKtO5Ssy8cjBz4wO6xK7wk7ui/nYyRym+Ax3qaNjB7dNny1/9DzH63OjGC4
 nUFcc40y0e2JQgua9KpHwKUwVa5F9ZNOHGDhTWtuEB1CF5ej38WIiDaxSROuUKkf4TO7
 4GfRbcMI/Zzj4d0b+BIC1bZr995TsRbHZvGvS0t3dT6+Yo91kuusggnt/Ykt5UZq3NhA
 0lQFiVrIyvlyk2ivR695AsVN5Ap4sq92acn10pyGU29J1X60AW1oQ/bu85Yjq/aZZKlP
 JhEcrgEG3SF1ewxW0S7ajq97Iz+VsTmnAMpYtt1y05UY/ZxfZrccJmDeavecpYpdO3yc
 tw7w==
X-Gm-Message-State: AOAM533AawgyVhTe3iNYxyFSSmaShN57h1xjiOYL9LOUPFbS+deXW4Cr
 OB38ATUjoyFITYIwAB0FHEIr5YJHM6SaNinIe00=
X-Google-Smtp-Source: ABdhPJzExRJlbujUemJvxqwrl+G4Cgtl0pUnc8oJA7iFqXep0LQNN0QQax7qtdllV0ZY5aX2u0RW9gWAArQn88T9G+4=
X-Received: by 2002:a2e:6c0c:: with SMTP id h12mr5222291ljc.266.1590072223382; 
 Thu, 21 May 2020 07:43:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200521110910.45518-1-tali.perry1@gmail.com>
 <20200521110910.45518-3-tali.perry1@gmail.com>
 <20200521142340.GM1634618@smile.fi.intel.com> <20200521143100.GA16812@ninjato>
In-Reply-To: <20200521143100.GA16812@ninjato>
From: Tali Perry <tali.perry1@gmail.com>
Date: Thu, 21 May 2020 17:45:03 +0300
Message-ID: <CAHb3i=vcVLWHjdiJoNZQrwJCqzszpOL7e9SAjqObsZCRH4ifwg@mail.gmail.com>
Subject: Re: [PATCH v12 2/3] i2c: npcm7xx: Add Nuvoton NPCM I2C controller
 driver
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
Cc: devicetree <devicetree@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>,
 avifishman70@gmail.com, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>, Ofer Yehielli <ofery@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kfting@nuvoton.com,
 Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, May 21, 2020 at 5:31 PM Wolfram Sang <wsa@the-dreams.de> wrote:
>
> Hi Tali, Andy!
>
> On Thu, May 21, 2020 at 05:23:40PM +0300, Andy Shevchenko wrote:
> > On Thu, May 21, 2020 at 02:09:09PM +0300, Tali Perry wrote:
> > > Add Nuvoton NPCM BMC I2C controller driver.
> >
> > Thanks. My comments below.
> > After addressing them, FWIW,
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> Thanks, Andy, for all the review!
>

Highly appreciate your time and patience for a newbie :)

> From a glimpse, this looks good to go. I will have a close look later
> today.
>
> > > +#ifdef CONFIG_DEBUG_FS
> >
> > Again, why is this here?
> >
> > Have you checked debugfs.h for !CONFIG_DEBUG_FS case?

I compiled both options. I removed the ifdef in most places, except in the
struct itself. Users that don't use the debugfs don't need this in the struct.

>
> I wondered also about DEBUG_FS entries. I can see their value when
> developing the driver. But since this is done now, do they really help a
> user to debug a difficult case? I am not sure, and then I wonder if we
> should have that code in upstream. I am open for discussion, though.

The user wanted to have health monitor implemented on top of the driver.
The user has 16 channels connected the multiple devices. All are operated
using various daemons in the system. Sometimes the slave devices are power down.
Therefor the user wanted to track the health status of the devices.

>
> > > +MODULE_VERSION("0.1.3");
> >
> > Module version is defined by kernel commit hash. But it's up to you and
> > subsystem maintainer to decide.
>
> Please drop it. I also think commit id's (or even kernel versions) are a
> more precise description.

will remove.

>
> Regards,
>
>    Wolfram
>

BR,
Tali
