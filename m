Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 588647544CF
	for <lists+openbmc@lfdr.de>; Sat, 15 Jul 2023 00:07:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Yqm4Ex5M;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R2lvH1Blhz30fS
	for <lists+openbmc@lfdr.de>; Sat, 15 Jul 2023 08:07:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Yqm4Ex5M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.100; helo=mga07.intel.com; envelope-from=jason.m.bills@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 66 seconds by postgrey-1.37 at boromir; Sat, 15 Jul 2023 08:06:33 AEST
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R2ltd2xRgz30PN
	for <openbmc@lists.ozlabs.org>; Sat, 15 Jul 2023 08:06:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689372393; x=1720908393;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=Dw3ZHOB88JdPaRkTx7o7n2VaFUc4f4H2yDcV6ii1Be0=;
  b=Yqm4Ex5M32IAVb8tY9F2+vym4WHkzVNWdnLWRj2EzvZa43lgZ4sIj1yS
   8io44kHOkqTB8jHgPK79UfVmSxDaUzFVhLrwOOHqassD44M60x39ljTIr
   i9nGMv/rViFI93S0ooy0T9u/qTR2h4j0OIrFh5amPnQbIEAamx1nr8qpg
   GbNoDzO2prTQCPFSixMisqIj1yhRjVhZDZdCIuwtbthn1HeHk31qJO6YP
   UeF2spzneCp7ykKQjtvFWWNs3k3w0/OdM3AMrdGmHKFq+q7kTTYTqLtkZ
   QNFKZdmmmyTiIu4aVTcz3KT4V9ELxmjh+Aiokl8X9r152b70BCY5llmu2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="431763967"
X-IronPort-AV: E=Sophos;i="6.01,206,1684825200"; 
   d="scan'208";a="431763967"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 15:05:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="725853473"
X-IronPort-AV: E=Sophos;i="6.01,206,1684825200"; 
   d="scan'208";a="725853473"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga007.fm.intel.com with ESMTP; 14 Jul 2023 15:05:18 -0700
Received: from [10.209.167.179] (jmbills-mobl1.amr.corp.intel.com [10.209.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 9366F580AFF
	for <openbmc@lists.ozlabs.org>; Fri, 14 Jul 2023 15:05:18 -0700 (PDT)
Message-ID: <7d5f86f9-f39a-829f-fd64-62d244c04ef4@linux.intel.com>
Date: Fri, 14 Jul 2023 16:05:17 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC] BMC RAS Feature
To: openbmc@lists.ozlabs.org
References: <07621845-19a4-0568-be0e-f556ba40b813@amd.com>
Content-Language: en-US
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
In-Reply-To: <07621845-19a4-0568-be0e-f556ba40b813@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Sorry for missing this earlier.  Here are some of my thoughts.

On 3/20/2023 11:14 PM, Supreeth Venkatesh wrote:
> 
> #### Requirements
> 
> 1. Collecting RAS/Crashdump shall be processor specific. Hence the use
>     of virtual APIs to allow override for processor specific way of
>     collecting the data.
> 2. Crash data format shall be stored in common platform error record
>     (CPER) format as per UEFI specification
>     [https://uefi.org/specs/UEFI/2.10/].

Do we have to define a single output format? Could it be made to be 
flexible with the format of the collected crash data?

> 3. Configuration parameters of the service shall be standard with scope
>     for processor specific extensions.
> 
> #### Proposed Design
> 
> When one or more processors register a fatal error condition , then an 
> interrupt is generated to the host processor.
> 
> The host processor in the failed state asserts the signal to indicate to 
> the BMC that a fatal hang has occurred. [APML_ALERT# in case of AMD 
> processor family]
> 
> BMC RAS application listens on the event [APML_ALERT# in case of AMD 
> processor family ].

The host-error-monitor application provides support for listening for 
events and taking action such as logging or triggering a crashdump that 
may meet this requirement.


One thought may be to break this up into various layers to allow for 
flexibility and standardization. For example:
1. Redfish -> provided by bmcweb which pulls from
2. D-Bus -> provided by a new service which looks for data stored by
3. processor-specific collector -> provided by separate services as 
needed and triggered by
4. platform-specific monitoring service -> provided by 
host-error-monitor or other service as needed.

Ideally, we could make 2 a generic service.

> 
> Upon detection of FATAL error event , BMC will check the status register 
> of the host processor [implementation defined method] to see
> 
> if the assertion is due to the fatal error.
> 
> Upon fatal error , BMC will attempt to harvest crash data from all 
> processors. [via the APML interface (mailbox) in case of AMD processor 
> family].
> 
> BMC will generate a single raw crashdump record and saves it in 
> non-volatile location /var/lib/bmc-ras.
> 

