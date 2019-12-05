Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C296411495F
	for <lists+openbmc@lfdr.de>; Thu,  5 Dec 2019 23:38:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47TVwk1LXxzDqcH
	for <lists+openbmc@lfdr.de>; Fri,  6 Dec 2019 09:37:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47TVvv5YLvzDqbC
 for <openbmc@lists.ozlabs.org>; Fri,  6 Dec 2019 09:37:14 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Dec 2019 14:37:09 -0800
X-IronPort-AV: E=Sophos;i="5.69,282,1571727600"; d="scan'208";a="294674894"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Dec 2019 14:37:09 -0800
Date: Thu, 5 Dec 2019 14:37:08 -0800
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Alexander Tereschenko <aleksandr.v.tereschenko@linux.intel.com>
Subject: Re: BMC update via TFTP
Message-ID: <20191205223708.GC9613@mauery.jf.intel.com>
References: <q7_GhCRdlxUNHfFX0Y4tW7FPq5Md7qwdFWbwd39V_S5zxrSBYtoXtvlNpQdZchvPB27edbJ3-QKFyZ97kzXoeH3Bby8IIHSWhxle9jzteKA=@protonmail.com>
 <5747d991-27b7-4bb1-8a25-f46d1de832e1@linux.vnet.ibm.com>
 <f778ce0c-f395-7528-ed05-cec194707a14@linux.vnet.ibm.com>
 <9e0303e5beb34b9bb50b050cd56e35d8@linux.vnet.ibm.com>
 <ed917fd0-61e1-3ff8-05f9-863d3e451c93@linux.ibm.com>
 <20191204213650.GB9613@mauery.jf.intel.com>
 <94b297b5-81d1-1e07-498f-155a9160cb1d@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <94b297b5-81d1-1e07-498f-155a9160cb1d@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On 05-Dec-2019 12:05 PM, Alexander Tereschenko wrote:
>On 04-Dec-19 22:36, Vernon Mauery wrote:
>>Even if the BMC only accepts signed images, we want to make sure 
>>that the signed image the BMC fetches is the one that the 
>>administrator *wants* to be fetched. With tftp or http (or any 
>>insecure transport), one possible MiTM attack would be to substitute 
>>an alternate valid image. Let's say the admin wants to go from 1.18 
>>to 1.20, bu the attacker wants to go to 1.16, which has a known 
>>vulnerability. The image would be authenticated by the signature, 
>>and will be accepted.
>
>Thanks Vernon for raising this one - I think this is indeed a valid concern.
>
>So there are essentially two things that we are talking about here, if 
>we peel it a little bit:
>
>1) an additional authorization by the BMC admin of specific images 
>they want to run
>2) plain integrity protection of the file being sent over insecure channel
>
>The first one is a bit different from the second one (and frequently 
>solved by co-signing these days), but in thise specific use case I'd 
>say these two indeed overlap.
>
>In this case, I'd rather suggest us to look into asymmetric crypto, so 
>that no secret sharing/storage (with accompanying additional risk of 
>compromise) is necessary. An admin would sign the image being sent + 
>some context information (like time, to provide replay protection - 
>also applicable to MAC case, otherwise the attacker can trivially 
>replay the file/MAC) and the BMC would check the admin's signature 
>using pre-provisioned public key (send over HTTPS, same as MAC key in 
>your proposal - but only for integrity protection, con confidentiality 
>is necessary) + verify that the context is "fresh" and then use the 
>file.

I am not convinced that it needs to be this elaborate. I don't see what 
it adds over the simple case of sending the key/hmac/uri encrypted with 
TLS to the BMC. There will be no replay attacks because TLS prevents it. 

Maybe I am missing something?

--Vernon

>I'd be happy to help out with elaborating details of the scheme, if 
>that's deemed interesting enough for wider audience.


