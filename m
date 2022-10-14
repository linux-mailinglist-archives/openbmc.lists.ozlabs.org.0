Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA415FF171
	for <lists+openbmc@lfdr.de>; Fri, 14 Oct 2022 17:33:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mpr5060j5z2xZ7
	for <lists+openbmc@lfdr.de>; Sat, 15 Oct 2022 02:33:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hsp1gHgH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hsp1gHgH;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mpr4N1tsYz2xkD
	for <openbmc@lists.ozlabs.org>; Sat, 15 Oct 2022 02:32:51 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29EEvgmo023061;
	Fri, 14 Oct 2022 15:32:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=jB5SuXxj+HXn4FQyhOutFRn5VpAor2LsaADZO1cK764=;
 b=hsp1gHgHQQjQAmxGh0S8ygN0sAiqIeLgSWGgbq9ZwlokhzrOiFnOo2FpUE1gBPpo4EmB
 ttQqepzEqUvF97nKjE4cA2BXay2ez29urzceO/bOqN7Dh+9ejoK/q0eYTlB60WSL4LXJ
 bm/192WRkRRkJu9RDI40bSGL1z2cfYoG1Bm4kzBSPgfqD+i3tpiLlS8ZUiHdYt5My0dO
 mq9q7PKAGWY9LnHS/eANVQyNCrEc0GsCd15YQNQksQYrYy6/CtC4vKyPdYKdN7f0WIUn
 9UIz786bDC6kUuFZXwHRibQM1dik64EZDyQWxSvn5j5xnpBQW7CctGyyIH3ASVJQQJ1e VA== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k7a08s58e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Oct 2022 15:32:48 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29EFKPSp016023;
	Fri, 14 Oct 2022 15:32:47 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com [9.57.198.29])
	by ppma01dal.us.ibm.com with ESMTP id 3k6kcmk145-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Oct 2022 15:32:47 +0000
Received: from smtpav06.wdc07v.mail.ibm.com ([9.208.128.115])
	by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29EFWjeG8585770
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Oct 2022 15:32:46 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B95B558060;
	Fri, 14 Oct 2022 15:32:45 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1CFA858054;
	Fri, 14 Oct 2022 15:32:45 +0000 (GMT)
Received: from [9.211.77.171] (unknown [9.211.77.171])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Oct 2022 15:32:44 +0000 (GMT)
Message-ID: <5f705c41-cca5-27db-405f-7a118584da00@linux.vnet.ibm.com>
Date: Fri, 14 Oct 2022 10:32:43 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: Webui-vue: table multisort feature.
To: Nikolay Chegodaev <n.chegodaev@yadro.com>, openbmc@lists.ozlabs.org
References: <c0a6d816-5567-941a-b280-93acde717916@yadro.com>
Content-Language: en-US
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
In-Reply-To: <c0a6d816-5567-941a-b280-93acde717916@yadro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0yzCxgub52cJ_df-p627axu4qxYDYOAd
X-Proofpoint-GUID: 0yzCxgub52cJ_df-p627axu4qxYDYOAd
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-14_08,2022-10-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 adultscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 clxscore=1011
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210140086
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

On 10/11/2022 7:14 AM, Nikolay Chegodaev wrote:

> 
> It seems like that to continue to use the BoostrapVue table component(or b-tables for short) as part of OpenBMC WebUI-vue part, it needs multi sorting to be enabled
> on BoostrapVue table component, but this issue is not yet implemented as part of b-tables main package and remains in-progress.
> 
> As per author comments by this link https://github.com/bootstrap-vue/bootstrap-vue/issues/2068#issuecomment-629342977 it is still in the works.
> The same goes to the PR/Commit with this new feature in BoostrapVue table component repository https://github.com/bootstrap-vue/bootstrap-vue/pull/4242
> 
> Our recent changes involve the multi-sorting features to be already present, but there are none, unfortunately.

What tables are you attempting to add multi-sort to?

> 
> 1) If you have more information on when this feature will be available as part of the package, would you mind to share it?

We don't other than the issue you referenced. I posted on this issue.

> 
> 2) And afterwards the aforementioned commit would be merged for BoostrapVue table component, would it be possible to update the OpenBMC WebUI-vue upstream with this change and how long does it take?

Yes, it should be possible to update to the new version and it shouldn't 
take long after a bootstrap-vue release. Without a commit it is too hard 
to say an exact time.

> 
> In the meanwhile, I have an instructions to discuss the proposal to change the BoostrapVue table component to the vue-tables-2-premium globally for the whole WebUI-vue part of OpenBMC project.
> The manual for the component is here: https://matanya.gitbook.io/vue-tables-2/ it seems that the component is supporting the muritsorting feeature already and it works.

> Beyond the multi-sorting feature the vue-tables-2-premium can propose the following interesting features(pros) - most notable of which are the following:
> - There two modes included - direct request (using the Axios or Server-table) and existing data usage mode (from some Vuex/Pinia storage perhaps, Client-table),
>    which, in theory, may enable us to use Thunk-like (a technology from Redux to pre-load data to say it in a simple way) access to server, if we would need it some day
> - The component includes grouping feature named child rows, which would allow us to implement a table-within-table - in short, when you click on some row,
>    it will expand to some more rows or web-links hidden under the parent-row in a folder-like manner
> - It also includes Virtual pagination, which can load additional data while we scroll the table and allow us to clean the screen of page-list components
> 
> The component also several not so great features(cons):
> - It is written by one-man team, yes, it is written to best possible level of excellence, but there are still flaw, which does prevent us from accessing the headers of table columns in a unified way
>    like we do BoostrapVue table component - while on b-tables we do `<template #head(column_name)>` on vue-tables-2-premium we would need to do this on low level render way like so `<template #h__column_name>`
>    there also necessities to change some CSS Designs to make the vue-tables-2-premium table to look in the same way as BoostrapVue table component, but those are quite minor.


Sandeepa and I looked at this vue-tables-2 and our concern is the single 
contributor. We are also concerned about what else might break. Could 
you explain more why multi-sort is so needed?

> 
> 3) At the moment, we need to change BoostrapVue table component on one of the WebUI-vue page/views(where we desperately need it) to vue-tables-2-premium (or maybe some other component), temporarily until
> BoostrapVue table component will support multi-sorting feature as an integrate part, but if the community would approve the change from BoostrapVue table component to vue-tables-2-premium -
> vue-tables-2-premium could be changed on every page on constant basis (or until we get the multi-sorting support for the BoostrapVue table). So, what do you think?
> 

