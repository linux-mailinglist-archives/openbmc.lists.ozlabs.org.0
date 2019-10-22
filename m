Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8546FE08B9
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 18:24:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46yJkP4Fj0zDqM3
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 03:24:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46yJjd3dVJzDqLx
 for <openbmc@lists.ozlabs.org>; Wed, 23 Oct 2019 03:24:03 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Oct 2019 09:23:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,216,1569308400"; d="scan'208";a="196486528"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga008.fm.intel.com with ESMTP; 22 Oct 2019 09:23:53 -0700
Received: from [10.241.244.225] (unknown [10.241.244.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id D9F89580107;
 Tue, 22 Oct 2019 09:23:52 -0700 (PDT)
Subject: Re: How to storage SEL in firmware chip
To: =?UTF-8?B?5p2c5q2j6auY?= <dzg0528@163.com>
References: <4e1959db.ba35.16ded5385b2.Coremail.dzg0528@163.com>
 <21ab7685-b849-7cd7-7a14-4e77909baa76@linux.intel.com>
 <20c7f5c6.e7f7.16df2dcd37c.Coremail.dzg0528@163.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <f339a994-5fa3-1e78-9979-6e6c96206905@linux.intel.com>
Date: Tue, 22 Oct 2019 09:23:52 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20c7f5c6.e7f7.16df2dcd37c.Coremail.dzg0528@163.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 10/22/2019 2:47 AM, ¶ÅÕý¸ß wrote:
> Hi Jason,
> 
> 1,I merge your code #12951 to my openbmc project,and modify the 
> rsyslog.conf follow yours ,
> find the ipmi_sel will genated in the /var/log/,but it still can not 
> storage sel while bmc reboot.
> and ipmitool sel list show the log is cleared.and record new log after 
> bmc reboot.
You need to make /var/log persist to your non-volatile storage.  For our 
platforms, we mount /var/log as an overlay on our flash filesystem 
during init: 
https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mods/meta-common/recipes-phosphor/preinit-mounts/preinit-mounts/init.

> 
> 2,While I "mkdir log " in /run/initramfs/rw/cow/var/, the SEL will 
> storage the ipmi_sel,but sel list still show the new log and have no old 
> log.
> Are you know the where is user the "/run/initramfs/rw/cow/var/log" to 
> storage log ? and how to make the path be default?
The file is set in rsyslog.conf as /var/log.  If you didn't change that 
location, then /var/log on your system could be symlinked or possibly 
overlayed onto /run/initramfs/rw/cow/var/log.

> 
> Hope the information will help you!
> 
> thank you
> 
> dzg
