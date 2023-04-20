Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD616E89A7
	for <lists+openbmc@lfdr.de>; Thu, 20 Apr 2023 07:40:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q261v04YNz3fB4
	for <lists+openbmc@lfdr.de>; Thu, 20 Apr 2023 15:40:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=ms43A3vQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wanadoo.fr (client-ip=80.12.242.26; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=ms43A3vQ;
	dkim-atps=neutral
Received: from smtp.smtpout.orange.fr (smtp-26.smtpout.orange.fr [80.12.242.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q261K2kKDz3cj1
	for <openbmc@lists.ozlabs.org>; Thu, 20 Apr 2023 15:39:46 +1000 (AEST)
Received: from [192.168.1.18] ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id pMtspF57ys9AgpMtsphukY; Thu, 20 Apr 2023 07:32:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1681968732;
	bh=KU6SygAo9wrYyP1Wz4HVdA9px6EJr9s5dwFgC2ZY388=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ms43A3vQ+pQ+pAlbk2OBKblTACNqvfI0PSM/FEncB49pAarAMsw2s7uEwYMe5XUW8
	 exj+vg+Uo9RXQwViV0MIyAskvf3GRu7IiaEA4KdWBypst50kE8baYcVfHa7aKOON3d
	 tgN7/LsoLdqo81TiOvw+28VIKyDjdxoVrJghCIquq10IkXgQ4g1Sw/RWpmkXgBSbAC
	 wI8RyFNHGQIsojrBPfHL+CEJpaTsIkvZezKni2uyYJvmiNER0czeDLIWlweHWsqDUs
	 CSJHLyvgkWBozLWeZY5TEGXkhE9YBUw7WzpaZIlzTmeeLRWpIm9lOw9UPwlGUiD2k/
	 u4XQJ+UsIJh+w==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 20 Apr 2023 07:32:12 +0200
X-ME-IP: 86.243.2.178
Message-ID: <1f1b088c-85d2-13ed-bbb1-043409dbe894@wanadoo.fr>
Date: Thu, 20 Apr 2023 07:32:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 2/2] clk: wpcm450: Add Nuvoton WPCM450 clock/reset
 controller driver
Content-Language: fr, en-US
To: j.neuschaefer@gmx.net
References: <20230415111355.696738-1-j.neuschaefer@gmx.net>
 <20230415111355.696738-3-j.neuschaefer@gmx.net>
 <c04038f2-b7aa-7c37-df93-6950831579f6@wanadoo.fr> <ZEBiuRH3DjVUO/Kp@probook>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <ZEBiuRH3DjVUO/Kp@probook>
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
Cc: devicetree@vger.kernel.org, wim@linux-watchdog.org, benjaminfair@google.com, avifishman70@gmail.com, venture@google.com, mturquette@baylibre.com, daniel.lezcano@linaro.org, tmaimon77@gmail.com, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, sboyd@kernel.org, robh+dt@kernel.org, tglx@linutronix.de, p.zabel@pengutronix.de, krzk+dt@kernel.org, tali.perry1@gmail.com, linux-clk@vger.kernel.org, linux@roeck-us.net, linux-watchdog@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Le 19/04/2023 à 23:52, Jonathan Neuschäfer a écrit :
> Hello Christophe,
> 
> On Sat, Apr 15, 2023 at 02:16:09PM +0200, Christophe JAILLET wrote:
>> Le 15/04/2023 à 13:13, Jonathan Neuschäfer a écrit :
>>> This driver implements the following features w.r.t. the clock and reset
>>> controller in the WPCM450 SoC:
>>>
>>> - It calculates the rates for all clocks managed by the clock controller
>>> - It leaves the clock tree mostly unchanged, except that it enables/
>>>     disables clock gates based on usage.
>>> - It exposes the reset lines managed by the controller using the
>>>     Generic Reset Controller subsystem
>>>
>>> NOTE: If the driver and the corresponding devicetree node are present,
>>>         the driver will disable "unused" clocks. This is problem until
>>>         the clock relations are properly declared in the devicetree (in a
>>>         later patch). Until then, the clk_ignore_unused kernel parameter
>>>         can be used as a workaround.
>>>
>>> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>
>>> ---
> [...]
>>> +	// Enables/gates
>>> +	for (i = 0; i < ARRAY_SIZE(clken_data); i++) {
>>> +		const struct wpcm450_clken_data *data = &clken_data[i];
>>> +
>>> +		hw = clk_hw_register_gate_parent_data(NULL, data->name, &data->parent, data->flags,
>>> +						      clk_base + REG_CLKEN, data->bitnum,
>>> +						      data->flags, &wpcm450_clk_lock);
>>
>> If an error occures in the 'for' loop or after it, should this be
>> clk_hw_unregister_gate()'ed somewhere?
> 
> Ideally yes —
> 
> in this case, if the clock driver fails, the system is arguably in such
> a bad state that there isn't much point in bothering.
> 

Ok, but below we care about freeing clk_data->hws in the error handling 
path.

Why do we handle just half of the resources?
Shouldn't it be all (to be clean, if it makes sense) or nothing (to 
reduce the LoC and have a smaller driver)?

CJ

> 
>>
>> CJ
>>
>>> +		if (IS_ERR(hw)) {
>>> +			pr_err("Failed to register gate: %pe\n", hw);
>>> +			goto err_free;
>>> +		}
>>> +		clk_data->hws[data->bitnum] = hw;
>>> +	}
> 
> 
> 
> Best regards,
> Jonathan

