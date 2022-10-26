Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2750560EC00
	for <lists+openbmc@lfdr.de>; Thu, 27 Oct 2022 01:03:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MyPVP3c4wz3cDP
	for <lists+openbmc@lfdr.de>; Thu, 27 Oct 2022 10:03:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dB7SmPQa;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com; envelope-from=adhemerval.zanella@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dB7SmPQa;
	dkim-atps=neutral
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4My68B59Gdz2ywV
	for <openbmc@lists.ozlabs.org>; Wed, 26 Oct 2022 22:31:19 +1100 (AEDT)
Received: by mail-ot1-x336.google.com with SMTP id t4-20020a9d7f84000000b00661c3d864f9so9642255otp.10
        for <openbmc@lists.ozlabs.org>; Wed, 26 Oct 2022 04:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=i5n4oiK3s1rDEvpalpOgnJbA6yOfd99CxCaeDt2OpzQ=;
        b=dB7SmPQa5RaGySX3MXp5jzUgLT7CsWbeb4V7XMAjnLeZSz6pbG84SqjNM5oMh2eFhy
         /cXOzEtlWqJMSdml3q0x4r9+vwHY23wReHXZm+VJjCXf9vCjgngpuNxKoVifOb1NMLpq
         grvM9DKvMw0jhXs9+RKXIjncW36w/atSWST5tL0iWKx3YNmk6UYuXq+Bpfx6FLjahQVL
         kIp6n41iYLKUer0bC2oRbGeLr/yj0e4LqKR/wygADFHOQgF5r4/9qFmsh38cmqr/nLVl
         rTCuK6Bng2Oi65VUhv5iGvv4mj3Namx0zp+HuNjwSZbC359nTZgLE64zTHz4hMsBvNLz
         wJrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i5n4oiK3s1rDEvpalpOgnJbA6yOfd99CxCaeDt2OpzQ=;
        b=KOziMNETO7u0kxJx5osnqcXbCDdt3AsAw/vMGU7ZY2Xw3j15R17BexGuGAUVPEcAyi
         GG6LiLGSgjETvyf62WJYR9CiCCXpQnNlzcF7FJounG5gDqHdCt4pukHM5mc421gx7Gz1
         7TmaKw6Ueqb4rjRGIvQh6MyYFLipZ6yx9OVDaCrrdD+5+UWZIsNyOjUzxhz2Z/AZUH8Q
         ljKWQ+Kq/8RSpWw/Ok6wCnyDKLF3mWEGdi0BZWGz+ccRoaz3J123r5BNMAmgxSDeKBPF
         rNSzvb4qYOpi3CgGqPL2BO0JVf3vsSiP+INeKIO5paGbOIf5kKGu2MDkPUDEf6NjSLMr
         74Zg==
X-Gm-Message-State: ACrzQf152serOoM4ogAQgIaErAODBTPVmJco79MjGE95fimgYXMnMgLo
	8GH3mFeX97lHS/mhj4QAQ25cZg==
X-Google-Smtp-Source: AMsMyM7nBq+ZoRETnfRKRTqgw9DfHET03EP+jmHYxEwag9S3pSnQMIjCDEwLFextjAg1E/Qo4yxNeA==
X-Received: by 2002:a05:6830:6303:b0:65c:5bcd:c2d0 with SMTP id cg3-20020a056830630300b0065c5bcdc2d0mr20828925otb.115.1666783876186;
        Wed, 26 Oct 2022 04:31:16 -0700 (PDT)
Received: from ?IPV6:2804:1b3:a7c0:17c8:3978:9d2:1936:95b? ([2804:1b3:a7c0:17c8:3978:9d2:1936:95b])
        by smtp.gmail.com with ESMTPSA id r6-20020a05687080c600b0013bc95650c8sm2915372oab.54.2022.10.26.04.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Oct 2022 04:31:15 -0700 (PDT)
Message-ID: <55cc0d33-b468-de1f-58f2-9016bf40566d@linaro.org>
Date: Wed, 26 Oct 2022 08:31:12 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: nscd time_t size mismatch problem
Content-Language: en-US
To: Zev Weiss <zev@bewilderbeest.net>
References: <Y1g/C4pinQ1tutC4@hatter.bewilderbeest.net>
 <72f37987-5f8a-99c5-bd36-5153343dcf75@linaro.org>
 <Y1iHuqCmD8k1X2+w@hatter.bewilderbeest.net>
