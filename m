Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C89A514CF8C
	for <lists+openbmc@lfdr.de>; Wed, 29 Jan 2020 18:22:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4879Jk1q1MzDqTM
	for <lists+openbmc@lfdr.de>; Thu, 30 Jan 2020 04:21:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4879Hy12XvzDqRC
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jan 2020 04:21:16 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jan 2020 09:21:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,378,1574150400"; d="scan'208";a="277524160"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by FMSMGA003.fm.intel.com with ESMTP; 29 Jan 2020 09:20:59 -0800
Subject: Re: Redfish OpenBMC OEM
To: Gunnar Mills <gmills@linux.vnet.ibm.com>,
 Joseph Reynolds <jrey@linux.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <bec7abfa-8a69-3c8b-7985-dccb80d5c674@linux.vnet.ibm.com>
 <dcfd49c5-48a1-12aa-2f1e-56aef6232cfc@linux.ibm.com>
 <0967abf5-7eb4-8b72-2fe7-d8d4a95ca856@linux.intel.com>
 <5e21e041-aa40-f1a1-e4eb-9aed63db368a@linux.ibm.com>
 <b2654349-f0bf-b341-5736-618dfa2c1fa9@linux.intel.com>
 <bd1c5c4f-68f7-42d4-aebd-daa6629deef5@linux.vnet.ibm.com>
 <e4ce21b1-cab9-765d-100b-5c62843468e0@linux.intel.com>
 <f5078dd7-1b7b-1b93-d1e6-b56081b55835@linux.vnet.ibm.com>
 <e869ddc9-4682-78b1-b289-6f5ad4a525dc@linux.intel.com>
 <ad43dba0-7831-e93d-b073-a6b9de737593@linux.vnet.ibm.com>
 <2b781d56-e375-96a9-c83d-87e07f0d00dd@linux.vnet.ibm.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <bdedea87-1400-7aa3-e1dc-a1c915b2cdb0@linux.intel.com>
Date: Wed, 29 Jan 2020 09:20:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <2b781d56-e375-96a9-c83d-87e07f0d00dd@linux.vnet.ibm.com>
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
Cc: jason.m.bills@linux.intel.com, apparao.puli@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> Did we engage Redfish on this one 
> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/28699 ?

Yes, from the comments:

"Was this brought up to DMTF? 
https://github.com/openbmc/bmcweb/commit/40d68ef6ebe088e4cd0078f8ff4910ca58f2be5d

I've created new thread on Redfish forum:
https://redfishforum.com/thread/273/extending-virtualmedia-schema-proposal"

> 
> Should the schema go in a different repo, and have a different review 
> process? Maybe a minimum of N contributing companies have to sign off on 
> the interface definition of a Redfish "OpenBMC" OEM? Do others have a 
> similar concern?
> 
> Thanks!
> Gunnar
> 
