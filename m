Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A25FCA04C9C
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2025 23:46:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSR3L4rH5z3fm4
	for <lists+openbmc@lfdr.de>; Wed,  8 Jan 2025 09:45:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736231893;
	cv=none; b=LAII7ZzWXt1yaiGrCgnvhIpCk6w5bBRQBcXMlT0cVc5GUpB8Ao1pAUevqpQ1IL6PdwiPrb/AvRh4p3IsWKzpBTboczIflzbAPGr5XElEr7xPgJVQzljZKMzLWskEuDu9Plfm1gLx/c05VPr+el0o5TBy5fBgsPtZOTOSDbBxFMHwTboCuIdN+l3MnqMiHWsGYGISbO1hZUPV/rZBWkYLqHIqf5r8PO39JuT9ZIiAZc0d3Ua55yNCYoDTl6sPQB8GaqQJGbx0XUjH5+11TSLD6PHI5TMVo5KTzStj3IeRCPbDhN/W+vWMDKZX4/zCkOi1ALF2Qz+L7jmovqPvtu2+Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736231893; c=relaxed/relaxed;
	bh=orCDsDNFA6uclIQ3/usGvXWL2lE5OsemzFx60WJJZsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I0iKpniVU6Y9swlA3a/3tExmXT344gp6JDBFS0yYnH+2rH722vATnbZ/IaO8atnOqk8ojXjgcQoUOTz2T73kQIpDEQaBMq68KvocY1wxMhlDwANsCvMDfvWdB0xy3JB6GXM+TGP6eTgoTqSmBnQHAWPiJ8j4r29Rg5hyzm0AIhhwi3kJYmqgUwLWTQmpCxymR3Haxz4QEcVVPrB9+l10LlGi9QQE0sUsR8gRK44OfsgNoC32fwxkXYCPMewzX6HkYNylGuuFNQONvpUwVnMSkkVVHa31LeDDCbGnVw0Z78eusrov96Do5ZFgEt9yJITa5swRshtApg6gcwu6IP8YUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=F+aOJf7X; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=F+aOJf7X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YS1Zr0k1Tz2xst
	for <openbmc@lists.ozlabs.org>; Tue,  7 Jan 2025 17:38:11 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2163dc5155fso217277375ad.0
        for <openbmc@lists.ozlabs.org>; Mon, 06 Jan 2025 22:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736231890; x=1736836690; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=orCDsDNFA6uclIQ3/usGvXWL2lE5OsemzFx60WJJZsA=;
        b=F+aOJf7XHSL2O8b41ToIalNUH6M6yDSnxCxHTS5OLg4jV4lUIlvsfBTFxUYIkJ4L72
         Wl2WPEn2uo3fdatE5/EFtHg68uXVlLoPV0kyy7CydNtcFPuT2o/H/dKWta2Qj8Z2bJ1f
         s0gA8d/p/bnQBPPvs+FJgxXONbKtAW3fj4neaFTHjht0CtPbkd/fIQ75LL1o2t43yzkH
         pds3cHaCkJWB4EicCEDyC1fiDr9vQ/owEmdhp0op9V2xGhH91ZA1xCMxr/H89YV5Hd0v
         hufrBHLX2Y4DTGDCxjdYzNcaobOMv0THGpVvJpXsGpiAUQxrEjN2G9jYzhV0okuwLShQ
         Qd9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736231890; x=1736836690;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=orCDsDNFA6uclIQ3/usGvXWL2lE5OsemzFx60WJJZsA=;
        b=Sz3YuC29KDT9Uu7XaFEsq9jHbsO9bVy8QxAVQy2mDkB3YI8pkUYSQmIjhDCMWPo3kT
         TeeGH2ov2eTVIl7GowVaJJz15OegyImO7ie5Uwzm/82O0eEqE/kubPlP3bjRyrx/Oq32
         wfhrCcPQXhyrc2S39bgt2h4VUU9sqDADDK0Z14pCtSIAwVQfNgEHq+Y4qxkok7CV+bnt
         SgaXlGUxmsTpZ2XCre6EOzT8fs+ooPQBlkIMQ3U82YEwYslGA7k1Q1dV3ifup7NF9iDF
         oAp/mceHbLXj0FZ8SZ6aqJ9PXU+wcaM6niapN0lYOSrcZey2ST3jk9B1aDdigAIPGaee
         A+bg==
