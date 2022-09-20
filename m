Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F392B5BE1E4
	for <lists+openbmc@lfdr.de>; Tue, 20 Sep 2022 11:28:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWx6f0GByz30Mr
	for <lists+openbmc@lfdr.de>; Tue, 20 Sep 2022 19:28:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dbQD2A90;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dbQD2A90;
	dkim-atps=neutral
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWx6D2brzz30JR
	for <openbmc@lists.ozlabs.org>; Tue, 20 Sep 2022 19:27:47 +1000 (AEST)
Received: by mail-lf1-x12c.google.com with SMTP id f9so2782264lfr.3
        for <openbmc@lists.ozlabs.org>; Tue, 20 Sep 2022 02:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=pbBbo0wS9RefiKHJAHea5Z+uUoKrx1Fu0kwL/SMeV7A=;
        b=dbQD2A90p/pP5WBHjfMv0TH9z9lfoSt8o998wRryLQ//wjxln1WnlY2wsOldM0mqoV
         Jyv0ntKQKJKv7ASQtHmJcrpdj+VMjDHbJVe0pu0DBWoZ47b0GzUimsdDwStoWScTm+oJ
         1h4KXWswd31nsQvElNONF2ft8gf9PHmAHp1+2p8utzLECIFqYsmfT5BxDrx/BkY9pGJD
         rmUZ02vWWN1ceRA6Y1a04QrTk03JLD5TZYga5wdsgpROTIZk2esKRtM8GHEAR6Nw2mPl
         mOyOVbeLXHjjs8jSjR16d6NYYXk6dNQlrj/a4mDFSy3IUUDm4G1Z9vUZMriPL/cXSXgS
         KHuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=pbBbo0wS9RefiKHJAHea5Z+uUoKrx1Fu0kwL/SMeV7A=;
        b=CJmaXDue/L5w4y71SH9jc8THAMgAGTHVVgvh0PE+lJ0VIuz3McPHMdc0ufkd02sLSn
         qtRMY6G1r6TYUmvaE6DOLPKyUtgk2TjerGbC16o6xI7AmELSLsuqp7VreryNTaRGmZNB
         I4KkZmc/BTXnXgU2kTCXQT0vzeR49MAKevdu4D9DIR2bwABQVlD14Z9rBkVAncUrWP2B
         bNMnNQXpymtUjRmByTAcMQ/UNvgqXF3+eg6dNpTjfqRbPXb2nfHCLK7JDrUB+DLfu/7u
         lD2RbzbUFinBxnm3Wxtq9Pes5pRVojbrRY9TQlsTsVSnIHrk0jOQ7Pdrl0ORGZm1Uzn/
         KHGw==
X-Gm-Message-State: ACrzQf1pZEOXa9Af82jSKMPZsU+znLRnvFLIoNBh4qPmBvdiReJ+4q+C
	Mpyyz93A3JXm5VrQ2zaxE91h+PhqlHH0fctPtlA=
X-Google-Smtp-Source: AMsMyM70HRwyDNrlVbW7+24P1AAAdcmQVe1pXn7jxUKJU8FIZ1qCXCRkPEcX29c+JjYMwTHerlG/q4VaiNhf4j5TjAE=
X-Received: by 2002:a05:6512:2592:b0:49c:53de:7eb8 with SMTP id
 bf18-20020a056512259200b0049c53de7eb8mr7346350lfb.401.1663666058396; Tue, 20
 Sep 2022 02:27:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220714122322.63663-1-tmaimon77@gmail.com> <20220714122322.63663-2-tmaimon77@gmail.com>
 <20220718211046.GA3547663-robh@kernel.org> <CAP6Zq1hQ5m2kkQOKaYsKhPQhCW+vdsdyPRxxb_yRGMB=gJCPdw@mail.gmail.com>
 <3981e6e8-d4bb-b13d-7aaa-7aea83ffaad9@linaro.org> <CAP6Zq1gp1ph1wixgb6nL+2R8We2YJ2HQM2iC05itq_XWd2Cwig@mail.gmail.com>
 <bfca0379-7346-13e7-a18f-66740c5871b3@linaro.org> <CAP6Zq1gyDW8ZwwAZ1jyfNEZa09WN-biZZJY8tBmW_gzMzpj3ZA@mail.gmail.com>
 <2b0e6e33-ef76-4bd4-8894-53f9a3fe68b4@linaro.org> <CAP6Zq1iwW6HvvfM684VLG0ZT-0OLKT0udW4bHxsZsTMEypo2sg@mail.gmail.com>
 <6f1ad082-74e4-e4e7-9304-5cdd95cc9f66@linaro.org>
