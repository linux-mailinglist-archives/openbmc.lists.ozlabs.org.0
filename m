Return-Path: <openbmc+bounces-1389-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDyGH0gTlmkDZwIAu9opvQ
	(envelope-from <openbmc+bounces-1389-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Wed, 18 Feb 2026 20:30:16 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 928C11590ED
	for <lists+openbmc@lfdr.de>; Wed, 18 Feb 2026 20:30:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fGRRm75SWz2xMQ;
	Thu, 19 Feb 2026 06:30:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771443012;
	cv=none; b=aQi2X5FNRUDAe1vsyQR1DeWFZGUlJjgJzfM3WjyenWoHJoxkz7r9zhtvkPXTJhurn0C/t8+NInNDCT0A4RlrAVfyVK4tJEl2C+bMs1aUakb266UrEeinEt9Rv8NPr+nMWs4fp8/ZyDecgs4lOP4ytKuhRmf1xROWYh0/eN1tjVKosDm1x+8NQoJV9L90PgtdM2XUEv3PY0IGao82DFydN6SV/bYVosW9Lc57+tr08miREIR1JBC3jrqqghj19Rar7MQTyWe+4v36Ej6iR7lt/XEWDEtCvp6JDR7VPPod4U96q1/udFa3EhnL8uLz+eaXipjJBWJ9DAz2OpSmSbh/6g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771443012; c=relaxed/relaxed;
	bh=BfeW3v6VeI1ZhNHt/aIURlNG/D/B0MsHoeB9iHPpdZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dqcKncLTj0kAtqH08Ed35w2UYGEdR04XOVwSfAWGYKi7Kr8Q06qPx9GQTk1+TLp2bLG2Z6zyoMQg+VQOY9erMSmHp/aTz3JncDExjqZ6/RtbobZvxoOSEwT3w6RRSlv1N7W2b9/ESXDREdUXNKtY6uoKsJzgLGt6EYudUuobhVvF4i9jZfahCBjv2A/QdQ457jQ1zOLCtkzKy+fzWtoJHdCTZMZoWd/zCIr4HYexIZJrOKlE/z2H/hIff/gY80SgIvLGM6DvYymIZLA6amBX+nQn6o0zb81ZB4egJng1UzU4ZDo8XCk4hZghyXz8KXBMOQC3STA2W/XZ1uHRT/LX4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZLh36y2w; dkim-atps=neutral; spf=pass (client-ip=198.175.65.11; helo=mgamail.intel.com; envelope-from=dave.hansen@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZLh36y2w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.11; helo=mgamail.intel.com; envelope-from=dave.hansen@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fGRRl5HgPz2xLv
	for <openbmc@lists.ozlabs.org>; Thu, 19 Feb 2026 06:30:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771443012; x=1802979012;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=zrFRbht4ecVfwb3Aq+wsNKWqdkQUklyJej63/BrDQOQ=;
  b=ZLh36y2w7YNJ5ZcuaRtDh56jAJeVQK21jG2h6eMEkE9oD8GITu70E9tV
   CrjWJN+i9iB4EeZOPnztAPzEGkesfj50ciVfPWp3FW3f4faMZI141D4l0
   ETtqBzjZmY2hceipKPuX5yTaNEwr9l5e+KaYFWh0x63Yvzihi8BmxA5ve
   9GvPkLLv5Ix2CLEtyIJz2MHzu5mH4kQr5DSrpwgwvlJBdIm7IZ5nf2fZF
   oh3YV9irodz95jjcuG7dTaToEcG4xsXKMzZW7rZBi6fcYC0JW6Na0CshE
   /QyrVQ1X26Ufeieafor3OxvU4m9wwXjoTWk+mb/1UwVovYU/z7MTQOIiN
   w==;
X-CSE-ConnectionGUID: 5beEBTTORFiRiTbg3Ig7Nw==
X-CSE-MsgGUID: yOCb8GV+QVyIW2gTBLH+LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="82850819"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="82850819"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 11:30:08 -0800
X-CSE-ConnectionGUID: o9IBGgdeSWayRQIFCqHHpw==
X-CSE-MsgGUID: BFA0vf5MTiqLfGBnm/DhCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="212350098"
Received: from sghuge-mobl2.amr.corp.intel.com (HELO [10.125.109.224]) ([10.125.109.224])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 11:30:07 -0800
Message-ID: <5cfea5f4-1ced-4559-8de1-4e96116536f4@intel.com>
Date: Wed, 18 Feb 2026 11:30:06 -0800
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
Subject: Re: [PATCH] peci: Remove dependency on x86 CPU variables
To: Sohil Mehta <sohil.mehta@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org
Cc: Borislav Petkov <bp@alien8.de>, Guenter Roeck <linux@roeck-us.net>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Iwona Winiarska <iwona.winiarska@intel.com>, linux-hwmon@vger.kernel.org,
 openbmc@lists.ozlabs.org, Thomas Gleixner <tglx@kernel.org>,
 Tony Luck <tony.luck@intel.com>, x86@kernel.org
References: <20260218170301.D814B556@davehans-spike.ostc.intel.com>
 <02494c50-8239-4e9d-b653-451728e5b5fc@intel.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <02494c50-8239-4e9d-b653-451728e5b5fc@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.20 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:sohil.mehta@intel.com,m:dave.hansen@linux.intel.com,m:linux-kernel@vger.kernel.org,m:bp@alien8.de,m:linux@roeck-us.net,m:hpa@zytor.com,m:mingo@redhat.com,m:iwona.winiarska@intel.com,m:linux-hwmon@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:tglx@kernel.org,m:tony.luck@intel.com,m:x86@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dave.hansen@intel.com,openbmc@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-1389-lists,openbmc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.hansen@intel.com,openbmc@lists.ozlabs.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[openbmc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 928C11590ED
X-Rspamd-Action: no action

On 2/18/26 11:26, Sohil Mehta wrote:
>> diff -puN include/linux/peci.h~peci-sanity include/linux/peci.h
>> --- a/include/linux/peci.h~peci-sanity	2026-02-18 08:19:42.371396743 -0800
>> +++ b/include/linux/peci.h	2026-02-18 08:19:42.388397383 -0800
>> @@ -72,7 +72,7 @@ static inline struct peci_controller *to
>>  struct peci_device {
>>  	struct device dev;
>>  	struct {
>> -		u32 x86_vfm;
>> +		u32 device_id;
> 
> There is a kernel-doc comment on top of this struct as well that needs
> to reflect the change.

Thanks, I'll fix it up.

>> diff -puN include/linux/peci-cpu.h~peci-sanity include/linux/peci-cpu.h
>> -#include "../../arch/x86/include/asm/intel-family.h"
>> +/*
>> + * These are in the format of and match the values of the x86
>> + * CPUID.01H:EAX[19:4]. They encode the model and family of
> 
> Can we include the extended family bits in the *comment* to say
> EAX[27:4]? I expect Family 19 (DMR) will be added soonish, which will
> make the comment stale.

Right now, all the constants are 16 bits long, that's 19:4. If a future
CPU model needs more bits, they'll make all the constants bigger and can
change the comment.

>> + * the CPU with which the driver is interfacing.
>> + *
>> + * All driver functionality is common across all CPU steppings
>> + * of a given model, so the lower 4 stepping bits are excluded
>> + * from these IDs.
>> + */
>> +#define PECI_INTEL_HASWELL_X		0x306C
>> +#define PECI_INTEL_BROADWELL_X		0x406F
>> +#define PECI_INTEL_BROADWELL_D		0x5066
>> +#define PECI_INTEL_SKYLAKE_X		0x5065
>> +#define PECI_INTEL_ICELAKE_X		0x606A
>> +#define PECI_INTEL_ICELAKE_D		0x606C
>> +#define PECI_INTEL_SAPPHIRERAPIDS_X	0x806F
>> +#define PECI_INTEL_EMERALDRAPIDS_X	0xC06F
>>  
> 
> The _D has been used in Intel official product names such as "XEON D".
> AFAIU, The _X notation is specific to intel-family.h. Should that be
> explained in the comment above?
> 
> Something like:
> 
>  *	_X	- regular server parts
>  *	_D	- micro server parts

I think I just verbatim copied the intel-family.h names and added PECI_.
Are you seeing something different.

BTW, we should probably comment the naming scheme and at least mention
that it should be consistent with the x86 code.

