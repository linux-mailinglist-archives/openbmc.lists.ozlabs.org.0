Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4D37A76F1
	for <lists+openbmc@lfdr.de>; Wed, 20 Sep 2023 11:12:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Q8M4jEyF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RrCVD40N9z3cHF
	for <lists+openbmc@lfdr.de>; Wed, 20 Sep 2023 19:12:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Q8M4jEyF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RrCTc0NY9z3c89
	for <openbmc@lists.ozlabs.org>; Wed, 20 Sep 2023 19:12:02 +1000 (AEST)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c022ce8114so30946051fa.1
        for <openbmc@lists.ozlabs.org>; Wed, 20 Sep 2023 02:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695201114; x=1695805914; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p1x4ulOTEjSOQ+Fhe0wwtsVsIHWMLD1pUZs5tuTFtbg=;
        b=Q8M4jEyFHuhLFYKLcdhydGeS0rDmBvtQmYLjFmw6qlQ7YZw9B4ZJSlqCNSBE4n5EUJ
         lfjd1FVOAkCs6p+VQcXDOZvyupwF30SYvHHuFKnJ/M9NpzCBTIkrHhYZXYvje1Hsgdhh
         8pL27ypxiisbYadcOaAlAz0qkFjHGTo8s9NtssnV2tx3TEKkaTxAhFK78GAAi5faXToy
         ncgAD8MrtQuwUZQojjmsNycz7OzMmCQX7Bo17Sfa2H1hN3yNX6FNJVh6UnKKmjXoWlSn
         n6jZmAG0SPU+H5vfhz1ZgZiG8jbiNunOfb1NFBc/rg19O49tp18YMWNryPJhfYjqzsd9
         KKKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695201114; x=1695805914;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p1x4ulOTEjSOQ+Fhe0wwtsVsIHWMLD1pUZs5tuTFtbg=;
        b=SdttxLUridyTQFfqE/eTt5QAtrE5vAFXQJQp9m17KWMbfNtYDiraJ45GuvJdu+E0h+
         /1fSOqZxMEg+dOjotF/a3q+g2D2TatP4v9PqF7f2bumZ3NDvXN4o0klk8hB0qJt/Z70S
         LTPm1OBMQzVdyUfTCTPKP7dyTNpiu9xJmlxKaUenMBrHMGF1H84UAX/upKoDsQuAb3ky
         m+uH6++HEbfVwatq6hDeLJI2BjjnS3c0bqQIxeg/8whDjPGOHy/kOZt71Xicz1T2+UqH
         wMd+KuXNrZrCLhmwLszISFE7dsOlsc1YOK3M2GvRXAQCSaoTpnX5ObiBUHR6VBl2Wf/u
         0LmA==
X-Gm-Message-State: AOJu0YxRUrtltEFXPWLnWznXhrCFHYoYfMX0y+DMVLhyx+8C07G3swf4
	TYyYqh7lYInLijfV1x7GpCQ54YTKEFCVkGJUIFk=
X-Google-Smtp-Source: AGHT+IFlh2NMaNjIOP8F/dYh1vzEh1bzqCv3IbyFy9N9OxrC9YilV6QuzTIVZeKPc31ouZElzHmBQXyCZ6wUhyRpZKo=
X-Received: by 2002:a2e:9b86:0:b0:2bf:fb49:6619 with SMTP id
 z6-20020a2e9b86000000b002bffb496619mr1513872lji.23.1695201114215; Wed, 20 Sep
 2023 02:11:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230918165958.2659-1-tmaimon77@gmail.com> <20230918165958.2659-2-tmaimon77@gmail.com>
 <b7a337f2-a810-d14c-e7cd-15e33a9ecb5d@linaro.org> <CAP6Zq1gSJYsNUuD-bexFW_1VpAUuF_WZkicNzZms6hVdo9LnMQ@mail.gmail.com>
 <e0d42d13-b307-9915-97c8-948261b39ce1@linaro.org> <CAP6Zq1g0=-h0PFg2a8bqao+XjdNHoxGMdYSRRPAnfY_6WdemAw@mail.gmail.com>
 <20230919162837.GA4051010-robh@kernel.org>
In-Reply-To: <20230919162837.GA4051010-robh@kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 20 Sep 2023 12:11:42 +0300
Message-ID: <CAP6Zq1hJPPAtKw8auC22wViHGQHTi0SufPJoBiqYtGWomnNUYQ@mail.gmail.com>
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

Thanks Rob,

I will check drivers/usb/roles

On Tue, 19 Sept 2023 at 19:28, Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Sep 19, 2023 at 04:31:56PM +0300, Tomer Maimon wrote:
> > On Tue, 19 Sept 2023 at 15:39, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> > >
> > > On 19/09/2023 07:14, Tomer Maimon wrote:
> > > >>>            - nvidia,tegra20-ehci
> > > >>>            - nvidia,tegra20-udc
> > > >>>            - nvidia,tegra30-ehci
> > > >>> @@ -325,6 +326,20 @@ properties:
> > > >>>      type: boolean
> > > >>>      deprecated: true
> > > >>>
> > > >>> +  nuvoton,sysgcr:
> > > >>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > > >>> +    items:
> > > >>> +      - items:
> > > >>> +          - description: phandle to syscon that configures usb phy mux.
> > > >>> +          - description: offset of usb phy mux selection.
> > > >>> +          - description: mask usb phy mux selection.
> > > >>> +          - description: value usb phy mux selection.
> > > >>> +    description:
> > > >>> +      A phandle to syscon with three arguments that configure usb phy mux.
> > > >>> +      The argument one is the offset of usb phy mux selection, the argument two
> > > >>> +      is the mask usb phy mux selection, the argument three is the mask usb phy
> > > >>> +      mux selection.
> > > >>
> > > >> Sorry, you miss phy driver. Don't use syscon instead of proper hardware
> > > >> devices.
> > > > Sorry the role of nuvoton,sysgcr property is to handle a mux between
> > > > the different devices and not the handle the phy itself, handle the
> > > > mux done in the GCR.
> > > > Should we move the nuvoton,sysgcr description to another place in the
> > > > ci-hdrc-usb2.yaml
> > > > or
> > > > Should we use a different driver to handle the mux and call it from
> > > > the ci-hdrc-npcm driver, If yes which driver should we use?
> > >
> > > What is an "usb phy mux"?
> > We have USB phy that could be connected to USB host (different driver)
> > or it can be connected to the UDC driver(ChipIdea)
>
> Isn't that just role switching? There is a driver framework for that in
> drivers/usb/roles/. Though it doesn't seem widely used yet.
>
> Rob
