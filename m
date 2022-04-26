Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BED0510C32
	for <lists+openbmc@lfdr.de>; Wed, 27 Apr 2022 00:49:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Knxrr0kjDz3bcy
	for <lists+openbmc@lfdr.de>; Wed, 27 Apr 2022 08:49:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AfK1/zrk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52d;
 helo=mail-ed1-x52d.google.com; envelope-from=krzysztof.kozlowski@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=AfK1/zrk; dkim-atps=neutral
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KnjY73dNmz2xBF
 for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2022 23:34:49 +1000 (AEST)
Received: by mail-ed1-x52d.google.com with SMTP id e23so1334270eda.11
 for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2022 06:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5zRT5sllSsaGeFvu1yaUlRoHxNiWR89igSrOyjo1FG4=;
 b=AfK1/zrk/APNctf5T9jianFlu/dOwBeL60VvN0e/AUy20xraPdotq4gHXNjA82CwJr
 ASxbJYqu/egWXvhpdKoCATOneKWXEB28QPFqU/ljIv7xIVAyep8++QsrKalLELi38q10
 K0gVVa4FyK1t8583z4ZcRnHTJDFCo4aXPEOnCMQPKOVFVeYZy3rM/h2kAQSa7PPkoHke
 gXsnm8Yy78EAhDlPM8YcMa30cLGqmBSUZGqsijkjXNayacWiKkU1T55DciCPfdIoS15v
 /r8zAhYkcEExrX6vnIyglxCze6PJY288k25AKszUJPG1oADUV5q4y7/jD/hKEuA12URa
 AyFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5zRT5sllSsaGeFvu1yaUlRoHxNiWR89igSrOyjo1FG4=;
 b=OVAlYrppHztga48bycB2DTkYLjUo5h5fMBRw+JDSVBwnb/i7YtI6kgKlsA223uQaMG
 7vi6fYMFUAIviBQC30lo3abnJj7jcUYO8A3rpRGJcZi9ljAktPzzDtmnOP2AhH6D/1OO
 QZyXAdudGo3wbWiJImpWHCxm+HOk+7nO3s/ZLFRHchRnU4Yz8Eq2j3kkrxvPyBjvbA7r
 ZBvXyOjTwRy8JdYyHdwS2JyIZsmXDlxJmemlc2neiF/SRWx2n3Bal0qSqNos6ltxtFT1
 xL8cDxv8+ixS2YxFgDT8TmVr/EJ2OdPN5iBbm1BO/KjmERhzl4dNq8VFcNho6E9Lf2BQ
 qKMQ==
X-Gm-Message-State: AOAM531xglKvaWvLZIHfL0VuI9fIRwQaEQX5zBeqPV4sAmdNMpbtigeL
 hDkLa+hREicqkvqoK6h8vtJjSQ==
X-Google-Smtp-Source: ABdhPJxrkUCfsREmZu2hMfXwSgf00eMictV7sH2Jynsq9vkfWIIiY5pr9thcID2PxdIUiCu86TY+jQ==
X-Received: by 2002:a05:6402:27cb:b0:423:d386:42be with SMTP id
 c11-20020a05640227cb00b00423d38642bemr24839191ede.227.1650980081504; 
 Tue, 26 Apr 2022 06:34:41 -0700 (PDT)
Received: from [192.168.0.251] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 lf5-20020a170907174500b006f3806fc9cdsm3416854ejc.39.2022.04.26.06.34.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 06:34:40 -0700 (PDT)
Message-ID: <b9d68100-c6f3-4f58-fe42-63f4cdf1dc50@linaro.org>
Date: Tue, 26 Apr 2022 15:34:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 06/11] dt-bindings: watchdog: Add HPE GXP Watchdog
 timer binding
Content-Language: en-US
To: "Hawkins, Nick" <nick.hawkins@hpe.com>, Rob Herring <robh@kernel.org>
References: <20220421192132.109954-1-nick.hawkins@hpe.com>
 <20220421192132.109954-7-nick.hawkins@hpe.com>
 <YmcbCgjD85lIRMSf@robh.at.kernel.org>
 <PH0PR84MB171845F606BC40AD653BEC8888FB9@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <PH0PR84MB171845F606BC40AD653BEC8888FB9@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 27 Apr 2022 08:48:57 +1000
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 "arnd@arndb.de" <arnd@arndb.de>, "Verdun, Jean-Marie" <verdun@hpe.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "joel@jms.id.au" <joel@jms.id.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 26/04/2022 15:21, Hawkins, Nick wrote:
>> How is this h/w controlled? I'm guessing it's part of the timer? If so, you don't need this node. A single node can implement multiple functions.
> 
> It is associated with the timer because of the shared register set. Based on feedback from Krzysztof I need to create a child node for gxp-timer. I therefore will remove this file and move gxp-wdt to the hpe,gxp-timer.yaml as a child node.

I have impression my feedback was about mapping entire address space,
not few registers of watchdog:
https://lore.kernel.org/all/c6309ed8-6e74-67d3-304a-f5399d16cc37@canonical.com/

However later during talks it turned out that the address space is
heavily shared.

Nick,
BTW, do you see my comments in the email I linked above? This v5 makes
the same mistake. We talked about this already, so please make note of
comments you receive and implement them.

Best regards,
Krzysztof
