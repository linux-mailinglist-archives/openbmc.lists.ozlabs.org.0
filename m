Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 030C17AA7B8
	for <lists+openbmc@lfdr.de>; Fri, 22 Sep 2023 06:25:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SVowWRm0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsK1r26cbz3cNT
	for <lists+openbmc@lfdr.de>; Fri, 22 Sep 2023 14:25:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SVowWRm0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsK1C0sHRz3c2k;
	Fri, 22 Sep 2023 14:24:45 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-276b9d5ce1dso1154949a91.3;
        Thu, 21 Sep 2023 21:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695356683; x=1695961483; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=UANZyGmjU/rf/hK8ONbL0wqx5cYEjVcGLbn13RAx4hk=;
        b=SVowWRm0RpJO/5zWfyUAiVJkHp9yzFdd5IuuohfgZH0UM/TgKrHHoPZmnX2lzQVZ6k
         8moAz4jQvyHMXvN72tKqzBV88dmIXU5rN/S4n7NzDdZCy7nvYSrmor6UbUO82hUdQwvo
         olZC2UT/NjJgb84eUuv61XTiY6PSHxobEqzqnVr72elN5udNpkblJucbQzC6wvYegBGu
         Q3Ry33i4Y7qpsZBq/Sn4CQOVIBNZHEVZ56NtftINn8GQeKR13spZxqxr8zQ1lFHUvgjy
         vHg1k7SEIREEVCDvDjC0IQQngdtNnpFfoql2xOzpYwtYPlAB/kTP7W2SkFqZ3vFSqi3w
         oMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695356683; x=1695961483;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UANZyGmjU/rf/hK8ONbL0wqx5cYEjVcGLbn13RAx4hk=;
        b=gcaM0btsQtCABvav0diKi7hrNVOTsMCly7n3o0IFq8Yuc9RFBYQ723k8gkT72ltexH
         pNPvntulfY2RMOnVZRh6Hmh9srxMHnouEG1h6i/jPacFmW3BC4zTv9rYfMrSX8//AVZn
         HfisRYQ+ntnId0Sn/Au6AOcJkuFvXDzLZKI/FwRl6k4GLkIxUzNA0AmltOMAk0fwT/Q2
         OCQLMj5h+jLYaJnhP21ov0Wovzgkblrin8/RXXas2TXa22c+vrn2/0WH85XXxWdJygGD
         w9u1cN0gJATzyHEwBDW2fsynI8uau+Lad8uIe0OJhW0hKgZtvtFgCR1y3kFNKAOUUnpG
         t6jg==
X-Gm-Message-State: AOJu0Yw/0X0JevhaKvBN/3//Txl06kQMSJdW6uAy8cyN+lagTdoOwizt
	OIXzX9EpjVF6OsIfIlWvjKk=
X-Google-Smtp-Source: AGHT+IFLeYl/hqcN1av+CN9Hovwsh2LyVNxwX5EzZ0iQs3U418VrmAdETV2vUyQd9SJIl2aRIw9yqg==
X-Received: by 2002:a17:90a:dc0f:b0:274:84f3:d73a with SMTP id i15-20020a17090adc0f00b0027484f3d73amr7685324pjv.28.1695356682746;
        Thu, 21 Sep 2023 21:24:42 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t4-20020a17090ae50400b0026f39c90111sm2290286pjy.20.2023.09.21.21.24.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Sep 2023 21:24:42 -0700 (PDT)
Message-ID: <85ddf493-934f-75c4-7a3a-728289c1ee09@roeck-us.net>
Date: Thu, 21 Sep 2023 21:24:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] watchdog: aspeed: Add sysfs attributes for reset mask
 bits
Content-Language: en-US
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Zev Weiss <zev@bewilderbeest.net>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
References: <20230922013542.29136-2-zev@bewilderbeest.net>
 <91be26169ebbddf3c05cd19626478246cb72a72a.camel@codeconstruct.com.au>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <91be26169ebbddf3c05cd19626478246cb72a72a.camel@codeconstruct.com.au>
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
Cc: linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>, =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>, linux-kernel@vger.kernel.org, Ivan Mikhaylov <i.mikhaylov@yadro.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 9/21/23 21:16, Andrew Jeffery wrote:
> On Thu, 2023-09-21 at 18:35 -0700, Zev Weiss wrote:
>> The AST2500 and AST2600 watchdog timers provide the ability to control
>> which devices are reset by the watchdog timer via a reset mask
>> resgister.  Previously the driver ignored that register, leaving
>> whatever configuration it found at boot and offering no way of
>> altering its settings.  Add a 'reset_ctrl' sysfs subdirectory with a
>> file per bit so that userspace can determine which devices the reset
>> is applied to.
>>
>> Note that not all bits in the hardware register are exposed -- in
>> particular, the ARM CPU and SOC/misc reset bits are left hidden since
>> clearing them can render the system unable to reboot.
>>
>> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>> ---
>>
>> I'm porting OpenBMC to a platform that requires that the LPC controller remain
>> un-reset by a BMC reboot.  With this patch userspace can control the reset
>> mask of the Aspeed watchdog timer, with a few bits remaining unexposed so as
>> to prevent some almost-certainly undesirable situations.  If there are other
>> bits that people feel shouldn't be exposed (or conversely if someone feels
>> strongly that the "dangerous" bits _should_ be exposed) I can adjust
>> accordingly.
> 
> 
> Is there a reason this has to be managed by userspace? It sounds a lot
> like a property of platform design, in which case exposing this feature
> in the devicetree might be a better approach.
> 

Same sentiment here.

Guenter


