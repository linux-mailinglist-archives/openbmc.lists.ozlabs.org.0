Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E020D58BAC9
	for <lists+openbmc@lfdr.de>; Sun,  7 Aug 2022 14:12:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M0yrF02fxz305P
	for <lists+openbmc@lfdr.de>; Sun,  7 Aug 2022 22:12:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=X8rltdjm;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::731; helo=mail-qk1-x731.google.com; envelope-from=tcminyard@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=X8rltdjm;
	dkim-atps=neutral
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M0yqn56MMz2xG6
	for <openbmc@lists.ozlabs.org>; Sun,  7 Aug 2022 22:11:47 +1000 (AEST)
Received: by mail-qk1-x731.google.com with SMTP id 17so4790041qky.8
        for <openbmc@lists.ozlabs.org>; Sun, 07 Aug 2022 05:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:from:to:cc;
        bh=zQGkdKu5K+mMGtINb8IUwXhsmEcLqR+snZ46Vc8nWxk=;
        b=X8rltdjmNBHQeJgcjT5qKvzBk79eACG1asdlFesZiy6mpB7LeCJF7SKsbdbpwbbRGU
         L5JPWtm6ii7OHXAzUWdcpmbBkfv9U6p1dxIbRbxH0ypFHqyTDdp5hx+UgzNqLvo3kt/q
         id4+yVLZ6A9XqLg4LE5kn5bB6eCDMWaXeK5W4IwzFhzV310nTnhLk4m1lBrYmCz5n3Ye
         ewSU1EmiL4x5YlqhdlFo7BTHk3sBl9jJj3NmnOirRC5pG9IBweefeZw3NBV6JpUoKHCY
         sPLKEk8/am2VcYKbwolANziEuKRbNbGGRN+bvhbPgQL9e+Mum1TwIOeuzII7ALtG4bfd
         yzNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
         :to:cc;
        bh=zQGkdKu5K+mMGtINb8IUwXhsmEcLqR+snZ46Vc8nWxk=;
        b=omRxlewcJtx0UBbg+m5KQihUxQvYh84pai5X3tw2HIX5wlEobK+mhuU3EucCiIcJZD
         a9Szpxp1KUxXoIOgAUkUDdkW9E941vFwdL9b3Jb/FW2mNxM7HSv50lMGqiNWbIyO3GPk
         ThG5Me99uTNuoVo4Bv1i5E2cup42pNC/lfmC7MalFm3oxdP2dV/RRzDnHUm24nnEKEg7
         sztLGrsbzb+Nf2ajJ5v649ozDro8coYxeFJZQT4gcqkLVzAFIIBjPO8Y8whZZuPtkavf
         v3+5jSxr0kyQqgLCOEr43UGjL77gEL+SwDXG6d1X82NwJaq1c8Cto5QuVkN4HDtaBxFC
         uqFA==
X-Gm-Message-State: ACgBeo2cl/5Q7M5LqIEq0MGlvUv842IqGX7Qppje/3oTmUTjA4q7Qjvi
	SaZSOIn8eU+J1aHsGhmnMA==
X-Google-Smtp-Source: AA6agR6tyvVQVxivjpXI2f1/rmVg+DidYfAL1meKadBKrz4FxbrEPGrSK2B9b9rWSowTqapwQ782xQ==
X-Received: by 2002:a05:620a:460c:b0:6b8:fbfd:b963 with SMTP id br12-20020a05620a460c00b006b8fbfdb963mr11002856qkb.140.1659874301700;
        Sun, 07 Aug 2022 05:11:41 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id y8-20020a37f608000000b006b66510f4f7sm6896108qkj.6.2022.08.07.05.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 05:11:41 -0700 (PDT)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:18ee:4123:89ce:5c5d])
	by serve.minyard.net (Postfix) with ESMTPSA id B96051800FA;
	Sun,  7 Aug 2022 12:11:39 +0000 (UTC)
Date: Sun, 7 Aug 2022 07:11:38 -0500
From: Corey Minyard <minyard@acm.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v2] dt-binding: ipmi: add fallback to npcm845 compatible
Message-ID: <20220807121138.GL3834@minyard.net>
References: <20220804181800.235368-1-tmaimon77@gmail.com>
 <20220805115827.GG3834@minyard.net>
 <CAP6Zq1gfvEpUF-TKhA8EdJqBtwaVvJR3qxtn=8Li4swHB6sDYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP6Zq1gfvEpUF-TKhA8EdJqBtwaVvJR3qxtn=8Li4swHB6sDYQ@mail.gmail.com>
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
Reply-To: minyard@acm.org
Cc: devicetree <devicetree@vger.kernel.org>, Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, openipmi-developer@lists.sourceforge.net, Jonathan Cameron <jic23@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, Aug 07, 2022 at 11:03:56AM +0300, Tomer Maimon wrote:
> Hi Corey,
> 
> Thanks for your comment.
> 
> On Fri, 5 Aug 2022 at 14:58, Corey Minyard <minyard@acm.org> wrote:
> >
> > On Thu, Aug 04, 2022 at 09:18:00PM +0300, Tomer Maimon wrote:
> > > Add to npcm845 KCS compatible string a fallback to npcm750 KCS compatible
> > > string becuase NPCM845 and NPCM750 BMCs are using identical KCS modules.
> > >
> > > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > > ---
> > >  Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt b/Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt
> > > index cbc10a68ddef..4fda76e63396 100644
> > > --- a/Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt
> > > +++ b/Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt
> > > @@ -7,7 +7,7 @@ used to perform in-band IPMI communication with their host.
> > >  Required properties:
> > >  - compatible : should be one of
> > >      "nuvoton,npcm750-kcs-bmc"
> > > -    "nuvoton,npcm845-kcs-bmc"
> > > +    "nuvoton,npcm845-kcs-bmc", "nuvoton,npcm750-kcs-bmc"
> >
> > This is just wrong.  The compatible is supposed to identify the device,
> > not the board the device is on.  I think compatible here should be
> > "npcm7xx-kcs-bmc", and just use that everywhere.  It's fine if that is
> > used on a board named npcm845.
> The NPCM8XX is not a board, The Nuvoton NPCM8XX is a fourth-generation
> BMC SoC device family.

Ok, but same principle applies.

If the device is exactly the same, then you would only use one of the
"npcm7xx-kcs-bmc" and put that in both device trees.  You can use
"nuvoton,npcm750-kcs-bmc", it's really not that important.  Or even
"nuvoton,npcm-kcs-bmc"

If the device has a minor difference that can be expressed in a 
parameter, then create a parameter for it.

If the device has enough differences that a parameter or two doesn't
cover it, then you put either nuvoton,npcm750-kcs-bmc or
nuvoton,npcm750-kcs-bmc in the device tree.  Not both.  Then you need
two entries in the of_device_id array and you use the data field or
something to express the difference.

Since there appears to be no difference, just put
"nuvoton,npcm750-kcs-bmc" in the npcm845 and I will drop the patch
adding all this.  Then a patch can be added saying it applies to both
the 7xx and 8xx series of BMC SOCs.  If you want to change the name,
then a patch will be needed for that, but then you will need multiple
entries in your device tree, but you would not document it as such, as
there would only be one that applies for this kernel.

I'm pretty sure the only reason to have muliple compatible entries in a
device tree is to cover multiple kernels where the name changed.

-corey

> >
> > -corey
> >
> > >  - interrupts : interrupt generated by the controller
> > >  - kcs_chan : The KCS channel number in the controller
> > >
> > > --
> > > 2.33.0
> > >
> 
> Best regards,
> 
> Tomer
