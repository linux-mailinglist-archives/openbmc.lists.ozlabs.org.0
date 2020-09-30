Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5DF27F2AE
	for <lists+openbmc@lfdr.de>; Wed, 30 Sep 2020 21:41:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C1mq54y81zDqVq
	for <lists+openbmc@lfdr.de>; Thu,  1 Oct 2020 05:41:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=LuhlCMYd; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C1mpG12f9zDqSN
 for <openbmc@lists.ozlabs.org>; Thu,  1 Oct 2020 05:41:09 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 214DE41302
 for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2020 19:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-language:content-transfer-encoding:content-type
 :content-type:in-reply-to:mime-version:user-agent:date:date
 :message-id:from:from:references:subject:subject:received
 :received:received; s=mta-01; t=1601494863; x=1603309264; bh=xxU
 JtoCzVa2kMlm2HFgrVeSacP3PjPMgERJ5gMJ7A4g=; b=LuhlCMYdFcw+G5970Hc
 CqARRrkqCFUjTACRJpAtNHEK1PIVJ6qswOSeOyRv/8J3I1IlMrmFziPYMHzgpoNh
 hXqzC1GDemdztJ+IVHDQCZ9t3iSKHJVbgs+b9bro03Iezlef/iEHHDdQX9WZWKXI
 YU6f9t1Ko/yR89YHpvAiiRW4=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 185icTwE-RVi for <openbmc@lists.ozlabs.org>;
 Wed, 30 Sep 2020 22:41:03 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 31A6C41274
 for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2020 22:41:03 +0300 (MSK)
Received: from [10.199.0.198] (10.199.0.198) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 30
 Sep 2020 22:41:02 +0300
Subject: Re: multiple device trees
To: <openbmc@lists.ozlabs.org>
References: <02A2EB59-111F-43D2-8CDE-6DFDE75EF292@fuzziesquirrel.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Message-ID: <fc3761f0-8897-a707-99aa-0751855a6a68@yadro.com>
Date: Wed, 30 Sep 2020 22:41:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <02A2EB59-111F-43D2-8CDE-6DFDE75EF292@fuzziesquirrel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.199.0.198]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-04.corp.yadro.com (172.17.100.104)
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

Sorry for necroposting, but this is what we need now.

I did this previously with a non-OpenBMC system. What I did there was:

1. Make u-boot read an i2c-based FRU EEPROM, extract the 'Board Part 
Number' field and put it into a variable

2. Have the DTS files match the part numbers

3. Make u-boot `bootcmd` select the DTS based on the defined machine name

It would be nice to have such a feature built into OpenBMC for all 
platforms.

Alexander.

14.01.2020 04:56, Brad Bishop пишет:
> Does anyone have any experience supporting multiple system configurations in a monolithic flash image with multiple device trees?  Did you consider this and do something else instead?
>
> thanks!
>
> -brad
