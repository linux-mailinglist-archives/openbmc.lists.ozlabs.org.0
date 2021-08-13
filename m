Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C297A3EB2AC
	for <lists+openbmc@lfdr.de>; Fri, 13 Aug 2021 10:32:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GmGyR5FxVz3bWJ
	for <lists+openbmc@lfdr.de>; Fri, 13 Aug 2021 18:32:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=HT7zTylb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.mikhaylov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=HT7zTylb; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GmGxJ6WBHz3cVY
 for <openbmc@lists.ozlabs.org>; Fri, 13 Aug 2021 18:31:32 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 7101E41239;
 Fri, 13 Aug 2021 08:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1628843484; x=1630657885; bh=VgcawP/KlNxWs1HGqoUAeNajt
 2f2s7cTl6Fkjlx6Vsk=; b=HT7zTylb7Hi263eQDARaLUB4CMO8RjMyCiu1Cpkg5
 Q8C8+G6Utm1jVOWbdJwR5RxpknoEDAE4Q/uXYrQSoNbfk1HzieuLfcYJZl1WvESI
 OPhJy42VDvHZomwfkRvMk3gMqGYFTO0SY04GUHZONG0o7X5rwXWX1KHZm/Hrsno7
 /M=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mmgd99wIKiRb; Fri, 13 Aug 2021 11:31:24 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 3092149720;
 Fri, 13 Aug 2021 11:31:24 +0300 (MSK)
Received: from [10.199.0.67] (10.199.0.67) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 13
 Aug 2021 11:31:23 +0300
Message-ID: <916fc23f02ec749ecccf70dff356daa400026b28.camel@yadro.com>
Subject: Re: Request new repo for Audit function
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: George Liu <liuxiwei1013@gmail.com>, Milton Miller II <miltonm@us.ibm.com>
Date: Fri, 13 Aug 2021 11:41:32 +0300
In-Reply-To: <CANFuQ7D+ihCTnQHuyzatLsu8RBa8gLe0iDed18EAM_sy3aPNYQ@mail.gmail.com>
References: <OFA5154048.C3010138-ON00258730.00127D40-1628824917257@ibm.com>
 <CANFuQ7D+ihCTnQHuyzatLsu8RBa8gLe0iDed18EAM_sy3aPNYQ@mail.gmail.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.0.67]
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 2021-08-13 at 14:09 +0800, George Liu wrote:
> On Fri, Aug 13, 2021 at 11:22 AM Milton Miller II <miltonm@us.ibm.com> wrote:
> > 
> > 
> > Reply below
> > 
> > -------- Original Message --------
> > From: George Liu
> > Date: Thu, August 12, 2021 7:52 PM -0500
> > 
> > 
> > Hi Brad:
> > 
> > We have a requirement to implement an Audit function, I found that
> > there is a design doc[1], but there is no code to implement it.
> > 
> > Could you create a new repo for Audit function?
> > eg: phosphor-audit
> > 
> > [1]: https://github.com/openbmc/docs/blob/master/designs/phosphor-audit.md
> > 
> > thx - George Liu
> > 
> > -------- End of Original Message --------
> > 
> > Hi George.
> > 
> > 
> > Please update the design with consideration for inclusive naming[2] before
> > submitting code for it, as it uses depreciated terminology in it's external
> > control interface.
> > 
> > I see this design was merged almost 2 years ago before this policy was in
> > place but as you said it hasn't been exposed by the community yet so we won't
> > need to maintain compatibility with prior implementations.
> 
> Thanks for your advice.
> I will read and update this design doc ASAP :)
> 
> > 
> > 
> > [2] 
> > https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#inclusive-naming
> > 
> > Thanks,
> > Milton
> > 
> > 

George, there is answer about same question in this thread
https://lists.ozlabs.org/pipermail/openbmc/2020-March/020839.html .
Should be part of phosphor-logging.

Thanks.

