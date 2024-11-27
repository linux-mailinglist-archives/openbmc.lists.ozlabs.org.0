Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 118569DAF57
	for <lists+openbmc@lfdr.de>; Wed, 27 Nov 2024 23:53:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XzF8C3SQ9z3bSh
	for <lists+openbmc@lfdr.de>; Thu, 28 Nov 2024 09:52:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732694525;
	cv=none; b=MWAlpPNdKLv8HzljX2SBfgULcSWm24djRlTg2WqMho7tDGt6PFCspyf+fahcMpe7KhWJvZ02DKx9zRm0K/TtSzwUThyZ3Sws0f5sraGonBEhoth5i9cRCcKUB5ytICOr+ELPlAOL2PI4xZAgL4T9LheAngEBxuJ6+AlaglFIOjWUNUjkNMEpzSeJRm13rlEILVAtD++IvzPovktzMXpSwjFby2/uaSY9tJEYT0Zj5abXp51BjvnC2d/dStppC/f/fH30MDhdRcBcmTOunf1S2JdhI+kclHrI9WxHqaJpISjEGSs7N5pdpdYyANxCUYajfcli/VZ3an3XtEdJkqufkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732694525; c=relaxed/relaxed;
	bh=bew/I5xXVZXMcMLGcr2bk1V3h79V/rlhudJAubnILnI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B6+TzEaOVI5EXaBCOrkSjlu/1w9l1gtOm52V8mTcs/2CQfeoVx7Ikn1qshwKOR1bJxjpIv4ppwcnmQkjOQyygFwI5HZ1tlEDNt+k+JgV/cmucrlOTlnZnW1uaqZY2Rm8xvw4EicXCT23CPgLshhpSL0IvzuwwX3Ph/KJjc1oCAwjT5EQw28l9qTRGSItclK52MmCPzwXLIGSkrD6OjzUPghFxdF/PXie0fXhIVtmErrqmOGNqKQIIJFISv0T9/CniZgxAg+THG0zsgjacZxQei9GXFZrH2I4azCF98lmjFgof185k9uO0QzPTPXzzM0tmrPE+ueuTCyrdeIdpyFdQA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OfhFL4Y0; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OfhFL4Y0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XysNX17pkz2xgQ
	for <openbmc@lists.ozlabs.org>; Wed, 27 Nov 2024 19:02:03 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2124ccf03edso65225225ad.2
        for <openbmc@lists.ozlabs.org>; Wed, 27 Nov 2024 00:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732694521; x=1733299321; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bew/I5xXVZXMcMLGcr2bk1V3h79V/rlhudJAubnILnI=;
        b=OfhFL4Y0rpVMEeQ2VF2R4/KYzy/DOVh1lgLQ9qcqpBydMkXfj8f5walvFDf1flEMTZ
         xGT5NhMhG6pLtyFaK2SlnPTAwtL2Nfb2du1yGwlOlYCPj5fEQczT9yW4vMQKZDL7hK88
         PLWP/RrR6agFxi8Nf3oifm9wog2zyiaRv0ps0XFT5DLZRoVMe+iWmdosuChXhh2BHhpT
         hZJ0x0gBSEV/VHjc48jGFtdDG9n937yp1U4xI7yTfmAn6UwTn2NpbY1etxisX3V1g20a
         Gg+r+4XiU8DDKqcAWBYP5lIQnbyVWzTRhoctJE+PvkjJ3hVPPU+GaXVz02eO/tWNsDtS
         FxYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732694521; x=1733299321;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bew/I5xXVZXMcMLGcr2bk1V3h79V/rlhudJAubnILnI=;
        b=nRh4AVykhqWbeQenvVy3/JmOyE2tNLwaefEHc65PYka+MMtWcsjXwdKas+zq7heBr/
         eF7Ni7Hw1sg6yFnBOKofxKMMLDapdZgF4K0GDteRx9K6yEkEd7WQ4hUPFPG/k8Ewux8+
         d1dNliKOd6NCxzxWYQv/CfcV/BvW/tXVKoR/j2IjT2mjdixf9uXL+PcyIwcZEqbPnsuz
         75xuoryJnLbcydZlApFAtAUa1YS3Hh4EcvNf93bJMnkCws9CTzzo1G9lXKczEvwkGufQ
         hjMM35fQXwG4yGsfy5UMWWVgWrOmWnTmGMpDZ9n5WXNRVp076JPNCAsmty9dM0fV9F2Q
         LseQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5oq0v2V8776MZ2M/Iz7tdt0yIv+1WuS5/yxocXz8iwYC3wuRaPh7Ogl/JQiNWqldcEDDgkl4x@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxl+8y7Fa/tO2RwFNTCA4lm8QJcp8hX8wS4qd/qtWyc7pc2vZfW
	GzMI/nz2XOJ+PymSJIJi5Wf9yh8Vp8fl6dm4RAuocvbwEab32zeu
