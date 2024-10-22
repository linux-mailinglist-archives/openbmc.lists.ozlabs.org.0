Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B4B9AB1C9
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2024 17:14:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XXwh46gnXz3c4r
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2024 02:14:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729610066;
	cv=none; b=cwBNcmND0moU//haDZAxa67E9mTcs/mDjZ0t+UQSs1zXwxFqTZUpYUG6cqVVpL41MExUFipDUKl9KIPQS5DFrkt1mUAbJvLQ7xcoxFyDgDabzZoog4m3QnOv4JLu8rqNTooO1qUNjlN/J4ExwsGnEUzGbxiNQgHSWgHuVpWrBQkI8klZM76DrJZmEQfmY5hFZJMxIXZEYFhuxIgeKXgd/Sf8uV1ZXw6CoIfaFi37X4TRyP0ZcOWNSg/Q/qz4mXzL8iYb86Oew3cRa/uf9kuvDZy3Om/PiTUjPjaOq9SOn0r7E1AKaulaw+3rHFAyI+dhUyiF90t/Ywlg0sBeIko7Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729610066; c=relaxed/relaxed;
	bh=NW/rEIqVYk20Bagh13hOd3nJbOnRwuYybRFg+LGZWqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZQfGgQQbniQoiJxZ6/osZmZG4wZ1QRn8T0CeBGje/VT56RIDOrTFhglCNcHbzC3D+eRwhDQo0U+D4J6X75kDU4uoRsejtDylEMouJpmrIIuTxsHCAisBx/0BN9t+i4UeNzwWLMY+lAc7k0xnlQj9zimWNJSleaV2kc+/645TirK2nMQokbQ67NwzmhgXbwH1H3WIHu3ZF+Y2Rk/0Y4LP6pfs4uRXmeUTTmgxa7fiS3FCNGI4QxVtr6SiaBBRMYN1NVSzMYYUvCUuhcygRWWuPLuEks9WO75w4O5G+dPUeD98zZF87iLHSuwbA0SmFOE90PGUzwpYJ7JLFjXZI8LgJQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HX3lRX3e; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HX3lRX3e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XXwgz6pxmz2xY0
	for <openbmc@lists.ozlabs.org>; Wed, 23 Oct 2024 02:14:23 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-7ead1edbf1dso2435386a12.0
        for <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2024 08:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729610059; x=1730214859; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=NW/rEIqVYk20Bagh13hOd3nJbOnRwuYybRFg+LGZWqs=;
        b=HX3lRX3e9LMXKshhi4wGdxw4T4R+YL1Yb18TJcaSVrgb/bzFpWoU2gJUj0A7lZj63Z
         OThY41p8wWJ8yISYI1mJfjVZ24mbDR5Dr1SeXeE+dEf9VMMmYdchwrj9qQPLimmYHv/z
         gNnpDKGJycrt1ExwMlYvobBRaX/Lm9JthkMDUfdE9Frm0nyQW1OJKtN8plXEqpUuKvJl
         /9f+9pSBJIWnP8u5FFbJGq97WeArzEa18xAOZiJHbycpLllDXI/qXph8jiRp//OMSTQz
         XKYy7Hm1cJGyz2YWi3W8GDgY8fQGPd9vZ/B6/NNYvPTsmP8i4KMHuxQ0GEhTiIDrhDp4
         ctOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729610059; x=1730214859;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NW/rEIqVYk20Bagh13hOd3nJbOnRwuYybRFg+LGZWqs=;
        b=wGuzwWjIjVfCOLXj+sQsg93CrUoi75At+GJ9LnNE0zhIrgvn3L9sEMecuZ3hD54IKV
         Lrn+UP5WF9g4smAqb6cXMGrSffyFZtO377gHNg7O+4L/OjqcNGapF+dpuEG3ffW8CE1z
         4//izA/tZNyU6ALD+L9Hhnm5QbpDhGZeay7qkuwF3iJZe/IHGCVS4lIM6+suK3evNncX
         TO5pfnORjBBHAQbI6jB1PRG8qN2XXuESZt9IqV19TUax2/PCWRnUlJ14Pi0XYF8BGT8z
         io9b0i6grwPvq+tLCOeFOvOGIPUpmpPhgM8G48lY/HQixtqSM3n3CmfkHpTdIgzRpBIA
         7BPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUbTOBb9NoH/Vm7hrsEdkJsvAqLSSgN2GEBE2ebn5ty9DDBejVY2v9lsdaoLDTtQGo69HcdwfO@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywl/3uI8xIJJXdukX4dHdLylokWrvDqGrLwHpEfeOwn7OCyyESK
	3f+r9U+wOujl3Zsc1dfW6G/csUgM4jcT5jatqO3GQnHzP05XGWFp
X-Google-Smtp-Source: AGHT+IEyly+eku+lEevkwvNw0Dq8/4qrGbtFxG7XfkvLcDDrgen1PINyCP0GLvsiXBtPJMqUnrWhSw==
X-Received: by 2002:a17:90b:4c12:b0:2e2:ffb0:89f6 with SMTP id 98e67ed59e1d1-2e5ddb7018amr3032961a91.15.1729610058716;
        Tue, 22 Oct 2024 08:14:18 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad25cb0asm6329691a91.10.2024.10.22.08.14.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 08:14:18 -0700 (PDT)
Message-ID: <f6846ac5-55ee-405c-939b-1199ea362fb5@roeck-us.net>
Date: Tue, 22 Oct 2024 08:14:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] hwmon: Add driver for I2C chip Nuvoton NCT7363Y
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, baneric926@gmail.com,
 jdelvare@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, corbet@lwn.net
References: <20241022052905.4062682-1-kcfeng0@nuvoton.com>
 <20241022052905.4062682-3-kcfeng0@nuvoton.com>
 <2339841b-034b-440f-83ac-139d95059727@wanadoo.fr>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <2339841b-034b-440f-83ac-139d95059727@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, kcfeng0@nuvoton.com, kwliu@nuvoton.com, openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, DELPHINE_CHIU@wiwynn.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/22/24 00:20, Christophe JAILLET wrote:
[ ... ]
>> +    hwmon_dev =
>> +        devm_hwmon_device_register_with_info(dev, client->name, data,
>> +                             &nct7363_chip_info, NULL);
> 
> return devm_hwmon_device_register_with_info()?
> 

No, because the function needs to return an integer, not a pointer.
And
	return PTR_ERR_OR_ZERO(devm_hwmon_device_register_with_info(...));
would look a bit awkward.

Guenter

