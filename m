Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B332F440C
	for <lists+openbmc@lfdr.de>; Wed, 13 Jan 2021 06:43:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DFxFK3HlvzDqwh
	for <lists+openbmc@lfdr.de>; Wed, 13 Jan 2021 16:43:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=vwqQ7Nov; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFxDY4BSSzDqkP
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jan 2021 16:42:53 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 89D7E412DC
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jan 2021 05:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1610516567; x=1612330968; bh=eS6jOl4+nqJrMT5h3vucDYZBJ
 SzlR1DTPDAWITdZaLk=; b=vwqQ7NovQaMmxlfCe4aSbKzboyjWy1o/+mYUbAGmH
 Oy6vf69cHLdF7BCKZla3gT3PrBTmApU2aFmVfuaQhHeBNbMgZLA8I41+XV+BDCgE
 ahcRhQZU7s/H8FGZdcR7IcfmpZ897ykHoj02e0env4ETA0B7KpfvlvMTSNJCN5Zs
 Bo=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l1rZgGOIctrs for <openbmc@lists.ozlabs.org>;
 Wed, 13 Jan 2021 08:42:47 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 5E27A4128A
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jan 2021 08:42:47 +0300 (MSK)
Received: from [10.199.0.158] (10.199.0.158) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 13
 Jan 2021 08:42:47 +0300
Message-ID: <5d918861bb1549ff80894e0dc6d3ca4195c09568.camel@yadro.com>
Subject: Re: Call for volunteers
From: Andrei Kartashev <a.kartashev@yadro.com>
To: <openbmc@lists.ozlabs.org>
Date: Wed, 13 Jan 2021 08:42:46 +0300
In-Reply-To: <20210111220919.zwc727vbwc4itm7h@thinkpad.fuzziesquirrel.com>
References: <20210111220919.zwc727vbwc4itm7h@thinkpad.fuzziesquirrel.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.0.158]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
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

Hi Brad,

Excellent initiative, I'm in.

On Mon, 2021-01-11 at 16:09 -0600, Brad Bishop wrote:
> Hello OpenBMC-ers!
> 
> Your TSC has been aware of the problem of fragmentation in our
> project for some
> time.  Fragmentation is a loose term - for the purposes of this note
> consider
> it to be any time contributor efforts in the community are duplicated
> without
> thought given to maintenance and/or compatibility.
> 
> To begin to address this issue the TSC is looking for volunteers to
> serve on a
> "repository review forum" to which the TSC will initially delegate
> its
> authority in the areas of:
> - new repository creation
> - placement of contributed new function into existing repositories
> 
> The TSC fully expects the scope of this forum to quickly grow into
> the role of
> a traditional TSC providing frequent, technical oversight to project
> contributors.  The current TSC will continue to serve the project in
> terms of
> governance, advocacy and industry exposure - and likely get a rename
> (OpenBMC
> Board? or OpenBMC Steering Committee?) in the process.
> 
> The new forum would meet periodically or at the demand of other forum
> members
> to:
> - raise the forums combined awareness of new function under
> development
>    (information exchange)
> - build a consensus within the forum on where the function should
> exist
> - inform the function contributor and the rest of the community of
> the decision
> 
> A successful forum would be a forum that can simultaneously encourage
> the
> contribution of new and innovative solutions to existing problems
> without
> introducing complexity to the project as a whole.
> 
> A successful forum member will have previously demonstrated a breadth
> of
> understanding of the upstream OpenBMC codebase through:
> - frequent participation in peer review, the mailing list, IRC, and
> Discord.
> - submission of high quality designs and code to upstream OpenBMC
>    (github.com/openbmc)
> - a history of working with and guiding less experienced OpenBMC
> developers
>    in a timely manner, enabling them to come up to speed quickly.
> 
> If you are interested in serving the project in this manner, please
> reply to
> submit yourself as a candidate.
> 
> -brad, on the behalf of the OpenBMC TSC
-- 
Best regards,
Andrei Kartashev


