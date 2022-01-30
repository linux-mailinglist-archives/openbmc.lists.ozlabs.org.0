Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3554A3840
	for <lists+openbmc@lfdr.de>; Sun, 30 Jan 2022 19:48:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jn0Zd6zGbz3bSh
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 05:48:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=F/u7iXKf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62a;
 helo=mail-ej1-x62a.google.com; envelope-from=andy.shevchenko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=F/u7iXKf; dkim-atps=neutral
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jn0ZG3TjZz2yfc
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jan 2022 05:48:04 +1100 (AEDT)
Received: by mail-ej1-x62a.google.com with SMTP id s5so36015802ejx.2
 for <openbmc@lists.ozlabs.org>; Sun, 30 Jan 2022 10:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aoIi1xNlWyLsIaWBt8loIMMaCfondWklXIe5cHckPXY=;
 b=F/u7iXKfIY7c/7MmsgcafAjL/R6D4j1JPVHCBPaOeuSGXeCyWf6fTcgqnDEwO8NMgI
 uGKtVlqLYq3zOeKxT4oeuAJDw1RjqQtFAA2Ob0XnMesqt/bL4ECwww4zoJuHxDuB3diq
 ihxLpZpZXH67vnODkTt5fysR03eeYnUGxCuPQzU5032rVZOb7G1RDioV5skOVc3R3cqF
 X90vRsZPhP4nKAoOq8i4qrn7RQYoAfvaeXk3CB6MR+9YY9hvM2bLFqigExY77dkkp/Tu
 OIsc0zs036FSGuyREoXtHszi6waolcgFdVrzaltXp9IM5N2vIjrnWbpcD1EbUbsNs+Qb
 cCyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aoIi1xNlWyLsIaWBt8loIMMaCfondWklXIe5cHckPXY=;
 b=OjgslkGwCyNW/gKKOVgh44uBMaA89DxJV4NZCkS8bfPo19+6aTZPdOWEMmzhOH3/zE
 dLX7AnhDMqosyg9zPCvS+dVs/kCF/pxysHUpms7ChEAIQH7iS2+fiD1P9rO5GMucXWxZ
 4QbVgDJSP9QrF+wv1ghTq6eVhFo4JqrNiZymfkS1zs7MlFDNH0Mt6h0uIx9JtPdm2Vwk
 yXQJ3MH0XsYUJZlPiRzN9VwVEv9/7leXSiZ9f1YAr/3Fu0rzPP/39X4+qBVh0EJxaakk
 5quBFM9DQEfk+5IiarCHt8X3EIdsJfmzqCNg74EQNHSGVBbSfjpD9BlYvjvKOb+ntIAA
 dyWw==
X-Gm-Message-State: AOAM532MjPFOw89YeghA5zDFpo8/0dK1/6/XzbEK5O49C27jNS3ij8Me
 KcySTDsxUCTS21CglMquUHrdQYVy1yQJM6v4mM0=
X-Google-Smtp-Source: ABdhPJynTXX9qeIiR8ceufTHQt8Z8Xy4Vq4iwbqRbcJjN6l+Y0Ej2OIWh6p8hW3KZNCDqZAEue+JXmeyiTwBiXL1TTY=
X-Received: by 2002:a17:906:604d:: with SMTP id
 p13mr14162629ejj.639.1643568479968; 
 Sun, 30 Jan 2022 10:47:59 -0800 (PST)
MIME-Version: 1.0
References: <20220129115228.2257310-6-j.neuschaefer@gmx.net>
 <202201292234.NpSNe4TD-lkp@intel.com>
In-Reply-To: <202201292234.NpSNe4TD-lkp@intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 30 Jan 2022 20:47:23 +0200
Message-ID: <CAHp75VdVoqRk6bLwaOPfGdfyVoH_9DUj2Lb4VBOHrhM9SpoMNA@mail.gmail.com>
Subject: Re: [PATCH v5 5/9] pinctrl: nuvoton: Add driver for WPCM450
To: kernel test robot <lkp@intel.com>
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
Cc: devicetree <devicetree@vger.kernel.org>, kbuild-all@lists.01.org,
 Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, Jan 29, 2022 at 4:10 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi "Jonathan,
>
> I love your patch! Perhaps something to improve:
>
> [auto build test WARNING on linusw-pinctrl/devel]
> [also build test WARNING on robh/for-next linus/master v5.17-rc1 next-20220128]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Jonathan-Neusch-fer/Nuvoton-WPCM450-pinctrl-and-GPIO-driver/20220129-195955
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
> config: um-allmodconfig (https://download.01.org/0day-ci/archive/20220129/202201292234.NpSNe4TD-lkp@intel.com/config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> reproduce (this is a W=1 build):
>         # https://github.com/0day-ci/linux/commit/3fd91ea1bad905592e89c8f987f6bd3740329b80
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Jonathan-Neusch-fer/Nuvoton-WPCM450-pinctrl-and-GPIO-driver/20220129-195955
>         git checkout 3fd91ea1bad905592e89c8f987f6bd3740329b80
>         # save the config file to linux build tree
>         mkdir build_dir
>         make W=1 O=build_dir ARCH=um SHELL=/bin/bash drivers/pinctrl/nuvoton/
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):

...

> >> drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c:908: warning: "DS" redefined
>      908 | #define DS(lo, hi) (((lo) << DRIVE_STRENGTH_LO_SHIFT) | \
>          |

>    arch/x86/um/shared/sysdep/ptrace_64.h:38: note: this is the location of the previous definition
>       38 | #define DS (HOST_DS * sizeof(long))

This is a good example why short and namespace-less definitions are
not always good even in standalone module.

...

>    drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c: In function 'npcm7xx_get_groups_count':
>    drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c:1564:21: warning: format '%d' expects argument of type 'int', but argument 4 has type 'long unsigned int' [-Wformat=]

Should be %zu

If it's already in for-next, there should be two patches to fix these issues.

-- 
With Best Regards,
Andy Shevchenko
