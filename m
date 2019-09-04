Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD80A8527
	for <lists+openbmc@lfdr.de>; Wed,  4 Sep 2019 16:08:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Nlz02JkxzDqx0
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 00:08:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="clXeyBIa"; 
 dkim-atps=neutral
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Nlxf6wpnzDqvw
 for <openbmc@lists.ozlabs.org>; Thu,  5 Sep 2019 00:07:02 +1000 (AEST)
Received: by mail-ot1-x32f.google.com with SMTP id c7so20756487otp.1
 for <openbmc@lists.ozlabs.org>; Wed, 04 Sep 2019 07:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=WPc51IxEjqnnl4dncl/eCscdjMr2u2kbhH+fCQlOEik=;
 b=clXeyBIaM4XjxH85am7l4gYkLbxsamxyRBicqiMFMns0wRrSnALPmK8QIw45tgJ0zZ
 XyMBMB1FXuybnOzZTHpJsiAYVt/+s3pr7ZKbyX5gQi55227WHLeICYSm/yodrWGU1+eT
 hhm+ap6hZjwn66xSnCRJXyG2wIf1W5OLO7WzLmwYzfnIb9um6hqnodVn7VXlUGKYARk5
 XHYnLp4KTYMSngFOA9HyiTHW0jIPHMX6lpUr8LaC5meaWOKmDQbHILCrkmX4ck83AHoY
 qmaWWLgHpU3xPJENlMZMZBZpbeJdnrmsG0JqrdkpqYdsdcG53WTg3SqRunxkzdPgRVg3
 RBgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WPc51IxEjqnnl4dncl/eCscdjMr2u2kbhH+fCQlOEik=;
 b=qG3tdOyd5W2KVsj79tEIa0RH/+emV39JEEeNsvrZ0fQEhbjngtlgHvuv+1bKwFIXle
 0IN46FFiZiOXnO4W4jSYH7wZCzHOEG444JOGBZOTBYY0iIJUC+HteRWdN70TUpMA/xjy
 nN5oDw5aMjLvZ1zvgAnqmrbmZ8A555w4nzpaL1+48L1p87habyNrN0XTxu/8P/bSRRIY
 lD0wnXOFgXvSyApB2SqediT7vw8gwnG4FuqN4wMChwckThn7zgL5sA3aHJGxiB2k1xN5
 XPkOT0crZO34JQs31jvHL/+1BBAfAjJjtVb17dpPsDKpGxwO+gzVBrmEn9hcmtQw+JuS
 bIsA==
X-Gm-Message-State: APjAAAU44H+Al+zt5Ptn0PefVjAdeny282NFeXsrzYTxWat/57qo7XKz
 8OHjfaTk9/w/dbiJrk7txYJ3Wh7k
X-Google-Smtp-Source: APXvYqxJHefnWz3yrJW+anc8oqRlbExOhP+Okch3OnEC5gZuMsirA9T53fHMZccbMN0pLAMQVsqPFw==
X-Received: by 2002:a05:6830:2011:: with SMTP id
 e17mr30453934otp.226.1567606018002; 
 Wed, 04 Sep 2019 07:06:58 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id n109sm7666079ota.36.2019.09.04.07.06.57
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 04 Sep 2019 07:06:57 -0700 (PDT)
Subject: Re: stack overflow tag for openbmc questions?
To: openbmc@lists.ozlabs.org
References: <CALLMt=o3+h7JpEdyFci7BXzpDyN2XvYvDmxOGLwOxaqn9OneNw@mail.gmail.com>
 <CAARXrtkOnosU2N6pvNUCxaRnjbXMBKP=iopC+92Gc0iUmzZL0Q@mail.gmail.com>
 <CALLMt=oQ1muBW+u49OaQkLJDhmqN+vKqSsxTisRARTjBdN0Zsw@mail.gmail.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <3aa37f37-b9c9-f9bb-e125-7e1f998f1c3d@gmail.com>
Date: Wed, 4 Sep 2019 09:06:56 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CALLMt=oQ1muBW+u49OaQkLJDhmqN+vKqSsxTisRARTjBdN0Zsw@mail.gmail.com>
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

On 9/4/19 7:04 AM, Andrew Geissler wrote:
> On Wed, Sep 4, 2019 at 12:33 AM Lei YU <mine260309@gmail.com> wrote:
>>
>> On Fri, Aug 30, 2019 at 2:59 AM Andrew Geissler <geissonator@gmail.com> wrote:
>>>
>>> As a community, we're getting more and more questions via
>>> IRC, the mailing list, and openbmc github issues. Any thoughts
>>> on creating a stack overflow tag to try and get a more searchable
>>> and consistent location for questions (i.e. openbmc)?
>>>
>>> Andrew
>>
>> Done. Tag `openbmc` is created in StackOverflow :)
>> The wiki needs peer review though:
>> https://stackoverflow.com/review/suggested-edits/23960865

Just be careful about sharing code ideas or bug fixes there. The license 
terms may be incompatible if that code wound up in our tree.

I see no problems with answering usage/build questions there.

Kurt Taylor (krtaylor)


