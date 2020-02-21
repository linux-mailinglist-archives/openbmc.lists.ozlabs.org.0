Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B9716885E
	for <lists+openbmc@lfdr.de>; Fri, 21 Feb 2020 21:30:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48PNPp2ZrhzDqZD
	for <lists+openbmc@lfdr.de>; Sat, 22 Feb 2020 07:30:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48PNNq2XjdzDqWS
 for <openbmc@lists.ozlabs.org>; Sat, 22 Feb 2020 07:29:46 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Feb 2020 12:29:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,469,1574150400"; d="scan'208";a="254928531"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga002.jf.intel.com with ESMTP; 21 Feb 2020 12:29:43 -0800
Subject: Re: Security Working Group meeting - this Wednesday February 19 -
 summary results
To: Bruce Mitchell <Bruce_Mitchell@phoenix.com>,
 Patrick Williams <patrick@stwcx.xyz>,
 Alexander Tereschenko <aleksandr.v.tereschenko@linux.intel.com>
References: <b9170918-0937-714a-470e-cb41e1e74b63@linux.ibm.com>
 <f4d9d6f6-277e-8c8b-6b5c-d0577eaa82cc@linux.ibm.com>
 <20200220162633.GB41328@patrickw3-mbp.dhcp.thefacebook.com>
 <2b30dde7-3415-8c7a-2001-28793e938339@linux.intel.com>
 <20200221201022.GA67957@patrickw3-mbp.dhcp.thefacebook.com>
 <2c409610c4544e0187e37a5322c6a313@SCL-EXCHMB-13.phoenix.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <18a2f2f6-7281-8884-20c2-eceee87c3bea@linux.intel.com>
Date: Fri, 21 Feb 2020 12:29:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <2c409610c4544e0187e37a5322c6a313@SCL-EXCHMB-13.phoenix.com>
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

On 2/21/20 12:21 PM, Bruce Mitchell wrote:
> 
> 
>> -----Original Message-----
>> From: openbmc [mailto:openbmc-
>> bounces+bruce_mitchell=phoenix.com@lists.ozlabs.org] On Behalf Of
>> Patrick Williams
>> Sent: Friday, February 21, 2020 12:10
>> To: Alexander Tereschenko
>> Cc: openbmc@lists.ozlabs.org
>> Subject: Re: Security Working Group meeting - this Wednesday February
>> 19 - summary results
>>
>> On Fri, Feb 21, 2020 at 01:19:25PM +0100, Alexander Tereschenko wrote:
>>> On 20-Feb-20 17:26, Patrick Williams wrote:
>>>> Can we put something into bmcweb to detect its own certificate has
>>>> expired and generate a new one?
>>>
>>> The idea here is to discourage any prolonged use of the default
>> self-signed
>>> certs at all, as they don't provide full protection from MitM attacks.
>>> That's why the 30 days validity period was suggested (compared to
>> current 10
>>> years) and discussed during the meeting. Adding an auto-regeneration
>> feature
>>> would be going directly against that idea, so I personally wouldn't
>> vote for
>>> that.
>>
>> To me, if bmcweb is handing out an expired self-signed certificate that is
>> a bug.  I don't think we should be so heavy-handed to decide for others
>> what "secure" means.  We can certainly propose best practices but we
>> should not force specific behavior.
>>
>> I'm not suggesting that real certs aren't better than self-signed ones, but
>> some people have a well-isolated management network in a data center
>> behind locked doors.  They might decide that the likelihood of MitM
>> attack there isn't serious enough to devote engineering resources on a
>> certificate distribution scheme. (*)
>>
>> We should keep in mind that part of the original motivation for this
>> project, and what keeps certain companies that don't market general-
>> purpose servers involved in it, is that they weren't satisfied with the
>> constraints being placed on them by the standard offering in the industry.
>> If we become too heavy-handed here, we also lose that advantage.
>>
> 
> I do not believe that the BMC's self-generated self-signed certificate should
> be beyond what web browsers will accept (or in the near future).  If the customer
> wants to install their own self-signed certificate (i.e. not from the BMC) then that
> is their issue and can do what they want on  their own self-signed certificate.
> 

I think the original motivation of 10 years was something above the 
average support cycle of a server, so on first boot the user has 
something they can use to login to the server with. That being said, if 
the browser wont let you in, that is obviously more important. 30 days 
seems a bit too strict considering shipping / unpacking times make it 
likely you'll have an expired certificate upon arrival. But if we can't 
come to an agreement, we can always make this configurable.


>>>> I know self-signed certs aren't great, but the minute I have more
>> than 6
>>>> systems I'm not going to want to follow some "BMC Admin Guide" to
>> update
>>>> certificates by hand.  So we're effectively forcing everyone to
>> develop
>>>> some kind of certificate management infrastructure, without
>> providing
>>>> (or pointing to an existing) implementation.
>>> I'd say that in such context, you'd be using one of the configuration
>>> management systems (Puppet/Chef/Salt/Ansible/homegrown
>> scripts/whatnot)
>>> anyway, as that's a standard system administration BKM, so IMHO that's
>> a
>>> reasonable assumption at the OpenBMC project end that it's not going
>> to add
>>> any noticeable burden for BMC admins.
>>
>> Fair.  But again, others might not feel that is a high enough value
>> problem to devote engineering resources to solve.
>>
>> (*) Please don't read this as an implication into how my current
>>      employer's management network is or is not designed.
>> --
>> Patrick Williams
> 
