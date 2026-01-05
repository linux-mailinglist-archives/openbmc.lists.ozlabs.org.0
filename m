Return-Path: <openbmc+bounces-1087-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 41611CF18EC
	for <lists+openbmc@lfdr.de>; Mon, 05 Jan 2026 02:19:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dkxKw60Yhz2xqk;
	Mon, 05 Jan 2026 12:19:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767575988;
	cv=none; b=Z7gB75RuEkVV1+c6rmE5oiFSmtYUuIj7LAAhz0VBinH78YWPCdZUUjG5G5Zr4gdSA8LqX7c85/QhU7QtQbG2K1JR3tMXbqn+a3ztJ/XxConAtfiVJCdicnhi8mo/ZjlEteGqAawvLhLC4UTtEDvFgoLWzR74evvv2ToMvER18+JAu/zoKXRsbXzTjq6dZyRtaDPVLrF1RFrl51QkrX9W7sOB3ipix1qIuYtOBVdsG4euJ3Ag7A5b0zFfdIvNVe0FGGuxqOhSWnXsUFBv2B8evghRbudRJgWc+1Rs2jrH81aZI+dc3qg2PIZfgrl23Gnlf9vf+YaxuHcp1TECuQwPKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767575988; c=relaxed/relaxed;
	bh=pZJXqr1shDOJNTqRYSFVIu1Zdtd7/8R285rGmkkRm1E=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=W6crT09Lt8iuWhmeFYyGosQoJ5NlnbVJc2JxBMIodTgzHmaQ3pkhj/8Xv3vT5WsmUdO41vEPRqq35qSPf494IrAI7m5/CF7ZHybE/H8h8nBbKYXZP3SRZUJ+lqfygClyX6vshac/w9mKXAXrzu7fGfKw2d94WOzT9/nI9RAl5qMqU9Ycn0Z9MkDhafT1A0qz0Up0q3dV/DORR/ugN7EyohHqirrQNThR2gb6IhoBoqOlmuHlROWKuC8+w3VI2hRQUBf0zT5t8PsmNCt1Xqm2AfJAFiyTQ2s9vqTd3OiN4tWW7/a8aYGg18aqNIQfJzwtI9uJUmeCVqnwe3RXOc+hgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=infradead.org; spf=none (client-ip=198.137.202.133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=198.137.202.133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dkxKn2b40z2xqG
	for <openbmc@lists.ozlabs.org>; Mon, 05 Jan 2026 12:19:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=pZJXqr1shDOJNTqRYSFVIu1Zdtd7/8R285rGmkkRm1E=; b=AKRq+C0RidbJ2ebH1AwJJaiFtO
	8KWAnzMMb5j2/RD+jEWnlyhtwoMIEpAqesaCl2mj+Bgr79rcXC2iLY4X8UoUZ1J6ZcERcRLZf/1Mr
	Qj9AvTYMuYYMDIchA/83TyX753gWfZ5EHQHWWsZhznwSoZHN6XQ9mSMXkqJBZRxUOF8JjK7kxTjy8
	YRYm5cRRxcqihc4WnIbQJI4hdpLFCyLFM5d6xhV3rSlhTjcSnziwDYdjnr6V0QQi5WmSmqCxg8qg0
	JaNWJvB4I8S7f1CbEKaO5cHJ++lZok1J0rNm2fPDugTXr2azRdsHFhVo21Rw9ChmdPDMCgZBM4Cj0
	TJFOwEpA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcZDf-0000000AbSy-3tej;
	Mon, 05 Jan 2026 01:17:16 +0000
Message-ID: <eb7c246a-6c5f-4d8d-bc96-2a71ece2e042@infradead.org>
Date: Sun, 4 Jan 2026 17:17:14 -0800
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [Linux-stm32] Kconfig dangling references (BZ 216748)
To: Antonio Borneo <antonio.borneo@foss.st.com>, Arnd Bergmann
 <arnd@arndb.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: linux-sh@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 andrew.jones@linux.dev, Paul Cercueil <paul@crapouillou.net>,
 Max Filippov <jcmvbkbc@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev, openbmc@lists.ozlabs.org, x86@kernel.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Kocialkowski
 <paulk@sys-base.io>, linux-sound@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-mips@vger.kernel.org, asahi@lists.linux.dev,
 Srinivas Kandagatla <srini@kernel.org>, Jonathan Cameron <jic23@kernel.org>
References: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
 <5e335232-89b4-4c35-93bd-efad7e4d8995@app.fastmail.com>
 <0220ec0592b6ef8936c25cffbc6cbfa0539fb71a.camel@foss.st.com>
Content-Language: en-US
In-Reply-To: <0220ec0592b6ef8936c25cffbc6cbfa0539fb71a.camel@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 12/8/25 1:48 AM, Antonio Borneo wrote:
> On Mon, 2025-12-08 at 09:55 +0100, Arnd Bergmann wrote:
>> On Mon, Dec 8, 2025, at 03:04, Randy Dunlap wrote:
>>> from  https://bugzilla.kernel.org/show_bug.cgi?id=216748
>>>
>>> The bugzilla entry includes a Perl script and a shell script.
>>> This is the edited result of running them (I removed some entries that 
>>> were noise).
>>>
>>> I'll try to Cc: all of the relevant mailing lists or individuals.
>>>
>>> ...
>>>
>>> MACH_STM32MP25 ---
>>> drivers/pinctrl/stm32/Kconfig:58:       default MACH_STM32MP25 || (ARCH_STM32 
>>> && ARM64)
>>
>> This was likely intended for 32-bit kernels on 64-bit STM32MP25
>> chips, which we don't support. I think this can go.
> 
> Yes, I fully agree!
> 
> I have a series pinctrl stm32 to be rebased on v6.19-rc1 and I can include the
> drop of MACH_STM32MP25 inside it.

and what about this dangling symbol?
arch/arm64/Kconfig.platforms:375:	select ARM_SMC_MBOX

It was merged with ARCH_STM32 in
9e4e24414cc6 ("arm64: introduce STM32 family on Armv8 architecture")

Same answer as for MACH_STM32MP25?
If so, Antonio, can you take care of that one also, please?

thanks.
-- 
~Randy


