Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2304F8131AF
	for <lists+openbmc@lfdr.de>; Thu, 14 Dec 2023 14:35:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lynnPyH4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrYJY5zXCz3cXF
	for <lists+openbmc@lfdr.de>; Fri, 15 Dec 2023 00:35:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lynnPyH4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1129; helo=mail-yw1-x1129.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrYHz6mQRz3cS5
	for <openbmc@lists.ozlabs.org>; Fri, 15 Dec 2023 00:35:10 +1100 (AEDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-5d05ff42db0so81440037b3.2
        for <openbmc@lists.ozlabs.org>; Thu, 14 Dec 2023 05:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702560905; x=1703165705; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y3s9nt/dkGYTh2W2+GQ2SmWUJnneEpQA8EgYbyB2HA0=;
        b=lynnPyH4Ca8IgMlXImSKHE9lsrZAHODTnKJ1d7w6RdV/UsNzutdCQcNHmk0Mz0ZzY1
         76BEsFegVKJskk9x8snxzIpVJutWtnwRWHKJdB42F7hdPcICZ5u/JrNM2zc+Wr6oAkw5
         mqPs8x/av8UNx3U1vtQWE1a0om/kDyjzVppD0DDFSgap0O5D9KweQ5RTQzI5w7CCdS3U
         mBSo2cPwpAo47VzD1DGWfjTijeyfX9JTBppmfPbUI2AvmECGv/Rz86SqG2DFmq873SFu
         nZCSR9HuSJiG4B5lTC78bbShKLW65yF6m6tvb2wnP49hzDvmaa8JbUn7ojj2Ou8wsmcc
         yRtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702560905; x=1703165705;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y3s9nt/dkGYTh2W2+GQ2SmWUJnneEpQA8EgYbyB2HA0=;
        b=GOVNI+4r+xHq9ntbdiTWE2WNEccylnXojYDB5/+ZWQh3SsDTG5oe8tQlyEBRgZxAXB
         12jb+/gd9vocA9FFQrQwILFG1lSwWZ+oKq642JMRaTQlbVVVabIbVwUBGI1C/PMZr2Zy
         oXiBHhsG/kzvbbOApk9jApyfAw4puR7gtsFJY+KvqKh9rnKegq/mREvgaIpZQ+Uxai/O
         9P8pJtqSzKaVn3v0SWBIkQmKZz/EBvpuR500F3vnUy1H8mZ5r3enJLwc4BKCSVknDjiD
         L/LoC93QXcqaV7Clh4XLcbYhIz5MPS3A4xv8+N2EOZ1u02zTTWeaYX1xUXhIvZsPwh70
         bXtA==
X-Gm-Message-State: AOJu0YzM64ck9I7tYaRO09iaGFMHC90hqNBqpgL2PcjQZfKNZwT80cNh
	o8zY2Cx/IO0G9AJjuHOVRvOv6ROqjaqfB5eP41g=
X-Google-Smtp-Source: AGHT+IFH0sGhWqrMql6feIySTna7hEqbkNg/aDh9joX9iMx2qR+eNM1NkuEkHw2rj+og88fzdOt+ITN7+3dy/pW4Z6o=
X-Received: by 2002:a25:dccf:0:b0:dbc:dc60:1e36 with SMTP id
 y198-20020a25dccf000000b00dbcdc601e36mr1110925ybe.36.1702560904819; Thu, 14
 Dec 2023 05:35:04 -0800 (PST)
MIME-Version: 1.0
References: <20231213190528.3751583-1-tmaimon77@gmail.com> <20231213190528.3751583-2-tmaimon77@gmail.com>
 <ccaefd08-161f-4aa1-acc1-5216c5f7f7c7@linaro.org>
In-Reply-To: <ccaefd08-161f-4aa1-acc1-5216c5f7f7c7@linaro.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 14 Dec 2023 15:34:53 +0200
Message-ID: <CAP6Zq1i42ZUJmt_=VpLa6e-gzOndMFYL-Tuc1gEPr-fARS3VBA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: soc: nuvoton: Add NPCM BPC
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
Cc: pmenzel@molgen.mpg.de, conor+dt@kernel.org, benjaminfair@google.com, arnd@arndb.de, linux-gpio@vger.kernel.org, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, j.neuschaefer@gmx.net, tali.perry1@gmail.com, devicetree@vger.kernel.org, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

Thanks for your comments.

On Thu, 14 Dec 2023 at 09:56, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 13/12/2023 20:05, Tomer Maimon wrote:
> > Added device tree binding documentation for Nuvoton BMC NPCM BIOS Post
> > Code (BPC).
> >
> > The NPCM BPC monitoring two configurable I/O addresses written by the
> > host on the bus.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  .../soc/nuvoton/nuvoton,npcm-bpc.yaml         | 65 +++++++++++++++++++
> >  1 file changed, 65 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/nuvoton/nuvoton,npcm-bpc.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/soc/nuvoton/nuvoton,npcm-bpc.yaml b/Documentation/devicetree/bindings/soc/nuvoton/nuvoton,npcm-bpc.yaml
> > new file mode 100644
> > index 000000000000..c04302a1d52b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/nuvoton/nuvoton,npcm-bpc.yaml
> > @@ -0,0 +1,65 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/soc/nuvoton/nuvoton,npcm-bpc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Nuvoton BMC NPCM BIOS Post Code (BPC) controller
> > +
> > +maintainers:
> > +  - Tomer Maimon <tmaimon77@gmail.com>
> > +
> > +description:
> > +  Nuvoton BMC NPCM BIOS Post Code (BPC) monitoring two configurable I/O
> > +  addresses written by the host on the bus, the capture data stored in
> > +  128-word FIFO.
> > +
> > +  NPCM BPC supports capture double words, when using capture
> > +  double word only I/O address 1 is monitored.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - nuvoton,npcm845-bpc
> > +          - nuvoton,npcm750-bpc
> > +      - const: nuvoton,npcm-bpc
>
> That's not what I suggested. I asked to make 845 compatible with 750.
> This works, but I want to be sure you really, really understand the
> consequences of this.
Did you mean to do the compatible as follows?
properties:
  compatible:
    items:
      - enum:
          - nuvoton,npcm845-bpc
      - const: nuvoton,npcm750-bpc

Appreciate it if you could explain what is the difference between the
compatibility suggested in V3?
>
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  nuvoton,monitor-ports:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
>
> Missing constraints, like min/maxItems and maybe values.
O.K.
>
> > +    description:
> > +      Contain monitor I/O addresses on the bus, at least one monitor I/O
> > +      address required.
> > +
> > +  nuvoton,bpc-en-dwcapture:
>
> nuvoton,double-word-capture?
Modify in V4
>
> > +    description:
> > +      Set DWCAPTURE bit in BPCFEN register that enables double word capture
> > +      according to the first address setting.
> > +    type: boolean
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - nuvoton,monitor-ports
>
> Best regards,
> Krzysztof
>

Thanks,

Tomer
