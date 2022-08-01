Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2219587356
	for <lists+openbmc@lfdr.de>; Mon,  1 Aug 2022 23:28:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxWSV6XGdz3054
	for <lists+openbmc@lfdr.de>; Tue,  2 Aug 2022 07:28:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=wCO5V57l;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com; envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=wCO5V57l;
	dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxWS42NZyz2xk9
	for <openbmc@lists.ozlabs.org>; Tue,  2 Aug 2022 07:27:48 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
	by mta-01.yadro.com (Postfix) with ESMTP id 1E49F40888;
	Mon,  1 Aug 2022 21:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:organization:from:from:references:content-language:subject
	:subject:user-agent:mime-version:date:date:message-id:received
	:received:received:received; s=mta-01; t=1659389262; x=
	1661203663; bh=MsBGI2JvYqHKSHPMncINOcmnqosQZa9SDKUAZBbolcc=; b=w
	CO5V57l4ing1z8nkt7IIWjUULrKZyJ+Gko/BD7A4iMqTwCWHm671XX2/eHYJzuR0
	duBnFAQDzSYz03CSy8DaEzOzlYQFvELzN86j/un203qxgl73VJ6Fm9xdL5XuFpf7
	I+Fbnr328HNStqKpTlx9oXAnoYBC+Y/QgMEkeOdUpc=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
	by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3pqtbbPJJG5F; Tue,  2 Aug 2022 00:27:42 +0300 (MSK)
Received: from T-EXCH-01.corp.yadro.com (t-exch-01.corp.yadro.com [172.17.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Postfix) with ESMTPS id DA1AD40311;
	Tue,  2 Aug 2022 00:27:41 +0300 (MSK)
Received: from T-EXCH-08.corp.yadro.com (172.17.11.58) by
 T-EXCH-01.corp.yadro.com (172.17.10.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Tue, 2 Aug 2022 00:27:41 +0300
Received: from [10.199.0.99] (10.199.0.99) by T-EXCH-08.corp.yadro.com
 (172.17.11.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1118.9; Tue, 2 Aug 2022
 00:27:40 +0300
Message-ID: <7f80cb3f-def3-f9ca-58f2-eebe053dfd89@yadro.com>
Date: Tue, 2 Aug 2022 00:27:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Can we improve the experience of working on OpenBMC?
Content-Language: en-US
To: Andrew Jeffery <andrew@aj.id.au>, <openbmc@lists.ozlabs.org>
References: <3df049fc-e5ec-449e-b696-a2ca86c37ed3@www.fastmail.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Organization: YADRO
In-Reply-To: <3df049fc-e5ec-449e-b696-a2ca86c37ed3@www.fastmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Benjamin Fair <benjaminfair@google.com>, Ed Tanous <edtanous@google.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>, Heyi Guo <guoheyi@linux.alibaba.com>, jebr@google.com, scody@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrew!

27.07.2022 04:22, Andrew Jeffery пишет:
> # Problems
>
> 1. Yocto is hard
>      1. Managing patch stacks is hard
>      2. Yocto-specific tooling is hard
>      3. Finding the right recipe file to inspect/modify is hard
>      4. Yocto has too much documentation
> 2. OpenBMC has too much documentation
> 3. Querying design/implementation/bug properties across the project is hard
> 4. Coordinating breaking changes is hard
> 5. Coordinating tree-wide changes is hard
> 6. Identifying the right repo to file a bug against is hard
> 7. Transferring bugs between repos is hard
> 8. Bug reports are duplicated across repos
> 9. Bug reports are ignored
> 10. Working out where to submit a patch is hard
> 11. Getting patches reviewed is hard
> 12. New repo requests are bottle-necked

To the list of the problems I would add:

13. D-Bus is hard for newcomers not familiar with it, best practices are 
not described,
inter-process synchronization when accessing large d-bus objects (like 
network interfaces)
is not inherent to d-bus, and auxiliary synchronization using standard 
POSIX means is neither
explicitly requested/advised, nor controlled/enforced. All that may lead 
(and have previously led) to
races and various other problems. Add to that the long and inconvenient 
prefixing that we've
discussed earlier in another thread where Brad has supported my point of 
those being useless
to the project.

14. D-Bus may become a bottleneck or a slowing factor (due to the 
context switching overhead) for
the situations when two processes are communicating actively. A standard 
POSIX IPC like pipes,
mq or shm could become a solution (with d-bus or any other method used 
as an aid to negotiate
names, keys, or whatever other credentials needed to access a common IPC).

WBR, Alexander

P.S. All in all, I think d-bus wasn't a good choice of IPC for a system 
running on a low-performance single-core ARM chip.

