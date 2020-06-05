Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D25111EF0D5
	for <lists+openbmc@lfdr.de>; Fri,  5 Jun 2020 07:14:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49dW6R73tDzDqnv
	for <lists+openbmc@lfdr.de>; Fri,  5 Jun 2020 15:14:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=yugang.chen@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49dW5j1xFCzDqmY
 for <openbmc@lists.ozlabs.org>; Fri,  5 Jun 2020 15:14:00 +1000 (AEST)
IronPort-SDR: qo1BQOrC1smLtgyJfjN3wnDoGwVl9MAkaSCs5Trnb2fNCIbcKN/tetCM5z+Kj4HY4bTwXyLVdb
 OKWUOHsegA7Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2020 22:13:57 -0700
IronPort-SDR: tftyY8f2oGEG3RhCuawUqqmGYreLJBIWvZ7okY39FNDLpsuj4gvsVC5cZJJVdbyCpN2X1vqsO6
 OAeH4LJnODcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,475,1583222400"; d="scan'208";a="258584183"
Received: from yugangch-mobl.ccr.corp.intel.com (HELO [10.238.4.37])
 ([10.238.4.37])
 by orsmga007.jf.intel.com with ESMTP; 04 Jun 2020 22:13:53 -0700
Subject: Re: add Node<x> as /redfish/v1/Systems/Node<x>/ for multi-node system
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>,
 James Feist <james.feist@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "Leung, John" <john.leung@intel.com>, jason.m.bills@linux.intel.com,
 chunhui.jia@linux.intel.com, gmills@us.ibm.com
References: <b6aab1d7-3437-c402-7574-c2dcbd5567b3@linux.intel.com>
 <ac5dd8bc-fc11-02ec-9701-193f2d68e284@linux.intel.com>
 <c611b757-ecea-0f40-df32-39e4fd88fee7@linux.intel.com>
 <f0a98532-b26a-5730-b7ed-5d4cd9c250d2@linux.vnet.ibm.com>
From: "yugang.chen" <yugang.chen@linux.intel.com>
Message-ID: <c755997e-2d08-1289-5250-06f84b524ec9@linux.intel.com>
Date: Fri, 5 Jun 2020 13:13:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <f0a98532-b26a-5730-b7ed-5d4cd9c250d2@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Deepak,  It looks something like that. Is it possible to loop us in 
while you post something on Gerrit? thanks.

On 6/4/2020 4:14 PM, Deepak Kodihalli wrote:
> On 04/06/20 1:08 pm, yugang.chen wrote:
>> Dear Deepak,
>>
>> I'm openbmc engineer working for redfish' slave log in multiple 
>> systems, we want to add slave node's log to redfish,  is there some 
>> design or documentation for systems schema based on associations to 
>> different systems interface? if so, we can work based on that common 
>> interface for slave logs on redfish, thanks.
>
> This is something I'm still working on (and should be able to post 
> something on Gerrit in a few days). Just so that we're on the same 
> page - the problem I am trying to solve is a D-Bus model based 
> approach to depict multiple systems and the parts contained within 
> (the parts could be physical containment as well as logical things 
> like logs). This would prevent writing code that assumes specific 
> names in the D-Bus path hierarchy. Daniel/James - does this help the 
> problem you are trying to solve?
>
>> Best Regards
>>
>> Yugang(Daniel) Chen
>>
>>
>> On 6/3/2020 12:40 AM, James Feist wrote:
>>> On 6/1/2020 11:39 PM, yugang.chen wrote:
>>>> Dear All,
>>>>
>>>> May I have your attention? For a multi-node system,  there is an 
>>>> option for master to use name "Node<x>" as ​{ComputerSystemId} to 
>>>> stand for slave node, to show slave node's event log in master 
>>>> redfish,
>>>>
>>>> Could you please share your comment/idea for naming ("Node<x>")? 
>>>> thanks.
>>>
>>> Has there been any design docs for multiple systems in Redfish? This 
>>> is much bigger than just adding support for multiple logs, this is 
>>> adding support for multiple Systems interfaces, and many things need 
>>> to be considered such as the mapping of multiple CPUs, Memory, logs, 
>>> and how this fits into the inventory picture. On IRC a while back we 
>>> had discussed making the systems schema based on associations to 
>>> different systems interfaces, and I believe a design was going to be 
>>> written on this topic by Deepak. The name should probably come from 
>>> the Systems interfaces that are provided. I'm not sure why we would 
>>> need to hardcode these. How these interfaces get created, and what 
>>> they map to, needs to be discussed.
>>>
>>>
>>>>
>>>> here is the patch for code review:
>>>> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/32971 ;
>>>>
>>>> for example, Node1:
>>>>
>>>> /​redfish/​v1/​Systems/​{ComputerSystemId}/​LogServices/​ 
>>>> {LogServiceId}/ ​Entries/​{LogEntryId} -->
>>>> /​redfish/​v1/​Systems/​Node1/​LogServices/​{LogServiceId}/​Entries/​ 
>>>> {LogEntryId}
>>>>
>>>> Best Regards
>>>>
>>>> Daniel(Yugang)
>>>>
>
