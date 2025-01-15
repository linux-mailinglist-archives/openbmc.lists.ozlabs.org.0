Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC4CA12F58
	for <lists+openbmc@lfdr.de>; Thu, 16 Jan 2025 00:43:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYMy30hSVz3fpZ
	for <lists+openbmc@lfdr.de>; Thu, 16 Jan 2025 10:43:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736932156;
	cv=none; b=aCN7SQSeZSQqjFUQu6RbJbQgRGw2YEV9Zy87P+3HPpT0sL4Ea1LQcg6KJaz7ZzRZ4OfrwLtggMpbS1dqSqys0CPr/OI69I7RGc4CdorMm2UCT/LUcur6eHJucU6YBWZaCYSMlkqKdui6xtjmI4Eme9G8Ek2cnpVMvW2fKnDwj6fBeyjVcw296FLELyp4nygBwCbocCyVuzexTbZhDBVz17B4HgFRu1aLm899oJaUzMJUROPX82oS4vRugjvYVGmaZ7xj+HTsxxz8wlPzut5S8KN9iDlu49M1qKfZEO3OCDpTv5u2ICqTcFkrYDTOWvo1AxmuR72fEXiT/nZfm5c+3A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736932156; c=relaxed/relaxed;
	bh=GZu3RRCSZ6fAo+lWLsGDi7lH9XSyk6eapVHs6gKrrgo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HxxuSU2bQVC96pZSwROPMmJCVqJf/S4X85s6JY4JkRXQYKtp8nd9SkCsvce4lqNvaUS8MfOyRdaUecoLRTlCWWacnSbtkAvx4SRKtGxR6w5odn/NzYjj5sPM3UXd4Ark0SZShSiIp6y5kwoezjgtzBUYh4Rdt952ZINBBpxgnbsVAszedc50ddj/iloLXDldWCoX/kIvV8e3pU1BHQS35tJ8cdKxnrBZdmPRMqtnjN9rpZbgcTsikPXTag7qtc2V52rZffrALjKthOWioCaw0ZSmOPAl1kpIykGywxz5zXw0m1h5sACTdzQwZ/lzulSTJOhyElyQoq5yMtBOYfejUA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=L1uimcae; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=L1uimcae;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YY0YR5cTdz30DD
	for <openbmc@lists.ozlabs.org>; Wed, 15 Jan 2025 20:09:15 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-216728b1836so113072475ad.0
        for <openbmc@lists.ozlabs.org>; Wed, 15 Jan 2025 01:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736932154; x=1737536954; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GZu3RRCSZ6fAo+lWLsGDi7lH9XSyk6eapVHs6gKrrgo=;
        b=L1uimcaeKznEztGP4YtMB32JZbA/QAcFlsalDh2dPY8atIYmlvwlrMkKWHdMMS5LSo
         kHdPoyySCyrOqGYRHFjxjsmrEmxF75fJkG9bVV2Q30OACv+AFFcyFss8l++VyRLQSuVk
         zrbwqpjTbTe05LRmx5X1PbL5p8Kp5zIuJHuBPY2wTkqFgYFdaqiF24yX+LK9xLAzV5Bn
         x3sBxAImHOa3s9qJbQV8dbeb/arTz0deXRiN7Bi0rqhix3uoo4L5vPL3LPvTPfKsBKj0
         wrKWuIV9YLmtoQZvroJL6I0oQZqfLunoHZe1xucIETW7LKa4RjGEElXWKQXwo1xjCQfm
         yHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736932154; x=1737536954;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GZu3RRCSZ6fAo+lWLsGDi7lH9XSyk6eapVHs6gKrrgo=;
        b=v+AE75YxxE0gum6c5tqRJcx4Nf60PR1ojZ0wCbfrizkZxnjeGGy7oq3O+8JJz5yODK
         lc0RTb6JMSKSFA9IGzUWWo+KYpfm+IHbYAr4cgpZh49psMJL2opPF7fWqXEMdPNPV6k7
         HtOL8bX4H62pBSzPzX0y/BUNxORmtJ/zUlR9wbHmEqgo6v8gjk8Qd5DVRltM0vaHHdhy
         TBgw5GwRmmS6SvUVhmX9T/qZZ+PLSG50pTuEKRuntQ4n7RNWFZvI5tVfl1um88osMIuk
         vnzBYRA0NWxCNyUI1HdQNfEpaey5CPmni2l1aSWvzIfO8Lgzijh4VxyBroveZBr8VyYE
         ckkg==
