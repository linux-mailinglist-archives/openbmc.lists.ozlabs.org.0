Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2647E50F660
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 10:58:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnbPx0WP2z309k
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 18:58:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=i6xnJ2DM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c32;
 helo=mail-oo1-xc32.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=i6xnJ2DM; dkim-atps=neutral
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KnbPS46wPz2xDY
 for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2022 18:57:47 +1000 (AEST)
Received: by mail-oo1-xc32.google.com with SMTP id
 s203-20020a4a3bd4000000b003191c2dcbe8so3261928oos.9
 for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2022 01:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:content-language:to
 :cc:references:from:subject:in-reply-to:content-transfer-encoding;
 bh=UhT8tbPEkvpYFqLjaGAxMfzwEgHtH4F74036X794IMc=;
 b=i6xnJ2DMMW5xtgdWwyfkVNppLp7Qcw1O39CirGWCOyUS/UTO546uWtkw6u9wd7aiOr
 Xo79ZtF7BKawklxyG3vn3MFV5K8id0J4iylYdd/AWDEA8ho06Lau8KiUR0laVoUoUedT
 4jdoGiOx9e8GYzF4EbX3NLsRLvxTeaVRt4mKb22Da4jN71VUMZzNTfUflI4t4E3oIaOe
 J1nfEoTjVaGb+U5Jim46ZnFABEXrtxHW8zkcjAy7Sg+id8nO748hVI9fggJ6n9Ju8n6R
 JaB6LFS1cgdXGVtZ6n/eyWfIJ2oIAzf/UEy58vD7L5fxm+97bh5JjkQqqI0qkt8/SSUZ
 /VxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=UhT8tbPEkvpYFqLjaGAxMfzwEgHtH4F74036X794IMc=;
 b=RAP1EIZt/0KMTkBL53Due/PzgX1/8ZOlEWPrgd3NCjV/hqpQOiR4XsYZTWqwBvlkHm
 seg3LHiB2qR6Jz3/zvUVqyJp2lG9aXMEVxJCL+fAirn82hMMb/C9FBezqKKzCJmCc5MI
 ElR6W1iLntZz9vLEBbe9N7nAgYjnvofW7JEVw3SRANIN2/m/xydZKSoL9IF5Fr/Gg+vH
 ZE4RHFJ7WmTfKXMpNhBFfFj+91KiQ7Sh0+/pmgNjY/GD8pcWWHnDeu0AjLCxOOV+R9Yq
 zZ4xyc1XT8+sx8k4kBQLFLlyNg6RNaZM9hmaKTQ6b5xpRsfXCTw/liWUl4HpDNY3+/NG
 Qs+w==
X-Gm-Message-State: AOAM532lDqVLez5t73q3mzVQbBbGMFQJWBihNJkRyRH9IHVw9ttqOj1v
 KVjTg5hyaz9Atf5g/XnpjBc=
X-Google-Smtp-Source: ABdhPJzdTEhc0aJvJhe8wZhMn2rau21VcIihwBPtigdjEX8ZOZx1tVt/1+Fnk/B7NmWKDI/nDq55dA==
X-Received: by 2002:a4a:e82b:0:b0:330:cee9:4a8a with SMTP id
 d11-20020a4ae82b000000b00330cee94a8amr7806331ood.31.1650963463816; 
 Tue, 26 Apr 2022 01:57:43 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a05683003c100b005c927b6e645sm4662921otc.20.2022.04.26.01.57.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 01:57:42 -0700 (PDT)
Message-ID: <dd522f49-89b6-14b2-c402-9cfc93b51d4b@roeck-us.net>
Date: Tue, 26 Apr 2022 01:57:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Zev Weiss <zev@bewilderbeest.net>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org
References: <20220426071848.11619-1-zev@bewilderbeest.net>
 <YmetYjSKFs+WWwYz@hatter.bewilderbeest.net>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v3 0/6] hwmon: (nct6775) Convert to regmap, add i2c support
In-Reply-To: <YmetYjSKFs+WWwYz@hatter.bewilderbeest.net>
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
Cc: devicetree@vger.kernel.org, webmaster@kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 Rob Herring <robh+dt@kernel.org>, Renze Nicolai <renze@rnplus.nl>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 4/26/22 01:29, Zev Weiss wrote:
> [Adding korg webmaster re: list infrastructure]
> 
> On Tue, Apr 26, 2022 at 12:18:42AM PDT, Zev Weiss wrote:
>> Hello,
>>
>> This is v3 of my effort to add i2c support to the nct6775 hwmon
>> driver.
>>
>> Changes since v2 [0]:
>> ...
>> - Renamed drivers and Kconfig symbols to keep existing platform
>>   driver as "nct6775" (SENSORS_NCT6775) and the core module as
>>   "nct6775-core" (SENSORS_NCT6775_CORE) [Guenter]
> 
> Unfortunately while this was a simple enough change to make (a few 'git mv' commands and a handful of actual text changes), it ballooned the size of the diff for patch 5 to the point that vger bounced it for exceeding the 100K message-size limit.  As far as I can tell it looks like it went through elsewhere, but does leave a bit of a gap in the public list archives -- please let me know if there's anything I should try in terms of re-sending it.  (The only combination of 'git format-patch' flags I've been able to find that gets it back down to approximately its previous size is '-B -D', which isn't so useful for actually applying.)
> 
> I'm not sure how critical a limit that 100K is, or if it's something we might consider raising a bit?
> 

You could split it up further. For example, you could introduce
the include file first. Also, please run checkpatch --strict on
your patches. I don't care about commenting the mutex, but there
should be no double empty lines. Also, while you are at it,
it would be great if you can add another patch to fix the

WARNING: Symbolic permissions 'S_IWUSR | S_IRUGO' are not preferred. Consider using octal permissions '0644'.

warnings.

Anyway, I wondered what changed... oh, I see. You didn't rename
nct6775.c. I didn't suggest that. The new file name was fine.
I only asked you to change the Kconfig symbols, not the file names.
It is ok and actually desirable to change the file names.
The platform driver module can and should still be named nct6775;
that can be handled in the Makefile with something like

nct6775-objs := nct6775-platform.o
obj-$(CONFIG_SENSORS_NCT6775)  += nct6775.o

Guenter
