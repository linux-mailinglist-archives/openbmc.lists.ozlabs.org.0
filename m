Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 885454AD3FC
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 09:51:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtGw41WR9z3bVd
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 19:51:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LIoXET1V;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f31;
 helo=mail-qv1-xf31.google.com; envelope-from=tali.perry1@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=LIoXET1V; dkim-atps=neutral
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtGvh0NjXz2y7J
 for <openbmc@lists.ozlabs.org>; Tue,  8 Feb 2022 19:51:26 +1100 (AEDT)
Received: by mail-qv1-xf31.google.com with SMTP id h9so3772503qvm.0
 for <openbmc@lists.ozlabs.org>; Tue, 08 Feb 2022 00:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=52Mlxc/AZaE8Cndi19CrmZAb2xd8snlWb6gzXeW+f8c=;
 b=LIoXET1Vcm+0Yo/759v2FqsPM9tUsLx5soPaRzhSfagqaev0i/jq4YTBq0QXQKPdRn
 Kbs1VbKM9Vys9h4DE73AhMh80HqZqIG2ciDb+cZAARKQHBryRqURWDb9PWl4iykUvLbx
 vhFCNNRDwT9aWmNTKkotXhcTvlI0jVPKnUeMRvIF3F5xyP3uidSK1o+FyDLyVobzE5Xc
 +RYq4C22VTpWstKp9vrwLat1X3z0vDt0sPLkTADDz1kEv0wGLwyOmR6ZxECbWsNA4Plv
 PyAIXzKAaKValqytpOhB/H/LFIwFoJLFeYiLPMNP5/P/cp2GJJU75tKzVP5CXWisQu/D
 xx9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=52Mlxc/AZaE8Cndi19CrmZAb2xd8snlWb6gzXeW+f8c=;
 b=ARoNy2jLlFK6ruBJGq4i3QaOt2KkYeJob63PcXYmH8Id0V5J3Qo7yzfW3q8eroKBTb
 xaDApw93ahXCC2kQ2LdpGPkdZCwOAEBzE1TzFl280jhm+j+dafGoOiWsEUlHht2djZUm
 AyGQykM1rmZh4r5O6SCwQvDXGhfdk/CZ5tBQ/EXlHgtWUmTiy6UIE9efO0TIFwD3151h
 KY9hjy+qL8zSaE/PuRYo9/iYUJNbSMxP/cAUrwa3wuqfBKBQULonpQHIzY3maAUKyGEo
 PH65ivLNbLEOb1yXsQ89U/M4DoKymE5M3WDGeUIW7j1itQpVCfZRWCtju3RdMM/Z4QBZ
 YxkQ==
X-Gm-Message-State: AOAM531wdFe1tqwyYvVL85o/ooBFMg8r+nME3lJbNSCrlKFEiGOeBSVl
 6Q3sLARGCPPSMIqpfD5nwIS7tDhR7AmxdANZSlQ=
X-Google-Smtp-Source: ABdhPJwBqxeW2lVYe2YhpeD6J4pREP12QDacbTsGlkhFVIN+DKzqGhtZN16Vv4UkriLaHnkPuW7YJ4oDA16S2sfvwzY=
X-Received: by 2002:a05:6214:1cc7:: with SMTP id
 g7mr2429769qvd.124.1644310282674; 
 Tue, 08 Feb 2022 00:51:22 -0800 (PST)
MIME-Version: 1.0
References: <20220207063338.6570-1-warp5tw@gmail.com>
 <20220207063338.6570-7-warp5tw@gmail.com>
 <YgEJ1M40AG9EuRPI@latitude>
 <086655b0-b9d2-30ed-1496-47cdc6346003@canonical.com>
 <CAHb3i=vpFwez+ZzDhHkSxjkios3tyoM2urRpCxOn3vfwzvewog@mail.gmail.com>
 <30ac5fe7-9d96-a756-24b0-384361b48a2d@canonical.com>
