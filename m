Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 34302188A9B
	for <lists+openbmc@lfdr.de>; Tue, 17 Mar 2020 17:41:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hf7R1nwLzDqd2
	for <lists+openbmc@lfdr.de>; Wed, 18 Mar 2020 03:41:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hdBB1237zDqWN
 for <openbmc@lists.ozlabs.org>; Wed, 18 Mar 2020 02:58:23 +1100 (AEDT)
IronPort-SDR: 7waFtMYj4RyeZSZ5G5eVwcr5odrmK6NYKdI1/5QNwL0fFq4IueHi1bd7TEABab3E64wZzwXSE6
 54zo+zGfEAAw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2020 08:58:20 -0700
IronPort-SDR: ZtgrwPFGzPqDetf49xBJviVt0sNfh8HdECvGSIPkmuMvRvodrw0CernxPJ+HlqphXC1fWCaHdN
 PAw/a7/ViqOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,564,1574150400"; d="scan'208";a="236369157"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.135.41.192])
 ([10.135.41.192])
 by fmsmga007.fm.intel.com with ESMTP; 17 Mar 2020 08:58:20 -0700
Subject: Re: Proposal for the connected redfish client info
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
References: <94469ba3-2b59-b131-ecbe-d708054aef89@linux.vnet.ibm.com>
 <bfd9332f-1a27-d00f-4379-8c039b9e9b24@linux.vnet.ibm.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <76571c68-ed92-f15f-cfd5-37a323b430b1@linux.intel.com>
Date: Tue, 17 Mar 2020 08:58:19 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <bfd9332f-1a27-d00f-4379-8c039b9e9b24@linux.vnet.ibm.com>
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

On 3/17/2020 6:01 AM, Ratan Gupta wrote:
> Hi Team,
> 
> Looking for your inputs
> 
> James, How about option1 for the below use case

Before creating OEM we are to propose it to the Redfish community. Have 
you asked them for their thoughts?

> 
> Ratan
> 
> On 3/11/20 3:48 PM, Ratan Gupta wrote:
>>
>> Hi Team,
>>
>> In IBM we have a following requirement
>>
>>   * Show the connected redfish client info.
>>       o   ClientIP >>       o   Client Unique Identifier(unique serial number of the 
client etc)

This confuses me, how are you getting the serial number for a connected 
client? If so, have you looked into data protection laws and storing 
Personally Identifiable Information?

>>
>>
>> Presently there is no way through which we can get this info.
>>
>> I have following two proposal for the above requirement.
>>
>> 1/ (Extend the session schema)
>>
>> Add the IPaddress and the client Identifier as a OEM in the session 
>> schema,
>> Clinet IP would be read only and will be updated once the redfish 
>> client creates the session.
>> ClientIdentifier(Management console unique serial number etc) will be 
>> writable property and can be set by the redfish client
>> during creation of the session or after creating the session.
>>
>>
>> 2/ (Create the Manager object at runtime)
>> once the redfish client creates the session , bmcweb internally does 
>> the following
>>
>> - Create the manager object whose type is "Management Controller".
>>
>> - Create the ethernet interface resource manager resource and update 
>> the client IP.
>>
>>    In the second option how to set the Client unique identifier which 
>> is to be given by the Redfish client

I've had talks before about creating a new systems schema for the BMC 
specifically, so that you could expose things like bmc memory, etc. 
Systems also has the Ethernet schema. However this depends on what 
you're trying to present.

>>
>>  Please let me know your thoughts on the above.
>>
>> Ratan
>>
