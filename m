Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C7C7A593F
	for <lists+openbmc@lfdr.de>; Tue, 19 Sep 2023 07:15:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FFCHMAR7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RqVHK653wz3c3H
	for <lists+openbmc@lfdr.de>; Tue, 19 Sep 2023 15:15:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FFCHMAR7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RqVGl0cc1z2yV3
	for <openbmc@lists.ozlabs.org>; Tue, 19 Sep 2023 15:15:09 +1000 (AEST)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c00e1d4c08so25974321fa.3
        for <openbmc@lists.ozlabs.org>; Mon, 18 Sep 2023 22:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695100505; x=1695705305; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=glQJiHiiQFXDprtTfi+FevimcPzsz0WU/CYVveuM5As=;
        b=FFCHMAR7A8qIyEifkQphVYwyGXGL8lS1xHFkbyS6Supomfvglv/XnoBIq8QLu6Z/kI
         gZqsc4MWoRp/VRiFClq1ETnRrMlf2qp/RTtggz8bPpN3/3kiKozBGJi2X9y54eyGMk1o
         t1jx+ilEKsWa1j+ICpcyVFz+0l8Tgm0+QludHwfnsORJz5FcI1X0h1qp9npjuue4T16F
         RTzxAItz6XdEQP+Tz+x1Irsv0Cpcz7nQ0HVg6333574eMjlr5WTeq8UXgEicJduPqafs
         vwClmzH7uSfYHnZ6x5gEmScjfwlalaLvF4kmULvtf0x710wbKkLBzOub4I7N1m/O6m5d
         jJJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695100505; x=1695705305;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=glQJiHiiQFXDprtTfi+FevimcPzsz0WU/CYVveuM5As=;
        b=RKBDMlk5RQ1Mk+0gm5yL/fYPNYaTve27uDzQt6i2h1bLBJpm5xL64EBOQsjs3n0/4T
         PC46iiQMBOV0aTelll+bS2tBF2KmOm7oz41EoT/0WTZOsmJb+HWSH9N22w2VKwTfoon+
         fjbnzkgyCA/W0m38WU3ACgYSi4fALIQ1q3oUagTWMbs8QHnyIHTrfvzNtwvJ3ClPBKzZ
         jQZiYAJrsdXLjEMBW1YGXyVHY0Xp37hhAIIQOuwv0e9kMmMtrBmE7IRrPymjSrdYsrrj
         yHUY5ckVKjz9v6lVl7mCFAz5eTa7TMu6NRAkDtJQfcK8DpGj1aFnSoIGiT1mSu7TKBU4
         pKAA==
X-Gm-Message-State: AOJu0YwYWd7uXdmjZizRJCtMFLPqhn887PgVstWKEI15EVFoMlFTE/Em
	uur1G1QmY91uNgNhGKukwFKmvOv6l+5D7w4mcEg=
X-Google-Smtp-Source: AGHT+IEAH5kMAHAiTI5BtK+SJ3ujWEh5t5l0gqQHNUIbKLbzTbe83gQLNCM8UXCjLdKRdYq1Er8M9KFyhKgprmA8GKY=
X-Received: by 2002:a2e:9791:0:b0:2bd:1cd0:603f with SMTP id
 y17-20020a2e9791000000b002bd1cd0603fmr8591041lji.45.1695100504861; Mon, 18
 Sep 2023 22:15:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230918165958.2659-1-tmaimon77@gmail.com> <20230918165958.2659-2-tmaimon77@gmail.com>
 <b7a337f2-a810-d14c-e7cd-15e33a9ecb5d@linaro.org>
In-Reply-To: <b7a337f2-a810-d14c-e7cd-15e33a9ecb5d@linaro.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 19 Sep 2023 08:14:53 +0300
Message-ID: <CAP6Zq1gSJYsNUuD-bexFW_1VpAUuF_WZkicNzZms6hVdo9LnMQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-binding: usb: ci-hdrc-usb2: document Nuvoton
 NPCM supprt
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: devicetree@vger.kernel.org, peng.fan@nxp.com, linux-usb@vger.kernel.org, benjaminfair@google.com, avifishman70@gmail.com, gregkh@linuxfoundation.org, peter.chen@kernel.org, xu.yang_2@nxp.com, j.neuschaefer@gmx.net, tali.perry1@gmail.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Krzysztof

Thanks for you comment

On Mon, 18 Sept 2023 at 23:18, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 18/09/2023 18:59, Tomer Maimon wrote:
> > Nuvoton NPCM BMC SoCs use ChipIdea silicon IP for the USB device controller.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching. It's dt-bindings.
O.K. Thanks
>
>
> > ---
> >  .../devicetree/bindings/usb/ci-hdrc-usb2.yaml    | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> > index 1394557517b1..9de4dfe004d1 100644
> > --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> > +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> > @@ -16,6 +16,7 @@ properties:
> >        - enum:
> >            - chipidea,usb2
> >            - lsi,zevio-usb
> > +          - nuvoton,npcm-udc
>
> You need SoC specific compatible.
O.K. Thanks,
>
> >            - nvidia,tegra20-ehci
> >            - nvidia,tegra20-udc
> >            - nvidia,tegra30-ehci
> > @@ -325,6 +326,20 @@ properties:
> >      type: boolean
> >      deprecated: true
> >
> > +  nuvoton,sysgcr:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    items:
> > +      - items:
> > +          - description: phandle to syscon that configures usb phy mux.
> > +          - description: offset of usb phy mux selection.
> > +          - description: mask usb phy mux selection.
> > +          - description: value usb phy mux selection.
> > +    description:
> > +      A phandle to syscon with three arguments that configure usb phy mux.
> > +      The argument one is the offset of usb phy mux selection, the argument two
> > +      is the mask usb phy mux selection, the argument three is the mask usb phy
> > +      mux selection.
>
> Sorry, you miss phy driver. Don't use syscon instead of proper hardware
> devices.
Sorry the role of nuvoton,sysgcr property is to handle a mux between
the different devices and not the handle the phy itself, handle the
mux done in the GCR.
Should we move the nuvoton,sysgcr description to another place in the
ci-hdrc-usb2.yaml
or
Should we use a different driver to handle the mux and call it from
the ci-hdrc-npcm driver, If yes which driver should we use?
>
>
> Best regards,
> Krzysztof
>

Best regards,

Tomer
