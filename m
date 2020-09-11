Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 919642662AB
	for <lists+openbmc@lfdr.de>; Fri, 11 Sep 2020 17:56:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bp0k958c6zDqfD
	for <lists+openbmc@lfdr.de>; Sat, 12 Sep 2020 01:56:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bp0hs3zVdzDqfp
 for <openbmc@lists.ozlabs.org>; Sat, 12 Sep 2020 01:55:40 +1000 (AEST)
IronPort-SDR: /hQQeEmH+4hEAigzqsCLTriOiL3UPJfELTQuOQ2bNVEsNy2sY9F7JXv5RfOiVTkBLKRwHGCpRR
 4/+EDy1IeRYg==
X-IronPort-AV: E=McAfee;i="6000,8403,9741"; a="146480551"
X-IronPort-AV: E=Sophos;i="5.76,416,1592895600"; d="scan'208";a="146480551"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2020 08:55:37 -0700
IronPort-SDR: FAOtDYqZllY2L1cjWIxrTFEeGQ339WZ4emykk4hQu6LdE+GFPW/vJzFf+SsiFPSFkqw67iC7r2
 WKsLxZDfPENw==
X-IronPort-AV: E=Sophos;i="5.76,416,1592895600"; d="scan'208";a="481369550"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.209.177.192])
 ([10.209.177.192])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2020 08:55:37 -0700
Subject: Re: Storage inventory on x86
To: Andrei Kartashev <a.kartashev@yadro.com>,
 Openbmc <openbmc@lists.ozlabs.org>
References: <C24D4BAF-B185-4640-BFEF-D391E51A0A35@fb.com>
 <452FDC0B-2E4F-4AD9-97E6-DE9B2333D99B@fb.com>
 <8EE0F70D-78CB-4CDB-A51C-53FC33A2AC87@fb.com>
 <EFFBC9D1-BA53-4C61-8BC2-7F52320245F7@fb.com>
 <51C18C28-4894-4BEF-AAA6-BACE5B934B5C@fb.com>
 <AFA8029B-BBBC-41A5-9F66-671D41D0E624@fb.com>
 <675aaf18-40f6-e175-5899-3269c93ca3f5@linux.intel.com>
 <bf3645151d434adadf930030dcf40db1edc18596.camel@yadro.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <dc297f57-9fb9-0c10-93fa-31db32cb48db@linux.intel.com>
Date: Fri, 11 Sep 2020 08:55:36 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <bf3645151d434adadf930030dcf40db1edc18596.camel@yadro.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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

On 9/11/2020 2:19 AM, Andrei Kartashev wrote:
> Hi,
> 
> The question is mainly for Intel guys:
> Is there some universal way to build inventory of storage devices
> (SATA/SAS/NVMe)?
> I found that on wolfpass there is hsbp-manager who responsible for
> storage inventory, but if I get it right, there is CPLD on that
> backplane, which somehow communicate with drives and can get the basic
> information about (model, serial, etc). Can anyone point me what should
> we have in our system to implement something like this?

For model serial etc if the drives support a FRU then FRU device should 
be able to discover them assuming an smbus connection. Otherwise the 
CPLD on the HSBP that we have supports presence, so we can identify a 
drive is there, but not what model. I believe that's all we're 
supporting currently.

> I guess, storage devices are not handled by smbios-mdr daemon, because
> of hotswap requirement, and not handled by PECI, because of PECI have
> no such commands. Is there any other ways to get drive inventory
> (including RAID)?
> 
