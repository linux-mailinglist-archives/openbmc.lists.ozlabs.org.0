Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C60D232B8B0
	for <lists+openbmc@lfdr.de>; Wed,  3 Mar 2021 15:43:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrGv662Frz3cPF
	for <lists+openbmc@lfdr.de>; Thu,  4 Mar 2021 01:42:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=oYYn/C64;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=oYYn/C64; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrGtt4V2gz2ysr
 for <openbmc@lists.ozlabs.org>; Thu,  4 Mar 2021 01:42:46 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 95D9541220;
 Wed,  3 Mar 2021 14:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-language:content-transfer-encoding:content-type
 :content-type:in-reply-to:mime-version:user-agent:date:date
 :message-id:from:from:references:subject:subject:received
 :received:received; s=mta-01; t=1614782561; x=1616596962; bh=zAo
 saDo5P3li1poi/hBYTdw4AHgmsWndyaMv+52lm9c=; b=oYYn/C643kZ5TyeJZBC
 2FUeOxihlb/re19MkHV3kuT2jISS0U7sOPrrXoozWw25URsXtcsqfy42nG8yUmRp
 +lD8hBckAtq7faLhIQuyvfuU05EVl6QzUxkSisxuN3mNLbsl2zNcdQeAKX9KiiFd
 8jy14ySKqdg8VzxFoEibK8E8=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S2nw-YqeOMTS; Wed,  3 Mar 2021 17:42:41 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id EA69341253;
 Wed,  3 Mar 2021 17:42:40 +0300 (MSK)
Received: from [10.199.0.22] (10.199.0.22) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 3 Mar
 2021 17:42:40 +0300
Subject: Re: RPMS
To: Patrick Williams <patrick@stwcx.xyz>
References: <6ee37eca-0399-fc0d-8f76-1685167505fc@yadro.com>
 <YD+PzxNr6DGFtRU5@heinlein>
From: Alexander Amelkin <a.amelkin@yadro.com>
Message-ID: <bb7ff5cf-a7d5-5a84-18a4-bae040ea1150@yadro.com>
Date: Wed, 3 Mar 2021 17:42:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <YD+PzxNr6DGFtRU5@heinlein>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.199.0.22]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
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

03.03.2021 16:31, Patrick Williams пишет:
> On Wed, Mar 03, 2021 at 01:08:06AM +0300, Alexander Amelkin wrote:
>> Hi all!
>>
>> I have just noticed that we use a wrong unit name for revolutions per
>> minute.
>> The unit we use is called RPMS, which renders to "Revolution Per MinuteS".
>> The term RPM is already plural in nature and doesn't need the 'S' suffix.
> I think you're talking about the dbus interface [1]?

Exactly.

>
> The units in that interface are all in their plural form.  I don't
> recall why we decided to do that originally.

That's right, they are. What I'm talking about is that "RPMS" is, so to 
say, double-plural
because it is already "revolutionS per minute" to which an extra S is 
added.

>> I believe it needs to be renamed to just 'RPM', what do you think?
> In many cases of pluralized acronyms the 's' is moved to the end even
> though it adds ambiguity as to which underlying word is pluralized.  I
> think this is an artifact of spoken English where almost all plural
> forms end with an 's' so it is natural to add them to acronyms.
>
> The Cambridge dictionary indicates that either RPM or RPMs would be a
> valid plural form [2].

Ok, if Cambridge dictionary says so, who am I to argue,
but it makes me, as an engineer, feel uncomfortable. :)

> Interestingly, CFM is arguably both the singular and plural form because
> the 'f' can be 'foot' or 'feet'.

I don't think it is valid to say "cubic foot per minute". A foot (a 
mile, a revolution) is by definition just a single foot (mile, revolution).
It can't be per anything. So it's either "cubic foot" (entity) or "cubic 
fEEt per minute" (rate of change of the amount of the entity).

You don't say "mile per hour", do you? Well, at least I've never seen 
neither "MPHs", nor "MPGs". On the other hand, English is not my mother 
tongue.

>
>> The unit is used very widely, so a lot of files in openbmc project
>> and a number of other project will need to be updated.
>
> We did make a minor mistake in that it should be 'RPMs' and not 'RPMS',
> but I don't really see that as high-value work to fix at this point.  If
> someone wants to go make that change across all the impacted
> repositories, I'd certainly merge it in PDI.  If anyone feels strongly
> about making it 'RPM' instead at the same time, I'd be fine with that as
> well.

Ok. Noted. Thanks. Will think about it. Just needed a confirmation that 
the work, should I decide to do it, won't be in vain.

>
> 1. https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Sensor/Value.interface.yaml#L55
> 2. https://dictionary.cambridge.org/us/dictionary/english/rpm

WBR, Alexander.

