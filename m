Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BE42EC5F9
	for <lists+openbmc@lfdr.de>; Wed,  6 Jan 2021 23:04:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DB3Kw3klDzDqmF
	for <lists+openbmc@lfdr.de>; Thu,  7 Jan 2021 09:04:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DB3K30gb0zDqSk
 for <openbmc@lists.ozlabs.org>; Thu,  7 Jan 2021 09:03:18 +1100 (AEDT)
IronPort-SDR: KWfwQj+byR71InzCItq5yBqVx+pFZyXBMh42gjRhVCd1Dw3ml5zL4KvfN8VZH5wIkrFDHWMlDU
 wdEnQUG7HySg==
X-IronPort-AV: E=McAfee;i="6000,8403,9856"; a="195893488"
X-IronPort-AV: E=Sophos;i="5.79,328,1602572400"; d="scan'208";a="195893488"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2021 14:03:15 -0800
IronPort-SDR: mPLlevQgVfsbUnU3l5jMlIHxtYk2TPdYy2n7WX74eyNGBvxQT+1xcRAqi59aEA/Ji5ZkAwZrc5
 LoD6aWjWEeog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,328,1602572400"; d="scan'208";a="346789666"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga003.jf.intel.com with ESMTP; 06 Jan 2021 14:03:14 -0800
Received: from [10.212.242.96] (jmbills-MOBL.amr.corp.intel.com
 [10.212.242.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id B6FF85805A6
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jan 2021 14:03:14 -0800 (PST)
Subject: Re: .overlay directory
To: openbmc@lists.ozlabs.org
References: <5c7037de7f05461d82e9d5f47bb52353@TWN-EXCHMB-13.phoenix.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <31323118-18fa-c1c9-ea45-b4af8433d193@linux.intel.com>
Date: Wed, 6 Jan 2021 14:03:14 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5c7037de7f05461d82e9d5f47bb52353@TWN-EXCHMB-13.phoenix.com>
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



On 1/5/2021 8:01 PM, Leo Cheng wrote:
> Hi Teams,
> 
> I’m engineer of developing openbmc.
> 
> I have the issue of restore-defaults: targeted_clean and I find the 
> targeted_clean function in the init script which is from 
> meta-openbmc-mods\meta-common\recipes-phosphor\preinit-mounts\preinit-mounts
> 
> I can’t find /tmp/.rwfs/.overlay in BMC.
> 
> Check Intel openbmc, /tmp/.rwfs/.overlay exists in BMC.
> 
> How to add it? Do you have any idea?
Hi Leo,

In Intel-BMC, we have a service named nv-sync that is responsible for 
copying the overlay contents from the tmpfs into the non-volatile copy. 
I think that may be what you are looking for.

https://github.com/Intel-BMC/openbmc/tree/intel/meta-openbmc-mods/meta-common/recipes-core/nv-sync

Thanks,
-Jason
> 
> Thanks.
> 
> Best Regards,
> 
> Leo Cheng
> 
