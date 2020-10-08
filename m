Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F85287146
	for <lists+openbmc@lfdr.de>; Thu,  8 Oct 2020 11:12:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6QTS5S0yzDqFs
	for <lists+openbmc@lfdr.de>; Thu,  8 Oct 2020 20:12:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.kononenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=VN1EDqil; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6QSj0z0rzDqFS
 for <openbmc@lists.ozlabs.org>; Thu,  8 Oct 2020 20:12:04 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id E14B24138C;
 Thu,  8 Oct 2020 09:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:content-language:content-type
 :content-type:in-reply-to:mime-version:user-agent:date:date
 :message-id:from:from:references:subject:subject:received
 :received:received; s=mta-01; t=1602148320; x=1603962721; bh=o/I
 v5RvC3GhxAeIsvQB6vLocOaVy3PHPcX49IIySWFA=; b=VN1EDqiles8SnEh6272
 1GJHiPtcV/UioVnFq+y/pk1h1RlvxEmANTQhFTvCNPPIZefCU6ZE2PdMCrbz+mrg
 37mTtmsUYy7za86v+pf6FOzmhLVeNqxbXCqOmBsz7eUrWEidV905yBEQiCRCMLSR
 XnuWP+jKrEcixQg5csAjqT2Y=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PZBqHKqPYHCz; Thu,  8 Oct 2020 12:12:00 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id D256F41323;
 Thu,  8 Oct 2020 12:12:00 +0300 (MSK)
Received: from [10.199.2.134] (10.199.2.134) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 8 Oct
 2020 12:12:00 +0300
Subject: Re: Use usb-ctrl for USB gadget management
To: Jeremy Kerr <jk@ozlabs.org>, OpenBMC MailList OZLabs
 <openbmc@lists.ozlabs.org>
References: <127b55ea-175f-b60f-90e1-08465fb53592@yadro.com>
 <63f9af23051a75523589eb9b036bd8d9877594d4.camel@ozlabs.org>
From: i.kononenko <i.kononenko@yadro.com>
Message-ID: <5cc7e637-7c96-e019-2bad-4fa900b91d99@yadro.com>
Date: Thu, 8 Oct 2020 12:11:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <63f9af23051a75523589eb9b036bd8d9877594d4.camel@ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.2.134]
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



On 08.10.2020 11:35, Jeremy Kerr wrote:
> Hi Igor,
> 
>> I've found the gerrits change[1] about including the usb-ctrl to the
>> state_hook of Virtual Media mounting. 
>> I'm working on improving Virtual Media functions to add media
>> interface type[2] which impacts state_hook. I'd like to take over me
>> the above described changes  to speed approve updates of [1].
>> Kindly may I ask to assign the task[1] to me? I'll like to suggest a
>> [2] together with [1], is it possible?
> 
> Sure, I'm fine if you want to take care of the state hook changes!
> 
> However, I'm not sure what you mean by assign the task to you. If you
> want to work on this, feel free to take my changes and modify them, and
> I'll abandon the original review request.
> 
> Cheers,
> 
> 
> Jeremy
> 

Jeremy, thanks for the reply.
I've just like to notify that I want to take this changes on itself.
Ok, as soon as possible I'll suggest a patch set by another change.

-- 
Best regards,

Igor Kononenko
