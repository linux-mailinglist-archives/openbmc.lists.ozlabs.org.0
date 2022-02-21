Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0D34BEF7E
	for <lists+openbmc@lfdr.de>; Tue, 22 Feb 2022 03:23:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2jdL2s9Kz3bYh
	for <lists+openbmc@lfdr.de>; Tue, 22 Feb 2022 13:23:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=LcxaZXJR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=LcxaZXJR; 
 dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2Fsw3YqSz30LY
 for <openbmc@lists.ozlabs.org>; Mon, 21 Feb 2022 19:32:35 +1100 (AEDT)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7675C402FD
 for <openbmc@lists.ozlabs.org>; Mon, 21 Feb 2022 08:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645432347;
 bh=TVZC7r8G6CEaD3eIO9b+oUrW2d/ZxrtJL667P7jAzwE=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=LcxaZXJRoaZZNSVfzR4pXprqQ1X+f4+YMx4YH0m8B4JJU8oTCBAMA81GzIg3QEP+c
 WPikNZrKeH9SQRq/sqpsl/8CNXlEJDERJRMpo78Wfw4lYsk1OhkKWta207ZeXXJBRY
 CnlZkaHfOHNfgTMQWHo8u34oLsOXTLZ7tr6QgDAMwuLzyPf8O3LNXQKj3+C82EVwnD
 XDffgpEu5+ycDFj59VwUjSZVB9NUoQ1zyCZJ3FERzq2NO2N5cEvNtelxs7e61WYm8e
 /unWX5s6/5wXOmgbP9oyRbiXqjQYVadmf5bo+aQQdokYMRi8va5S6ZyFc+DB6C5uNp
 FpaW0PFCIhe5g==
Received: by mail-wr1-f70.google.com with SMTP id
 v17-20020adfc5d1000000b001e6405c2b56so7122253wrg.7
 for <openbmc@lists.ozlabs.org>; Mon, 21 Feb 2022 00:32:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TVZC7r8G6CEaD3eIO9b+oUrW2d/ZxrtJL667P7jAzwE=;
 b=Mm+QQLRF9NYF1ArQxwLLj8hkwL16TtdVD8EVP979R1CpK9t7WrKcchPYTMx9IzLnet
 ATxiFE0WeVq+An9BW5R1pNU2BERcgj7cS4nSZjb1afFcbMTBUyrcOr7m6Uqw2DBObWiM
 2qeB2eThmZQoGkStWy8EMB5AwSTGQxRASqg7hddGYC+ZVIO5lvsFZBJUTTC1xVrM7Xmr
 l7DJqoN911JRj9s3dMJsH8bRASYgdEkkGoxoUAkOEUyJUdVu8cVeK8k24ICXH0rp2jxH
 9HKh7sH9Kin5Q77h7ucdfcukbC1EuQ2YyXOVJ1mipW9qP5fbwcvIw/KwiHnyLJ8oyBoq
 kNBA==
X-Gm-Message-State: AOAM533sR3pYKA/d6C0jWVi/cefuoTuwZkGApVr4gkjxPGiYoNDbfmrq
 bCnM74RAd393ZwnhBpzrhyyDzumu+OiI872BEHzSlHgyl/Q2VlznJ6CmvDgscVQMsfdaUlapmRj
 YWU+Je17YC/7vtAeKz4sYOXwuQXSxJdmXZ/RR
X-Received: by 2002:a5d:6146:0:b0:1e6:16b6:3e99 with SMTP id
 y6-20020a5d6146000000b001e616b63e99mr14752156wrt.693.1645432346961; 
 Mon, 21 Feb 2022 00:32:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJynWXDCyxnh3FFGUZaBfjSfsvzFafvVR9mLxa6NHv05YRkhHU0HA5xGoQ8svay3G9FKddP6HA==
X-Received: by 2002:a5d:6146:0:b0:1e6:16b6:3e99 with SMTP id
 y6-20020a5d6146000000b001e616b63e99mr14752122wrt.693.1645432346730; 
 Mon, 21 Feb 2022 00:32:26 -0800 (PST)
