Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E545254722E
	for <lists+openbmc@lfdr.de>; Sat, 11 Jun 2022 07:19:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKmN95ycSz3c7q
	for <lists+openbmc@lfdr.de>; Sat, 11 Jun 2022 15:19:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KB2NNJ7t;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.20; helo=mga02.intel.com; envelope-from=jiaqing.zhao@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KB2NNJ7t;
	dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKmMm4gpJz305D
	for <openbmc@lists.ozlabs.org>; Sat, 11 Jun 2022 15:18:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654924740; x=1686460740;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=DUPTlnLt/iLP3iWZV9PCtpnzKffFuUerVcMAVnD9HIg=;
  b=KB2NNJ7tKs2ybxxB4VKzwDt782V4+fyzwEDGSzrZ8tWtliqJwkMFbnx4
   kRj5TzUM+Ha9E6tKt7fu5JB7sqP2cRMLIgogv1E34TZWSzBm2wqUhJoRZ
   9etlEOKhu7dfbTWSylRCjtNKQrQw/W6UW2H1XDNrHmEEnmJ5kCLXXhIaz
   3WqFuKKDkaKbvqYxrxle+zJN74eLRkUBLH539O0mCusORxhY+N+QNim12
   L+1XT/iJ3LQcgodz1Y5FYy7lrFLTVM8IpJpcsn+JVcvGF5tE4W1Xc9/y0
   xZSdle+PgU/zoA0p7DbCzHH5RkzF3HNbPaGhwMHd0Wjl0PsoeH91fmMKJ
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="266593531"
X-IronPort-AV: E=Sophos;i="5.91,292,1647327600"; 
   d="scan'208";a="266593531"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 22:18:55 -0700
X-IronPort-AV: E=Sophos;i="5.91,292,1647327600"; 
   d="scan'208";a="638540757"
Received: from jiaqingz-mobl.ccr.corp.intel.com (HELO [10.255.31.17]) ([10.255.31.17])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 22:18:53 -0700
Message-ID: <6f067302-74a8-702f-bf38-4477a805a528@linux.intel.com>
Date: Sat, 11 Jun 2022 13:18:51 +0800
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
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
In-Reply-To: <20220610214506.74c3f89c@kernel.org>
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

On 2022-06-11 12:45, Jakub Kicinski wrote:
> On Sat, 11 Jun 2022 11:25:03 +0800 Jiaqing Zhao wrote:
>>> Why is "ncsi,vlan-mode" set via the device tree? Looks like something
>>> that can be configured at runtime.   
>>
>> Actually this cannot be configured at runtime, the NCSI spec defines no
>> command or register to determine which mode is supported by the device.
> 
> To be clear I'm not saying that it should be auto-detected and
> auto-configured. Just that user space can issue a command to change 
> the config.
> 
>> If kernel want to enable VLAN on the NCSI device, either "Filtered tagged
>> + Untagged" (current default) or "Any tagged + untagged" mode should be
>> enabled, but unfortunately both of these two modes are documented to be
>> optionally supported in the spec. And in real cases, there are devices
>> that only supports one of them, or neither of them. So I added the device
>> tree property to configure which mode to use.
> 
> But for a given device its driver knows what modes are supported.
> Is it not possible to make the VLAN mode passed thru ncsi-netlink?
> 
> Better still, can't "Filtered tagged + Untagged" vs "Any tagged +
> untagged" be decided based on netdev features being enabled like it
> is for normal netdevs?

All ncsi devices uses the same driver as they uses same command set,
so the driver doesn't know what modes are supported. And in current
driver, the vlan related parameters are configured when registering
the device, adding an ncsi-netlink command to do so seems to be
unsuitable.

And adding a netlink command requires extra application in userspace
to switch the mode. In my opinion, it would be more user-friendly to
make it usable on boot.

Netdev also does not work as the ncsi device itself does not have
its own netdev, the netdev comes from the mac device. For different
vlan modes, the netdev feature set of its parent mac device are the
same.

