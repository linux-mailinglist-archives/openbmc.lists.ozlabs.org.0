Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E41046B4F3
	for <lists+openbmc@lfdr.de>; Tue,  7 Dec 2021 08:58:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7Xjk0MHMz3bj1
	for <lists+openbmc@lfdr.de>; Tue,  7 Dec 2021 18:58:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.208.172;
 helo=mail-lj1-f172.google.com; envelope-from=k.kozlowski.k@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7XjT2j9Gz2xB1
 for <openbmc@lists.ozlabs.org>; Tue,  7 Dec 2021 18:58:20 +1100 (AEDT)
Received: by mail-lj1-f172.google.com with SMTP id l7so25889091lja.2
 for <openbmc@lists.ozlabs.org>; Mon, 06 Dec 2021 23:58:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PqqmL5JIKPAasL4UGzmoMf6bSek2Vm/kZLmu62cP2bU=;
 b=ktOUxC+ytyBj30BxBXrCrAgMbwOdn9bM1UThOVz3bYN4MTT5XEbvnfMoKQIXW8YRL/
 vaoGQBjhAmAkzjilUHpeuiMsjVLzSfjuk2pYilo1Cs0jn0day6rASFNo+VFnIJoFUUY6
 iP3bVTnlOvFHAHkvhZc1/phAiWmSz8C54xvm1zXuyGIoxVhUZtpnkBF5XgRBL44/OS6a
 hjzNzbrJowXNBGpO067q3XL/Msr+UbFiCNLh/nfMbJCwCGtheow0ygWdmmGzfgQ/2706
 VTF4yUiZt3wVHPUqwzp+ClqQe1Nd0KxnMWqK7iWMi32hOtWTEUGxzSrhYTq5hBot9ePg
 7bGQ==
X-Gm-Message-State: AOAM530vSwEEo0V6EY2kb06FhiNK1LGJQ9gZxFo6uluEaUussgvOXdTx
 MuKUmvkw4EXVejaTJslDIQc=
X-Google-Smtp-Source: ABdhPJwHA8X1ZsMu+rN78A9VZ7MQ1tTslA/UTtTNWlLfjgFKD0FM6W6Jb6S/TJEcgFM+4f38L6tBxQ==
X-Received: by 2002:a2e:84c4:: with SMTP id q4mr40356345ljh.266.1638863896657; 
 Mon, 06 Dec 2021 23:58:16 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.googlemail.com with ESMTPSA id
 f19sm1595702lfm.119.2021.12.06.23.58.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Dec 2021 23:58:15 -0800 (PST)
Message-ID: <498caafa-fdc5-eb5a-312f-13968a088448@kernel.org>
Date: Tue, 7 Dec 2021 08:58:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v3 2/2] dt-bindings: add Delta AHE-50DC fan control module
Content-Language: en-US
To: Zev Weiss <zev@bewilderbeest.net>, linux-hwmon@vger.kernel.org
References: <20211207071521.543-1-zev@bewilderbeest.net>
 <20211207071521.543-3-zev@bewilderbeest.net>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20211207071521.543-3-zev@bewilderbeest.net>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jean Delvare <jdelvare@suse.com>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 07/12/2021 08:15, Zev Weiss wrote:
> This is the integrated fan control module of the Delta AHE-50DC Open19
> power shelf.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)

This is a third version sent within one night, without changelog and any
indication why sending the same three times. Please do not send multiple
versions the same day and give people some time to respond. When
creating a new version, add a changelog under ---.

> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index 791079021f1b..1c43cc91f804 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -73,6 +73,8 @@ properties:
>            - dallas,ds4510
>              # Digital Thermometer and Thermostat
>            - dallas,ds75
> +            # Delta AHE-50DC Open19 power shelf fan control module
> +          - delta,ahe50dc-fan
>              # Delta Electronics DPS-650-AB power supply
>            - delta,dps650ab
>            # Delta Electronics DPS920AB 920W 54V Power Supply
> 


Best regards,
Krzysztof
