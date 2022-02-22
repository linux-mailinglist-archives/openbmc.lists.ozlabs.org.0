Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6D94BF01F
	for <lists+openbmc@lfdr.de>; Tue, 22 Feb 2022 05:08:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2lyD2cBCz3bSv
	for <lists+openbmc@lfdr.de>; Tue, 22 Feb 2022 15:08:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OPybWhTe;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=jiaqing.zhao@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=OPybWhTe; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2lxm5bmlz2yfh
 for <openbmc@lists.ozlabs.org>; Tue, 22 Feb 2022 15:07:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645502861; x=1677038861;
 h=message-id:date:mime-version:from:subject:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=viLTejMYH6z1CKZCw3NsVI6f4zILoDp2r0ITy4avKHY=;
 b=OPybWhTe+02HcfaK60O+8PZv/ek0xYHMqusw3OmJlmkH9UG04tk426rJ
 kwpSB2fsCaW8hr19S0cantOQHsSBZc+wLk+LYh/fFT7iDwd9Mo+36yr5H
 tPtEEjNsmHainT3sWD+HDo3V9BtU8FRUwwo0XdKoOhH2bXgQz+dRycDvz
 tQgIT693zR0+qwibtModvXzL5dYHCKITon1f72jTwO5+hSLW8Ih0k50A0
 wAvwLD+pjguC+YEVwzGGzwn7XuEJ8MAIufLLBfySwBSV8u4i/9dkUsfg3
 6yBZXMWxh+Aqcnk5HKZKJpIo25ngbNu/xP73s2cDzIBkVwzB/nH51n6s+ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="251790903"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="251790903"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 20:06:36 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="638762380"
Received: from jiaqingz-mobl.ccr.corp.intel.com (HELO [10.249.168.87])
 ([10.249.168.87])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 20:06:34 -0800
Message-ID: <72521bb0-7a92-e80a-adf9-72edd1271e50@linux.intel.com>
Date: Tue, 22 Feb 2022 12:06:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Subject: Re: service-config-manager performance issue
To: Joseph Reynolds <jrey@linux.ibm.com>, openbmc@lists.ozlabs.org
References: <a9db0239-a53a-9a6f-e167-335dc8e56872@linux.intel.com>
 <762e2959-ddb1-c075-a581-756cc4c9d791@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <762e2959-ddb1-c075-a581-756cc4c9d791@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: apparao.puli@linux.intel.com, richard.marian.thomaiyar@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2022-02-22 04:00, Joseph Reynolds wrote:
> On 2/21/22 6:41 AM, Jiaqing Zhao wrote:
>> Hi, all
>>
>> When updating service status with service-config-manager, it always takes ~15s for the new status to be applied, which is much longer than it should be.
>>
>> By inspecting the code, I found there is a 15s wait before updating service status in ServiceConfig::startServiceRestartTimer(). (https://github.com/openbmc/service-config-manager/blob/f2744893b77b9dd8903bb13113f4c3ef62c18f04/src/srvcfg_manager.cpp#L382)
>>
>> The 15s-wait is added at first in commit 0084047 (https://github.com/openbmc/service-config-manager/commit/0084047d008fd0ac36f09a232f67ff2fc5314b53).
> 
> Here at IBM we are seeing the same thing.  It looks like that code (https://github.com/openbmc/service-config-manager/blob/master/src/srvcfg_manager.cpp - ServiceConfig::startServiceRestartTimer) was part of the initial commit.  I wonder if the problem is caused by a bug in that code.  (But I am not familiar with the code, and I don't have time to look at it now.)  Is the intention to reload the systemd units but give up after 15 seconds?
> 
> Joseph
>

I think the author intends to execute systemd operations with a 15s timeout. But seems he misused boost::asio::steady_timer. The boost doc (https://www.boost.org/doc/libs/1_78_0/doc/html/boost_asio/reference/steady_timer.html) says the function in async_wait() is called when the timer has expired. So the code in service-config-manager actually calls the apply config function after asynchronously waited for 15s.

I cannot find out the proper a way to set a 15s time limit for the operation. Maybe we can set a max wait rounds of executing a systemd job in systemdUnitAction()? Currently it waits infinitely in ~20ms interval.

Jiaqing

>> I've tested service-config-manager works as expected with the wait removed, and it only takes ~1s for the settings being applied, shall we remove it? And I'd like to ask what is the purpose of this wait to double confirm if removing it will bring any side effect.
>>
>> Thanks,
>> Jiaqing
> 
