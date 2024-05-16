Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 178228C7419
	for <lists+openbmc@lfdr.de>; Thu, 16 May 2024 11:48:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OTdLa3hI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vg4yw41K1z3dTr
	for <lists+openbmc@lfdr.de>; Thu, 16 May 2024 19:48:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OTdLa3hI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b35; helo=mail-yb1-xb35.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vg4yL1P8jz3clB
	for <openbmc@lists.ozlabs.org>; Thu, 16 May 2024 19:47:38 +1000 (AEST)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-de46b113a5dso7638397276.3
        for <openbmc@lists.ozlabs.org>; Thu, 16 May 2024 02:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715852853; x=1716457653; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gUyknDd5G3O/kbXEyZ7lZAY8kzOAKHNxYeobg/F/UyY=;
        b=OTdLa3hIftwISNwZ9Zw24N5ZVd8fIFehSTvYRUItcm3l7hF1Qxhc1nN2+uIg2rxu9f
         89evR/n80Fy6VOJivvuFypZ8/Fw5ACmtQq5falBto0lYrem8kRVmb74IsyrkzT/8uAj3
         AGpZPPm8Vzcd4CIMbvSsag4b9JcxiO2QlBVgX7tteNopa8MMRLoIgR1X+tUzF//ZGlul
         X0gH/7GyEBtqP8/aOwp4rBVH2FAnXQCAOKr6axEGj0BMCBWFRHuVdxxLTuvKF8oKFz2R
         lpQ601nBOKnb75prE4P0hWXOW3m/xaNYuYJIm4uurfb7kcw5hWoajAAmkNHoSv6ad1Wv
         Aahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715852853; x=1716457653;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gUyknDd5G3O/kbXEyZ7lZAY8kzOAKHNxYeobg/F/UyY=;
        b=EGGO9wwpne9DgeyDvx0Zi6HUEec1HlyzC3GTMZWme2RAOz0Y3ce9fMlJ8F6pME3YOR
         iKPaObIVWfx4zjnNEQO6Tgu0Z0H8EWeB4Pk4+TaJ9QZU+wgy8KvnykVUafK3n8fDydqE
         SANRL22jfJeJuv2cTJzk++UofQJcieWdXkDs7LKvAAkN+G3y7UcVLuk/xXTsk4j0cz4K
         gHo0r8HWHrz9MNC6epI35C95BVUG4tiuTrf3AIt93f5qImXi8jv4yG1CJuzGvM0/J1WT
         QDDtgY/KJ8bb5Ir90rjSwOf9rHXvxxnxBUoGzqrf/UDPYCMiRNpQFlkAGhN0EB+QSR23
         D7MA==
X-Forwarded-Encrypted: i=1; AJvYcCXkGkNZCU9RSrn6HxiKdSEpmBNMkR47+/OSSItvQn9YA2OxZUdXXaZBvB+UqQhWbY/6A1OJj+UkrHNwjdSubRxxOUE+Q0fc+fg=
X-Gm-Message-State: AOJu0Yxa7sFvHqKF65rJTK7Hg4HAwD+6hfog7KQIfeUWlZNqGIBgPt1T
	S3JJUqT+H9Bw+dY1E3X9fytDsDQfdohWLA0lOevTI7FF7NNq+5vxJj5XIaHETI1gsa42qi5B/SX
	qUN94uvb1UdFOcYUhQKE5x8nciNs=
X-Google-Smtp-Source: AGHT+IEzJt0Z027kWGnPBHHjYcG3IHb+RCewZlXNuCwSPNs6kP35vwq1z5FEuoImbDDdfYqXu+c8znUsBxe1Ou0UEvU=
X-Received: by 2002:a25:b853:0:b0:df3:6f11:923a with SMTP id
 3f1490d57ef6-df36f11964emr3073402276.53.1715852853288; Thu, 16 May 2024
 02:47:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240509192411.2432066-1-tmaimon77@gmail.com> <20240509192411.2432066-2-tmaimon77@gmail.com>
 <20240513155154.GA2595523-robh@kernel.org>
In-Reply-To: <20240513155154.GA2595523-robh@kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 16 May 2024 12:47:22 +0300
Message-ID: <CAP6Zq1h4gMRcEsVL96OeggF9c2Eh-ZsXSQ5cTswEe_0ExeNTMQ@mail.gmail.com>
Subject: Re: [PATCH v24 1/4] dt-bindings: reset: npcm: add clock properties
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
Cc: devicetree@vger.kernel.org, p.zabel@pengutronix.de, sboyd@kernel.org, venture@google.com, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, openbmc@lists.ozlabs.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Rob,

Thanks for your comments

On Mon, 13 May 2024 at 18:51, Rob Herring <robh@kernel.org> wrote:
>
> On Thu, May 09, 2024 at 10:24:08PM +0300, Tomer Maimon wrote:
> > Adding 25MHz reference clock and clock-cell properties to NPCM reset
> > document due to the registration of the npcm8xx clock auxiliary bus device
> > in the NPCM reset driver
> >
> > The NPCM8xx clock auxiliary bus device has been registered in the NPCM
> > reset driver because the reset and the clock share the same register
> > region.
>
> auxiliary bus is a Linux concept. The reasoning for this should be the
> reset block also provides clocks.
>
>
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  .../bindings/reset/nuvoton,npcm750-reset.yaml  | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/reset/nuvoton,npcm750-reset.yaml b/Documentation/devicetree/bindings/reset/nuvoton,npcm750-reset.yaml
> > index d82e65e37cc0..18db4de13098 100644
> > --- a/Documentation/devicetree/bindings/reset/nuvoton,npcm750-reset.yaml
> > +++ b/Documentation/devicetree/bindings/reset/nuvoton,npcm750-reset.yaml
> > @@ -21,6 +21,13 @@ properties:
> >    '#reset-cells':
> >      const: 2
> >
> > +  '#clock-cells':
> > +    const: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: specify external 25MHz referance clock.
>
> s/referance/reference/
>
> > +
> >    nuvoton,sysgcr:
> >      $ref: /schemas/types.yaml#/definitions/phandle
> >      description: a phandle to access GCR registers.
> > @@ -39,6 +46,17 @@ required:
> >    - '#reset-cells'
> >    - nuvoton,sysgcr
> >
> > +if:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        enum:
> > +          - nuvoton,npcm845-reset
> > +then:
> > +  required:
> > +    - '#clock-cells'
> > +    - clocks
>
> New required properties are an ABI break. Please justify why that's okay
> for this platform in the commit message (assuming that it is).
will be done in next version
>
> Rob

Thanks,

Tomer
