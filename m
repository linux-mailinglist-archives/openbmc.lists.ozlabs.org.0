Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9972A124729
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 13:44:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dF8K5hWRzDqgX
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 23:44:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dF5y5qKpzDqPw
 for <openbmc@lists.ozlabs.org>; Wed, 18 Dec 2019 23:42:45 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2019 04:42:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,329,1571727600"; d="scan'208";a="205831916"
Received: from unknown (HELO [10.224.25.61]) ([10.224.25.61])
 by orsmga007.jf.intel.com with ESMTP; 18 Dec 2019 04:42:39 -0800
Subject: =?UTF-8?Q?Re=3a_Re=ef=bc=9a_How_can_I_add_a_user_for_openbmc_and_re?=
 =?UTF-8?Q?move_the_default_root_user=3f?=
To: Gunnar Mills <gmills@linux.vnet.ibm.com>, =?UTF-8?B?5Y2X6YeO44Og44Or44K3?=
 =?UTF-8?B?44Ko44Op44K0?= <1181052146@qq.com>,
 openbmc <openbmc@lists.ozlabs.org>
References: <tencent_BBCBA6D64E821CDC3E0AD497B3C0FD77E509@qq.com>
 <4b32b6d0-da99-62c1-52f2-c2a7d4221dec@linux.intel.com>
 <tencent_74FD2ECBC3FF44DE65AAF884C881E0C34D05@qq.com>
 <a0e57fe5-e616-a0c2-a07a-a58407bebdfd@linux.intel.com>
 <7ff949ae-3292-09cf-071b-99385232e637@linux.vnet.ibm.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <57829175-6ea3-8ed0-7e63-a36aa919f035@linux.intel.com>
Date: Wed, 18 Dec 2019 18:12:38 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <7ff949ae-3292-09cf-071b-99385232e637@linux.vnet.ibm.com>
Content-Type: text/plain; charset=gb18030; format=flowed
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Gunnar,

Yes root user can't be deleted (basically uid 0), can't be deleted. The 
method works for other users only, like in case Liu, he wants to delete 
the newly created user.

Regards,

Richard


On 12/18/2019 2:38 AM, Gunnar Mills wrote:
>
> On 12/16/2019 7:44 AM, Thomaiyar, Richard Marian wrote:
>>
>> Delete interface is exposed as part of the user object itself. Sample 
>> busctl command to do the delete of an user under phosphor-user-manager
>>
>> busctl call xyz.openbmc_project.User.Manager 
>> /xyz/openbmc_project/user/<username> 
>> xyz.openbmc_project.Object.Delete Delete
>>
>>
>
> I am missing something here.. This does not work for me. I didn't 
> think we allowed removing the root user, which is why it is disabled 
> on the WebUI? If we do allow deleting the root user, should this be 
> allowed from the WebUI?
>
> When sshed as root:
> busctl call xyz.openbmc_project.User.Manager 
> /xyz/openbmc_project/user/root xyz.openbmc_project.Object.Delete Delete
> Call failed: The operation failed internally.
>
> In the journal I see
> Dec 17 20:57:56 w37 phosphor-user-manager[220]: userdel: user root is 
> currently used by process 1
> Dec 17 20:57:56 w37 phosphor-user-manager[220]: The operation failed 
> internally.
> Dec 17 20:57:56 w37 phosphor-user-manager[220]: User delete failed
> Dec 17 20:57:56 w37 phosphor-user-manager[220]: The operation failed 
> internally.
>
>
> When sshed as an "Administrator" role account,  with the same call:
> Call failed: Access denied
>
> NOTE: As an "Administrator" role I can't delete a user using "busctl 
> call" only from the Redfish/WebUI, am I able to.
>
> Thanks!
> Gunnar
