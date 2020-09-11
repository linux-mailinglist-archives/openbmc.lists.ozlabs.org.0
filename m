Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 205DD266120
	for <lists+openbmc@lfdr.de>; Fri, 11 Sep 2020 16:25:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnyhK3KHNzDqsX
	for <lists+openbmc@lfdr.de>; Sat, 12 Sep 2020 00:25:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.mikhaylov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=BChz0a7r; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bnyf91CB7zDqr6
 for <openbmc@lists.ozlabs.org>; Sat, 12 Sep 2020 00:23:11 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id B84A45753A;
 Fri, 11 Sep 2020 14:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1599834185; x=1601648586; bh=oNtEld8Gngyz6aRXz2D+vU9qX
 yg+jD0kQKDA9xod2rU=; b=BChz0a7rtkkuV0wBqUx6ibankJ4XRvDHfrl2MVZMn
 paJTwq9B/sZVSe4c3qY7N1MutuFnRrsC/AWj1d8x+xbyRhQAmuvMV3BFoUSluWSU
 me1G6KwiQTuNiJhCDCm9UYNGfG3paeZL8cV0x38/zPHlOxPcm8qW5Ii10ftQcjHQ
 oU=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ozqOVVEW64Pw; Fri, 11 Sep 2020 17:23:05 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 73C2550203;
 Fri, 11 Sep 2020 17:23:05 +0300 (MSK)
Received: from localhost.localdomain (10.199.2.166) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Fri, 11 Sep 2020 17:23:05 +0300
Message-ID: <9ae6b1f98e354503aab6ed1af5452e8cffba7d7f.camel@yadro.com>
Subject: Re: Design proposal for dual BMC flash with "golden image"
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: Lei Yu <yulei.sh@bytedance.com>, Alexander Amelkin <a.amelkin@yadro.com>
Date: Fri, 11 Sep 2020 17:26:34 +0300
In-Reply-To: <CAGm54UFJYnk=dcaWd7rsyUoBHqMkwgSLi5oYAjsMCmkugE+HaA@mail.gmail.com>
References: <CAGm54UETBZ-EAR-2tha+qHTH7h3H_1vZUe2Tp5kOTzY0isKLtw@mail.gmail.com>
 <636cd7a2-8b60-2868-104f-70378bf30a08@yadro.com>
 <CAGm54UFJYnk=dcaWd7rsyUoBHqMkwgSLi5oYAjsMCmkugE+HaA@mail.gmail.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.2.166]
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

Hey Lei, the main idea is to provide user transparent and safe access to
the golden side with, and to give our manufacturing department (and possibly the
support engineers too) the write lock control and possibility to flash the
golden chip during server assembly and even later if the need arises (like major
bugs discovered in the golden firmware version).

To achieve these goals we've made a utility and some kernel patches for watchdog
and spi nor driver:

- A series of patches for aspeed watchdog and watchdog api.
  A new ioctl was added into the watchdog api that sets a
  `start on reboot` status. It grants us transparent and safe switch into
  golden side without worrying about breaking something on the main spi flash
  side if we want to force-switch to golden side for testing.

- A series of patches for implementing flash locks for Macronix chips that we
use
- A utility which gives control of golden side, called `gftool` and providing   
  abilities to:
  - lock/unlock golden side
  - reboot into golden side
  - reflash golden side from main

> That's good to know! Could you comment on the design doc and see how
> much difference it has?

Yes, I will do on monday.

> Also, may I ask if Yadro's implementation could be open sourced or not?

Yes, but the watchdog series of patches is more like a hack for now.
We're expanding the watchdog api so that it grants the user control of WDT2 via
ioctl(watchdog start on reboot) and allows for rebooting into golden chip using
WDT2. However the upstream kernel maintainers won't accept it as they say it's a
driver level decision, and we're exporting it to the user. That's something they
don't want to accept. That may be fine though as theoretically the patch set may
be kept only in the openbmc linux kernel, but that will put an additional
support burden on Joel and the community. I'm discussing that with Joel.

Thanks.

