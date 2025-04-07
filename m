Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D757BA7F130
	for <lists+openbmc@lfdr.de>; Tue,  8 Apr 2025 01:44:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWm4q6Bhhz3c81
	for <lists+openbmc@lfdr.de>; Tue,  8 Apr 2025 09:43:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744033343;
	cv=none; b=CLE3qZPwCiHYFRlibuueYDPeWnT7y4M43oOPk6/P3Mpg0TPZDCUowlsZpiM2Zodks0CnliPDNDtmRbUS2sRKhf9oI/Uxeio62pvS4OWQr79DcC3k7pykFdNBZFsJI+Kfxx1/KfGpORykBqoDNcXX+P3C+wvBHXHZ6qEQutRGRDZNIfo1GJ+wuNfKVycCBpX4K7j/uoLSub/vBJ/tN7ZwDHow/wMVlnuf2sMI4XoV4FkxjJOhANfwACDj3d7MzRxpG66un4bmS1q+UHZmB4EXztoxNblFb0myqZtHwRpQWc8KJFyfJffQ0I1IH56A9zgGIK2Pu0TW0Vvn4eKmZTIKTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744033343; c=relaxed/relaxed;
	bh=Wa6KU2wdxERyxbNkzxJOW0BR3XtH5OL92vINFtJKy6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CLMFUcOecYHLL82GM8MY5o9iXIA+BtlLhZS1M1FlYzplqPE7PxleKLO98Q/oRCJMbatjToxBzZZDp3V1jdrgrWC+Q23CMQaA+LtJ5pBONCG9GE9/q8jxKNweLF2KzZ6aJPy/hKNLtG3+k3Esd/S2Wm3cY0kAgxuvV1Y+eVGIIE97ljS19/nyO1PrfxXteVN5H1wpxv76kilTXjNVkEnq5OC761OW2v+xHFM+gw0YDuxkE04NgSIrUdBo3SMxQ6zeRV/+v9+JPEA2eD/YI9hJMwtDVf1Ap8w2OrKnxzR6wuGFErt6Kz0TBaz5A89ZeXnlEKWSObflUtBty79L51BFUA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ODvBec/B; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ODvBec/B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZWVkk20RHz2yST
	for <openbmc@lists.ozlabs.org>; Mon,  7 Apr 2025 23:42:21 +1000 (AEST)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9eb12so6506042a12.1
        for <openbmc@lists.ozlabs.org>; Mon, 07 Apr 2025 06:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744033338; x=1744638138; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wa6KU2wdxERyxbNkzxJOW0BR3XtH5OL92vINFtJKy6o=;
        b=ODvBec/BxNwYC/A2/s+xmFF5Qm4qTcm+g+ZvlUVu23ClC85PIl/EHLLnok7V5zsh93
         7xA/6DDm+LFFJr4ZEw/Lc99xoaokIFUFo86eOIyfDFVVK3QiIRG273ksm/iTVdSTwXSE
         MNFlRAYuldIF1v5c50+HhUieNWEDGJJpL5Vyj6LGz6JmcNff4Uy4B2XnaorhVkSKI3aO
         iBnj492V2cSNR1TiWRn2lIodaxo23zXU4m4TZn79PBH0k/nOA+I8ZMa2RjhW7cKq9J57
         pKRXBg4WAre/dl8qjQ4vjg3lPtkyTQIdQLWKpQD0Ozl9Btuy+FNCIdiI7VWl2RkervfT
         adSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744033338; x=1744638138;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wa6KU2wdxERyxbNkzxJOW0BR3XtH5OL92vINFtJKy6o=;
        b=rZI4ADqo0vCYWM7ZgNfwC9G+cNo8+6Xs8NDay7eZJSMWFChRzjwDtXlUe4fX4CmXrO
         29mkcFBVApGywIEXjJvMF6Z/aoARSfP+F6v6+iWWJb5lIYx1OI2wvnIPfwO2L0F7mZSz
         +EkDcMmzO6U2p+n2FmleBIAwQ3QKam6yrIae4WlkSBL1HezyJ3oPbgFDlH/GzaJn1ikh
         6W04d71+ggOxIxbvSkxJvJQbV0on0Q46I+cLQVkXPTLBoxH2zkDSs5V9fwiluNa89/Dw
         Dl98q0+R7RPa+ptSKGf6Z6CeynI+RqIhlsdBUC3KvKuvjeEnbpgKS/FpVXIqR7SFlqR+
         aBRg==
