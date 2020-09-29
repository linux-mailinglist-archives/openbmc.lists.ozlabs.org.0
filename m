Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8F527D835
	for <lists+openbmc@lfdr.de>; Tue, 29 Sep 2020 22:31:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C19zC3lsWzDqXb
	for <lists+openbmc@lfdr.de>; Wed, 30 Sep 2020 06:31:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=th6W5Oa6; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C19wh0P8vzDqVD
 for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2020 06:29:39 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 67735412FD;
 Tue, 29 Sep 2020 20:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1601411367; x=1603225768; bh=Prs26DRExBu4y67Y8hDzn240V
 0+RCgl8/T/f53M9Y08=; b=th6W5Oa6CL3qzbJFdeJIdgesl1ek0Md4ocz++Smak
 0fuOMMroYxX7JOUPE8UbVJ2LEjiidnkR94x1sBncyH0QOlSBMyNhSDZlEm7Re2sn
 QUPZE34Dehxhq6N41c8VJt+R20JqBcPy4KA12zWCMybHpAh32ENJDpCeJ2nuoSX5
 5o=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zKv70p4VxeZQ; Tue, 29 Sep 2020 23:29:27 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 887A7412F3;
 Tue, 29 Sep 2020 23:29:27 +0300 (MSK)
Received: from [10.199.0.70] (10.199.0.70) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 29
 Sep 2020 23:29:26 +0300
Message-ID: <4194264555f320be3c5d4a9fda2bc026dffc8a80.camel@yadro.com>
Subject: Re: entity manager configurations and dbus interfaces
From: Andrei Kartashev <a.kartashev@yadro.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, <ed@tanous.net>, James Feist
 <james.feist@linux.intel.com>
Date: Tue, 29 Sep 2020 23:29:26 +0300
In-Reply-To: <20200924143036.inmugtvxkj3f6zny@thinkpad.fuzziesquirrel.com>
References: <20200924143036.inmugtvxkj3f6zny@thinkpad.fuzziesquirrel.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.0.70]
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,

Here is first draft for document I mentioned. I would like everyone
interested in entity manager participate discussion there:

https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/36914


On Thu, 2020-09-24 at 10:30 -0400, Brad Bishop wrote:
> Hi Ed
> 
> Will quote a comment from this EM review:
> 
> https://gerrit.openbmc-project.xyz/36702
> 
> > entity-manager was designed with the tenant that it config files
> > have 
> > no knowledge of dbus.
> 
> FWIW I had no idea this was the case.
> 
> > We've broken that a little with the inventory interfaces on the
> > entity 
> > as a short term patch to gain some compatibility, but its easy
> > enough 
> > to roll back in the future.
> 
> Interesting - so there is a vision here, but I have no idea what it
> is.  
> Can you elaborate on how you envision inventory working if EM is not 
> implementing the inventory dbus interfaces?
> 
> thx - brad
-- 
Best regards,
Andrei Kartashev


