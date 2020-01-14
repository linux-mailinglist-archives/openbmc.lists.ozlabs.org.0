Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F7213AF1A
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2020 17:20:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xwfh4R6YzDqG0
	for <lists+openbmc@lfdr.de>; Wed, 15 Jan 2020 03:20:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22f;
 helo=mail-oi1-x22f.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TV7/+Vva; dkim-atps=neutral
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xwV56yGDzDqK3
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jan 2020 03:13:01 +1100 (AEDT)
Received: by mail-oi1-x22f.google.com with SMTP id i1so12301673oie.8
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jan 2020 08:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hTpS1iAIyE4b0R+a1B4oGsi0MHFe3b3L2kLjopHlsvA=;
 b=TV7/+VvaILshcV/dw1xdNfPlBSbkpUaKn7mX7E7yG3fTP/9CoPy69PDtWDOl/G8MJT
 TwCVII5gTVYs0FcQdeDS9foBH1w+ASvk/kF8PjqMC8y9o8GaP+ZbllG4bap9wut4mhf3
 BjPFaIUfE4gexvwcyJ9I7adcHSZKfPjWD4naUAVb0w/lmNhjRW2Y71Xd+iHqnRYTClMo
 zShfiVx5bJQ/qy36erVn0mCzmlzYjrqgJ2EUd212123V4K6FADggaQEMWNLL1OWblKVL
 aKdBZIzaTwTR6NyvigZ3hU030F81jaehGIludXJdbJ9rqVoetFgeGoniVw3lhu2TRzPg
 SsJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hTpS1iAIyE4b0R+a1B4oGsi0MHFe3b3L2kLjopHlsvA=;
 b=Nwt3vX43Mh7bUrRnZekie8EC1UJI9W0F0IBtx56ETojHK1/udG5PTjB5Uz5Z17vYAY
 r8FM7hlR5vTk3J/zGFqtj4MXN09SDzsKnzvfqGJI8d9hJ9S8SlorLjNPHr2PcfAlMm9n
 HsTjkB9h55HouARKsdT5ML8yweae7ZX1cYfBX1kqp4aQoYONAX1CDT3ktvSTpIYiHEq9
 wjDN0EXZeopDSf6hzQP0mVwgcWwxl7JfbFtUD4qgGN3Q/FHpJlBGHzdxaog/1WyGW6RT
 9un7M92CqW3Pb7otyoV4A05nntQPHb2C24Ab/H17DDKaDaqkcGTyDTCM8HaqTjsdJ2wi
 mHlQ==
X-Gm-Message-State: APjAAAWlXrFGO2GUrwgE+wlqC98QNhiBLuaA6LrFsi1qL60uxSitYknx
 2v2vwlyaKBf248Vz0pfxbqoTalTe
X-Google-Smtp-Source: APXvYqz+lyNyO8MhX2BkNuSvUPLMsUtcXHWDTaQHKA9nX8AEqraEZ3p0OM0P/Rcx7CHubqr5cpK2eQ==
X-Received: by 2002:aca:110a:: with SMTP id 10mr17703308oir.130.1579018376155; 
 Tue, 14 Jan 2020 08:12:56 -0800 (PST)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id v200sm4709454oie.35.2020.01.14.08.12.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 Jan 2020 08:12:55 -0800 (PST)
Subject: Re: [External] Re: Add member into Lenovo designated employees list
To: Duke KH Du <dukh@lenovo.com>, Benjamin Fair <benjaminfair@google.com>
References: <0700dec94d76447faae7ab98c0c04516@lenovo.com>
 <CADKL2t5wk+2Yd39=XLih7vFsACrgmsJp96b-su_S5zLis6EgDg@mail.gmail.com>
 <16a6405b-bbcb-e85d-47bb-280d51fe6785@gmail.com>
 <9f04dca2a58d4fb283c80e346a3b05fa@lenovo.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <ce1d6193-be75-7509-3abd-efdb9d743ae7@gmail.com>
Date: Tue, 14 Jan 2020 10:12:54 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <9f04dca2a58d4fb283c80e346a3b05fa@lenovo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 1/13/20 5:56 PM, Duke KH Du wrote:
> Hi Kurt,
> 
> I had updated the information you needed on 12/17 already.
> Refer to the attached mail.

You are updated and good to go! Thanks for keeping this list current.

