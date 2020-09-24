Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 896B52775A9
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 17:44:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxzrH40zRzDqc6
	for <lists+openbmc@lfdr.de>; Fri, 25 Sep 2020 01:44:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=WSrw2VGN; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bxzq34y6bzDqM5
 for <openbmc@lists.ozlabs.org>; Fri, 25 Sep 2020 01:43:43 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 8F47B579F2;
 Thu, 24 Sep 2020 15:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1600962217; x=1602776618; bh=rkLaGMxbYsTDLvExDdijUp2gc
 zhJlTaKCKWQ6sIv9hQ=; b=WSrw2VGNrRQQtfuqVxA8HNycR1zM7eshZ6htKfz00
 NWsiIWjckRseoVKmmNfHsbv+1+1p/5HuZp9pRkg3Fb8xSXz2voG+KZ58JsIR6dSS
 wjIDEmFVWE0MMfOAlaV8w85wxy6rVlevka/YdRxw3TGPlie7bWn27kEIligXQloz
 V0=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RIbGKnomICkC; Thu, 24 Sep 2020 18:43:37 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 420675791A;
 Thu, 24 Sep 2020 18:43:37 +0300 (MSK)
Received: from [10.199.3.26] (10.199.3.26) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 24
 Sep 2020 18:43:36 +0300
Message-ID: <d4761f08a2beca775827171d4d1934cd76641cb5.camel@yadro.com>
Subject: Re: entity manager configurations and dbus interfaces
From: Andrei Kartashev <a.kartashev@yadro.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, <ed@tanous.net>
Date: Thu, 24 Sep 2020 18:43:35 +0300
In-Reply-To: <20200924143036.inmugtvxkj3f6zny@thinkpad.fuzziesquirrel.com>
References: <20200924143036.inmugtvxkj3f6zny@thinkpad.fuzziesquirrel.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.3.26]
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

Hi Brad,

Thank for bring up this question.
Same as you we have slightly bad view on EM architecture since before
we had only Power-based platforms and now we are working on our first
x86-based one.

Following up the discussion in the review and also mailing discussion
we had early, I now preparing some Implementation Proposal document for
EM-based inventory. I gonna to submit it to docs repo for discussing
and finding our common understanding of how it supposed to be.


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


