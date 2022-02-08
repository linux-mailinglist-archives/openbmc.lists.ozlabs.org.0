Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 699DB4AD4B1
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 10:23:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtHcC0ntdz3bWj
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 20:23:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=k7DIfwDI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f34;
 helo=mail-qv1-xf34.google.com; envelope-from=tali.perry1@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=k7DIfwDI; dkim-atps=neutral
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtHbq0DbDz2yNr
 for <openbmc@lists.ozlabs.org>; Tue,  8 Feb 2022 20:22:45 +1100 (AEDT)
Received: by mail-qv1-xf34.google.com with SMTP id n6so5249760qvk.13
 for <openbmc@lists.ozlabs.org>; Tue, 08 Feb 2022 01:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CYVaXukRgUCEvFAm5Rvccoy4E4azJEZwAWMrVoUo60s=;
 b=k7DIfwDI7lJiplAzuKEv1ztD9Ak9R+8xzxXZwM2usNppLiqm5bdYqIWjxkDIV/hyth
 ohH/mlhrT+QZKqQQcL4CVOEUStEq97nRWHFMcuBpSGh8p21ytE+IJyOPEqHc9spG2xBW
 C2ygszJiPgi6KJkccRu5ROmtgEnrKUhGWEmUSxXbx+XquhltiVUwk007dTvR1zFvr1mg
 4IKqahTBJrweYv7eF2lTvrY2L9Wf+Xlu2XxweOif/adWLK3ZobULps3DQMQXxzH5uHmr
 oeFKqTDxURrYQKIfoBjWfKCCmG6qhyEcL94CbAWjJjN24gAitBWghlsnh+R6+geClxmu
 t3Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CYVaXukRgUCEvFAm5Rvccoy4E4azJEZwAWMrVoUo60s=;
 b=eGd17WvhqnlVASjC841S7dikGES6AFAoiHc30u/2dOnQZacCD1KyOPDRVcX1doNYn4
 S5+gfZVrtaXxcJYIB3+9VQ43vln50E31vmOiu2klYtgS4D3eYhR0Ov8Tuuqr/3AVzPLz
 7TL77aJYs99izAlLi8BW3a9+Ebs/+V5bfyDT2EIPbePNsoThXwz3NlnwwLpsuZUMULQb
 iQPMmI4ChEEi6Y8CyA4gVnXdB5X+TPoFSMjS0iyWe/OGEjtKl5m0eAtzD9MVKacVeBQ2
 sMx8RU1BuMWMwkvFRUFp4n9STv4caAQMqLxARmRm0prdcFb+l9FArJkukrTg8KyirkBa
 CTAw==
X-Gm-Message-State: AOAM531db5h9PDChTCNv1o8mhVaCz186rnW8nCVGwF9zGtmcb03onF9U
 aJ+FutR53ZcdsVdcdb8qOKmcEuS/DoLFzXBWQIQ=
X-Google-Smtp-Source: ABdhPJyIzKvFKpf1BBmc+9sLhRsGbOh9ftgw+xxzEK5Z04ibvmuVWz+wsnEwZUKatWlmrd9PAjYjXFPw3XpMNV/ekhc=
X-Received: by 2002:a05:6214:1cc7:: with SMTP id
 g7mr2490810qvd.124.1644312162002; 
 Tue, 08 Feb 2022 01:22:42 -0800 (PST)
MIME-Version: 1.0
References: <20220207063338.6570-1-warp5tw@gmail.com>
 <20220207063338.6570-7-warp5tw@gmail.com>
In-Reply-To: <20220207063338.6570-7-warp5tw@gmail.com>
From: Tali Perry <tali.perry1@gmail.com>
Date: Tue, 8 Feb 2022 11:22:30 +0200
Message-ID: <CAHb3i=vdc_+J4pCBcY--C85ZR1uXO1LG02UsttsfSnsQBDKWAg@mail.gmail.com>
Subject: Re: [PATCH v1 6/6] i2c: npcm: Support NPCM845
To: Tyrone Ting <warp5tw@gmail.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, JJLIU0@nuvoton.com,
 lukas.bulwahn@gmail.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com,
 bence98@sch.bme.hu, arnd@arndb.de, sven@svenpeter.dev,
 Rob Herring <robh+dt@kernel.org>, Avi Fishman <Avi.Fishman@nuvoton.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 semen.protsenko@linaro.org, jie.deng@intel.com, avifishman70@gmail.com,
 Patrick Venture <venture@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wolfram Sang <wsa@kernel.org>, kfting@nuvoton.com,
 Tali Perry <tali.perry@nuvoton.com>, olof@lixom.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

