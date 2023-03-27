Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 679696C9B76
	for <lists+openbmc@lfdr.de>; Mon, 27 Mar 2023 08:44:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlNZv1S3Zz3cGV
	for <lists+openbmc@lfdr.de>; Mon, 27 Mar 2023 17:44:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ec45EMIv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.126; helo=mga18.intel.com; envelope-from=jiaqing.zhao@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ec45EMIv;
	dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlNZH4cbGz3cBP
	for <openbmc@lists.ozlabs.org>; Mon, 27 Mar 2023 17:43:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679899431; x=1711435431;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=WGlOTvnFVcaT1GQzptRQuFg1/Xm3PQj7CFFfp/ogUxw=;
  b=ec45EMIv0MgKFrsZf7mIZ+HBQIJYSKj58hHgpBGP9yFig/D9Kf2NGO5m
   2/xD7nvaSQ5d7sIjdwIjRTt0AV2w4nZBnu0GTsvHfGD98cx5sXIcVtXi7
   wQj8HHLEJwReCDTeDow5uSPJqVjTerXGsoxG1f/cSsudDP87pkXAiaodu
   76QHQsP8ZBCm7/aKmpu/K71BIxQdLFHf5xoShVgZLQ0lsZj7t9M34T44N
   Rieg7zy8AM7xAMdlmgDuz2rjYvk5cJ1OWlEOBeccO8iP/A5x6Pamk4o1n
   1TjGApErFXBkg8zWdcj3Q9Nkptl7d1uC2+YDuGRQT+MT1mZLvNBggfC2U
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="324077528"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; 
   d="scan'208";a="324077528"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2023 23:43:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="794209820"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; 
   d="scan'208";a="794209820"
Received: from jiaqingz-mobl.ccr.corp.intel.com (HELO [10.249.172.250]) ([10.249.172.250])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2023 23:43:45 -0700
Message-ID: <c668cfac-9da9-19cf-804c-3cdd8ab75d04@linux.intel.com>
Date: Mon, 27 Mar 2023 14:43:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: Host Interface Support
To: openbmc@lists.ozlabs.org
References: <CANT9vnoMd9KF-KcD24Rj5+wH_jWkK1Bi7kxUbrtz_BEByFhjqg@mail.gmail.com>
Content-Language: en-US
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
In-Reply-To: <CANT9vnoMd9KF-KcD24Rj5+wH_jWkK1Bi7kxUbrtz_BEByFhjqg@mail.gmail.com>
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

On 2023-03-27 13:29, abirami sekar wrote:
> Hi Team,
> 
> I am new to openBMC and started learning Redfish.
> Can you please guide me to add HostInterface Support to Redfish.> 
> With Regards,
> Abirami S
> 

USB gadget (https://www.kernel.org/doc/html/latest/usb/gadget_configfs.html)
can be used to create a virtual USB network interface between host and
BMC.

For the remaining parts, you need to program the SMBIOS Type 42 record
in the BIOS for auto-configuring the interface in host OS. Refer
https://www.dmtf.org/sites/default/files/standards/documents/DSP0270_1.0.0.pdf
and
https://uefi.org/sites/default/files/resources/14_Samer%20John%20Mike_LENOVO%20INTEL_redfish%20host%20implications.pdf
for more details.
