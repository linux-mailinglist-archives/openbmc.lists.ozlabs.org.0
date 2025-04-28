Return-Path: <openbmc+bounces-19-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2859A9F298
	for <lists+openbmc@lfdr.de>; Mon, 28 Apr 2025 15:45:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZmPpg4KwHz3064;
	Mon, 28 Apr 2025 23:45:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745847931;
	cv=none; b=axzbytf/drKZuOpEcRuP86DEgHDSl+3D//PhkhILAn4MD7ohOlJlZ/Ff/TJoxr29oQY1a7bNAPHyue5joP3AOFjUM6HjqCy2y4XhCPntgAb/wWxrk7trDCXbvVhS7WKbkdZvEjBq3fTCaSOBjXs/Yzc+O++ivLhLFQArFs8oEsbANZgD9K0hfT3AiKbjlZ9Ds2lM1cKKriFhsyy7OEt5ZX+Y8OykxyTiU7NU/s9PbUYPGXClVdRGImGzYO27EP8cd3l064BRWODwA0y1il0bhSspSXdvKQK/770x37PqfmFNnjysf05XwoJCh2cadpkWMyNIfEsr2+HhznehYyhT5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745847931; c=relaxed/relaxed;
	bh=NSMks7WqtUMJwxjTc0mFYCwrC5Gf23E5U7PL9M6Zw6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=P1o2LmpqzOOHq06JH6Qt07DL8h5CJzdQViq8rfW+vWeYok6vCjCoU+OP+yja9St/91gdpeZP/3coAAAVW7J4kHHEgdThhNzetLXSHZ1zK5MOLnh5Pu/OupN+YEFfZYbLZu9Z7JQDzELarVi+m8iHQAg2mfA7qPdtq3QK5002uHM0WGFxh8cCCtx1E8wYCrKv8pBaIatAZBJ/pKJYrHJeEb6rYzuq7mWD4j4x4AXOr+urLpVn0wutlWJVPi9rV0OW1IFnw1fCHJd5kGE5R3NKwabYpTjnjt1NTv9c5Zhbq8Yy/kyIIlhcuQAzYBMV9+xbLYwuzUWurd6mP1W0ccGTTA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=T+ZSjrWY; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=santosh.puranik.ibm@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=T+ZSjrWY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=santosh.puranik.ibm@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZmPpf6NVlz3050
	for <openbmc@lists.ozlabs.org>; Mon, 28 Apr 2025 23:45:30 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2243803b776so79815805ad.0
        for <openbmc@lists.ozlabs.org>; Mon, 28 Apr 2025 06:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745847929; x=1746452729; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NSMks7WqtUMJwxjTc0mFYCwrC5Gf23E5U7PL9M6Zw6Q=;
        b=T+ZSjrWY2R/DdXn36iqhpCCsCzefhbYfK9/kdWXOu8GbuqIqoVff0Ntw2XM7PMYRay
         H3+cCMzwaXryAbEECBk8tUtsu7saVbweyjQeC8Af+kgSbLecGO3ekPeZUZ33x0eCfuPO
         THL70YPlwG6VzBFRjxpGu67NEzuStD1FL0Bh6zx+t9kzdqkgnIpbMfe7X2P/n6uoaZku
         FI8kXDKfrPR9WBZpTM5B3p+E23MBFzM8lREpxt49Ac8WzeaTObGrO9JdLmvCU4gRpKIt
         pmDp+Hrt0KERdDqZ/6ldWRkaXWFxB5cqX+xSVGpH59SFqWM22lnm8N5wnfZ4Lwg/4RPe
         463A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745847929; x=1746452729;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NSMks7WqtUMJwxjTc0mFYCwrC5Gf23E5U7PL9M6Zw6Q=;
        b=ASvIJcW3d/6V2OaFt2S0rg741uxm7J/sEfrIJ7noOV4XRHLAEorZS6RcSt/MtJ4Vl7
         WFN2rgMDM7Bd1ygdwUoXDym3iIwayHTV+iRzQFEp8h0MxTPuyMX9dCWhdX3wn0FnoNG5
         lBV0ZEPgaeoo3v97MSjvmCLMbE9pexKGbEtU/G2rM6kZp3SHVHh9wBROLpbmrFhIOYEG
         9J3V3jIM0hltgfsO1EeUf7huCR2w006ItTfiC5tGOU4O3ZEl+vEW7R4AtkC4KSxCoP5v
         OfmswsDIWlltmo+uxFPtxb3Ac413aSwQY9y7Y6W+kydEaH7PlZ2SLSEnS9AB+K/wSJuE
         5x2g==
