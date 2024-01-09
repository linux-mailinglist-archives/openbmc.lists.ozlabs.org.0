Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D659F827EDD
	for <lists+openbmc@lfdr.de>; Tue,  9 Jan 2024 07:46:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=H1v8FwDX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T8Lzy3PRLz30hC
	for <lists+openbmc@lfdr.de>; Tue,  9 Jan 2024 17:46:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=H1v8FwDX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T8LzN0mB3z2yq4
	for <openbmc@lists.ozlabs.org>; Tue,  9 Jan 2024 17:45:34 +1100 (AEDT)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-dbed4b84667so1839434276.0
        for <openbmc@lists.ozlabs.org>; Mon, 08 Jan 2024 22:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704782729; x=1705387529; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=80w7kcr2BiF5GwXEFqXyPAg3AD4hnM9w5LfuY1QzR9g=;
        b=H1v8FwDXNL8oFNFfE6FTypnZmBb4/S+tki/KLzkJoFwfhsiEGrstxTz/FIWw+TImRz
         QQOsniKqgkHClbL02/Lvc8BLqwXV5bTIDQxtJSo7wSzObzRydRKP/6JtZ8HEZao5DsuZ
         08E+klVS64/VacRCA95lOLY9wcrhUI8u1/l/4PBaSS0YYoR35jtajtD6OZH6YR/rZAfI
         S5qAZMYB6OkyWoHFRONKK2DQprcExvrv04RNz8iBt6pKoxlyZKEngigM2BWkDi9HbeZg
         lUz8jrwa0jIhXphyNyJSj49Z/l4ginoKL4tBnpNPvt2SIDDZ/zMAtfoif1OZYAnYxGhX
         4T8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704782729; x=1705387529;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=80w7kcr2BiF5GwXEFqXyPAg3AD4hnM9w5LfuY1QzR9g=;
        b=tnQGRjgSIcg/xfwOXJYvVhyPEMtv8SIZ7bqlOhlZ5ar0b2uvPF/OhyUDdn5hUycs2K
         lTEVQo0lET/jB/TGg9a1M/NyWhZybD2jIpooBKBqWnvX3JH594/YfgcooguRSMidKubK
         dmaGaeI/zekdXleEkVST3xHrGkw+K8xZE5J8HZqopt/SlT110Gcj0E6btR440OGxNRNG
         p+xqkhi+R/5/UMITWOV2JQOZEEl/v7QauqTcPDyENdAQ1KCdCWUY0r32nCR4QwVw1N0/
         tYYlDKwCIVKc3gRffSaqzhacdwMZMlmDItmjNb9RfBFB44RVNE0dxHpAGACxAzIfpaVI
         VIQg==
X-Gm-Message-State: AOJu0YylIFq6wkSe7gXvEMiZAT+XLRlXOjY3Fg/i+w0hyYyX4vIUr+wA
	AZRs72UOinowPRttQMzH9bUpa3iOJcZJzyleQj4=
X-Google-Smtp-Source: AGHT+IF6yT0FJnKlKhXx/rXnY0cNXPiWZTwPKLF8DD+ZaBFDZq7+NnCGOMow8QTcirbtaj3I4WJ3pTtlcUMgnGyhs8o=
X-Received: by 2002:a05:6902:250c:b0:db5:3e3b:d2bb with SMTP id
 dt12-20020a056902250c00b00db53e3bd2bbmr2516111ybb.48.1704782728999; Mon, 08
 Jan 2024 22:45:28 -0800 (PST)
MIME-Version: 1.0
References: <20240108135421.684263-1-tmaimon77@gmail.com> <20240108135421.684263-2-tmaimon77@gmail.com>
 <170474817687.2140623.4004065884295248395.robh@kernel.org>
In-Reply-To: <170474817687.2140623.4004065884295248395.robh@kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 9 Jan 2024 08:45:17 +0200
Message-ID: <CAP6Zq1iZdcrgc2BJREPvx8T9DZAZ=Sx_3iWbX0g=x2DmaG2MhQ@mail.gmail.com>
Subject: Re: [PATCH v22 1/8] dt-bindings: clock: npcm845: Add reference 25m
 clock property
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
Cc: devicetree@vger.kernel.org, benjaminfair@google.com, sboyd@kernel.org, venture@google.com, mturquette@baylibre.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, linux-clk@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Rob,

Thanks for your comment.

On Mon, 8 Jan 2024 at 23:09, Rob Herring <robh@kernel.org> wrote:
>
>
> On Mon, 08 Jan 2024 15:54:14 +0200, Tomer Maimon wrote:
> > The NPCM8XX clock driver uses 25Mhz external clock, therefor adding
> > refclk property.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  .../bindings/clock/nuvoton,npcm845-clk.yaml      | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
>
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.example.dtb: clock-controller@f0801000: 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/nuvoton,npcm845-clk.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.example.dtb: clock-controller@f0801000: 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/nuvoton,npcm845-clk.yaml#
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240108135421.684263-2-tmaimon77@gmail.com
>
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
>

probably I missed adding the clock and clock-names to the example
node, will be fixed next version