X-Forwarded-Encrypted: i=1; AJvYcCWDIoHPITDpPikEENTgTbSwSuSvtyMszLCd5TbqN7fDf/yoM00OPXaYKP3H6m/6SLrikb03Ur7E@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxU9molOPcj1x61Df7bWuob2x/bvPc7ygyzzxUQ2nMr63fxdFFg
	gnMNfmdmlb+gJo3urD67gBh7mtjJEQ7m+pouFDlMFnLpk9y4mEND
X-Gm-Gg: ASbGncvtUDAe9o1t4b26lsOOF7bUQ+5mjBl1TXeN5JwlomJv9GU+ar04yZ0RVXasY8Z
	c+8ERHCF84DnL3xV4qaRwRh50VEM5X4KmEtKwBLvKlfKs8fehcwrZjnqZ58bKl0HCA9rP3K3Ksu
	bogB0mmO+dFiVh53yNCnuRyQ5TAQm07UB+dz8Pk+yJKeE5Lvwru62cVexxFPKSIHlaO7BPQRSKJ
	ndC9uD+1rhYE+NnyyXSukX+MqsOXJ1QdTAihBRpuFgYManEh6HxOKGxFUvRNDcM1Pbqks+bHbUA
	JrvKz9mn/BQgGN7RxAvRA5Ykrr3NPqnSC1A=
X-Google-Smtp-Source: AGHT+IFzyRepggFFHtQT8D4fkFN2tkBOOiPSmaRhjKsx+myOrF3U4xxdVBjzw1AHpDW/+2qMjfDQIg==
X-Received: by 2002:a17:902:e747:b0:216:3c2b:a5d0 with SMTP id d9443c01a7336-21a84002a70mr352529525ad.51.1736932153585;
        Wed, 15 Jan 2025 01:09:13 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f21a21csm78826285ad.109.2025.01.15.01.09.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 01:09:13 -0800 (PST)
Message-ID: <72e993f1-bb8d-43fb-a9cd-210f1f8f02c5@gmail.com>
Date: Wed, 15 Jan 2025 17:09:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 3/3] net: stmmac: dwmac-nuvoton: Add dwmac
 glue for Nuvoton MA35 family
To: Jakub Kicinski <kuba@kernel.org>
References: <20250113055434.3377508-1-a0987203069@gmail.com>
 <20250113055434.3377508-4-a0987203069@gmail.com>
 <20250114153323.527d4f63@kernel.org>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20250114153323.527d4f63@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Thu, 16 Jan 2025 10:43:15 +1100
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
Cc: Andrew Lunn <andrew@lunn.ch>, ychuang3@nuvoton.com, edumazet@google.com, schung@nuvoton.com, yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org, openbmc@lists.ozlabs.org, joabreu@synopsys.com, pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org, richardcochran@gmail.com, alexandre.torgue@foss.st.com, peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, davem@davemloft.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Jakub,

Thank you for the reply.

Jakub Kicinski 於 1/15/2025 7:33 AM 寫道:
> On Mon, 13 Jan 2025 13:54:34 +0800 Joey Lu wrote:
>> +	regmap_write(bsp_priv->regmap,
>> +		     macid == 0 ? NVT_REG_SYS_GMAC0MISCR : NVT_REG_SYS_GMAC1MISCR, reg);
> This is a pretty long line and you do it twice, so save the address
> to a temp variable, pls
Got it!
>> +MODULE_LICENSE("GPL v2");
> checkpatch insists:
>
> WARNING: Prefer "GPL" over "GPL v2" - see commit bf7fbeeae6db ("module: Cure the MODULE_LICENSE "GPL" vs. "GPL v2" bogosity")

Understood. I will fix the warning.

BR,

Joey

