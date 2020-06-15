Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2092E1FA303
	for <lists+openbmc@lfdr.de>; Mon, 15 Jun 2020 23:43:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49m4ZH2vjzzDqWx
	for <lists+openbmc@lfdr.de>; Tue, 16 Jun 2020 07:43:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49m4YQ24g6zDqgB
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jun 2020 07:42:15 +1000 (AEST)
IronPort-SDR: xo0lQ/vfISx/4i5LCG4oVj/AZ9uF2eRSQ3CJ2PXf1/2Qee1jKJ/NEzrtPHVAf/PGSIpPmrIrMI
 nM8jxHK/xx+g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2020 14:42:11 -0700
IronPort-SDR: I2nqatkF8BWL4C4I1tpb3pjLNHBuApBqvqkG8dF2Xt1S0+fk3nVgvtIDRbwN6FTjJsQUAeCL6+
 v/kpkA9/BLjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,516,1583222400"; d="scan'208";a="262835266"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.134.75.56])
 ([10.134.75.56])
 by fmsmga008.fm.intel.com with ESMTP; 15 Jun 2020 14:42:11 -0700
Subject: Re: Redfish EventService Implementation
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 "Puli, Apparao" <apparao.puli@linux.intel.com>, openbmc@lists.ozlabs.org
References: <019f5263-a7b2-9cb8-4420-cb597bd29afd@gmail.com>
 <b80d18b2bc2766d58158e9c93f05201e87b445cd.camel@fuzziesquirrel.com>
 <c31b2941-dc48-349a-68cf-c5292ccfc621@linux.intel.com>
 <1d2ad757-826d-1993-b88a-e92010b984ed@linux.vnet.ibm.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <05ec7793-2efa-42da-ef56-94cc1477d2bb@linux.intel.com>
Date: Mon, 15 Jun 2020 14:42:11 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <1d2ad757-826d-1993-b88a-e92010b984ed@linux.vnet.ibm.com>
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
Cc: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 6/15/2020 5:50 AM, Ratan Gupta wrote:
> Hi James/Apparao/Brad,
> 
> I am inclining towards having a separate application for Redfish 
> Logs(like: phosphor-sel-logger),
> This application does the following.
> 
> 1) Have the mapping info from Redfish resources to Dbus Resources
>       * This is needed as webserver have to provide the event filtering 
> through Resource Type
>       * eg : Redfish Client may ask as the client is interested in 
> "Account" Resource type
>              i.e all the user account related updates should be given to 
> redfish client.
>              which suggest that there should be mapping from Redfish 
> Resource to Dbus Resource
> 
> 2) Have the reverse mapping from Dbus Resources to Redfish Resources
>       * This is needed to send the Redfish event if there is any changes 
> in the
>         corresponding D-bus resources. eg BMC state change/network 
> change etc.
> 
> 3) This application monitors the D-bus event and Log the event in the 
> journal like below

Why do we need a listener on d-bus if the application creating the event 
already knows all the information? Why can't it log straight to the journal?

>      eg:
>          sd_journal_send("MESSAGE=%s", "Account Modified",
>              "PRIORITY=%i", LOG_INFO, "REDFISH_MESSAGE_ID=%s",
> "REDFISH_RESOURCE_PATH=/redfish/v1/AccountService/accounts/<id>",
>              "REDFISH_RESOURCE_TYPE=ComputerSystem"
>              "REDFISH_REGISTRY_PREFIX=Task/Base/Resource/Oem",
>              "REDFISH_MESSAGE_ARGS=%s", "Off", NULL);

If we're going to go down the path of re-implementing logging, I think 
the goal should be to stop logging things in the Journal that are 
Redfish specific, and instead log them in some generic format that 
phosphor logging controls the map. Right now we are bifurcated because 
the dbus-event-logs, SEL, PEL, and Redfish are all using different 
methods of logging, that play to their own set of rules. Most repos use 
phosphor-logging, so instead of creating yet another daemon, if we added 
support to create a 'System Level' or 'External User' log that has 
predefined dictionaries of required and optional keys, something like 
phosphor-dbus-interfaces, we might be able to drop some of these 
transport specific logs, and have the transports based on the same 
database (the journal). Then each transport could filter these based on 
journal entry type, and transform them into the correct log for that 
transport. I think adding more Redfish specifics into the logs hinders 
those who do not want Redfish in their systems.

> 
> 4) rsyslogd will put all these logs from journal into "/var/log/redfish" 
> file.
> 
> 5) bmcweb/webserver would inotify this file location and on notification 
> it will send redfish event
> 
> 6) Event filtering would be done at the bmcweb/webserver side.
> 

I think this will probably be needed if we want one source of truth for 
logs.

> 
> We already have the infrastructure for seq no 4 and seq no 5 and we 
> wanted to leverage this infrastructure.
> 
> Please let me know if there is any concern with this approach.
> 
> Ratan
> 
> On 6/9/20 6:28 AM, James Feist wrote:
>> On 6/8/2020 2:08 PM, Brad Bishop wrote:
>>> On Sat, 2020-02-01 at 02:23 +0530, RAJESWARAN THILLAIGOVINDAN wrote:
>>>> Hi,
>>>>
>>>> I am going through the bmcweb code for implementing Redfish
>>>> EventService based on the design document
>>>> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/24749. This design
>>>> is hooked to the journal based Redfish Event Logging.
>>>
>>> Would anyone else be willing to opine on whether or not they think
>>> journal based event schemes are what we want going forward for OpenBMC?
>>>
>>> My feeling is that they are not - as an alternative IPC mechanism don't
>>> we end up re-implementing things that DBus already does? Doesn't it
>>> require us to raise the same event twice everywhere (Once with DBus, and
>>> once in the journal)?  What does journal based eventing do that DBus
>>> signals don't do?
>>
>> We don't host log events on DBus at all, so there is no duplicate. The 
>> journal gives built in persistence and rotating of logs for large 
>> number of events. I know when this came up the last time one of the 
>> big issues was supporting thousands of logs wouldn't work well on DBus.
>>
>>
>>>
>>> Please poke holes.
>>>
>>> thx - brad
>>>
