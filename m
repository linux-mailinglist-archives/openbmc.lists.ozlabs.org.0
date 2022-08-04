Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84207589ED6
	for <lists+openbmc@lfdr.de>; Thu,  4 Aug 2022 17:41:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LzCcy1VTpz3bXG
	for <lists+openbmc@lfdr.de>; Fri,  5 Aug 2022 01:41:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=laH6fB3j;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com; envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=laH6fB3j;
	dkim-atps=neutral
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LzCcW0WxWz2yn3
	for <openbmc@lists.ozlabs.org>; Fri,  5 Aug 2022 01:40:58 +1000 (AEST)
Received: by mail-lj1-x22e.google.com with SMTP id z4so249019ljn.8
        for <openbmc@lists.ozlabs.org>; Thu, 04 Aug 2022 08:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=1leJD2jYdoCH2YF7serqPkhW+3ZM8UEl9gxlKtZpBek=;
        b=laH6fB3jX1QrWTXtnY0qRiG3yiIKuZ4sSkr3yP8rxh1K2TGiHIorSIQj6pXgAPPmeB
         xjuQPlvW66l4ncnGmdARxcrcDDCuJip7fBWe/TENNYsO6wB8viV1yd7NePXWO7qdTqYx
         8MfNKUYe0peXYXpxBRzDrWsNShuAsTnMWECNSf1keJI2JPSIsOflFQGQKG9g3i7souQ4
         vlEEDBcYzkLA3n4eGouBn/EOQRxK7qHWWNwZIozIXzHZExLeIMgz7zNd/S4ay+07kWlX
         Jm52skrNW+E54wGgzw53RO8RayH5aAClCL5hZm0q1mY5SUz9ja90B+8TdmhYjukln66M
         ZsDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=1leJD2jYdoCH2YF7serqPkhW+3ZM8UEl9gxlKtZpBek=;
        b=c+0xWUdd2rs+E+lGLkcd02033hGV3xtmOxFq/w8KVYWrsqwelwG5JxGJhEdbicJBVo
         ZyzjjL5ADSSaHbgmRzgKRxRq+rPqlxqcvTEwDZTJtw3WgVxwtWYQQlcgWEFY9GTdbtBh
         ZhhozW9ZxgiWZvwX7Gtmqp8FrfQYjNqnzLSzQIBNeZwelSL6YMaLJL6QjPlJLwYKb4wi
         sTDpc3aBD3KHhS43Vd+hIRfYjbaFDRfPOA9h17p9GR4TOyAMdMjmIkJkIGylDqDMzf/+
         ViZqNbe0niVWqwfDtFRv2RgFBUmiiAXwqCzL24g7O+J/0L7Y8IR1jzQxpn1jkvnVwJma
         PCxA==
X-Gm-Message-State: ACgBeo3qt2oiKjl9vel+i9B8Bpwgxj7gQAx+BiZat1mfxY8T6yTwfBw2
	jL28Z52PDMxnb9Fi+5ZcMog+V+H6vKR1mYKvqo8=
X-Google-Smtp-Source: AA6agR5RGzkugERz/4oeLaBfhq3ArqArrOJPuit3/LvK760dfD+laKr6a9iKinniQ0NQiCL5MKgOdQhbs91FsvnJysg=
X-Received: by 2002:a05:651c:2d0:b0:25e:6c94:59d5 with SMTP id
 f16-20020a05651c02d000b0025e6c9459d5mr810993ljo.488.1659627653867; Thu, 04
 Aug 2022 08:40:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220804145516.217482-1-tmaimon77@gmail.com> <6fef92f3-6932-5c20-57fe-9eb40d676013@molgen.mpg.de>
In-Reply-To: <6fef92f3-6932-5c20-57fe-9eb40d676013@molgen.mpg.de>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 4 Aug 2022 18:40:42 +0300
Message-ID: <CAP6Zq1hvDdDO3yA=rFAvKMg20EM6OuoiVnxOBMbrpB9oHaMbfw@mail.gmail.com>
Subject: Re: [PATCH v1] dt-binding: ipmi: add fallback to npcm845 compatible
To: Paul Menzel <pmenzel@molgen.mpg.de>
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
Cc: devicetree <devicetree@vger.kernel.org>, Benjamin Fair <benjaminfair@google.com>, minyard@acm.org, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, openipmi-developer@lists.sourceforge.net, Jonathan Cameron <jic23@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Paul,

On Thu, 4 Aug 2022 at 18:01, Paul Menzel <pmenzel@molgen.mpg.de> wrote:
>
> Dear Tomer,
>
>
> Am 04.08.22 um 16:55 schrieb Tomer Maimon:
> > Add to npcm845 KCS compatible string a fallback to npcm750 KCS compatib=
le
> > string.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >   Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt=
 b/Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt
> > index cbc10a68ddef..4fda76e63396 100644
> > --- a/Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt
> > +++ b/Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt
> > @@ -7,7 +7,7 @@ used to perform in-band IPMI communication with their h=
ost.
> >   Required properties:
> >   - compatible : should be one of
> >       "nuvoton,npcm750-kcs-bmc"
> > -    "nuvoton,npcm845-kcs-bmc"
> > +    "nuvoton,npcm845-kcs-bmc", "nuvoton,npcm750-kcs-bmc"
>
> Isn=E2=80=99t the added string exactly the same as the one below the comp=
atible
> line?
it is not the same, it describes a fallback to NPCM7XX KCS Since
NPCM8XX KCS and NPCM7XX KCS modules are similar.
>
> >   - interrupts : interrupt generated by the controller
> >   - kcs_chan : The KCS channel number in the controller
>
>
> Kind regards,
>
> Paul

Best regards,

Tomer