From: Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>
Organization: Linaro
In-Reply-To: <Y1iHuqCmD8k1X2+w@hatter.bewilderbeest.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 27 Oct 2022 10:02:41 +1100
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
Cc: openbmc@lists.ozlabs.org, libc-alpha@sourceware.org, Wayne Tung <wayne.tung@ui.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 25/10/22 22:04, Zev Weiss wrote:
> On Tue, Oct 25, 2022 at 02:13:23PM PDT, Adhemerval Zanella Netto wrote:
>>
>>
>> On 25/10/22 16:54, Zev Weiss via Libc-alpha wrote:
>>> Hello glibc devs,
>>>
>>> We've recently been seeing some misbehavior from nscd in OpenBMC.  It
>>> manifests as lots of log messages like:
>>>
>>>     disabled inotify-based monitoring for file /passwd': No such file or directory
>>>     stat failed for file /passwd'; will try again later: No such file or directory
>>>     disabled inotify-based monitoring for file /group': No such file or directory
>>>     stat failed for file /group'; will try again later: No such file or directory
>>>     disabled inotify-based monitoring for file /hosts': No such file or directory
>>>     stat failed for file /hosts'; will try again later: No such file or directory
>>>     disabled inotify-based monitoring for file /resolv.conf': No such file or directory
>>>     stat failed for file /resolv.conf'; will try again later: No such file or directory
>>>
>>> and so forth.  I initially assumed it was a configure-time --sysconfdir mixup, but after digging into it I found that it actually stems from a time_t size mismatch (this is a 32-bit ARM gnueabi target):
>>>
>>>     $ gdb -batch -ex 'pt time_t' -ex 'p sizeof(time_t)' time/time.o
>>>     type = long
>>>     $1 = 4
>>>     $ gdb -batch -ex 'pt time_t' -ex 'p sizeof(time_t)' nscd/nscd.o
>>>     type = long long
>>>     $1 = 8
>>>
>>> The confusing log messages are thus just the result of the coincidence that sizeof(long long) - sizeof(long) == strlen("/etc"), which causes the disagreement in the layout of struct traced_file to make it look like the 'fname' member just had its directory prefix chopped off.
>>>
>>> In the discussion of the bug in the OpenBMC issue tracker [0], Wayne Tung (CCed) came up with the patch below, which does seem to solve the immediate problem, but if I'm understanding things right does so by just reverting nscd to a 32-bit time_t, and so I'd expect probably wouldn't be considered the "right" fix -- however I don't presently know enough about the 32/64-bit time_t transition and ensuing compatibility concerns to know what the right fix really is.  Should nscd perhaps be using __time64_t or something instead of time_t?
>>
>> Reverting to 32 bits time_t only means that we are postponing some potential
>> failure to y2038, we really move everything to 64 bit time_t.  Could you check
>> if the following patch fix it?
>>
>> The issue is we do build nss modules with 64 time_t, however some features
>> are built on libc.so itself and in such cases we need to explicit use the
>> internal __time64_t type.
>>
>> diff --git a/nscd/nscd.h b/nscd/nscd.h
>> index 368091aef8..f15321585b 100644
>> --- a/nscd/nscd.h
>> +++ b/nscd/nscd.h
>> @@ -65,7 +65,7 @@ typedef enum
>> struct traced_file
>> {
>>   /* Tracks the last modified time of the traced file.  */
>> -  time_t mtime;
>> +  __time64_t mtime;
>>   /* Support multiple registered files per database.  */
>>   struct traced_file *next;
>>   int call_res_init;
>>
> 
> Ah, great -- after testing that out I can confirm that it appears to fix the problem.  Thanks!
> 
> Also, after sending that email I discovered that there's an existing bugzilla issue for this same problem (https://sourceware.org/bugzilla/show_bug.cgi?id=29402), so that can presumably be closed once a fix is committed.

I will send a proper path and I will check if there are any other instance of time_t
that is used internally as this.
