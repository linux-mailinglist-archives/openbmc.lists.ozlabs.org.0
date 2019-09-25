Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5E1BE206
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 18:12:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46djkf6Z8ZzDqgf
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 02:12:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (helo) smtp.helo=mga12.intel.com
 (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46djjs46SzzDqZn
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 02:11:42 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Sep 2019 09:11:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,548,1559545200"; d="scan'208";a="364369703"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga005.jf.intel.com with ESMTP; 25 Sep 2019 09:11:39 -0700
Subject: Re: [External] Re: Question for upstream
To: Payne Yang <pyang4@lenovo.com>, "Tanous, Ed" <ed.tanous@intel.com>
References: <6bb44c8941db46efb2e7e2a0da39d2db@lenovo.com>
 <4053AD86-2951-40CD-93D2-FEB381B7B14A@intel.com>
 <4f41e599eba54f1cb2a85defacd42578@lenovo.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <8ce6c954-f67b-16fa-7707-586fccce95aa@linux.intel.com>
Date: Wed, 25 Sep 2019 09:11:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <4f41e599eba54f1cb2a85defacd42578@lenovo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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

On 9/24/19 10:00 PM, Payne Yang wrote:
> Hi Tanous,
> 
> Got it.
> By the way, I have to include a specific fpga library in this implementation.
> Should I update it also ?

The library should most likely be its own recipe, and dbus-sensors 
should get a DEPENDS added to its recipe.

> 
>> -----Original Message-----
>> From: Tanous, Ed <ed.tanous@intel.com>
>> Sent: Wednesday, September 25, 2019 11:39 AM
>> To: Payne Yang <pyang4@lenovo.com>
>> Cc: openbmc@lists.ozlabs.org
>> Subject: [External] Re: Question for upstream
>>
>> Create a gerrit review on dbus-sensors with your implementation.
