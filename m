Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E5215B377
	for <lists+openbmc@lfdr.de>; Wed, 12 Feb 2020 23:16:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Hv9W72W9zDqP1
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2020 09:15:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Hv8f0wGjzDqRq
 for <openbmc@lists.ozlabs.org>; Thu, 13 Feb 2020 09:15:13 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Feb 2020 14:15:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,434,1574150400"; d="scan'208";a="281354084"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by FMSMGA003.fm.intel.com with ESMTP; 12 Feb 2020 14:15:11 -0800
Subject: Re: bmcweb Security issue
To: Bruce Mitchell <Bruce_Mitchell@phoenix.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>
References: <c9b3bf2691d44614a07caedcf35b2541@SCL-EXCHMB-13.phoenix.com>
 <20200212213150.GG1676@mauery.jf.intel.com>
 <4c55bb2c38e3489ca802467fef3e4d53@SCL-EXCHMB-13.phoenix.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <00f8c48b-5ef2-e115-fea1-4689cd3c4b26@linux.intel.com>
Date: Wed, 12 Feb 2020 14:15:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <4c55bb2c38e3489ca802467fef3e4d53@SCL-EXCHMB-13.phoenix.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 2/12/20 2:10 PM, Bruce Mitchell wrote:
> So Vernon, you are saying it could easily be way shorter than 10 years or even 825 days, correct?
> 

The general advice is to not use a self signed certificate at all. The 
fact that you're using one in the first place heavily outweighs the 
expiration period.


> -----Original Message-----
> From: Vernon Mauery [mailto:vernon.mauery@linux.intel.com]
> Sent: Wednesday, February 12, 2020 13:34
> To: Bruce Mitchell
> Cc: openbmc@lists.ozlabs.org
> Subject: Re: bmcweb Security issue
> 
> On 12-Feb-2020 05:52 PM, Bruce Mitchell wrote:
>> bmcweb Security issue: according to the The CA/Browser Forum https://cabforum.org/wp-content/uploads/CA-Browser-Forum-BR-1.6.7.pdf ;
>> Subscriber Certificates issued after 1 March 2018 MUST have a Validity Period no greater than 825 days.
>>
>> In bmcweb's ssl_key_handler.hpp we have:
>>             // Cert is valid for 10 years
>>             X509_gmtime_adj(X509_get_notAfter(x509),
>>                             60L * 60L * 24L * 365L * 10L);
>>
>> I believe we want this changed to the 825 days.
> 
> Self-signed certificates are not subscriber certificates.
> 
> This is a self-signed certificate, so really that is a bigger issue than
> the length of time that it is valid for. This certificate should only be
> trusted on a direct physical connection with no other machines. It is
> there only to facilitate uploading a valid key/certificate to the BMC.
> 
> It is not intended to be used for any amount of time.
> 
> --Vernon
> 
