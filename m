Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBB39C9607
	for <lists+openbmc@lfdr.de>; Fri, 15 Nov 2024 00:18:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XqGK41ZL8z3dDP
	for <lists+openbmc@lfdr.de>; Fri, 15 Nov 2024 10:17:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::c2b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731577770;
	cv=none; b=T9HfbMZst8paIkouol2ngMNubh+Gi2OyOsbwTGvhMCFBKW6bWOjLPeTpsDArN8gNVlE7WZzi5fmwgNwDrePmDQKpRhd0KoN8pEJOdmnxusyXQcEKEzBUhQSrr1t4OW5dH5mLfY5GzflDKGSse6BQ9jQDgTPTOlPXCTAyXEsbJ2RxliWEvkjLxOQ9pDpxbR0KSupaRMVsrvtqsb1LteVzUwwmMQ+deFcDBp+3lK5EUNWv1j9ftfabLhFbfVLfNT4d/VRrMUQqaCkIpJzd6FbWWWX/C5AW47GgOGIInG+HNjg/ww31CQH7HZtNTtGGT22yZ+AZQlHAneyvYXxLUxv2Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731577770; c=relaxed/relaxed;
	bh=BJ007AyfFSmUh1mOpRxq8pHzHMlQHIiPTiwXlN1yM+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cf2HNjzSaMo2EOvPKMg4zqw6tnbdyeoyjxS3LJF3WIefA8iP1guB+tThxUeRXBrH5MWIyO27dZeyO5rjIK+teAfVYBe0zSN97Ssbg5z0J7H985snrALIZo2q76gjRXu8fgYx0celnZvPiCLy1rXHpAf/+CV2XTAYCHutSvDY10+i7jiU9dmRjAIlh54m1klD533m5ZUbdUlDIEoVzilImeqP9l2mczr+/GtRwAvT+I1VwcF5wbXCJgcvAvJeVQ19xOF9G8JyO2gsPkgJKVR0lTEyaEwjA1+IBy9+6+RZnYKUfetNu0OIBNGdDnEuglmI010ODhM+McL8lv083sZzew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BM4z2QeG; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::c2b; helo=mail-oo1-xc2b.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BM4z2QeG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c2b; helo=mail-oo1-xc2b.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XpwNS4CCPz2xk1
	for <openbmc@lists.ozlabs.org>; Thu, 14 Nov 2024 20:49:27 +1100 (AEDT)
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-5ee58c5c2e3so177962eaf.2
        for <openbmc@lists.ozlabs.org>; Thu, 14 Nov 2024 01:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731577763; x=1732182563; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BJ007AyfFSmUh1mOpRxq8pHzHMlQHIiPTiwXlN1yM+4=;
        b=BM4z2QeGKeX1whXlShepHj60EvYbfFGFQK14OZfk4+zVkFpqtmZB3EsuqwBrHSAS6k
         j/YVttU62u1e4wzrdd7ELMb8sJM66gWF3BTsUW8nWMy6wTtk0CUBSc7S/96UIfqt1q0C
         p1U57XUK58z+iTe6pgDN8isa6XUVg3rGucy/DJjS5D23oQPWGRSSgrO+bjwOi3GIXtzj
         ZyGsR+JCScGfgQK8dubQpFz5VHlqiC5N/LesoZOE1O1FD2rgkAhzwAM+ixU5mfatbu+8
         jmXxSNm7YGWbj7HQCZRVqipw3mdYZmuUQhq35dBT7VoT/kG/QNB4MX6PGiIc7iiw01qN
         JBfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731577763; x=1732182563;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BJ007AyfFSmUh1mOpRxq8pHzHMlQHIiPTiwXlN1yM+4=;
        b=ukP3KP5g4Lk+iv3bdSEGu+Nol70svDjA7rR6Ri000KVlKGnACeI8gOQutw2DuS5plX
         dRsy7w7Rr+UjMJOxa8oabFmnG1CZ7xCNleWUuyUUnWy7lxcn+ikazHLSQNKPJ9fcuTAl
         mRk1nDQ1dltwktljH3RJaWeKTXOTX72rYxy3uaj739tRp0+Ix/z8ll7AmWjBePcd52fO
         B6JLop1tvuoerBJ3DTqYZW3k+1ccbaylvvkQvw9rsp78mYCX5c+1+SMwr65qR+kk0MQu
         S0sQDlpHVO29BYUJNFMKcocOpEZmEf5HFGFppCU/IyHLoZcZ1kvRVMb9Q5SH0Oxlvfqn
         M22A==
X-Forwarded-Encrypted: i=1; AJvYcCUbCedblGEVhzx/vfEcuyUQX8P2/4jg2ZyX8fDmZS7PfiMpKqlZVL7+bcpjSB07DkctxJes3MBc@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxZZuSJamX2qbaj/wpOPEeXYU+DmvP/dMX5rZMdnEBJHcToqwyq
	Gd66q1KN+DxGVTwsSHSMcJtXQ4SgY6VygIE1nn4W/IhPDN71jxX5
X-Google-Smtp-Source: AGHT+IElpYeRFs0SFCU7YxvfDnm+J9VKwBd+r6YY8KKPQksjpdgonuoZU+lvxZoNdrIbZVA3+RzO9w==
X-Received: by 2002:a05:6830:631c:b0:718:c2e:a193 with SMTP id 46e09a7af769-71a6010a842mr6854545a34.10.1731577762840;
        Thu, 14 Nov 2024 01:49:22 -0800 (PST)
Received: from [192.168.0.101] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f8b37e01easm713510a12.24.2024.11.14.01.49.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 01:49:22 -0800 (PST)
Message-ID: <8e55e276-f2ee-4679-8e0f-ca5afb3653fc@gmail.com>
Date: Thu, 14 Nov 2024 17:49:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] net: stmmac: dwmac-nuvoton: Add dwmac support for
 MA35 family
To: Andrew Lunn <andrew@lunn.ch>
References: <20241113051857.12732-1-a0987203069@gmail.com>
 <20241113051857.12732-4-a0987203069@gmail.com>
 <b7fb59a9-989e-42b9-ac72-71f353854812@lunn.ch>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <b7fb59a9-989e-42b9-ac72-71f353854812@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Fri, 15 Nov 2024 10:17:38 +1100
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

Dear Andrew,

Thank you for your reply.

On 11/14/24 10:56, Andrew Lunn wrote:
>> +	if (of_property_read_u32(dev->of_node, "tx-internal-delay-ps", &arg)) {
>> +		tx_delay = 0; /* Default value is 0 */
>> +	} else {
>> +		if (arg > 0 && arg <= 2000) {
>> +			tx_delay = (arg == 2000) ? 0xF : (arg / PATHDLY_DEC);
>> +			dev_dbg(dev, "Set Tx path delay to 0x%x\n", tx_delay);
>> +		} else {
>> +			tx_delay = 0;
>> +			dev_err(dev, "Invalid Tx path delay argument. Setting to default.\n");
>> +		}
>> +	}
> The device tree binding says that only [0, 2000] are valid. You should
> enforce this here, return -EINVAL of any other value.
>
> 	Andrew

This will be fixed in the next version. And I will correct error messages.

Thanks!

BR,

Joey

