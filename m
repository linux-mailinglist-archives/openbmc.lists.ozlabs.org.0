Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B5E5B7693
	for <lists+openbmc@lfdr.de>; Tue, 13 Sep 2022 18:37:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRpys6nryz304J
	for <lists+openbmc@lfdr.de>; Wed, 14 Sep 2022 02:37:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZEhJVWUn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.93; helo=mga11.intel.com; envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZEhJVWUn;
	dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRpyN2qMBz2y6N
	for <openbmc@lists.ozlabs.org>; Wed, 14 Sep 2022 02:36:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663087004; x=1694623004;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=GqRVv2vlQzCKxFeS3AQObXG/6tEqWKNXVaC+vLmW4ls=;
  b=ZEhJVWUn9hiXyaAMgPr0qyvnzuMKfp27QEr0pCRj6z+UixhLodgDjB8W
   kVw+MDYgUJhwhcH68hUeGK/ZF+iNn0vOiADBJMp65OGZEH8fGtfh739bP
   opQp7poMmgambvLBQVi7KnaTKQIJoj5AFS1FfWaqxwCqKOZ3q9sbwba+A
   +SqfNb8mt/nlE+wdOzIW5inT9/5xcCppUuWgEAZ/jxMK48uaJdmhcQB3a
   J5d3n9TQO530oJTlSi7HRvU2HYf+YqZa+UDH9plDU23M+rAwoFCGS+oAZ
   ZwPm8sEDSQEm+JpQrCug1WDO9QJBAe5bcPTi8CmaGVCuVWUU2FXusM8S4
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10469"; a="295778256"
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; 
   d="scan'208";a="295778256"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2022 09:36:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; 
   d="scan'208";a="684930309"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga004.fm.intel.com with ESMTP; 13 Sep 2022 09:36:33 -0700
Received: from [10.209.153.222] (jmbills-mobl1.amr.corp.intel.com [10.209.153.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 857D5580C37
	for <openbmc@lists.ozlabs.org>; Tue, 13 Sep 2022 09:36:33 -0700 (PDT)
Message-ID: <a1293bbd-35ce-a0e2-a2c8-ccc92dff7488@linux.intel.com>
Date: Tue, 13 Sep 2022 10:36:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Is there a way to get CPU model from PECI bus
To: openbmc@lists.ozlabs.org
References: <CAJewAaJM_BJcCUDTb36DPkOXCihCS48TAwk+qxYSD+oySQx8Xw@mail.gmail.com>
Content-Language: en-US
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
In-Reply-To: <CAJewAaJM_BJcCUDTb36DPkOXCihCS48TAwk+qxYSD+oySQx8Xw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi Nikita

On 9/13/2022 8:38 AM, Nikita Pavlov wrote:
> Hi Jason,
> I use libpeci bus to get some information about CPUs. Now I can read CPU 
> family and stepping number when I use this function peci_GetCPUID.
> Is there a way to get CPU model information though PECI like this 4116 
> (Intel Xeon Silver 4116) ?

Do you mean you are looking for the processor version string?  I don't 
see anywhere that is available over PECI.

 From PECI, you get just the CPUID dword which gives the extended 
family, extended model, family, model, and stepping numbers.

If you need the version string, it looks like it may be available in the 
SMBIOS tables.  Type 4 is the Processor Information structure which 
contains a string for Processor Version that our BIOS populates with the 
processor version string.

> 
> -- 
> Best Regards,
> Nikita Pavlov
> E-mail: icepbix@gmail.com <mailto:icepbix@gmail.com>
