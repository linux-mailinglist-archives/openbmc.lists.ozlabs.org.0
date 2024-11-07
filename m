Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3943A9C120A
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2024 23:52:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xky4B0hbYz3vjC
	for <lists+openbmc@lfdr.de>; Fri,  8 Nov 2024 09:51:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730975660;
	cv=none; b=NXfXRE72wZkHEaNiM2qfFed/1GHCUEjFXqdCaeCo7h/TSiqqystRCx8fTmunOjdaQM+bovi5EbzwMcDoJ01yu9nZiqQxRqs2WxacaT0D6QgYRFmtDd8MNUJvfTlbJtBhIPdF/dt8lURAd/y9CDccaCkpDqw+GyPU0fbIH7C5zfMdaELdgk9WXf6iTcAQwWceYFI4wnvOGvk+0xx1zUW8Z7I3HfwfjEf7pDjO6dPctCCEqO8HoXanUVlNyu/CtLcYwZY3/k2yEuAH/szhoPdTdGtfOz8ztzFwkoIX0l5gjMrWgjVfAmwD5gJ4t2V4uqIUcroTFw2Mh+Exj/WtzDFkQg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730975660; c=relaxed/relaxed;
	bh=qHCnQjwtQk6Ee4qEjCK4DR0rfCUXjzBPqylzEtsbdRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xf6qrsLbqozk3+RVJwJvgP67xE10geyR9PbsX8IGdPeIV6zTzq+ZR8Irp7CXMcppAPdt9wE0RjSGw0Ou/Agxa36JaepYEZZXAIyh645Zhrp6iysA+f81z88aR/BNL9fLRYxmj2FTpnLm27ePbuxbbpbeL/qgCnSOYu1doVtzNbWp95Bu4qiRNqxQD8+g78+413yfmIbXrqOc5/Bo882YWgWHV+fsrsejJUDAMnznCPQyEVLZQKPBEkVFw6zGhonTAYcKlQD7MR0sFsjBM6GV0SqGZfHnQ57nmrUTAnLWuCEH3+RQUeDY5HWTGDRkGo3SLxKlkX2eN1dNWGS/YEuYLg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GuEnNip4; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GuEnNip4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkdjR13gsz3bkY
	for <openbmc@lists.ozlabs.org>; Thu,  7 Nov 2024 21:34:18 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-21116b187c4so6962115ad.3
        for <openbmc@lists.ozlabs.org>; Thu, 07 Nov 2024 02:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730975657; x=1731580457; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qHCnQjwtQk6Ee4qEjCK4DR0rfCUXjzBPqylzEtsbdRg=;
        b=GuEnNip4TtzTpVnWQxVqJCYwdHOm33vmg8IB0iDsynnqfzvU9DBKs5c1vRwJGmeM//
         DxocC0hNBBvPILm4k2OU2kAOuk17rwlmn3oM/rVyhaPGl6XrGIohYNICiME7c64TO892
         cpB/Chp8+74gJP+vhlIKGRXPXWm/6ENAWoUONgKTfdGxdnwgTPuh1qhxhEc2fW2dbcEO
         BYspbZ8bxwmn+NDkFmHcBfocmS+x9FpaZfGhodSdYAKrsGLjkbz2El5i5qR6ZtcqHRMz
         zZ+vKQ3LwgDR+4aVOvvMa+WCTi0IWoWxOZ078C7y5ISsx3mLCWagnxGed6WIfj2Nxwek
         2PQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730975657; x=1731580457;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qHCnQjwtQk6Ee4qEjCK4DR0rfCUXjzBPqylzEtsbdRg=;
        b=YfSAYJuSYx8tK34noBWjzm/XZwFNsfx/e0Yb2Cnz6zLuIjim+GLDYgs2tDE2M4zTXH
         YQBjoegXBWbY5r4uZm+gZhttBHYGRvPOhlyvnrPcwzmw65nhhe8btmsRVuRYSEdc2wYe
         qvfgtLnXqHm65jdwB0EGY6KhBjVbRAqQ9M3Dz1G9lzMZtcT9qlHAfW6Pni+V/RweffZ4
         pVNEQK5KJdigzWXWRl1lWFpUKJ5OQuhoDLS8U3i92zon/wdxc4wQqpJPQMAuUvaB73WU
         bmGmtufkRJKHHWLyxtiPDSmuSAC6cNoOfa9dSQ8XMiZZm66Nk23JO7jh/EugkwOm4oCp
         IeWg==
X-Forwarded-Encrypted: i=1; AJvYcCXAlKcxGGFvrGd2YvjY6lMm3UxlhXUg1TTZyUmsHDQulFC9o/ayvfw4dXmBHnuqnHzLpymGaYux@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyzWdtkob61AtFRF2+ok/tuqWMocRuxnb4Ljuhtvx4j1PEOlYBY
	OVjfESLmJfMDhmcgwF8o1jZbeVebuuozRamp7nl/Hi3FvDCVkIkU+3lsS7QK
X-Google-Smtp-Source: AGHT+IHkZfIEbD222fQn11aAU/4JCGtUmB7xX2nq1qct7iJZBs/q3eDUArv4HK7B8GzG/yGYnzOsoQ==
X-Received: by 2002:a17:902:e884:b0:20b:3f70:2e05 with SMTP id d9443c01a7336-2111afd6c99mr328557145ad.41.1730975656993;
        Thu, 07 Nov 2024 02:34:16 -0800 (PST)
Received: from [192.168.0.104] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e42b8csm9056135ad.131.2024.11.07.02.34.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 02:34:16 -0800 (PST)
Message-ID: <61a76bb1-f247-4e9e-b6ba-163fd8af4f69@gmail.com>
Date: Thu, 7 Nov 2024 18:34:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton
 MA35 family GMAC
To: Andrew Lunn <andrew@lunn.ch>
References: <20241106111930.218825-1-a0987203069@gmail.com>
 <20241106111930.218825-2-a0987203069@gmail.com>
 <12f4ea21-d83b-412c-9904-d9fe8f8a0167@lunn.ch>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <12f4ea21-d83b-412c-9904-d9fe8f8a0167@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Fri, 08 Nov 2024 09:50:58 +1100
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


Andrew Lunn 於 11/7/2024 2:13 AM 寫道:
>> +  mac-id:
>> +    maxItems: 1
>> +    description:
>> +      The interface of MAC.
> Please could you expand on what this is?
This property will be removed. Thanks.
> 	Andrew
