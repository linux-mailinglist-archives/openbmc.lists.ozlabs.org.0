Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C711FC081
	for <lists+openbmc@lfdr.de>; Tue, 16 Jun 2020 22:59:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mgY81W7tzDqwT
	for <lists+openbmc@lfdr.de>; Wed, 17 Jun 2020 06:59:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mgXS2yGFzDqYW
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jun 2020 06:58:31 +1000 (AEST)
IronPort-SDR: vuwl0PnHiP4IuGjp+j1f69nKFpDu6C/RnaWgitUmIR8UkMFRZ0dCITO6Tys81xNlld1lJa1fBt
 01DUB366DlNg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2020 13:58:28 -0700
IronPort-SDR: b1uTmKYzSPxnAOp/PUBlOUp+jdB1FyVQgcN1BP6HAuvX+n+7hPHfGA1ONwiiGF4MF7DcdCMjpb
 3r+RJX2VM4Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,519,1583222400"; d="scan'208";a="273283392"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.209.49.202])
 ([10.209.49.202])
 by orsmga003.jf.intel.com with ESMTP; 16 Jun 2020 13:58:28 -0700
Subject: Re: Message registries continuation
To: Patrick Williams <patrick@stwcx.xyz>
References: <74794819-3b3c-0c39-30e0-b2ca6c46d9fb@linux.ibm.com>
 <85015a54-0de6-42e2-bd56-732c7f0a420d@linux.intel.com>
 <20200616205022.GD4618@heinlein>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <ef8239fe-4085-575c-2df8-025f458bbe4f@linux.intel.com>
Date: Tue, 16 Jun 2020 13:58:28 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200616205022.GD4618@heinlein>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Matt Spinler <mspinler@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 6/16/2020 1:50 PM, Patrick Williams wrote:
> On Tue, Jun 16, 2020 at 01:39:18PM -0700, James Feist wrote:
>> On 6/16/2020 12:47 PM, Matt Spinler wrote:
>>> Also, it may be overkill to need to  read in the same registry for every
>>> language, as there could
>>> be dozens and realistically they will never all be used on a single
>>> system, but if the desire is only
>>> to load them at startup before the current language is known I don't
>>> really see a way around it.
>>
>> I think this would require a default language and a bmcweb reload if the
>> language changed? Its probably ok to change languages after startup, as
>> long as the default language is loaded immediately to lower the chances
>> of run-time issues. As changing languages is probably a very infrequent
>> operation.
> 
> Couldn't two users of the same machine request / require different
> languages?  I know that any machine used by the Australian developers on
> this project I'd need to change the settings on so that I get the proper
> spelling of color.

:)

> 

Yes that's a good point, if you wanted to add language as a user 
setting, you could iterate through users and populate the needed 
languages that way too.




