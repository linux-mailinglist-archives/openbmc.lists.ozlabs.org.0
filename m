Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B1126C537
	for <lists+openbmc@lfdr.de>; Wed, 16 Sep 2020 18:37:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bs5NK30gHzDqXt
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 02:37:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bs5Hy0mJxzDqb0
 for <openbmc@lists.ozlabs.org>; Thu, 17 Sep 2020 02:33:17 +1000 (AEST)
IronPort-SDR: /XD3bMX/DDznLZN2F5acLi8Rvf4S21Ntlcpu2TeP/h/5gRcVYrtLAnCg+ujfR2qZMcpoVRun9Q
 GmFS9OqsN9eg==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="177584683"
X-IronPort-AV: E=Sophos;i="5.76,433,1592895600"; d="scan'208";a="177584683"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2020 09:33:11 -0700
IronPort-SDR: aiHf6DppO5H36a00EDx+hFKsq+tklSbyPD5Z29peDLAs48j4ZEca+bfl0cnquTCtVYD3FcH8GB
 bgRUN4f6ukyg==
X-IronPort-AV: E=Sophos;i="5.76,433,1592895600"; d="scan'208";a="319894763"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.212.68.202])
 ([10.212.68.202])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2020 09:33:10 -0700
Subject: Re: Using bios-settings-mgr for setting hypervisor network attributes
To: Ed Tanous <ed@tanous.net>, manoj kiran <manojkiran.eda@gmail.com>
References: <C9C88F03-4715-444E-9B1A-3834995458EA@getmailspring.com>
 <CACWQX83KnXz-+WB1xgMP4MAPfDGare_ZM=SAWrWzohhT--Jwrg@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <f0a22eaa-5b24-d52c-11bf-a4d61b8a20c7@linux.intel.com>
Date: Wed, 16 Sep 2020 09:33:07 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CACWQX83KnXz-+WB1xgMP4MAPfDGare_ZM=SAWrWzohhT--Jwrg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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

On 9/16/2020 9:26 AM, Ed Tanous wrote:
> 
> 
> On Wed, Sep 16, 2020 at 7:47 AM manoj kiran <manojkiran.eda@gmail.com 
> <mailto:manojkiran.eda@gmail.com>> wrote:
> 
>     Hi Ed & James,
> 
>     Till now IBM was using phosphor-settings infrastructure as back-end
>     and uses Ethernet Schema for Hypervisor computer
>     system(hypervisor_ethernet.hpp) for setting the IP address of
>     hypervisor. And now we are planning to leverage the capabilities of
>     bios-settings-mgr(backend) as well to set the hypervisor attributes.
> 
>     do you see any concerns here ?
> 
>     Thanks,
>     Manoj
>     Sent from Mailspring
> 
> 
> None that I can think of (although I don't know much about 
> bios-settings-mgr).  Holding all the host data in one daemon seems like 
> a better way to do it than putting it in settings.

Agree, as long as we use the mapper to look up interfaces, should be 
transparent.
