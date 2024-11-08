Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE529C34E8
	for <lists+openbmc@lfdr.de>; Sun, 10 Nov 2024 23:03:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XmmsC6b2Zz3bmJ
	for <lists+openbmc@lfdr.de>; Mon, 11 Nov 2024 09:03:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731036256;
	cv=none; b=VF2nfj5pSH/R5PYLTAw3HBxlk2HYES1enSplAcNH5Nc08XFialKSHD4odB0qvk+M4pXV01s76GrZLBllV8FNuoRrz7Cw7tH0846lkg1WV9eujvJas/u/cMsf3w2TevndbreS4wcCYpIKCO0annK/nB6TrTZSDM2rdsIYhbyM2VCFyRqTC5LteRQ6qyfOSBq865ptJ2znsY5ZvcJMzFikQ/8qmVx2i3aiwKnETVH1W/weJ2k0BwTkxlLJGstjgoB7siNfHfoRzJ6nesMz3gWbpXzfdvMCwdsz0VtXf/k1DMEZPcGTzwZpNt6zZ5ErG1tbPTTNng4GzB2MTfYWJ96k3A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731036256; c=relaxed/relaxed;
	bh=FiQi+zVrti/4lwYHeXMzDjh6Y9tSUZHidpZ6r5DzMFs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oiXiUuPFo/dhvLEzRiVZ+3/p0NQKV9WmylN8ciBdEqn/mD7F7pjxRam1patZLHmyzQO1VHhsH4XF1fSxlBAjfd2IYuTifQZ++2VEETvv+fnFlc43X4WhMhXo4rhX8M90zKROMsgPjCKwn7aO+aqCothDOVa5OH6qeu1a5328OQb+LCYpCTjWxVOzN9MI0D9LSrpHV/Ocnl9B2F05EMiucbkoQH4aYcmMN7Pb5tkErg7piH+Y4xtpIzBFj8Jt39UYudKr6ktgD2sqlZSYULi/ltafVIW0Ke7lv78Xhm8yvk8SAc1QCnZxFVfAXpIqAh8C6aXcU+BKRcF8rkysWC3E/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GXhC7s4w; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GXhC7s4w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xl46k3RgFz2yxP
	for <openbmc@lists.ozlabs.org>; Fri,  8 Nov 2024 14:24:13 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-720aa3dbda5so1223551b3a.1
        for <openbmc@lists.ozlabs.org>; Thu, 07 Nov 2024 19:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731036251; x=1731641051; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FiQi+zVrti/4lwYHeXMzDjh6Y9tSUZHidpZ6r5DzMFs=;
        b=GXhC7s4wEccaA2p7BD6Q/4ClN5iChVVG2zhv3bn7oDzqx/kuKS2lw7E3QmdzV6IpkX
         Zdw9POVOjr/WuFZd+hUHxypdJIknyT7K+2K39NiWykuVr0Kurg7OvNcHUXyJaL6L7oz8
         H6qOQy8q02DPQky6NBjpnJbXvJQYqy2b2G4zQ9ZPVSyXPQWQuz6TufDSyBT0WNlKPPJi
         TJeWiAEK1q/MAT1gWJnUql1m5H1n8xD8170lFMXmSye22C3RCW7d4OseIrZEyfFU3FAf
         AN8h8d+PMeLVxA1rYElREM7K8wAGRTuJ7NFj0PAp+APejQ76R6Yi4MSw29sVpgooPGSJ
         m+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731036251; x=1731641051;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FiQi+zVrti/4lwYHeXMzDjh6Y9tSUZHidpZ6r5DzMFs=;
        b=ud+isEVpMdLTEbQxOlZiEw3cmbG9j2WAy8zF+KhNipdVVrrMc9uJ+8pNpl1SIdefyq
         UZrUCMsXBvRIpbUYpF+q6GaU2qoSGZt/1bwKOA5iBUdv7jado19QfX0ANj1HYj/PlUBl
         bS4QzIx+qb2WJ7dtXQmpgWbLIadZ2Cn9yv19RR81hYvRdfqVMt9PslURDGRH9RxTLezv
         +5BsA90EYZ1mmXTaN2JlXRqD5zTZ6Tu3nHBCnDk7B2KKTxXuM4msTYkBZj1V9H2xvYK9
         afTv9fip8EufGDBrIXolxGmPC1qN4Gul6V4EAAtVGelll3G0u07WsAzxo6UvwXjkLmz5
         bx2g==
