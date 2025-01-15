Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4DBA11D71
	for <lists+openbmc@lfdr.de>; Wed, 15 Jan 2025 10:23:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YY0sP2rXpz3cVn
	for <lists+openbmc@lfdr.de>; Wed, 15 Jan 2025 20:23:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=141.14.17.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736932982;
	cv=none; b=WWAdWYLhhivezkq/5qTN7CCZXb3EEtImVqs32ALoWt2qMnHj35lDPjC7sxJujYme/ZdUhVEyfQcF3bTS1B1N31ezevESdfJAUnL8pj7quJ+W5TwsbkQ8FYnt2ZgmDem7M3VpeJ4W7AP3I+TdkVjnA0YobvOzliN/zpyroxcTu2uatFMrj3CXhY2Qaen39qiABITcf/7Cs5mM+hYEDvlt7BZIeXv8iI8Y9ovxPoum+NawUohJOtXRJGfadppyMYkH5Ihi0UQaD++0ZS2gqkDeG0KdwpM/bs3qxN6cHSj8CaKEUvY5sU9P03PgGcWjez/Z0qiYLJjYZJjP62QK3QOg8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736932982; c=relaxed/relaxed;
	bh=KX1cl8kFkV6v3FlomDcouieETC7cwlRt/6lNc9r/WBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YCWvy2aTlZMkvXsUOn4chG+IJO5SskWn1Xw5UepuUErIZs+SRes7JgOWPWfs0uNHkAJCPw+0dRcgFGL/3sDKxyM661SLIk2kuCVJspsjCexJ1oCzCLcZhGDc5hSctFI5Wx/vclXb8LYCv9qXam5+IgmMY+4h6XPrHYcnDrvAtcCu8xiP+GIhVDQMjO3A9l/k30YeK0IoCy59LirVJlLS7KjuYsL/LzaRmlz7W1odtx5WsBkZfVuN8lBLulQla9puK62YthRKl8K7NB9WPF38SJVRYLgTdZhtYbwLs3E+P8DIq9eSkTYYUmWvou+3YL+vtx5bK0Zj0/S/wkLaj69ceA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org) smtp.mailfrom=molgen.mpg.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org)
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YY0sK2s66z30Jc
	for <openbmc@lists.ozlabs.org>; Wed, 15 Jan 2025 20:22:59 +1100 (AEDT)
Received: from [192.168.0.2] (ip5f5af1b4.dynamic.kabel-deutschland.de [95.90.241.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 9D6D261E64783;
	Wed, 15 Jan 2025 10:22:10 +0100 (CET)
Message-ID: <990a3fc9-7fd6-49b6-8918-d5bf4ae48953@molgen.mpg.de>
Date: Wed, 15 Jan 2025 10:22:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 3/3] net: stmmac: dwmac-nuvoton: Add dwmac
 glue for Nuvoton MA35 family
To: Joey Lu <a0987203069@gmail.com>
References: <20250113055434.3377508-1-a0987203069@gmail.com>
 <20250113055434.3377508-4-a0987203069@gmail.com>
 <a30b338f-0a6f-47e7-922b-c637a6648a6d@molgen.mpg.de>
 <2cf758f2-529e-4ccd-9dc1-18fc29ad5ac0@gmail.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <2cf758f2-529e-4ccd-9dc1-18fc29ad5ac0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: Andrew Lunn <andrew@lunn.ch>, alexandre.torgue@foss.st.com, edumazet@google.com, schung@nuvoton.com, yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org, openbmc@lists.ozlabs.org, joabreu@synopsys.com, kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org, richardcochran@gmail.com, ychuang3@nuvoton.com, peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, davem@davemloft.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Joey,


Thank you for your prompt reply.


Am 15.01.25 um 10:03 schrieb Joey Lu:

> Paul Menzel 於 1/14/2025 9:49 AM 寫道:

[…]

>> Am 13.01.25 um 00:54 schrieb Joey Lu:
>>> Add support for Gigabit Ethernet on Nuvoton MA35 series using dwmac 
>>> driver.

[…]

>> Also, please document how tested the driver. Maybe even paste new log 
>> messages.
> 
> These are the kernel configurations for testing the MA35D1 GMAC driver: 
> ARCH_MA35, STMMAC_PLATFORM, DWMAC_NUVOTON.
> 
> I'm not sure if this information is sufficient, so please provide some 
> guidance on what else I should include to meet your requirements.

I’d be interested on what hardware you tested it. Probably some 
evaluation or customer reference board.

> I will include the log messages at the end of the email.

Awesome. Thank you. Personally, I also like to see those in the commit 
message.

>>> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>>
>> As you use your company email address in the AUTHOR line below, please 
>> also add that email address to the commit message (and maybe even as 
>> the author).
>
> I will update the AUTHOR to use my personal email address instead of the 
> company email.

Understood. (yclu4@nuvoton.com is also personal, but the Gmail address 
is private, I guess. ;-)).

For statistics, how companies contribute to the Linux kernel, having the 
company address somewhere would be nice though, as you are doing this as 
your work at Nuvoton, right?

>>> ---
>>>   drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
>>>   drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
>>>   .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 179 ++++++++++++++++++
>>>   3 files changed, 191 insertions(+)
>>>   create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

[…]

> log:
> 
> [    T0] Booting Linux on physical CPU 0x0000000000 [0x411fd040]

Out of curiosity, how do you get these timestamps T0, T1, …?

[…]


Thank you and kind regards,

Paul
