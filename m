Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E954113FEA
	for <lists+openbmc@lfdr.de>; Thu,  5 Dec 2019 12:06:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47TCZg2PSJzDqZm
	for <lists+openbmc@lfdr.de>; Thu,  5 Dec 2019 22:06:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=aleksandr.v.tereschenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47TCYY1wrXzDqYb
 for <openbmc@lists.ozlabs.org>; Thu,  5 Dec 2019 22:05:18 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Dec 2019 03:05:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,281,1571727600"; d="scan'208";a="209106380"
Received: from avteresc-mobl1.ger.corp.intel.com (HELO [172.22.245.179])
 ([172.22.245.179])
 by fmsmga008.fm.intel.com with ESMTP; 05 Dec 2019 03:05:13 -0800
Subject: Re: BMC update via TFTP
To: openbmc@lists.ozlabs.org
References: <q7_GhCRdlxUNHfFX0Y4tW7FPq5Md7qwdFWbwd39V_S5zxrSBYtoXtvlNpQdZchvPB27edbJ3-QKFyZ97kzXoeH3Bby8IIHSWhxle9jzteKA=@protonmail.com>
 <5747d991-27b7-4bb1-8a25-f46d1de832e1@linux.vnet.ibm.com>
 <f778ce0c-f395-7528-ed05-cec194707a14@linux.vnet.ibm.com>
 <9e0303e5beb34b9bb50b050cd56e35d8@linux.vnet.ibm.com>
 <ed917fd0-61e1-3ff8-05f9-863d3e451c93@linux.ibm.com>
 <20191204213650.GB9613@mauery.jf.intel.com>
From: Alexander Tereschenko <aleksandr.v.tereschenko@linux.intel.com>
Message-ID: <94b297b5-81d1-1e07-498f-155a9160cb1d@linux.intel.com>
Date: Thu, 5 Dec 2019 12:05:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191204213650.GB9613@mauery.jf.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

On 04-Dec-19 22:36, Vernon Mauery wrote:
> Even if the BMC only accepts signed images, we want to make sure that 
> the signed image the BMC fetches is the one that the administrator 
> *wants* to be fetched. With tftp or http (or any insecure transport), 
> one possible MiTM attack would be to substitute an alternate valid 
> image. Let's say the admin wants to go from 1.18 to 1.20, bu the 
> attacker wants to go to 1.16, which has a known vulnerability. The 
> image would be authenticated by the signature, and will be accepted. 

Thanks Vernon for raising this one - I think this is indeed a valid concern.

So there are essentially two things that we are talking about here, if 
we peel it a little bit:

1) an additional authorization by the BMC admin of specific images they 
want to run
2) plain integrity protection of the file being sent over insecure channel

The first one is a bit different from the second one (and frequently 
solved by co-signing these days), but in thise specific use case I'd say 
these two indeed overlap.

In this case, I'd rather suggest us to look into asymmetric crypto, so 
that no secret sharing/storage (with accompanying additional risk of 
compromise) is necessary. An admin would sign the image being sent + 
some context information (like time, to provide replay protection - also 
applicable to MAC case, otherwise the attacker can trivially replay the 
file/MAC) and the BMC would check the admin's signature using 
pre-provisioned public key (send over HTTPS, same as MAC key in your 
proposal - but only for integrity protection, con confidentiality is 
necessary) + verify that the context is "fresh" and then use the file.

I'd be happy to help out with elaborating details of the scheme, if 
that's deemed interesting enough for wider audience.

regards,
Alexander

