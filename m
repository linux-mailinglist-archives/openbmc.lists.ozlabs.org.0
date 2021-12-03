Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EDC4671B0
	for <lists+openbmc@lfdr.de>; Fri,  3 Dec 2021 06:35:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J51km1bwHz3bT7
	for <lists+openbmc@lfdr.de>; Fri,  3 Dec 2021 16:35:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=LNr6GWB9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::436;
 helo=mail-pf1-x436.google.com; envelope-from=suichen@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=LNr6GWB9; dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J51kK5mKbz2yPj
 for <openbmc@lists.ozlabs.org>; Fri,  3 Dec 2021 16:35:19 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id g19so1828119pfb.8
 for <openbmc@lists.ozlabs.org>; Thu, 02 Dec 2021 21:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1MNPz6WE52QSr+7j6Q9Dzeo7RAlFzOR7yieEdRW5DUg=;
 b=LNr6GWB9XpqtlOa6lOOVUPMjte+sUfDC8tYwcxhqkLYMyOxDeLzJD2P9Lhdbx5JWaP
 rsFRO/doQwQ+vWvx0kWBDSsOCRyKGYEvVZ3sinZ1z6T5tlD/VUc26AqnUiiJ4emN+Z6c
 cUnHYqwrz5Hot0raOBt4mkQSF/uTCukbPoRf/l7ThAtkbmAuj4lfTHSV48cOyl4abcjM
 sJ6Em0MQsfGI2HNrLbhWLJCQRBhVMnB3qBsGpgB8pMHMdxXazLq+5d2YOAzPz8HNsSHj
 RlMRzCZ1uraWlXY9gIpwaPKmLIr75T4lsS8DdeNflnl8DaSyHEBJerCBqi5Lz+MtlQP5
 k7tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1MNPz6WE52QSr+7j6Q9Dzeo7RAlFzOR7yieEdRW5DUg=;
 b=vdpMhATXS1xlt/T76xcWi0JVM+2rOb8k5SvaFCsGLU2OW/vDHYHrOlmhae0808cbhQ
 Ax4Tnu2o4khBUM50SqYyWEQK2/1z33SWKiP2NQD9+tXuL6Hsp/vAOMbT8B+/h2NYw7gX
 3xoj9jFuktaxN09IAZNIE7WUzp6ICI3y+Ns7BnpfLf+JO7/k3rjYxd+/SYSStLiBKawr
 xa7DGvKq4Ef97mh/VFfTdlziG4o+U+h1QJhvwzqa7uzq0M8btcanPqs8C+7l8uK1jg2R
 IcievvUj5sopmlbeFyv28BVvVr5BfPvuYHgUgkHbNSQEbcEzdEe4EAaWblPSTh8deEea
 98Zg==
X-Gm-Message-State: AOAM531OPO89txLZkz7euQM0r5MP0qxMWySnpuyV5ZKM1ehWt8ZKkiCY
 3SES1gR7qhtSNynpVckqYrVOgQ==
X-Google-Smtp-Source: ABdhPJwfEKBuVAwyPLEbgiyRgYzjB/g3+CZ7ZcN067XoXFLuPgfSdoSs/5GNP9AhFYeiYJMmFC8daw==
X-Received: by 2002:a63:4d8:: with SMTP id 207mr2900748pge.549.1638509716161; 
 Thu, 02 Dec 2021 21:35:16 -0800 (PST)
Received: from [100.115.92.196] (c-73-189-176-14.hsd1.ca.comcast.net.
 [73.189.176.14])
 by smtp.gmail.com with ESMTPSA id t8sm1181698pgk.66.2021.12.02.21.35.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Dec 2021 21:35:15 -0800 (PST)
Subject: Re: [RFC Patch v2 1/3] i2c debug counters as sysfs attributes
To: Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org
References: <20211203023728.3699610-1-suichen@google.com>
 <20211203023728.3699610-2-suichen@google.com>
 <10e59e850894524d34cc7d89c126ab9133e6a1a7.camel@perches.com>
From: Sui Chen <suichen@google.com>
Message-ID: <c3e3d7fe-765e-defa-275b-0b5e731c77ce@google.com>
Date: Thu, 2 Dec 2021 21:35:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <10e59e850894524d34cc7d89c126ab9133e6a1a7.camel@perches.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: benjaminfair@google.com, andrew@aj.id.au, openbmc@lists.ozlabs.org,
 tali.perry1@gmail.com, krellan@google.com, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 12/2/21 6:50 PM, Joe Perches wrote:
> On Thu, 2021-12-02 at 18:37 -0800, Sui Chen wrote:
>> This change adds a few example I2C debug counters as sysfs attributes:
>> - ber_cnt (bus error count)
>> - nack_cnt (NACK count)
>> - rec_fail_cnt, rec_succ_cnt (recovery failure/success count)
>> - timeout_cnt (timeout count)
>> - i2c_speed (bus frequency)
>> - tx_complete_cnt (transaction completed, including both as an initiator
>>    and as a target)
>>
>> The function i2c_adapter_create_stats_folder creates a stats directory
>> in the device's sysfs directory to hold the debug counters. The platform
>> drivers are responsible for instantiating the counters in the stats
>> directory if applicable.
> 
> Please try to use scripts/checkpatch.pl on your patches and see if
> you should be more 'typical kernel style' compliant.
> 
> Ideally, use the --strict option too.
> 

Hello Joe,

I thank and really appreciate your spending time commenting on the 
patch, and on its previous version too. I ran checkpatch.pl and found a 
few code style fixes on patches 1 and 2.
Sorry for not checking the format before sending the email, I will 
definitely do the format check next time.

Regarding the patch itself, code style aside, we're wondering if this 
idea of exporting I2C statistics to sysfs looks reasonable? Do we need 
to accompany this change with design documents too (similar to PCIe AER 
reporting?)

We have done some more I2C-related performance and reliability tests; 
however it might take some more efforts to explore those ideas and 
summarize them into patches/documents. For now we would like to know 
about the comments on this sysfs attribute change first, since it is the 
initial step to the larger effort. Any comments will be greatly appreciated.

Thanks,
Sui