Received: from [192.168.0.120] (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108])
 by smtp.gmail.com with ESMTPSA id f18sm12660140wre.66.2022.02.21.00.32.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 00:32:26 -0800 (PST)
Message-ID: <5ce0f6a6-4a5f-4f25-3cc6-ab0f24bf15cf@canonical.com>
Date: Mon, 21 Feb 2022 09:32:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 00/11] i2c: npcm: Bug fixes timeout, spurious interrupts
Content-Language: en-US
To: Tyrone Ting <warp5tw@gmail.com>
References: <20220220035321.3870-1-warp5tw@gmail.com>
 <5d507fda-525e-4064-3add-0bb0cc23d016@canonical.com>
 <CACD3sJaXeWLu6=oLgxJcU9R+A1J+jB7xKaGcDFwYxof33yj17Q@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CACD3sJaXeWLu6=oLgxJcU9R+A1J+jB7xKaGcDFwYxof33yj17Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 22 Feb 2022 13:21:12 +1100
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
Cc: tmaimon77@gmail.com, devicetree@vger.kernel.org, tali.perry1@gmail.com,
 linux-i2c@vger.kernel.org, digetx@gmail.com, benjaminfair@google.com,
 openbmc@lists.ozlabs.org, JJLIU0@nuvoton.com, christophe.leroy@csgroup.eu,
 lukas.bulwahn@gmail.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com,
 bence98@sch.bme.hu, arnd@arndb.de, sven@svenpeter.dev, robh+dt@kernel.org,
 Avi.Fishman@nuvoton.com, andriy.shevchenko@linux.intel.com,
 semen.protsenko@linaro.org, jie.deng@intel.com, avifishman70@gmail.com,
 venture@google.com, yangyicong@hisilicon.com, linux-kernel@vger.kernel.org,
 wsa@kernel.org, kfting@nuvoton.com, tali.perry@nuvoton.com, olof@lixom.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 21/02/2022 09:16, Tyrone Ting wrote:
> Hi Krzysztof:
> 
> Thank you for your comments and please find my reply next to your comments.
> 
> Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> 於 2022年2月20日
> 週日 下午5:30寫道：
>>
>> On 20/02/2022 04:53, Tyrone Ting wrote:
>>> From: Tyrone Ting <kfting@nuvoton.com>
>>>
>>> This patchset includes the following fixes:
>>>
>>> - Add dt-bindings description for NPCM845.
>>> - Bug fix for timeout calculation.
>>> - Better handling of spurious interrupts.
>>> - Fix for event type in slave mode.
>>> - Removal of own slave addresses [2:10].
>>> - Support for next gen BMC (NPCM845).
>>>
>>> The NPCM I2C driver is tested on NPCM750 and NPCM845 evaluation boards.
>>>
>>> Addressed comments from:
>>>  - Jonathan Neuschäfer : https://lkml.org/lkml/2022/2/7/670
>>>  - Krzysztof Kozlowski : https://lkml.org/lkml/2022/2/7/760
>>
>> How did you address the ABI change comment? I still see you break the
>> ABI with the introduction of a new, required property.
>>
> 
> I add the new, required property "nuvoton,sys-mgr" in the file
> nuvoton-common-npcm7xx.dtsi.
> The file nuvoton-common-npcm7xx.dtsi is required by the existing
> upstream NPCM devicetree files.
> It is also updated and committed in this patch set [PATCH v2 01/11]
> arm: dts: add new property for NPCM i2c module.
> Please let me know if I misunderstand the meaning of "breaking the ABI".
> Thank you again.

Breaking the ABI means that old DTS stop working with new kernel. Your
change breaks old (and out-of-tree) DTS.

What is more, your change is not bisectable because DTS goes via
separate branch or tree than driver change.

You need to keep old code as fallback, if getting nuvoton,sys-mgr fails.

Best regards,
Krzysztof
