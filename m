Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A6657CDC6
	for <lists+openbmc@lfdr.de>; Thu, 21 Jul 2022 16:36:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LpZrj3H1Rz3c8X
	for <lists+openbmc@lfdr.de>; Fri, 22 Jul 2022 00:36:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZtPDqAPN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZtPDqAPN;
	dkim-atps=neutral
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LpZrL4gHvz2xk0
	for <openbmc@lists.ozlabs.org>; Fri, 22 Jul 2022 00:36:17 +1000 (AEST)
Received: by mail-lf1-x135.google.com with SMTP id n18so3138790lfq.1
        for <openbmc@lists.ozlabs.org>; Thu, 21 Jul 2022 07:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a45XGYjGqJj1SQDNhpIFTnsS1sN/Pvl1ei9cqTikBdo=;
        b=ZtPDqAPNcLI5BmGpzis11nE5xbKaJSqYBdhdLVwZSA9MIrBTenSJl984+CJg2un54E
         0vOQ9dVDtygBYd2OWxt0jt320O9/Cfz5DmAre28h5pFNYVpyjnnyWq0mOd1kxYA/wQDb
         Nk8uVDwav760RHf7Re6a4/p6aREx/utu7K/v8xQvupb6Nvdp6pLi9grUtIqDJNUC/2lk
         TVSJ4PZPO1LxcpuZSqldEfoGfaPUbS5jXm6dPfX87s45ZNYXduJo+A2CnUyEOB6FPIVy
         5eG5O2MPHt/BMI7s3vo5BhVu0vZsAh34ZHRP8rBvLXTcHFiq8r9dro2jAi6SIuuphkLz
         YyTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a45XGYjGqJj1SQDNhpIFTnsS1sN/Pvl1ei9cqTikBdo=;
        b=aiQI5gz9Ho4O5JCsbKcsOcUN6xe3qJcR64lb1wFp8j2IWpo/otxqKqdLE969z/FHUm
         DDwPYxaTkXv1h0OBIWB54Bm7v19CtxrGZjJS09fZLWsqPgm+L4jvZ4geGZrEcZw1AImM
         CyH81R0VM4vF1jZMXwvL6isB4wOFAq9A1ex9LxO8VDtX5s6VMFQ9TSO8ODEsq9o3s1qK
         gbLk6b2jlzJTxaFHNvXxgPDOKoky9i7kOM1eB9ZHk9/khaK3o7grqHqgH5U8Y1vdC8aZ
         WcH6rB93qrRLKhEB1JKDAMaqBPDdrc3bQl7Ti+MpTuD746hFFpErMGVAzkKviFSc9Jbl
         vTHg==
X-Gm-Message-State: AJIora8+3E3420aZphSyFVS+l8Me7x9MCAhc7kLjNFnt9+FqNWycn2I7
	xp78+eKMxzmvxD4GeR8hdvxQhHySHgItj+iUwkU=
X-Google-Smtp-Source: AGRyM1tJveEikQFTfSBOWxKIFmbqGzdQVmYaRXPZa7hYzIom8WOv8CXPxQnNyXC+Eclmf8Z12KA3a8w8w+W0bZdh2FU=
X-Received: by 2002:ac2:4897:0:b0:489:f2ad:1191 with SMTP id
 x23-20020ac24897000000b00489f2ad1191mr21118185lfc.25.1658414169880; Thu, 21
 Jul 2022 07:36:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220721101556.118568-1-tmaimon77@gmail.com> <YtlES7MX6nJr8l+L@sirena.org.uk>
In-Reply-To: <YtlES7MX6nJr8l+L@sirena.org.uk>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 21 Jul 2022 17:35:58 +0300
Message-ID: <CAP6Zq1gB1yrqNDJROf8xyjYiCv6H-rW=Qa7J17AoFo3mv5hsLA@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] spi: npcm-pspi: add Arbel NPCM8XX and full duplex support
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

Thanks for your comment, next version I will make sure to send two
separate patches

On Thu, 21 Jul 2022 at 15:19, Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Jul 21, 2022 at 01:15:54PM +0300, Tomer Maimon wrote:
>
> > Tomer Maimon (2):
> >   spi: npcm-pspi: add full duplex support
> >   dt-binding: spi: npcm-pspi: Add npcm845 compatible
>
> It is not obvious why these are a series, they appear to be entirely
> orthogonal.  If there's no relationship between patches it's generally
> better to send them separately, that way problems with one patch won't
> hold up unrelated patches and reviewers aren't left wondering about why
> things are grouped.
>
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

Best regards,

Tomer
