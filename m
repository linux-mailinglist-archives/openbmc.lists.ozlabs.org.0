Return-Path: <openbmc+bounces-1245-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61648D3BD0F
	for <lists+openbmc@lfdr.de>; Tue, 20 Jan 2026 02:47:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dw9Dv4v5Fz2y7b;
	Tue, 20 Jan 2026 12:47:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1032"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768872893;
	cv=none; b=kXICUgFAWTj/0QJNT18UHfOLhFDmXm5CtoK4fpMRmoHsKrPBI/bCYgkPYKkov+tcfHeScWyWhiy3Buu1lpXEUbS8puTx19GAWEi5+4OYLljOcvrQuyGTG5qpMnqDW6DsYKhT/jQVYHU8KtkyFUGvNEHhUU+bgnz2C/J6LLe0+A3oCygyp1SBGKxMu2LmZ82d04mMWhZxaNLlHnHajzvdCTG8JFQTeUJ7qVd+ZC7RTXG0K2Y0pLmsmrq8wIfPjZnPpHnmmOJjF3wWpQGCUOXZtv1oOPtGeR5ICWGU8H+BiGz4iigp6j1hwXeZHJEsy7PFySGYFzmVDB7nDXmSVY1yGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768872893; c=relaxed/relaxed;
	bh=RrH9sDwa3QtPj5gSU1d7cy8zDFpQYEGB5vrm976c5QE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XWWf/e4B3KFAn8mhxkqun/UwBIrV6uWP9WR3YOs2RGdLVflggUvSEjX4WQ4LzaqUiR+d6DjZODW9lct7SVPLDUcn/ego0oHcV65NmD6gUHzcx95zNIhAv9y8RevHXqCh20ft+/Dk5LA/r31spi1CFSaEo6dzPgDcpC7iUSPMEZ+w2Ch//GUqo7gjMw2an3RbluzERkkggyW3Cj0f7VFmEAMXgOVn6TD2B8XYgxpovZq3uEq8XmOwbgKhNim07UpDABUzQq6HMDZYCJay2jugjr4T4QEmJXMaPTzo64s1vcu0r6dvfrPxTn+KmmukRgJh/M1xeQ4jINqfCRtBpAgdAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Lgfexlst; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Lgfexlst;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dw8yM6Fspz2xjQ
	for <openbmc@lists.ozlabs.org>; Tue, 20 Jan 2026 12:34:51 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-34f634dbfd6so3720848a91.2
        for <openbmc@lists.ozlabs.org>; Mon, 19 Jan 2026 17:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768872889; x=1769477689; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RrH9sDwa3QtPj5gSU1d7cy8zDFpQYEGB5vrm976c5QE=;
        b=LgfexlstvGm84WHgfmw0wureC7A5XyI1iDZHw05LXScRrb+Wd887G92IMM7E6IFTUM
         Ghx6W1AXHGdcDxPxmgJzanAZvi+hLEGIdR8tm1JJMJDfjzgeJCrw6roqk9cXCeUmJoaJ
         aiedD0IIykfNlfbPPWl0zYFkMw95KEsJrKNya5Gojo2K8jUw57eoJMcXR+z3XTUnWMfY
         SMGsxfvZ1AAkFPIuXqlkQplr3+I4oFXeTqXnfD5qbHmIdcfEseRZif/ag5gb2hw86IVp
         1Y5qid/lfB+fTCs48a815r3XIrYJhRWtKtmFiyniMUTL3YfEW6ppQO54toai40QOx9ng
         kOwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768872889; x=1769477689;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RrH9sDwa3QtPj5gSU1d7cy8zDFpQYEGB5vrm976c5QE=;
        b=mkXi4ZtPYo7DSIZfCl/kVUjMb9l4as2O5R//RzTQWs9q9SKpYZBxTvUkYBarcwvuEN
         7Rz06jz6IX1yvXbKIrs/tjsd3tl6iA9lcZK7s94iTiYXJ6yzmxxQz21eJcPxwRdH621Q
         Rju3yrK0ztgohyEMx0VwF+o+VQZIEs8ENVXw/jEWQVhtZ7kFEUfu4toamRnGt+Q5qUTk
         VxRkLNSvYAeh44YFh5Xcz7BfjJXyEbwVs+6rZPGRhjaxHwxK6O7XuznXvRiuS5P6PH1b
         B6rdbqFGmfOOuaYvZr/S/ju36WD55tIA7R6VK/CX8ek6BeMwvIOxysQH11nhLDHw3hEX
         xOIA==