X-Forwarded-Encrypted: i=1; AJvYcCX+O5WzNH8x/Q5wbD7PupxNx53RerngLQKE4eRhF1BBJNsIz6RKTjqNyr6MjA6kvSF9l7cU+jcj@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzfuZ+3+uBbEAVg592c8Oquu9y/yoomH74XWrCRI0ecTaxD5+VQ
	btYBPZ7OVhbXHX3dM3LUVD1DV9qCw/wrnwP7hYeVOAw070dDKDs4
X-Gm-Gg: ASbGncvygvUgsGyDuurOOs5xF3uuo0RT5mbmLyVVwf5dS4AfHYcSNEDJYRW+kTroy4F
	vP6OHj/qwmeo/+NUETXK5BIB+ukXjqfbMrLlcmeNGDRaU2bEby7px2EFIJMlykgpCJfaaZszXZl
	iM74QKkf50T5xqcVzl7799mYIgsjqSq3vMt+/kk5nUEBY/l2lUWRL8bNclwNjNHqrzbwnSgx0Ov
	glnX/yddAjnERJJFPZJt0S+O1SK1g1psiYftKPhpen51k0JhbeQrknajw+7MzixajEfvSIkc/9b
	G+Mh5qseSlQgF8Jx/JQh2ZSO3l/E6UZJSfE=
X-Google-Smtp-Source: AGHT+IGWjFIAveI9yo5Dqy+7qm6ujTkxPVuxedvySkpkmuvq5Mxo0g2bGXtAvQZqm2ic1gDjzturbQ==
X-Received: by 2002:a17:902:d2c9:b0:216:4c88:d939 with SMTP id d9443c01a7336-219e6f133b6mr907204635ad.38.1736231889846;
        Mon, 06 Jan 2025 22:38:09 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f5227sm305467095ad.185.2025.01.06.22.38.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 22:38:09 -0800 (PST)
Message-ID: <39e559f4-375b-4e4e-8c81-3d1d8858e839@gmail.com>
Date: Tue, 7 Jan 2025 14:38:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 0/3] Add support for Nuvoton MA35D1 GMAC
To: Jakub Kicinski <kuba@kernel.org>
References: <20250103063241.2306312-1-a0987203069@gmail.com>
 <20250106163054.79cdd533@kernel.org>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20250106163054.79cdd533@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Wed, 08 Jan 2025 09:45:42 +1100
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
Cc: robh@kernel.org, conor+dt@kernel.org, linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, netdev@vger.kernel.org, richardcochran@gmail.com, ychuang3@nuvoton.com, alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, edumazet@google.com, joabreu@synopsys.com, linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com, schung@nuvoton.com, peppe.cavallaro@st.com, krzk+dt@kernel.org, pabeni@redhat.com, davem@davemloft.net, yclu4@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


Jakub Kicinski 於 1/7/2025 8:30 AM 寫道:
> On Fri,  3 Jan 2025 14:32:38 +0800 Joey Lu wrote:
>> This patch series is submitted to add GMAC support for Nuvoton MA35D1
>> SoC platform. This work involves implementing a GMAC driver glue layer
>> based on Synopsys DWMAC driver framework to leverage MA35D1's dual GMAC
>> interface capabilities.
> Would be good if you could reply to Christophe's question.
>
> Then please rebase on top of net-next/main and repost.
> The first patch doesn't currently apply cleanly.
> Please leave out the second patch, it has to go via
> the appropriate platform tree, rather than the networking
> tree.

I got it. Thank you!

BR,

Joey

