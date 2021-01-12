Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C74D2F2A4E
	for <lists+openbmc@lfdr.de>; Tue, 12 Jan 2021 09:49:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DFPQn3Bs5zDqx6
	for <lists+openbmc@lfdr.de>; Tue, 12 Jan 2021 19:49:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b;
 helo=mail-pl1-x62b.google.com; envelope-from=sunithaharish04@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=a8xIEmo5; dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFPPq2fGJzDqbW
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2021 19:49:01 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id x18so1038250pln.6
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2021 00:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=wVvifCx7ffMCwywfaATxgty2BHr7LsioQdgC9F3E7nE=;
 b=a8xIEmo5VIBc1Fbpy5lNalcBUmzTOJ9DtBfs8VUogrOGVVJnX2jrTaPuHKk3bnnbqK
 c0aNrClq+zirEUU52hwqa2TUjFKBaltWHm7e2GP1s5QT+qukFbCrJyu8XtKtNlsEqoNs
 FRXF0Jkg0R2PZAnuPEbZLKAiLzfbm53kTfiSnvzetHjcBSiwiUCz2cvBhFVqjgmoTFUE
 opfvuskF6DXqJvEPhGav4gouIYIRhqKcLCmT5sER+XhGspu7dUFk4t87HmAVwILzWWz6
 hzYK/yMpCP5/L4V2qHQ4PeaOcOJv39SYjuxiyMJBFp6nuD94cfdd+9MwmQimdoOOVFXQ
 ijqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=wVvifCx7ffMCwywfaATxgty2BHr7LsioQdgC9F3E7nE=;
 b=HpNeD74ICiv/SpG9BG/Cdq/o7/DKZrVN6r17HI8QMEEd18fNUWRBKcHqz93FbEep9H
 7KfysjgD7VFQmY9s9gDu/ixfotNJEkfgGkMVKEZt0z8V1A4ALHY0w+GO4LqbeVp4amtL
 sYQm+tVWJZwJzBfibTpHp9/Hi/77E3GJE5Kf2G87l2kK/f0BnhHP+LgrbKukUvU7TQUG
 onvZM96MBzqEjx8U2VGGrUk1dVaJFY4+rh6V3+tQNJDLHkevYsa1h0/2ovPNHD43tqnv
 HEx+xJufe7I62PDljo5EAyz/L2UBCBR2TrgJPkyR5t6QVWX+ShNLkZDq9XK44QUbMhmP
 bdvg==
X-Gm-Message-State: AOAM530UvXP/Irxp3qrWBzQmxwSZVtW3AsONHIdY8fxTdQOrMw1K41de
 p3MlSa/SRob3en0BTJ9pUSg=
X-Google-Smtp-Source: ABdhPJxvuYMQZH8wgrmT/342sE7snaNZehbLmEx0AVP7Li7Raz4aZ6K6kf3cjmWtvPLRM8CCGiE04w==
X-Received: by 2002:a17:90a:73c5:: with SMTP id
 n5mr3477865pjk.118.1610441337372; 
 Tue, 12 Jan 2021 00:48:57 -0800 (PST)
Received: from [192.168.0.102] ([124.123.104.226])
 by smtp.gmail.com with ESMTPSA id s7sm2124331pfh.207.2021.01.12.00.48.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 00:48:56 -0800 (PST)
Subject: Re: pthreads at bmcweb
To: Milton Miller II <miltonm@us.ibm.com>
References: <5181a536-a026-2f91-7335-f6a75b4694ab@gmail.com>
 <OF03EE7F69.B8367FEE-ON00258655.00640A4B-00258655.00640A53@notes.na.collabserv.com>
From: Sunitha Harish <sunithaharish04@gmail.com>
Message-ID: <f2ef1579-4850-5e72-9e22-ef2f6c07382f@gmail.com>
Date: Tue, 12 Jan 2021 14:18:53 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <OF03EE7F69.B8367FEE-ON00258655.00640A4B-00258655.00640A53@notes.na.collabserv.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: openbmc@lists.ozlabs.org, apparao.puli@linux.intel.com, edtanous@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Thanks Milton for sharing your views.

Awaiting more inputs/feedbacks from the community.

Regards,
Sunitha

On 06-01-2021 23:42, Milton Miller II wrote:
> On Jan 6, 2021 Sunitha Harish wrote:
>>      Hi team,
>>      Reference commit
>> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/31735 :
>>      In order to handle the multiple push-style event subscribers,
>> bmc       needs to support the async resolution of the subscribers
>> address.       The async_resolve() API crashes if there is no thread
>> support in       the binary.
>>      I created a bmcweb binary patch by pulling this commit and
>> including the pthread. This works fine for the use-cases, but
>> increased the bmcweb binary size by 220KB.
> ?
>>      Ed's suggestion is not to use the pthreads, instead implement
>> alternatives to do the same job, so that the binary size is kept
>> minimum. He mentioned: "Considering that's a ~30% increase in binary
>> size to support one line off code, and most systems are already at
>> their binary size limit, no, that's not going to be acceptable. We
>> can either patch boost to use this
>> https://man7.org/linux/man-pages/man3/getaddrinfo_a.3.html or we
>> could build our own resolver type that calls that underneath.  This
>> was based on a quick lookthrough of solutions in Google.  I'm open to
>> other ideas here".
>>      I am looking for the community views about the increased bmcweb
>>      binary size v/s having a custom implementation for asyc_resolve.
>>       Please share your views & ideas to get to the best solution.
> I agree with Ed that adding pthreads is a step that should be taken
> with a lot of caution.   In addition to the binary size, a threaded
> application also adds security audit concerns.
>
> A quick search with the query of "dns lookup library embedded" found
> a possible library with a probably compatible license (although last
> update was 4 years ago), and the second link was a survey of other
> client and server packages that could be investigated.
>
> My personal opinion only.
>
> milton
>
