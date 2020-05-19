Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E1D1D9B07
	for <lists+openbmc@lfdr.de>; Tue, 19 May 2020 17:22:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49RKPK73qyzDqw0
	for <lists+openbmc@lfdr.de>; Wed, 20 May 2020 01:22:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RKNP20NGzDqvt
 for <openbmc@lists.ozlabs.org>; Wed, 20 May 2020 01:21:23 +1000 (AEST)
IronPort-SDR: 6LFpuvTehzgA/4krqC0/GxfFLwQvr8H044Kq5SnKBWaTuDD2ohZxW7AJQW/pazmM20s2tzq9W7
 rpdyBKvjgaAw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2020 08:21:20 -0700
IronPort-SDR: kaYzQzzwtAEGm/yjpRTqhIcdw5fiYWYmQWS9SoefBCfy5Dyg3XCYWk+StFQQJJbdRL1kGqEwBZ
 FHA+tahrQ3LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,410,1583222400"; d="scan'208";a="466160953"
Received: from rthomaiy-mobl2.gar.corp.intel.com (HELO [10.252.67.220])
 ([10.252.67.220])
 by fmsmga006.fm.intel.com with ESMTP; 19 May 2020 08:21:18 -0700
Subject: Re: LDAP authentication is not working
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
References: <b242dd63-3fb2-6c16-bbd2-3797afb23a8e@linux.vnet.ibm.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <9e6d226f-fb2a-4d1e-f68f-826d958e85ec@linux.intel.com>
Date: Tue, 19 May 2020 20:51:17 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <b242dd63-3fb2-6c16-bbd2-3797afb23a8e@linux.vnet.ibm.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Agree. As for LDAP user we defined privilege related mapping only and 
not group based authentication restriction. I think adding group based 
authentication for ldap users immediately, is not good option, as it 
must be done with agreement from everyone.

Quick solution is to skip the pam_succeed_if check if it is local user 
using pam_localuser module. i.e. using user_unknown condition to skip 
the pam_succeed_if, we can skip the group check for ldap users, and 
still continue for local users.

Note: I am OK, if you want to revert the fix immediately, i can roll out 
the fix this weekend after testing.

Regards,

Richard


On 5/19/2020 3:35 PM, Ratan Gupta wrote:
> in the LDAP server and put the ldap user under the newly created 
> "redfish" group
> but that didn't help as same group is listed in both places(Local,LDAP)
>
> As I explained above local database will get priortize over LDAP
>
> Hence there would be failure. Now we have following option
>
> Priortize LDAP over Local if LDAP is enabled but in that case the same 
> problem will occur for the local user.
>
> We have upstream tagging is planned for this week and with the commit 
> below LDAP is broken
>
> (https://github.com/openbmc/bmcweb/commit/cd17b26c893ba9dd1dcb0d56d725f2892c57e125.) 
>
>
> Should we revert it or do you have any plans?
>
> Please let me know your thoughts. 
