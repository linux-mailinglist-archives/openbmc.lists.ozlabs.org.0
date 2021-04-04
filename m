Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4F73539BB
	for <lists+openbmc@lfdr.de>; Sun,  4 Apr 2021 22:29:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FD53Z367wz30Ds
	for <lists+openbmc@lfdr.de>; Mon,  5 Apr 2021 06:28:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NWlntXXj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::334;
 helo=mail-wm1-x334.google.com; envelope-from=daniel.lezcano@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=NWlntXXj; dkim-atps=neutral
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FD53K5XnYz2xb5
 for <openbmc@lists.ozlabs.org>; Mon,  5 Apr 2021 06:28:42 +1000 (AEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5-20020a05600c0245b029011a8273f85eso607349wmj.1
 for <openbmc@lists.ozlabs.org>; Sun, 04 Apr 2021 13:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=p4Z+wpe/vlKTP8y/0b+d0+U+PvDT/FlgjYt5lTllbW4=;
 b=NWlntXXj0Z1wwNIlEqKpTd+qYBTsIkNjs+EELfp9hGpc3vKDTi0VLBCsZfeGileN53
 cwgNJ6P1EXl1kXYhCinsy8dI3ocFgYwrz+KJmWB2ROn041jIYe15UnfLuyf8NXr/Oe98
 7oIDHCOTfYeeXJCEK7+HEcQWLBEQqW1ie76EblqdwLwPGPaO/cUd+OkXpg1hxMKcD3SF
 i2X0P1KSxWv53mU/jQFPmlB/lTfH694GSLTc5lCvu3KLOroGQ/9qi/zCO5eu6+6lrdTz
 ww2ZC3fOc7I25sBX+K+e8SarGHkNb1OMthUEqjQlVZsILILcPpCVJndCGGFQ+ywb4Jxu
 GqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p4Z+wpe/vlKTP8y/0b+d0+U+PvDT/FlgjYt5lTllbW4=;
 b=t0+qx0NWqrAPhsRRjE8UGiNw32/oyhR4A+xKo6E25t+YsVu73ETQgxukUzvRNoga8q
 jC7ygmCnZrpzRZiHO/je9tPcwDt/CtA60KATNUmKrhjYV0/YsuhY/oDn+XqajPKBxbGf
 AUyeTBKjGH4SZuOwBsD9FD9FUV5frNp2fsqPIUZ0Cnfm3n7uJdfq1taj6qFHMwWILTRm
 c3Pibe87f5EA6zyVjM8C+i9lIVJ/hHASCf1OPk2ZPlwmTAXAskTr/yO8f2xPhxMwLfuD
 fIR3vmpUbNECa8LD1RscnO0uPqtkfAaEJWAt/vGCCqGOvKgb3igQB3tRmySw6X4I4tbJ
 RfgA==
X-Gm-Message-State: AOAM530kwYT28kQJ802OpDQYBcoT2B8wEJUoQAdzixKFoopndD4mQtIM
 QFjOtBHOGUTNN4gKG1NfGHq7jA==
X-Google-Smtp-Source: ABdhPJzyhdDpLRNsqZ9OZoNfAvSvJhyGUY7UxDjuu2c41Xlv9nxAeDBSy8Bq2XWJNBulCTrYeu6eDA==
X-Received: by 2002:a05:600c:4fc8:: with SMTP id
 o8mr12314827wmq.87.1617568114719; 
 Sun, 04 Apr 2021 13:28:34 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:6d68:6b9a:7a3c:4a9f?
 ([2a01:e34:ed2f:f020:6d68:6b9a:7a3c:4a9f])
 by smtp.googlemail.com with ESMTPSA id f7sm19957499wmq.11.2021.04.04.13.28.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Apr 2021 13:28:34 -0700 (PDT)
Subject: Re: [PATCH 05/14] dt-bindings: timer: nuvoton,npcm7xx: Add
 wpcm450-timer
To: =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 openbmc@lists.ozlabs.org
References: <20210320181610.680870-1-j.neuschaefer@gmx.net>
 <20210320181610.680870-6-j.neuschaefer@gmx.net>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <623f26fa-38f3-c7fc-a857-126d93a0e886@linaro.org>
Date: Sun, 4 Apr 2021 22:28:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210320181610.680870-6-j.neuschaefer@gmx.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 20/03/2021 19:16, Jonathan Neuschäfer wrote:
> Add a compatible string for WPCM450, which has essentially the same
> timer controller.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
