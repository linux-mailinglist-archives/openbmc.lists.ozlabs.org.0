Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0BA511869
	for <lists+openbmc@lfdr.de>; Wed, 27 Apr 2022 15:37:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpKYt1r2Mz3bd5
	for <lists+openbmc@lfdr.de>; Wed, 27 Apr 2022 23:37:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SUsmhZGs;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22e;
 helo=mail-oi1-x22e.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=SUsmhZGs; dkim-atps=neutral
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpKYV0LRgz2ynr
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2022 23:37:16 +1000 (AEST)
Received: by mail-oi1-x22e.google.com with SMTP id m11so1943408oib.11
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2022 06:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yhF0G6yyXaul33YQtZP9cS7G8SlHQ9Le2XaQbFcTYvo=;
 b=SUsmhZGs20++DaCxL7upzoXkA2Dm33XtRqXivIfkZODlAT7QE/Jk/BvTcWT5lLt3/k
 3TTrDFXoFkdEXyJeApS3tp7MxGMnTq0fL1DWsA+oNzXuQ1jQsD4IHzLGxh9NXRe1pxmN
 p9NjQJ6LMjrVwVYPxHC6dKs+bb92+jw9o07tNRh97ma9VtjU5yky3hEpOC5+wGlFNPTT
 g+rI/d+gPXCE+omJagi+o499emwmzpA2273FxrTp91JnXnXIc+dvAhRwurudHiZY3eeY
 dZ+L6FeAUT0b0B/MfTQ4IIRbTcuCYyxtiDlTlnlNgDcN4HjEIE6en8Ij7V0wEBTKJSM2
 GYcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yhF0G6yyXaul33YQtZP9cS7G8SlHQ9Le2XaQbFcTYvo=;
 b=RiIaYfBrHPG8TA1+11jhzVl6wigQZBaI9rx6jrwEuoylDbJY57MrWWV8rxfV0841PW
 xfXGi161NX8h3B5pqXKSwse/NhubVGgxWrwTLWah2k7/o3/c+zturA3s4fWG/HRjLVNW
 gJajfo6lk5RSHOZ/e7j5vVD1x12BS6eP6f/fQ3MGq5SvAn3gdpcnd/mmi0O5ppF39Yqm
 ixE1sOe1zAgVSG8U3AIPdeupnziPrW1f/qC3Qs260aQafAP9aBDvsk8kki5U43mdO/f4
 ayezRVT3FhvRcnQ9L457WhPOFSO06N0ogsI3C6d6sgY31qwcA3J1sjKQrocC+nCOSRqM
 dqgw==
X-Gm-Message-State: AOAM532FAN/TTodT6vMpjqmavLn/aKW7tfAF/02d7Y0BGRSoO0MeuUzL
 zBieAYGHalFT1e2ToJ2I7qM=
X-Google-Smtp-Source: ABdhPJz2pYe9wnusQC+BCwMLIw1YI1xV8X7qaYNnP2DtrkYyQC4A+AQu40ZHbQRlz8+Z77qeysc4Gw==
X-Received: by 2002:a05:6808:2209:b0:322:bbb4:4572 with SMTP id
 bd9-20020a056808220900b00322bbb44572mr17131157oib.182.1651066633500; 
 Wed, 27 Apr 2022 06:37:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a4ab3cd000000b0032830efe365sm6661469ooo.43.2022.04.27.06.37.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 06:37:11 -0700 (PDT)
Message-ID: <bc46d60e-7c89-ad05-780c-9e9fd19f788e@roeck-us.net>
Date: Wed, 27 Apr 2022 06:37:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 0/7] hwmon: (nct6775) Convert to regmap, add i2c support
Content-Language: en-US
To: Zev Weiss <zev@bewilderbeest.net>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org
References: <20220427010154.29749-1-zev@bewilderbeest.net>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220427010154.29749-1-zev@bewilderbeest.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 Rob Herring <robh+dt@kernel.org>, Renze Nicolai <renze@rnplus.nl>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Zev,

On 4/26/22 18:01, Zev Weiss wrote:
> Hello,
> 
> This is v4 of my effort to add i2c support to the nct6775 hwmon
> driver.
> 

Thanks a lot for your effort.

I applied patches 2..6 to hwmon-next. The first and the last
patch of the series will have to wait for DT maintainer approval.

Thanks,
Guenter
