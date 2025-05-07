Return-Path: <openbmc+bounces-36-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EED94AAE80F
	for <lists+openbmc@lfdr.de>; Wed,  7 May 2025 19:41:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zt2dC69wsz30Sv;
	Thu,  8 May 2025 03:41:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746639711;
	cv=none; b=k+dDR/UGNOT1l2KUOoDWl12mvb2509sMwg9o+DzH3T3AqpKoY/tSbobWgXBTwdM4FtxBoEJk0F8QOvwdliowQcTKq//MS962TrruvwytgbjvmRZL9DyY7PBWS1U19yLJpUr1Xx06lkySC0YIcspwgYRW2ev8+erQySdpxcMOn8Rgrv5Sqx5EIVm53rudXPbp5b94rp7IZbOyR2BmEVjAdFsBIf3Mtf9lh8X0DEwTdv3agvIBWuAHBgqmvy1HRJ0/gLgbHgU/J549jZKWmv4WfOmHLXCPGCP8FeWNOul35R6JX775wE4rxmxfugRenXOwhdd7lRdwPIla734UmjcQgg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746639711; c=relaxed/relaxed;
	bh=Io/IfPB1yumOGdTgw/NkGFFg42e3D7nywMG1dH1hfAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hqFo3Gh1Nz9La4LQrSxN2d3XDuW9eRRV4j86NNFfnemjProGzE+O760ia+iMYd5u0AfR1Fua1Gu+ZaqEBgoFxZSDjtHNcOzn8lXAYcPLlVWq/TGbAvl5cdmPL32KmP9VKwAgfvrt/E0LGdDFDntEvUUFVwxt1my++nBUvqe9cSd5DKfenvq5lFkxqm0/Ko+MZMlvlumiUQSdLIWG3LFSAbb8BtsOK6XQjRgrIKdoKZYRF+3El3whuUMi22i57ySEcnWEG8fqbzzBCTVlHPbAse+uNjG6GmxiEwvXy1YRzF+gRgA9dNbgewSTLX/61I8iG/itFX6SVz2SzBmDIDU4zw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aGVZddXb; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=santosh.puranik.ibm@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aGVZddXb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=santosh.puranik.ibm@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zt2dC0CZBz30Ql
	for <openbmc@lists.ozlabs.org>; Thu,  8 May 2025 03:41:50 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-736e52948ebso237297b3a.1
        for <openbmc@lists.ozlabs.org>; Wed, 07 May 2025 10:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746639709; x=1747244509; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Io/IfPB1yumOGdTgw/NkGFFg42e3D7nywMG1dH1hfAo=;
        b=aGVZddXb7q3NSmPtqWFklj0zaCQj9LA5dk5U0lv/JkZTC0+9VoOcjZynHdm5nWz+rw
         rJz+iGRnMYzEeh5Wr5R/RzgizFED1UHHWRh2ZVbLn4x748XYnQY4O/cdgBVoCC1KVGfJ
         GKO6/GpwQkzIq7jP9bVJyhXGCZkHbLaN9q8SXVrUfg2bSuyyuT39ZiQgLo9HAk1tFROT
         SPxzD4+1NJJhzCFyuzKQbqPfFJGsRlgQ4gHckTpeWEcXL5UmcMxaWfizcb1hcgPu1ywO
         inEhCvCQmSiGFixQK5yVYZ1HoWCUXQwFx/8BBsCMQRIKvJPZhjRhCc6zLR6lHKnjoD2q
         BhfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746639709; x=1747244509;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Io/IfPB1yumOGdTgw/NkGFFg42e3D7nywMG1dH1hfAo=;
        b=WW18RKxIn8Jes7S3q/7/2RvT2gYVjskySmqH9xSY532Kvm4I9D/r6j96OrexPd4g6k
         Iyck58tMiUw4K/YdtV+2LlcQLP05jOh6W96vcwUUMrbQJvWgNQ3tgPNIsLj9i6Mh3D3h
         YPVztUMPUE6N68fvEai6TGfDcNLqevqdW/zHuPEEcmW9b9nxbn+UieFuwdcTqRbmypMr
         w/ZiDg2tOZ0RR6n/tQ7cEct4/eok36qraZlTCE2jUFoMPg+XZIRpvCOLnx12RguEqJuP
         n6TdCyCMD3T7tyHwGlYRsFnxwxjOI3WheRE4x/j6E810o6Rat79aPi6fF+IxxMdx/Uz/
         eVzg==
