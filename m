Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5583B5B4159
	for <lists+openbmc@lfdr.de>; Fri,  9 Sep 2022 23:20:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPTRH280Kz3bk9
	for <lists+openbmc@lfdr.de>; Sat, 10 Sep 2022 07:20:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R1dtVExE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.120; helo=mga04.intel.com; envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R1dtVExE;
	dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPTQt4GcVz2xG8
	for <openbmc@lists.ozlabs.org>; Sat, 10 Sep 2022 07:19:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662758390; x=1694294390;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=z/6RKCE01f8qBFJc7Gn7FbxRQFyj8rIpPHlpxbTgbtM=;
  b=R1dtVExEi7pbZ8vv7Wcsh6pHhJQv7wzKe6NnvX37KnrXUt+dF7UbXKbR
   RCJSlG0EUb6kbDkDerzRvkDzKqt7HU/TJuK/lofuwdubi1Hg0ray4vjiU
   cGt4CnyFQJKQxLnws2aEAOxp36XUWgFQ61u+dpiObWUmkdulD3bpDf7cF
   6FA+G2hhQ3nMtTveYXQOKjXYVqlmdK3UnGx0/hPw8f4NlSV0aLM85AZJC
   eQbDK9HpaC6OVciJjQWLM6OMeM9wsaqjNLn5uCOD32Zb8hojq1rzwV6N3
   8rpsedHUdTqq35KH0Mbt5/96hCU+yrFPjvDVtpQO2bNQbKE7bakPwoqhS
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10465"; a="296311152"
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; 
   d="scan'208";a="296311152"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2022 14:19:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; 
   d="scan'208";a="677322522"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga008.fm.intel.com with ESMTP; 09 Sep 2022 14:19:47 -0700
Received: from [10.209.142.108] (jmbills-mobl1.amr.corp.intel.com [10.209.142.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 85349580692
	for <openbmc@lists.ozlabs.org>; Fri,  9 Sep 2022 14:19:47 -0700 (PDT)
Message-ID: <a1414f37-6d90-4a56-ac9b-089dac21f00f@linux.intel.com>
Date: Fri, 9 Sep 2022 15:19:45 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: SATA hotplug notifications for BMC inventory updates
To: openbmc@lists.ozlabs.org
References: <YxXZeFQhJWDSHSVf@home.paul.comp>
 <2cdb6ea6-fc85-9835-d410-01195148a3eb@intel.com>
 <Yxin03RwpUvVPsAy@home.paul.comp>
 <2f56b77e-a7a2-3577-c868-90fa6226f483@intel.com>
 <Yxr6OmHDrzQVSaYr@home.paul.comp>
 <89592b7f-784c-d94c-8a81-57cb49a3bcce@intel.com>
Content-Language: en-US
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
In-Reply-To: <89592b7f-784c-d94c-8a81-57cb49a3bcce@intel.com>
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



On 9/9/2022 8:12 AM, Johnathan Mantey wrote:
> 
> On 9/9/22 01:32, Paul Fertser wrote:
>> Hello Johnathan,
>>
>> On Wed, Sep 07, 2022 at 07:36:08AM -0700, Johnathan Mantey wrote:
> <snip>
>>> Paul, this question now crosses a demarcation line. As a contract
>>> worker I'm not comfortable discussing the topics you raise in that
>>> paragraph.
>> I'm not fluent in business slang so I take it you mean the feature
>> might be nice but Intel doesn't want the OpenBMC community to have
>> it. Well, too bad.
> 
> What I'm trying to convey is that as a contract worker I have access to 
> some information I may not be authorized to divulge. This is a public 
> forum, and I need to tread carefully so that I don't divulge information 
> that impacts my employment.
> 
> The starting point for this conversation was HDD insertion/removal event 
> detection.
> Which then evolved to HDD MFR/Model Num access.
> Which then evolved into RAID controllers.
> 
> It may turn out that Intel does want this feature as part of OBMC.
> It may turn out that Intel is amenable to the community implementing a 
> RAID/BMC feature.
> 
> The transition to RAID controller has initiated an investigation into 
> what Intel may be willing to enable regarding OBMC.

I have reached out to some of our RAID team internally.  They have a 
software-based management solution that they use, today, but it only 
covers NVMe-MI based drives.

I also asked about documentation that may help with this, but since they 
only support NVMe-MI, they don't have much info about SATA support.

I'd als recommend contacting your Intel support representative to ask 
about relevant documentation.

> 
> -- 
> Johnathan Mantey
> Senior Software Engineer
> *azad te**chnology partners*
> Contributing to Technology Innovation since 1992
> Phone: (503) 712-6764
> Email: johnathanx.mantey@intel.com
> 
