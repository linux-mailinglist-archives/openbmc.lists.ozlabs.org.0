Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DFBC2933
	for <lists+openbmc@lfdr.de>; Mon, 30 Sep 2019 23:58:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46hx9Q1wv8zDqQj
	for <lists+openbmc@lfdr.de>; Tue,  1 Oct 2019 07:58:18 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46hx8s1qXXzDqPT
 for <openbmc@lists.ozlabs.org>; Tue,  1 Oct 2019 07:57:47 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Sep 2019 14:57:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,568,1559545200"; d="scan'208";a="191269269"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga007.fm.intel.com with ESMTP; 30 Sep 2019 14:57:44 -0700
Received: from [10.241.244.243] (unknown [10.241.244.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 325EF5803DA;
 Mon, 30 Sep 2019 14:57:44 -0700 (PDT)
Subject: Re: OpenBMC add sel in intel platform
To: =?UTF-8?B?6K6w5b+G?= <2310614540@qq.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <tencent_9D5297A8AD27EE4DE66936B7F83A60798008@qq.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <c9845af4-4c26-6eae-fcb0-f8318bf9e844@linux.intel.com>
Date: Mon, 30 Sep 2019 14:57:44 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <tencent_9D5297A8AD27EE4DE66936B7F83A60798008@qq.com>
Content-Type: text/plain; charset=gb18030; format=flowed
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

Adding the mailing list in case others have similar questions.

On 9/29/2019 11:54 PM, 记忆 wrote:
> hi jmbills,
> 
>      How to use OpenBMC add sel in intel platform .Could you give me 
> some help?
Hi,

If you have built with intel-ipmi-oem then we route all "Add SEL" 
commands to the Redfish log.
https://github.com/openbmc/intel-ipmi-oem/blob/master/src/storagecommands.cpp#L929

If you need to add an IPMI SEL entry, there are a couple you could do that:
1. Trigger a threshold sensor event so the phosphor-sel-logger will add 
an IPMI SEL.
2. Manually add a journal entry that has the IPMI SEL MESSAGE_ID:
MESSAGE_ID == "b370836ccf2f4850ac5bee185b77893a".

Thanks,
-Jason
> best wishes
> thanks!
