Return-Path: <openbmc+bounces-409-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D73DB14E55
	for <lists+openbmc@lfdr.de>; Tue, 29 Jul 2025 15:25:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4brx1R2FPyz30W1;
	Tue, 29 Jul 2025 23:25:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::112d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753795547;
	cv=none; b=nZyevGzZRIPcvqzA18CW7kHRHj4P9VDLt0PKf4gojC1cdP0QzRbxTNXD9+VKGfHWjSA54BWjhjXHia3I3HsxG7TtvU4ASXFg1lN6e6pyk7RTy/EzP4QPQNdPK8EPrRayQTvE5vmqS7C2qPbT+yzuKHac3/r6R5ReZAhatn8x7AHQJoRhW+FhKHnmGye2a5pwFCbZTlFJDG1C0bhJr8B+WDE0VXi8q8iT0gPfMTpfFin3yHTBh8BW7DUgoJKG3I1+bT8TY2YfaPqCNXBwPHLdXrlt98wlQTMJPbo3B88b+ftLA1jSBmbRRLMkgybetOa5pfuMxJgWH48DdERJh2AL8A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753795547; c=relaxed/relaxed;
	bh=4MaNWKs7TaCzthrdXDGRFTeWf8nejV3Z8R/aIGF+vAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BXiMbkr/W0Fc2eGlAyILcpuzj3oaRbqzu0qhe1F7YLpBsSkO6U+5pui0T86eIAYh7Q02k+bC1NkawAG3fGlR5s42B8fbRzyDlnk/vkXbhxk1Kz0FcDuoeauQgwiYPte17BtyuS/yNd0/Mpapuh9n3w/CK+PzB8kBgsqRb7l5HVlA/bM2YgFT4D5cVX1IRIJ4Xgr5ap+hv5enPbRDFb8N1E3DNYkKd8MO4/lDTjSiNq+pcOHO7Rjfm6/1JB0FESI7HKlHcvc6tB0NT4ecEi8BOANH0ES7Pli8lQv9VHZHn6hx03T55bKDzUv72XVJ6cJWjM9NnQRSnKuGKp3H7FFo1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OmtQpmv1; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::112d; helo=mail-yw1-x112d.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OmtQpmv1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112d; helo=mail-yw1-x112d.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4brx1N071xz30P3
	for <openbmc@lists.ozlabs.org>; Tue, 29 Jul 2025 23:25:42 +1000 (AEST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-71a04654b82so22229447b3.2
        for <openbmc@lists.ozlabs.org>; Tue, 29 Jul 2025 06:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753795540; x=1754400340; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4MaNWKs7TaCzthrdXDGRFTeWf8nejV3Z8R/aIGF+vAk=;
        b=OmtQpmv1VKcnn0lZ12QEJPlCtDKJbfra5FbbetQhzd+R/kEgzO2PAPlYynwhCfgG9g
         QM1kaYRLpzrLom2Vtvq8ewptCpOt2I3UFHBUyu4VgoJE3MHiJTQZVz++97TigjxX/Gmu
         /8cVkVVFbFMHm31/4OEl8YzYSuHggRVsrbavWRq95q5s4DmVzXFEZqz73ubPWWrw+A+0
         lwNRQC8tkbLekfwa8RB0/F1Wj1dpLAsRLR5jn15Wdr2HKI+y2iAq/flK10Z0kyY9xUX3
         nvwt9701sftcyag8ixYhhLQTI9SZjjNn9XKaskJK6nXVTkQgT6FZCW7uMcszIJ6dXejC
         CMpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753795540; x=1754400340;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4MaNWKs7TaCzthrdXDGRFTeWf8nejV3Z8R/aIGF+vAk=;
        b=rAPTqxgABKAmoGemcQw7+jO7vYpRrrpBB7THs028Q5jRIcd8xcs8G/uOh3qMND2snX
         L+hSx7Iii4W3hfrnjMz9widKym6yMKcKAUoHEC8bZmtrNBRjNXa7dtBTJ6l6tX0nVpau
         4Pk71PVFlW/cTWllKQ06WqE9zhaDEKWF1vSnmfOCLZZ5xfqxD0/Mt2cFoB4yetgI72BX
         7p9XwkiYKQtMoVSIVVekLPCKUYIRozuy+epiyCNwkiXI/c1XZkiGbJjKBWGYrFEL+3Cd
         9DzHtX3wRjbFQHHcO2MubGzDo8iDdwADWz56+B0Y+5M5nIwzhnLeHlvbjnNyy0kNUoQA
         6ZmQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1qDZ2/nq8ATNlLpcqwg/lOCD7Ul8vBwaJdmBnklDspyOqqXZZ+8pPFWpTnZBr2/F1j9IY4Rhh@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyFt2wSOnAQEjyfsFKosD9h59MbAnFe98y8GnqQG3QjF2C6/OEG
	FDhk9M6MbGt1ZCRBEHRKvaVwQDHjtAMv/zXSgFFRM7tIamuXYfFtSnBETLhphYr9n2kC2Ew6CgC
	wgjHVW72j7eyrnHKf2cRT2xMdEfljX+g=
X-Gm-Gg: ASbGncvOkVp4WycDp83WKYDWGupf5w8N2HkT0+Aa2qGyzBVwuz5BNZzWNoQjE+0tvh/
	hRdo015wrSTrBStJL4EWOM0lVSlJug0rjcxoTVfKmUcng5tlI1WP7lz404dvA9c2Vz4jt/beuFO
	glO5sUfJUzTbMSUsEZXFJ9PJSpy6doj75jdCINDEYCYP9pe+j+RtmF8iYiHmsDjDYUAEvdHYAqC
	fc1nace
X-Google-Smtp-Source: AGHT+IHL20IVMBOPEcWqdaoF2zTGYAx5AWr+HHlIlUbQ23WbctxapIVl9GiiFgzBb8rsi6tFDPZtaW3tcEhbVEYQMqE=
X-Received: by 2002:a05:6902:18d2:b0:e8e:265a:c36b with SMTP id
 3f1490d57ef6-e8e265ae45bmr3085334276.7.1753795540205; Tue, 29 Jul 2025
 06:25:40 -0700 (PDT)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20250717135336.3974758-1-tmaimon77@gmail.com> <20250717135336.3974758-2-tmaimon77@gmail.com>
 <db07c25c-4064-4330-8bdb-8a619b0b2915@linaro.org> <CAP6Zq1jDCfhOWj4JwORy22TDZRBr0fnuy5-=G4WO9DFRv7pTdQ@mail.gmail.com>
 <61a0c875-89cd-4040-af15-79f57b53f377@linaro.org>
In-Reply-To: <61a0c875-89cd-4040-af15-79f57b53f377@linaro.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 29 Jul 2025 16:25:29 +0300
X-Gm-Features: Ac12FXzajzgJganh_OGaQ0PgxM_llQhwooXsnSSLuQX4GroBGdFGCQXd6d8NdSM
Message-ID: <CAP6Zq1inUdfX5cmv7LHrgOBQ6LPYY_2t5o8LD0oW4rUO191_tw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] arm64: dts: nuvoton: npcm845: Add peripheral nodes
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	avifishman70@gmail.com, tali.perry1@gmail.com, joel@jms.id.au, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Krzysztof,

