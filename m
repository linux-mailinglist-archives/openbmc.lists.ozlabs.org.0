Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 886FD5176BA
	for <lists+openbmc@lfdr.de>; Mon,  2 May 2022 20:42:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KsX5h3HWQz3bbL
	for <lists+openbmc@lfdr.de>; Tue,  3 May 2022 04:42:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fXR8EUyb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::335;
 helo=mail-ot1-x335.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=fXR8EUyb; dkim-atps=neutral
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KsX5H22HYz2yg5
 for <openbmc@lists.ozlabs.org>; Tue,  3 May 2022 04:42:25 +1000 (AEST)
Received: by mail-ot1-x335.google.com with SMTP id
 88-20020a9d0ee1000000b005d0ae4e126fso10281685otj.5
 for <openbmc@lists.ozlabs.org>; Mon, 02 May 2022 11:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Cqi4vVQXIGfU3Kpez4pWPIJIfa1e4al0TZHE0imlKf0=;
 b=fXR8EUyboyQqVeqFyOtKKt+k0Z1M2EeOUFZaBAD/57OxHi8cEI+gMuO0SrKXdp84LG
 Yc2bJdlCuFA7k2HCZtNzujh3KQi+EH9UHmbpobhpHQgGoFCxO/G6XTWlSJ03cOLfv6Mn
 qxKP+9rjp2Yx4G/g5esHSy6f48ngZ6eaeq0uqHmRtemLmdM2g8JA8TWsVSXyaL1NxnEE
 a278nr9geQBDlX7F3rEo4HAWinKUs/McYgv+NBID5bFAJNldS933Ctvo25Fc/l+yco+p
 P1YHmmWFoO3FOVP7fh+Ly82QHan/ACgsTLJURXUavc+DkD+VFiUqVHjHkjP0m1iQKnjt
 C0Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Cqi4vVQXIGfU3Kpez4pWPIJIfa1e4al0TZHE0imlKf0=;
 b=Lu1KjcDX2cG8Rq/oindBDf4mnwboo2bPL82s3MuTq6Q0jmqvPB65+s/PtRDuKdsvOc
 yPc2jThUvjCF0l2GrBzUG5Du11C0Nf/68XglcNqmpBKgne1Xhk8VPtYpT1wmwWyhIYur
 gapnErbavrgGL8U26uCm6d1/MPXitlPbUrb6FeqQhJTHcz8OvI5OrxyCCn3A0bYVNFp8
 G5JyWXXgtgUo3BrXMshvhnq5C1MyySoxGyxbF0FVtr5f2lD8OgYZ88k0B0AlAtIwwyjr
 Q1xt4wc17YIFrrfp1ntsNnnSCWFd8M8yxi1sKGkdQ4DmoktYer0YLEgDzHTyvBEjru+6
 efdg==
X-Gm-Message-State: AOAM531ROO8HD47iTaewQWyI+ncauonFdBcZTLyLF2mZ005sSl1oasna
 2/ZP1NvpJNz5klMu869RoPY=
X-Google-Smtp-Source: ABdhPJxjR+hx+ESAS7kWYZHR2d0osRzxNkYTNtkyGqWIs5cgjajxU7wwYJ1tMCfgyXUbXnovfCl2Mw==
X-Received: by 2002:a05:6830:1af2:b0:606:22ca:9681 with SMTP id
 c18-20020a0568301af200b0060622ca9681mr1494683otd.43.1651516940697; 
 Mon, 02 May 2022 11:42:20 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 h22-20020a056808015600b00325cda1ff95sm2576607oie.20.2022.05.02.11.42.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 11:42:19 -0700 (PDT)
Message-ID: <781e52a4-bb2c-514e-38b9-58086a4333d9@roeck-us.net>
Date: Mon, 2 May 2022 11:42:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 0/7] hwmon: (nct6775) Convert to regmap, add i2c support
Content-Language: en-US
To: Oleksandr Natalenko <oleksandr@natalenko.name>,
 Zev Weiss <zev@bewilderbeest.net>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org
References: <20220427010154.29749-1-zev@bewilderbeest.net>
 <bc46d60e-7c89-ad05-780c-9e9fd19f788e@roeck-us.net>
 <2591481.aCYgfPdpt1@natalenko.name>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <2591481.aCYgfPdpt1@natalenko.name>
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
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Renze Nicolai <renze@rnplus.nl>, Rob Herring <robh+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 5/1/22 23:06, Oleksandr Natalenko wrote:
> On středa 27. dubna 2022 15:37:07 CEST Guenter Roeck wrote:
>> Hi Zev,
>>
>> On 4/26/22 18:01, Zev Weiss wrote:
>>> Hello,
>>>
>>> This is v4 of my effort to add i2c support to the nct6775 hwmon
>>> driver.
>>>
>>
>> Thanks a lot for your effort.
>>
>> I applied patches 2..6 to hwmon-next. The first and the last
>> patch of the series will have to wait for DT maintainer approval.
> 
> For patches 2..6:
> 
> Tested-by: Oleksandr Natalenko <oleksandr@natalenko.name>
> 
Thanks, added.

Guenter
