Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 57852155A3E
	for <lists+openbmc@lfdr.de>; Fri,  7 Feb 2020 16:01:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48DdmL3XVPzDqf5
	for <lists+openbmc@lfdr.de>; Sat,  8 Feb 2020 02:01:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::329;
 helo=mail-ot1-x329.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ENlxBtAU; dkim-atps=neutral
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48DdlX5d3lzDqdp
 for <openbmc@lists.ozlabs.org>; Sat,  8 Feb 2020 02:00:38 +1100 (AEDT)
Received: by mail-ot1-x329.google.com with SMTP id r27so2390368otc.8
 for <openbmc@lists.ozlabs.org>; Fri, 07 Feb 2020 07:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=wfdT2YqjuP9CE0MxHPwED0BY4piw+zz7dtpua/txkWU=;
 b=ENlxBtAU611NkbIQ+onb3MuMTECw0BisN6r9kVrxLuu5tKy9kqiSyRs6UyNLRAFRBb
 VVC+5KYp+AZmlZGNBJmjMh5sREbI1CXpH/Z6wgwsHuHhbmfXMfwnMe0GCVBKcRZT0nI2
 hvXO+Wc/0rT7KTh3TplxYo92/bpKRBS85qc2uqNzUyWiq9khOMpSsQjM+RxxtK0eTjAC
 96+HuPn97VcjPAxhHQ+fUaC3zl1nwUv3sLgM1FRbSf2qOWAo6kP9pYI08EsCpZHWgXWb
 cD9rHXHuMOxs7xuY2w+61Ni7LrqUJq15JZGkDw8hyJVOd15gL2AMBKHU44hH7u5MeQOD
 3O5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wfdT2YqjuP9CE0MxHPwED0BY4piw+zz7dtpua/txkWU=;
 b=bukdpZiGuh24KhP7qf9nD9UK/mO9NczzVTVvWeyQO7tKjWv0CP1Q1fe5tKlLUSLb2s
 lLOipdiK0oBkyal+j+Mws0pBRVghaKqMGh00JLFjYN3K0D9Zgevk4QFjVWIE3QANRnVh
 Kd2uiODtGphZA5i1U/Sq7MCwB6d8flLKDPWAsI+oYloC8C9apUc4OtlvLjNIkN9KU32+
 ZSPPojL7b2QIoow9EMAq1IvDQgYthmeb5PmLpeXW88FZfFE1E7MasMVUNOpkI2YNX+Sk
 e0nHxdO8VMQlySBZFikpPnnWNWbRhUDWSZuHnH5xkdO1jjDtulGxmxvEjQYk4Hp6fAk8
 94cg==
X-Gm-Message-State: APjAAAVPQRoeZ8gqD8fNq47hF+2a+NRCt2rX5XKsOaiEEaLZgmlVp7Cf
 G/fJdrsdCQfOAnge7zcYaazqZL+4
X-Google-Smtp-Source: APXvYqw7GCOvLv60MHwWqwivF89StAc0uYJxukHPsD9ul8ycgKy6QRxnbcKlZSHWxHT+nzRRXOiwrA==
X-Received: by 2002:a05:6830:1049:: with SMTP id
 b9mr3175133otp.100.1581087634096; 
 Fri, 07 Feb 2020 07:00:34 -0800 (PST)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id 67sm1069773oid.30.2020.02.07.07.00.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Feb 2020 07:00:33 -0800 (PST)
Subject: Re: Community support - where do want to be in a year?
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <CAG5OiwhNq55Om4=NU8F7SSebDqMQpKhHuhAC-aFz=QKBLM6Wig@mail.gmail.com>
 <77d0f857-e263-4000-b884-46326fc28a74@www.fastmail.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <a4a9ba03-abc1-6ab8-82b6-272a8dbbbc4c@gmail.com>
Date: Fri, 7 Feb 2020 09:00:32 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <77d0f857-e263-4000-b884-46326fc28a74@www.fastmail.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2/5/20 6:55 PM, Andrew Jeffery wrote:
> 
> 
> On Thu, 6 Feb 2020, at 10:32, Kurt Taylor wrote:
>> The new year is well underway, and I have started thinking about more
>> that could be done to enable a stronger, more open community, and to
>> have a better developer experience.
>>
>> I'd like to get your feedback, but please, this is not meant to be a
>> complaint platform, reply with ideas and solutions, or at least an
>> open mind for how we can fix it. I want to hear ideas!
>>
>> I am looking to organize a prioritized list so I (and others?) can
>> focus on making things happen. I am hopeful that my downstream
>> responsibilities will be reduced in the coming months and that we can
>> start making real community progress.

I created a google doc so we can organize (then prioritize). Anyone can 
add ideas or questions, in fact, please do.

https://docs.google.com/document/d/1QCFRGCRofcR3K8clSLtJHw10-Cu9zkp0dvwXPWzQSCc/edit?usp=sharing

>> What are *your* ideas for improving the community?
> 
> Make use of the Contributor Agreement Gerrit configuration if we're
> going to retain CLAs going forward:
> 
> https://gerrit-review.googlesource.com/Documentation/config-cla.html
> 
> Andrew

Thanks Andrew, good idea and definitely one I wanted to capture. I have 
moved it to the google doc.

Kurt Taylor (krtaylor)


