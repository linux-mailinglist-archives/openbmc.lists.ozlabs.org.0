Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DC64CF53D
	for <lists+openbmc@lfdr.de>; Mon,  7 Mar 2022 10:26:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KBtPs20z9z3bTD
	for <lists+openbmc@lfdr.de>; Mon,  7 Mar 2022 20:26:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bqbuovq0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=jiaqing.zhao@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bqbuovq0; dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KBtPQ2mFsz30FC
 for <openbmc@lists.ozlabs.org>; Mon,  7 Mar 2022 20:26:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646645179; x=1678181179;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=uxM/Z7oM5J7zq9XTV4FpsGTqsXEUpvoONfWEhVVrqrE=;
 b=bqbuovq0LdPrv3UIcf+Jx/PvVLFwfL6iqJbNVZvfzlwZ3d7TXxDqM0uX
 GQCPb7TZznJtwa9+Qwb4cs+xuhmXb3GwjfVd3tkAAAPJ1+3wmVsHCxbbH
 EYbk4lYUNJwO+EgAF08cjDqm+TATXfi8z3MipKreW1BnvaRrP+1pmYJOA
 mj++io8jrYz9uE/5TuMl378O2kHZ5VQ6tP15/rHuVAHuZMIdy9PJJ8sYW
 c9omy5Ij1H9L2jVvesG50BjVoBxsUw+nzBR+HgaPiJ4c9zPwTCU3xXURP
 T8y2UlfKmTmIgg+meKhpsAMZ18I2pA6DFiRX2ZYTIQWc76KOw50dd5Mps w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="234300949"
X-IronPort-AV: E=Sophos;i="5.90,161,1643702400"; d="scan'208";a="234300949"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 01:25:14 -0800
X-IronPort-AV: E=Sophos;i="5.90,161,1643702400"; d="scan'208";a="537043522"
Received: from jiaqingz-mobl.ccr.corp.intel.com (HELO [10.249.174.38])
 ([10.249.174.38])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 01:25:12 -0800
Message-ID: <75fd46be-06eb-8d6a-038e-c2f05d5d594c@linux.intel.com>
Date: Mon, 7 Mar 2022 17:25:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: service-config-manager performance issue
Content-Language: en-US
To: Joseph Reynolds <jrey@linux.ibm.com>, openbmc@lists.ozlabs.org
References: <a9db0239-a53a-9a6f-e167-335dc8e56872@linux.intel.com>
 <762e2959-ddb1-c075-a581-756cc4c9d791@linux.ibm.com>
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
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

Just had a discussion with the original author of that function, the 15s wait here is used to accommodate multiple config changes in single restart. If remove this wait, each service change will trigger systemd reload, which causes race condition and loss of data.

So for services controlled by service-config-manager, both get and set operations should call the manager's DBus. An example is intel-ipmi-oem (https://github.com/openbmc/intel-ipmi-oem/blob/master/src/bmccontrolservices.cpp). But in bmcweb, the get is implemented by calling systemd DBus directly,
so the properies in Redfish will not reflect the changes immediately. I will submit a patch to fix it. 

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
>> I've tested service-config-manager works as expected with the wait removed, and it only takes ~1s for the settings being applied, shall we remove it? And I'd like to ask what is the purpose of this wait to double confirm if removing it will bring any side effect.
>>
>> Thanks,
>> Jiaqing
> 
