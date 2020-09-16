Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA7226C135
	for <lists+openbmc@lfdr.de>; Wed, 16 Sep 2020 11:56:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrwTp74BXzDqW9
	for <lists+openbmc@lfdr.de>; Wed, 16 Sep 2020 19:56:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.mikhaylov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=ZcdFePTG; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrwSs3MlWzDqNs
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 19:55:24 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 6E3B05753B;
 Wed, 16 Sep 2020 09:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1600250118; x=1602064519; bh=f9ZvxKIf3AIYB8DJiWNpSV29y
 kfDWQZCYAxTwEIEHKw=; b=ZcdFePTG93yXk85OGOixZumgx5hopJCH7uNu7I9YF
 oEElEZkN7NwXdOxZ1ZiQl/yrn9XkbJ5kySCo3rwhS5PrFytdT81egE3BCX54eE74
 ne02OC7TdRO9mcd6/+fERPbloGkJqr+gRGp+J5K/30EeIUhxPZAEml5fZ4FkUhwp
 TE=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8YOAldvmRIXO; Wed, 16 Sep 2020 12:55:18 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 2988856E6D;
 Wed, 16 Sep 2020 12:55:17 +0300 (MSK)
Received: from localhost.localdomain (10.199.2.122) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Wed, 16 Sep 2020 12:55:17 +0300
Message-ID: <27aecca09a3f74d12974bfafde830ded5d69a7e0.camel@yadro.com>
Subject: Re: Design proposal for dual BMC flash with "golden image"
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: Lei Yu <yulei.sh@bytedance.com>
Date: Wed, 16 Sep 2020 12:58:53 +0300
In-Reply-To: <CAGm54UHG611qtbKObUkFOYjaSkSd+tMabJ=kOwo9TkauyejyRg@mail.gmail.com>
References: <CAGm54UETBZ-EAR-2tha+qHTH7h3H_1vZUe2Tp5kOTzY0isKLtw@mail.gmail.com>
 <636cd7a2-8b60-2868-104f-70378bf30a08@yadro.com>
 <CAGm54UFJYnk=dcaWd7rsyUoBHqMkwgSLi5oYAjsMCmkugE+HaA@mail.gmail.com>
 <9ae6b1f98e354503aab6ed1af5452e8cffba7d7f.camel@yadro.com>
 <CAGm54UHG611qtbKObUkFOYjaSkSd+tMabJ=kOwo9TkauyejyRg@mail.gmail.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.2.122]
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Alexander Amelkin <a.amelkin@yadro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2020-09-15 at 11:38 +0800, Lei Yu wrote:
> > - A series of patches for implementing flash locks for Macronix chips that
> > we
> > use
> > - A utility which gives control of golden side, called `gftool` and
> > providing
> >   abilities to:
> >   - lock/unlock golden side
> >   - reboot into golden side
> >   - reflash golden side from main
> > 
> 
> Does the lock/unlock function work on the Macronix chip only? Does it
> apply to other chips?

It can be applied to different chips, macronix locks are not supported for now
in upstream. You can check here - 
https://elixir.bootlin.com/linux/v5.9-rc5/source/drivers/mtd/spi-nor , chipswith SPI_NOR_HAS_LOCK.  

> > Yes, but the watchdog series of patches is more like a hack for now.
> > We're expanding the watchdog api so that it grants the user control of WDT2
> > via
> > ioctl(watchdog start on reboot) and allows for rebooting into golden chip
> > using
> > WDT2. However the upstream kernel maintainers won't accept it as they say
> > it's a
> > driver level decision, and we're exporting it to the user. That's something
> > they
> > don't want to accept. That may be fine though as theoretically the patch set
> > may
> > be kept only in the openbmc linux kernel, but that will put an additional
> > support burden on Joel and the community. I'm discussing that with Joel.
> 
> OK, thanks.
> For now, we use "devmem" to manipulate the registers for testing purpose.
> It's nice to have that driver, but in productions there will be no
> need to use devmem nor the ioctl on watchdog, so it's not a must for
> us to use the driver.
> 

And how you switch safely into golden side in this case?

Thanks.

