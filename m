Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8371ACD6
	for <lists+openbmc@lfdr.de>; Sun, 12 May 2019 17:44:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4527YX175TzDqJc
	for <lists+openbmc@lfdr.de>; Mon, 13 May 2019 01:44:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::143; helo=mail-it1-x143.google.com;
 envelope-from=avifishman70@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="J3zv5gZX"; 
 dkim-atps=neutral
Received: from mail-it1-x143.google.com (mail-it1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4527Xc71W9zDqJK
 for <openbmc@lists.ozlabs.org>; Mon, 13 May 2019 01:43:56 +1000 (AEST)
Received: by mail-it1-x143.google.com with SMTP id u16so11810749itc.0
 for <openbmc@lists.ozlabs.org>; Sun, 12 May 2019 08:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KPdcFiwc52qsPtlV5dMHI1Jd08Cmm56jMeKEdUqwcDk=;
 b=J3zv5gZXXSmniCcNuLAECaWzQVAvXY7tNA1qZL+quwXBbAvgTOQ9y5mwmOTKzf44oa
 zPYSzO0S4AW7MIfVEWIvaGRN/1k3+DWpaAFWlep545ydxybHYYlbWzJQjsYXMA87iQon
 qmH9agi6fbSMXVD+MOCZETCOnIjYawU86XlDO6V8OWPwj9N9h9PeKUXaOEtpsOoKGNh0
 vGRgMxeG7OzHmv+Exl2WeHtecPjXHsdvujzT+Sk9NVUW3i3bvlOE9rU1EcerdxdzrJod
 EVhedrVkPAWlDoX45Askj8tsB7kRgALLXmcuSIZO1nwJch+ScgkbL5TMk3h5agjAf4Nu
 pl+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KPdcFiwc52qsPtlV5dMHI1Jd08Cmm56jMeKEdUqwcDk=;
 b=OJEsT/Gd8mlLzlFGDRF0cBDObzFDwg/ajF5KFBzCYBHwPkKJNOcW/oskwMYg5LshN0
 GQFzlhSXarqS+0kSEfkusHz8DvesLjqzIO9Vg3r4PUY9PpE0ShHqsBhE+MIqqZB3cs2A
 Oi5zpvlYTKjQmSoF2y36nXLDEqDJLksGE60EAz8FiI8kkeAzMRsbbcYPprMc4P43giIq
 xovELeoE2tDcWH3s9Lpp8XcMJNwptJBSDLvUWv5G3Ahk0e4Pu5ZVvgb13W2SJGU5eaBm
 2lRDKuUWnXI+yCLg8t3Pcv744ZXa2DVd7a9XsI4HTTPxF2a8Rx1FJFFHMlOtH07mYUcy
 WN2w==
X-Gm-Message-State: APjAAAVcoA0BFplnVgIPVN3xuNlKnrggZriFqF3BEv9coCtSDe+1dS5J
 X476KHz7Y7IS7eyUn700+CIwirABveOz7ClASQ==
X-Google-Smtp-Source: APXvYqy0ZBWq2Brra6vGMKlyXfSBgqCBDYCXha81661llKJZEV9C3qgGcxMEPgvaNn867o3dSHtmTdYnOZ4SCLYItZg=
X-Received: by 2002:a24:2b4c:: with SMTP id h73mr13086109ita.41.1557675831809; 
 Sun, 12 May 2019 08:43:51 -0700 (PDT)
MIME-Version: 1.0
References: <1556034515-28792-1-git-send-email-paul.gortmaker@windriver.com>
In-Reply-To: <1556034515-28792-1-git-send-email-paul.gortmaker@windriver.com>
From: Avi Fishman <avifishman70@gmail.com>
Date: Sun, 12 May 2019 18:43:29 +0300
Message-ID: <CAKKbWA5ydScNecjU1C4z72o=6ZiX1D2ik4nUe7VoiFaSF=z9nw@mail.gmail.com>
Subject: Re: [PATCH 0/5] wdt: clean up unused modular infrastructure
To: Paul Gortmaker <paul.gortmaker@windriver.com>
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
Cc: linux-watchdog@vger.kernel.org, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Tali Perry <tali.perry1@gmail.com>, Wim Van Sebroeck <wim@iguana.be>,
 Benjamin Fair <benjaminfair@google.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Linus Walleij <linus.walleij@linaro.org>, Guenter Roeck <linux@roeck-us.net>,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I saw many drivers that are putting "#ifdef MODULE" around module specific code.
I think it answers all 4 concerns above.
It also covers the case where a developer made the driver available to
be compiled as a module and in the Kconfig didn't make it tristate.
What do you think?

On Thu, May 9, 2019 at 9:17 AM Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
>
> People can embed modular includes and modular exit functions into code
> that never use any of it, and they won't get any errors or warnings.
>
> Using modular infrastructure in non-modules might seem harmless, but some
> of the downfalls this leads to are:
>
>  (1) it is easy to accidentally write unused module_exit/remove code
>  (2) it can be misleading when reading the source, thinking a driver can
>      be modular when the Makefile and/or Kconfig prohibit it
>  (3) an unused include of the module.h header file will in turn
>      include nearly everything else; adding a lot to CPP overhead.
>  (4) it gets copied/replicated into other drivers and can spread.
>
> As a data point for #3 above, an empty C file that just includes the
> module.h header generates over 750kB of CPP output.  Repeating the same
> experiment with init.h and the result is less than 12kB; with export.h
> it is only about 1/2kB; with both it still is less than 12kB.
>
> Here, In this series, we do what has been done for other subsystems,
> like, net, x86, mfd, iommu....  and audit for uses of modular
> infrastructure inside code that currently can't be built as a module.
>
> As always, the option exists for driver authors to convert their code
> to tristate, if there is a valid use case for it to be so.  But since
> I don't have the context for each driver to know if such a use case
> exists, I limit myself to simply removing the unused code in order to
> make the driver consistent with the Makefile/Kconfig settings that
> control it.
>
> Paul.
>
> ---
>
> Cc: Benjamin Fair <benjaminfair@google.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-watchdog@vger.kernel.org
> Cc: Nancy Yuen <yuenn@google.com>
> Cc: openbmc@lists.ozlabs.org
> Cc: Patrick Venture <venture@google.com>
> Cc: Tali Perry <tali.perry1@gmail.com>
> Cc: Tomer Maimon <tmaimon77@gmail.com>
> Cc: Wim Van Sebroeck <wim@iguana.be>
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
>
>
> Paul Gortmaker (5):
>   watchdog: rtd119x: drop unused module.h include
>   watchdog: watchdog_core: make it explicitly non-modular
>   watchdog: npcm: make it explicitly non-modular
>   watchdog: intel_scu: make it explicitly non-modular
>   watchdog: coh901327: make it explicitly non-modular
>
>  drivers/watchdog/coh901327_wdt.c      | 24 ++++--------------------
>  drivers/watchdog/intel_scu_watchdog.c | 18 ------------------
>  drivers/watchdog/npcm_wdt.c           | 13 ++++++-------
>  drivers/watchdog/rtd119x_wdt.c        |  1 -
>  drivers/watchdog/watchdog_core.c      | 15 +--------------
>  5 files changed, 11 insertions(+), 60 deletions(-)
>
> --
> 2.7.4
>


-- 
Regards,
Avi