X-Forwarded-Encrypted: i=1; AJvYcCXlRaauYNlMFwJnuo6Sti6oHHQnnMnB+qa0TA7wqIAYKpQV4njscaa0icnyzZjROk9qKNL3lgbd@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzMRMjXhcY2BT2MBbq66fWU4VwNuMhvXWchL2uJbcEbL2248isF
	ksKTAnanIKzMYBtV7VxH/yfOnollK8xOrbNiAEJ6csRhpLVW3hgaU06RVaAt
X-Gm-Gg: ASbGncuChWLCddlsbJQUUAkuKy0nVfkgV/BG71j2nn6PwtWPDwtwXQuwmq1VyStGTXR
	7voWfLFB9/xrocksGP2k2Af0tiUhp8c/b7sXY72Ihf5i7l5SSx4MIYcF+WZfrGOqLXYC2vO2gX+
	t0RP1/Y+3LEmF7cnHiXjsmQSp6JXC7xUqXS+FE951uu2UFuVsEL/7aEVKimaFToqmt+oI5+Pb52
	zD+8bVOfSzFN8x0iAt0f1VnqSktRMvJp/iVY+T0jZJAhbAyT79Q1FAxMwKAbOdLHc+ouaLzqVYB
	Zq6WWyLJYxiZbuNE55rFcz1+G2N3y3AHWadsWdq/5vztqKxoC0qyJCQauQPo3W5S
X-Google-Smtp-Source: AGHT+IFwCJXB7aJCRpDwXga00neu5Z8MELGAbTcXEI9yJflStLDZDAW71kNGX8n3dVYJzpJrIuw5+Q==
X-Received: by 2002:a05:6a00:438f:b0:736:520a:58f9 with SMTP id d2e1a72fcca58-740a9a42d76mr215030b3a.17.1746639708818;
        Wed, 07 May 2025 10:41:48 -0700 (PDT)
Received: from [10.25.74.75] ([202.164.25.5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7405905d16asm11546197b3a.127.2025.05.07.10.41.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 10:41:48 -0700 (PDT)
Message-ID: <ea5f5801-4e65-4c86-8ee6-67232ef65725@gmail.com>
Date: Wed, 7 May 2025 23:11:44 +0530
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
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Jeremy Kerr <jk@codeconstruct.com.au>, openbmc@lists.ozlabs.org,
 joel@jms.id.au
References: <20250427153008.3166922-1-santosh.puranik.ibm@gmail.com>
 <d91c2e0617d97c79a31ac0b4d9db9d20506736eb.camel@codeconstruct.com.au>
 <db114c381d4f3c37b50fd66bb934e9b8c2008e16.camel@codeconstruct.com.au>
 <a57c7a15a49884ea3b6456e828c4fdf272dcec9a.camel@codeconstruct.com.au>
Content-Language: en-US
From: Santosh Puranik <santosh.puranik.ibm@gmail.com>
In-Reply-To: <a57c7a15a49884ea3b6456e828c4fdf272dcec9a.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 06/05/25 12:41 PM, Andrew Jeffery wrote:
> On Wed, 2025-04-30 at 11:58 +0800, Andrew Jeffery wrote:
>> On Mon, 2025-04-28 at 09:43 +0800, Jeremy Kerr wrote:
>>> Hi Santosh,
>>>
>>>> This series backports the MCTP over USB binding driver and associated
>>>> definitions.
>>>>
>>>> Patches 1 and 2 were cherry-picked from upstream linux master and
>>>> patch 3 includes fixes needed to backport the binding to 6.6.
>>>
>>> We'll want to have f5d83cf0eeb9 ("net: mctp: unshare packets when
>>> reassembling") included too:
>>>
>>>    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/net/mctp?id=f5d83cf0eeb90fade4d5c4d17d24b8bee9ceeecc
>>>
>>> - that should come from the 6.6 stable updates, but doesn't look like it
>>> has hit the openbmc tree yet. Could just be a matter of sequencing vs.
>>> that update, or you could include explicitly.
>>>
>>> (Andrew or Joel may have opinions one way or the other)
>>
>> I can take care of it: There are some other related changes that need
>> backporting as well as they haven't come in via the stable trees (I've
>> just pushed recipe bumps integrating v6.6.88 for openbmc/linux).
> 
> I've backported several fixes now, including the one above:
> 
> - https://gerrit.openbmc.org/c/openbmc/openbmc/+/80040
> - https://gerrit.openbmc.org/c/openbmc/openbmc/+/80041
> 
> Santosh: Feel free to rebase your series and re-send it after
> addressing Jeremy's concerns.

Thanks, Andrew. I have rebased, addressed the review comments and sent a v2.

> 
> Andrew


