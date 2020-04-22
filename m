Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB68F1B4BAF
	for <lists+openbmc@lfdr.de>; Wed, 22 Apr 2020 19:26:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496nR00z50zDqwW
	for <lists+openbmc@lfdr.de>; Thu, 23 Apr 2020 03:26:20 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 496nPq2VmPzDqrX
 for <openbmc@lists.ozlabs.org>; Thu, 23 Apr 2020 03:25:18 +1000 (AEST)
IronPort-SDR: PzDNiERJp6/msmckZOc0JFfUOXttNmZZMcvTEzUsvUrlVZgAcDjdxtVCHrf3IPAmciIguAImYt
 h9Ql29LCZMMw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2020 10:25:16 -0700
IronPort-SDR: 3HY6ywdiS/m+EqIVZZsXd/5lVet07s313Is3Q4Yy88rvbSDaPOKwv+xrvvFDTCaJHDEIcOCh19
 rulUZ8syso0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,304,1583222400"; d="scan'208";a="292013749"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.134.47.201])
 ([10.134.47.201])
 by orsmga008.jf.intel.com with ESMTP; 22 Apr 2020 10:25:16 -0700
Subject: Re: dbus-sensors
To: Matt Spinler <mspinler@linux.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <dbdb4dac-a73a-5c39-8cf8-33dd2d318d16@linux.ibm.com>
 <2cb1c83a-9803-c9ac-ae76-2e09b616562e@linux.intel.com>
 <4a5cad39-b366-0a0c-54b0-23da9f2a3d81@linux.ibm.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <c9ec3a62-8fa2-f48b-14c2-d9cb3a3c2467@linux.intel.com>
Date: Wed, 22 Apr 2020 10:25:15 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <4a5cad39-b366-0a0c-54b0-23da9f2a3d81@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 4/22/2020 9:19 AM, Matt Spinler wrote:
>>>
>>> 4. If not already supported (was unsure), be able to find an
>>>    _input file based on a value it has in the corresponding _label file.
>>
>> PSU sensor does this, hwmontemp does it by index.
> 
> Would you be OK with us also adding this to PSUSensor?

PSUSensor already does this? Do you mean hwmontemp sensor? I'd be fine 
with converting the index scheme to a label scheme.

