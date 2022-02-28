Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0144C7711
	for <lists+openbmc@lfdr.de>; Mon, 28 Feb 2022 19:10:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6pN01SG5z3bZR
	for <lists+openbmc@lfdr.de>; Tue,  1 Mar 2022 05:10:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hO9hm+T3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22b;
 helo=mail-oi1-x22b.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=hO9hm+T3; dkim-atps=neutral
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6pMX2Blfz30QX
 for <openbmc@lists.ozlabs.org>; Tue,  1 Mar 2022 05:10:30 +1100 (AEDT)
Received: by mail-oi1-x22b.google.com with SMTP id j2so13943642oie.7
 for <openbmc@lists.ozlabs.org>; Mon, 28 Feb 2022 10:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7wQWrntmzj+Iyb2AkW1h0mbOWmxT1sYGcUG1qHtruzA=;
 b=hO9hm+T3VPBeUPH7RQD/Y0rI1IKC/jJ2dA97Y/k0Edaujb0hG+dz7Suf8AtSqBJdzN
 N0wpwz906k2hpLIL5b5sVa2R2MhQOh0tUIgjHy0JwiLPevs2xVo4LSbHZlnxVKeEqYGe
 DYKGhs05u+MNlJD+T9pLdl696AxwN9ArskJ/BOuw5GpObFdJaNd9ujzVRVvRu+KuOIwE
 WMk/0F+oZeBhyvAC/cgxTum/6Nu9+SMFHLfUxW/v5j8dDrIGrZfksvHdwp73OFlW917l
 59wqgfvaPTX79smzDIyXotarX6JpDcXANBPNxruKstDgzV8PcNW6EgU9A+T3PEuuB6lj
 W/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7wQWrntmzj+Iyb2AkW1h0mbOWmxT1sYGcUG1qHtruzA=;
 b=mjUl1xVRP4Zj/N+dY/wqzZvmW2fYb4+39Mpu6rhiAwccMux+5GeHp8GsR2KdnnKt+N
 s5ctOdfCHKreAUlG0SGcSWrglysPrKpNjXx1fODADK+OeY4v0UGN/cOFI3+4CCXyA/qi
 g8MQlv58qllqQkBDAXmHG4cDGpiSgFr89eGykpArum+WV3Z6h+Grpd3zrI7xRP15nzFG
 2/fUhmCs5lqxaRl8edW8M9Y/auzbrWOFHUvMRzxhvbEcfa9Da/b7e7GNeFS9HkiOdR7Z
 TlVC84nua/lrjxWz6Hi0mnmgOCZ74Qt15Ee0pCJjcHZ3i9FHwccbHILSGGwsS5ruJglf
 7WAQ==
X-Gm-Message-State: AOAM530ezJgr/HiaYlMgD4LArQtBpMeF9Fp6sHZQNI2f2110l9bO5BMA
 +SJa8wsSR+8AjkDCqpkbWtU=
X-Google-Smtp-Source: ABdhPJyiXkfCIS04W7ZFPsOkY+JzUPJmnYpp09LkpTS7tVVjk6qnJNOcCg/oLMt6gMfJG0uAnknBKA==
X-Received: by 2002:a54:4f1c:0:b0:2d0:6df2:808e with SMTP id
 e28-20020a544f1c000000b002d06df2808emr11795057oiy.67.1646071826308; 
 Mon, 28 Feb 2022 10:10:26 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a0568080f1100b002d71e151e51sm6553576oiw.0.2022.02.28.10.10.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 10:10:25 -0800 (PST)
Message-ID: <9edce888-8e7c-9c97-dc70-17df7f348832@roeck-us.net>
Date: Mon, 28 Feb 2022 10:10:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 0/2] ic2: mux: pca9541: add delayed-release support
Content-Language: en-US
To: Zev Weiss <zev@bewilderbeest.net>
References: <20220201001810.19516-1-zev@bewilderbeest.net>
 <YhyLIRFbs226KTwA@hatter.bewilderbeest.net>
 <fbb305e3-73b3-7a2d-99cf-a7205b7344ff@roeck-us.net>
 <Yh0CUzBzGJc4zyTR@hatter.bewilderbeest.net>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <Yh0CUzBzGJc4zyTR@hatter.bewilderbeest.net>
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
 Peter Rosin <peda@axentia.se>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2/28/22 09:11, Zev Weiss wrote:
> On Mon, Feb 28, 2022 at 05:57:27AM PST, Guenter Roeck wrote:
>> On 2/28/22 00:43, Zev Weiss wrote:
>>> On Mon, Jan 31, 2022 at 04:18:08PM PST, Zev Weiss wrote:
>>>> Hello,
>>>>
>>>> This series adds support for a new pca9541 device-tree property
>>>> ("release-delay-us"), which delays releasing ownership of the bus
>>>> after a transaction for a configurable duration, anticipating that
>>>> another transaction may follow shortly.  By avoiding a
>>>> release/reacquisition between transactions, this can provide a
>>>> substantial performance improvement for back-to-back operations -- on
>>>> a Delta AHE-50DC (ASPEED AST1250) system running OpenBMC with dozens
>>>> of LM25066 PMICs on PCA9541-arbitrated busses, a setting of 10000 (10
>>>> ms) reduces the median latency the psusensor daemon's hwmon sysfs file
>>>> reads from 2.28 ms to 0.99 ms (a 57% improvement).
>>>>
>>>
>>> Ping...Guenter, any thoughts on this?
>>>
>>
>> It sounds reasonable to me, but I don't have access to hardware anymore
>> to test it, so I have no means to confirm that it actually works.
>>
> 
> Ack, thanks.  In that case, what's the path forward on getting changes to this driver merged?  I see sign-offs from Wolfram and Peter on the last few commits that touched it -- any input from the i2c/i2c-mux maintainers?
> 

The i2c/i2c-mux maintainers will need to accept it, and you'll need
approval for the DT changes from a DT maintainer (presumably Rob).

Guenter
