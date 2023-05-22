Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC2070C494
	for <lists+openbmc@lfdr.de>; Mon, 22 May 2023 19:45:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QQ4bH1hBnz3f6B
	for <lists+openbmc@lfdr.de>; Tue, 23 May 2023 03:44:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=CbtRPseU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wanadoo.fr (client-ip=80.12.242.26; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=CbtRPseU;
	dkim-atps=neutral
Received: from smtp.smtpout.orange.fr (smtp-26.smtpout.orange.fr [80.12.242.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QQ4Zg3CyPz30QQ
	for <openbmc@lists.ozlabs.org>; Tue, 23 May 2023 03:44:24 +1000 (AEST)
Received: from [192.168.1.18] ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id 19Siq1SEJ0h9k19Siqvch6; Mon, 22 May 2023 19:36:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1684777010;
	bh=N2xeMMt507hgLYLfEZ8Hr/iAkxhU2Bot31n27SNKL3Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=CbtRPseUNMnLVW7YNBpro4cTwHUAf10/+3NYlms9nzDozd9I4w3nY0HrMVDunCe50
	 n7ytgccw3z8ursUZ4gnbmIlaau/el9jLxWoMa3JAdrNHRqGGrLM2RV1vCLwJQP5G7N
	 uIhwHemIzNXHY1L95+fQuiIm0rpXrbfG01s6cVKc/UUF/OiBOZzDXl414J5LadVLm5
	 wbQZ/hsdQlJjpR3QyUh3X6HFdg4G52NVaG5wb278n0+ZoEIsmFgl2Z1CJiHLC4JOOq
	 Ka7mqKyL22nKz3QJnnKU3Usiz4vBPfB20Nmtpxn3gxbIFh3UaCCb2Xy362H52FAgzh
	 RQbUnvMieiQfA==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 22 May 2023 19:36:50 +0200
X-ME-IP: 86.243.2.178
Message-ID: <fa7a8bc4-d1a1-3b1a-8b9e-618681d281dd@wanadoo.fr>
Date: Mon, 22 May 2023 19:36:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v16 1/1] clk: npcm8xx: add clock controller
Content-Language: fr
To: Tomer Maimon <tmaimon77@gmail.com>
References: <20230521143202.155399-1-tmaimon77@gmail.com>
 <20230521143202.155399-2-tmaimon77@gmail.com>
 <0e72c35f-5d9d-45a7-5f85-3971b8029106@wanadoo.fr>
 <CAP6Zq1jOSKpzFvto1LMs=JftLK0fxrrg+73Sh34GunuLfcAfEA@mail.gmail.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <CAP6Zq1jOSKpzFvto1LMs=JftLK0fxrrg+73Sh34GunuLfcAfEA@mail.gmail.com>
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
Cc: benjaminfair@google.com, sboyd@kernel.org, venture@google.com, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, avifishman70@gmail.com, joel@jms.id.au, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Le 22/05/2023 à 14:56, Tomer Maimon a écrit :
> Hi Christophe,
> 
> Thanks for your comments
> 

[...]

>>> +static struct clk_hw *
>>> +npcm8xx_clk_register_pll(struct device *dev, void __iomem *pllcon,
>>> +                      const char *name, const struct clk_parent_data *parent,
>>> +                      unsigned long flags)
>>> +{
>>> +     struct npcm8xx_clk_pll *pll;
>>> +     struct clk_init_data init = {};
>>> +     int ret;
>>> +
>>> +     pll = kzalloc(sizeof(*pll), GFP_KERNEL);
>>
>> Everything looks devm_()'ed in this driver, except this kzalloc.
>> Except the one below, there is no kfree to free this memory, and no
>> .remove() function.
> Also  clk_hw_register_divider_parent_data doesn't use devm_
> about free the pll, we use it, return at the end of the function.
> about adding remove, we had a dissection about it in V4, since the
> clock is a service driver it shouldn't be removed.
> https://patchwork.kernel.org/project/linux-watchdog/patch/20220621131424.162355-7-tmaimon77@gmail.com/

LoL.
At least, I'm consistent :).

Just to make it clear, what I mean about kfree() is not to add one here, 
but either:
    - to use devm_kzalloc() here, to avoid a leak, should loading the 
driver fails      OR
    - have some kfree() where needed (at least in the error handling 
path of the probe, if the remove function makes no point)

CJ
