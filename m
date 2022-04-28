Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC68A5148FA
	for <lists+openbmc@lfdr.de>; Fri, 29 Apr 2022 14:15:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KqWfM63lkz3bZs
	for <lists+openbmc@lfdr.de>; Fri, 29 Apr 2022 22:15:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nwxJLpJv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52d;
 helo=mail-ed1-x52d.google.com; envelope-from=krzysztof.kozlowski@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=nwxJLpJv; dkim-atps=neutral
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpqtM3cSZz2y8R
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2022 19:23:37 +1000 (AEST)
Received: by mail-ed1-x52d.google.com with SMTP id d6so4787567ede.8
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2022 02:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jB9oC3xjpoFxUS9LFdQlfVxwFGaXRBq5QGeiE+tRIqM=;
 b=nwxJLpJvy+wRjL/DDaJ/04bHNsQKwmjHqfcQlgcfGg7zgRkGsl425sj0PSAkzSP1TT
 C649QghEbY76G7BX+E0MRj4p9vlpn0jgvkYBfx5YyWJjNndEb5EiXl3T6C6vex6rSWoQ
 l0w2z18kT2npM8rjj6JSz/HVAUY68Of+WRZswANlJOuaWLFIIg+3Sgw4Y4uZft3p3Cw0
 pcI4xRrsw/bn8Y3pLl5hq7/TC0nwv3o6fOCx1gEMMHVhiXRENcCxYkJPyuwi5y0sD0mf
 DuFHmMNI58YCgdoRqQ72JwIzRu7T8+yoyv0kHDPOKuNKjKB3efxoPbVYkBlu8Jyk6ejt
 TZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jB9oC3xjpoFxUS9LFdQlfVxwFGaXRBq5QGeiE+tRIqM=;
 b=c0ISlVyswpveKPXYbrpWlo/NK80d1pK+CxxZiSnSAkWpJelHbLRGrYnRfWhpvpDSZR
 oJxigDyUSciA/sR2wwrucT8gCutucm0d65PYm3Yh7cVls31FYPFEl9H5f3G4p3F0Kk5Z
 NMRf7yj/R9YHCD8Tnj/dIkbklMg6LlfVlL4PlIGdKgDML0BNaVDo800xJRTEiMp9A7AM
 G+SnOuuixC6B0dU5umPaJzp+D99GYiu2T6U+efNPpnDW1vvxo4htwar2ecA8ZUtiQiJ6
 GH1xyjzuT9F6taiKD7RfiTu5QAKcNubRStX34cwK1BSuHY2IqYRP8JKqlWyaifOqvri8
 zp4g==
X-Gm-Message-State: AOAM530HKKBCtkQnsu7wme9ojCSdcOarBdsgx6hgJdqXbjGBvtrhmdbA
 k2PIKFfpAOaDxeddcQPwX/waNQ==
X-Google-Smtp-Source: ABdhPJxqQB4FhB1qwQB/ovi3BQShEh8+1kJBd2RzhXx0hDKyJJUUMioSgGqZTIvWf08I0UyrdgaiKQ==
X-Received: by 2002:a05:6402:3584:b0:423:e4d0:34f with SMTP id
 y4-20020a056402358400b00423e4d0034fmr34874477edc.72.1651137808445; 
 Thu, 28 Apr 2022 02:23:28 -0700 (PDT)
Received: from [192.168.0.161] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 ew15-20020a170907950f00b006f3a3d60b9csm4725483ejc.63.2022.04.28.02.23.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 02:23:27 -0700 (PDT)
Message-ID: <8d919dc0-80a2-106f-9397-49263cf4ed5a@linaro.org>
Date: Thu, 28 Apr 2022 11:23:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 4/7] dt-bindings: clock: Add Nuvoton WPCM450 clock/reset
 controller
Content-Language: en-US
To: =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 Joel Stanley <joel@jms.id.au>
References: <20220422183012.444674-1-j.neuschaefer@gmx.net>
 <20220422183012.444674-5-j.neuschaefer@gmx.net>
 <31cb9af1-173d-bef5-64da-ccf5a01f2485@linaro.org>
 <CACPK8XdRYvike9Z98JzfO1r0W2jfkESr8xMGSH4kkigwZ_MkyQ@mail.gmail.com>
 <YmpWeOb3oetvqyvl@latitude>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YmpWeOb3oetvqyvl@latitude>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 29 Apr 2022 22:12:55 +1000
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
Cc: devicetree <devicetree@vger.kernel.org>,
 LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Benjamin Fair <benjaminfair@google.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Guenter Roeck <linux@roeck-us.net>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-clk@vger.kernel.org,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 28/04/2022 10:55, Jonathan Neuschäfer wrote:
>>>
>>> All these defines should be in second header in dt-bindings/reset/...
>>
>> I disagree. It makes more sense to keep the definitions together, and
>> it's all for the same hardware and driver.

These are bindings so the usage by same driver (Linux implementation)
matters less or even does not matter.

Driver can be split from one to several and you would need to include
clocks in your just-split-reset driver. Such driver split should not
affect bindings, therefore having the binding headers separate is
actually the most flexible.

> 
> It's for the same hardware, DT node, and driver.
> 
> I could imagine splitting it into
> 
> 	include/dt-bindings/clock/nuvoton,wpcm450-clk.h  and
> 	include/dt-bindings/reset/nuvoton,wpcm450-clk.h
> 
> if someone insists on it.
> 
> For convenience (being able to see all relevant definitions for
> nuvoton,wpcm450-clk at once), I'd prefer to keep the definitions together.

I don't insist. For some of the devices we split it, for some not.

Best regards,
Krzysztof
