Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBC07EC1D
	for <lists+openbmc@lfdr.de>; Fri,  2 Aug 2019 07:26:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460FyM3NgBzDqW4
	for <lists+openbmc@lfdr.de>; Fri,  2 Aug 2019 15:26:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::741; helo=mail-qk1-x741.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="Q4E3j8UI"; 
 dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460Fxk2RsJzDqTW;
 Fri,  2 Aug 2019 15:25:59 +1000 (AEST)
Received: by mail-qk1-x741.google.com with SMTP id w190so53887194qkc.6;
 Thu, 01 Aug 2019 22:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z32U+47NlX9GSdYxrOMIJkrmirJtRbWII8nnxF0TuFc=;
 b=Q4E3j8UI4qdvR1yVPLhpbG1bb2LoSf+oJmdOKYrZ3l9Nzeyu1LLSDKLj9UFAKvfJaI
 800cjW7JoCr+RIUKPQLGO6ejfXvXGY6mKepHIVWH5rn5JdR2KUX8ztVmw3dnJRU4YSec
 29wmTpZyk9irZGeI4aKHHK4rPfezHs2y0YY5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z32U+47NlX9GSdYxrOMIJkrmirJtRbWII8nnxF0TuFc=;
 b=ti7HjKU8E63MyvUlrPNrFfnwfDsYCgTZHRVuoEFI/iCNG7PyX6TvLRHXsHNYe10yKh
 Okgf16SlltSr4A5fnh84mVgNdl0GF3CPgA/8ZvplM6JAdshgwDiVKi3ppj/j3YH2RBPI
 KxjXol8hNE7SC1xRVwuRK67x4YdzamhAdoRK0u0tChNA3GuqmMoW4QFlCSiyTunnAY6a
 pklfCHJqt/rSjjAmBpfbFJB5o3Bn5jy9/Ff5VFQlzDd1Hf3K+IPX3gdRZuL4uf1Bnds+
 4RUAGFq1OezuKyE6dazV5R48XTrfdBEHHqPzJsYItLNFNpAsdFWS4Tzl1QPiLl+s6wp4
 FrFA==
X-Gm-Message-State: APjAAAUyV5PZSbxLWZW7VdbvO45iMtt5aVRIOQNNk5yyH9C1093l01Aq
 irtM2YUu/wNv1bsqjv/h636CTkp8LPadfjxZcyA=
X-Google-Smtp-Source: APXvYqzKiJhQDXPLqDJ46c7VaRVieOmVC318o/1JxlUNJBBaxdRAWAOc7PQX4AhfQELWZtZ71FDimyPfqFOf5XX5BVw=
X-Received: by 2002:a05:620a:16d6:: with SMTP id
 a22mr89485291qkn.414.1564723555381; 
 Thu, 01 Aug 2019 22:25:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190802041010.1234178-1-taoren@fb.com>
 <CACPK8XcuwNE3aBrsgn-paTZt-EtF6pc6WwYBQef5xc7157bk2g@mail.gmail.com>
 <606273F4-E021-4AAF-9F59-F363E4FFF92A@fb.com>
In-Reply-To: <606273F4-E021-4AAF-9F59-F363E4FFF92A@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 2 Aug 2019 05:25:43 +0000
Message-ID: <CACPK8Xc-vjJJ_kbe_KGss+RDMdhRVw-YDj9Cdux8iERSvE0_GQ@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: Add Facebook Wedge100 BMC
To: Tao Ren <taoren@fb.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 2 Aug 2019 at 05:20, Tao Ren <taoren@fb.com> wrote:
>
> On 8/1/19, 9:21 PM, "Joel Stanley" <joel@jms.id.au> wrote:
>
> >  On Fri, 2 Aug 2019 at 04:10, Tao Ren <taoren@fb.com> wrote:
> >>
> >> Add initial version of device tree for Facebook Wedge100 AST2400 BMC
> >> platform.
> >>
> >> Signed-off-by: Tao Ren <taoren@fb.com>
> >> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> >> ---
> >>  Changes in v2:
> >>  - remove "debug" from bootargs.
> >
> > Thanks. I applied wedge40 and then this one fails to apply due to
> > conflicts in the Makefile. Next time you have two patches, send them
> > as a series they apply one atop the other.
>
> I thought about asking you if I should send them as a series although they are logically independent patches..
> Sorry about that and I will do so for future patches.
>
> >  The naming of these two files suggests they come from a family. I
> >  noticed there's very minor differences, a pca9548 switch and the use
> >  of a watchdog.
> >
> >  Are these device trees complete? If yes, do you think it's worthwhile
> >  to have a common wedge description in eg.
> >  aspeed-bmc-facebook-wedge.dtsi, and put the unique description in
> >  respective dts board files?
> >
> >  The upside of this is reduced duplication.
> >
> >  If you have a reason not to, then that is okay and we can leave it as
> >  you submitted them.
>
> Thank you for the suggestion. I'm also considering moving common stuff into "dtsi" file, but let me take care of it in a separate patch, mainly because:
>   1) I have one more BMC platform (galaxy100) which is also similar to wedge.
>       I haven't started the platform, but once I have galaxy100 device tree ready, it would be easier for me to extract common part.
>   2) the device tree is not complete yet.
>       For example, all the i2c devices are still created from userspace.
>       I'm trying to move the logic from userspace to device tree but I haven't decided what to do with those cpld/fpga devices.

Okay, thanks.

I've applied both of these to the aspeed tree for 5.4.

Cheers,

Joel
