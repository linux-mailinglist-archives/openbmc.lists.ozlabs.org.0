Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E1E4AD200
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 08:14:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtDmF4wSLz2xDD
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 18:14:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=K+zBA6+s;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82b;
 helo=mail-qt1-x82b.google.com; envelope-from=tali.perry1@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=K+zBA6+s; dkim-atps=neutral
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtDlt2W0Yz2xDD
 for <openbmc@lists.ozlabs.org>; Tue,  8 Feb 2022 18:14:33 +1100 (AEDT)
Received: by mail-qt1-x82b.google.com with SMTP id e16so14057562qtq.6
 for <openbmc@lists.ozlabs.org>; Mon, 07 Feb 2022 23:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VNtT+hI4htB2swNQKNRtjIfJJVmCXaN4+/+51pyI8Kg=;
 b=K+zBA6+sy0mDQchDnIAOMFJrUx4Kf2xIFdKUsNO77VskGfPqUASUGDZPGB5dnglE90
 XerLsB9YGVAjop+gcaAGOm7Dvjl4tTxVWbXiTN5PBi8LWcER+X5nr/CG6S5+KtN8i9VR
 zz8gZlv0gi0LPhGrRZLFWcTT6o5hK2XZ+yg0dsPV1ZRq2s17fURCyI+8+S265FZL1NUW
 KJudZnAjDQrDjbwCV9tAw8G6mtZscAyTI9SEDiVugSmnYrRIQYG5eDu1qALpYpZGQrxW
 DBJquFgnQwhzVKYK6w7h3xuVFErlD8eMRaMbaGsEoWsKcpshAIgQYidvaklhAJRRaIee
 lwuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VNtT+hI4htB2swNQKNRtjIfJJVmCXaN4+/+51pyI8Kg=;
 b=vMCDRhfts84I8s31h2QglaPFkugOAxNa7khsNoTuoKp4lTsNZKDlhNK+Wyya2TSNwS
 4/xse9bmnBolYY6GUYnPm5txkLraDP9D399+GCPjbzdJcdNbIcoOuyOMqb+pCNSCeAgT
 ervoWR82kKSjcWT2f89wN7IPBUF4JE1lpBZnBfs79UFHJgkjc82C8v9gI4KOVmjUEI7t
 jMsowGyuSqUT/FINBAOxzBxrFJJ0rzeCTZTQ+8o9l09KV/8H25y2+SEy2CExuLOSdTPT
 RSLiY3+fhO5xY5TjMO7r6v2mxvyQnLjiQyI9zU5inFnjN86Wcagrmy6UCr0gSfRSOql/
 Sq7g==
X-Gm-Message-State: AOAM533jzqMTUVfcPw4aVUvYA+F7FEaM6ScepZOcR1ssmFChJmPSruVF
 /fYGL9/uxDxA64HCS/7qwSR4CrRur5pGEM28tb8=
X-Google-Smtp-Source: ABdhPJxcy7FjpbarmDvijrfYBsu9QSlj4cydqRZroJlQcRNaRWWhHSSBldpn+0r3FsH2IOnoXHEB4cLNZ4lHo6k+gQs=
X-Received: by 2002:a05:622a:248:: with SMTP id
 c8mr2155685qtx.602.1644304468511; 
 Mon, 07 Feb 2022 23:14:28 -0800 (PST)
MIME-Version: 1.0
References: <20220207063338.6570-1-warp5tw@gmail.com>
 <20220207063338.6570-7-warp5tw@gmail.com>
 <YgEJ1M40AG9EuRPI@latitude>
 <086655b0-b9d2-30ed-1496-47cdc6346003@canonical.com>
In-Reply-To: <086655b0-b9d2-30ed-1496-47cdc6346003@canonical.com>
From: Tali Perry <tali.perry1@gmail.com>
Date: Tue, 8 Feb 2022 09:14:17 +0200
Message-ID: <CAHb3i=vpFwez+ZzDhHkSxjkios3tyoM2urRpCxOn3vfwzvewog@mail.gmail.com>
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

