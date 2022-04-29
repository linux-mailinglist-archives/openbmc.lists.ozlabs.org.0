Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 778395148FB
	for <lists+openbmc@lfdr.de>; Fri, 29 Apr 2022 14:16:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KqWg4335Cz3bhK
	for <lists+openbmc@lfdr.de>; Fri, 29 Apr 2022 22:16:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=r4vPB+6V;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62a;
 helo=mail-ej1-x62a.google.com; envelope-from=krzysztof.kozlowski@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=r4vPB+6V; dkim-atps=neutral
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KqMNy120Rz2ypZ
 for <openbmc@lists.ozlabs.org>; Fri, 29 Apr 2022 16:03:27 +1000 (AEST)
Received: by mail-ej1-x62a.google.com with SMTP id j6so13418413ejc.13
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2022 23:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2UVF1UzLTvXwjMuXjHk4vSsZBF8/xezWpjHU9KjaHyI=;
 b=r4vPB+6VJeu8RIvrpfY3kIQQQjSlQs/o0234SVjt6pPhaCqx793Kmv1nmXZui80rWZ
 Hg9w6CPZYYvkm0wlSZGRc9VZpOJYZU9CPuHml5XVyH3bP0giIoyYv+B0pEqYYnR7hrhP
 Hb3YvlURM4kmTr6LCPbYSbVV16PG7a4ZuLsw39Rh81MV9rEOYlTrHK9yDMzg+CNO8hRX
 XW992Ey9bFAZmHMC0+dgHuqAz4AVk9LLHU/BjBTf5/dIEF8ERi48fUEfVA26rfjRuA4R
 D/vDS+5uy/V5qGtCC84SzqifWrFWDdDLSeApuMBzpu5Lr6Oyf1cwHzL8MI0kV17sg7Oc
 eTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2UVF1UzLTvXwjMuXjHk4vSsZBF8/xezWpjHU9KjaHyI=;
 b=ENq+7MGCDaxNrJsN19Wx5lOSBeUJN2GqOs3X17U32mZhwdSsKE8gepZLiBVZ+7qC64
 DtkjE05prbJWMOiMSxYbdcQgBJfkG3u2H+pxQnpHPrSWd6W941891ZwQFdFK4h7meNP2
 9XJ5/NMg3Wkf+7nlIwvOy4WcsFxTzj/ER8ArSOIVuFQbRVvg3y4dK/T2Y9b4Zm+Cjyn7
 bfCoRU6g7SxYzz3PryMlQlhkfqErUt0Z1i9RFwYpjVxMASfmYlANtzCXN/uoB1nRdUXi
 Q+nZ6Ah2M0qh8a4wQlNjWdQO1x41DGJPJFVE/4BNM61f2M1ihvqmL05gpeIBOY+mz46T
 CN9w==
X-Gm-Message-State: AOAM5305hlVcuhiu6ylFQ+P0hccaIWlvliJeXvwdMse2ZY26Jgl2XOMR
 luC/wPK2JqivcrGO5xJshdDptw==
X-Google-Smtp-Source: ABdhPJzibkdFBoDF+cIhDOCqeeWmKmks/LjPu/SUPeRXPpTGCICXJ32FXdpt2PTlJmb2ApJRyQ4AYQ==
X-Received: by 2002:a17:906:9c82:b0:6e1:1d6c:914c with SMTP id
 fj2-20020a1709069c8200b006e11d6c914cmr33826027ejc.769.1651212200588; 
 Thu, 28 Apr 2022 23:03:20 -0700 (PDT)
Received: from [192.168.0.167] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 ra48-20020a17090769b000b006f3ef214e69sm318162ejc.207.2022.04.28.23.03.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 23:03:20 -0700 (PDT)
Message-ID: <064f5758-a3ae-d116-fe72-9f52b4cbea78@linaro.org>
Date: Fri, 29 Apr 2022 08:03:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/2] pinctrl: nuvoton: Fix irq_of_parse_and_map()
 return value
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>
References: <20220423094142.33013-1-krzysztof.kozlowski@linaro.org>
 <20220423094142.33013-2-krzysztof.kozlowski@linaro.org>
 <CACRpkdY8LJ5xMW0eDsL-ycrqV8io2zXJrT6RfZj=KxaE9rvcvA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CACRpkdY8LJ5xMW0eDsL-ycrqV8io2zXJrT6RfZj=KxaE9rvcvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>,
 linux-gpio@vger.kernel.org, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 Gregory Clement <gregory.clement@bootlin.com>, linux-kernel@vger.kernel.org,
 Tali Perry <tali.perry1@gmail.com>, Benjamin Fair <benjaminfair@google.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 29/04/2022 00:52, Linus Walleij wrote:
> On Sat, Apr 23, 2022 at 11:41 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> 
>> The irq_of_parse_and_map() returns 0 on failure, not a negative ERRNO.
>>
>> Fixes: 3b588e43ee5c ("pinctrl: nuvoton: add NPCM7xx pinctrl and GPIO driver")
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Changes since v1:
>> 1. Correct the return value passed further.
> 
> This doesn't apply to my tree neither for fixes or devel, can you rebase it?
> I'd like to queue it on devel for non-urgent fixes.

Sure, I will rebase. The issue was because of Andy's commit
https://lore.kernel.org/all/20220401103604.8705-9-andriy.shevchenko@linux.intel.com/
which was in next but not in your tree.

Including such development branches in next, bypassing maintainer, makes
it difficult for everyone else to develop patches... :(


Best regards,
Krzysztof