X-Forwarded-Encrypted: i=1; AJvYcCXZWbB/xQAFyaprggTcuUCgHMCVvPsDzmp8HHuct6ZeeVXpRzzcP64WqPEhYuJU+p42u2AeDrRH@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxLZCw2ctL2DpjXKJ3mAjgZPaOYIuxCFAul5RImwDJK4gQf6M5+
	uaBSLsKAZ9CCa3++QIeypjgm2mxCyt4gw/WUgEAqt4du14bnLlNafyqLsY9SX7SW3IHD6pmcG4d
	dyKAQXoFsTP91MdJmRBtDG69Iaaw=
X-Gm-Gg: ASbGncuq2+5hDtbUUe2I+xtylHpSwuPLWbdI8zqLCVJCwqM0PRgpJfoa6vNtrQVu2Jk
	CNCXPYXO0MyunfE0lauVE6JrUahqi3omdYaT3tK0k/7BkXqRyNhw2qymN2Ow9n12POUiwVL3xfx
	ZAIX2ZfdEs7hKaBosU08PdtDG4
X-Google-Smtp-Source: AGHT+IHhtn/MY8uQvzJzvMpoMO8/8pCPRUNklZgOaGuOQVfqvhUggICmePL4U7XBoQsuoXMMgsVnU6yzTxAsZQISebE=
X-Received: by 2002:a17:907:7216:b0:ac3:8899:d2a6 with SMTP id
 a640c23a62f3a-ac7d185ce57mr1279671566b.12.1744033337483; Mon, 07 Apr 2025
 06:42:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250221090918.1487689-1-j2anfernee@gmail.com>
 <20250221090918.1487689-2-j2anfernee@gmail.com> <8975b119-fe24-463a-b163-dce702df3cdd@baylibre.com>
In-Reply-To: <8975b119-fe24-463a-b163-dce702df3cdd@baylibre.com>
From: Yu-Hsian Yang <j2anfernee@gmail.com>
Date: Mon, 7 Apr 2025 21:41:19 +0800
X-Gm-Features: ATxdqUE_5Q4GslleR9QLgSAVfxgRYmQtklJyPCOrpUHS44T56v3qQ5wCflyg1WM
Message-ID: <CA+4VgcK=R=BF-qk4w-pLkwbTypgMmpJ=7joYN8nioT2Dx3_Z7w@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: iio: adc: add NCT7201 ADCs
To: David Lechner <dlechner@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Mailman-Approved-At: Tue, 08 Apr 2025 09:43:52 +1000
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
Cc: tgamblin@baylibre.com, herve.codina@bootlin.com, tmaimon77@gmail.com, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, tali.perry1@gmail.com, yhyang2@nuvoton.com, marcelo.schmitt@analog.com, robh@kernel.org, lars@metafoo.de, benjaminfair@google.com, javier.carrasco.cruz@gmail.com, openbmc@lists.ozlabs.org, ramona.nechita@analog.com, olivier.moysan@foss.st.com, thomas.bonnefille@bootlin.com, KWLIU@nuvoton.com, conor+dt@kernel.org, alisadariana@gmail.com, gstols@baylibre.com, joao.goncalves@toradex.com, andriy.shevchenko@linux.intel.com, matteomartelli3@gmail.com, chanh@os.amperecomputing.com, avifishman70@gmail.com, venture@google.com, mitrutzceclan@gmail.com, linux-kernel@vger.kernel.org, nuno.sa@analog.com, krzk+dt@kernel.org, jic23@kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear David Lechner,

