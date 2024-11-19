Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 470259D28BF
	for <lists+openbmc@lfdr.de>; Tue, 19 Nov 2024 15:59:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xt71p5T3Xz3c9y
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2024 01:59:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732028364;
	cv=none; b=f1hoSgOYlIrT2yzCkkySlhMSgs6x3up5wHvXPUBjWuZmrXmnwOGH1DZvuScErPPUCUyTsnxvstnsHqXSaKKNJ5bkpZSVuTNL16LeHdbpjKeqT85ZToncFP0gWy8k2GlB3GcFv9dLpTcWhN39O7MsiyVFAuus/1BbsxCKn64JAi7AQKA+pb+gQJRRRw9w0wmUdO9qV+seyTTNwO58FxIg4urtUmCt7dUymQa3KcHc2RLZ7yjLyHsF0KF+AZeUfzhoKWXcaDwZ3v6A0sptqePBwOrvOPQZQSUnFXYLr1HqcuFTQu9Xv1kyNDqi67s4ClfFluxmNigcD02il9T3OGOtow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732028364; c=relaxed/relaxed;
	bh=FmUOUzPq7AaGw7iYkHgk83KpN+LpkSOSlBVdb3w7VBs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JLLtuuMTg+FMF7c6nB/9f3asg6jJgej9GjXWwgjqjKaZRgagRZ2ZvLBvpP/crBYBHS5pTVlzyqJh2PfMlQ06kDLF0QpSOfXbR4vbe7bjv0FosrhsMEL7O5z52gF499Xo9tzzbU+4OSdE34MoPoQkvZcs7RMALdEpA9DhziaWvXTTeJTIYMNmbnXwWnliysrwruQE27UmnZD1umxT10qV1lEs8o7VODaTIRNrUpLJCno6mfzfCDRiUhlrPZm7LJHZ8tEQfRP81N0i/6ASJf6kaGs2qxvH6AloRIKFBc0c7OnH/XIKd6mq78fW5SZ2O7fTqHrmbGZb0EVjP8adtIOMMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OzT6rlMM; dkim-atps=neutral; spf=none (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=jason.m.bills@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OzT6rlMM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=jason.m.bills@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Wed, 20 Nov 2024 01:59:22 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xt71k2khTz2yF6
	for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2024 01:59:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732028362; x=1763564362;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=o8lNX+Z039w8MeMPJ85b8XcnwF/zKgisOiQNbZDX0W4=;
  b=OzT6rlMMgXnQ96MAFn2UL/F9i7/yjkuj1lGyhj1Yi4gdi2V3zuMXGyj5
   kMKKi9CoehGWY4GlS1BK84FE7e3LMLAKcvbaH6tJO60tDMwhrO0csd0EH
   emKSfJzJCx0DGE5ZGAoDjp1GQ/JcR55T0Rh7ajmfdjV/2xh6i4bPin2fQ
   wets9rFz48+w7R2q1k/vj67wS+mg2Pnz02Mm6WJZt8zjUm4CakjwiWsQY
   BXP5ZN65IlhEa4ySESDh4fwGAAme/prJXm0k2t5WTzAo+T10uphpLOTqP
   HakmFfaiqFU6kkLvIyAY2zfDIwjH4OMeQRNI3gHb9N1nmLzIUTB8pPjtP
   A==;
X-CSE-ConnectionGUID: diNd2+PJT+yfILK4WBPnfQ==
X-CSE-MsgGUID: 8DCeeIyERzK09m2LcRh8rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="31445068"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; 
   d="scan'208";a="31445068"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 06:58:14 -0800
X-CSE-ConnectionGUID: oheo4ddXTvCCQvkaBsd4kQ==
X-CSE-MsgGUID: tbIkm1iVS96RXkUMSNCvmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; 
   d="scan'208";a="90000215"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 06:58:10 -0800
Received: from [10.246.162.111] (jmbills-mobl1.amr.corp.intel.com [10.246.162.111])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 9383F20B5703
	for <openbmc@lists.ozlabs.org>; Tue, 19 Nov 2024 06:58:09 -0800 (PST)
Message-ID: <ffffb6dc-4102-4828-abc7-ed2be18f860b@linux.intel.com>
Date: Tue, 19 Nov 2024 07:58:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Pruning obsolete BMC devicetrees
To: openbmc@lists.ozlabs.org
References: <b386a9e98412b06b6186ee5dea81ac6a69bc4f8b.camel@codeconstruct.com.au>
 <81994aad-acc8-43f3-b29c-5f3e676760c8@linux.intel.com>
 <d3a8cfe496ea5374dfff13a938d845c8185ebb6f.camel@codeconstruct.com.au>
Content-Language: en-US
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
In-Reply-To: <d3a8cfe496ea5374dfff13a938d845c8185ebb6f.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 11/18/2024 3:32 PM, Andrew Jeffery wrote:
> On Mon, 2024-11-18 at 13:35 -0700, Bills, Jason M wrote:
>>
>>
>> On 11/10/2024 9:49 PM, Andrew Jeffery wrote:
>>>
>>>      2020-09-22 9e1cc9679776f5b9e42481d392b1550753ebd084: aspeed-
>>> bmc-intel-s2600wf.dts
>>
>> Intel no longer supports this system, so it's okay to prune the DTS.
> 
> This was a reference platform, right? How wide-spread did it get in
> practice?

This was a commercial server platform that was available for purchase, 
so I don't know how widespread it got.  However, it was only used as a 
test vehicle for OpenBMC development and wasn't officially supported 
commercially with OpenBMC-based firmware.

> 
> Andrew

