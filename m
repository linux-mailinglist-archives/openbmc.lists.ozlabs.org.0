Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB8A1FBB46
	for <lists+openbmc@lfdr.de>; Tue, 16 Jun 2020 18:18:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mYKR71gnzDqXY
	for <lists+openbmc@lfdr.de>; Wed, 17 Jun 2020 02:18:35 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mYFN1RggzDqjc
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jun 2020 02:11:50 +1000 (AEST)
IronPort-SDR: aekeds/Cz2mYfWPI2jJxjNLwvo9DYQg3hlh0hXiuJJpfLyeAN3O9UafkJjEhZHgKSElJMbPwGk
 yWbhToQammbA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2020 09:11:44 -0700
IronPort-SDR: RmB8yUWy3jamxgJjO4Lnvkk/P9vtpdYAQPUxAcWqsqg4CGsMuiiJIA6OYDyhWp1T+tQzQ7gAkp
 oHxxI2sBfTrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,518,1583222400"; d="scan'208";a="273202351"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.209.49.202])
 ([10.209.49.202])
 by orsmga003.jf.intel.com with ESMTP; 16 Jun 2020 09:11:44 -0700
Subject: Re: Redfish EventService Implementation
To: Patrick Williams <patrick@stwcx.xyz>
References: <019f5263-a7b2-9cb8-4420-cb597bd29afd@gmail.com>
 <b80d18b2bc2766d58158e9c93f05201e87b445cd.camel@fuzziesquirrel.com>
 <c31b2941-dc48-349a-68cf-c5292ccfc621@linux.intel.com>
 <1d2ad757-826d-1993-b88a-e92010b984ed@linux.vnet.ibm.com>
 <05ec7793-2efa-42da-ef56-94cc1477d2bb@linux.intel.com>
 <20200616152428.GA4618@heinlein>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <7e16df1c-38b0-d488-dbbf-75fe9ac818ab@linux.intel.com>
Date: Tue, 16 Jun 2020 09:11:43 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200616152428.GA4618@heinlein>
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
Cc: "Puli, Apparao" <apparao.puli@linux.intel.com>, "Bills,
 Jason M" <jason.m.bills@linux.intel.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, openbmc@lists.ozlabs.org,
 Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 6/16/2020 8:24 AM, Patrick Williams wrote:
> On Mon, Jun 15, 2020 at 02:42:11PM -0700, James Feist wrote:
>> On 6/15/2020 5:50 AM, Ratan Gupta wrote:
>>>       eg:
>>>           sd_journal_send("MESSAGE=%s", "Account Modified",
>>>               "PRIORITY=%i", LOG_INFO, "REDFISH_MESSAGE_ID=%s",
>>> "REDFISH_RESOURCE_PATH=/redfish/v1/AccountService/accounts/<id>",
>>>               "REDFISH_RESOURCE_TYPE=ComputerSystem"
>>>               "REDFISH_REGISTRY_PREFIX=Task/Base/Resource/Oem",
>>>               "REDFISH_MESSAGE_ARGS=%s", "Off", NULL);
>>
>> If we're going to go down the path of re-implementing logging, I think
>> the goal should be to stop logging things in the Journal that are
>> Redfish specific, and instead log them in some generic format that
>> phosphor logging controls the map. Right now we are bifurcated because
>> the dbus-event-logs, SEL, PEL, and Redfish are all using different
>> methods of logging, that play to their own set of rules.
> 
> Absolutely agree with you here.  There is zero reason that applications
> should start logging specially formed messages with REDFISH_* meta-data.
> We shouldn't have any applications explicitly know about Redfish except
> the Redfish providers themselves.  This is no different from IPMI, PLDM,
> or any other external interface.
> 
> The kind of information presented here as being interesting to expose
> via Redfish is equally as interesting to me to be able to add to one of
> our 'FFDC dumps', which could be used for security / forensic work.
> 
>> Most repos use
>> phosphor-logging, so instead of creating yet another daemon, if we added
>> support to create a 'System Level' or 'External User' log that has
>> predefined dictionaries of required and optional keys, something like
>> phosphor-dbus-interfaces, we might be able to drop some of these
>> transport specific logs, and have the transports based on the same
>> database (the journal). Then each transport could filter these based on
>> journal entry type, and transform them into the correct log for that
>> transport. I think adding more Redfish specifics into the logs hinders
>> those who do not want Redfish in their systems.
> 
> Can't we do this already today by defining a simple errors/metadata file
> in phosphor-dbus-interfaces and calling 'logging::report<...>' on it?
> This will create a record on dbus in phosphor-logging.
> 
I think the original concern was with supporting on the order of 10,000 
log entries, having this on d-bus seemed impractical. Also the free log 
rotation the journal provides is useful. Now modifying the 
logging::report<...> to conditionally log to the journal seems realistic.
