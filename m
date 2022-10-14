Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 539505FF251
	for <lists+openbmc@lfdr.de>; Fri, 14 Oct 2022 18:35:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MpsSY12p6z3dqV
	for <lists+openbmc@lfdr.de>; Sat, 15 Oct 2022 03:35:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=pBWLobNt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com; envelope-from=n.chegodaev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=pBWLobNt;
	dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MpsRx5mz3z3c6r
	for <openbmc@lists.ozlabs.org>; Sat, 15 Oct 2022 03:34:51 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
	by mta-01.yadro.com (Postfix) with ESMTP id 5248741210;
	Fri, 14 Oct 2022 16:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:references:content-language:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received
	:received:received; s=mta-01; t=1665765282; x=1667579683; bh=zBX
	rsntNO98c9MQ/pi3A+hN+43DZz/+Oahgqf1F2sGU=; b=pBWLobNtr8cPEsSLvSX
	QNwuw4gAQugwatCl+msmNMPuSSXY7EAOlnAt32Aj1hMlobY3nmPPpL92nzCKoZNA
	Y5m4ZLL44tHBjEtx6+YyRaaq3BUapgcUTCq/2Kkc+Fo+j8yPWBMVzBsOvSUQ+0rY
	Ob5ZydzCAhlGZhlMXMX1WXJk=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
	by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fDyNaROah4Cs; Fri, 14 Oct 2022 19:34:42 +0300 (MSK)
