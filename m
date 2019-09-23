Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8B5BBA9A
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 19:36:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cWhT5TXVzDqLd
	for <lists+openbmc@lfdr.de>; Tue, 24 Sep 2019 03:36:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cWgh5MjPzDqJS
 for <openbmc@lists.ozlabs.org>; Tue, 24 Sep 2019 03:35:43 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Sep 2019 10:35:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,541,1559545200"; d="scan'208";a="195433759"
Received: from linux.intel.com ([10.54.29.200])
 by FMSMGA003.fm.intel.com with ESMTP; 23 Sep 2019 10:35:41 -0700
Received: from [10.241.245.57] (unknown [10.241.245.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 239955803E4
 for <openbmc@lists.ozlabs.org>; Mon, 23 Sep 2019 10:35:41 -0700 (PDT)
Subject: Re: IPMI SEL Event ID
To: openbmc@lists.ozlabs.org
References: <1082e383cba94367945d14175a0d787b@lenovo.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <38fd5723-9e41-1415-c64b-738981c70f72@linux.intel.com>
Date: Mon, 23 Sep 2019 10:35:40 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1082e383cba94367945d14175a0d787b@lenovo.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 9/22/2019 5:19 AM, Yonghui YH21 Liu wrote:
> HI All,
> 
>           I find the new SEL event ID is not from base number(1) after I 
> run “ipmitool sel clear” command.
> 
>           Is it the OpenBMC default design rule ? If not, any plan to 
> fix the issue?

If you are using phosphor-sel-logger, it is a bug.  The fix for it is up 
for review here: 
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-sel-logger/+/24843

Thanks!
-Jason
> 
> Thanks
> 
