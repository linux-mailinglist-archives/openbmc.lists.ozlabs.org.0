Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72880622695
	for <lists+openbmc@lfdr.de>; Wed,  9 Nov 2022 10:15:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6fSt29jwz3cHl
	for <lists+openbmc@lfdr.de>; Wed,  9 Nov 2022 20:15:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kbovMEF+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kbovMEF+;
	dkim-atps=neutral
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N6fSG48mLz3bgC
	for <openbmc@lists.ozlabs.org>; Wed,  9 Nov 2022 20:14:51 +1100 (AEDT)
Received: by mail-ej1-x635.google.com with SMTP id ft34so8631344ejc.12
        for <openbmc@lists.ozlabs.org>; Wed, 09 Nov 2022 01:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BII9zpGzB69RugugB6yoflzCcqpd30y/N1Z9Get0kNc=;
        b=kbovMEF+8HLQIt31/GrcUDBIGre3xrC8pBrRd5oe7sfJkpNpFdzAoEm+XSpeIPn1cM
         1JdHOaKHVMwjdxmAMHZ8ifz82J5VAnAD+09wU3dIL4/I8o3AImDcRZw55jxwCvpBFlm5
         Ns7TQ3Q6CC/l8R1UzGv31aRJ5KWYrvrqIsW5y/rQ2ZITwr7o0vqDCJ7YKaOk0FR1RaBh
         uM0DG4ve29ACq9duIvMGpZlXDXZ+89wNzYdDqvTJSqoTFvLLliy9V6XwXdwYuHFgEIAO
         boT+SnoFdEU6w4AvkXW/uDcdRpXM82h82QHBix/0qIM7xdI/mFpuG9YS8g7H03LKKw0z
         RqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BII9zpGzB69RugugB6yoflzCcqpd30y/N1Z9Get0kNc=;
        b=hRDQ7P+ayB9gIWS6IOvROOCEDx1XGJN4gTitRGRcbtIkUPPdNnV+/nmOh7o/IKM0zo
         yt35xROoyqb62Oq26OHWjyPXEBvdPrq6C7tzPhdgDWdyD6Visx4AJSSvN6I0yHsgO9S9
         44DhOPnN6o3Hhz3tHI2OwOWX+0zMGMCxQStf27uvKNxOMYsZGygWvm1bqdOUIHb9Ic96
         awiC3urHKjOQlVMdTK8G/36EvoS0p/wp5DGw3ax+1rGzDDRmSyFW6KF6gDAbT3Ul2SpV
         mEQfli1AfvhtNxeog9B5pjxFICwsf6EugEUY3iADirbw82OJge9i4hlvGI2DECvL2kMD
         ZoeA==
X-Gm-Message-State: ACrzQf3ZeSx57fKrDsS31xNMqMmzDWYwySlB3avS7bBL8jsEUC0aPHFA
	VGuUtcM76U0yZzBFe4sJHCnVzp1x/4AIyYW7dpuWGg==
X-Google-Smtp-Source: AMsMyM5ksqUJ8SVIvXrtIwFN5i88+m+DzparWxKXy8NGnIIzbgssm45e6mhLSH/PRjclkP8xuAkTVBww6rMhLGIwxzg=
X-Received: by 2002:a17:907:c1e:b0:7ae:31a0:571e with SMTP id
 ga30-20020a1709070c1e00b007ae31a0571emr24270592ejc.690.1667985287893; Wed, 09
 Nov 2022 01:14:47 -0800 (PST)
MIME-Version: 1.0
References: <20221108092840.14945-1-JJLIU0@nuvoton.com> <20221108092840.14945-4-JJLIU0@nuvoton.com>
In-Reply-To: <20221108092840.14945-4-JJLIU0@nuvoton.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 9 Nov 2022 10:14:36 +0100
Message-ID: <CACRpkdb+Bkwa8yCKGtRcsJ6KnJh+RUuz_gOrQV63pcYQLaHCaw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: gpio: Add Nuvoton NPCM750 serial I/O
 expansion interface(SGPIO)
To: Jim Liu <jim.t90615@gmail.com>
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
Cc: KWLIU@nuvoton.com, devicetree@vger.kernel.org, brgl@bgdev.pl, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Nov 8, 2022 at 10:29 AM Jim Liu <jim.t90615@gmail.com> wrote:

> +  nin_gpios: true
> +
> +  nout_gpios: true

My comment from v1 still holds.
I'd say just drop these two, it's too much trying to protect
the users from themselves.

> +  bus-frequency: true

Given that you have clocks already, what does this actually specify?
Which bus? The one the GPIO is connected to? Why is it different
from the frequency from the clocks? And what is it used for, why does
it need to be specified? So many questions.

A description is necessary.

I guess the : true means it is picked up from the core schemas somehow
but that doesn't make me smarter.

Yours,
Linus Walleij