X-Gm-Gg: ASbGnctHpkA5Swde/2Pyt8fccZ78bMeOop/3AlYAhiI4OkxG0CDBjQpxW8/52QvWW/t
	Gj90Eirb49+aa6B+YvwtNFBfpOAMFzfAYIYAHwGHvNsalzYlCpFZ/ECvJwz/fH+RdgWNLKidyED
	L2KG2Rmqkcu0k88cFvKjytHRGd91utrleuV0lvh362m5H1aqp35V5ICdQwkKBe5lAL3YtlgOjvT
	r0emOvkkSbhBP96t06hR6us7PkQ4GCy6wM5gMwbzl0ZgsGhoYoCUcjd+4E9+IJ7FX4B/EArPNiN
	0bX6svQX+GtF/+/tLd6ozK7uW1DP
X-Google-Smtp-Source: AGHT+IGtUIoISB0+clpN9PkK/2UFXTIykn3qm+m0cLDTT9iuNBtfEZ70ZERWyU6+cs55GUUZXZV4kQ==
X-Received: by 2002:a17:903:2b08:b0:211:e812:3948 with SMTP id d9443c01a7336-21500fedf8amr32131585ad.0.1732694521468;
        Wed, 27 Nov 2024 00:02:01 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129db8c783sm96580615ad.25.2024.11.27.00.01.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 00:02:01 -0800 (PST)
Message-ID: <6efc512e-b153-4f2c-8b38-4443024475ee@gmail.com>
Date: Wed, 27 Nov 2024 16:01:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] arm64: dts: nuvoton: Add Ethernet nodes
To: Krzysztof Kozlowski <krzk@kernel.org>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, richardcochran@gmail.com
References: <20241118082707.8504-1-a0987203069@gmail.com>
 <20241118082707.8504-3-a0987203069@gmail.com>
 <a220d407-de40-4398-a837-de11e01d2381@kernel.org>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <a220d407-de40-4398-a837-de11e01d2381@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Thu, 28 Nov 2024 09:52:40 +1100
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
Cc: devicetree@vger.kernel.org, ychuang3@nuvoton.com, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org, joabreu@synopsys.com, schung@nuvoton.com, peppe.cavallaro@st.com, yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Krzysztof,

Thank you for your reply.

Krzysztof Kozlowski 於 11/26/2024 6:08 PM 寫道:
> On 18/11/2024 09:27, Joey Lu wrote:
>> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
>> index e51b98f5bdce..2e0071329309 100644
>> --- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
>> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
>> @@ -379,5 +379,57 @@ uart16: serial@40880000 {
>>   			clocks = <&clk UART16_GATE>;
>>   			status = "disabled";
>>   		};
>> +
>> +		gmac0: ethernet@40120000 {
>> +			compatible = "nuvoton,ma35d1-dwmac";
>> +			reg = <0x0 0x40120000 0x0 0x10000>;
>> +			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "macirq";
>> +			clocks = <&clk EMAC0_GATE>, <&clk EPLL_DIV8>;
>> +			clock-names = "stmmaceth", "ptp_ref";
>> +
>> +			nuvoton,sys = <&sys 0>;
>> +			resets = <&sys MA35D1_RESET_GMAC0>;
>> +			reset-names = "stmmaceth";
>> +			status = "disabled";
> Status is always, always the last property. Please read and follow DTS
> coding style.
>
> Best regards,
> Krzysztof

Got it. I will fix these.

Thanks!

BR,

Joey

