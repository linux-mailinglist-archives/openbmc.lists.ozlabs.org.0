Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B24382F582
	for <lists+openbmc@lfdr.de>; Tue, 16 Jan 2024 20:38:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=itDCLf1J;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TDznh1fpJz3cSg
	for <lists+openbmc@lfdr.de>; Wed, 17 Jan 2024 06:38:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=itDCLf1J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1136; helo=mail-yw1-x1136.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TDzn64RQlz3bTP
	for <openbmc@lists.ozlabs.org>; Wed, 17 Jan 2024 06:37:45 +1100 (AEDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-5ff4eb17fcdso11760387b3.0
        for <openbmc@lists.ozlabs.org>; Tue, 16 Jan 2024 11:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705433862; x=1706038662; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L0JaYidCVwdwRm9hVZBNloEcOvaQrqCt/gTnlhIWr74=;
        b=itDCLf1JhUkuNjF7PPVq/1tToyo/axYYqcseyVyO2sqbZLen6cnd7Z+olYSY5Gj4l8
         HsPnGmynBKFtFIjOn9ofX/enD+RboUhQokCEUorvxjiWj86FqWCuEqp3izGNLIeQDB9Q
         84f1E0x+BYlWh6oRntg3so0bexefgHV5RRiiWiD/YfhXbAqpNKPV1mYJ7M8K9UEdLGJv
         mg6rvbgBAA1oQ/gcMOHPNpovbqm2WhmgAanFkpPdgEbf1TO2I/uF19Hbk+MwI9UP1/BR
         yU2ubgwPcoNg5wdcsywc1Ivc3Y7LvgpfWsgeF4p8gFD4PB/gsO9bEJ97dBnveNvbwk2M
         USZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705433862; x=1706038662;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L0JaYidCVwdwRm9hVZBNloEcOvaQrqCt/gTnlhIWr74=;
        b=wW0FlFStxr5bHU5OUkiLxyILORWEKR/4sydubRNrOhbmQ2MO8xhGQhi70JfRVIWNXQ
         /FLzuzud11Ag9j2u6fnMgHo33SUTC2UGh1i057RMkSCMwDb+DGdzsIUoclHnv+cnV5+V
         chJ6XOUD95NjMmoPrlHJyJRBZpAOG9NqXoT8b3fRNCYWaQnSu3cRk9Jzi5LclRNNEpkQ
         YJp/SMRXLTeE+Ose0TPKdMXgWAfjM4tycQ/6zSKnEFS0jx0vRhLiKLDoVI/lS2/p6JmH
         VVm36oG1bp3l1fiZpQZFVBaSItta96yjCuJnVu81Y3ksWWzZvkX7sPEEGiRvgzi4oCxj
         Xl3w==
X-Gm-Message-State: AOJu0Yy8VMDTC43/tjvIWgOWQZZUF8nvVPCDOwITDIMiwn+HJ5HQKNCI
	XJdQoOCRbIMfrJlboUCFGkI1gcsBiFfXhRWk7WM=
X-Google-Smtp-Source: AGHT+IFPyMkknwPsbZq6kJ5rIa1dMpjxEpM+yjToWc3WUR46HAQ2vOLUvZ7pFzEHh/2UBrxWht5R89QTtKpc7dgC+Fg=
X-Received: by 2002:a81:6cd2:0:b0:5ff:4e43:8430 with SMTP id
 h201-20020a816cd2000000b005ff4e438430mr1352673ywc.1.1705433861873; Tue, 16
 Jan 2024 11:37:41 -0800 (PST)
MIME-Version: 1.0
References: <20240108135421.684263-1-tmaimon77@gmail.com> <20240108135421.684263-7-tmaimon77@gmail.com>
 <171300da-3d49-4e1f-8969-9a454ecdd698@linaro.org>
In-Reply-To: <171300da-3d49-4e1f-8969-9a454ecdd698@linaro.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 16 Jan 2024 21:37:30 +0200
Message-ID: <CAP6Zq1hifi7CY=tYaDY_o82AXhbS5P9=MZBb-bqmvNCLZk3O2g@mail.gmail.com>
Subject: Re: [PATCH v22 6/8] dt-bindings: clock: npcm845: replace reg with
 syscon property
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
Cc: devicetree@vger.kernel.org, benjaminfair@google.com, sboyd@kernel.org, venture@google.com, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

As explained in my [PATCH v22 4/8] dt-bindings: soc: nuvoton: add
binding for clock and reset registers mail.

In the NPCM8XX SoC, the reset and the clock register modules are
scrambled in the same memory register region.
The NPCM8XX Clock driver is still in the upstream process (for a long
time) but the NPCM8XX reset driver is already upstreamed.

On Wed, 10 Jan 2024 at 22:59, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 08/01/2024 14:54, Tomer Maimon wrote:
> > Replace reg with syscon property since the clock registers handle the
> > reset registers as well.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  .../bindings/clock/nuvoton,npcm845-clk.yaml   | 22 +++++++++----------
> >  1 file changed, 10 insertions(+), 12 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml b/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml
> > index 0b642bfce292..c6bf05c163b4 100644
> > --- a/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml
> > +++ b/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml
> > @@ -18,8 +18,9 @@ properties:
> >      enum:
> >        - nuvoton,npcm845-clk
> >
> > -  reg:
> > -    maxItems: 1
> > +  nuvoton,sysclk:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: phandle to access clock registers.
>
> NAK. Not explained, not justified, not reasonable, breaking ABI.
Should I explain more in the commit message or/and the nuvoton,sysclk property?
>
> Best regards,
> Krzysztof
>

Best regards,

Tomer
