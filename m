Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDB564BC72
	for <lists+openbmc@lfdr.de>; Tue, 13 Dec 2022 19:56:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NWnlw22Sdz3bm9
	for <lists+openbmc@lfdr.de>; Wed, 14 Dec 2022 05:56:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iz6Exl+Y;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.115; helo=mga14.intel.com; envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iz6Exl+Y;
	dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NWnlN0ThBz2xbC
	for <openbmc@lists.ozlabs.org>; Wed, 14 Dec 2022 05:56:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670957776; x=1702493776;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VYZd2p3Db0xDAPUbO0fSSzUcwFARLRUoKoZV+9qUeFw=;
  b=iz6Exl+YlstvjdpIFVmY6vzCFyV6tG4B5SOK2Psj2ir4TAcSqzoo8y34
   lLYH7H/8O+LKt91fnDhnm0j8rM5A4yPWvI6bY9SkPGa4TNA22K6Cg+mDs
   GgXMpeWkRs0RCsM6Z1HdWVow1v4BjIvJDKv33Aul0e+cX5b2XvsrAQp1k
   pfy2wxV0ZbtUCc8i1qxJcGkI3Wx6enPOKb+sCU54QmgKABtvAM0L+D5Sa
   OyogEPU4/jcurCPgYuSJNMjetGOlvGbxglDB7HzBfQU047Ql6oCpceu0S
   Kp4HZgR0i6DI/cjB6SR0b17zmBChzPnxlPoDr0gKkj0Ir20tvX9Zk3uMX
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="318252329"
X-IronPort-AV: E=Sophos;i="5.96,242,1665471600"; 
   d="scan'208";a="318252329"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2022 10:56:12 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="712211797"
X-IronPort-AV: E=Sophos;i="5.96,242,1665471600"; 
   d="scan'208";a="712211797"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com) ([10.243.48.71])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2022 10:56:12 -0800
Date: Tue, 13 Dec 2022 10:55:35 -0800
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: zehra.ozdemir@inventron.com.tr
Subject: Re: Phosphor-ipmi-ipmb
Message-ID: <Y5jKp7C3tZKncA3P@mauery.jf.intel.com>
References: <000901d90ad1$35f93f30$a1ebbd90$@inventron.com.tr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <000901d90ad1$35f93f30$a1ebbd90$@inventron.com.tr>
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
Cc: openbmc@lists.ozlabs.org, "'M. Erhan Yigitbasi'" <erhan.yigitbasi@inventron.com.tr>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 08-Dec-2022 09:49 AM, zehra.ozdemir@inventron.com.tr wrote:
>Hello,
>
>
>
>We are trying to create communication between BMC and the Host. We defined
>an ipmb device from an i2c in dts and can barely see that /dev/ipmb-x is
>created and ipmb.service is running. But we do not understand how is data
>transfer provided Host to BMC yet.  Is remote address in ipmb-channels.json
>used for that reason? Also, do we need to add any driver to the host for
>this?

I am not aware of anyone using ipmb for a system interface. So far in 
OpenBMC, I have only heard of block transfer (BT) or keyboard controller 
style (KCS) system interfaces. I am guessing that by ipmb you are 
referring to SMBus System Interface or SSIF in the IPMI specification. 
Is that what you are referring to?

 From the system side typically some sort of table or specification would 
direct the OS to load the SSIF driver (or other IPMI system interface 
driver). For example, on Intel-based systems, this would be from the 
SMBIOS table.

--Vernon
