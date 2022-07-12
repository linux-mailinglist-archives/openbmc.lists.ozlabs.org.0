Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9FE57144D
	for <lists+openbmc@lfdr.de>; Tue, 12 Jul 2022 10:20:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LhtwP6WSFz3c1t
	for <lists+openbmc@lfdr.de>; Tue, 12 Jul 2022 18:20:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CPUwdWfR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com; envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CPUwdWfR;
	dkim-atps=neutral
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lhtvz6M94z3c0g
	for <openbmc@lists.ozlabs.org>; Tue, 12 Jul 2022 18:19:43 +1000 (AEST)
Received: by mail-lf1-x136.google.com with SMTP id u13so12685059lfn.5
        for <openbmc@lists.ozlabs.org>; Tue, 12 Jul 2022 01:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fsZS54G0TF7yfO7aK95cWjaqDjAEFLG+zKLdqz5qOj8=;
        b=CPUwdWfRzwbAZFcSL/+Xjt3FqB3hWjH8AYkd4hQjSi3iRLxbnAuxssCAMlVoJeLxXF
         R2rqxjUOMH8oK5mvIgpsFFIckigyPFYdhRmKN7ikguePeF+GqelHrrPuUbGmPlFb0eXK
         Jbxm0I0xcjyCVr9O+cnxT+f9RUKy26jP2K/hnfCFAGh7YLrXQM7JHXwIFVmm0rdpX41B
         OlrLqKNm4H+2V3Mp10n1LO7FN0iVDPDaiXWaQ4FT9F1yjW1K7QvX47SxNMQsihnUY54i
         JeFp01ka7yVdBkFXLbj2Hnfs08y62O63V5PKVJMcdl804+g3nbRXAhwiNxXMmrXiaC1n
         c3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fsZS54G0TF7yfO7aK95cWjaqDjAEFLG+zKLdqz5qOj8=;
        b=24J9PwFoR65JKMiuz1L2BmtVSfXN6teFchZ2QHwt2RxVGyNLfuS/b2E+6AJZS48ms3
         DMD3SNLnzF3btIsMx5k70pQipbb2wFPNaq4L1pgtSYvotxIv4NPDgn9IXqVIU0QwZvM6
         E+QfiA4Ho8jGfyri+DWtlQKaDThO29NGKF5Zv/ZGAR3/euGXZCF2p/vJbecqmdhc0ffH
         Fee0+blvmVFlNWCCHVYyy46xzjSkqUv+C/jZ7dcYCyvDDkEkmUWGhkSuXs0Jvd240RRX
         Fa+Kug7RAaeXboZWJQmIHgZQZI8tT/T46y4DSCUqHSdFdbU4pQw7SVw9NO1M8n3iUCUV
         Kc3Q==
X-Gm-Message-State: AJIora+kdch+7nErtzL8rEs6YbYZxDQqEm8WqP01LH2IuULQKaC9aKQr
	5cbliEfSHuu+SqwIQS8XynY5ghCGDTv2By8SuC0=
X-Google-Smtp-Source: AGRyM1uwm5voGsujOseVCxcKpWGEQUFJOWHea1M5BQx/JSJlJYHEAMBsAxCGRsQCxXgwON5GZlvbfB6CpmpGIIyW154=
X-Received: by 2002:a05:6512:3103:b0:489:cdd7:b360 with SMTP id
 n3-20020a056512310300b00489cdd7b360mr10578125lfb.111.1657613979260; Tue, 12
 Jul 2022 01:19:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220711134312.234268-1-tmaimon77@gmail.com> <20220711134312.234268-2-tmaimon77@gmail.com>
 <154dd9ef-cb8c-d8d7-ae62-a73bac160089@linaro.org>
In-Reply-To: <154dd9ef-cb8c-d8d7-ae62-a73bac160089@linaro.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 12 Jul 2022 11:19:27 +0300
Message-ID: <CAP6Zq1gMNeU9Ah5vWmhFyd_=XWhAAOsX2sQ8v1KLF2W+DSH=QQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: iio: adc: npcm: Add npcm845
 compatible string
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
Cc: devicetree <devicetree@vger.kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, Tali Perry <tali.perry1@gmail.com>, zhengbin13@huawei.com, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jonathan Cameron <jic23@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

On Tue, 12 Jul 2022 at 11:15, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 11/07/2022 15:43, Tomer Maimon wrote:
> > Add a compatible string for Nuvoton BMC NPCM845 ADC.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  .../devicetree/bindings/iio/adc/nuvoton,npcm750-adc.yaml     | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm750-adc.yaml b/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm750-adc.yaml
> > index 001cf263b7d5..c9e9c5bf5e5b 100644
> > --- a/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm750-adc.yaml
> > +++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm750-adc.yaml
> > @@ -14,7 +14,10 @@ description:
> >
> >  properties:
> >    compatible:
> > -    const: nuvoton,npcm750-adc
> > +    oneOf:
> > +      - items:
>
> This does not make sense. oneOf with one item. You also create now list
> breaking all existing users/ABI.
>
> You probably wanted an enum here.
indeed, thanks for your comment.
>
> > +          - const: nuvoton,npcm750-adc
> > +          - const: nuvoton,npcm845-adc
> >
> >    reg:
> >      maxItems: 1
>
>
> Best regards,
> Krzysztof

Best regards,

Tomer
