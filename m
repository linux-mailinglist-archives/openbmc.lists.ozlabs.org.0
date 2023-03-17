Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8796BF0D4
	for <lists+openbmc@lfdr.de>; Fri, 17 Mar 2023 19:38:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PdXvd5hHbz3cjR
	for <lists+openbmc@lfdr.de>; Sat, 18 Mar 2023 05:38:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hSbf2Gew;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hSbf2Gew;
	dkim-atps=neutral
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PdXv02Kvkz3cDp
	for <openbmc@lists.ozlabs.org>; Sat, 18 Mar 2023 05:38:02 +1100 (AEDT)
Received: by mail-io1-xd36.google.com with SMTP id p17so953245ioj.10
        for <openbmc@lists.ozlabs.org>; Fri, 17 Mar 2023 11:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679078278;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=doTBEIPrtJGrIVKGzCIV43Qeoz4CxJQQLeaZ0TGaW9Q=;
        b=hSbf2GewkqwWqibfrWgkVO7XXcHstCvhpYn/F4tkL6BYH44pB6P8kEuSebAOVrHMmL
         zi2RPkBYqkPVZsDvNup5EmBAlEd2IaokgDFflK8I3ytcHVnW0lF9l4kJzt16f5x9t0pM
         hGjPHt0szAsGj3sQuPmfzhj6nzmHG0BYF5TIJ2iwCGbVqLGNct5ZgSSyFsizv/S0b4BN
         lSSqXXzxJxZdp9sidj23nGsSMC5vnBJ8wS9Vwm1UFJqoDKxITXWkaDrmaPgS7+Sf+igo
         GhdG9GykYGdrQSoePQfnGTpSdUQiMAqsBWIp45fE9ALXsxFEoEALrvXjYF4S32E6IwsF
         LLRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679078278;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=doTBEIPrtJGrIVKGzCIV43Qeoz4CxJQQLeaZ0TGaW9Q=;
        b=sqAFspiUuobIVMAMypTN4vTTNjAZfRL1Obbpklgo6LO99DWwL3uWcHDPo+y1mHUf4h
         BBm5UkxZTj160MO9j/Pu24Ypqt7862XMSLNX9euhAncCXNYTNRFpgZxpE1gl0E13gw3n
         lAu4yxDE7G7uFm9CEwK1NVRORUAc9cVGyGmBXMs8P5b4gVsg0G4UXuz+err/ug/AxgeW
         Y/jiJSFpH6IpE5W2Kf6ie5dMNZ21ndkL/ogoSdwUZMtu06ytFfx4HSBpeSI3c3M0Xgwn
         Z4DZr3sZgEaQcRPXxH3KFfXy50ls87/8sqzy0aSl2jCw6ak2AODcbX2hCD/kgMwSxw2O
         Huyw==
X-Gm-Message-State: AO0yUKUp/vOxN1T/Lvr/bXMei/jecRQzfVHEWlESY99rEBWqlrX2vixu
	GVZClK53O+5cOu2vVbG5Cnk=
X-Google-Smtp-Source: AK7set89qP2jQ0x7Zcy+DFqgPLQjIL0udBlesLSIV2ZSwz3/NAWdm44y9/1Aw9RHvJd3zAZMKUUTVA==
X-Received: by 2002:a5d:9c89:0:b0:752:fd8e:5ee4 with SMTP id p9-20020a5d9c89000000b00752fd8e5ee4mr386005iop.1.1679078278421;
        Fri, 17 Mar 2023 11:37:58 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e30-20020a026d5e000000b0040631c91311sm875212jaf.91.2023.03.17.11.37.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 11:37:57 -0700 (PDT)
Message-ID: <4b2d6f4a-4868-9ffe-e1e1-9feafe41ccdd@roeck-us.net>
Date: Fri, 17 Mar 2023 11:37:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20221205085351.27566-1-tmaimon77@gmail.com>
 <20221205085351.27566-3-tmaimon77@gmail.com>
 <f28c7c34-077c-4c7e-afd8-c4180718d403@roeck-us.net>
 <CAHp75Vegm=jmuJ6q5qofuLKm_LggKmtQZWcVgQN=MG3kMMCTRA@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 2/2] mmc: sdhci-npcm: Add NPCM SDHCI driver
In-Reply-To: <CAHp75Vegm=jmuJ6q5qofuLKm_LggKmtQZWcVgQN=MG3kMMCTRA@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, ulf.hansson@linaro.org, Tomer Maimon <tmaimon77@gmail.com>, arnd@arndb.de, krakoczy@antmicro.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, briannorris@chromium.org, linux-mmc@vger.kernel.org, adrian.hunter@intel.com, tali.perry1@gmail.com, gsomlo@gmail.com, joel@jms.id.au, davidgow@google.com, skhan@linuxfoundation.org, pbrobinson@gmail.com, linux-kernel@vger.kernel.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 3/17/23 10:36, Andy Shevchenko wrote:
> On Fri, Mar 17, 2023 at 4:16 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On Mon, Dec 05, 2022 at 10:53:51AM +0200, Tomer Maimon wrote:
>>> Add Nuvoton NPCM BMC sdhci-pltfm controller driver.
>>>
>>> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>>
>> I still don't see this driver in the upstream kernel, or in linux-next.
>>
>> Couple of comments:
>>
>> - devm ordering does not really matter here. The devm resource
>>    is the clock, it does not depend on local data, and it will be
>>    released last, so that is ok.
> 
> Not sure. Strictly speaking this is the problem. If you leave a clock
> going on in a wrong period of time it (theoretically) might break your
> hardware once and forever. Similar discussion about power, clock and
> reset signals has been held for camera sensors.
> 

In general I agree, but not here. The remove function (sdhci_pltfm_unregister)
does call clk_disable_unprepare(), so the clock isn't left running.

Also, I think it is worthwhile to point out that exactly the same sequence
(sdhci_pltfm_init followed by devm_clk_get and cleanup/removal with
sdhci_pltfm_unregister) is shared among several sdhci drivers (including
the memory leak I pointed out, but only in the aspeed driver).

On a higher level I do agree that the sdhci platform code is in need of cleanup,
but I don't think it is appropriate to tie such a cleanup to this driver
submission.

Note that I don't really care much, I just realized that this patch is stuck
when I tried to test booting from SD drive with qemu.

Guenter

