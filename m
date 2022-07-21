Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1465557CE5E
	for <lists+openbmc@lfdr.de>; Thu, 21 Jul 2022 16:58:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LpbKp6t9cz3cBV
	for <lists+openbmc@lfdr.de>; Fri, 22 Jul 2022 00:58:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jOOxlfnR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jOOxlfnR;
	dkim-atps=neutral
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LpbKR6Gjrz3bc5
	for <openbmc@lists.ozlabs.org>; Fri, 22 Jul 2022 00:58:02 +1000 (AEST)
Received: by mail-lf1-x12e.google.com with SMTP id a23so786123lfm.10
        for <openbmc@lists.ozlabs.org>; Thu, 21 Jul 2022 07:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=48PlfsC87xgFu6A92LtJ5PO1dJ4kaDHkINOovFfDkwI=;
        b=jOOxlfnRvbCZ54WpoHg9f6j0WWPb4mOgb6DPHpl1JXM8/1EtC/pmNX6nneVoC51CE6
         7hDyGBSgjf5gVtlx4RmW8EKwOYFumvU+Knb78WZ0t1DM88NoNJLWUXI8XsROBjv2JVw1
         k7/1oQ1n6AbfrN3z9MQqKXRkj/sngRVP7Isa61fvysu4PjPRfJLSVRSb9aZg6iGDww9m
         4SORq8AgnSSIMt9NnlPLOyN6eohuoTVri2RzLwsfMUmOwmhWkaxzPPIHhzOhCx9motxW
         6kts1jBQ5PUzBj0YG637X6LCn/lPet2QMbJelyVCCNehe/ktHl6jE97uvTKAUUqgnbr7
         uhBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=48PlfsC87xgFu6A92LtJ5PO1dJ4kaDHkINOovFfDkwI=;
        b=5aFpDLPgLchZqPu6NQ+bwcO7vKAgJI5GhPZOUZWLwcP3KdV+y1zCKprgOQ7nE+WMOa
         PoD7OEw7GtvrpCKKnZ77m9ETfqFMp0gkxX4XZXIOKz8ppmjgRgQLhF5bOgL3IDZ2Iss5
         VbfgIlN3s4zZiO8VbT2zpXYsgKywfWzmvd2Mk5iJqDb6Ltzr2ja/ATY6ik5Y/JzDPnKg
         7oA+vEXdoCZdc8QuamWdSILgZUvwg6gm1Kjp5wYDhTOwzSu2UzC6abufeklfvqPMXVRB
         7I+ibaDTJNWnYywNkqGMoKPy7tlbcOB1UFqcmJk86SO245ezM7rSyQJHoCBkQCGbfBj0
         gNMA==
X-Gm-Message-State: AJIora9h7CFWrymd++rOZHsZ6o5Rjb8WY9zUQfzCRPDUugKBI8uSlu+p
	L3JgASruwDWom75ZOXbeR4v/mmnQXeo2L+UybzA=
X-Google-Smtp-Source: AGRyM1so6n4gTYaLLCB4eCt3XhqNcW/fDZPw9v13mtTTC/UlcWvIIhAFY0fQE7tGnHBgOYDnWoBRmXZWxR309iZ3Ppg=
X-Received: by 2002:ac2:4897:0:b0:489:f2ad:1191 with SMTP id
 x23-20020ac24897000000b00489f2ad1191mr21156290lfc.25.1658415478569; Thu, 21
 Jul 2022 07:57:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220721101556.118568-1-tmaimon77@gmail.com> <20220721101556.118568-3-tmaimon77@gmail.com>
 <YtlCAvJK/pb4PbJ6@sirena.org.uk>
In-Reply-To: <YtlCAvJK/pb4PbJ6@sirena.org.uk>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 21 Jul 2022 17:57:47 +0300
Message-ID: <CAP6Zq1hULj49g55N+gMf=nULzEcH8LiuHzUUhAiBHhCQ7iSpMg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] dt-binding: spi: npcm-pspi: Add npcm845 compatible
To: Mark Brown <broonie@kernel.org>
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
Cc: devicetree <devicetree@vger.kernel.org>, Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-spi@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Mark,

Thanks for your comment.

On Thu, 21 Jul 2022 at 15:09, Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Jul 21, 2022 at 01:15:56PM +0300, Tomer Maimon wrote:
>
> >  Required properties:
> > - - compatible : "nuvoton,npcm750-pspi" for NPCM7XX BMC
> > + - compatible : "nuvoton,npcm750-pspi" for Poleg NPCM7XX.
> > +                             "nuvoton,npcm845-pspi" for Arbel NPCM8XX.
>
> You've not updated the driver to accept this compatible and this doesn't
> say anything about fallbacks.

I will make sure to add the compatible to the driver

Thanks,

Tomer
