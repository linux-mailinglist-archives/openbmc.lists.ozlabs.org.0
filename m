Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6338426C1BA
	for <lists+openbmc@lfdr.de>; Wed, 16 Sep 2020 12:36:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrxNX6scyzDqWL
	for <lists+openbmc@lfdr.de>; Wed, 16 Sep 2020 20:36:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=OLDJ0oXz; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrxMp2CFmzDqVZ
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 20:36:05 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 4A87A58087;
 Wed, 16 Sep 2020 10:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-language:content-transfer-encoding:content-type
 :content-type:in-reply-to:mime-version:user-agent:date:date
 :message-id:from:from:references:subject:subject:received
 :received:received; s=mta-01; t=1600252560; x=1602066961; bh=J+t
 LMd6AB00+XeXOHdxqPcUHNdFP7xOJ9kbOuFn6Y70=; b=OLDJ0oXz3HpO+AH5drl
 5kSJLyIfehwLDC+irqh1xhBVcY32wFrc1Oyu+MvzwDYT0L6/ZgMCy12x40YCv/r9
 fprIRQrIq16fX+fG0UHMGHaC78JoI4ZOp/DaW+3K88weXN3wQ7YqTxBV2d9bc9Uu
 rrxIOtXJ53UidVR7+OBECy5o=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2L0EqiyFyO5Z; Wed, 16 Sep 2020 13:36:00 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id C8C0458037;
 Wed, 16 Sep 2020 13:36:00 +0300 (MSK)
Received: from [10.199.0.18] (10.199.0.18) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 16
 Sep 2020 13:36:00 +0300
Subject: Re: Design proposal for dual BMC flash with "golden image"
To: Lei Yu <yulei.sh@bytedance.com>, Ivan Mikhaylov <i.mikhaylov@yadro.com>
References: <CAGm54UETBZ-EAR-2tha+qHTH7h3H_1vZUe2Tp5kOTzY0isKLtw@mail.gmail.com>
 <636cd7a2-8b60-2868-104f-70378bf30a08@yadro.com>
 <CAGm54UFJYnk=dcaWd7rsyUoBHqMkwgSLi5oYAjsMCmkugE+HaA@mail.gmail.com>
 <9ae6b1f98e354503aab6ed1af5452e8cffba7d7f.camel@yadro.com>
 <CAGm54UHG611qtbKObUkFOYjaSkSd+tMabJ=kOwo9TkauyejyRg@mail.gmail.com>
 <27aecca09a3f74d12974bfafde830ded5d69a7e0.camel@yadro.com>
 <CAGm54UFFzkTTKCXCCpFunp8i23Eu8n25gXWcjx5RWm9ioWwrdg@mail.gmail.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Message-ID: <875584a9-4abc-ad4f-63a2-a623bc7cee44@yadro.com>
Date: Wed, 16 Sep 2020 13:35:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAGm54UFFzkTTKCXCCpFunp8i23Eu8n25gXWcjx5RWm9ioWwrdg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.199.0.18]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

16.09.2020 13:18, Lei Yu пишет:
> Does the lock/unlock function work on the Macronix chip only? Does it
> apply to other chips?

As Ivan said, it is supported by some other chips as well. At least some 
ST chips have that feature.

Nonetheless, that feature is not a must. We just had to implement 
support for it for the Macronix chips
that we use, or otherwise they would just ignore the #WP pin. Most chips 
that don't have the software
lock/unlock feature can be properly protected/unprotected using the 
traditional #WP pin mechanism.

> On Wed, Sep 16, 2020 at 5:55 PM Ivan Mikhaylov <i.mikhaylov@yadro.com> 
> wrote:
>>> For now, we use "devmem" to manipulate the registers for testing purpose.
>>> It's nice to have that driver, but in productions there will be no
>>> need to use devmem nor the ioctl on watchdog, so it's not a must for
>>> us to use the driver.
>>>
>> And how you switch safely into golden side in this case?
>>
> The plan is:
> 1. When the primary flash is broken and u-boot could not be started,
> aspeed will switch to the golden side automatically.
> 2. When the primary flash's u-boot is OK, but the kernel/rofs fails a
> couple of times, the u-boot could detect this and switch to the golden
> side by setting the related registers. See example in
> https://github.com/openbmc/openbmc/blob/master/meta-phosphor/aspeed-layer/recipes-bsp/u-boot/files/0005-config-ast-common-Fall-back-to-secondary-flash-on-fa.patch

The main idea behind the new ioctl() is to allow for easy switching into 
the golden chip
for testing purposes when both the u-boot and the kernel/rofs on the 
primary chip are fine.

Alexander

