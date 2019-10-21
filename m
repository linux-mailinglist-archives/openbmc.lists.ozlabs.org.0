Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD6FDF86B
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 01:10:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46xsmy2CwhzDqKj
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 10:10:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46xsmF1QYzzDqKT
 for <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2019 10:09:48 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Oct 2019 16:09:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,325,1566889200"; d="scan'208";a="201504070"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga006.jf.intel.com with ESMTP; 21 Oct 2019 16:09:46 -0700
Received: from [10.241.244.242] (unknown [10.241.244.242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 7C5B558029D;
 Mon, 21 Oct 2019 16:09:46 -0700 (PDT)
Subject: Re: How to storage SEL in firmware chip
To: =?UTF-8?B?5p2c5q2j6auY?= <dzg0528@163.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <4e1959db.ba35.16ded5385b2.Coremail.dzg0528@163.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <21ab7685-b849-7cd7-7a14-4e77909baa76@linux.intel.com>
Date: Mon, 21 Oct 2019 16:09:46 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4e1959db.ba35.16ded5385b2.Coremail.dzg0528@163.com>
Content-Type: text/plain; charset=gbk; format=flowed
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



On 10/21/2019 12:58 AM, ¶ÅÕý¸ß wrote:
> Hi Jason,
> 
> I am new learner of openbmc,Can I ask you some questions ?
> While I scan openbmc in github,I found you add SEL(base on journal) feature.
> and I find a question,I reset BMC,the log can not store,
> I want to know,Can you storage the SEL in frimware chip ?

Hi dzg,

I'm adding the OpenBMC mailing list in case others have similar questions.

I ran into some issues when attempting to persist the journal to flash. 
You can see the details in my last update here: 
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-host-ipmid/+/12951.

To persist the SEL to flash, we use rsyslog to get SEL entries from the 
journal when they are logged and add them to a syslog file that is 
stored in the persistent /var/log folder.

Here is our rsyslog configuration: 
https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mods/meta-common/recipes-extended/rsyslog/rsyslog/rsyslog.conf.

Thanks,
-Jason

> 
> 
> thank you very much!
> dzg
> 
> 
