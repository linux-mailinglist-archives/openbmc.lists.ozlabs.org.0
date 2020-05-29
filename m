Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 866E31E8686
	for <lists+openbmc@lfdr.de>; Fri, 29 May 2020 20:21:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YXvz0RG0zDqk9
	for <lists+openbmc@lfdr.de>; Sat, 30 May 2020 04:21:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YXvH6q8rzDqgq
 for <openbmc@lists.ozlabs.org>; Sat, 30 May 2020 04:21:14 +1000 (AEST)
IronPort-SDR: /cwpGwL/+0vI7Lv77bgxDFADRg+jpoXvTAQI/+SOqoV2kHLeR1nwQu0xHVyY339f8ogQPqfH/2
 ujSuYabDjZ1Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2020 11:21:09 -0700
IronPort-SDR: rCVgkqVrUi1j5o9F4xWw121zU4DxfY6KaAmgALueg5ssTvAkCJ14P3mnHwN7mb16KViWGmVTPI
 M46RyfR8JrbQ==
X-IronPort-AV: E=Sophos;i="5.73,449,1583222400"; d="scan'208";a="267643762"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2020 11:21:08 -0700
Date: Fri, 29 May 2020 11:21:07 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: Sd_bus_call - ELOOP Issue
Message-ID: <20200529182107.GA7478@mauery.jf.intel.com>
References: <CAA7TbcvAOF-ThzEyZMkMr4T4XwBxXmCoO0MOL-WmywpFQuKpQQ@mail.gmail.com>
 <20200529180709.GH17541@heinlein>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200529180709.GH17541@heinlein>
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
Cc: anoo@us.ibm.com, openbmc@lists.ozlabs.org,
 Kumar Thangavel <kumarthangavel.hcl@gmail.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, Vijay Khemka <vijaykhemka@fb.com>,
 ratagupt@linux.vnet.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 29-May-2020 01:07 PM, Patrick Williams wrote:
>On Fri, May 29, 2020 at 09:29:48PM +0530, Kumar Thangavel wrote:
>
>>        6. As per our understanding, current  sd_bus_call not supported for
>> connection with the same bus/clients. (sender  and receiver are same
>>            application name ). Please confirm.
>>
>>             Log :
>>             yosemitev2 ipmid[370]: sd_bus_call function called..
>>             yosemitev2 ipmid[370]: sd_bus_call function ELOOP .
>>             yosemitev2 ipmid[370]:  unique name = :1.71
>>             yosemitev2 ipmid[370]:  incoming sender = :1.71
>>             yosemitev2 ipmid[370]: executeCallback called. catch block
>>             yosemitev2 ipmid[370]: EXCEPTION=sd_bus_call:
>> System.Error.ELOOP: Too many levels of symbolic links
>
>Yes, it appears that systemd has some code to specifically return ELOOP
>in this case:
>
>https://github.com/systemd/systemd/blob/master/src/libsystemd/sd-bus/sd-bus.c#L2236
>
>>
>>        So,  Could you please confirm sd_bus_call does not support the same
>> bus/clients with in the same process.
>>
>>        Also, Please let us know if any alternate method to  call the
>> execute dbus method with the same bus/connection.
>
>My suggestion would be to see if one of the functions in ipmid-new.cpp,
>such as executeIpmiCommand, can be exposed to providers for these kind
>of recursive callbacks.
>
>Maintainers of phosphor-host-ipmid have opinions here?

ipmid hosts a very small set of D-Bus objects/interfaces. I don't know 
of any standard commands that would call back to itself though. There is 
some context I seem to be missing here.

--Vernon