In-Reply-To: <30ac5fe7-9d96-a756-24b0-384361b48a2d@canonical.com>
From: Tali Perry <tali.perry1@gmail.com>
Date: Tue, 8 Feb 2022 10:51:11 +0200
Message-ID: <CAHb3i=ukzVr4DDgcPQ2+DO+LXWWtgjCe03WbG-CqvsOP_qqvUw@mail.gmail.com>
Subject: Re: [PATCH v1 6/6] i2c: npcm: Support NPCM845
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, devicetree <devicetree@vger.kernel.org>,
 yangyicong@hisilicon.com, Linux I2C <linux-i2c@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, JJLIU0@nuvoton.com,
 lukas.bulwahn@gmail.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com,
 bence98@sch.bme.hu, arnd@arndb.de, sven@svenpeter.dev,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Rob Herring <robh+dt@kernel.org>, Avi Fishman <Avi.Fishman@nuvoton.com>,
 Tyrone Ting <warp5tw@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 semen.protsenko@linaro.org, jie.deng@intel.com, avifishman70@gmail.com,
 Patrick Venture <venture@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wolfram Sang <wsa@kernel.org>, kfting@nuvoton.com,
 Tali Perry <tali.perry@nuvoton.com>, olof@lixom.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

>On 08/02/2022 08:14, Tali Perry wrote:
>>> Subject: Re: [PATCH v1 6/6] i2c: npcm: Support NPCM845
>>>
>>> On 07/02/2022 13:00, Jonathan Neusch=C3=A4fer wrote:
>>>> Hello,
>>>>
>>>> On Mon, Feb 07, 2022 at 02:33:38PM +0800, Tyrone Ting wrote:
>>>>> From: Tyrone Ting <kfting@nuvoton.com>
>>>>>
>>>>> NPCM8XX uses a similar i2c module as NPCM7XX.
>>>>> The only difference is that the internal HW FIFO is larger.
>>>>>
>>>>> Related Makefile and Kconfig files are modified to support as well.
>>>>>
>>>>> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller
>>>>> driver")
>>>>
>>>> It's not really a bug fix, but rather an additional feature.
>>>> Therefore, I suggest removing the Fixes tag from this patch.
>>>>
>>>>> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
>>>>> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
>>>>> ---
>>>> [...]
>>>>>  /* init register and default value required to enable module */
>>>>>  #define NPCM_I2CSEGCTL 0xE4
>>>>> +#ifdef CONFIG_ARCH_NPCM7XX
>>>>>  #define NPCM_I2CSEGCTL_INIT_VAL 0x0333F000
>>>>> +#else
>>>>> +#define NPCM_I2CSEGCTL_INIT_VAL 0x9333F000
>>>>> +#endif
>>>>
>>>> This is going to cause problems when someone tries to compile a kernel
>>>> that runs on both NPCM7xx and NPCM8xx (because the driver will then
>>>> only work on NPCM7xx).
>>>
>>> Yes, good catch.
>>>
>>> The NPCM7XX is multiplatform, I guess NPCM8xx will be as well, so this =
looks like an invalid code. How such code is supposed to work on multiplatf=
orm kernel?
>>>
>>
>> NPCM7xx and NPCM8xx are very different devices.
>> They share same driver sources for some of the modules but it's not ABI.
>> Users cannot compile a single kernel with two separate DTS.
>> In case of the i2c controller, the npcm7xx has a 16 byte HW FIFO,
>> and the NPCM8xx has 32 bytes HW FIFO.
>> This also means that registers fields are slightly different.
>> For init data we can move it to the DTS, but register field sizes
>> can't be handled with this approach.
>>
>
>What do you mean they cannot compile a kernel with different DTS? Of
>course they can - when we talk about multiplatform sub-architectures!
>Maybe there is something specific in NPCMxxx which stops it but then it
>should not be marked multiplatform.
>


NCPM7xx is ARM32 bit (dual core Cortex A9)
NPCM8xx is ARM64 bit (quad core Cortex A35)

They have completely different architecture so not ABI compliant.
I2C module is similar, but the devices are quite different and have
separate architectures.

Sorry for the confusion.
This is the first patch we try to upstream for NPCM8xx.
In the coming weeks we will upstream the architecture of NPCM8xx as well.



>
>Best regards,
>Krzysztof

Thanks!
Tali