Thanks again for the review, I'll do the changes here and send next patch.

David Lechner <dlechner@baylibre.com> =E6=96=BC 2025=E5=B9=B42=E6=9C=8821=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=8811:56=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> On 2/21/25 3:09 AM, Eason Yang wrote:
> > Add a binding specification for the Nuvoton NCT7201/NCT7202 up to 12-bi=
t
> > ADCs with I2C interface.
> >
> > Signed-off-by: Eason Yang <j2anfernee@gmail.com>
> > ---
> >  .../bindings/iio/adc/nuvoton,nct7201.yaml     | 57 +++++++++++++++++++
> >  MAINTAINERS                                   |  1 +
> >  2 files changed, 58 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,n=
ct7201.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,nct7201.=
yaml b/Documentation/devicetree/bindings/iio/adc/nuvoton,nct7201.yaml
> > new file mode 100644
> > index 000000000000..830c37fd9f22
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,nct7201.yaml
> > @@ -0,0 +1,57 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/iio/adc/nuvoton,nct7201.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Nuvoton nct7201 and similar ADCs
> > +
> > +maintainers:
> > +  - Eason Yang <j2anfernee@gmail.com>
> > +
> > +description: |
> > +  The NCT7201/NCT7202 is a Nuvoton Hardware Monitor IC, contains up to=
 12 voltage
> > +  monitoring channels, with SMBus interface, and up to 4 sets SMBus ad=
dress
> > +  selection by ADDR connection. It also provides ALERT# signal for eve=
nt
> > +  notification and reset input RSTIN# to recover it from a fault condi=
tion.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - nuvoton,nct7201
> > +      - nuvoton,nct7202
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  reset-gpios:
> > +    maxItems: 1
> > +
>
> Maybe this was brought up before, but no power supply?
>

  vdd-supply:
    description:
      A 3.3V to supply that powers the chip.

  vref-supply:
    description:
      The regulator supply for the ADC reference voltage.

> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        adc@1d {
> > +            compatible =3D "nuvoton,nct7202";
> > +            reg =3D <0x1d>;

            vdd-supply =3D <&vdd>;
            vref-supply =3D <&vref>;

> > +            interrupt-parent =3D <&gpio3>;
> > +            interrupts =3D <30 IRQ_TYPE_LEVEL_LOW>;
> > +            reset-gpios =3D <&gpio3 28 GPIO_ACTIVE_LOW>;
> > +        };
> > +    };
> > +...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 3864d473f52f..fdc4aa5c7eff 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -2831,6 +2831,7 @@ L:      openbmc@lists.ozlabs.org (moderated for n=
on-subscribers)
> >  S:   Supported
> >  F:   Documentation/devicetree/bindings/*/*/*npcm*
> >  F:   Documentation/devicetree/bindings/*/*npcm*
> > +F:   Documentation/devicetree/bindings/iio/adc/nuvoton,nct7201.yaml

Remove F:   Documentation/devicetree/bindings/iio/adc/nuvoton,nct7201.yaml
>
> This (ARM/NUVOTON NPCM ARCHITECTURE) doesn't look like the right place fo=
r
> adding a stand-alone chip. You will need to start a new section like:
>
> NUVOTON NCT7201 IIO DRIVER
>

NUVOTON NCT7201 IIO DRIVER
M: Eason Yang <j2anfernee@gmail.com>
L: linux-iio@vger.kernel.org
S: Maintained
F: Documentation/devicetree/bindings/iio/adc/nuvoton,nct7201.yaml
F: drivers/iio/adc/nct7201.c

> >  F:   Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
> >  F:   arch/arm/boot/dts/nuvoton/nuvoton-npcm*
> >  F:   arch/arm/mach-npcm/
>