X-Forwarded-Encrypted: i=1; AJvYcCXwJWqMPmioLqiM70+HkCuPwEVB/72kpThwUz1FFfqmWcDWmptB3pYtrIeL+Mq+HmSA5PxvO2m4@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxnjUkSb5ql9CxTFcljdEonaWJwQxf3gMgmfZaP0f0JpdLa50LI
	HKQ2vOcPvn2Ax0MgKJQkwNkU0UNdPi6effwWHMghqMUjqyFYm0zlmYqx
X-Gm-Gg: AZuq6aJSmNrokLTvGNNC3SlsFVZWUwEgaf3rXUJT1FSheItGgtQUdJlZL1MjRfbyiej
	hLBxniEuiG/27ao1dhzIiFQENZtffh9bcWq4EoVRtKjyH6X2Vk2zbgLCcRf2eJg0E1WAZ0q2hyu
	16tivcE/EorfmqubH6pHVJr8Z5apUbBBmoi990gUgxe6QLw+cR3H2bDOipSYoPBh2upa57F2Qii
	XuyJnifQZI3rAQ3eI9Ooih8+vcnB9hEQYYwJzE0yrT6px/xZoXHZsJHG629jpGPhDZvsxkHnbj/
	xELLxBfN8qkrHfRWYpsNaLom0eal3zQJsu6D/j7I0MN2E0bhri2Dt2tH6pa6lml8X+rd5yG5U/R
	zweaJ2GXJGeaO23D7BFc7h7P8OYFWXSK+JWyh6NlPJGWky2H4HRYJJCLBeC4msTTdRdhr2AUACS
	Cb84oc8CIglwSkM5azKH8nj7xt+EqyOcD9G+mzIYC5V+UN7N1FAGRiv6CmE6dPI8YmZIaz+hT2y
	ZA=
X-Received: by 2002:a17:90a:c110:b0:336:9dcf:ed14 with SMTP id 98e67ed59e1d1-352c407a272mr335012a91.23.1768872888766;
        Mon, 19 Jan 2026 17:34:48 -0800 (PST)
Received: from [192.168.0.102] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-352677ca9acsm12931529a91.1.2026.01.19.17.34.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 17:34:48 -0800 (PST)
Message-ID: <a5cb949f-34c1-470c-bd04-0b35c249455f@gmail.com>
Date: Tue, 20 Jan 2026 09:34:39 +0800
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
Subject: Re: [PATCH net-next v8 2/3] arm64: dts: nuvoton: Add Ethernet nodes
To: Andrew Lunn <andrew@lunn.ch>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, ychuang3@nuvoton.com,
 schung@nuvoton.com, yclu4@nuvoton.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260119073342.3132502-1-a0987203069@gmail.com>
 <20260119073342.3132502-3-a0987203069@gmail.com>
 <04df4909-4fdb-4046-917f-2f2e47832c62@lunn.ch>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <04df4909-4fdb-4046-917f-2f2e47832c62@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Dear Andrew,

Thanks for the clarification.

In our design, the Ethernet PHYs are located on the base boards, not on 
the MA35D1 SOM.

The SOM base board routes two RGMII interfaces from the SOM to two 
external PHYs on the carrier board.

On the MA35D1 IoT board, there is no separate SOM and carrier board - it 
is a single integrated board.

I will update the DTS accordingly so that no PHY nodes appear in .dtsi.

Thanks!

Best regards,

Joey

Andrew Lunn 於 1/19/2026 11:22 PM 寫道:
> On Mon, Jan 19, 2026 at 03:33:40PM +0800, Joey Lu wrote:
>> Add GMAC nodes for our MA35D1 development boards:
>> two RGMII interfaces for SOM board, and one RGMII
>> and one RMII interface for IoT board.
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   .../boot/dts/nuvoton/ma35d1-iot-512m.dts      | 12 +++++
>>   .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 10 ++++
>>   arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 54 +++++++++++++++++++
> I'm somewhat confused with your naming here.
>
> A SoM generally needs a carrier board. So the SoM is described as a
> .dtsi file, which the carrier board .dts file can then include.
>
> Where are the PHYs? Sometimes the PHYs are on the SoM, sometimes they
> are on the carrier board. If they are not actually on the SoM, the
> PHYs should not be listed as part of the SoM.
>
>       Andrew