>-----Original Message-----
>From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>Sent: Monday, February 7, 2022 5:27 PM
>To: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>; Tyrone Ting <warp5tw=
@gmail.com>
>Cc: avifishman70@gmail.com; tmaimon77@gmail.com; tali.perry1@gmail.com; ve=
nture@google.com; yuenn@google.com; benjaminfair@google.com; robh+dt@kernel=
.org; semen.protsenko@linaro.org; yangyicong@hisilicon.com; wsa@kernel.org;=
 jie.deng@intel.com; sven@svenpeter.dev; bence98@sch.bme.hu; lukas.bulwahn@=
gmail.com; arnd@arndb.de; olof@lixom.net; andriy.shevchenko@linux.intel.com=
; IS20 Tali Perry <tali.perry@nuvoton.com>; IS20 Avi Fishman <Avi.Fishman@n=
uvoton.com>; IS20 Tomer Maimon <tomer.maimon@nuvoton.com>; CS20 KWLiu <KWLI=
U@nuvoton.com>; CS20 JJLiu0 <JJLIU0@nuvoton.com>; CS20 KFTing <KFTING@nuvot=
on.com>; devicetree@vger.kernel.org; openbmc@lists.ozlabs.org; linux-i2c@vg=
er.kernel.org; linux-kernel@vger.kernel.org
>Subject: Re: [PATCH v1 6/6] i2c: npcm: Support NPCM845
>
>On 07/02/2022 13:00, Jonathan Neusch=C3=A4fer wrote:
>> Hello,
>>
>> On Mon, Feb 07, 2022 at 02:33:38PM +0800, Tyrone Ting wrote:
>>> From: Tyrone Ting <kfting@nuvoton.com>
>>>
>>> NPCM8XX uses a similar i2c module as NPCM7XX.
>>> The only difference is that the internal HW FIFO is larger.
>>>
>>> Related Makefile and Kconfig files are modified to support as well.
>>>
>>> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller
>>> driver")
>>
>> It's not really a bug fix, but rather an additional feature.
>> Therefore, I suggest removing the Fixes tag from this patch.
>>
>>> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
>>> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
>>> ---
>> [...]
>>>  /* init register and default value required to enable module */
>>>  #define NPCM_I2CSEGCTL 0xE4
>>> +#ifdef CONFIG_ARCH_NPCM7XX
>>>  #define NPCM_I2CSEGCTL_INIT_VAL 0x0333F000
>>> +#else
>>> +#define NPCM_I2CSEGCTL_INIT_VAL 0x9333F000
>>> +#endif
>>
>> This is going to cause problems when someone tries to compile a kernel
>> that runs on both NPCM7xx and NPCM8xx (because the driver will then
>> only work on NPCM7xx).
>
>Yes, good catch.
>
>The NPCM7XX is multiplatform, I guess NPCM8xx will be as well, so this loo=
ks like an invalid code. How such code is supposed to work on multiplatform=
 kernel?
>

NPCM7xx and NPCM8xx are very different devices.
They share same driver sources for some of the modules but it's not ABI.
Users cannot compile a single kernel with two separate DTS.
In case of the i2c controller, the npcm7xx has a 16 byte HW FIFO,
and the NPCM8xx has 32 bytes HW FIFO.
This also means that registers fields are slightly different.
For init data we can move it to the DTS, but register field sizes
can't be handled with this approach.



>>
>> And every time another platform is added, this approach will make the
>> code less readable.
>>
>> A more future-proof approach is probably to have a struct with chip-
>> specific data (such as the I2CSECCTL initialization value), which is
>> then selected via the .data field in of_device_id.
>
>
>Best regards,
>Krzysztof

Thanks for the review!
Tali Perry, Nuvoton.
