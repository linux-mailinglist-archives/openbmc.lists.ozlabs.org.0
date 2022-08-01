Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F475873B2
	for <lists+openbmc@lfdr.de>; Tue,  2 Aug 2022 00:03:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxXFX4Htpz3bXG
	for <lists+openbmc@lfdr.de>; Tue,  2 Aug 2022 08:03:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=Qivfayoc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com; envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=Qivfayoc;
	dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxXF66Tfdz2xGF
	for <openbmc@lists.ozlabs.org>; Tue,  2 Aug 2022 08:03:22 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
	by mta-01.yadro.com (Postfix) with ESMTP id CAA5541222;
	Mon,  1 Aug 2022 22:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:organization:from:from:references:content-language:subject
	:subject:user-agent:mime-version:date:date:message-id:received
	:received:received:received; s=mta-01; t=1659391398; x=
	1661205799; bh=sz+AwA5jWoBS5EmLnQh/eU8R9TOjFDanFh5N1CGV6Is=; b=Q
	ivfayocMZeC2NaTZ+N8Hb4aj/YwImHEE3rxOETy41i622/2MY2eQU6T/Re+LXXnz
	rOSPlmQ54imdZdERi8BIAA2vz33A3iILropQ5CHLTQ/yBBs+EMyhGXrtvkVMfIYh
	OreIcBrUSuEyvpZIWZGJliAAlAq5yXZR0v8woRxp4U=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
	by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kwEFZqjWsOQz; Tue,  2 Aug 2022 01:03:18 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com [172.17.10.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Postfix) with ESMTPS id B1C4041220;
	Tue,  2 Aug 2022 01:03:18 +0300 (MSK)
Received: from T-EXCH-08.corp.yadro.com (172.17.11.58) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Tue, 2 Aug 2022 01:03:18 +0300
Received: from [10.199.0.99] (10.199.0.99) by T-EXCH-08.corp.yadro.com
 (172.17.11.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1118.9; Tue, 2 Aug 2022
 01:03:18 +0300
Message-ID: <f4b0687a-11f1-9643-46c0-f2fd516c5f9d@yadro.com>
Date: Tue, 2 Aug 2022 01:03:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Can we improve the experience of working on OpenBMC?
Content-Language: en-US
To: Ed Tanous <edtanous@google.com>
References: <3df049fc-e5ec-449e-b696-a2ca86c37ed3@www.fastmail.com>
 <7f80cb3f-def3-f9ca-58f2-eebe053dfd89@yadro.com>
 <CAH2-KxAWTgmc_C_vEkB-zObOG9La-u5H0=_8YdauCkunaVsefg@mail.gmail.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Organization: YADRO
In-Reply-To: <CAH2-KxAWTgmc_C_vEkB-zObOG9La-u5H0=_8YdauCkunaVsefg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.0.99]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-08.corp.yadro.com (172.17.11.58)
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

>> 13. D-Bus is hard for newcomers not familiar with it, best practices are
>> not described,
>> inter-process synchronization when accessing large d-bus objects (like
>> network interfaces)
>> is not inherent to d-bus, and auxiliary synchronization using standard
>> POSIX means is neither
>> explicitly requested/advised, nor controlled/enforced.
>> All that may lead
>> (and have previously led) to
>> races and various other problems. Add to that the long and inconvenient
>> prefixing that we've
>> discussed earlier in another thread where Brad has supported my point of
>> those being useless
>> to the project.
>>
>> 14. D-Bus may become a bottleneck or a slowing factor (due to the
>> context switching overhead) for
>> the situations when two processes are communicating actively. A standard
>> POSIX IPC like pipes,
>> mq or shm could become a solution (with d-bus or any other method used
>> as an aid to negotiate
>> names, keys, or whatever other credentials needed to access a common IPC).
> FWIW, in the original context of "a single repo would help with these
> things" I don't think either of these would be helped with a
> rearrangement of code.

Well, I don't think a single repo would help actually if we want to
keep the system modular and versatile as it is (and what is definitely 
good).

> With that said, lots of people dislike dbus.  There are performance
> critical things (SOL, KVM, Virtual media) that have completely avoided
> it.  If you have a proposal for something better, I'd highly recommend
> writing up a design doc.

Yes, you're right that I'm not currently proposing anything specific, 
and that it
would surely require a start with a design document.

However, I thought the idea of Andrew's message was to outline the problems,
and it looks to me like you more or less agree that those are problems, 
don't you?

> Or, alternatively, there's u-bmc that from the sounds of
> reading your above is closer to your ideal in terms of trade offs (no,
> IPC, efficient point to point comms with grpc), it might be worth
> looking into for either using directly, or porting some of the ideas
> it encompases into OpenBMC. 

Thanks for the hint, I will look into that.

WBR, Alexander.

P.S. I feel like I must apologize for maybe sounding rude or somehow 
inappropriate sometimes.
As you may know, English is not my native language and I, despite the 
vocabulary and the ability
to construct more-or-less proper sentences, may often lack the ability 
to properly/politely express
my ideas or understand the tone and/or subtle meaning of what other 
people say or write.
Please forgive me for that, no offense or disrespect is ever implied on 
my side.