Received: from T-EXCH-01.corp.yadro.com (T-EXCH-01.corp.yadro.com [172.17.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Postfix) with ESMTPS id B88A74088A;
	Fri, 14 Oct 2022 19:34:41 +0300 (MSK)
Received: from T-EXCH-08.corp.yadro.com (172.17.11.58) by
 T-EXCH-01.corp.yadro.com (172.17.10.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Fri, 14 Oct 2022 19:34:41 +0300
Received: from [10.199.24.208] (10.199.24.208) by T-EXCH-08.corp.yadro.com
 (172.17.11.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1118.9; Fri, 14 Oct
 2022 19:34:40 +0300
Message-ID: <fc94abed-0bc1-ae69-4851-5765a26c3c62@yadro.com>
Date: Fri, 14 Oct 2022 19:34:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Webui-vue: table multisort feature.
Content-Language: en-US
To: Gunnar Mills <gmills@linux.vnet.ibm.com>, <openbmc@lists.ozlabs.org>
References: <c0a6d816-5567-941a-b280-93acde717916@yadro.com>
 <5f705c41-cca5-27db-405f-7a118584da00@linux.vnet.ibm.com>
From: Nikolay Chegodaev <n.chegodaev@yadro.com>
In-Reply-To: <5f705c41-cca5-27db-405f-7a118584da00@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.199.24.208]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-08.corp.yadro.com (172.17.11.58)
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
Cc: sandeepa.singh@ibm.com, a.nikhil@ibm.com, i.kononenko@yadro.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Good day Gunnar,
Good day Sandeepa,

Thank you for comming back to me.
If you have no objections I will answer you questions in
the order those were asked.

> What tables are you attempting to add multi-sort to?
  We attempting to multi-sorting on the Sensors page. 
  It seems suitable to sort by units and status the data
  that was already sorted in the naming order in
  our current situation.


> Sandeepa and I looked at this vue-tables-2 and our concern is the single
contributor. We are also concerned about what else might break. Could
you explain more why multi-sort is so needed?
  The only possible explanation is that we have a necessity to 
  implement the feature on Sensors page to sort first by the 
  Sensors names, then add the sorting by units and status fields
  to that results. Some of our critical combinations could easily
  be found this way.
  
  Yes, there is only one contributor on this project.
  Majority of the projects a checked recently are all maintained by 1-2 persons.
  It seems, that 1 component projects are too to be supported by a larger teams.
  
  
  The support on vue-tables-2 is pretty decent, quite similar to the one
  of free Antiviruses community support - though the documentation is not
  quite detailed on some new features, the author seems to actively support
  his project and the answers are quite often and detailed as well.
  That is why I actually choose this component of all others - because of 
  somewhat acceptable support in comparison to other small projects.

Thanks.
-- 
Yours sincerely,
Nikolay Chegodaev

On 14.10.2022 18:32, Gunnar Mills wrote:
> «Внимание! Данное письмо от внешнего адресата!»
> 
> On 10/11/2022 7:14 AM, Nikolay Chegodaev wrote:
> 
>>
>> It seems like that to continue to use the BoostrapVue table component(or b-tables for short) as part of OpenBMC WebUI-vue part, it needs multi sorting to be enabled
>> on BoostrapVue table component, but this issue is not yet implemented as part of b-tables main package and remains in-progress.
>>
>> As per author comments by this link https://github.com/bootstrap-vue/bootstrap-vue/issues/2068#issuecomment-629342977 it is still in the works.
>> The same goes to the PR/Commit with this new feature in BoostrapVue table component repository https://github.com/bootstrap-vue/bootstrap-vue/pull/4242
>>
>> Our recent changes involve the multi-sorting features to be already present, but there are none, unfortunately.
> 
> What tables are you attempting to add multi-sort to?
> 
>>
>> 1) If you have more information on when this feature will be available as part of the package, would you mind to share it?
> 
> We don't other than the issue you referenced. I posted on this issue.
> 
>>
>> 2) And afterwards the aforementioned commit would be merged for BoostrapVue table component, would it be possible to update the OpenBMC WebUI-vue upstream with this change and how long does it take?
> 
> Yes, it should be possible to update to the new version and it shouldn't
> take long after a bootstrap-vue release. Without a commit it is too hard
> to say an exact time.
> 
>>
>> In the meanwhile, I have an instructions to discuss the proposal to change the BoostrapVue table component to the vue-tables-2-premium globally for the whole WebUI-vue part of OpenBMC project.
>> The manual for the component is here: https://matanya.gitbook.io/vue-tables-2/ it seems that the component is supporting the muritsorting feeature already and it works.
> 
>> Beyond the multi-sorting feature the vue-tables-2-premium can propose the following interesting features(pros) - most notable of which are the following:
>> - There two modes included - direct request (using the Axios or Server-table) and existing data usage mode (from some Vuex/Pinia storage perhaps, Client-table),
>>    which, in theory, may enable us to use Thunk-like (a technology from Redux to pre-load data to say it in a simple way) access to server, if we would need it some day
>> - The component includes grouping feature named child rows, which would allow us to implement a table-within-table - in short, when you click on some row,
>>    it will expand to some more rows or web-links hidden under the parent-row in a folder-like manner
>> - It also includes Virtual pagination, which can load additional data while we scroll the table and allow us to clean the screen of page-list components
>>
>> The component also several not so great features(cons):
>> - It is written by one-man team, yes, it is written to best possible level of excellence, but there are still flaw, which does prevent us from accessing the headers of table columns in a unified way
>>    like we do BoostrapVue table component - while on b-tables we do `<template #head(column_name)>` on vue-tables-2-premium we would need to do this on low level render way like so `<template #h__column_name>`
>>    there also necessities to change some CSS Designs to make the vue-tables-2-premium table to look in the same way as BoostrapVue table component, but those are quite minor.
> 
> 
> Sandeepa and I looked at this vue-tables-2 and our concern is the single
> contributor. We are also concerned about what else might break. Could
> you explain more why multi-sort is so needed?
> 
>>
>> 3) At the moment, we need to change BoostrapVue table component on one of the WebUI-vue page/views(where we desperately need it) to vue-tables-2-premium (or maybe some other component), temporarily until
>> BoostrapVue table component will support multi-sorting feature as an integrate part, but if the community would approve the change from BoostrapVue table component to vue-tables-2-premium -
>> vue-tables-2-premium could be changed on every page on constant basis (or until we get the multi-sorting support for the BoostrapVue table). So, what do you think?
>>
> 

-- 
Yours sincerely,
Nikolay Chegodaev
