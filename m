Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D8623273CF5
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 10:07:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwYnL6N8SzDqyb
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 18:07:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=diVQPKKc; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwYmT2rXYzDqpL;
 Tue, 22 Sep 2020 18:06:32 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 8FD9452215;
 Tue, 22 Sep 2020 08:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1600761988;
 x=1602576389; bh=QFQBqGg2YRdwgzvu9vGj69dGgUwoYtiYaLsY4Qkr3Fk=; b=
 diVQPKKc0jmbqYBfgMKekEgkNoWMgx3pGIqT5lFK5msgqut27r3tc5EQoLkgpdBN
 gG6Utb5j5QDhquMVNZ2/9gaviK9PSjKZFmdU9d5A0AXyuUrK/+DO8Z/DUpKqZe1k
 kaQl91SWxCSF9CweI9d+OYNQQw5TF9aVc/zOlxEDeYs=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SWgbtb8iDc7G; Tue, 22 Sep 2020 11:06:28 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 4FF664C8E7;
 Tue, 22 Sep 2020 11:06:28 +0300 (MSK)
Received: from localhost (172.17.14.122) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 22
 Sep 2020 11:06:28 +0300
Date: Tue, 22 Sep 2020 11:06:27 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: Adriana Kobylak <anoo@linux.ibm.com>
Subject: Re: Headsup: Alternative to the filesystem overlay
Message-ID: <20200922080627.GA16274@bbwork.lan>
References: <CADVsX88ZPmZh+txe1Zis4YfJnXQ4_n-40r6p5Y1hy5_KegUeaQ@mail.gmail.com>
 <20200921143331.GA20273@bbwork.lan>
 <3f491d1ca08a5480af9d4555121da090@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <3f491d1ca08a5480af9d4555121da090@linux.vnet.ibm.com>
X-Originating-IP: [172.17.14.122]
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
Cc: openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>,
 openbmc@lists.ozlabs.org, Anton Kachalov <rnouse@google.com>,
 "Alexander A. Filippov" <a.filippov@yadro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Sep 21, 2020 at 02:42:49PM -0500, Adriana Kobylak wrote:
> On 2020-09-21 09:33, Alexander A. Filippov wrote:
> > I solved the problem with a difference of the user groups set during
> > firmware
> > upgrade by installing a systemd service which starts on the first BMC
> > boot after
> > upgrade and merges groups from RWFS and new ROFS.
> > 
> > This recipe is stored in our internal repo only, but I can share it if
> > it is
> > interesting to someone.
> 
> I'd be interested, if you would share it. Thanks!
> 

Here is it.
  https://gerrit.openbmc-project.xyz/c/openbmc/meta-yadro/+/36650

But it looks I was wrong. In fact, the script just adds missing groups from a 
predefined list instead of the merging files from RWFS and new ROFS.

--
Regards,
Alexander
