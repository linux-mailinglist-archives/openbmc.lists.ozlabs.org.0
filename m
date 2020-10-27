Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 095CE29C747
	for <lists+openbmc@lfdr.de>; Tue, 27 Oct 2020 19:34:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLL2z3RRHzDqQb
	for <lists+openbmc@lfdr.de>; Wed, 28 Oct 2020 05:34:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=jv9Mo2jT; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLL0l4l8vzDqNm
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2020 05:32:39 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 5DCF94127F;
 Tue, 27 Oct 2020 18:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1603823552; x=1605637953; bh=1p/Orpjf9o+J44Cd+fzmcrLhz
 XlhR3xH9inlVSJBvIc=; b=jv9Mo2jT4HWNVXWLnXa9IiqlUzOdU848lERAL3m9C
 CseBTR9QySs7wPbeTvTaZFQ1hZs+hW+CVvXnoUpDd+CfqSD1mcKaMWIk6zsnGunu
 1EE6/8xjiyHjS3ZJnK1OBGj9ZYE1+rNdAQZqtYC7syhJi3nHEDOU0HsOICFTHbTt
 aE=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9kTW9K_JEa4Z; Tue, 27 Oct 2020 21:32:32 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id C10844127B;
 Tue, 27 Oct 2020 21:32:31 +0300 (MSK)
Received: from [10.199.0.66] (10.199.0.66) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 27
 Oct 2020 21:32:31 +0300
Message-ID: <e2a351bbc07cd97e32d3e729c235f4b9853c8c1c.camel@yadro.com>
Subject: Re: bmcweb: Memory: Why not use "Present" for Redfish's Status State ?
From: Andrei Kartashev <a.kartashev@yadro.com>
To: Gunnar Mills <gmills@linux.vnet.ibm.com>, <pawel.rapkiewicz@intel.com>,
 "Ed Tanous" <ed@tanous.net>
Date: Tue, 27 Oct 2020 21:32:30 +0300
In-Reply-To: <a6723812-c9f1-eb69-888f-d79b3da0cc71@linux.vnet.ibm.com>
References: <a6723812-c9f1-eb69-888f-d79b3da0cc71@linux.vnet.ibm.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.0.66]
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

+1
In some cases we can only detect presence of DIMMs, but not the
details. In such cases this logic a bit painful.

On Mon, 2020-10-26 at 12:49 -0600, Gunnar Mills wrote:
> Hi Ed and Pawel,
> 
> I am missing some context here.
> Why if MemorySizeInKB is 0 we set the "Status""State" of the DIMM to
> Absent?
> Why not use the Present property?
> 
> https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/memory.hpp#L373
> 
> https://github.com/openbmc/phosphor-dbus-interfaces/blob/8aec946e2844831cfc377c0e0136de5714c08a5b/xyz/openbmc_project/Inventory/Item.interface.yaml#L9
> 
> By default MemorySizeInKB is 0 so if MemorySizeInKB hasn't been set
> your 
> DIMM looks like (all other properties are skipped):
> 
> curl -k https://$bmc/redfish/v1/Systems/system/Memory/dimm6
> {
>    "@odata.id": "/redfish/v1/Systems/system/Memory/dimm6",
>    "@odata.type": "#Memory.v1_7_0.Memory",
>    "Id": "dimm6",
>    "Name": "DIMM Slot",
>    "Status": {
>      "Health": "OK",
>      "HealthRollup": "OK",
>      "State": "Absent"
>    }
> 
> This logic was added here:
> https://github.com/openbmc/bmcweb/commit/443c2934ac1ae86b6d496e3509e2b8acf283fb18
> 
> Thanks,
> Gunnar
-- 
Best regards,
Andrei Kartashev


