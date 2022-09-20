Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F4C5BE026
	for <lists+openbmc@lfdr.de>; Tue, 20 Sep 2022 10:32:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWvtk0hvYz3blV
	for <lists+openbmc@lfdr.de>; Tue, 20 Sep 2022 18:32:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NBYAJFzZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NBYAJFzZ;
	dkim-atps=neutral
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWvtG5XkGz302k
	for <openbmc@lists.ozlabs.org>; Tue, 20 Sep 2022 18:32:21 +1000 (AEST)
Received: by mail-lf1-x12b.google.com with SMTP id k10so2563579lfm.4
        for <openbmc@lists.ozlabs.org>; Tue, 20 Sep 2022 01:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=+/OUZiYO0SDMAPBkbc+dxN7K0Ghz3UX1HgPLq26TwY8=;
        b=NBYAJFzZKAUXo9Iojo5wexxgw0TKAuBYfXYzNcSiw7qZqMR+0vZNwnQpIsfUXZjrpW
         R87x/rjzcv+MrXy/YZQSXk9h3ESJLYWmIwyDGYyCPVV57J30cPmwy4l4W9Nf3BfK2dxJ
         XSNZZOvsWvjpmiDXXJ74IfxzHW76bT0M9MuibSzsRQUphmGkWWIC0VbhDXArlBg45Jc0
         f7a5xZyHziAUJL3o5t67zam2yoLhVnsbRyQAq61EJXEbM4AkKBBvjo//j4WSvqsJaKpY
         Yj+sV0/ClglPqQ2FqLj9fMJr0OTpZzw9U9FGYsuZRnxgyC6zs3PPtj2iXht0e55zz9jQ
         8tpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=+/OUZiYO0SDMAPBkbc+dxN7K0Ghz3UX1HgPLq26TwY8=;
        b=Ulsung7ZSBZ7vYMNRexvMoeDVvwhPGHN7h5uugLutXrMZQvkjaE023edIiyyQd4hDo
         xJq1nlo0rtmMaVJepgl0Z76QHQ4wpN8c4kJzD8ji1/QdoQ8XxG1ZH9uv7ER2z/rNmtQO
         9WkHp0sxKAWIQs/QG85jbGJkMOGahuh/atHD+tOpMuymm7/piDK5wMMetxP3YLh9sfOq
         jugaSAmnDd7BwJgp3uWIk6ea8m5iGk7CUXv1EH3v1XwOSrNaTw6sn6bW/v5sd3CgSNp1
         3TnVlyXW7RvjEn2OTIVeENa9SlhTdlndspYeuJewJ6HbiTvEaNQut3sKEyXrmAGva3Ia
         s2qQ==
X-Gm-Message-State: ACrzQf2pogJ3mQAjgk+IDHuJIbLoWpwY2bDWMMU1rjeHY1GQnMWDlJfj
	gyy5dgbnHC6X1tyuNa8mC0F8KqnGHUw8SPWiyWw=
X-Google-Smtp-Source: AMsMyM6R/zVvN7o1HLVOVBoRNZstsmoJ+m6sB78Wu1iewEJzZKmtLmXBalE8SjQYaEgEiTk+pdNoySHCq/kbebX1bFU=
X-Received: by 2002:a05:6512:b1d:b0:49f:59da:c706 with SMTP id
 w29-20020a0565120b1d00b0049f59dac706mr6078557lfu.668.1663662737989; Tue, 20
 Sep 2022 01:32:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220714122322.63663-1-tmaimon77@gmail.com> <20220714122322.63663-2-tmaimon77@gmail.com>
 <20220718211046.GA3547663-robh@kernel.org> <CAP6Zq1hQ5m2kkQOKaYsKhPQhCW+vdsdyPRxxb_yRGMB=gJCPdw@mail.gmail.com>
 <3981e6e8-d4bb-b13d-7aaa-7aea83ffaad9@linaro.org> <CAP6Zq1gp1ph1wixgb6nL+2R8We2YJ2HQM2iC05itq_XWd2Cwig@mail.gmail.com>
 <bfca0379-7346-13e7-a18f-66740c5871b3@linaro.org> <CAP6Zq1gyDW8ZwwAZ1jyfNEZa09WN-biZZJY8tBmW_gzMzpj3ZA@mail.gmail.com>
 <2b0e6e33-ef76-4bd4-8894-53f9a3fe68b4@linaro.org>
In-Reply-To: <2b0e6e33-ef76-4bd4-8894-53f9a3fe68b4@linaro.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 20 Sep 2022 11:32:06 +0300
Message-ID: <CAP6Zq1iwW6HvvfM684VLG0ZT-0OLKT0udW4bHxsZsTMEypo2sg@mail.gmail.com>
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

On Tue, 20 Sept 2022 at 11:21, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 20/09/2022 09:59, Tomer Maimon wrote:
> >>>>>>> +      pinctrl: pinctrl@f0800000 {
> >>>>>>> +        compatible = "nuvoton,npcm845-pinctrl";
> >>>>>>> +        ranges = <0x0 0x0 0xf0010000 0x8000>;
> >>>>>>> +        #address-cells = <1>;
> >>>>>>> +        #size-cells = <1>;
> >>>>>>> +        nuvoton,sysgcr = <&gcr>;
> >>>>>>> +
> >>>>>>> +        gpio0: gpio@f0010000 {
> >>>>>>
> >>>>>> gpio@0
> >>>>>>
> >>>>>> Is this really a child block of the pinctrl? Doesn't really look like it
> >>>>>> based on addressess. Where are the pinctrl registers? In the sysgcr? If
> >>>>>> so, then pinctrl should be a child of it. But that doesn't really work
> >>>>>> too well with gpio child nodes...
> >>>>> the pin controller mux is handled by sysgcr this is why the sysgcr in
> >>>>> the mother node,
> >>>>> and the pin configuration are handled by the GPIO registers.  each
> >>>>> GPIO bank (child) contains 32 GPIO.
> >>>>> this is why the GPIO is the child node.
> >>>>
> >>>> Then maybe pinctrl should be the sysgcr and expose regmap for other devices?
> >>> The pin controller using the sysgcr to handle the pinmux, this is why
> >>> the sysgcr is in the mother node, is it problematic?
> >>
> >> You said pin-controller mux registers are in sysgcr, so it should not be
> >> used via syscon.
> > Sorry but maybe I missed something.
> > the sysgcr is used for miscellaneous features and not only for the pin
> > controller mux, this is why it used syscon and defined in the dtsi:
> >                 gcr: system-controller@f0800000 {
> >                         compatible = "nuvoton,npcm845-gcr", "syscon";
> >                         reg = <0x0 0xf0800000 0x0 0x1000>;
> >                 };
> >>
> >> Please provide address map description to convince us that this is
> >> correct HW representation.
> > GCR (sysgcr) registers 0xf0800000-0xf0801000 - used for miscellaneous
> > features, not only pin mux.
> > GPIO0 0xf0010000-0xf0011000
> > GPIO1 0xf0011000-0xf0012000
> > ...
> > GPIO7 0xf0017000-0xf0018000
> >>
>
> Then why your pinctrl is in sysgcr IO range? (pinctrl@f0800000)
you suggest using pinctrl@0 or pinctrl@f0010000 and not
pinctrl@f0800000 because 0xf0800000 is the GCR address that serve
miscellaneous features and not only pinmux controller ?
>
> Your map looks quite different from what you described in example.
>
> Best regards,
> Krzysztof

Best regards,

Tomer
