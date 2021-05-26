Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCDC39100C
	for <lists+openbmc@lfdr.de>; Wed, 26 May 2021 07:34:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqflD4mQSz2yss
	for <lists+openbmc@lfdr.de>; Wed, 26 May 2021 15:34:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=iEPJ2ERH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::344;
 helo=mail-ot1-x344.google.com; envelope-from=guopingjn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iEPJ2ERH; dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fqfky6Vrpz2xZZ
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 15:34:02 +1000 (AEST)
Received: by mail-ot1-x344.google.com with SMTP id
 36-20020a9d0ba70000b02902e0a0a8fe36so30870425oth.8
 for <openbmc@lists.ozlabs.org>; Tue, 25 May 2021 22:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=LDyJLitJ0UDCpnhLzkmfY84YfNtgIL4FUtSdv3+39Go=;
 b=iEPJ2ERHQONpXVeqnJscNgkV3Dh7AUHlbMMdw48GeHFYfIHPC5R7Loddo/CoiAyzQY
 1MzINuZk1lqXw0tZjD97aQJznIocKxzdUNmcnI2oxOzkbJdQOLHGpalQgpPhvsNbdj2B
 IlA3CROBJFU7zmL7LTqQXC+3GxfBU0m5u6PfchvR3ZZA/7EmFPEWQAT9sQRIqi+pq66Z
 7o4OoHCbhXHAUpzZ0+gh5hrEkYH4qJMw5BpJoQI9aBG77Jd03zu+GHkg907ytSS9KiL5
 YDiwWMeVKkcPVO+lbYEP/Q1h1N3laRCfIkpH4C/5fJs2mpA9S36NCOcQm16NBnfdFxgz
 GFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=LDyJLitJ0UDCpnhLzkmfY84YfNtgIL4FUtSdv3+39Go=;
 b=bdnL+43M9LacUegpka5ZOJJ047dTS85cBy2BiN4MU5JY2Wd7BLT6aZwUez6Hpz3oqB
 QAL19JOkNZcSkCw96cAVxoi7AwFk+ulsJpTB2sccDt4eYJuxZ8XH+7yWVALKmUEW1dID
 WiQ5zlPi5t9bSTiS7Gf3qR4gtHHU1eSKn35sBH4DKJDI3v9IKndzfycc8KOMcqZyKp0y
 K/NSWTIOiRxwBqXU303jz/JE1+maobCsfZEJ+oQUvH5+RGVrCyKr8v16qzmC08Kd8U3o
 rwRWKO7bXMgySeiyWIfpm0WK4u2HhedH9QaHsJiPnxzGVDsf4S/gaYIO//KfNn58s6LC
 Pj+g==
X-Gm-Message-State: AOAM533r/tg3AjE3Rm+S9XbTsXkp67TVTVCNEx2oJQgQzdauRx2YhE0/
 iq3YBenpoLyIPy2wz/Wf4OEKAO7Tuc9Rlg==
X-Google-Smtp-Source: ABdhPJwh4LAYOwxZdkdh/FEsdQO2+5bs9xWon22iS2QL8kjri8smJojQb93zZOrO02OOWRn2xIwD5w==
X-Received: by 2002:a9d:51c7:: with SMTP id d7mr983854oth.51.1622007239238;
 Tue, 25 May 2021 22:33:59 -0700 (PDT)
Received: from [10.72.73.115] ([60.208.111.194])
 by smtp.gmail.com with ESMTPSA id n11sm606463ooo.12.2021.05.25.22.33.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 22:33:58 -0700 (PDT)
Subject: Re: [PATCH 1/1] ARM: dts: aspeed: Add Inspur NF5280M6 BMC machine
To: Joel Stanley <joel@jms.id.au>
References: <20210525064737.14750-1-guopingjn@gmail.com>
 <CACPK8Xe43Fnok+Y=358LmQSCDQ0WyDGD762p3An2sR7DCB7oRw@mail.gmail.com>
 <CACPK8XfGytJEmRDzdbCjLMT5jFWN67h7OOeH-bGJP6RgFJZDGw@mail.gmail.com>
From: Ping Guo <guopingjn@gmail.com>
Message-ID: <4f3bb433-d050-a4bf-1797-933cdec77bda@gmail.com>
Date: Wed, 26 May 2021 13:33:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XfGytJEmRDzdbCjLMT5jFWN67h7OOeH-bGJP6RgFJZDGw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, guoping@inspur.com,
 banht@inspur.com, liuxiwei@inspur.com, wangxinglong@inspur.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 5/25/21 3:27 PM, Joel Stanley wrote:
> On Tue, 25 May 2021 at 07:18, Joel Stanley <joel@jms.id.au> wrote:
>> On Tue, 25 May 2021 at 06:48, <guopingjn@gmail.com> wrote:
>>> From: Ping Guo <guoping@inspur.com>
>>>
>>> The Inspur NF5280M6 is an x86 platform server with an AST2500-based BMC.
>>> This dts file provides a basic configuration for its OpenBMC
>>> development.
>>>
>>> Signed-off-by: George Liu <liuxiwei@inspur.com>
>>> Signed-off-by: Ping Guo <guoping@inspur.com>
>> In the future you can use git format-patch to set a version on your
>> patch. "-v 2" will set the version to 2, for example.
>>
>>> ---
>> Put the changelog of what is different compared to last time just
>> below this ---. It won't be included in the git history of the kernel,
>> but it's for reviewers to understand what you've changed.
>>
>> The patch looks good. I will apply this for v5.14 and to the openbmc
>> dev-5.10 tree.
> I spoke too soon. There's a mistake below:
>
>>> +&gpio {
>>> +       power_out {
>>> +               gpios = <ASPEED_GPIO(AA, 7) GPIO_ACTIVE_LOW>;
> This warns:
>
> ../arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m6.dts:138.3-30: Warning
> (gpios_property): /ahb/apb/gpio@1e780000/power_out:gpios: cell 0 is
> not a phandle reference
> ../arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m6.dts:138.3-30: Warning
> (gpios_property): /ahb/apb/gpio@1e780000/power_out:gpios: Could not
> get phandle node for (cell 0)
>
> Taking a closer look, I'm not sure that it's a valid description. What
> are you trying to do there?
>
> Is it supposed to be a gpio hog?
Thanks for your reminder.I'll see.
>>> +               output-low;
>>> +       };
>>> +};
>>> +
>>> +&gpio {
>>> +       status = "okay";
>>> +       /* Enable GPIOE0 and GPIOE2 pass-through by default */
>>> +       pinctrl-names = "pass-through";
>>> +       pinctrl-0 = <&pinctrl_gpie0_default
>>> +                       &pinctrl_gpie2_default>;
>>> +       gpio-line-names =
>>> +&gfx {
>>> +       status = "okay";
>>> +};
> So you're using the BMC display device?
Negative.I'll remove this node.
>>> +
>>> +&kcs3 {
>>> +       status = "okay";
>>> +       kcs_addr = <0xca2>;
> This is the old binding for KCS. Please update it to the newer style
> with the "aspeed,lpc-io-reg" property.
>
>>> +};
>>> +
>>> +&kcs4 {
>>> +       status = "okay";
>>> +       kcs_addr = <0xca4>;
> as above.
Will modify.
