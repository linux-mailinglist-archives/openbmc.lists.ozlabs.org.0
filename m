Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD88789FF8
	for <lists+openbmc@lfdr.de>; Sun, 27 Aug 2023 17:31:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=AEPXDMd6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RYd2f06s8z3bt0
	for <lists+openbmc@lfdr.de>; Mon, 28 Aug 2023 01:31:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=AEPXDMd6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RYd230jVsz2yDM
	for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2023 01:31:06 +1000 (AEST)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b9d07a8d84so35249601fa.3
        for <openbmc@lists.ozlabs.org>; Sun, 27 Aug 2023 08:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693150262; x=1693755062;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5hyLyH0mDfFi9IsH9oag3TfSy1UdIPJs5zbsS8pbums=;
        b=AEPXDMd65P5w9MhuYTMXNw/oNh1MH+G3kvUYmhSNKjYQ6PPs/uak9/dvRsscbxKz1d
         wq+Pzk2vT3zCAUW01km2yt2FeqVjpXEjxB86/PRFh4yXicGJUuKlD8+QcH3Kkh7k244C
         nu/y5AmrkbrQU304zW0ELTvnKCtpQsQwhfjL/hJ72n5/OSkRErJPURaO8G0NOwrM13Qi
         cOtRqomWqZ5cgBHN1Gg693C37w7lg6MOOPXuWm4TZiCLdK4SpKqWI/8oqTgAN67G5sgs
         UjgFz6U6160lBnlVtwGIppBsQZDV5ft4XHDbBincOGdIvCMVRmRPN8Kz+6HLrXAR8ERy
         6CRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693150262; x=1693755062;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5hyLyH0mDfFi9IsH9oag3TfSy1UdIPJs5zbsS8pbums=;
        b=bmtIaYhU7bFOQt+HXDCJ/df2ljkbduKSojmkzq/odGDhBpH8+mJKCUoMPHkAEBZax+
         klqKyEgb6M6ORrMV2T+tczOuiehv5SvMahJdXyaWYGg/4puLaC/lg3iv0Xq75C0cRibz
         6I8s9N5z8vrRWj0SwmXm4+/KPxKJjjKtT9icVPHj+oT9+1PPPamvtiPjedF9a5foVN5x
         qiCYZhGSxhQD1ukXY9H1JsF85OeC/WBSaK/cA0B3g00Z/y6jfNpNM1n826lvWYDgM4Ki
         zk+tsagZred4LlQwDRByaS/fW4sXpiZbHLbRxNhBWxlY7bX4tOm3hukubX5mw+vxdf3L
         tu2A==
X-Gm-Message-State: AOJu0YzrHSdCdFa+JF/io54OFvVQ9dRNT+1L0vvwtef2prTIgdv9B75L
	RLOTX0wLwoFytapOoKKTf374W93oAnQOTI26aR0=
X-Google-Smtp-Source: AGHT+IF6eeXSWjOmnwZg2jdWMWE1Ex1wqBTTysga0NQqKbYF8K8PfP948uHtG9/R94LZTmUbc5D2S+UonoeAAfteX0E=
X-Received: by 2002:a2e:b5d9:0:b0:2bc:fce1:54d3 with SMTP id
 g25-20020a2eb5d9000000b002bcfce154d3mr2932915ljn.41.1693150261834; Sun, 27
 Aug 2023 08:31:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230809185722.248787-1-tmaimon77@gmail.com> <20230809185722.248787-2-tmaimon77@gmail.com>
 <20230821170941.GA1915730-robh@kernel.org> <CAP6Zq1i+P8Jh2_G9gJMdtCKcVF6m9vkWAP5rJXBCJ1aNfc2Bvw@mail.gmail.com>
 <53987f0f-dfda-3572-1545-755072328be4@linaro.org>
In-Reply-To: <53987f0f-dfda-3572-1545-755072328be4@linaro.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Sun, 27 Aug 2023 18:30:50 +0300
Message-ID: <CAP6Zq1gcWHXUL=uuzkYkJ6VWwoS-9G_aEK2HizfAWr6oZZdzWQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v5 1/2] dt-binding: pinctrl: Add NPCM8XX pinctrl
 and GPIO documentation
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
Cc: Rob Herring <robh@kernel.org>, conor+dt@kernel.org, benjaminfair@google.com, linux-gpio@vger.kernel.org, avifishman70@gmail.com, venture@google.com, linus.walleij@linaro.org, j.neuschaefer@gmx.net, tali.perry1@gmail.com, devicetree@vger.kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

Thanks for your comment

On Sun, 27 Aug 2023 at 14:13, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 27/08/2023 11:44, Tomer Maimon wrote:
> >>> +      pinctrl: pinctrl@f0800260 {
> >>> +        compatible = "nuvoton,npcm845-pinctrl";
> >>> +        ranges = <0x0 0x0 0xf0010000 0x8000>;
> >>> +        #address-cells = <1>;
> >>> +        #size-cells = <1>;
> >>> +        nuvoton,sysgcr = <&gcr>;
> >>> +
> >>> +        gpio0: gpio@f0010000 {
> >>
> >> unit-address should be 0.
> >>
> >> Otherwise,
> > The unit-address is correct f0010000
>
> Then how does it pass W=1 builds? How unit address can be f0010000 but
> reg is 0? Really...
Maybe because the ranges are ranges = <0x0 0x0 0xf0010000 0x8000>?
I didn't get any warning regarding the unit-address
bash-4.2$ make ARCH=arm64 dt_binding_check W=1
DT_SCHEMA_FILES=Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
  DTEX    Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.example.dts
  DTC_CHK Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.example.dtb
bash-4.2$ dt-mk-schema -V
2023.7
>
> >>
> >> Reviewed-by: Rob Herring <robh@kernel.org>
> >>
> >>> +          gpio-controller;
> >>> +          #gpio-cells = <2>;
> >>> +          reg = <0x0 0xB0>;
> >
> > Thanks,
> >
> > Tomer
>
> Best regards,
> Krzysztof
>

Best regards,

Tomer
