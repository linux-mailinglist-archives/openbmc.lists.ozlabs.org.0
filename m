Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E16E63834C
	for <lists+openbmc@lfdr.de>; Fri, 25 Nov 2022 06:01:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NJN4z4tPBz2yHc
	for <lists+openbmc@lfdr.de>; Fri, 25 Nov 2022 16:01:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=YWx0Y5rM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=free.fr (client-ip=212.27.42.1; helo=smtp1-g21.free.fr; envelope-from=daniel.lezcano@free.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=YWx0Y5rM;
	dkim-atps=neutral
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGcPr5Xd3z3bc5
	for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2022 19:10:23 +1100 (AEDT)
Received: from [192.168.10.46] (unknown [130.180.211.218])
	(Authenticated sender: daniel.lezcano@free.fr)
	by smtp1-g21.free.fr (Postfix) with ESMTPA id A0B24B0055A;
	Tue, 22 Nov 2022 09:09:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1669104619;
	bh=QqT0gBw0xLVZALCHaBpNFHcCmr+fibAnqkfvXhxig94=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YWx0Y5rMecZm8dj2aaa9zKoRmXYW5RDTj3g3ZoslU9YoIxwdmfC5fpn3uPG9kMJd0
	 mDCTXhUrqMfDCOKwrRh1D4dnnYENzRfbDZVY39jUVIUGGhPkphxJ2s5WfvP0PuY7x1
	 lZc/rYX6wVO4lgWIZuuWcI/Rl3BUT+wRqqhFSEEjXHZNLYsv0+MXPIB4HONnnZm1z/
	 DUpYtzOwj91El8w3ugBL/7+i/3VCa8PEQRrjQhjY9GJr69DDaSIjhqJ7BBx+Gdp3rp
	 rM8Y8eXL1FgKO/4MSrdRa0Ps/X0QDB5esiDpeurpx66fWzo5hIXDoMnRq0YiZgqb6M
	 jljMVQkHGOdpQ==
Message-ID: <69a959d4-6058-de70-e1c7-15d81b33373c@free.fr>
Date: Tue, 22 Nov 2022 09:09:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 0/6] Nuvoton WPCM450 clock and reset driver
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?=
 <j.neuschaefer@gmx.net>, Stephen Boyd <sboyd@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>
References: <20221104161850.2889894-1-j.neuschaefer@gmx.net>
 <CACPK8XdXrAPMdnn0T6GQiYEK3R4MvwprOZu_Yvmv=WVOfivROg@mail.gmail.com>
From: Daniel Lezcano <daniel.lezcano@free.fr>
In-Reply-To: <CACPK8XdXrAPMdnn0T6GQiYEK3R4MvwprOZu_Yvmv=WVOfivROg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 25 Nov 2022 16:01:27 +1100
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
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>, linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, linux-clk@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 22/11/2022 02:40, Joel Stanley wrote:
> On Fri, 4 Nov 2022 at 16:21, Jonathan Neuschäfer <j.neuschaefer@gmx.net> wrote:
>>
>> This series adds support for the clock and reset controller in the Nuvoton
>> WPCM450 SoC. This means that the clock rates for peripherals will be calculated
>> automatically based on the clock tree as it was preconfigured by the bootloader.
>> The 24 MHz dummy clock, that is currently in the devicetree, is no longer needed.
>> Somewhat unfortunately, this also means that there is a breaking change once
>> the devicetree starts relying on the clock driver, but I find it acceptable in
>> this case, because WPCM450 is still at a somewhat early stage.
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
>>
>>
>> Upstreaming plan (although other suggestions are welcome):
>>
>> Once reviewed,
>>
>> - The ARM/dts changes should go through Joel Stanley's bmc tree
> 
> I've picked up the standalone patch ("Add clock controller node").
> 
>> - The clocksource/timer changes should probably go via Daniel Lezcano and TIP

I picked the timer change along with the binding
