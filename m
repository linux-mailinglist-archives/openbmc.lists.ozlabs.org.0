Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A94BE51FB62
	for <lists+openbmc@lfdr.de>; Mon,  9 May 2022 13:38:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxfLX3zcxz3bpf
	for <lists+openbmc@lfdr.de>; Mon,  9 May 2022 21:38:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qqvp+rBc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::436;
 helo=mail-wr1-x436.google.com; envelope-from=daniel.lezcano@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=qqvp+rBc; dkim-atps=neutral
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KxfL51t5Yz3bWD
 for <openbmc@lists.ozlabs.org>; Mon,  9 May 2022 21:37:46 +1000 (AEST)
Received: by mail-wr1-x436.google.com with SMTP id v12so18990905wrv.10
 for <openbmc@lists.ozlabs.org>; Mon, 09 May 2022 04:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=gAzu2oiPvwqDB6ep9R1plS1D4PVcvCYJK3SA9c2e6ws=;
 b=qqvp+rBczXImCRA7dY3ksVgcIYOoCRNkhZh8dUkwnUaE6zBq3kosz6kzlRPsVtkrVh
 fi89vQWHfCtzTFSSPcI4qGrHmmqQqZp3Y1xdSPOMzj/XttPjPsSdT0uMiurDKkT+CKry
 wcmLg42/Gp4QeLb8uSZ980jvJ6fytVkf3554JhzfyR76MceEHrfSLWis3M/RMqpr7zbT
 8ooy880qikdpMxCfg+89iBm9iawogCICZCIrAGzXcX+f0lxXtb0uW6+4QdhcE3dXLViO
 Svcwj7x7To+03kEZVSxEIE6W1481+u4l9/e4xJG4TsSrKwMCy8G5JaW2OhZg5A1qRjUA
 TuLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gAzu2oiPvwqDB6ep9R1plS1D4PVcvCYJK3SA9c2e6ws=;
 b=V8KpFNTCDSweMD9M5hXWEbEgHxsmUj9k/AygFLTj/9hJAjyJqbK+0Z6nMQP7iGjtkY
 i2rOlgCxgM7UGdr5/nXnTdg2Tv44O/UUUCStwRuQh3LqOCW6JlovQxgaghxyYZpbvnfr
 5MrUQsQBhubndileW8VwCucuFAh+O1u5mP6vY3N2tKxFH2UNAFQFoIt4zDdR4bOXMzDK
 D6wFgR1waYldwTdg/9yKNeMNrPTGPyuRFLKolLh1ds7PTSJuu0fmMXktzxTxwTNeO+Si
 gI5mS6/wEDhZFZ+Jp+94ZDsWLrz0s/LFg0QX26C9FIrj/iFPdA/vbhyNCRsj4/ReUzgO
 de4A==
X-Gm-Message-State: AOAM530P73nutrLSXBt2voPlaQ5AVcu6y1EJ1PKnoLl6nhbp3Pv539JV
 xxQWwF9ziY8FXqjY6r4G7Z+/ag==
X-Google-Smtp-Source: ABdhPJxC9fqJgM9+wwtN9ii5TWwn07S+AweGvci74XJz8sCoa7YTp5luuS887vQ/F30mfWkuVpSA9Q==
X-Received: by 2002:a05:6000:1681:b0:20c:5aa2:ae14 with SMTP id
 y1-20020a056000168100b0020c5aa2ae14mr13246647wrd.443.1652096262849; 
 Mon, 09 May 2022 04:37:42 -0700 (PDT)
Received: from [192.168.1.41] (176-182-171-101.abo.bbox.fr. [176.182.171.101])
 by smtp.googlemail.com with ESMTPSA id
 az11-20020a05600c600b00b003942a244f3asm15270053wmb.19.2022.05.09.04.37.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 04:37:42 -0700 (PDT)
Message-ID: <0972c833-432d-a850-958f-0d4f482e25a4@linaro.org>
Date: Mon, 9 May 2022 13:37:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 2/7] clocksource: timer-npcm7xx: Enable timer 1 clock
 before use
Content-Language: en-US
To: =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 linux-clk@vger.kernel.org, openbmc@lists.ozlabs.org
References: <20220508194333.2170161-1-j.neuschaefer@gmx.net>
 <20220508194333.2170161-3-j.neuschaefer@gmx.net>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20220508194333.2170161-3-j.neuschaefer@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Patrick Venture <venture@google.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Tali Perry <tali.perry1@gmail.com>, Avi Fishman <avifishman70@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Benjamin Fair <benjaminfair@google.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Thomas Gleixner <tglx@linutronix.de>, Guenter Roeck <linux@roeck-us.net>,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 08/05/2022 21:43, Jonathan Neuschäfer wrote:
> In the WPCM450 SoC, the clocks for each timer can be gated individually.
> To prevent the timer 1 clock from being gated, enable it explicitly.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> ---


Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