X-Forwarded-Encrypted: i=1; AJvYcCV8YQCRetPwU4vf+NkDOcqsqYnYv+pEIS4Pq37Wk+i5QzqCkl1NfVv9ZBBkfkkZ7Ut9W3idUBhp@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwMokQnPIt5e6jNnLzWI4st0L9kQOTFKHackjUbfqQ+PA2VW0Og
	togkpDvU3sBrz08amLK7cffuBvFmrhw0YPTC88BleOne0OmAoKKn
X-Gm-Gg: ASbGnctd7BvAPLym5Vh3UXMCFkiUDyUbEZxXYEUOWSVfud8s/fGYqQLbXSauqsOAM5+
	f1cOlbFUPra22fSNAWmJ/AbKIxB+OByrFloaX45CrcWF8hTl1wRERMo/kIdqIGAELiL6tywBiiI
	4IZiL820SHtPfKes/ffZqQgL/FJqQeQlveyWkPbpjQRcc0YGnps54rQv25ieBySA1aOE5qtMOjf
	n8OWtHCOhLhwkbRcz+57eVdsX8O4CZ39UxGd5eudpJ7doOiMGzjtIP4P9aAFWrGulQ2jWcwnGMP
	yY5vvWhX20XjONOoQBgM7uC2lRUy2SoISJcIa/H+6eTWhX42ALKZwnWDBxVduCldYthvRUaRr4o
	x
X-Google-Smtp-Source: AGHT+IGYa67J84u8isg3eXOP3PSOKvl4yxqjPcUf8cb4juMSSgvbGsNzD1GNqts3wdrkfU7aMWWY5Q==
X-Received: by 2002:a17:902:dac6:b0:224:a79:5fe9 with SMTP id d9443c01a7336-22dbf5f121cmr157243865ad.30.1745847928904;
        Mon, 28 Apr 2025 06:45:28 -0700 (PDT)
Received: from [10.25.72.229] ([202.164.25.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db51025aesm82313625ad.188.2025.04.28.06.45.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 06:45:28 -0700 (PDT)
Message-ID: <e2e5c19b-3464-4e3b-b096-e519f6c88a20@gmail.com>
Date: Mon, 28 Apr 2025 19:15:25 +0530
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
Subject: Re: [PATCH linux dev-6.6 0/3] Backport MCTP Over USB Binding
To: Jeremy Kerr <jk@codeconstruct.com.au>, openbmc@lists.ozlabs.org,
 joel@jms.id.au, andrew@codeconstruct.com.au
References: <20250427153008.3166922-1-santosh.puranik.ibm@gmail.com>
 <d91c2e0617d97c79a31ac0b4d9db9d20506736eb.camel@codeconstruct.com.au>
Content-Language: en-US
From: Santosh Puranik <santosh.puranik.ibm@gmail.com>
In-Reply-To: <d91c2e0617d97c79a31ac0b4d9db9d20506736eb.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Jeremy,

On 28/04/25 7:13 AM, Jeremy Kerr wrote:
> Hi Santosh,
> 
>> This series backports the MCTP over USB binding driver and associated
>> definitions.
>>
>> Patches 1 and 2 were cherry-picked from upstream linux master and
>> patch 3 includes fixes needed to backport the binding to 6.6.
> 
> We'll want to have f5d83cf0eeb9 ("net: mctp: unshare packets when
> reassembling") included too:
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/net/mctp?id=f5d83cf0eeb90fade4d5c4d17d24b8bee9ceeecc
> 
> - that should come from the 6.6 stable updates, but doesn't look like it
> has hit the openbmc tree yet. Could just be a matter of sequencing vs.
> that update, or you could include explicitly.
> 
> (Andrew or Joel may have opinions one way or the other)

OK, will wait to hear before cherry-picking that commit.

> 
> A couple of comments on 3/3 too.

Ack, thanks.

> 
> Cheers,
> 
> 
> Jeremy


