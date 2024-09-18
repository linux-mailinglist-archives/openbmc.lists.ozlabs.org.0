Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A98497BF7B
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2024 19:10:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X84sV2MrMz30W2
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2024 03:10:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::633"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726679418;
	cv=none; b=GmhwhJSkXDB/HdaQT+P3fqPSGsnP042mVwNs7J7x8O4jAosqEgcrjoEZwpoaxyklpbw6VHbvGjgembPNlvDUYRU6w6xjTo0cp95+zlS7TY6VZ/yB7UjCRH1ZhkV4hch4PYWAWzIWGbZlHcF8H8XBGcNDADW7Baspy1aksI8j5G2/CHYXFyNSWJ1STM1IqVp5xvEQTmJPllzkg/WDDE0Y7L/TjttP+wOf0EargVhbQLS/cwvaXxaaPJh4L94MmeS1tcuqwXvDpyeuUtSKvENSEAKmNE/NZpMSNIBGMYq9gPE5zoMyAiwCMp83vA3pBZguzhLd+nGb/bWPMKfRj3KkPg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726679418; c=relaxed/relaxed;
	bh=Q9vYLjiVwTBRNkEh1sg4rE4Yh0l+ekkx9H32x9BbROM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OJf0RQB4pcpQ0l/oiSMAIrJ5PnzAT0IF6oiqi+a1x0MgrR37T4agfgQz+ZeR9jZ6hTHkiDn16r3yjFhJUL+KRRzS9Hvd4Fzb+SjMgZiwahU+CfEZpvA+9jFUqTnlrhwnnLB16EQ3Gj7F5G8Uws/7d2cqfGKAxxMGchZKaJWcDCHviOt9n6T40D+T97SeCrzBterafpU+xEvI4CqKYP5MBoF7lkLPEpCWe+qDEd2abCpHvNynBOMFK0IkX2b9PGw7k9V1z+tHlGufhWpPsTQH/n9haaXZZ/j12cG48L0O/CzM6pdZ03dSkLJViTVgKCvAwYNtjw7cehaGE8alPQmRug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XRXvZe2m; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XRXvZe2m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X84sQ2vqzz2xX3
	for <openbmc@lists.ozlabs.org>; Thu, 19 Sep 2024 03:10:17 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-205659dc63aso69068085ad.1
        for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2024 10:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726679415; x=1727284215; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9vYLjiVwTBRNkEh1sg4rE4Yh0l+ekkx9H32x9BbROM=;
        b=XRXvZe2mgTbcalNTMTk6C9hLAYGbwnUtmnLPELZvS6g4ZmQQI10YMVQABUAy1xZPP2
         qX7q5oUuyNncC161OmxIlrry9DJugmSCxLgLvrs6KI1pkmlOin//532VzKJ9fA4ExplS
         7Zm7fOfs7Ck6Y+ZFuE6dzHunnwXeF2jiYAWR/gcgM9z7VDW2x+QnpBFmf1ciKgzjvUwO
         jWyYWeEGGtmYR+/i4F9K6qB943S4Sj/U77iDI11s43gAK6loSiOAFFSYwrmSy5a+RFG/
         ml88hA7tpfOKVZ6DEmjx4QP5iBHhQSM46hb3gs9pSJJEoMTAYyOTWyNR51V/LkhcF9M6
         nJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726679415; x=1727284215;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q9vYLjiVwTBRNkEh1sg4rE4Yh0l+ekkx9H32x9BbROM=;
        b=Gn7VFh7GvV0gxityhiinjCmWqzuyKLZbieQrsKH7p98BtfslaPwSbUax4L+fIcRRUF
         54EOyVHaIPzCLvHEz2ByoPQSpzigxFE6hwRdWv9VlD3EjYRY4GI7y29pPywx+M2jEgxo
         mbG4Iz3ZwoC8Bosqoc+C1ubOame3fptr1w9h9mx3tCJTycEKQxF74DXAFC/E485z5ThJ
         cnuaUBP7IxI7nP1q6aS/XatRqD5OT+hpUVl3dthhRgdsSACdMX6m7NcWIqC0DpcE0poh
         hXOYeliZzspHBwBzML7yPBqxU7dzvdjAz5Zugb6EG5PVvYbXpeqPoQ1kDMW1XlRnKxb3
         5srA==
X-Forwarded-Encrypted: i=1; AJvYcCVO+cWwFpaB7tOzxBwNx0vA8boCh+0ZSuEqkZr62qiCuG9IbKnHNkI0OmDjdOAz4IcKvcXXSUQA@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywqb37QtePWy7H7dYagqObqZwC1TMlP+/D611sdtVERk+o0T591
	XOjHLOaIZebxilY6GArPIuT/IHqVOidpM60Bu+yte7lQc9LYpMw6
X-Google-Smtp-Source: AGHT+IG7GNSvr8+amUbtoVcCNV1j4OWJUtz3aEZS7UZH2lE7/JoEJJo29C7TH56J0oLyU/dh9yhRNQ==
X-Received: by 2002:a17:902:f78d:b0:205:968b:31cf with SMTP id d9443c01a7336-2076e3f6207mr359427765ad.33.1726679414695;
        Wed, 18 Sep 2024 10:10:14 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2079475df17sm67301865ad.298.2024.09.18.10.10.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Sep 2024 10:10:14 -0700 (PDT)
Message-ID: <981f64c0-4625-4af1-8132-7dcae32a457d@roeck-us.net>
Date: Wed, 18 Sep 2024 10:10:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: hwmon: Add adt7462
To: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Chanh Nguyen <chanh@os.amperecomputing.com>, Jean Delvare
 <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Open Source Submission <patches@amperecomputing.com>
References: <20240918103212.591204-1-chanh@os.amperecomputing.com>
 <bc13d8fd-4f03-4445-bc4a-1e0ca7c23ef7@kernel.org>
 <6b1fd95a-ef4f-4d2f-af27-6c70a60754fa@amperemail.onmicrosoft.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <6b1fd95a-ef4f-4d2f-af27-6c70a60754fa@amperemail.onmicrosoft.com>
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
Cc: Thang Nguyen <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>, Khanh Pham <khpham@amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 9/18/24 09:07, Chanh Nguyen wrote:
> 
> 
> On 18/09/2024 20:09, Krzysztof Kozlowski wrote:
>> On 18/09/2024 12:32, Chanh Nguyen wrote:
>>> Add device tree binding and example for adt7462 device.
>>>
>>> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
>>> ---
>>>   .../bindings/hwmon/onnn,adt7462.yaml          | 51 +++++++++++++++++++
>>>   1 file changed, 51 insertions(+)
>>
>> Where is any user? This is supposed to be sent along driver change
>> implementing this compatible.
>>
> 
> I'm using this device on my platform, and I'm preparing upstream my device tree. So, I pushed the dt binding before.
> 
> I'm also quite surprised that there aren't any platforms using adt7462 yet.
> 

I am sure there are (or used to be) platforms using it, only there are possibly
no _devicetree_ based platforms using it. After all, the chip is old. The driver
was added back in 2008, and the first version of the datasheet was published
in 2006.

Guenter

