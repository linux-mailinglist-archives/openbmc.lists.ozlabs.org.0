Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 367B1E50B2
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 18:02:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47085247LvzDqDS
	for <lists+openbmc@lfdr.de>; Sat, 26 Oct 2019 03:02:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47082K6DBnzDqt3
 for <openbmc@lists.ozlabs.org>; Sat, 26 Oct 2019 02:59:52 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Oct 2019 08:59:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,229,1569308400"; d="scan'208";a="192576954"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga008.jf.intel.com with ESMTP; 25 Oct 2019 08:59:49 -0700
Received: from [10.241.244.33] (unknown [10.241.244.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id C200A580107;
 Fri, 25 Oct 2019 08:59:49 -0700 (PDT)
Subject: Re: openbmc power-control can't work OK.
To: =?UTF-8?B?6Zi/5qGC?= <guilin1985@126.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <78e5fc47.6f45.16e0259a229.Coremail.guilin1985@126.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <3170cec0-1da7-d201-d8a5-92058682bb68@linux.intel.com>
Date: Fri, 25 Oct 2019 08:59:49 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <78e5fc47.6f45.16e0259a229.Coremail.guilin1985@126.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

I'm copying the mailing list in case there are others who have similar 
questions.

On 10/25/2019 2:57 AM, 阿桂 wrote:
>     Hi, jason
>           Could you help me, please ? My board is not a evb board, but 
> it is x86 platform. So i build openbmc *meta-s2600wf*(commit 
> ID c549f3a7f5496ec3b54ed65c8b4d8351db10995e) instead，which use 
> x86-power-control version f61ca6fdcc52beba485e014b5fad38a9e9a555ad 
> <https://github.com/openbmc/x86-power-control/commit/f61ca6fdcc52beba485e014b5fad38a9e9a555ad>. 
> But when i use "ipmitools chassis power status" commond to get host 
> status at my board, it point out "Get Chassis Power Status failed: 
> Unspecified error", journalctl -f command refer to "ipmid[279]: Failed 
> to fetch ACBoot property, ipmid[279]: Failed to fetch RestartCause 
> property". It seems there have no property in dbus.  Where is the dbus 
> property ACBoot and RestartCause defined?I'm puzzled about this 
> /situation. Could you///give me some suggestions?

This is because the IPMI chassis power status command gets the power 
status by calling the IPMI chassis status command which requires a lot 
of other information such as the restart cause and AC fail status to 
return successfully.

The ACBoot property is provided by a small script that we run to get the 
reset reason from uboot.  You can find it here: 
https://github.com/Intel-BMC/openbmc/tree/intel/meta-openbmc-mods/meta-common/recipes-core/ac-boot-check.

The RestartCause property recently moved to x86-power-control and is 
being synced up in this review: 
https://gerrit.openbmc-project.xyz/c/openbmc/x86-power-control/+/26491.

Thanks,
-Jason

> /         Thanks a lot./
> 
> 
