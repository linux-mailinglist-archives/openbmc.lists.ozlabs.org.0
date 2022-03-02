Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD2E4C9DAB
	for <lists+openbmc@lfdr.de>; Wed,  2 Mar 2022 07:17:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7kRp6VyHz3bcy
	for <lists+openbmc@lfdr.de>; Wed,  2 Mar 2022 17:17:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n4R4GJ9b;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=jiaqing.zhao@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=n4R4GJ9b; dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7kRN2cyKz3bT0
 for <openbmc@lists.ozlabs.org>; Wed,  2 Mar 2022 17:17:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646201825; x=1677737825;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=m0iFMuCjOvqLpxeAgCbE/z5+KLE1M97wDiXhLfAwSCE=;
 b=n4R4GJ9bwIbBes5Gl7OMu0kKEmpKoJO3zR+L5XfKzKRp8D1id2DjX5ba
 HfXjFF0IYhI3TD8kb2bKuN5VVe0mtpRqZVy2pJ6DNsHufEyPnh47h0p9Q
 ZmcaP65nBNHySAIKqkIyGtPW1sntKx78qz+UPFl0cSo2a4MIazHokYTp8
 /QkMh9QAKbLmzTnRamoUnUdL9GYVnCrjzYUQIsUj6ZNU8qlVrFFQxw9Hs
 rUftQl3IevxggpFPmArVMBPBMkR3WYHqwiHc0sQ5arMSwItHI+1aaU3kT
 jvi94QX2qo0pxplKcMbUYVMtCrpkc+50EdbJHj1SusKqtUhvdwsjZHOBY g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="277992457"
X-IronPort-AV: E=Sophos;i="5.90,148,1643702400"; d="scan'208";a="277992457"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 22:16:00 -0800
X-IronPort-AV: E=Sophos;i="5.90,148,1643702400"; d="scan'208";a="709382305"
Received: from jiaqingz-mobl.ccr.corp.intel.com (HELO [10.255.31.184])
 ([10.255.31.184])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 22:15:58 -0800
Message-ID: <f3e5dd3d-65a0-4e11-2dab-6e4bc373f72a@linux.intel.com>
Date: Wed, 2 Mar 2022 14:15:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: Checking for network online
Content-Language: en-US
To: Patrick Williams <patrick@stwcx.xyz>,
 Johnathan Mantey <johnathanx.mantey@intel.com>
References: <af9a0274-2fb3-8195-a02b-c1d5ecf4848e@intel.com>
 <bb39999e8f9638da3d29b865d85fb54d51da9797.camel@codeconstruct.com.au>
 <CAGm54UE1bFeLF9PHUuj__E0m_+CxLRtA4Htrjm4y5M3SnbOhLA@mail.gmail.com>
 <37a29642-788c-b966-3b58-214c3d44c8f4@intel.com>
 <64727f8e-cca3-b04d-e4cf-709ceb60f37f@linux.intel.com>
 <YhY7Kxgg6ew0HdUR@heinlein>
 <112c8819-24bc-2a24-45a3-9c919088f43a@linux.intel.com>
 <3f4f0cc0-7967-66f9-a085-a6b2ae978a01@intel.com> <Yhfl589tw2oeLJ9C@heinlein>
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
In-Reply-To: <Yhfl589tw2oeLJ9C@heinlein>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Jeremy Kerr <jk@codeconstruct.com.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Lei Yu <yulei.sh@bytedance.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 2022-02-25 04:09, Patrick Williams wrote:
> On Wed, Feb 23, 2022 at 12:04:12PM -0800, Johnathan Mantey wrote:
>> On 2/23/22 09:44, Jiaqing Zhao wrote:
>>> On 2022-02-23 21:48, Patrick Williams wrote:
>>>> On Wed, Feb 23, 2022 at 10:09:19AM +0800, Jiaqing Zhao wrote:
> 
>> There may be openbmc powered servers that do use the distributed logging 
>> provided by rsyslogd. If there are then globally removing network-online 
>> from the rsyslog service file is undesirable. I consider the same to be 
>> true of assigning a default RequiredForOnline=false.
>>
>> Based on the above, it's my opinion this is a vendor based decision for 
>> how to configure rsyslog/systemd-networkd-wait-online.
> 
> I agree we shouldn't enable this globally, but that doesn't mean we can't add
> a simple PKGCONFIG that allows it to be enabled/disabled as needed.  That way
> we only have the single `PKGCONFIG:append` line in vendor layers and vendors
> that have a problem with it can leave it same as upstream.

I am also in favor of this solution, let the vendor decide whether rsyslog depends on network-online.target or not with the PKGCONFIG option.
