Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5B75247A9
	for <lists+openbmc@lfdr.de>; Thu, 12 May 2022 10:11:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KzPcf6v4Qz3bxt
	for <lists+openbmc@lfdr.de>; Thu, 12 May 2022 18:11:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DhKAfynr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=jiaqing.zhao@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DhKAfynr; dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KzPcC5H2sz3bZY
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2022 18:11:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652343067; x=1683879067;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=sNt/oo/daQ36rlp/elPqgg1JqGSFdZywkqf2Bgv/bR4=;
 b=DhKAfynrynNjwYcm+unMRG4SD1RAWxMDxcu1WjoQyvtPbdY6MFabJ1WQ
 FbNVTfe19gh55kWVuCt+tLrBVBqO2OjVUijXBvW+AAspp/R5d6UG3JWJc
 4cgpmdS3RBZH0/J8IlClI/WXcUBnpyWOKJF7eDCiD+pkrrdyieKfoD7Sb
 B78z69IbNA2XBx6n1VlQJ1XhzTeybmGlFsEyUpu1HWc3T+RVRxzLoSvCZ
 zQS1cMTZUb2vdpZ9glUMf2xO9hmrJILgU0ZEmUpLcKWE5LtOfHE4w/tN3
 Hp7qBvpBiRlEo7uQL61oSZV+bKk7vhrRszGSXQY6SQYLarOu2HT+fLXmo w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="267515311"
X-IronPort-AV: E=Sophos;i="5.91,219,1647327600"; d="scan'208";a="267515311"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2022 01:10:00 -0700
X-IronPort-AV: E=Sophos;i="5.91,219,1647327600"; d="scan'208";a="594554346"
Received: from jiaqingz-mobl.ccr.corp.intel.com (HELO [10.249.197.41])
 ([10.249.197.41])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2022 01:09:59 -0700
Message-ID: <56f4c504-cbb3-aafc-2e4e-e0b3f9439ade@linux.intel.com>
Date: Thu, 12 May 2022 16:09:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: VLAN issue with NICEnabled property
Content-Language: en-US
To: Johnathan Mantey <johnathanx.mantey@intel.com>, openbmc@lists.ozlabs.org
References: <93ff730f-ee5c-b5a1-9e14-873248ff969f@linux.intel.com>
 <b64651cc-7da1-d8d4-eaa1-de4cd7555828@intel.com>
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
In-Reply-To: <b64651cc-7da1-d8d4-eaa1-de4cd7555828@intel.com>
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
Cc: wak@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2022-05-12 04:31, Johnathan Mantey wrote:
> On 4/15/22 05:28, Jiaqing Zhao wrote:
>> Hi, all
>>
>> In phosphor-networkd, setting NICEnabled to false write "Unmanaged=yes" in network configuration file. There was an issue with this property and its VLAN. Reboot bmc after setting NICEnabled to false, its VLAN interfaces disappears, and if set it to true, all previously configured VLANs for this interfaces will be lost.
>>
>> The reason is, since the interface is set to Unmanaged in config file, systemd-networkd will not configure the interface on boot, including creating VLANs. On the phosphor-networkd side, it creates its interface list from getifaddrs(), as VLAN interfaces are not created, they will not be added to the list. When setting NICEnabled back to true, it rewrites the config file with the VLANs in that list, so no VLAN is written, essentially removes the previously configured VLAN from the system with dangling vlan netdev and config files.
>>
>> To solve this issue, my proposal is to write "ActivationPolicy=down" when NICEnabled is false, this option tells systemd-networkd not to bring up the interface on boot. But it is still managed, meaning that its VLAN interfaces will be created.
> 
> This control was the result of using the Unmanaged entry for disabling the NIC. The phosphor-network code needs to change to the ActivationPolicy configuration option, IMO.

Another issue I met is the MAC address specified in systemd.network config is also lost after reboot as it is Unmanaged by systemd. Using ActivationPolicy will also solve this.

>>
>> But there is a question of this proposal, how to set nicEnabled property when creating the interface? Using "ActivationPolicy=down" still
> 
> What do you mean by "creating the interface"?
> Are you referring to what the systemd-networkd service will do?
> Are you referring to how phosphor-network captures the network configuration in the data structures used to manage systemd.network configuration files?

I mean creating the EthernetInterface object in phosphor-networkd. The value on DBus is initialized by querying the org.freedesktop.network1 DBus to see if the interface's AdministrativeState is unmanaged. This is not applicable when using ActivationPolicy.

The Redfish spec says the InterfaceEnabled (NICEnabled mapped to) property is "An indication of whether this interface is enabled". I'm not sure which one will be better? Querying the IFF_UP flag or simply read the ActivationPolicy from config file?

>> has the issue mentioned inhttps://github.com/openbmc/phosphor-networkd/commit/26275a3f2ecffe62646b65646c00a9e56c75bff8, however, unlike Unmanaged interfaces will have is AdministrativeState==managed, a interface that is down has AdministrativeState==configuring, which is also a possible value for interfaces needs to be brought up on boot, though it will become "configured" when it is up.
>>
>> One idea I came up with is to us configParser to read the ActivationPolicy from config file. Any other ideas will be appreciated.
>>
>> Thanks,
>> Jiaqing
> 