>On 08/02/2022 09:51, Tali Perry wrote:
>>> On 08/02/2022 08:14, Tali Perry wrote:
>>>>> Subject: Re: [PATCH v1 6/6] i2c: npcm: Support NPCM845
>>>>>
>>>>> On 07/02/2022 13:00, Jonathan Neusch=C3=A4fer wrote:
>>>>>> Hello,
>>>>>>
>>>>>> On Mon, Feb 07, 2022 at 02:33:38PM +0800, Tyrone Ting wrote:
>>>>>>> From: Tyrone Ting <kfting@nuvoton.com>
>>>>>>>
>>>>>>> NPCM8XX uses a similar i2c module as NPCM7XX.
>>>>>>> The only difference is that the internal HW FIFO is larger.
>>>>>>>
>>>>>>> Related Makefile and Kconfig files are modified to support as well.
>>>>>>>
>>>>>>> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller
>>>>>>> driver")
>>>>>>
>>>>>> It's not really a bug fix, but rather an additional feature.
>>>>>> Therefore, I suggest removing the Fixes tag from this patch.
>>>>>>
>>>>>>> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
>>>>>>> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
>>>>>>> ---
>>>>>> [...]
>>>>>>>  /* init register and default value required to enable module */
>>>>>>>  #define NPCM_I2CSEGCTL 0xE4
>>>>>>> +#ifdef CONFIG_ARCH_NPCM7XX
>>>>>>>  #define NPCM_I2CSEGCTL_INIT_VAL 0x0333F000
>>>>>>> +#else
>>>>>>> +#define NPCM_I2CSEGCTL_INIT_VAL 0x9333F000
>>>>>>> +#endif
>>>>>>
>>>>>> This is going to cause problems when someone tries to compile a kern=
el
>>>>>> that runs on both NPCM7xx and NPCM8xx (because the driver will then
>>>>>> only work on NPCM7xx).
>>>>>
>>>>> Yes, good catch.
>>>>>
>>>>> The NPCM7XX is multiplatform, I guess NPCM8xx will be as well, so thi=
s looks like an invalid code. How such code is supposed to work on multipla=
tform kernel?
>>>>>
>>>>
>>>> NPCM7xx and NPCM8xx are very different devices.
>>>> They share same driver sources for some of the modules but it's not AB=
I.
>>>> Users cannot compile a single kernel with two separate DTS.
>>>> In case of the i2c controller, the npcm7xx has a 16 byte HW FIFO,
>>>> and the NPCM8xx has 32 bytes HW FIFO.
>>>> This also means that registers fields are slightly different.
>>>> For init data we can move it to the DTS, but register field sizes
>>>> can't be handled with this approach.
>>>>
>>>
>>> What do you mean they cannot compile a kernel with different DTS? Of
>>> course they can - when we talk about multiplatform sub-architectures!
>>> Maybe there is something specific in NPCMxxx which stops it but then it
>>> should not be marked multiplatform.
>>>
>>
>>
>> NCPM7xx is ARM32 bit (dual core Cortex A9)
>> NPCM8xx is ARM64 bit (quad core Cortex A35)
>>
>> They have completely different architecture so not ABI compliant.
>> I2C module is similar, but the devices are quite different and have
>> separate architectures.
>
>OK, in such case usually you indeed can't have both. :)
>
>> Sorry for the confusion.
>> This is the first patch we try to upstream for NPCM8xx.
>> In the coming weeks we will upstream the architecture of NPCM8xx as well=
.
>
>Still, ARCH_XXX should not be hard-coded in the drivers to change the
>driver's behavior, even if driver won't be used simultaneously. It
>breaks all design principles and prevents any further re-use if a new
>use case appears.
>
>You can use "ifdef ARCH_XXX" to skip building of some parts of the
>driver, but it's not the case here.
>

Correct, the main change is in FIFO size:
+#ifdef CONFIG_ARCH_NPCM7XX
#define I2C_HW_FIFO_SIZE               16
+#else
+#define I2C_HW_FIFO_SIZE               32
+#endif /* CONFIG_ARCH_NPCM7XX */

NPCM7XX will always have 16 bytes, all the next gens will have 32.

This impact some registers sizes, like this one:

+#ifdef CONFIG_ARCH_NPCM7XX
#define NPCM_I2CRXF_STS_RX_BYTES       GENMASK(4, 0)
+#else
+#define NPCM_I2CRXF_STS_RX_BYTES       GENMASK(5, 0)
+#endif /*CONFIG_ARCH_NPCM7XX*/

For this, the FIFO size should be defined before compilation.
I also don't want to let users select FIFO size per architecture.
NPCM7XX has 16, NPCM8XX has 32. This is not a user selection.
It's part of the arch.



>
>Best regards,
>Krzysztof

Thanks,
Tali
