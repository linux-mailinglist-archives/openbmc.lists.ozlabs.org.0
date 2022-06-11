Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9FA547383
	for <lists+openbmc@lfdr.de>; Sat, 11 Jun 2022 11:59:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKtbk38vRz3cMq
	for <lists+openbmc@lfdr.de>; Sat, 11 Jun 2022 19:59:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mPAMsdsC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.115; helo=mga14.intel.com; envelope-from=jiaqing.zhao@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mPAMsdsC;
	dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKtZl3bZCz3c9K
	for <openbmc@lists.ozlabs.org>; Sat, 11 Jun 2022 19:58:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654941535; x=1686477535;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=LoUQFEJVS8iKP4KHv45pEyco3cBp3wRIOlEANLpEqfM=;
  b=mPAMsdsC6gXxpTtFkFm2vIvb+jr8uY6c0CWXs21LeZNZJMPqSJ2H/8xN
   DhcNpQpfnrhcO2L8Ih1zUsW+dQhGaHRciz0vFC7K1t86K4iiM7GxeiOt9
   WNcmxGsD/Pt7A/CWZwUsRnRz/oZ/dP6ZNIQJlILy+varPs0vIiHQlI5WS
   c3OOuSYOzsr5O6QxCTJa8zebPh+AEf3/gHSJYnXzDtdF0rM6vZ7RrtRnC
   gjqhZPxGKQSxmm43UpOFgS3xfhq2UHe12aOKA5hLAEEmzORR2PNhYR6+M
   KqMAVsGpczb3iUCxnEEYcZdUZT8joI769d0r0nR5mJhhS4m3M/5stYLvf
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="277900138"
X-IronPort-AV: E=Sophos;i="5.91,293,1647327600"; 
   d="scan'208";a="277900138"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2022 02:58:51 -0700
X-IronPort-AV: E=Sophos;i="5.91,293,1647327600"; 
   d="scan'208";a="638638184"
Received: from jiaqingz-mobl.ccr.corp.intel.com (HELO [10.255.31.17]) ([10.255.31.17])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2022 02:58:49 -0700
Message-ID: <bf66a840-594a-d90a-2ca6-595e95c09514@linux.intel.com>
Date: Sat, 11 Jun 2022 17:58:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 0/6] Configurable VLAN mode for NCSI driver
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>
References: <20220610165940.2326777-1-jiaqing.zhao@linux.intel.com>
 <20220610130903.0386c0d9@kernel.org>
 <3c9fa928-f416-3526-be23-12644d18db3b@linux.intel.com>
 <20220610214506.74c3f89c@kernel.org>
 <6f067302-74a8-702f-bf38-4477a805a528@linux.intel.com>
 <20220610224407.4e58dc5a@kernel.org>
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
In-Reply-To: <20220610224407.4e58dc5a@kernel.org>
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
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Samuel Mendoza-Jonas <sam@mendozajonas.com>, "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 2022-06-11 13:44, Jakub Kicinski wrote:
> On Sat, 11 Jun 2022 13:18:51 +0800 Jiaqing Zhao wrote:
>> All ncsi devices uses the same driver as they uses same command set,
>> so the driver doesn't know what modes are supported. And in current
>> driver, the vlan related parameters are configured when registering
>> the device, adding an ncsi-netlink command to do so seems to be
>> unsuitable.
> 
> Maybe you could draw a diagram? NC-SI is a bit confusing.

Yes I admit NC-SI is confusing as its design is not as straightforward
as the MAC-PHY structure. In NC-SI, there are two macs like below.

        Packets + NCSI commands                        Packets
    MAC-------------------------External controller MAC---------PHY

The NCSI commands are used to set the behavior of the External controller
MAC, like it's MAC address filter, VLAN filters. Those filtered packets
will be transferred back to the MAC.

Unlike PHY has standard registers to determine its model and capabilities,
NC-SI seems does not have such way.
>> And adding a netlink command requires extra application in userspace
>> to switch the mode. In my opinion, it would be more user-friendly to
>> make it usable on boot.
> 
> Unfortunately convenience is not reason to start adding system config
> into DT.

Currently there is already a DT config "use-ncsi" is used to choose using
MDIO PHY or NCSI stack in the MAC driver with NCSI support like ftgmac100.
That's why I choose adding another DT option here.

>> Netdev also does not work as the ncsi device itself does not have
>> its own netdev, the netdev comes from the mac device. For different
>> vlan modes, the netdev feature set of its parent mac device are the
>> same.
> 
> You say that, yet the command handling already takes into account the
> VLAN list:
> 
> 	if (list_empty(&ndp->vlan_vids)) {
> 
> which come from the MAC netdev. What's wrong with setting the filtering
> mode based on NETIF_F_HW_VLAN_CTAG_FILTER ?

When configuring the mac driver, there might be two net_device_ops sets
for MDIO or NC-SI. When using NC-SI, some features need to be delegated
to the external controller MAC, like VLAN hardware filtering, different
ndo_vlan_rx_{add,kill}_vid callbacks need to be assigned.

The filtering mode is an optional mode defined in NC-SI spec, some
devices does not support it. In this case, to support VLAN, I would
personally in favor of using the "Any VLAN" mode to let the external
MAC pass all packets to the internal one, and let the internal MAC
handle it either with its own hardware filter or software filter. In
this case, the VLAN list in NC-SI driver (used for setting the external
MAC filter) is not used.
