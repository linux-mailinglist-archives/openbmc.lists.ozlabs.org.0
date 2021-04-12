Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AC335BA31
	for <lists+openbmc@lfdr.de>; Mon, 12 Apr 2021 08:40:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJfHS6brBz30D5
	for <lists+openbmc@lfdr.de>; Mon, 12 Apr 2021 16:40:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=yugang.chen@linux.intel.com; receiver=<UNKNOWN>)
X-Greylist: delayed 63 seconds by postgrey-1.36 at boromir;
 Mon, 12 Apr 2021 16:39:51 AEST
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJfHC5kxPz2yZ9
 for <openbmc@lists.ozlabs.org>; Mon, 12 Apr 2021 16:39:51 +1000 (AEST)
IronPort-SDR: Qvj3HMRvKMnJgyIXR5SAgFdKVGbv+7RasptLJl2mBMpQqvkMj69QmIMlLKFAYP3EZ5n8H3ZrJh
 rrmQKQt/uknw==
X-IronPort-AV: E=McAfee;i="6000,8403,9951"; a="258098670"
X-IronPort-AV: E=Sophos;i="5.82,214,1613462400"; d="scan'208";a="258098670"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2021 23:38:41 -0700
IronPort-SDR: Xcn1BajMdM8U6PN8NKPIjHIAXIUH27K39anIpECw7GOTzST1tItYe3kl3UKeB9Mmwcsa0DB+Ec
 e2617dpl3Z1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,214,1613462400"; d="scan'208";a="417249443"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga008.fm.intel.com with ESMTP; 11 Apr 2021 23:38:40 -0700
Received: from [10.238.5.192] (yugangch-MOBL.ccr.corp.intel.com [10.238.5.192])
 by linux.intel.com (Postfix) with ESMTP id BBFF558090C;
 Sun, 11 Apr 2021 23:38:39 -0700 (PDT)
Subject: Re: apply for a new repo "openbmc/node-data-sync"
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <cab2988f-76b8-6a30-5fa9-0ee8030af7f0@linux.intel.com>
 <AF9887DB-F6CB-4CE0-90B1-17FEA2497013@fuzziesquirrel.com>
From: "yugang.chen" <yugang.chen@linux.intel.com>
Message-ID: <bd64513a-76f6-7617-9942-ced892b2c500@linux.intel.com>
Date: Mon, 12 Apr 2021 14:38:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <AF9887DB-F6CB-4CE0-90B1-17FEA2497013@fuzziesquirrel.com>
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
Cc: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 chunhui.jia@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

thanks, Brad.

+ openbmc@lists.ozlabs.org .

Dear All,

I'm Intel BMC engineer, we have a module is used to sync sensor data between BMC nodes in one Chassis system. In our Modular system, there are 2 nodes or 4 nodes, one node works as Primary node, the other nodes work as secondary nodes.

1. Some sensors are only visible for primary BMC, but secondary nodes need the sensors for Fan control.

2. Some sensor are in secondary nodes, they are needed to show them on primary node.

So, we need a new repo to sync the sensor data between primary node and secondary nodes, could you create a repo "openbmc/node-data-sync"? thanks.

Best Regards

Daniel(Yugang)


On 4/10/2021 10:55 PM, Brad Bishop wrote:
> Hi Daniel
>
> Can you please send this to the mailing list so everyone can be aware of the work you are doing?
>
> thanks - brad
>
>> On Apr 7, 2021, at 1:31 AM, yugang.chen <yugang.chen@linux.intel.com> wrote:
>>
>> Hi Brad,
>>
>> I'm Intel BMC engineer, we have a module is used to sync sensor data between BMC nodes in one Chassis system. In our Modular system, there are 2 nodes or 4 nodes, one node works as Primary node, the other nodes work as secondary nodes.
>>
>> 1. Some sensors are only visible for primary BMC, but secondary nodes need the sensors for Fan control.
>>
>> 2. Some sensor are in secondary nodes, they are needed to show them on primary node.
>>
>> So, we need a new repo to sync the sensor data between primary node and secondary nodes, could you create a repo "openbmc/node-data-sync"? thanks.
>>
>>
>> Best Regards
>>
>> Daniel(Yugang)
>>
