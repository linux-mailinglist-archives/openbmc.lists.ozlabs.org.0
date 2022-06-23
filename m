Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A64B955737E
	for <lists+openbmc@lfdr.de>; Thu, 23 Jun 2022 09:04:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTB8B3VLNz3bts
	for <lists+openbmc@lfdr.de>; Thu, 23 Jun 2022 17:04:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ISdWlxMq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.20; helo=mga02.intel.com; envelope-from=jiaqing.zhao@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ISdWlxMq;
	dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTB7l0hl9z3blf
	for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2022 17:04:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655967859; x=1687503859;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=kEjzvesikBKpz0qqDsLYOOOAdZpNn+gg2ec1p7BTAAY=;
  b=ISdWlxMqJr1VgAGQjfZtqF9mURoE3hSYiKSWcOnKHFS0pjUBAPBX6aTe
   4HVAcxGEaDlwwpyguXP+nYvBsmo1Hx2g7ufJNJiJZBKlZXHDo4PSCI77F
   UdgQENOTbUrrtkpN7mDy3lzQsZNc4GIPMTcAVdZFl2nq5lian7VTFNiwq
   NxhWkyIM/jzrfXHwAH+5H3MljJKY+NAzU1W4MJ8peSEIvyfQ3DwK06ldU
   kokTaHbYZmKm2vKPT44XpX+uOEfflDcjPtHY/PJoXnNAFUSyYIIWVZNln
   WAhZB2Ox+fkydkWdn535dqN6DDDReNiBytBl2cs7rvt1R5EhfncquJTr+
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="269369362"
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; 
   d="scan'208";a="269369362"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2022 00:04:11 -0700
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; 
   d="scan'208";a="644597633"
Received: from jiaqingz-mobl.ccr.corp.intel.com (HELO [10.238.3.30]) ([10.238.3.30])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2022 00:04:10 -0700
Message-ID: <2d93fd2f-bde5-22f2-373a-63398963e94f@linux.intel.com>
Date: Thu, 23 Jun 2022 15:04:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: OpenBMC Network Route Management: Metric and Static Route config
 support
Content-Language: en-US
To: raviteja bailapudi <raviteja28031990@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CAM4DKZkkKx_MPVv_R7WqOhnKA+hRYWU4GK=DqbqqSVj_CtMtMg@mail.gmail.com>
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
In-Reply-To: <CAM4DKZkkKx_MPVv_R7WqOhnKA+hRYWU4GK=DqbqqSVj_CtMtMg@mail.gmail.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi, Raviteja

Can you help explain the routing issue you met?

I've also met a metric-related issue. When there are 2 interfaces, one use DHCP,
the other use Static, systemd-networkd sets the metric 1024 on the DHCP-assigned
default routev (metric for static default gateway is 0), which causing peers
only reachable via the DHCP-assigned default route cannot be accessed.

And in current OpenBMC implementation, I think we should allow setting null to
Gateway of IPv4StaticAddress to not set default route on that interface.

Thanks,
Jiaqing

On 2022-06-22 18:50, raviteja bailapudi wrote:
> Hi Team
> 
> We have hit network routing issues while using Static IPv4 addresses on
> both eth0 and eth1,  as both default gateways at the interfaces were of the
> same metric value. To solve this problem we are planning to provide an
> interface for admins to set the metric value for the gateway while setting
> up the Static IPv4 network on BMC.
> 
> 
> To enable users to connect from outside-subnet clients, we also need to
> support static routes on BMC.
> 
> 
> I have started a thread in redfish forum as well
> 
> https://redfishforum.com/thread/683/network-routing-table-management-support
> 
> 
> Please share your views on the same.
> 
> 
> 
> Regards,
> 
> Raviteja
> 