In-Reply-To: <6f1ad082-74e4-e4e7-9304-5cdd95cc9f66@linaro.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 20 Sep 2022 12:27:26 +0300
Message-ID: <CAP6Zq1hTS7mVWvYWfTwWvrZibKMpW5r7=wE6W9uETb=aS6MTuA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-binding: pinctrl: Add NPCM8XX pinctrl and GPIO documentation
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
Cc: Rob Herring <robh@kernel.org>, Benjamin Fair <benjaminfair@google.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Tali Perry <tali.perry1@gmail.com>, zhengbin13@huawei.com, devicetree <devicetree@vger.kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 20 Sept 2022 at 11:47, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 20/09/2022 10:32, Tomer Maimon wrote:
> > On Tue, 20 Sept 2022 at 11:21, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 20/09/2022 09:59, Tomer Maimon wrote:
> >>>>>>>>> +      pinctrl: pinctrl@f0800000 {
> >>>>>>>>> +        compatible = "nuvoton,npcm845-pinctrl";
> >>>>>>>>> +        ranges = <0x0 0x0 0xf0010000 0x8000>;
> >>>>>>>>> +        #address-cells = <1>;
> >>>>>>>>> +        #size-cells = <1>;
> >>>>>>>>> +        nuvoton,sysgcr = <&gcr>;
> >>>>>>>>> +
> >>>>>>>>> +        gpio0: gpio@f0010000 {
> >>>>>>>>
> >>>>>>>> gpio@0
> >>>>>>>>
> >>>>>>>> Is this really a child block of the pinctrl? Doesn't really look like it
> >>>>>>>> based on addressess. Where are the pinctrl registers? In the sysgcr? If
> >>>>>>>> so, then pinctrl should be a child of it. But that doesn't really work
> >>>>>>>> too well with gpio child nodes...
> >>>>>>> the pin controller mux is handled by sysgcr this is why the sysgcr in
> >>>>>>> the mother node,
> >>>>>>> and the pin configuration are handled by the GPIO registers.  each
> >>>>>>> GPIO bank (child) contains 32 GPIO.
> >>>>>>> this is why the GPIO is the child node.
> >>>>>>
> >>>>>> Then maybe pinctrl should be the sysgcr and expose regmap for other devices?
> >>>>> The pin controller using the sysgcr to handle the pinmux, this is why
> >>>>> the sysgcr is in the mother node, is it problematic?
> >>>>
> >>>> You said pin-controller mux registers are in sysgcr, so it should not be
> >>>> used via syscon.
> >>> Sorry but maybe I missed something.
> >>> the sysgcr is used for miscellaneous features and not only for the pin
> >>> controller mux, this is why it used syscon and defined in the dtsi:
> >>>                 gcr: system-controller@f0800000 {
> >>>                         compatible = "nuvoton,npcm845-gcr", "syscon";
> >>>                         reg = <0x0 0xf0800000 0x0 0x1000>;
> >>>                 };
> >>>>
> >>>> Please provide address map description to convince us that this is
> >>>> correct HW representation.
> >>> GCR (sysgcr) registers 0xf0800000-0xf0801000 - used for miscellaneous
> >>> features, not only pin mux.
> >>> GPIO0 0xf0010000-0xf0011000
> >>> GPIO1 0xf0011000-0xf0012000
> >>> ...
> >>> GPIO7 0xf0017000-0xf0018000
> >>>>
> >>
> >> Then why your pinctrl is in sysgcr IO range? (pinctrl@f0800000)
> > you suggest using pinctrl@0 or pinctrl@f0010000 and not
> > pinctrl@f0800000 because 0xf0800000 is the GCR address that serve
> > miscellaneous features and not only pinmux controller ?
>
> If you have a map like you pasted, then DTS like this:
>
> syscon@f0800000 {}
> pinctrl@f0800000 {
>   gpio@f0010000 {}
> }
>
> Is quite weird, don't you think? You have two devices on the same unit
> address which is not allowed. You have child of pinctrl with entirely
O.K.
> different unit address, so how is it its child?
The pinctrl node name will modify the pinctrl@f0010000 the same as the
range property and the start of the child registers,is it fine?
> Best regards,
> Krzysztof

Best regards,

Tomer
