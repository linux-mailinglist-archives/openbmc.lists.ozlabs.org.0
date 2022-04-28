Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A76F513EBD
	for <lists+openbmc@lfdr.de>; Fri, 29 Apr 2022 00:52:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kq9qr30wsz3bWR
	for <lists+openbmc@lfdr.de>; Fri, 29 Apr 2022 08:52:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=K8LxjAyN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1130;
 helo=mail-yw1-x1130.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=K8LxjAyN; dkim-atps=neutral
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kq9qR5rtfz2yZv
 for <openbmc@lists.ozlabs.org>; Fri, 29 Apr 2022 08:52:19 +1000 (AEST)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2f7d7e3b5bfso68709017b3.5
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2022 15:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MQSHZFFqhGqguDQeUrlptfLxAJDHurEMXXQM/r/YNSQ=;
 b=K8LxjAyNdmlx+j/JFYhP5xn+d2TBYZuQfYbT4W9wrwV1KjF0cgCv0pLnSTXUwT0RrQ
 s5//4tVmbHa/DX8wkSQvqzfYGp/mIzP1bR0cW2nKNPesHO73BT0UNy1AsrJb2z1cvGMZ
 eYlTehXFEX5AErk4IIcRFcV0ibH6OQp+FTbBpE28KIq1xY09zOvKHUhrDMjoEHLwZCjT
 O8Nt+yYAZ6bPWW/fi3WFI0HoysWb7Mdz4Rxy+WyrPOhGvr7vqNRBWvm4d/x3r+izMvdN
 9G8eFDC4xliZuz/wHY4BXIsdEI3kyCWMuoLBY9PiXgOmfPH/6kUwBimsqaHmxzlLO3+q
 LSHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MQSHZFFqhGqguDQeUrlptfLxAJDHurEMXXQM/r/YNSQ=;
 b=4q6ZUBNfHSxUODFYW18d2JZD45Eg4ekBCMf3Sfe0DSisAU2nosBDlyEABa9egP8E48
 2Sv8AI1kLEqgdxxhaomEOpJTcBNgfkWIRFw20DV0UX8B0mQitZg+Z1cji+Ss6Ht52FqY
 qD168FoYHmT9Nhe6p0G4HyJFogp8Bo2mrIf868woZ1hEBpav+F3V5MFtu1vuSuqzK9A5
 iYis8KUoRNOTASd+T1hH/wWAx/E+v2Hv2p+m+XBZ2Pg3EEVgF0VKx2HEND8d0JGY28Bq
 cJ15PtzY8s68kg8yGGeEazFO4lWhi/kS4EoDehICOGWKIbWPFmsBr+DZjgNxhuCbMvX6
 2A4w==
X-Gm-Message-State: AOAM5320gUvK8axvO929Ki5WZ4pPVmemNiUBNUR3cXrbeiv3h4/owq5s
 uYgBoEZB4uTT2i8NjWXQS+Ehd0xhd9EoQ1gaoEHlbw==
X-Google-Smtp-Source: ABdhPJxeLmDpTaMNXY7Wqn0ZY0oHf2i3kitPQek08DWmM8V77lMeD1uVkcuL3axOpiMHKUg2pGTgK4SigJXtFUWHXtQ=
X-Received: by 2002:a81:2154:0:b0:2f4:d79e:35dc with SMTP id
 h81-20020a812154000000b002f4d79e35dcmr35566381ywh.126.1651186335816; Thu, 28
 Apr 2022 15:52:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220423094142.33013-1-krzysztof.kozlowski@linaro.org>
 <20220423094142.33013-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220423094142.33013-2-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 29 Apr 2022 00:52:04 +0200
Message-ID: <CACRpkdY8LJ5xMW0eDsL-ycrqV8io2zXJrT6RfZj=KxaE9rvcvA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: nuvoton: Fix irq_of_parse_and_map()
 return value
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
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>,
 linux-gpio@vger.kernel.org, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 Gregory Clement <gregory.clement@bootlin.com>, linux-kernel@vger.kernel.org,
 Tali Perry <tali.perry1@gmail.com>, Benjamin Fair <benjaminfair@google.com>,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, Apr 23, 2022 at 11:41 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The irq_of_parse_and_map() returns 0 on failure, not a negative ERRNO.
>
> Fixes: 3b588e43ee5c ("pinctrl: nuvoton: add NPCM7xx pinctrl and GPIO driver")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Changes since v1:
> 1. Correct the return value passed further.

This doesn't apply to my tree neither for fixes or devel, can you rebase it?
I'd like to queue it on devel for non-urgent fixes.

Yours,
Linus Walleij
