Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B68B9E9CA4
	for <lists+openbmc@lfdr.de>; Mon,  9 Dec 2024 18:09:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y6Sxv004Dz3bSx
	for <lists+openbmc@lfdr.de>; Tue, 10 Dec 2024 04:08:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733764128;
	cv=none; b=PYEGXvaUfbEXz1ebu99e3Co1RVahWHEVsG3GfrCO13tSrTudTVEpxEzDNLSMQdSSJ3Pyi/qFtRqdgbBknDTxXtNi8CbqIDUN/P3Wg4EmJWMu4xZmrctninOgbDVZASCLKSVsT2sGKljLUgJcqQ3cNpCr6PFi+nhe571mjuLJ3I/tDjLW2TKXXjSNDcRViuHGPPXcBNg3DP72mrjDmCuSOny6iSH+JXPc3wWvQAQR4uub7ymubmkAeaSmLSZpW1rNzMBOyDLX1ofYk5Fq3OlojwzREolkzy7Z8fonLSSpZgULMWWYTaE/dJSe0p1hx9w5M43y5SIOvS5Ymxe0ZtTtdg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733764128; c=relaxed/relaxed;
	bh=5yDhq5iRA0Ayf8sl3SYRWJFMPjO8+JT2+FUXDmlwOjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=OGjxm5np6hdi4jeL0FNLqsaSvXkrBlZj0R47q/obZb/1PwRD4keAwqR4NzFxg9EabBScYHZN1E2j7GE6ND7LWkZLat3YiLxFC6h3ErllCrQWF1prO82jHFQQgSwAhq3X8HQ0Jud910vim6KFksXq34LBC/pWWh9imC0Leej9nhWezbCmc/MyJ0Qk5Kfe8gAbz1j0728rktY354Z5IKmd9PltOSMswAlqcl+HgUOnAej2Jo4ZzOLwr4iHSVy3AhXoP7yjRBqvORWv6Xmf5QyodBoyj48ezQYpY+RvtctA6wOZBYBWMuFmQA1esQj3yDVYffd8wExqIkpilGmj+vIJmA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R7sRDCoo; dkim-atps=neutral; spf=none (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=jason.m.bills@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R7sRDCoo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=jason.m.bills@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y6Sxm4606z2xt7
	for <openbmc@lists.ozlabs.org>; Tue, 10 Dec 2024 04:08:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733764125; x=1765300125;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=+cdOtCPu3sYmz29/F8abPeYdM39+Cgibl2hYh+x7iuE=;
  b=R7sRDCoorP7CVBUjy5K1adjS5WPxlqDTbKLyI86DhiM8rUWmj/b2NtrW
   gnxdcKqPhNOV3tu+DnQIwfZCThS39mFhBvgnNk9oGzCTpdoHfqQP2ATy0
   XpR5963BEStqXcYgJXg+lxH1nUGXkTK3KxffTJpPZxWN7I1y9/Jn9nuXQ
   gmfe/Vu4ioeFzqW9wXf5WmrazQdg27P6M123Dh/3bfEYXt7NM9vN81b3h
   0ZU/YIS27wC8DaQz+xcuS1hU1LTVqvOEvnGp77VAP/l4Vq8DpFg4Fgy59
   8ozCh+RMUkawXUALTu2DiDAkwLi2kXxPyMASiP0Uv3YXoEGBFHFVnHiR7
   Q==;
X-CSE-ConnectionGUID: wmdSrBN3Q9qUjJcZzTecIw==
X-CSE-MsgGUID: 66ThOBzNTSCfTasIPiuDdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="51607211"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="51607211"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 09:08:39 -0800
X-CSE-ConnectionGUID: y0E8o61+TWOt+xyMwmx2lQ==
X-CSE-MsgGUID: pyWmbEgbQYuF05Ax7T4TMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="95330554"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 09:08:38 -0800
Received: from [10.124.52.198] (jmbills-mobl1.amr.corp.intel.com [10.124.52.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 1F82020B5703
	for <openbmc@lists.ozlabs.org>; Mon,  9 Dec 2024 09:08:38 -0800 (PST)
Message-ID: <8ea7caf7-2f46-4bf8-bf44-cc3061a3ebf0@linux.intel.com>
Date: Mon, 9 Dec 2024 10:08:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Help] How to debug 'sometimes the specific sensors get no
 reading after AC cycle the system' issue?
To: openbmc@lists.ozlabs.org
References: <LV8PR08MB94865788E99E0FC65AB42B119A372@LV8PR08MB9486.namprd08.prod.outlook.com>
Content-Language: en-US
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
In-Reply-To: <LV8PR08MB94865788E99E0FC65AB42B119A372@LV8PR08MB9486.namprd08.prod.outlook.com>
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



On 12/3/2024 9:44 PM, Jacky Lee (TPI) wrote:
> Hi sir,
> 
> We have an Intel Birch Stream platform, and our BMC FW developer are 
> implementing OpenBMC onto it with a DC-SCM module, the BMC chip is 
> ASPEED AST2600 and the RoT is ASPEED AST1060.
> 
> We got an issue that sometimes the specific sensors get no reading after 
> AC power cycle the system, the failure rate is about 12%, below is the 
> example log:
> 
> CPU1_PVCCA_EHV | 00h | ok | 0.1 | 0.39 Amps
> CPU1_PVCCA_EHV | 01h | ok | 0.1 | 2 Amps
> CPU1_PVCCD0 | 02h | ok | 0.1 | 0.16 Amps
> CPU1_PVCCD0 | 03h | ok | 0.1 | 2 Amps
> CPU1_PVCCFA_EHV_ | 04h | ok | 0.1 | 3.90 Amps
> CPU1_PVCCFA_EHV_ | 05h | ok | 0.1 | 29 Amps
> CPU1_PVCCINF | 06h | ok | 0.1 | 1.25 Amps
> CPU1_PVCCINF | 07h | ok | 0.1 | 17 Amps
> CPU1_PVNN | 08h | ok | 0.1 | 0.08 Amps
> CPU1_PVNN | 09h | ok | 0.1 | 1 Amps
> CPU1_VCCIN | 0Ah | ok | 0.1 | 255 Amps
> CPU2_PVCCA_EHV | 0Bh | ok | 0.1 | 0.39 Amps
> CPU2_PVCCA_EHV | 0Ch | ok | 0.1 | 2 Amps
> CPU2_PVCCD0 | 0Dh | ok | 0.1 | 0.31 Amps
> CPU2_PVCCD0 | 0Eh | ok | 0.1 | 3 Amps
> CPU2_PVCCFA_EHV_ | 0Fh | ok | 0.1 | 4.76 Amps
> CPU2_PVCCFA_EHV_ | 10h | ok | 0.1 | 26 Amps
> CPU2_PVCCINF | 11h | ok | 0.1 | 1.09 Amps
> CPU2_PVCCINF | 12h | ok | 0.1 | 15 Amps
> CPU2_PVNN | 13h | ok | 0.1 | 0.08 Amps
> CPU2_PVNN | 14h | ok | 0.1 | 1 Amps
> CPU2_VCCIN | 15h | ok | 0.1 | 255 Amps
> FAN0_INLET_PWM | 16h | ok | 0.1 | 29.79 unspecifi
> FAN0_OUTLET_PWM | 17h | ok | 0.1 | 29.79 unspecifi
> FAN1_INLET_PWM | 18h | ok | 0.1 | 29.79 unspecifi
> FAN1_OUTLET_PWM | 19h | ok | 0.1 | 29.79 unspecifi
> FAN2_INLET_PWM | 1Ah | ok | 0.1 | 29.79 unspecifi
> FAN2_OUTLET_PWM | 1Bh | ok | 0.1 | 29.79 unspecifi
> FAN3_INLET_PWM | 1Ch | ok | 0.1 | 29.79 unspecifi
> FAN3_OUTLET_PWM | 1Dh | ok | 0.1 | 29.79 unspecifi
> FAN0_INLET_TACH | 1Eh | ok | 0.1 | 5292 RPM
> FAN0_OUTLET_TACH | 1Fh | ok | 0.1 | 4508 RPM
> FAN1_INLET_TACH | 20h | ok | 0.1 | 5390 RPM
> FAN1_OUTLET_TACH | 21h | ok | 0.1 | 4508 RPM
> FAN2_INLET_TACH | 22h | ok | 0.1 | 5390 RPM
> FAN2_OUTLET_TACH | 23h | ok | 0.1 | 4606 RPM
> FAN3_INLET_TACH | 24h | ok | 0.1 | 5390 RPM
> FAN3_OUTLET_TACH | 25h | ok | 0.1 | 4606 RPM
> CPU1_PVCCA_EHV | 26h | ok | 0.1 | 0 Watts
> CPU1_PVCCA_EHV | 27h | ok | 0.1 | 0 Watts
> CPU1_PVCCFA_EHV_ | 28h | ok | 0.1 | 59 Watts
> CPU1_PVCCFA_EHV_ | 29h | ok | 0.1 | 47.20 Watts
> CPU1_PVCCINF | 2Ah | ok | 0.1 | 11.80 Watts
> CPU1_PVCCINF | 2Bh | ok | 0.1 | 11.80 Watts
> CPU1_VCCIN | 2Ch | ok | 0.1 | 82.60 Watts
> CPU1_VCCIN | 2Dh | ok | 0.1 | 70.80 Watts
> CPU2_PVCCA_EHV | 2Eh | ok | 0.1 | 0 Watts
> CPU2_PVCCA_EHV | 2Fh | ok | 0.1 | 0 Watts
> CPU2_PVCCFA_EHV_ | 30h | ok | 0.1 | 47.20 Watts
> CPU2_PVCCFA_EHV_ | 31h | ok | 0.1 | 47.20 Watts
> CPU2_PVCCINF | 32h | ok | 0.1 | 11.80 Watts
> CPU2_PVCCINF | 33h | ok | 0.1 | 11.80 Watts
> CPU2_VCCIN | 34h | ok | 0.1 | 82.60 Watts
> CPU2_VCCIN | 35h | ok | 0.1 | 70.80 Watts
> Cpu_Power_Averag | 36h | ok | 0.1 | 124 Watts
> *Cpu_Power_Averag | 37h | ns | 0.1 | No Reading*
> Cpu_Power_Cap_CP | 38h | ok | 0.1 | 0 Watts
> *Cpu_Power_Cap_CP | 39h | ns | 0.1 | No Reading*
> Dimm_Power_Avera | 3Ah | ok | 0.1 | 300 Watts
> *Dimm_Power_Avera | 3Bh | ns | 0.1 | No Reading*
> Dimm_Power_Cap_C | 3Ch | ok | 0.1 | 0 Watts
> CPU1_PVCCA_Contr | 3Eh | ok | 0.1 | 34 degrees C
> CPU1_PVCCA_EHV | 3Fh | ok | 0.1 | 34 degrees C
> CPU1_PVCCD0 | 40h | ok | 0.1 | 42 degrees C
> CPU1_PVCCFA_Cont | 41h | ok | 0.1 | 43 degrees C
> CPU1_PVCCFA_EHV_ | 42h | ok | 0.1 | 44 degrees C
> CPU1_VCCIN | 43h | ok | 0.1 | 49 degrees C
> CPU2_PVCCA_Contr | 44h | ok | 0.1 | 33 degrees C
> CPU2_PVCCA_EHV | 45h | ok | 0.1 | 33 degrees C
> CPU2_PVCCD0 | 46h | ok | 0.1 | 42 degrees C
> CPU2_PVCCFA_Cont | 47h | ok | 0.1 | 42 degrees C
> CPU2_PVCCFA_EHV_ | 48h | ok | 0.1 | 44 degrees C
> CPU2_VCCIN | 49h | ok | 0.1 | 51 degrees C
> *DIMM_A1_CPU1 | 4Ah | ns | 0.1 | No Reading*
> DIMM_A1_CPU2 | 4Bh | ok | 0.1 | 36 degrees C
> *DIMM_A2_CPU1 | 4Ch | ns | 0.1 | No Reading*
> DIMM_A2_CPU2 | 4Dh | ok | 0.1 | 36 degrees C
> DIMM_B1_CPU1 | 4Eh | ok | 0.1 | 36 degrees C
> DIMM_B1_CPU2 | 4Fh | ok | 0.1 | 36 degrees C
> DIMM_B2_CPU1 | 50h | ok | 0.1 | 36 degrees C
> DIMM_B2_CPU2 | 51h | ok | 0.1 | 36 degrees C
> DIMM_C1_CPU1 | 52h | ok | 0.1 | 35 degrees C
> DIMM_C1_CPU2 | 53h | ok | 0.1 | 36 degrees C
> DIMM_C2_CPU1 | 54h | ok | 0.1 | 35 degrees C
> DIMM_C2_CPU2 | 55h | ok | 0.1 | 36 degrees C
> DIMM_D1_CPU1 | 56h | ok | 0.1 | 34 degrees C
> DIMM_D1_CPU2 | 57h | ok | 0.1 | 36 degrees C
> DIMM_D2_CPU1 | 58h | ok | 0.1 | 34 degrees C
> DIMM_D2_CPU2 | 59h | ok | 0.1 | 36 degrees C
> DIMM_E1_CPU1 | 5Ah | ok | 0.1 | 34 degrees C
> DIMM_E1_CPU2 | 5Bh | ok | 0.1 | 35 degrees C
> DIMM_E2_CPU1 | 5Ch | ok | 0.1 | 34 degrees C
> DIMM_E2_CPU2 | 5Dh | ok | 0.1 | 35 degrees C
> DIMM_F1_CPU1 | 5Eh | ok | 0.1 | 32 degrees C
> DIMM_F1_CPU2 | 5Fh | ok | 0.1 | 34 degrees C
> DIMM_F2_CPU1 | 60h | ok | 0.1 | 32 degrees C
> DIMM_F2_CPU2 | 61h | ok | 0.1 | 34 degrees C
> DIMM_G1_CPU1 | 62h | ok | 0.1 | 37 degrees C
> DIMM_G1_CPU2 | 63h | ok | 0.1 | 35 degrees C
> DIMM_G2_CPU1 | 64h | ok | 0.1 | 37 degrees C
> DIMM_G2_CPU2 | 65h | ok | 0.1 | 35 degrees C
> DIMM_H1_CPU1 | 66h | ok | 0.1 | 37 degrees C
> DIMM_H1_CPU2 | 67h | ok | 0.1 | 35 degrees C
> DIMM_H2_CPU1 | 68h | ok | 0.1 | 37 degrees C
> DIMM_H2_CPU2 | 69h | ok | 0.1 | 35 degrees C
> DIMM_I1_CPU1 | 6Ah | ok | 0.1 | 36 degrees C
> DIMM_I1_CPU2 | 6Bh | ok | 0.1 | 35 degrees C
> DIMM_I2_CPU1 | 6Ch | ok | 0.1 | 36 degrees C
> DIMM_I2_CPU2 | 6Dh | ok | 0.1 | 35 degrees C
> DIMM_J1_CPU1 | 6Eh | ok | 0.1 | 35 degrees C
> DIMM_J1_CPU2 | 6Fh | ok | 0.1 | 35 degrees C
> DIMM_J2_CPU1 | 70h | ok | 0.1 | 35 degrees C
> DIMM_J2_CPU2 | 71h | ok | 0.1 | 35 degrees C
> DIMM_K1_CPU1 | 72h | ok | 0.1 | 35 degrees C
> DIMM_K1_CPU2 | 73h | ok | 0.1 | 34 degrees C
> DIMM_K2_CPU1 | 74h | ok | 0.1 | 35 degrees C
> DIMM_K2_CPU2 | 75h | ok | 0.1 | 34 degrees C
> DIMM_L1_CPU1 | 76h | ok | 0.1 | 35 degrees C
> DIMM_L1_CPU2 | 77h | ok | 0.1 | 34 degrees C
> DIMM_L2_CPU1 | 78h | ok | 0.1 | 35 degrees C
> DIMM_L2_CPU2 | 79h | ok | 0.1 | 34 degrees C
> DTS_CPU1 | 7Ah | ok | 0.1 | 57 degrees C
> *DTS_CPU2 | 7Bh | ns | 0.1 | No Reading*
> Die_CPU1 | 7Ch | ok | 0.1 | 57 degrees C
> *Die_CPU2 | 7Dh | ns | 0.1 | No Reading*
> T_DBB_U44 | 7Eh | ok | 0.1 | 28 degrees C
> T_DCSCMB_U91 | 7Fh | ok | 0.1 | 30 degrees C
> T_FIOB_U1 | 80h | ok | 0.1 | 30 degrees C
> T_MB_U30 | 81h | ok | 0.1 | 40 degrees C
> T_MB_U31 | 82h | ok | 0.1 | 39 degrees C
> T_MB_U32 | 83h | ok | 0.1 | 29 degrees C
> T_MB_U33 | 84h | ok | 0.1 | 29 degrees C
> T_NVME_E3S_1 | 85h | ok | 0.1 | 26.89 degrees C
> T_NVME_E3S_2 | 86h | ok | 0.1 | 26.89 degrees C
> T_NVME_E3S_3 | 87h | ok | 0.1 | 26.89 degrees C
> T_NVME_E3S_4 | 88h | ok | 0.1 | 26.89 degrees C
> T_NVME_E3S_5 | 89h | ok | 0.1 | 26.89 degrees C
> T_NVME_E3S_6 | 8Ah | ok | 0.1 | 26.89 degrees C
> T_NVME_E3S_7 | 8Bh | ok | 0.1 | 27.89 degrees C
> T_NVME_E3S_8 | 8Ch | ok | 0.1 | 27.89 degrees C
> T_NVME_M2_0 | 8Dh | ok | 0.1 | 44.82 degrees C
> T_NVME_M2_1 | 8Eh | ok | 0.1 | 45.82 degrees C
> T_PDB_U10 | 8Fh | ok | 0.1 | 41 degrees C
> T_PDB_U11 | 90h | ok | 0.1 | 41 degrees C
> CPU1_PVCCA_EHV | 91h | ok | 0.1 | 11.80 Volts
> CPU1_PVCCA_EHV | 92h | ok | 0.1 | 2 Volts
> CPU1_PVCCD0 | 93h | ok | 0.1 | 1 Volts
> CPU1_PVCCD1 | 94h | ok | 0.1 | 1 Volts
> CPU1_PVCCD | 95h | ok | 0.1 | 11.80 Volts
> CPU1_PVCCFA_EHV_ | 96h | ok | 0.1 | 11.80 Volts
> CPU1_PVCCFA_EHV_ | 97h | ok | 0.1 | 2 Volts
> CPU1_PVCCINF | 98h | ok | 0.1 | 1 Volts
> CPU1_PVNN | 99h | ok | 0.1 | 1 Volts
> CPU1_VCCIN | 9Ah | ok | 0.1 | 2 Volts
> CPU2_PVCCA_EHV | 9Bh | ok | 0.1 | 11.80 Volts
> CPU2_PVCCA_EHV | 9Ch | ok | 0.1 | 2 Volts
> CPU2_PVCCD0 | 9Dh | ok | 0.1 | 1 Volts
> CPU2_PVCCD1 | 9Eh | ok | 0.1 | 1 Volts
> CPU2_PVCCD | 9Fh | ok | 0.1 | 11.80 Volts
> CPU2_PVCCFA_EHV_ | A0h | ok | 0.1 | 11.80 Volts
> CPU2_PVCCFA_EHV_ | A1h | ok | 0.1 | 2 Volts
> CPU2_PVCCINF | A2h | ok | 0.1 | 1 Volts
> CPU2_PVNN | A3h | ok | 0.1 | 1 Volts
> CPU2_VCCIN | A4h | ok | 0.1 | 2 Volts
> V_DCSCMB_P1V05_U | A5h | ok | 0.1 | 1.05 Volts
> V_DCSCMB_P1V0 | A6h | ok | 0.1 | 1.00 Volts
> V_DCSCMB_P3V3_RG | A7h | ok | 0.1 | 3.29 Volts
> V_DCSCMB_P3V3_ST | A8h | ok | 0.1 | 3.29 Volts
> V_DCSCMB_P12V_AU | A9h | ok | 0.1 | 12.20 Volts
> V_HPM_P1V0_AUX | AAh | ok | 0.1 | 0.99 Volts
> V_HPM_P1V1_AUX | ABh | ok | 0.1 | 1.09 Volts
> V_HPM_P1V2_MAX10 | ACh | ok | 0.1 | 1.20 Volts
> V_HPM_P1V8_AUX | ADh | ok | 0.1 | 1.78 Volts
> V_HPM_P2V5_MAX10 | AEh | ok | 0.1 | 2.47 Volts
> V_HPM_P3V3 | AFh | ok | 0.1 | 3.27 Volts
> V_HPM_P3V3_AUX | B0h | ok | 0.1 | 3.27 Volts
> V_HPM_P5V_AUX | B1h | ok | 0.1 | 2.79 Volts
> V_HPM_P12V | B2h | ok | 0.1 | 12.18 Volts
> V_HPM_P12V_AUX | B3h | ok | 0.1 | 12.18 Volts
> V_HPM_P12V_STBY | B4h | ok | 0.1 | 11.92 Volts
> V_HPM_PVCC3V3_AU | B5h | ok | 0.1 | 3.27 Volts
> 
> And our EE thought that it is not a HW issue and request our BMC FW 
> developer to debug it. We have also tried to exchange both CPU1/2 
> location either the DIMM module, but the issue still goes with the slot, 
> not the CPU or DIMM itself. Also, when this issue happened, it would be 
> always happen unless you AC power cycle the system.
> 
> Because this issue only happened with AC cycle the system, it could not 
> be reproduced with DC power cycling test which the BMC FW has not to 
> reboot its firmware OS, so we think it is possible to cause by BMC 
> firmware issue, but we don't know how to debug it thru BMC firmware even 
> the console log, we need your help to provide some directions on 
> debugging it, thank you.
> 
> BTW, the OS we used on the system is Rocky Linux 9.4, and the sensor 
> list was captured from the OS thru ipmitool during the test.
> 
> Best regards,
> *Jacky Lee*

Hi Jacky,

For issues related to Intel platforms, you can directly reach out to 
your Intel support representative for assistance.

Thanks,
-Jason

> 
> 
> 2F, No.6, Sec.1, Jhongsing Rd., Wugu
> 
> Township, New Taipei 248, Taiwan (R.O.C.)
> Tel(TW): 886-2-89771415
> 
> Fax(TW): 886-2-89769773
> 
> E-mail: Jacky.Lee@flex.com <mailto:Jacky.Lee@flex.com>
> 
> Legal Disclaimer :
> The information contained in this message may be privileged and 
> confidential.
> It is intended to be read only by the individual or entity to whom it is 
> addressed
> or by their designee. If the reader of this message is not the intended 
> recipient,
> you are on notice that any distribution of this message, in any form,
> is strictly prohibited. If you have received this message in error,
> please immediately notify the sender and delete or destroy any copy of 
> this message!

