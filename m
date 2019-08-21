Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 065AE9735C
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 09:29:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Czmq6CtSzDqf0
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 17:28:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="nMMtpbzx"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Czm86sDWzDqPS
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 17:28:24 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id D110B4120B;
 Wed, 21 Aug 2019 07:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 user-agent:in-reply-to:content-disposition:content-type
 :content-type:mime-version:references:message-id:subject:subject
 :from:from:date:date:received:received:received; s=mta-01; t=
 1566372500; x=1568186901; bh=qSQdWEOKdJ66YiaaIQHDE7P5FK5R7tq6JZz
 iICYBojk=; b=nMMtpbzxKKys9uShgeDdgqGNlIfEF9ELrKv5nPZoFESMAFgy1jQ
 RoQeitDcKS01bpR5DndNjfWc3nA4fF2uWWzKaMBE6IIyBBlt9D7XOyMMmXXYwhJD
 A835LHzTHOzy0N54IMD1CBQAvZu5U5i6XGFxhgH9rNCKJc0vvUdLSlOE=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lvIfS_P7L2K6; Wed, 21 Aug 2019 10:28:20 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 9CC51404CB;
 Wed, 21 Aug 2019 10:28:20 +0300 (MSK)
Received: from localhost (172.17.14.115) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 21
 Aug 2019 10:28:20 +0300
Date: Wed, 21 Aug 2019 10:28:19 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: William Kennington <wak@google.com>
Subject: Re: Alternative to the filesystem overlay
Message-ID: <20190821072819.GA20631@bbwork.lan>
References: <efb47539225e57a0ab0138987287c230@linux.vnet.ibm.com>
 <20190816090955.GA15986@bbwork.lan>
 <CAPnigK=N9o6HzZCeJ-g1uWiLeRFXM84bF+Pq63YoJAz8SEdstA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CAPnigK=N9o6HzZCeJ-g1uWiLeRFXM84bF+Pq63YoJAz8SEdstA@mail.gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Originating-IP: [172.17.14.115]
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
Cc: OpenBMC Development <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Aug 20, 2019 at 11:00:25AM -0700, William Kennington wrote:
> Sounds like this is just a data schema update type of issue, where you
> just need a service to run at first update boot and upgrade the files
> as expected by the change.
> 
> We could probably do this with systemd services that are
> ConditionNeedsUpdate= and
> https://www.freedesktop.org/software/systemd/man/systemd-update-done.service.html
> 

Yes, it looks like a good solution. I will try it.
Thanks for the tip.

> I'd prefer to see us move to a mostly immutable filesystem with
> symlinks that map into a rwfs for specific files / directories we
> expect to mutate at runtime. I don't think we should do any smart
> types of writeback caching at the filesystem level as that will just
> lead to confusion about persistence that is hard to debug. Not to
> mention tools like rsync don't guarantee atomic snapshotting during
> the copy for file consistency. Our applications should be designed in
> such a way that they are always consistent on disk. Ex. writing text
> files should be done to a temporary, then moved over the old one. That
> way the update is atomic and we don't have partially written files.
> 

Regards,
Alexander
