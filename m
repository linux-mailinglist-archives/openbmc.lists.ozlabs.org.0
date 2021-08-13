Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD763EBEAD
	for <lists+openbmc@lfdr.de>; Sat, 14 Aug 2021 01:24:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gmflg57YDz3cR3
	for <lists+openbmc@lfdr.de>; Sat, 14 Aug 2021 09:24:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GmflL5szRz30Ls
 for <openbmc@lists.ozlabs.org>; Sat, 14 Aug 2021 09:24:13 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10075"; a="195913940"
X-IronPort-AV: E=Sophos;i="5.84,320,1620716400"; d="scan'208";a="195913940"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2021 16:23:08 -0700
X-IronPort-AV: E=Sophos;i="5.84,320,1620716400"; d="scan'208";a="677698182"
Received: from yoojae-mobl.amr.corp.intel.com (HELO [10.212.221.73])
 ([10.212.221.73])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2021 16:23:08 -0700
Subject: Re: AST2500 video engine for KVM trips BMC watchdog
To: Eddie James <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
References: <2a3bac9bb3c85791a0b2d988020917f7609a7097.camel@linux.ibm.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <762ddbcb-a47e-7eaa-24b3-9267e3d214b4@linux.intel.com>
Date: Fri, 13 Aug 2021 16:22:56 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <2a3bac9bb3c85791a0b2d988020917f7609a7097.camel@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Eddie,

On 8/13/2021 1:37 PM, Eddie James wrote:
> I'm trying to solve a problem when the screensaver on the host is
> activated. It seems to continually trigger the mode detection interrupt
> on the BMC. In combination with the user-space application continually
> trying to determine the resolution, it trips the BMC kernel watchdog
> and resets the system. Here are the logs I've captured:
> 
> [ 2049.076692] aspeed-video 1e700000.video: Resolution changed;
> resetting
> [ 2050.091133] aspeed-video 1e700000.video: Timed out; first mode
> detect
> [ 2051.121593] aspeed-video 1e700000.video: Timed out when stopping
> streaming
> [ 2052.121203] aspeed-video 1e700000.video: Timed out; first mode
> detect
> [ 2052.393164] aspeed-video 1e700000.video: Got resolution: 1024x768
> [ 2052.399561] aspeed-video 1e700000.video: Max compressed size: 80000
> [ 2053.343096] aspeed-video 1e700000.video: Resolution changed;
> resetting
> [ 2053.350151] aspeed-video 1e700000.video: Engine busy; don't start
> frame
> [ 2054.361159] aspeed-video 1e700000.video: Timed out; first mode
> detect
> [ 2054.609677] aspeed-video 1e700000.video: Got resolution: 1024x768
> [ 2054.615983] aspeed-video 1e700000.video: Max compressed size: 80000
> [ 2055.409583] aspeed-video 1e700000.video: Resolution changed;
> resetting
> [ 2055.432802] aspeed-video 1e700000.video: No signal; don't start
> frame
> [ 2056.421155] aspeed-video 1e700000.video: Timed out; first mode
> detect
> [ 2056.676215] aspeed-video 1e700000.video: Got resolution: 1024x768
> [ 2056.682516] aspeed-video 1e700000.video: Max compressed size: 80000
> [ 2057.459454] aspeed-video 1e700000.video: Resolution changed;
> resetting
> [ 2057.480919] aspeed-video 1e700000.video: No signal; don't start
> frame
> [ 2058.471187] aspeed-video 1e700000.video: Timed out; first mode
> detect
> [ 2058.726108] aspeed-video 1e700000.video: Got resolution: 1024x768
> [ 2058.732382] aspeed-video 1e700000.video: Max compressed size: 80000
> [ 2059.526704] aspeed-video 1e700000.video: Resolution changed;
> resetting
> [ 2059.548747] aspeed-video 1e700000.video: No signal; don't start
> frame
> [ 2060.541146] aspeed-video 1e700000.video: Timed out; first mode
> detect
> [ 2060.792620] aspeed-video 1e700000.video: Got resolution: 1024x768
> [ 2060.798801] aspeed-video 1e700000.video: Max compressed size: 80000
> [ 2061.592870] aspeed-video 1e700000.video: Resolution changed;
> resetting
> [ 2061.615523] aspeed-video 1e700000.video: No signal; don't start
> frame
> [ 2062.611126] aspeed-video 1e700000.video: Timed out; first mode
> detect
> [ 2062.859185] aspeed-video 1e700000.video: Got resolution: 1024x768
> [ 2062.865483] aspeed-video 1e700000.video: Max compressed size: 80000
> [ 2063.659056] aspeed-video 1e700000.video: Resolution changed;
> resetting
> [ 2063.680423] aspeed-video 1e700000.video: No signal; don't start
> frame
> [ 2064.671148] aspeed-video 1e700000.video: Timed out; first mode
> detect
> [ 2064.925696] aspeed-video 1e700000.video: Got resolution: 1024x768
> [ 2064.931949] aspeed-video 1e700000.video: Max compressed size: 80000
> [ 2065.708903] aspeed-video 1e700000.video: Resolution changed;
> resetting
> [ 2065.716196] aspeed-video 1e700000.video: Engine busy; don't start
> frame
> [ 2066.721161] aspeed-video 1e700000.video: Timed out; first mode
> detect
> [ 2066.975563] aspeed-video 1e700000.video: Got resolution: 1024x768
> [ 2066.981842] aspeed-video 1e700000.video: Max compressed size: 80000
> [ 2067.758808] aspeed-video 1e700000.video: Resolution changed;
> resetting
> [ 2067.766511] aspeed-video 1e700000.video: Engine busy; don't start
> frame
> [ 2068.771128] aspeed-video 1e700000.video: Timed out; first mode
> detect
> [ 2069.025462] aspeed-video 1e700000.video: Got resolution: 1024x768
> [ 2069.031803] aspeed-video 1e700000.video: Max compressed size: 80000
> [ 2069.808665] aspeed-video 1e700000.video: Resolution changed;
> resetting
> 
> Jae, or anyone else, do you have any ideas to solve this? I'm surprised
> it's enough to stop pinging the watchdog, but that is what happens...

Does it mean that this issue blocks watchdog feeding in BMC kernel?
Can you please share more detail information about the host OS, current
resolution, reproduction steps and etc.?

Thanks,
Jae

> 
> Thanks,
> Eddie
> 
