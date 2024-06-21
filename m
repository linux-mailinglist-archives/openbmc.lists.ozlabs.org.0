Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 652D5911F74
	for <lists+openbmc@lfdr.de>; Fri, 21 Jun 2024 10:54:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jeU59NxV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W5B4G3lnWz3cYh
	for <lists+openbmc@lfdr.de>; Fri, 21 Jun 2024 18:54:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jeU59NxV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W5B3k6V0Pz2xFn;
	Fri, 21 Jun 2024 18:53:54 +1000 (AEST)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-52cd80e55efso577717e87.0;
        Fri, 21 Jun 2024 01:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718960032; x=1719564832; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C2NbmAeSPtr+VJPCDZGzIPSzbzCrEPpKv2Ul8cjGJpg=;
        b=jeU59NxV/eHzY1NfGjJ13EtTqbbMwQD65WeLvRPFWvok9WHUlw1ahIIXN8cbLRzOn7
         tRh8r15p/UBCQZJh0EcXxP8Xaa09o/5LcPAdD0jh02aUlXWAr8eJTtFTXJhRRiJOHLi5
         RizBrzJeiwu4dCrS2L5+qIZ1Rcm4N7OAEIcypX87bEvIQ/cEjJxPIYFkCiAbjmJzqCZl
         mb2aARk3hbExlIpekIhjdJ41syBqh4lfLsID+dO7lEqdy7U1nLPy+230xu8fsWi3wfMP
         CRigVf7ujjUbVrzcHlu5bSKMn8a43ZyAcGAkxRaxpEmejqb30DkFv1c7FMR8tvVPdMdL
         L9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718960032; x=1719564832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C2NbmAeSPtr+VJPCDZGzIPSzbzCrEPpKv2Ul8cjGJpg=;
        b=tUQs+ZO8wTe7fOIT6hoSjwvnYnH2pa+wITcdDb0fpomKombTk6qgXptw9jFP6aZAok
         3KjEh6BcVyhhALp/S78Bnh8a+hqOkh1B2n9yeTWcrevnRTQP9qE8JUrHfMGFMNAcf9pU
         UW9ncm78IxkBV0vRi13rbsj3Cjamm7diD6KT5f44yHBIAAeh34B2FYnCSsUUR0p8Kd6K
         i3y6tZgfGQiPac1fBm+7i9qtSgaEpsuzcpRlP2V4cCuLC7voACRuVsJO8mSJzmUhJ1Hw
         6TgE8Vfu5NcWDdu3CSKKHcDcPLbs4jwKwtwST/K0ZCnNsk4M+qb8nfzeY75+5g04GWE9
         f/+A==
X-Forwarded-Encrypted: i=1; AJvYcCVVsivTDjqFY0suu0W+paV0zWVmvn2Aru/JBy5AUB1Z8bSxp/60MyCVYtKD2azAnj4xAslQus2TGzXQDBWK4Wa8m1mYsCqWRJKM9C7SceSYn2iogT++DyrnSHRaaoIpjCfoTXjgWztU
X-Gm-Message-State: AOJu0YzcKAEv7VLY69LlD/4PtpLg05wqs1j7OBXfynRcZN7dgCZp+Oqd
	yFSwGYLga2qx6XM0nC7lSn6m3VajdYsqwJ9fwZjKpNgHiGZrlIv0bOog5li35fgb3eFKTYUfcj4
	WVYSw1tO/CkKjf9oLpO8EUfUUj5Y=
X-Google-Smtp-Source: AGHT+IFACBZJL/JrK568qW0O9LvAd+FrY4FSuAOLFmRWXPL7E3VDBY2O378p7oDlZU5U3E2pPeP3u6Glqf31Mu/d0J0=
X-Received: by 2002:a05:6512:4ca:b0:52c:d5e4:9a99 with SMTP id
 2adb3069b0e04-52cd5e49ccfmr1025377e87.17.1718960031907; Fri, 21 Jun 2024
 01:53:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240620084337.3525690-1-potin.lai.pt@gmail.com>
 <20240620084337.3525690-2-potin.lai.pt@gmail.com> <cb55efedaef63e4580c11415aa2e29606edcaf9f.camel@codeconstruct.com.au>
In-Reply-To: <cb55efedaef63e4580c11415aa2e29606edcaf9f.camel@codeconstruct.com.au>
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Fri, 21 Jun 2024 16:53:40 +0800
Message-ID: <CAGfYmwWp2dayGvySdYvU+nmtxZ-x3PPW_j69ZoBD4mxzPMQAzg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: aspeed,ast2600-pinctrl: add
 NCSI group
To: Andrew Jeffery <andrew@codeconstruct.com.au>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Potin Lai <potin.lai@quantatw.com>, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Cosmo Chou <cosmo.chou@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Jun 21, 2024 at 8:46=E2=80=AFAM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> Hi Potin,
>
> On Thu, 2024-06-20 at 16:43 +0800, Potin Lai wrote:
> > In the NCSI pin table, the reference clock output pin (RMIIXRCLKO) is n=
ot
> > needed on the management controller side.
> >
> > Add NCSI group to distinguish the pin group between RMII and NCSI.
> >
> > - RMII pins:
> >   - RMIIXRCLKI
> >   - RMIIXRXD0
> >   - RMIIXRXD1
> >   - RMIIXCRSDV
> >   - RMIIXRXER
> >   - RMIIXRCLKO
> >   - RMIIXTXEN
> >   - RMIIXTXD0
> >   - RMIIXTXD1
> >
> > - NCSI pins:
> >   - RMIIXRCLKI
> >   - RMIIXRXD0
> >   - RMIIXRXD1
> >   - RMIIXCRSDV
> >   - RMIIXRXER
> >   - RMIIXTXEN
> >   - RMIIXTXD0
> >   - RMIIXTXD1
>
> I think listing all the pins for both groups obscures the fact that
> there aren't more changes than removing RMIIXRCLKO.
>
> Can we instead drop these lists and replace
>
> > Add NCSI group to distinguish the pin group between RMII and NCSI.
>
> With:
>
> > Add "NCSI" pin groups that are equivalent to the RMII pin groups,
> > but without the RMIIXRCLKO pin
>
> ?
>
Got it, will update it in the next version.

> >
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> > ---
> >  .../devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml     | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-p=
inctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinc=
trl.yaml
> > index 00b6974a5ed3d..3f02dc94a7ce2 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.=
yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.=
yaml
> > @@ -337,6 +337,8 @@ additionalProperties:
> >          - MDIO2
> >          - MDIO3
> >          - MDIO4
> > +        - NCSI3
> > +        - NCSI4
>
> Can we also do this for RMII{1,2}RCLKO (and in the driver patch as
> well)?
>
The power of RMII{1,2} is 1.8v, which does not meet NCSI requirements.

> >          - NCTS1
> >          - NCTS2
> >          - NCTS3
>
> Overall, what I was hoping for with the comment on the earlier patch
> was that you would add the discussion in the commit message to the
> "description" entry in the binding YAML. Can you please do so? That way
> the information is always present for people reading the binding
> without them having to look at the binding's change history.
>
Got it, I will add note into aspeed,ast2600-pinctrl.yaml.

> Thanks,
>
> Andrew
