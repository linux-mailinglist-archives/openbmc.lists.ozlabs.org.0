Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BEA2667BD
	for <lists+openbmc@lfdr.de>; Fri, 11 Sep 2020 19:49:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bp3Dg41GjzDqZQ
	for <lists+openbmc@lfdr.de>; Sat, 12 Sep 2020 03:49:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=Xst9E89L; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bp2XB5R2dzDqsK
 for <openbmc@lists.ozlabs.org>; Sat, 12 Sep 2020 03:18:17 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id B961357557;
 Fri, 11 Sep 2020 17:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1599844690; x=1601659091; bh=tmX0ENvfEACwDnK03d+BzCaEO
 5YKm1Vi/bnzxDDoWkk=; b=Xst9E89L9mnf9Le6LqGpzawn7bNJfx3+55mdfO6Xp
 4xGoWSRc50qfVJzTTPFkqvdWwU14zs9MPz2aYs0b08Iuyl96/YpLAwxC2DfSc221
 ObkpJyHT1VN32IgjZBhWJMNsyBZnTQG0lvIq8Kui3Wkm/0P/l6iuzNVhxMNrLBXN
 kE=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iVUengRk8sRA; Fri, 11 Sep 2020 20:18:10 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id C4B2A57554;
 Fri, 11 Sep 2020 20:18:10 +0300 (MSK)
Received: from [10.199.0.118] (10.199.0.118) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 11
 Sep 2020 20:18:10 +0300
Message-ID: <88000ada402164b69fb8e1b3b96942ecd4a914bc.camel@yadro.com>
Subject: Re: Storage inventory on x86
From: Andrei Kartashev <a.kartashev@yadro.com>
To: James Feist <james.feist@linux.intel.com>, Openbmc
 <openbmc@lists.ozlabs.org>
Date: Fri, 11 Sep 2020 20:18:09 +0300
In-Reply-To: <dc297f57-9fb9-0c10-93fa-31db32cb48db@linux.intel.com>
References: <C24D4BAF-B185-4640-BFEF-D391E51A0A35@fb.com>
 <452FDC0B-2E4F-4AD9-97E6-DE9B2333D99B@fb.com>
 <8EE0F70D-78CB-4CDB-A51C-53FC33A2AC87@fb.com>
 <EFFBC9D1-BA53-4C61-8BC2-7F52320245F7@fb.com>
 <51C18C28-4894-4BEF-AAA6-BACE5B934B5C@fb.com>
 <AFA8029B-BBBC-41A5-9F66-671D41D0E624@fb.com>
 <675aaf18-40f6-e175-5899-3269c93ca3f5@linux.intel.com>
 <bf3645151d434adadf930030dcf40db1edc18596.camel@yadro.com>
 <dc297f57-9fb9-0c10-93fa-31db32cb48db@linux.intel.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.0.118]
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

Aha, that is how it works!

Thank you =)

Just curious, is it some special disks with FRU or there is standard
for that? I believe, there is no smbus in SATA interface =)

On Fri, 2020-09-11 at 08:55 -0700, James Feist wrote:
> On 9/11/2020 2:19 AM, Andrei Kartashev wrote:
> > Hi,
> > 
> > The question is mainly for Intel guys:
> > Is there some universal way to build inventory of storage devices
> > (SATA/SAS/NVMe)?
> > I found that on wolfpass there is hsbp-manager who responsible for
> > storage inventory, but if I get it right, there is CPLD on that
> > backplane, which somehow communicate with drives and can get the
> > basic
> > information about (model, serial, etc). Can anyone point me what
> > should
> > we have in our system to implement something like this?
> 
> For model serial etc if the drives support a FRU then FRU device
> should 
> be able to discover them assuming an smbus connection. Otherwise the 
> CPLD on the HSBP that we have supports presence, so we can identify
> a 
> drive is there, but not what model. I believe that's all we're 
> supporting currently.
> 
> > I guess, storage devices are not handled by smbios-mdr daemon,
> > because
> > of hotswap requirement, and not handled by PECI, because of PECI
> > have
> > no such commands. Is there any other ways to get drive inventory
> > (including RAID)?
> > 

