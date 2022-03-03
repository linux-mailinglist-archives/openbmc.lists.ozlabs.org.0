Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDCA4CBE76
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 14:04:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8WR426qbz3c2q
	for <lists+openbmc@lfdr.de>; Fri,  4 Mar 2022 00:04:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Ztb+V9aW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f31;
 helo=mail-qv1-xf31.google.com; envelope-from=tali.perry1@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Ztb+V9aW; dkim-atps=neutral
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8WQj3cTwz3bsc
 for <openbmc@lists.ozlabs.org>; Fri,  4 Mar 2022 00:04:12 +1100 (AEDT)
Received: by mail-qv1-xf31.google.com with SMTP id x3so3998004qvd.8
 for <openbmc@lists.ozlabs.org>; Thu, 03 Mar 2022 05:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/lVVqGzxWl1Ux5ICb2CCCQDe80RAQD6Gjf6fg6zMkY8=;
 b=Ztb+V9aWpOLnDQnK8i2xWUBhxQ7+roYPkRS4jvaARlWILKSyBe7MfmnHHd3R4n+bFT
 ClCXjl97vna3KL0S2uQszBOzV7kFp8m0N7Hot0+fvLLSnlmWebPTaW8zeUP2EKP0+/eg
 oYQVSNAjkaks3Nc88jbzNy5KYE6ZFW6UZQ3V/md9sRy+Wl98aDfOuWtbGYaGg/5h3bpV
 +tUSRAfOsPwShrpRdlUdUtGwFieCOQgBEGd4TIrvDKidxGtU5pU/ShEv5bo0NY+Ye5rW
 r2JhUXmQZVBtrB5Ez/Gyom1FkFb/O7KEYgBdiRXYVMv97NwteH/TTiuU/GE7uTgid+3f
 JZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/lVVqGzxWl1Ux5ICb2CCCQDe80RAQD6Gjf6fg6zMkY8=;
 b=Icl0MAurDKyDY9upFwWPZwFBUqrCgPec4yZ5XpoQ838SnEvllFYYZUf7FRsQEyhIjh
 dMaA2QlFAaqI9Rk4SG1KCeqCNIbNpLB1rJcdDh4ygj7U1TXv8LVRr694U4FGHTlu9dj1
 ED0b8ShmNWSFGyppt6bymk2KVXrkAIpSjBn6QaDSFHgQ6QImW+nOPy2+j0sxWbecPJsh
 l+vY5c6nzJSXn//bDoRMxHhP+RnJqocVEjDqNFx1RbKINr5QzZ4j7ok0QCVbKaIk6xpI
 b3iCoKgik+XnO2u4TPbZTJT28nI3PUXUIoKmjpdG1VeN6IjUGwXdCdZ1LGIzSeAk1hZo
 Jglw==
X-Gm-Message-State: AOAM530jpLDvxrPu20KOxTP7UZHQRpBHsEz0wY1zrlKet0BM4GcV1Q7p
 Eg50D7TDQGa7WXcFE8+xHR2rvmS9DHODPQREyq0=
X-Google-Smtp-Source: ABdhPJwdktgf6aoxdjY555xRSyIKgajAti2vfX8KCBRVqgNzmbSLxxuW2JQwZsXmzwFidaRikPpLS1azpbs3dq6ldI8=
X-Received: by 2002:ad4:5ba8:0:b0:434:66a8:6cd8 with SMTP id
 8-20020ad45ba8000000b0043466a86cd8mr10177600qvq.4.1646312650715; Thu, 03 Mar
 2022 05:04:10 -0800 (PST)
MIME-Version: 1.0
References: <20220303083141.8742-1-warp5tw@gmail.com>
 <YiCXujUOUum+CAU9@smile.fi.intel.com>
In-Reply-To: <YiCXujUOUum+CAU9@smile.fi.intel.com>
From: Tali Perry <tali.perry1@gmail.com>
Date: Thu, 3 Mar 2022 15:03:59 +0200
Message-ID: <CAHb3i=sW16cykfp2Q=s6evzodD4wKreK3PrOb2YPeQzE-NWe4A@mail.gmail.com>
Subject: Re: [PATCH v3 00/11] i2c: npcm: Bug fixes timeout, spurious interrupts
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, devicetree <devicetree@vger.kernel.org>,
 yangyicong@hisilicon.com, Linux I2C <linux-i2c@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, JJLIU0@nuvoton.com,
 lukas.bulwahn@gmail.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com,
 bence98@sch.bme.hu, arnd@arndb.de, sven@svenpeter.dev,
 Rob Herring <robh+dt@kernel.org>, Avi Fishman <Avi.Fishman@nuvoton.com>,
 Tyrone Ting <warp5tw@gmail.com>, semen.protsenko@linaro.org,
 jie.deng@intel.com, avifishman70@gmail.com,
 Patrick Venture <venture@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wolfram Sang <wsa@kernel.org>, kfting@nuvoton.com,
 Tali Perry <tali.perry@nuvoton.com>, olof@lixom.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Mar 3, 2022 at 12:27 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Mar 03, 2022 at 04:31:30PM +0800, Tyrone Ting wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > This patchset includes the following fixes:
> >
> > - Add dt-bindings description for NPCM845.
> > - Bug fix for timeout calculation.
> > - Better handling of spurious interrupts.
> > - Fix for event type in slave mode.
> > - Removal of own slave addresses [2:10].
> > - Support for next gen BMC (NPCM845).
> >
> > The NPCM I2C driver is tested on NPCM750 and NPCM845 evaluation boards.
>
> Overall my impression that the code was never tested for this driver and
> somehow appears in the upstream and hence this series.
>
> Anyway, I'm going to review the changes here.
>
> --


Actually it was and is being used by multiple users in lots of BMCs.
We haven't submitted patches for this driver for a while
and accumulated them all on Nuvoton Github repo, but now we wanted to
clear the table.

All your comments will be addressed and fixed for the next patchset.
As always, we really appreciate your review and taking the time to go
through all these changes.


> With Best Regards,
> Andy Shevchenko
>
>

Thanks!

Tali Perry