On Tue, 29 Jul 2025 at 09:21, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 28/07/2025 13:30, Tomer Maimon wrote:
> > Hi Krzysztof
> >
> > Thanks for your comments
> >
> > On Thu, 17 Jul 2025 at 17:05, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 17/07/2025 15:53, Tomer Maimon wrote:
> >>> Enable peripheral support for the Nuvoton NPCM845 SoC by adding device
> >>> nodes for Ethernet controllers, MMC controller, SPI controllers, USB
> >>> device controllers, random number generator, ADC, PWM-FAN controller,
> >>> and I2C controllers. Include pinmux configurations for relevant
> >>> peripherals to support hardware operation. Add an OP-TEE firmware node
> >>> for secure services.
> >>> This patch enhances functionality for NPCM845-based platforms.
> >>
> >> Drop this sentence, redundant and not in style (see submitting patches).
> >>>
> >>> Depends-on: ARM: dts: nuvoton: npcm845: Add pinctrl groups
> > Maybe it's an issue with our work mail server,
> > https://patchwork.ozlabs.org/project/openbmc/patch/20250706153551.2180052-1-tmaimon77@gmail.com/
> > I believe you didn't receive the patches below as well, since I didn't
> > see any comments. Am I correct?
>
> How is it related?
Not related, I will send the question in a separate email.
>
> > https://patchwork.ozlabs.org/project/openbmc/patch/20250706134207.2168184-2-tmaimon77@gmail.com/
> > https://patchwork.ozlabs.org/project/openbmc/patch/20250706134207.2168184-3-tmaimon77@gmail.com/
> >
> >>
> >> There is no such tag.
>
> Do you understand this?
Sure, will use changelog or b4 dependencies next version
>
> >>
> >> Use changelog for this purpose or b4 dependencies.
>
> Do you understand this?
yes
>
>
> Best regards,
> Krzysztof

Thanks,

Tomer

