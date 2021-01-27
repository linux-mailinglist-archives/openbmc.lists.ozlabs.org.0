Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1404305AA4
	for <lists+openbmc@lfdr.de>; Wed, 27 Jan 2021 13:03:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQj0z3J0SzDqd7
	for <lists+openbmc@lfdr.de>; Wed, 27 Jan 2021 23:03:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=JTNJkwK5; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQhxN0glnzDqSN
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 23:00:00 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id DB04F41273
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 11:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-language:content-transfer-encoding:content-type
 :content-type:in-reply-to:mime-version:user-agent:date:date
 :message-id:from:from:references:subject:subject:received
 :received:received; s=mta-01; t=1611748794; x=1613563195; bh=pDh
 FGsED/SGmu8QzOXh1tZWzr/mkLYeHWpPxmFRGIoE=; b=JTNJkwK5tk0WiniFle0
 iC6bm9+5LMQmWlrPBiyOzOKWZMMYF7/5+DkXmu4PT/dXFPeANoTYdvYymDHzu4j/
 SxJbK3gRW5z/fVx1QYtzWnGZLNxuDsXYSTB10BFj2UMGvi0CdV6XA70nMPCFZCne
 L6LfePdMwvjycS9+s3m0tNSk=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UXfoBEkdVnE4 for <openbmc@lists.ozlabs.org>;
 Wed, 27 Jan 2021 14:59:54 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id CBCC141256
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 14:59:54 +0300 (MSK)
Received: from [10.199.0.224] (10.199.0.224) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 27
 Jan 2021 14:59:54 +0300
Subject: Re: Gerrit owners plugin coming
To: <openbmc@lists.ozlabs.org>
References: <CACWQX821ADQCrekLj_bGAu=1SSLCv5pTee7jaoVo2Zs6havgnA@mail.gmail.com>
 <CACWQX8236dghCCdnDAdnij0Di_GF7DsmAO_xEtWmk6ckKDocYg@mail.gmail.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Message-ID: <e18c023a-ccb3-6591-1092-cd488cd331e9@yadro.com>
Date: Wed, 27 Jan 2021 14:59:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CACWQX8236dghCCdnDAdnij0Di_GF7DsmAO_xEtWmk6ckKDocYg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.199.0.224]
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

26.01.2021 00:26, Ed Tanous пишет:
> On Wed, Jan 20, 2021 at 11:23 AM Ed Tanous <ed@tanous.net> wrote:
>> Over the last few weeks, we've been slowly getting the gerrit owners
>> plugin deployed and tested, and got the OWNERS files merged into their
>> respective meta layers.
> These changes are live.  Any commits to the individual meta layers can
> now be submitted directly to openbmc/openbmc now.  If there's anything
> broken about the new workflow, or anything unexpected happens in your
> workflow, please let me know on discord and we'll try to get it
> resolved.

Does this mean that meta-<vendor> directories are not subtrees anymore 
and respective repositories are now obsolete and can (will?) be dropped?

Thanks.

Alexander.

