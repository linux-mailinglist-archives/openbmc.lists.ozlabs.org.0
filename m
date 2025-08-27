Return-Path: <openbmc+bounces-518-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D51B3893D
	for <lists+openbmc@lfdr.de>; Wed, 27 Aug 2025 20:04:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBsqC35fYz2ySY;
	Thu, 28 Aug 2025 04:04:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756317847;
	cv=none; b=aJD2yroRBtMpPuPXy9oVPpgl+48C0y+H//F7RqY3sZ9uZuvP/1DPxoIEL9JOZujhfcESIOt18bfcwkhW4bHoJ6vFbzoFZYcqKLhC+cAwu7tdrUyBZbsF8A9HUUqA3Z5KQpyUxWQKrduOa8/CsdMdJ9ulEc/1a35fRHYxBrWnt16qbwHRKGbR1yKuxmhaDcaKzebqB9Rx2q/9Vi6i/cyHx7tYlBe4WkSV6pY6I5cJ71uhBLm6kqU9kNTaJy4v9dleYz9pstsvvtHGL5Enz2cJNdUky05YNl+dhsO3o1p/+OFZlx1ey4dh2gBDN1SQSLwzxi69aQJ34jkUeuHtGBdcmw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756317847; c=relaxed/relaxed;
	bh=ujBeZMOXe1Crk7HVOe9QSRiJGoiMxXZY5Pu/IWuIMXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=EVpxsRm1pDgKpNUXSfgdEaOJYvAXbnz/eUbXxA7pHUNSfTKw6LwFySS5MdohAKd3QQgZqCK6tGNsVzkvI3PDzmqB9DOp1RmVkFq5vlR/a0sHlVsybLddYqkeY7frBYS+iCyfEMys7gvG8bMjGjBy2Mnww4Q0Z+/CtCuYpBfhI3xokfHlOlpWS6+bM2tGHqCQUd82KirmWScOwe6xmhfchWm7JvJI4Qo24QjacJxqmgSySgK50+9iUa2uxnk/QAV53aFZf56fJVzccC1ilzKCncavmqy3aYk6VJMaBwssTxbwlrfR2Uwt7qbJceSi0LVE6OGc5XxHDVVysXCVG5zB8Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d9odPDvm; dkim-atps=neutral; spf=none (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=jason.m.bills@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d9odPDvm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=jason.m.bills@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cBsq84RD6z2yDH
	for <openbmc@lists.ozlabs.org>; Thu, 28 Aug 2025 04:04:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756317845; x=1787853845;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=0PMZCMNibnnkM+oSWniqU7KF5VGZh7IxpgBp6me+tCc=;
  b=d9odPDvmrCKOq0VP9BR2I1gWZ3B7I0ClDW/5p7xLuqGnCKgzdGcWP8da
   bhNw25NKtpgni+c0CJLPrCOuzFqQFxOUhj7s1Pn/JfRNipkpkUp1ltowU
   CV4Y4I97lX+okbNYblQv9wJ0ls3iMFDRZixj0S6SpF9CfY1sgEkjyhgFz
   74fiudZXzqMHq8aXdshygTxD4Ceh/+ydeoD15hkLG0e0oGQ1LuLELdYMr
   ts2+YDS49k1Z3cxQVxG6TWB5dWMH7IyQUnvKrVXfUGuQS9JR6evej3W0X
   sicJuIYcCtwzV0ov49YX/XiiINrhFCcE5ItGlmqthYzxliIarnAt/3Xp1
   Q==;
X-CSE-ConnectionGUID: qPONfC7ST86Qso1qWfoOgQ==
X-CSE-MsgGUID: 3tppoVgTRJebhdziSyoN9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58288493"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="58288493"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 11:04:01 -0700
X-CSE-ConnectionGUID: DgEdvBkhQnav3ejXE7auig==
X-CSE-MsgGUID: cmzxLtkaRWCvzTV/HIjcqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="169500489"
Received: from linux.intel.com ([10.54.29.200])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 11:04:01 -0700
Received: from [10.124.90.30] (jmbills-mobl1.amr.corp.intel.com [10.124.90.30])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id ABAE320B571C
	for <openbmc@lists.ozlabs.org>; Wed, 27 Aug 2025 11:04:00 -0700 (PDT)
Message-ID: <0f0550bd-34b7-4f47-b472-160007bb8683@linux.intel.com>
Date: Wed, 27 Aug 2025 12:03:59 -0600
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Modifications in PLDM T5 flow to support SPI staged update
To: openbmc@lists.ozlabs.org
References: <CADCscQ=9xHFPfoS9BY5Nuib36nQvfcC_jwhmcPRyibgw4_ObXA@mail.gmail.com>
 <DC3C6C29-2ABB-4E27-834A-02EBE322B82D@stwcx.xyz>
Content-Language: en-US
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
In-Reply-To: <DC3C6C29-2ABB-4E27-834A-02EBE322B82D@stwcx.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 8/15/2025 7:25 AM, Patrick Williams wrote:
> Are there Redfish methods of initiating this now?  I recall a workgroup 
> at OCP was trying to get this done there.
> 
> — Patrick Williams
> 
>> On Aug 15, 2025, at 8:15 AM, Tom Joseph <rushtotom@gmail.com> wrote:
>>
>> ﻿
>>
>> Hello All,
>>
>> SPI Staged Update enables pre-downloading firmware component images 
>> for supported devices, significantly reducing downtime during firmware 
>> updates and activation. This requires devices to support at least two 
>> slots — one for the running firmware and another for staging the new 
>> image.
>>
>> The update process occurs in two iterations:
>>
>> 1.
>>
>>     First Iteration:
>>
>>      *
>>
>>         The PLDM UA initiates the PLDM T5 flow with the PLDM FD
>>         supporting staged updates.
>>
>>      *
>>
>>         All stages (Transfer, Verify, Apply) are completed
>>         except activation. This is achieved by PLDM UA skipping the
>>         PLDM T5 ActivateFirmware command.
>>
>>      *
>>
>>         Upon state machine timeout, the PLDM FD marks the new image
>>         as /staged/ (not failed update). Since it’s staged, it remains
>>         inactive until explicitly activated later.
>>
>> 2.
>>
>>     Second Iteration:
>>
>>      *
>>
>>         The same PLDM package is used. Since the image is already
>>         staged, the PLDM FD skips most of the Transfer stage, reducing
>>         downtime.
>>
>>      *
>>
>>         This iteration is typically scheduled during a maintenance window.
>>
>>      *
>>
>>         Devices that do not support SPI staging are updated in this
>>         iteration.
>>
>>      *
>>
>>         All firmware is activated after this iteration.
>>
>> To enable this, we propose introducing a new OEM parameter in the 
>> MultiPart API to instruct the PLDM UA to skip sending the | 
>> ActivateFirmware|command, along with necessary PLDM UA modifications 
>> to support the SPI staged flow.
>>
>> If there is interest within the OpenBMC community to adopt and 
>> collaborate on this feature, please feel free to reach out.
>>

Intel has interest in being part of an OpenBMC community collaboration 
on this feature.

>> [1] https://docs.nvidia.com/multi-node-nvlink-systems/nvfupd-guide/ 
>> appendix/spi-staged.html <https://docs.nvidia.com/multi-node-nvlink- 
>> systems/nvfupd-guide/appendix/spi-staged.html>
>>
>> Regards,
>> Tom


