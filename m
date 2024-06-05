Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF338FC7FC
	for <lists+openbmc@lfdr.de>; Wed,  5 Jun 2024 11:38:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FSzauG8U;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VvMpW4t4jz3bdm
	for <lists+openbmc@lfdr.de>; Wed,  5 Jun 2024 19:38:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FSzauG8U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32e; helo=mail-ot1-x32e.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvMnz2jSBz30W2
	for <openbmc@lists.ozlabs.org>; Wed,  5 Jun 2024 19:37:57 +1000 (AEST)
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-6f938a7f492so944150a34.1
        for <openbmc@lists.ozlabs.org>; Wed, 05 Jun 2024 02:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717580275; x=1718185075; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b4igMhf2cq1WL+xzz0Lnp/KYB3n6R8x/9FVKHdZLdxQ=;
        b=FSzauG8Uh9oRBg94uTeaYYk+0EV8ssmzrgjK+hVOjS1wuvT/n/bKDl1Iyq/3r3NEcC
         ybVcn9qutZ39qos+HPJBC705we1rzL/YxhmITvqGyp0FYBjG6X+NvtGd1iejgUdV4qTu
         FOid51Gt92u85CzbJsTH0rbh+tReIUTqBPUbdTln8bsuWHbYj8bHfmjyvNwynMRHHhNp
         UuHsFnTIPtRY7edflOIe9J+VQXvuuYt0z16YyhL48qovvY6B0KD+T5jLv2Y8Jc9SlW5n
         AY79LtNGYful6uCHw8VEKAIo4sfvfmdmmFQlBMfAT+CRCSFSqojcUwfLVzkdAZS9/Db+
         IpnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717580275; x=1718185075;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b4igMhf2cq1WL+xzz0Lnp/KYB3n6R8x/9FVKHdZLdxQ=;
        b=izStC9uwTqGtD2X8J9IYahWIPAA1dzs3l6skipb926cXeE1bTvq4eDxUam1HaYs5pW
         ESXkIAfverZyhOJ2wWzuZOxD0TWBYf/Ohx6R1sFJY5OtJQIL+1KFReAhcCY01ZONvhW0
         zQvYq4L5ZE7cg3/PYMtQcjy82xSEFYfP2s8eLxN+TUQJZN83ZIoWZJQu4JzJCIR0wpaO
         6BebQw+elE+nkLTWmy3WNKncL8522rd1ZjaxbC0QiUmlF/i3+Cb5z2HUWNQ1fMgx+V7S
         VpVkLHo0sNKI0HoNjz2BJdW6yDg7bQyS3fACfDatl6ZAQxVMZWIm61y45doEMf+k2prs
         PGxg==
X-Gm-Message-State: AOJu0YxvvnG6cU5uhPeDAB6STIrVKqonEWMEnKAq6tVMaW8TqWPMzyV3
	roC5i7g5Rzt5pWX3xEwrRqix0g58Qc0vIJW85eADiz8VH5dPCh8xlwSt9A==
X-Google-Smtp-Source: AGHT+IH3Pn60tJiq9vvPicn3juzpdoM7cEZa8ikouFOKlKngZqUtUbd4nyS1hVjweCGxkorOnGcAgQ==
X-Received: by 2002:a05:6870:4349:b0:250:805c:e848 with SMTP id 586e51a60fabf-25122094bc9mr2020369fac.42.1717580275103;
        Wed, 05 Jun 2024 02:37:55 -0700 (PDT)
Received: from ?IPV6:2001:b400:e304:db32:55b7:93b9:15c6:5574? (2001-b400-e304-db32-55b7-93b9-15c6-5574.emome-ip6.hinet.net. [2001:b400:e304:db32:55b7:93b9:15c6:5574])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-702423c9fc8sm8291639b3a.34.2024.06.05.02.37.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jun 2024 02:37:54 -0700 (PDT)
Message-ID: <73bac78c-806b-4606-9349-6c21de77b99a@gmail.com>
Date: Wed, 5 Jun 2024 17:37:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ARM: dts: Aspeed: Add Facebook Minerva DTS
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Patrick Williams <patrick@stwcx.xyz>
References: <20240604095720.2902647-1-peteryin.openbmc@gmail.com>
 <Zl91dAo6NXDSQA3E@heinlein.vulture-banana.ts.net>
 <3a486664a9985e749a4fb68a1801d6af2c92af5c.camel@codeconstruct.com.au>
Content-Language: en-US
From: PeterYin <peteryin.openbmc@gmail.com>
In-Reply-To: <3a486664a9985e749a4fb68a1801d6af2c92af5c.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: openbmc@lists.ozlabs.org, joel@jms.id.au, peter.yin@quantatw.com, yang.chen@quantatw.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



Andrew Jeffery 於 6/5/24 08:44 寫道:
> On Tue, 2024-06-04 at 15:13 -0500, Patrick Williams wrote:
>> On Tue, Jun 04, 2024 at 05:57:20PM +0800, Peter Yin wrote:
>>> Initial introduction of Facebook Minerva
>>> equipped with Aspeed 2600 BMC SoC.
>>>
>>> Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
>>> ---
>>>   arch/arm/dts/Makefile            |  1 +
>>>   arch/arm/dts/ast2600-minerva.dts | 66 ++++++++++++++++++++++++++++++++
>>>   2 files changed, 67 insertions(+)
>>>   create mode 100644 arch/arm/dts/ast2600-minerva.dts
>>
>> Is this targeting u-boot?
>>
> 
> (if so, please add 'u-boot' via `--subject-prefix` for downstream
> openbmc patches, to help us route them to the expected repo)
> 
> Andrew

Yes, It is for u-boot. I will send it again.

Thanks,
Peter.
