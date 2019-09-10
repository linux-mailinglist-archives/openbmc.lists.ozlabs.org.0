Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F86AEAC2
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2019 14:43:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SPpj4KzdzDsRH
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2019 22:43:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::441; helo=mail-wr1-x441.google.com;
 envelope-from=daniel.thompson@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="pEwdeA+6"; 
 dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SPnw46gczDsQ6
 for <openbmc@lists.ozlabs.org>; Tue, 10 Sep 2019 22:42:59 +1000 (AEST)
Received: by mail-wr1-x441.google.com with SMTP id l11so19915397wrx.5
 for <openbmc@lists.ozlabs.org>; Tue, 10 Sep 2019 05:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Ub4SnTSb6gIhX0nmNU7ISH0G8O7vugmWfe28Zf8iviI=;
 b=pEwdeA+6eJ8v3UkA9Jzqd5hUweTKn/5vjQBsphWKp3lGezCEmdxB0gkbJnCOEKhGrz
 od2fxEWrNAXGFXdzA33ye3zBGBOj/TLNpu8qryAqCl36Q8YrMxPchxUjjH/s6iaAskST
 nG14v8Olaqg4c72biCSQvDGbqyDto7+ftndjhrijahjXqLbo57GqwAN8Tu7vSi6kOGXL
 dv6Mz5F+83dIbK/Fc3+of/C+73aiioDMEJ/03ccEPHtQpdIUlIxBolLpu6aWQe/SbT09
 lz7f3H58FD/0HQqJttinWByYSGkebP5i289Jmv9hiLHi+8LDCuWuizCnIIOfEnizaqIK
 tEyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Ub4SnTSb6gIhX0nmNU7ISH0G8O7vugmWfe28Zf8iviI=;
 b=YbW2NnVo/JN7INRiTnz5d0r+ge+HNV0PvnPw02ChlZLUH9EfR7568QnCWrS7/AvOap
 OzCVOq5hPE+OVDJI5rrweRtUeNAwhBBr/QgFXq2NSpudJluYlLzc3pLXaGWtREDlBvbQ
 I/dPF8HFWqYim2kvcI+u2ql5hkg4kMI+Afh7QuFJ+AypZGo3KWEi8SmX0AeNFKbSxLfd
 nJxiaOVRMBZkL0CQIOTXbqam5A6Y4pf+zoEU+jsE8mauW5QUvrrB0Kd33L2r4ycTAC+q
 7LGoaLJjjNJtf97OrO60ztdfPpDpmy1N7w8+M2TjrqDlj+5f/JBX/PX416IJxLKThP0p
 JYKw==
X-Gm-Message-State: APjAAAWC3UD4EZg8JZ16vfLleDZI1GgQiuDsGADZ3Ldhke8+p3Q3sE2c
 3jbPpMvz3Ev5Y6ZZqliMxSFNPQ==
X-Google-Smtp-Source: APXvYqxFgL8FIlOMUuSCgraQ22g8Zjq1m1xa+tcRMBGgUky84S5wpONFoqDvxPucL2VbgiLpgWRkng==
X-Received: by 2002:a05:6000:12d1:: with SMTP id
 l17mr25805559wrx.91.1568119372913; 
 Tue, 10 Sep 2019 05:42:52 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id h5sm13118486wrr.10.2019.09.10.05.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2019 05:42:52 -0700 (PDT)
Date: Tue, 10 Sep 2019 13:42:50 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-binding: hwrng: add NPCM RNG documentation
Message-ID: <20190910124250.2i5muqjt5c35kvgb@holly.lan>
References: <20190909123840.154745-1-tmaimon77@gmail.com>
 <20190909123840.154745-2-tmaimon77@gmail.com>
 <20190910102505.vgyomi575ldrk2lq@holly.lan>
 <CAP6Zq1igPJ5PvaA2YaC-=ngQOnatt4PFJj-QzaJCueDf6KA19A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP6Zq1igPJ5PvaA2YaC-=ngQOnatt4PFJj-QzaJCueDf6KA19A@mail.gmail.com>
User-Agent: NeoMutt/20180716
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
Cc: Mark Rutland <mark.rutland@arm.com>, sumit.garg@linaro.org,
 linux-crypto@vger.kernel.org, herbert@gondor.apana.org.au,
 Arnd Bergmann <arnd@arndb.de>, devicetree <devicetree@vger.kernel.org>,
 Avi Fishman <avifishman70@gmail.com>, Greg KH <gregkh@linuxfoundation.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, vkoul@kernel.org,
 Rob Herring <robh+dt@kernel.org>, mpm@selenic.com,
 Patrick Venture <venture@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 jens.wiklander@linaro.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Sep 10, 2019 at 02:55:44PM +0300, Tomer Maimon wrote:
> Hi Daniel,
> 
> Sorry but I have probably miss it, thanks a lot for your comment
> 
> On Tue, 10 Sep 2019 at 13:25, Daniel Thompson <daniel.thompson@linaro.org>
> wrote:
> 
> > On Mon, Sep 09, 2019 at 03:38:39PM +0300, Tomer Maimon wrote:
> > > Added device tree binding documentation for Nuvoton BMC
> > > NPCM Random Number Generator (RNG).
> > >
> > > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > > ---
> > >  .../bindings/rng/nuvoton,npcm-rng.txt           | 17 +++++++++++++++++
> > >  1 file changed, 17 insertions(+)
> > >  create mode 100644
> > Documentation/devicetree/bindings/rng/nuvoton,npcm-rng.txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/rng/nuvoton,npcm-rng.txt
> > b/Documentation/devicetree/bindings/rng/nuvoton,npcm-rng.txt
> > > new file mode 100644
> > > index 000000000000..a697b4425fb3
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/rng/nuvoton,npcm-rng.txt
> > > @@ -0,0 +1,17 @@
> > > +NPCM SoC Random Number Generator
> > > +
> > > +Required properties:
> > > +- compatible  : "nuvoton,npcm750-rng" for the NPCM7XX BMC.
> > > +- reg         : Specifies physical base address and size of the
> > registers.
> > > +
> > > +Optional property:
> > > +- quality : estimated number of bits of true entropy per 1024 bits
> > > +                     read from the rng.
> > > +                     If this property is not defined, it defaults to
> > 1000.
> >
> > There are pending unreplied review comments about this property (my own
> > as it happens):
> > https://patchwork.kernel.org/patch/11119371/
> >
> > No, there isn't different SoCs.
> we had checked the quality of the hwrng and the results we got are set as
> default.
> we been asked from one of our client to have a dynamic quality, they will
> like to be more strict when using the hwrng.
> is it problematic to add it?

It's a slightly grey area but in general the role of devicetree is to
describe the hardware. This parameter is not doing that.

If you view the quality assessment of this RNG to be a user preference
it is better set the quality to zero which is what the vast majority of
hwrng devices do. When the driver sets the quality to zero then the
kernel does not stir the entropy pool automatically... instead it
relies on the userspace rngd to do that. If the user wants the kernel
to stir the pool automatically then the quality can be set using the
default_quality kernel parameter.


Daniel.

> 
> Having a controllable quality implies that the numeric quality of the
> peripheral changes when it is stamped out on different SoCs (otherwise
> the driver can confidently set the quality without needing any hint
> from the DT). Is that really true here?
> 
> 
> > Daniel.
> >
> > > +
> > > +Example:
> > > +
> > > +rng: rng@f000b000 {
> > > +     compatible = "nuvoton,npcm750-rng";
> > > +     reg = <0xf000b000 0x8>;
> > > +};
> > > --
> > > 2.18.0
> > >
> >