X-Forwarded-Encrypted: i=1; AJvYcCX8olC5OVs2oQPc42M+L8CV1FfM1Fkg/wdhWwAwtDmL77Uc29LmPPoJ+BPtlX/wafO2RNhoqoK+@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyzcmr9UCaPOKQuaLhHF8MV2zeCd3LwblL2dfocHeHENQDnp/I8
	QIzCT7Isut8c2vCHLtGPLUlCxOsbAdo/EUxIGLVCBccIJLw3Hnjg
X-Google-Smtp-Source: AGHT+IEuCqDHEhTNFZCpyyg20d0b3Zu/p1XC6BTzBjuWov+1G8DqVUKH6K6wMKylQPRL5ggF5yB5RQ==
X-Received: by 2002:a05:6a00:1a89:b0:71e:4ee1:6d78 with SMTP id d2e1a72fcca58-7241327a424mr1559577b3a.1.1731036250950;
        Thu, 07 Nov 2024 19:24:10 -0800 (PST)
Received: from [192.168.0.104] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7240785fbe9sm2556540b3a.37.2024.11.07.19.24.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 19:24:10 -0800 (PST)
Message-ID: <7a476087-9efc-4271-bd2c-d04a0c1d0dff@gmail.com>
Date: Fri, 8 Nov 2024 11:24:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton
 MA35 family GMAC
To: Conor Dooley <conor@kernel.org>
References: <20241106111930.218825-1-a0987203069@gmail.com>
 <20241106111930.218825-2-a0987203069@gmail.com>
 <20241106-bloated-ranch-be94506d360c@spud>
 <7c2f6af3-5686-452a-8d8a-191899b3d225@gmail.com>
 <20241107-slip-graceful-767507d20d1b@spud>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20241107-slip-graceful-767507d20d1b@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Mon, 11 Nov 2024 09:03:25 +1100
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
Cc: robh@kernel.org, conor+dt@kernel.org, linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, netdev@vger.kernel.org, richardcochran@gmail.com, ychuang3@nuvoton.com, alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, edumazet@google.com, joabreu@synopsys.com, linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com, schung@nuvoton.com, kuba@kernel.org, krzk+dt@kernel.org, pabeni@redhat.com, davem@davemloft.net, yclu4@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


Conor Dooley 於 11/8/2024 1:09 AM 寫道:
> On Thu, Nov 07, 2024 at 06:15:51PM +0800, Joey Lu wrote:
>> Conor Dooley 於 11/6/2024 11:44 PM 寫道:
>>> On Wed, Nov 06, 2024 at 07:19:28PM +0800, Joey Lu wrote:
>>>> +  nuvoton,sys:
>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>>> +    description: phandle to access GCR (Global Control Register) registers.
>>> Why do you need a phandle to this? You appear to have multiple dwmacs on
>>> your device if the example is anything to go by, how come you don't need
>>> to access different portions of this depending on which dwmac instance
>>> you are?
>> On our platform, a system register is required to specify the TX/RX clock
>> path delay control, switch modes between RMII and RGMII, and configure other
>> related settings.
>>>> +  resets:
>>>> +    maxItems: 1
>>>> +
>>>> +  reset-names:
>>>> +    items:
>>>> +      - const: stmmaceth
>>>> +
>>>> +  mac-id:
>>>> +    maxItems: 1
>>>> +    description:
>>>> +      The interface of MAC.
>>> A vendor prefix is required for custom properties, but I don't think you
>>> need this and actually it is a bandaid for some other information you're
>>> missing. Probably related to your nuvoton,sys property only being a
>>> phandle with no arguments.
>> This property will be removed.
> I'm almost certain you can't just remove this property, because you need
> it to tell which portion of the GCR is applicable to the dwmac instance
> in question. Instead, you need to ad an argument to your phandle. The
> starfive dwmac binding/driver has an example of what you can do.

Yes, I will use this method instead.🙂

mac-id and tx/rx-delay will be arguments of syscon.

Thanks!

