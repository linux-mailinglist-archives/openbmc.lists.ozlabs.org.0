Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 200F393A77F
	for <lists+openbmc@lfdr.de>; Tue, 23 Jul 2024 20:56:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=irRp4TgB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WT5w50ZsZz3cML
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2024 04:56:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=irRp4TgB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=jason.m.bills@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WT5vV5zYvz30VM
	for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2024 04:55:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721760952; x=1753296952;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=KjlXzn+NYEFfxn2uKbbk3XqOEk71l/2v89Ktdbjxe+k=;
  b=irRp4TgBUnz/td2aYkdYfKRzlS6UhX5pn7wOL9LRtraEOP8FH0cjjjBE
   ByDhxp5gizFoz9DfIsudQyWJIwzyvpmsdXvX8NFDVbZz6Gpigmk5MVIBV
   PkbYylqHZxyE/sMU0+sOMsLtGx7vt/bt9XaX2ntdpgGA8dMi3JAJpM6qI
   9ZUsYiqpGPJg8PbrkY0oDr/aflhl4AOmfj9K9pCVr9lz5hKo2hy83WgDC
   FqFZtpt3PpI0EeDwioAE4VkWpxrOuQHv5b2zk2fW1aJ0mCW5llT8Vj1Tp
   Xfnh0P4ctfZ0D9vXH4AKERV9TVVVRrx79MSIiJTpL3yK6igm+F04MtWYk
   w==;
X-CSE-ConnectionGUID: eRLGcBSDSiGi43NXomHziA==
X-CSE-MsgGUID: F5n2EuHZRmyR0xx/QbIKLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="23214447"
X-IronPort-AV: E=Sophos;i="6.09,231,1716274800"; 
   d="scan'208";a="23214447"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2024 11:55:15 -0700
X-CSE-ConnectionGUID: 6yKXyue5RH+a5J/DqVCewQ==
X-CSE-MsgGUID: fERJubgWRmeZo3BswqcpAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,231,1716274800"; 
   d="scan'208";a="52048069"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2024 11:55:14 -0700
Received: from [10.124.0.23] (jmbills-mobl1.amr.corp.intel.com [10.124.0.23])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id BBD2520CFEE1
	for <openbmc@lists.ozlabs.org>; Tue, 23 Jul 2024 11:55:13 -0700 (PDT)
Message-ID: <27726d0a-66af-428c-a5c8-b56d98bad48e@linux.intel.com>
Date: Tue, 23 Jul 2024 12:55:12 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Help with GPIO event in SEL
To: openbmc@lists.ozlabs.org
References: <MA1PR01MB43083D43E820E2980F2102C880AE2@MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM>
Content-Language: en-US
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
In-Reply-To: <MA1PR01MB43083D43E820E2980F2102C880AE2@MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM>
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



On 7/20/2024 3:52 AM, Bala Subramaniyan wrote:
> Hi all,
> 
> I'm currently working with Hard and Software Tamper events where i need 
> to log the GPIO events to SEL in both IPMI and REDFISH.
> 
> I have configured Temperature, Fan, PWM and ADC to SEL through Entity 
> Manager and by creating IPMI and REDFISH template in rsyslog.
> 
> Kindly guide me in logging GPIO events to SEL.
> 

If you already have this working for other types of events, then the 
approach will be similar, but you will need to find or define the new 
event type.

For Redfish, this will be a new message in the Registry.  You can look 
in the existing Registries to see if an appropriate Message is already 
defined: 
https://github.com/openbmc/bmcweb/blob/master/redfish-core/include/registries/base_message_registry.hpp.

For IPMI, I'm less familiar.  You may need to define a new discrete 
sensor for your Tamper events that you can assert/de-assert.  However, I 
don't remember if anyone has added support for discrete sensor events in 
IPMI yet, so that may be a bigger change.

> 
> 
> *Thanks, and regards,*
> *Bala Subramaniyan M,*
> 
> 
> <https://www.ltts.com/>
> 
> 
> S1 Building, L&T Tech Park, Bellary Road,
> 
> Next to Raintree Boulevard, Park View Layout,
> 
> Byatarayanapura, Bengaluru-560092
> 
> Mobile: +91 9677035467
> 
> ENGINEERING*THE CHANGE*| www.LTTS.com <https://www.ltts.com/>
> 
> *L&T Technology Services Ltd*
> 
> www.LTTS.com
> 
> L&T Technology Services Limited (LTTS) is committed to safeguard your 
> privacy. Read the appropriate privacy notice 
> <https://www.ltts.com/privacy-policies-notices> applicable to you to 
> know more about how LTTS collects, uses and stores your personal data. 
> Please visit our privacy policy 
> <https://www.ltts.com/data-privacy-policy> available on our website 
> www.Ltts.com for more information about our commitment towards data 
> privacy under applicable data protection laws. This email may contain 
> confidential or privileged information for the intended recipient(s). If 
> you are not the intended recipient, please do not use or disseminate the 
> information, notify the sender and delete it from your system.
> 