My apologies, for whatever reason I did not receive that on the 17th. I 
appreciate your patience, but always feel free to ping me on IRC if you 
haven't heard anything from me in a couple of days.

Kurt Taylor (krtaylor)

> Thanks.
> 
> -----Original Message-----
> From: krtaylor <kurt.r.taylor@gmail.com>
> Sent: Monday, January 13, 2020 3:55 PM
> To: Benjamin Fair <benjaminfair@google.com>
> Cc: openbmc@lists.ozlabs.org; Duke KH Du <dukh@lenovo.com>
> Subject: [External] Re: Add member into Lenovo designated employees list
> 
> On 1/10/20 11:22 AM, Benjamin Fair wrote:
>> Hi Kurt,
>>
>> Could you take a look at the CCLA update from Lenovo when you get a chance?
> 
> Yes, I have already communicated with them (Dec 13th) about what I am needing.
> 
> Kurt Taylor (krtaylor)
> 
>>
>> Thanks,
>> Benjamin
>>
>>
>> On Fri, 6 Dec 2019 at 12:45, Duke KH Du <dukh@lenovo.com
>> <mailto:dukh@lenovo.com>> wrote:
>>
>>      Hi Master,____
>>
>>      __ __
>>
>>      I would like to add more members of Lenovo in the designated
>>      employee list as below in Red.____
>>
>>      Could you help on that?____
>>
>>      __ __
>>
>>      Schedule A____
>>
>>      Initial list of designated employees. NB: authorization is not tied
>>      to particular Contributions.____
>>
>>      Please indicate “CLA Manager”next to the name of any employees
>>      listed below that are____
>>
>>      authorized to add or remove designated employees from this list in
>>      the future.____
>>
>>      __ __
>>
>>      CLA Manager:____
>>
>>      Duke Du dukh@lenovo.com <mailto:dukh@lenovo.com>____
>>
>>      __ __
>>
>>      Other designated employees:____
>>
>>      Andrew Peng pengms1@lenovo.com <mailto:pengms1@lenovo.com>____
>>
>>      Yonghui Liu liuyh21@lenovo.com <mailto:liuyh21@lenovo.com>____
>>
>>      Lisa Liu liuyj19@lenovo.com <mailto:liuyj19@lenovo.com>____
>>
>>      __ __
>>
>>      Payne Yang pyang4@lenovo.com <mailto:pyang4@lenovo.com>____
>>
>>      Harry Sung hsung1@lenovo.com <mailto:hsung1@lenovo.com>____
>>
>>      Ivan Li rli11@lenovo.com <mailto:rli11@lenovo.com>____
>>
>>      Derek Lin dlin23@lenovo.com <mailto:dlin23@lenovo.com>____
>>
>>      __ __
>>
>>      Thanks.____
>>
>>      *From:* Duke KH Du
>>      *Sent:* Monday, April 8, 2019 8:44 PM
>>      *To:* openbmc@lists.ozlabs.org <mailto:openbmc@lists.ozlabs.org>
>>      *Subject:* Add member into Lenovo designated employees list____
>>
>>      __ __
>>
>>      Hi master,____
>>
>>      __ __
>>
>>      I would like to add our new member in Lenovo designated employees
>>      list as below in RED color.____
>>
>>      __ __
>>
>>      Could you help on it?____
>>
>>      Thanks.____
>>
>>      __ __
>>
>>      Schedule A____
>>
>>      Initial list of designated employees. NB: authorization is not tied
>>      to particular Contributions.____
>>
>>      Please indicate “CLA Manager”next to the name of any employees
>>      listed below that are____
>>
>>      authorized to add or remove designated employees from this list in
>>      the future.____
>>
>>      __ __
>>
>>      CLA Manager:____
>>
>>      Duke Du dukh@lenovo.com <mailto:dukh@lenovo.com>____
>>
>>      __ __
>>
>>      Other designated employees:____
>>
>>      Andrew Peng pengms1@lenovo.com <mailto:pengms1@lenovo.com>____
>>
>>      __ __
>>
>>      Yonghui Liu liuyh21@lenovo.com <mailto:liuyh21@lenovo.com>____
>>
>>      __ __
>>
>>      Lisa Liu liuyj19@lenovo.com <mailto:liuyj19@lenovo.com>____
>>
>>      __ __
>>
> 

