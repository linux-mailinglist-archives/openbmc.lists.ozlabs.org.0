Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCBF4CD52D
	for <lists+openbmc@lfdr.de>; Fri,  4 Mar 2022 14:31:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K97zd6kzXz30Gj
	for <lists+openbmc@lfdr.de>; Sat,  5 Mar 2022 00:31:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=W+AlDFDS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a2e;
 helo=mail-vk1-xa2e.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=W+AlDFDS; dkim-atps=neutral
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com
 [IPv6:2607:f8b0:4864:20::a2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K97zB4wXwz2ywb
 for <openbmc@lists.ozlabs.org>; Sat,  5 Mar 2022 00:31:00 +1100 (AEDT)
Received: by mail-vk1-xa2e.google.com with SMTP id k9so4387128vki.4
 for <openbmc@lists.ozlabs.org>; Fri, 04 Mar 2022 05:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MGgY2v0s5BT836XDhQECk+NogjRLUOp9BRBkCXbFGdE=;
 b=W+AlDFDSvyHdz+MtMZtyjMynfsbtrZdN4krhD52GcopRw9cRaXbi/bhu7j7HHAibnt
 n0aRc95MXdcNLJCnsrV3uRFi9XFWtYRxybbkrFTLfCwHPKE7JZ/7Nw1fsTS+rtckUFRq
 Hpkk/NpltymaaxMX2hEvIwxmMOmTOgk2vIQOnhHqSACkozDRle214D406Ma8USbdBnir
 Ln/MmyXaYRJsJo2Y3MJn+gjFzynk3b9Qdoc18N32hs3nkTOPNFcL91kmqvNfo8Uo6z3A
 bKRr2/Yuh9JrsPEm6rf7F0ZfpDUuiXfJ6mfHa+aXUA+M7KuUbaEE77QgqNdRyPrhqNSc
 WPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MGgY2v0s5BT836XDhQECk+NogjRLUOp9BRBkCXbFGdE=;
 b=dl45RhQbFNHzaHrKMKBrVqhcPeNQiPamPWjCRC1P5ZroKjLAaCnEOtYWIevGSC/1E6
 VftQrDPdZijegpkxZzOOgXG3YgTbP5PY1mZuHloJHqGG5qMC8wXDgmpMqJrA0lpTCjl/
 feUzAn/MsPZvk742KYCNJn3L41VJjd18Ouy5GbbYZVALjZQ7xTUFdBSu0aZuQvkrvrJc
 CAlFs0KHF45t/BNSTFSkpZY+PqG0STYOBBclb52LmDDBok1iSQwtXphVVOesCil0/m7y
 QAA1iNJpiiZJv9WsD/J8TEBWrvB3Sy6Y9N283RXjTZmo0dwHzTZMkLHMjakQWmMpjMYh
 RUcA==
X-Gm-Message-State: AOAM533zdbNt3hVO3UZeRCU1RIzaoaEDW18G3Tvgo4KCDZhtmd4mu//7
 aBg702778aDxJZj9lhEw2+BE/mVV39t6+pRkOA==
X-Google-Smtp-Source: ABdhPJz6QhEJNTkvH8FmjEHlGwXeFvno4ykiadnrc8k7pR/6sf9X8gA8U1sfYQot8EAtmzyHIEtTNg6IV4fnn5eXZC4=
X-Received: by 2002:a05:6122:17a6:b0:31e:d699:29e0 with SMTP id
 o38-20020a05612217a600b0031ed69929e0mr18646190vkf.1.1646400656386; Fri, 04
 Mar 2022 05:30:56 -0800 (PST)
MIME-Version: 1.0
References: <20220303083141.8742-1-warp5tw@gmail.com>
 <20220303083141.8742-3-warp5tw@gmail.com>
 <cb77935e-64e0-c8b6-9fba-9835a3be432f@canonical.com>
In-Reply-To: <cb77935e-64e0-c8b6-9fba-9835a3be432f@canonical.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Fri, 4 Mar 2022 21:30:44 +0800
Message-ID: <CACD3sJYBjKg6u5bJXAymgT8NeoDRcWr5k57SQHXeAdwJSdEh2g@mail.gmail.com>
Subject: Re: [PATCH v3 02/11] dt-bindings: i2c: npcm: support NPCM845
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: tmaimon77@gmail.com, devicetree@vger.kernel.org, tali.perry1@gmail.com,
 linux-i2c@vger.kernel.org, benjaminfair@google.com, openbmc@lists.ozlabs.org,
 JJLIU0@nuvoton.com, lukas.bulwahn@gmail.com, tomer.maimon@nuvoton.com,
 KWLIU@nuvoton.com, bence98@sch.bme.hu, arnd@arndb.de, sven@svenpeter.dev,
 robh+dt@kernel.org, Avi.Fishman@nuvoton.com, andriy.shevchenko@linux.intel.com,
 semen.protsenko@linaro.org, jie.deng@intel.com, avifishman70@gmail.com,
 venture@google.com, yangyicong@hisilicon.com, linux-kernel@vger.kernel.org,
 wsa@kernel.org, kfting@nuvoton.com, tali.perry@nuvoton.com, olof@lixom.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Krzysztof:

Thank you for your comment and it'll be addressed.

Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> =E6=96=BC 2022=E5=
=B9=B43=E6=9C=883=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=886:38=E5=AF=
=AB=E9=81=93=EF=BC=9A
>
> On 03/03/2022 09:31, Tyrone Ting wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > Add compatible and nuvoton,sys-mgr description for NPCM i2c module.
> >
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> > ---
> >  .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     | 26 +++++++++++++++----
> >  1 file changed, 21 insertions(+), 5 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.=
yaml b/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> > index 128444942aec..37976ddcf406 100644
> > --- a/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> > +++ b/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> > @@ -7,17 +7,18 @@ $schema: http://devicetree.org/meta-schemas/core.yaml=
#
> >  title: nuvoton NPCM7XX I2C Controller Device Tree Bindings
> >
> >  description: |
> > -  The NPCM750x includes sixteen I2C bus controllers. All Controllers s=
upport
> > -  both master and slave mode. Each controller can switch between maste=
r and slave
> > -  at run time (i.e. IPMB mode). Each controller has two 16 byte HW FIF=
O for TX and
> > -  RX.
> > +  I2C bus controllers of the NPCM series support both master and
> > +  slave mode. Each controller can switch between master and slave at r=
un time
> > +  (i.e. IPMB mode). HW FIFO for TX and RX are supported.
> >
> >  maintainers:
> >    - Tali Perry <tali.perry1@gmail.com>
> >
> >  properties:
> >    compatible:
> > -    const: nuvoton,npcm750-i2c
> > +    enum:
> > +      - nuvoton,npcm750-i2c
> > +      - nuvoton,npcm845-i2c
> >
> >    reg:
> >      maxItems: 1
> > @@ -36,6 +37,10 @@ properties:
> >      default: 100000
> >      enum: [100000, 400000, 1000000]
> >
> > +  nuvoton,sys-mgr:
> > +    $ref: "/schemas/types.yaml#/definitions/phandle"
> > +    description: The phandle of system manager register node.
> > +
> >  required:
> >    - compatible
> >    - reg
> > @@ -44,6 +49,16 @@ required:
> >
> >  allOf:
> >    - $ref: /schemas/i2c/i2c-controller.yaml#
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const:
> > +              - nuvoton,npcm845-i2c
>
> This should be one line in const (not an enum).
>
> Rest looks good to me.
>
> Best regards,
> Krzysztof

Best regards,
Tyrone
