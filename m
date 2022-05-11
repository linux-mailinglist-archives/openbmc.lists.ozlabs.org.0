Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6771522879
	for <lists+openbmc@lfdr.de>; Wed, 11 May 2022 02:29:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KybPw6L3Pz3bxk
	for <lists+openbmc@lfdr.de>; Wed, 11 May 2022 10:29:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TmeVRx9p;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e32;
 helo=mail-vs1-xe32.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=TmeVRx9p; dkim-atps=neutral
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com
 [IPv6:2607:f8b0:4864:20::e32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KybPS3PXMz2xY0
 for <openbmc@lists.ozlabs.org>; Wed, 11 May 2022 10:28:58 +1000 (AEST)
Received: by mail-vs1-xe32.google.com with SMTP id c62so408028vsc.10
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2022 17:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ArJ+P0yP41IspvL16vZgXyp5wGPDg81O0e5eE6H/vks=;
 b=TmeVRx9py0dFnEm1+1TQ/UZnrTgHHdOLlw2Hg/DmfL9RPjUBspUNsO6IaFp9AHo04x
 CyrG9eP8kVS+Q0M5scz+SpJ+oPm5ftB+uKdpygdqfsG5TGs2lgT5BbmFpW6uig2eAc+x
 L92C4Sl0SGJgJ1RqYttF7dIj/CbeT/+aEjlFJKtUYsjG3bSf19nn3hxMK5psMj/Kdyev
 vwUkLPp4Sd6DoHsVVgWFTywVAA93pVhPOmL2jh0RvBmDjYLuHXHeN/8moU7QoL1dXddI
 dO9j3yGjXudx0e7cszWgN7B/Rupgac9uvTPYxwqmewbBjQww9y8hsZGjGVohCqNKHbsE
 YuIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ArJ+P0yP41IspvL16vZgXyp5wGPDg81O0e5eE6H/vks=;
 b=8ImQr8jjlqRKgktFhBfbEoMHnUqKU1qXh8j9mipvk4SPls1PZzBFfCSwTyV906kDyX
 yXQoy74sj1/PPBhcU1tGKndZQcnJvDCxHaUM3LhXqeKUhNwEFOznHo2DgAbWLrHNtwy7
 Ef7EH4rjepObt02tTPonWJkKXQpQvuA4a+jb/zh8I4ZGG1Jq5CmgDpGQIJzv59oIDY1z
 r+HRn+Bvw/TVh3RqTeVsBSObYL23y5wf2CwA67VP9bkdmFBiy7owj6WwpYdU0mgiZ13X
 iXuFBL9nhlARxMoS5Juj/T1t837TUz3ZrMBn3N8GcA5yN3+VXX4dH6KZN5b7drT42oAp
 xlNw==
X-Gm-Message-State: AOAM533LXGdNxZDvhA8gO0UnekL67j+jFGO6YmJuWSKrDQHrdBP3sTeB
 kLW4EF3Ls4fA6bj3pw89Sus3fhQ6tFBwuKOMEQ==
X-Google-Smtp-Source: ABdhPJxhZxAx7pGH4pYIhNGd5w1vurCriRZkY02XBkZ32jUrSC70/SiZ/pB1dgdPFtRowcflumM3uWIdxBgBCnQZs4Q=
X-Received: by 2002:a67:ec48:0:b0:32c:e56b:6e85 with SMTP id
 z8-20020a67ec48000000b0032ce56b6e85mr12394926vso.50.1652228932835; Tue, 10
 May 2022 17:28:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220510100328.9191-1-warp5tw@gmail.com>
 <20220510100328.9191-2-warp5tw@gmail.com>
 <28029d30-6d18-d28c-a7d2-d86b9ab9ad35@linaro.org>
 <CACD3sJa6qEPDD58NqiXJ+hHHSSbB6BRqEPXuX+m49ei8HrHF+g@mail.gmail.com>
In-Reply-To: <CACD3sJa6qEPDD58NqiXJ+hHHSSbB6BRqEPXuX+m49ei8HrHF+g@mail.gmail.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Wed, 11 May 2022 08:28:40 +0800
Message-ID: <CACD3sJa2qdocMXX3QFj5OdjFGd95M5nArJqPpEMjCYmb2ZvgHA@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] dt-bindings: i2c: npcm: support NPCM845
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 avifishman70@gmail.com, 
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Benjamin Fair <benjaminfair@google.com>, robh+dt@kernel.org,
 Wolfram Sang <wsa@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 jarkko.nikula@linux.intel.com, 
 semen.protsenko@linaro.org, sven@svenpeter.dev, jsd@semihalf.com, 
 lukas.bulwahn@gmail.com, olof@lixom.net, arnd@arndb.de, 
 Tyrone Ting <warp5tw@gmail.com>, tali.perry@nuvoton.com,
 Avi.Fishman@nuvoton.com, 
 tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com, 
 kfting <kfting@nuvoton.com>
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Tyrone Ting <warp5tw@gmail.com> =E6=96=BC 2022=E5=B9=B45=E6=9C=8811=E6=97=
=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=888:25=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Krzysztof:
>
> Thank you for your review and it will be addressed.
>
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> =E6=96=BC 2022=E5=B9=
=B45=E6=9C=8810=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=886:59=E5=AF=AB=
=E9=81=93=EF=BC=9A
> >
> > On 10/05/2022 12:03, Tyrone Ting wrote:
> > >
> > >  maintainers:
> > >    - Tali Perry <tali.perry1@gmail.com>
> > >
> > >  properties:
> > >    compatible:
> > > -    const: nuvoton,npcm750-i2c
> > > +    enum:
> > > +      - nuvoton,npcm750-i2c
> > > +      - nuvoton,npcm845-i2c
> > >
> > >    reg:
> > >      maxItems: 1
> > > @@ -36,6 +37,10 @@ properties:
> > >      default: 100000
> > >      enum: [100000, 400000, 1000000]
> > >
> > > +  nuvoton,sys-mgr:
> > > +    $ref: "/schemas/types.yaml#/definitions/phandle"
> >
> > Minor nit: No quotes. The other places don't have it.
> >
> >
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >
> >
> > Best regards,
> > Krzysztof
>
> Best regards,
> Tyrone
