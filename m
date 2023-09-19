Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FF67A6535
	for <lists+openbmc@lfdr.de>; Tue, 19 Sep 2023 15:32:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=b5JUHTuV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RqjJr4zJ5z3c92
	for <lists+openbmc@lfdr.de>; Tue, 19 Sep 2023 23:32:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=b5JUHTuV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RqjJG0byDz2yV3
	for <openbmc@lists.ozlabs.org>; Tue, 19 Sep 2023 23:32:12 +1000 (AEST)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b95d5ee18dso94271581fa.1
        for <openbmc@lists.ozlabs.org>; Tue, 19 Sep 2023 06:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695130328; x=1695735128; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WwVxMLRoTi4jmpcZHwksJ5/u+vVpQogOzA/iWOhcTMI=;
        b=b5JUHTuVk1qAsRhQVHxLzgDBdFwqD8dSyfzK5p6N8NpSg7wrdVe9q0eoM89PDm82Fg
         6Q4eZqlV6TClkZgcGflCvbPyqkhaz6/28FrpVZ/I90c3ffIcQ5HMCcNaH3moaDy+5ODl
         IZsjsoM7uTB0gvHfuCtcB5TTOYisp2NX6DtcqRHfz5vao0fJ8ztH+LFKJLUrIe4N6Nuh
         lvC3Tf1t55OChLlkW54quGGhrFa2Hqdb/RMdazqZ3WwbD9vtyuLqdRPQr2qhkJnRGPK3
         gcqhwXY2v9Uk7xEPmOKxjDZHhmaOHL+WJwjRIZk0GEvp2PqjDPy0W44vgy1+EShsX9mG
         dRgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695130328; x=1695735128;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WwVxMLRoTi4jmpcZHwksJ5/u+vVpQogOzA/iWOhcTMI=;
        b=oaSQCATN9IBNBx9kCAZyVFCcq7vtJkja/luVDQfpY4EGWY2mAFeC7fwBbAOYWwWuoA
         B/7sAp5iyrkJJ8ie0x1MY3m+yPouUOvlyHivzNZbC1WgXOiyiSbBp0t+j9MT/JCWlnwm
         rXNq/mQDDIv7ccrhrz4JPtdxjr76vowhf4UETaIs9Oeyg3KLuWnUe8lVG/bCqNkt9FXh
         u7OVRTUEAIIui2QmIyaGJDHz+8ik1ZfhQoXZxSxNtqbYSPzFlSRr/r9Ppeh6hCleU+aX
         Zblsu8eXTicXSBoOnhoCGPp7raJcuBKmazFSR50zymJKV/lGFKnURH7XIW0XZuAStAQL
         UudA==
X-Gm-Message-State: AOJu0YwxROgCqxagaKWlvKEAb89bLCjE4Vx/bPTGEzvYQfYoD/LuhlP9
	ukDmfIwnFdEBulmtmYonJtwyvKdXaselPza/8iw=
X-Google-Smtp-Source: AGHT+IFsPbd3Z94I5V4mZLsZ0dcHcT44w/wtHVfCTyguyHRWhbnJq6iM8o/Htimw94qJ7HPxPLBgx9cHBwiGaoMkjBc=
X-Received: by 2002:a05:651c:1a1f:b0:2c0:2a6e:7869 with SMTP id
 by31-20020a05651c1a1f00b002c02a6e7869mr1667667ljb.44.1695130327566; Tue, 19
 Sep 2023 06:32:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230918165958.2659-1-tmaimon77@gmail.com> <20230918165958.2659-2-tmaimon77@gmail.com>
 <b7a337f2-a810-d14c-e7cd-15e33a9ecb5d@linaro.org> <CAP6Zq1gSJYsNUuD-bexFW_1VpAUuF_WZkicNzZms6hVdo9LnMQ@mail.gmail.com>
 <e0d42d13-b307-9915-97c8-948261b39ce1@linaro.org>
In-Reply-To: <e0d42d13-b307-9915-97c8-948261b39ce1@linaro.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 19 Sep 2023 16:31:56 +0300
Message-ID: <CAP6Zq1g0=-h0PFg2a8bqao+XjdNHoxGMdYSRRPAnfY_6WdemAw@mail.gmail.com>
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

On Tue, 19 Sept 2023 at 15:39, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 19/09/2023 07:14, Tomer Maimon wrote:
> >>>            - nvidia,tegra20-ehci
> >>>            - nvidia,tegra20-udc
> >>>            - nvidia,tegra30-ehci
> >>> @@ -325,6 +326,20 @@ properties:
> >>>      type: boolean
> >>>      deprecated: true
> >>>
> >>> +  nuvoton,sysgcr:
> >>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> >>> +    items:
> >>> +      - items:
> >>> +          - description: phandle to syscon that configures usb phy mux.
> >>> +          - description: offset of usb phy mux selection.
> >>> +          - description: mask usb phy mux selection.
> >>> +          - description: value usb phy mux selection.
> >>> +    description:
> >>> +      A phandle to syscon with three arguments that configure usb phy mux.
> >>> +      The argument one is the offset of usb phy mux selection, the argument two
> >>> +      is the mask usb phy mux selection, the argument three is the mask usb phy
> >>> +      mux selection.
> >>
> >> Sorry, you miss phy driver. Don't use syscon instead of proper hardware
> >> devices.
> > Sorry the role of nuvoton,sysgcr property is to handle a mux between
> > the different devices and not the handle the phy itself, handle the
> > mux done in the GCR.
> > Should we move the nuvoton,sysgcr description to another place in the
> > ci-hdrc-usb2.yaml
> > or
> > Should we use a different driver to handle the mux and call it from
> > the ci-hdrc-npcm driver, If yes which driver should we use?
>
> What is an "usb phy mux"?
We have USB phy that could be connected to USB host (different driver)
or it can be connected to the UDC driver(ChipIdea)
> Best regards,
> Krzysztof
>

Best regards,

Tomer
