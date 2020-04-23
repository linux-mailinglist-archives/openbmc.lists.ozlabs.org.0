Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9F31B5B1E
	for <lists+openbmc@lfdr.de>; Thu, 23 Apr 2020 14:12:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497GQf1XfBzDqnr
	for <lists+openbmc@lfdr.de>; Thu, 23 Apr 2020 22:12:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=bgedxX/b; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497GNp5XdhzDqnD
 for <openbmc@lists.ozlabs.org>; Thu, 23 Apr 2020 22:11:06 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id A9B854A45F
 for <openbmc@lists.ozlabs.org>; Thu, 23 Apr 2020 12:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-language:content-transfer-encoding:content-type
 :content-type:in-reply-to:mime-version:user-agent:date:date
 :message-id:from:from:references:subject:subject:received
 :received:received; s=mta-01; t=1587643861; x=1589458262; bh=Idg
 F7VqEMe/N/I1qyJ75Zk5FwPZI5vckFA+L7AjRozw=; b=bgedxX/bMGnyY5Fu8hl
 BuGKFBKMJp3pyiIGC1Bk1fxvnzTM66tSk59gPGlL8ROw0MgdXbY3UYAIj8U6+C2R
 nkXTCzC3F5ST8ACx6KAof/8MIKdO2sYfE+G7BnIWIs7I9zLPf/QjBA2rgPMGWtQi
 nvkI1+rLDekud+D8TQkMxVpM=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wtB2IE87rzzb for <openbmc@lists.ozlabs.org>;
 Thu, 23 Apr 2020 15:11:01 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 1416B4A486
 for <openbmc@lists.ozlabs.org>; Thu, 23 Apr 2020 15:11:01 +0300 (MSK)
Received: from [10.199.0.42] (10.199.0.42) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 23
 Apr 2020 15:11:01 +0300
Subject: Re: Proposal: how to make incompatible changes
To: <openbmc@lists.ozlabs.org>
References: <5532c90e-75e8-4998-b0cf-e65ed9af1424@linux.ibm.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Message-ID: <05835fa0-508f-d3ba-13be-280f4dfc92e4@yadro.com>
Date: Thu, 23 Apr 2020 15:11:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <5532c90e-75e8-4998-b0cf-e65ed9af1424@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.199.0.42]
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

15.04.2020 02:00, Joseph Reynolds пишет:
> Proposal: how to make incompatible changes
>
> This is a proposal to add guidelines for making incompatible changes 
> to OpenBMC interfaces.  Is it okay to make incompatible changes? Yes, 
> IMHO: the project will continuously break compatibility in various 
> ways, and its users will adapt.  The main idea is to minimize churn 
> and make it easier for users to adapt.
>
> As the OpenBMC project moves forward with new releases, it will make 
> changes that necessarily break existing use cases.  My recommendations 
> are:
> - Try hard to maintain forward compatibility.  For example, maintain 
> all of the BMC's intended user interfaces.
> - Identify changes that break compatibility.  Briefly describe the use 
> case, what breaks, how a user can adapt, and cross-link technical 
> discussions (Gerrit reviews, issues, emails).
> - Work with maintainers to determine which incompatible changes get 
> merged and what documentation is needed.
> - Give users time to adapt to incompatible changes.  For example, 
> deprecate interfaces in a previous release.
> - List incompatible changes in the [release notes][] so community 
> members will know they have to adapt, and link to how to adapt.
>
>
I'd say that any incompatible change must be reflected in the interface 
version.

As far as I understand, RedFish has all the interfaces strictly 
specified and those specifications are bound to a specific RedFish 
version that is then encoded in the URL (e.g. /redfish/v1/).

Any other interface should have a similar approach. A more relaxed one, 
if we keep our own flavor of REST, could be that each interface could 
have a Version property (probably also encoded in the REST URL).

That way, any user trying to access an old interface (thus via a 
non-existant URL) would get a 404.

Internally, for inter-process dbus communication the interface version 
could be checked during compile time to prevent problems that couldn't 
be detected by compiler/linker automatically. Those problems are, for 
instance, incompatible change in the meaning of the values of a property.

Alexander.

