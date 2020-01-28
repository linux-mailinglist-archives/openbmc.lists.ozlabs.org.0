Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD90114BF9C
	for <lists+openbmc@lfdr.de>; Tue, 28 Jan 2020 19:25:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486Zmr3NwTzDqNB
	for <lists+openbmc@lfdr.de>; Wed, 29 Jan 2020 05:25:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=aleksandr.v.tereschenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486Zlz5Vs2zDqLf
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jan 2020 05:25:00 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jan 2020 10:24:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,374,1574150400"; d="scan'208";a="246801354"
Received: from avteresc-mobl1.ger.corp.intel.com (HELO [10.251.87.179])
 ([10.251.87.179])
 by orsmga002.jf.intel.com with ESMTP; 28 Jan 2020 10:24:56 -0800
Subject: Re: bmcweb and certificate chains [WAS: Security working group
 meeting 2020-01-22]
To: openbmc@lists.ozlabs.org
References: <f62056a8-ddc9-71ae-620f-b9ac45f3c86a@linux.ibm.com>
 <94fa654c-bfa6-c834-6b18-8867aee49c8f@linux.intel.com>
 <b6d4134e-702d-71ab-4a5d-7d3bd3e0eae3@linux.ibm.com>
From: Alexander Tereschenko <aleksandr.v.tereschenko@linux.intel.com>
Message-ID: <b8b0c708-a51b-b36a-f860-46489d128bc9@linux.intel.com>
Date: Tue, 28 Jan 2020 19:24:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <b6d4134e-702d-71ab-4a5d-7d3bd3e0eae3@linux.ibm.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 27-Jan-20 17:03, Joseph Reynolds wrote:
> Thank you for finding that.  I think we want to add a function to 
> BMCWeb to be able to handle certificate chains.  Would we need to 
> enhance the REST APIs [4] to upload server certificates as part of 
> this work?
>
> [4]: 
> https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/xyz/openbmc_project/Certs
>
Yes, I think that'd be required, otherwise the only way the BMC admin 
could provide that cert chain file would be via SSH, which of course 
will not work for everyone.
