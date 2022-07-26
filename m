Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFCB581A5A
	for <lists+openbmc@lfdr.de>; Tue, 26 Jul 2022 21:33:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LsnC95Ddvz3c4h
	for <lists+openbmc@lfdr.de>; Wed, 27 Jul 2022 05:33:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=m3lc4+qI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=m3lc4+qI;
	dkim-atps=neutral
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LsnBk59b3z3bgR
	for <openbmc@lists.ozlabs.org>; Wed, 27 Jul 2022 05:33:16 +1000 (AEST)
Received: by mail-lf1-x12a.google.com with SMTP id w15so16061793lft.11
        for <openbmc@lists.ozlabs.org>; Tue, 26 Jul 2022 12:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fR1dczgLxpZ02G+EclfekDkoYiKhvbST8mgypurlcnY=;
        b=m3lc4+qIWX3T6M2+KKp6mZF2S4BCl6PzktWcterEKkqck7dVWQjN49xWIcn8DPTaPM
         GdbaC1JjvyEiZre6lcBKIOl7BpqUJnYAkluWn/m8I9y6i6+G6pro26Oy5KlLIeUPFcth
         e5Jth3X/Cpk5T3XXCjeDcMnN88PxQAHDW4UUhjB+E/J3R/kIHFjEc9/1Iy47/rM5NzLT
         l9Efe5mvMPXfL0cQ9x1ZhWzUqUh1s04FT5iAYcNXxLBemPMamjx2nJ6zKR1flgmdG0FT
         huG71wIpondJOGxz3jq7PdGAVn0dr1EwxoYx8oCq9d1jRC+8LQzCXeFcZJM9zRUMBTmU
         LScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fR1dczgLxpZ02G+EclfekDkoYiKhvbST8mgypurlcnY=;
        b=YrUlOncblNpYA5i0mGb72zl6vUK7m8DturmYEoq3PqNKCB3qL4kZazvterPhvjcxRe
         uA4pZle9jv/1jScNKR9wjLZ9KTwqXj0R5Vm0nDXDIGKcqs0p7pH3EjDInKLFI9L03hhK
         7ooxz0agFeGL9zquws1L1lIyAjS9aU5pvgyVw8bhD8cgDLLnvo/QIQBvUswAuolF3M80
         dX6UFATRZR+3YgFt2Iwevij8aj3xibJJ706Pd1SMTE5U+igr4XZBC4Yd51Hfo1/bPhlC
         A9BnnGqP+LBMutT+7PqNNZhmH4sK3LCHOOp3rdCRzuE7KKSpUITfaMmu26zg5SS280/E
         wgXg==
X-Gm-Message-State: AJIora/hKUzBPhdT6VihWpL4nAgsaqftlJN+AlX57Mmu10YP78IFcfoh
	9xtGEmvS6R8hcng/yI+Zgu2c5l4tLyDcBvCsVHs=
X-Google-Smtp-Source: AGRyM1sO/5Vm+fBeb2gt2lsBqm4kaXr1AAok8SnmnIdPf3F0WsG3UoMQ+b6lvQ1SzSmAUALwPzOPXIAh4swyRdGzqy4=
X-Received: by 2002:a05:6512:693:b0:48a:7c23:1896 with SMTP id
 t19-20020a056512069300b0048a7c231896mr7355400lfe.111.1658863988371; Tue, 26
 Jul 2022 12:33:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220722114136.251415-1-tmaimon77@gmail.com> <20220722114136.251415-3-tmaimon77@gmail.com>
 <afae04e0-76a3-1bcb-5b47-9944fa9ab2c0@linaro.org> <YtrvyyMGm64hFG5j@sirena.org.uk>
 <0c8688d5-b0c1-8cc1-ec27-292acbb38dfc@linaro.org> <YtrzF9BFJrXfxiz0@sirena.org.uk>
 <CAP6Zq1iRowFv4qg=AqdVmBRRx5p4-5AaC1G-aZs=2LnOAOELXA@mail.gmail.com> <20869b88-41f3-9e9c-347e-17c3d01baa5d@linaro.org>
In-Reply-To: <20869b88-41f3-9e9c-347e-17c3d01baa5d@linaro.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 26 Jul 2022 22:32:56 +0300
Message-ID: <CAP6Zq1iHCL9Krjw-wYKrG1K_yzwj-_qNROYxhogvkDjk+gCL-g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] spi: npcm-pspi: Add NPCM845 peripheral SPI support
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
Cc: devicetree <devicetree@vger.kernel.org>, Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Tali Perry <tali.perry1@gmail.com>, Mark Brown <broonie@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-spi@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

Thanks for your explanation.

On Tue, 26 Jul 2022 at 12:47, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 24/07/2022 10:44, Tomer Maimon wrote:
> > Hi Mark and Krzysztof,
> >
> > Thanks for your reply,
> >
> > On Fri, 22 Jul 2022 at 21:57, Mark Brown <broonie@kernel.org> wrote:
> >>
> >> On Fri, Jul 22, 2022 at 08:47:24PM +0200, Krzysztof Kozlowski wrote:
> >>> On 22/07/2022 20:43, Mark Brown wrote:
> >>
> >>>> ...with a fallback list required by the bindings so the driver actually
> >>>> binds.  Note that bindings are currently not in YAML format so there'd
> >>>> be even less enforcement of that than normal, and as they're currently
> >>>> written the bindings don't require fallback.
> >>
> >>> Yes, the bindings document should be rephrased but we were living like
> >>> that for few years. :)
> >>
> >> The binding document as it stands only has one compatible, there's no
> >> existing problem with it other than the YAML conversion.  If we're
> >> adding something new that requires a fallback we should be explicit
> >> about that rather than have something that's actively misleading where
> >> previously things were clear.  I don't mind if we add the compatible to
> >> the driver or document the requirement for the fallback but we should do
> >> one of the two.
> >
> > is V2 good enough? adding the compatible to the driver and the document?
> > Or should we use fallback?
> > If fallback is choosen, can you explain how I should do it?
>
> I propose to use fallback. The preferred way is to convert it to DT
> schema and then add new device support (so two commits). Other
> acceptable way is to rephrase the TXT so it clearly states desired
> compatibles - one for old device, two for new devices. There are plenty
> of examples in current sources.
Appreciate if you could clarify.
in case we use DT-schema, we dont describe the fallback like we doing
in txt document?
I mean that in the yaml file we should describe the NPCM PSPI
compatible property as follow:
  compatible:
    enum:
      - nuvoton,npcm750-pspi
      - nuvoton,npcm845-pspi

If yes, how should the user know that he needs to use fallback incase
is using nuvoton,npcm845-pspi? only from the device tree?
>
>
> Best regards,
> Krzysztof

Best regards,

Tomer
