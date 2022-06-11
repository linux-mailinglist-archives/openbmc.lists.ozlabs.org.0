Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9003354719D
	for <lists+openbmc@lfdr.de>; Sat, 11 Jun 2022 05:25:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKjry3nK5z3bwb
	for <lists+openbmc@lfdr.de>; Sat, 11 Jun 2022 13:25:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mtimywC5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.126; helo=mga18.intel.com; envelope-from=jiaqing.zhao@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mtimywC5;
	dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKjrW1931z3blv
	for <openbmc@lists.ozlabs.org>; Sat, 11 Jun 2022 13:25:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654917915; x=1686453915;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=UsYYyX+/SHIT1MvBl8yridNdLkGTwE+InRQzJyWqVk8=;
  b=mtimywC5WJCQX74ATvfpAAXzsyp1poSSQY4jPU/CzKkpJM+cYr5IbMSa
   HJaZ2gfWitfVGaRUMCxQy9PNADHhwtjnCg4RpbgVuwjSk93QmGv5uQvkp
   2Hc9HTYJRnREeA4zIwQ5mVLRSAKiYJwagwa0lMrv7pcuBD//6++Lh2Elh
   LYyDTgziHdt3V+L74z4kMkfUIJ9LOnxhMVzVkofWM6TG0e6Z3YhlS95IW
   7brE7Sw22lM63nd9+xY7XS+Xosf5gDFJOC6JHLF3jwNXSxHI2cHTt//vb
   wpYRldi6g38al3d1LPcAKNLX/g5jYw6U+yFtOYmRe6yOcDT7kv/c/ACeB
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="260928955"
X-IronPort-AV: E=Sophos;i="5.91,292,1647327600"; 
   d="scan'208";a="260928955"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 20:25:08 -0700
X-IronPort-AV: E=Sophos;i="5.91,292,1647327600"; 
   d="scan'208";a="638503297"
Received: from jiaqingz-mobl.ccr.corp.intel.com (HELO [10.255.31.17]) ([10.255.31.17])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 20:25:06 -0700
Message-ID: <3c9fa928-f416-3526-be23-12644d18db3b@linux.intel.com>
Date: Sat, 11 Jun 2022 11:25:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 0/6] Configurable VLAN mode for NCSI driver
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>
References: <20220610165940.2326777-1-jiaqing.zhao@linux.intel.com>
 <20220610130903.0386c0d9@kernel.org>
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
In-Reply-To: <20220610130903.0386c0d9@kernel.org>
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

On 2022-06-11 04:09, Jakub Kicinski wrote:
> On Sat, 11 Jun 2022 00:59:34 +0800 Jiaqing Zhao wrote:
>> Currently kernel NCSI driver only supports the "VLAN + non-VLAN" mode
>> (Mode #2), but this mode is an optional mode [1] defined in NCSI spec
>> and some NCSI devices like Intel E810 Network Adapter [2] does not
>> support that mode. This patchset adds a new "ncsi,vlan-mode" device
>> tree property for configuring the VLAN mode of NCSI device.
>>
>> [1] Table 58 - VLAN Enable Modes
>>     https://www.dmtf.org/sites/default/files/standards/documents/DSP0222_1.0.0.pdf
>> [2] 12.6.5.4.3 VLAN
>>     https://cdrdv2.intel.com/v1/dl/getContent/613875
> 
> Please don't post the same patches more than once a day. You posted the
> same patches 3 times within 15 minutes with no major difference :/

Got it, sorry for misusing the mailing list. 

> Why is "ncsi,vlan-mode" set via the device tree? Looks like something
> that can be configured at runtime. 

Actually this cannot be configured at runtime, the NCSI spec defines no
command or register to determine which mode is supported by the device.
If kernel want to enable VLAN on the NCSI device, either "Filtered tagged
+ Untagged" (current default) or "Any tagged + untagged" mode should be
enabled, but unfortunately both of these two modes are documented to be
optionally supported in the spec. And in real cases, there are devices
that only supports one of them, or neither of them. So I added the device
tree property to configure which mode to use.
