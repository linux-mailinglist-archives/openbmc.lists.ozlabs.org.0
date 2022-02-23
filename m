Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC914C1A1B
	for <lists+openbmc@lfdr.de>; Wed, 23 Feb 2022 18:45:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3k3L3G3fz3bVy
	for <lists+openbmc@lfdr.de>; Thu, 24 Feb 2022 04:45:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I7oiynkl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=jiaqing.zhao@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=I7oiynkl; dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3k2v3Cmlz3bTd
 for <openbmc@lists.ozlabs.org>; Thu, 24 Feb 2022 04:45:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645638328; x=1677174328;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0jVB8cv2k+J9IptVmjujMmoMftpZyVtHO0/DyrkZpew=;
 b=I7oiynklLLAetcNVtUKRFs97PSOTgqvceMVe1OLGFO4VQROW/wNNvJEA
 EKMt2gsPbH7i4DJIaVTcxJGfKuNT3lB73mbUQqM+14ghQ+E2eQGqO0eZ7
 ojDENRJKbhZsZVRxeGX4RsjNE3Q3OmO0FHRXI8EfFlqX0HBnETWslG1Ok
 HOY/3pDFe3F+tqDDgF2/QH6Tdvk2FMdA4MMlvpiE4QmDFWBYR1XlFXkIs
 DkZXgnTcgRxDA/OGUrynsKoSAHP1E/YGwSF2mnvj4JVJ/sBWU/X25JOnn
 KkPY4ImN7PPKdHf7gNsKuBfHrobPhSX0CoS4cUqWKa+UNEtVD8flTAMxV A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="239429684"
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; d="scan'208";a="239429684"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 09:44:22 -0800
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; d="scan'208";a="508534117"
Received: from jiaqingz-mobl.ccr.corp.intel.com (HELO [10.255.30.73])
 ([10.255.30.73])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 09:44:21 -0800
Message-ID: <112c8819-24bc-2a24-45a3-9c919088f43a@linux.intel.com>
Date: Thu, 24 Feb 2022 01:44:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: Checking for network online
Content-Language: en-US
To: Patrick Williams <patrick@stwcx.xyz>
References: <af9a0274-2fb3-8195-a02b-c1d5ecf4848e@intel.com>
 <bb39999e8f9638da3d29b865d85fb54d51da9797.camel@codeconstruct.com.au>
 <CAGm54UE1bFeLF9PHUuj__E0m_+CxLRtA4Htrjm4y5M3SnbOhLA@mail.gmail.com>
 <37a29642-788c-b966-3b58-214c3d44c8f4@intel.com>
 <64727f8e-cca3-b04d-e4cf-709ceb60f37f@linux.intel.com>
 <YhY7Kxgg6ew0HdUR@heinlein>
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
In-Reply-To: <YhY7Kxgg6ew0HdUR@heinlein>
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
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Lei Yu <yulei.sh@bytedance.com>,
 Johnathan Mantey <johnathanx.mantey@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2022-02-23 21:48, Patrick Williams wrote:
> On Wed, Feb 23, 2022 at 10:09:19AM +0800, Jiaqing Zhao wrote:
>> I think a solution is to set RequiredForOnline=no (https://www.freedesktop.org/software/systemd/man/systemd.network.html#RequiredForOnline=) in all network interface config. This option skips the interface when running systemd-networkd-wait-online.service. Canonical netplan (used in ubuntu server) also uses this option to skip the online check for given interface (https://github.com/canonical/netplan/blob/main/src/networkd.c#L636-L639).
>>
>> I'll submit a patch to phosphor-networkd later.
> 
> I really don't think this is appropriate for all systems.  Services have
> dependencies on network-online.target for a reason.  If the side-effect of
> having the BMC network cable unplugged is that the host doesn't boot, that might
> be entirely reasonable behavior in some environments.
> 
> We use rsyslog as the mechanism to offload our BMC logging data to an
> aggregation point.  When you have a very large scale deployment, it is actually
> better for the system to not come online than for us to lose out on that data,
> since we have spare capacity to take its place.

My understanding is that in OpenBMC, the propose to use rsyslog is to format the Redfish and IPMI SEL logs from system journal. The "r" of rsyslogd is not used in most cases. I think the "network not available" can be handled same as "server misconfigured" in rsyslogd, as in both cases it fails to connect to the server, and may exit or print some error messages? (not tried yet)

Jonathan mentions that the 120s wait blocks multi-user.target in his initial email. Considering that there is no BMC serial port in most production hardware, when BMC has no network connection, the only way to interact with BMC is to use IPMI in host. However, IPMI services are started in multi-user.target, if BMC infinitely waits network online, there would be no way to debug the issue. 

> Note that the Canonical netplan only applies this option if the configuration
> indicates that the interface is optional, which is entirely appropriate.  The
> way you wrote it could have been interpreted that they set this on *every*
> interface, which is what it seems like you're proposing to do to
> phosphor-networkd
>
> If this is desired behavior for someone, can't you supply a wildcard .network
> file that adds this option, rather than modifying phosphor-networkd to manually
> add it to each network interface that it is managing?

Maybe we can add a similar DBus property like how netplan does? Reading/writing systemd-networkd config files is feasible in phosphor-networkd. Default value can be assigned via build option.
 
> I believe some designs use a USB network device to connect two internal pieces
> of the system and those interfaces are not necessarily managed by
> phosphor-networkd (interfaces that, for example connect BMC-to-BMC or
> BMC-to-Host).  While it is obviously up to the system designer to work through
> this bug, by applying this configuration as you proposed you are causing
> unusual default behavior in that networkd is going to start waiting for these
> internal connections to come online instead of the external interface.

I think this is a extremely rare case, internal interfaces should be configurable. For example, host OS can change the IP of its BMC-Host virtual interface, BMC should also be able to change its, and for BMC-to-BMC interfaces, it is impossible to assign a fixed LAN IP without conflicts in manufacturing. The easiest way to configure it is to utilize the phosphor-networkd.

Even it is not managed by phosphor-networkd, keeping default RequiredForOnline=yes will cause the 120s wait on BMC boot. Developers can simply search it and find out the solution. I remember it will show a timer with message on BMC serial console, that's how I found I should set the "optional" on my ubuntu server.
