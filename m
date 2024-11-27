Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFB69DAE98
	for <lists+openbmc@lfdr.de>; Wed, 27 Nov 2024 21:42:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XzBGD4l5tz3bSd
	for <lists+openbmc@lfdr.de>; Thu, 28 Nov 2024 07:42:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732740160;
	cv=none; b=nDeHTeGUl419I6KV6+Hg9SP/ygP9zH+1bfx6whh6P28PBJ9fhGwk5E/YGHmEb+fSZ010xrkF9jZE1lr21KBqRlM7eI5K3hVlzweAqj+xXc3fW9jQXGyUvlgP3B1YM69w99rpkO0D0SWiYTpJtI3tHAb1O1Ou+hQ+yTqja23YGApFzJfLr0Hy1iPsExJqmzuxUAjciEnos1OyapgpXqPJ4SLeQULIndqgawG+E39gupRemKJnKv9el0DWbMv9JezT5vZL/AYGcfNSOwpwhkqo5Ka+FzsVY4eLtK+/RKBKOgMd0JyUQCDghflw/zOmDyn+MZgd0kK8+E+0RHeXI6cBsA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732740160; c=relaxed/relaxed;
	bh=WAyVOcscnaQDgPTvmWkygtdXNmILE4y+uuv+Lg9JcQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Nuxto8scE6unTE6OKHk1ClOhytfGyKvc4UeCXy3V7/i8c3Eq9YZkbaIpJ1SaIWp3uNVqCYQfV1IpRT9+qIrg3nhW8TZEthph2HqiVg61OdH6mxVKFAT8pYP4tUF9oInNJYhXq+z8Le2PT6C6X57K0wq6P2gMAADTyolZajxUoPcH41K9dOYeoIFKNIic0CeKRzHDI6/bSZiTw2wRWG/OXGkqbpcvC+QLYfRjDfrH6IQvQPGXxx+Ce/B0h1eiECm1deLkag0YOW8Zx5b0YyFt23dtakuGA7EmPXHb1gPuCmBvuWjq+oQBHQZ5qFzH020dsTbWOohGMVsqND+KiY5bAg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qlt9xhTR; dkim-atps=neutral; spf=none (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=jason.m.bills@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qlt9xhTR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=jason.m.bills@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XzBG44whXz2y3Z
	for <openbmc@lists.ozlabs.org>; Thu, 28 Nov 2024 07:42:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732740157; x=1764276157;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=MZI2s0kV7NoOJMMupEvo1PBXn+Dp+IF6Hybe3OWdw6M=;
  b=Qlt9xhTRAan1NzzO2gt7cqzrP+6oyuJSpKyxdt+eo98gCyH93APAcFwR
   SSpyi1mILjwgQqpGQneg7tIZS1NPpCla9avU5krpvgfPPbEV7Er6gHYE2
   nEk5sMKhDon8B+d5+S//exNavcQW/B7LlBzOc7vcGubWqwY2uDTUTBShT
   hkXx/lVPjGfUZE24xxbUCDLzzF28uBgYBUifHGIrq8zqBEm4rJygPDK7a
   uJZKy7UULqJt7gwCPKzDShe12Zed+T87GQGkD8Af//D+zg2tLMVdIISHe
   zRJIyk5mpvvYaRNQ8BPYGwYr4Zv+YfPIk/ygxM13tA7+2qSP5YY/yhoS7
   g==;
X-CSE-ConnectionGUID: ZOUsHFUgRI6D1qZIUPcB+g==
X-CSE-MsgGUID: RUPhLIK+QD2iB6quV1yzdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="32331219"
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; 
   d="scan'208";a="32331219"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 12:42:31 -0800
X-CSE-ConnectionGUID: IRWV2pUURnOoncoFFE9mvw==
X-CSE-MsgGUID: 9u/LClu+T8aw6JV6mVIv8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; 
   d="scan'208";a="129553095"
Received: from linux.intel.com ([10.54.29.200])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 12:42:31 -0800
Received: from [10.124.122.91] (jmbills-mobl1.amr.corp.intel.com [10.124.122.91])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id E275720B5705
	for <openbmc@lists.ozlabs.org>; Wed, 27 Nov 2024 12:42:30 -0800 (PST)
Message-ID: <53b7d400-63ca-4af8-a0e5-13934c22a63b@linux.intel.com>
Date: Wed, 27 Nov 2024 13:42:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fetching Bios Attributes on BMC side.
To: openbmc@lists.ozlabs.org
References: <CAKMbc5vCGEaR3rLn0+3kqyEhj02i+o9ceF61i3LOuf1huz1vXw@mail.gmail.com>
Content-Language: en-US
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
In-Reply-To: <CAKMbc5vCGEaR3rLn0+3kqyEhj02i+o9ceF61i3LOuf1huz1vXw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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



On 11/24/2024 11:59 PM, Jack wrote:
> I'm working on remote BIOS setup support for *intel based platform*.
> In my case the |BaseBIOSTable| attribute is empty which |pldmd| is 
> responsible for populating this attribute.
> I taken property of BaseBIOSTable from busctl utility where it show 
> *"a{s(sbsssvva(sv))} 0"*.
> The *0* at the end of the output likely indicates the number of elements 
> in the array (a),
> meaning that the array is currently empty or doesn't contain any entries.
> So what should i do if i want to take Bios attributes at BMC side & also 
> i did'y find any .json or xml file in BMC side?
> ||

It looks like the README in bios-settings-mgr was recently updated with 
better instructions on initializing the BaseBIOSTable: 
https://github.com/openbmc/bios-settings-mgr/blob/master/README.md#initialization-of-basebiostable

Does the PLDM info there help at all?

