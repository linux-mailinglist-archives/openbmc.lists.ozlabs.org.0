Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D143A7A9498
	for <lists+openbmc@lfdr.de>; Thu, 21 Sep 2023 15:18:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Xmf35CH1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rrwvj4ZBlz3cG3
	for <lists+openbmc@lfdr.de>; Thu, 21 Sep 2023 23:18:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Xmf35CH1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rrwv44W4Sz30fD
	for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2023 23:18:06 +1000 (AEST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50300cb4776so1746793e87.3
        for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2023 06:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695302280; x=1695907080; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s0MtmUBoFFRZ1KaXa+vO728c+OI89EgadZUVnpzkFf4=;
        b=Xmf35CH1WUknCJ2nndFBX6R2uWreCRKK+iB41Sgehco26b/nIWdicQ2tTeRdeS+Mbm
         ELal7Z67tIvIhSqARLp3ZGRwtv3+mzADyWIeWgaXHuXbyAl1souw2BYfCbW4g2rM0OFH
         Mf2bPgKzGTfUFDnXL++TOndJ2BIowL1URlAi5mnAMo6FH/AS5uu9qvwIHUtiFgoHzwwj
         USsUOJKIPaIlSw2a8/GtWoyv1SZxVjdQHvGBXDG8h+wby6U4S3xem3pAfPqrPzxo0CZd
         AaT3uByNxuyHYrkQzR9UrMRqnLxJ1onnaBcPLl9mQpwoScrXih8cljDJgVHOuN5OPn6z
         8bYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695302280; x=1695907080;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s0MtmUBoFFRZ1KaXa+vO728c+OI89EgadZUVnpzkFf4=;
        b=tb+sfaLue5Q7G8qd0VEK0vmF78T24yLaeleLbhGLjNFjmPcmgHYtRNU2VkH6gK8SoX
         Ld+6Es381BkKOU7gT1YQ4jMqnDwcfWkXu+fE+Hpz2C123TQAi3ceHJu+H5rli1A6E+yT
         IQxSERyM9QWEeuJFUaGNV3zehE1oXswl8qeSVS5CYfDn9F12t0zjgYL4l78Dpn2pJ/Mm
         xkLthtSUIQlgn5WafPJD4OxMfYGCwluRNwgiIuWgGnzZrchTVPlG2NSdCjglw1NKq+42
         ORCshEFOTveQft7Vadm1mcvzhoqNRUZLjUUnIJMpkiaBavF2ZtnL84MrbaWmk0yWy3zr
         86dA==
X-Gm-Message-State: AOJu0YwSUzZx6oi3Sb0N71TUr6Q+c4WFdL3IfCKMJjExUSz9fWhiQi3u
	akWtm3EMw6ST/Tvv279oW6ZRpXLkSxugc7GHkt4=
X-Google-Smtp-Source: AGHT+IHYE8uHuhQAgOlNj2srv9Tl2K8NyVVKPejvFT4qvqp4BRCyx0VcWD+BRKbx2vEX0j1DXh6BQNj1kGISfZexFHU=
X-Received: by 2002:a2e:b713:0:b0:2b9:aa4d:3728 with SMTP id
 j19-20020a2eb713000000b002b9aa4d3728mr4606064ljo.29.1695302280319; Thu, 21
 Sep 2023 06:18:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230918165958.2659-1-tmaimon77@gmail.com> <20230918165958.2659-2-tmaimon77@gmail.com>
 <b7a337f2-a810-d14c-e7cd-15e33a9ecb5d@linaro.org> <CAP6Zq1gSJYsNUuD-bexFW_1VpAUuF_WZkicNzZms6hVdo9LnMQ@mail.gmail.com>
 <e0d42d13-b307-9915-97c8-948261b39ce1@linaro.org> <CAP6Zq1g0=-h0PFg2a8bqao+XjdNHoxGMdYSRRPAnfY_6WdemAw@mail.gmail.com>
 <20230919162837.GA4051010-robh@kernel.org> <CAP6Zq1hJPPAtKw8auC22wViHGQHTi0SufPJoBiqYtGWomnNUYQ@mail.gmail.com>
In-Reply-To: <CAP6Zq1hJPPAtKw8auC22wViHGQHTi0SufPJoBiqYtGWomnNUYQ@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 21 Sep 2023 16:17:48 +0300
Message-ID: <CAP6Zq1iUj8UfLZutyOVxbKgF42rMoF9ig3dViy7ApTHcqVoP7g@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-binding: usb: ci-hdrc-usb2: document Nuvoton
 NPCM supprt
To: Rob Herring <robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, peng.fan@nxp.com, linux-usb@vger.kernel.org, benjaminfair@google.com, avifishman70@gmail.com, gregkh@linuxfoundation.org, peter.chen@kernel.org, xu.yang_2@nxp.com, j.neuschaefer@gmx.net, tali.perry1@gmail.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Rob,

Again thanks for your suggestion I took a look at the
drivers/usb/roles and I am not sure it answers NPCM ChipIdae case.
For example, in the NPCM845 we have ten UDC ChipIdea modules (UDC0-9).
Only UDC8 and UDC9 are muxed with USB host0 and USB host1.
NPCM UDC and NPCM USB host are different HW modules therefore different drivers.

The ChipIdea driver uses its own internal USB role function to switch
between ChipIdea UDC and ChipIdea USB host and we can't replace it
with a unique NPCM USB role function also we need to set the mux only
at the probe stage.

This is why I have added nuvoton,sysgcr property to the NPCM ChipIdea driver.

With the above do you think I should do it differently?

On Wed, 20 Sept 2023 at 12:11, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Thanks Rob,
>
> I will check drivers/usb/roles
>
> On Tue, 19 Sept 2023 at 19:28, Rob Herring <robh@kernel.org> wrote:
> >
> > On Tue, Sep 19, 2023 at 04:31:56PM +0300, Tomer Maimon wrote:
> > > On Tue, 19 Sept 2023 at 15:39, Krzysztof Kozlowski
> > > <krzysztof.kozlowski@linaro.org> wrote:
> > > >
> > > > On 19/09/2023 07:14, Tomer Maimon wrote:
> > > > >>>            - nvidia,tegra20-ehci
> > > > >>>            - nvidia,tegra20-udc
> > > > >>>            - nvidia,tegra30-ehci
> > > > >>> @@ -325,6 +326,20 @@ properties:
> > > > >>>      type: boolean
> > > > >>>      deprecated: true
> > > > >>>
> > > > >>> +  nuvoton,sysgcr:
> > > > >>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > > > >>> +    items:
> > > > >>> +      - items:
> > > > >>> +          - description: phandle to syscon that configures usb phy mux.
> > > > >>> +          - description: offset of usb phy mux selection.
> > > > >>> +          - description: mask usb phy mux selection.
> > > > >>> +          - description: value usb phy mux selection.
> > > > >>> +    description:
> > > > >>> +      A phandle to syscon with three arguments that configure usb phy mux.
> > > > >>> +      The argument one is the offset of usb phy mux selection, the argument two
> > > > >>> +      is the mask usb phy mux selection, the argument three is the mask usb phy
> > > > >>> +      mux selection.
> > > > >>
> > > > >> Sorry, you miss phy driver. Don't use syscon instead of proper hardware
> > > > >> devices.
> > > > > Sorry the role of nuvoton,sysgcr property is to handle a mux between
> > > > > the different devices and not the handle the phy itself, handle the
> > > > > mux done in the GCR.
> > > > > Should we move the nuvoton,sysgcr description to another place in the
> > > > > ci-hdrc-usb2.yaml
> > > > > or
> > > > > Should we use a different driver to handle the mux and call it from
> > > > > the ci-hdrc-npcm driver, If yes which driver should we use?
> > > >
> > > > What is an "usb phy mux"?
> > > We have USB phy that could be connected to USB host (different driver)
> > > or it can be connected to the UDC driver(ChipIdea)
> >
> > Isn't that just role switching? There is a driver framework for that in
> > drivers/usb/roles/. Though it doesn't seem widely used yet.
> >
> > Rob

Best regards,

Tomer
