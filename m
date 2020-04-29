Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1C01BE58B
	for <lists+openbmc@lfdr.de>; Wed, 29 Apr 2020 19:42:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49C5Sv1gMPzDrCD
	for <lists+openbmc@lfdr.de>; Thu, 30 Apr 2020 03:42:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49C5Ry2QqRzDrBf
 for <openbmc@lists.ozlabs.org>; Thu, 30 Apr 2020 03:42:04 +1000 (AEST)
IronPort-SDR: NjPdq1QpKpoL29ucJ+q44HH2ZW4r+Nd/orhRx7mfBAs/hcOeqA4BWoYhpDIWhR3MUksIeo1hNG
 hm61lBXeja4g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2020 10:42:00 -0700
IronPort-SDR: IjYBbp0SHGbuPMsxGHn0LYt5MQ1muIKy2G8pRAd2sfUSfwTiGW2grJRLEVwCdPUqSCC9NGNPsj
 KJPFlUI46hEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,332,1583222400"; d="scan'208";a="294243690"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.209.71.143])
 ([10.209.71.143])
 by orsmga008.jf.intel.com with ESMTP; 29 Apr 2020 10:41:59 -0700
Subject: Re: OpenBMC 2.8 Release
To: Gunnar Mills <gmills@linux.vnet.ibm.com>,
 Kurt Taylor <kurt.r.taylor@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Bills, Jason M" <jason.m.bills@linux.intel.com>, joel@jms.id.au,
 dkodihal@linux.vnet.ibm.com
References: <CAG5Oiwj+-OnkPMc+dfeo0P=MfREPz_7E+zBaMaYy6AHMLO+BxA@mail.gmail.com>
 <f44ba049-2678-c34e-4906-5ce0b9d416d3@linux.vnet.ibm.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <98d8dfa2-f5cb-7783-544f-3c10a17799c9@linux.intel.com>
Date: Wed, 29 Apr 2020 10:41:59 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <f44ba049-2678-c34e-4906-5ce0b9d416d3@linux.vnet.ibm.com>
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

On 4/29/2020 10:00 AM, Gunnar Mills wrote:
> On 4/29/2020 10:48 AM, Kurt Taylor wrote:
>> just add it directly here:
>> https://github.com/openbmc/openbmc/wiki/Current-Release-Content
> 
> Added:
> 
>   * Yocto refresh to "Dunfell" version 3.1
>   * Redfish support for: full certificate management, complete LDAP
>     management, full sensor support, event service schema, task schema
>   * Move to Redfish Specification 1.9.0
>   * Redfish support for 2019.4 Schemas
>   * GUI enhancements: LDAP, certificate management
> 
> 
> And removed "|Redfish configuration backup and restore function|".
> James, Jason are you okay with the Redfish list above?Should we add 
> something about Storage & Drives? Anything else?

LGTM, the drive stuff I'm working on hasn't been merged yet. You might 
add MTLS as well.


> 
> Should we add something about the Kernel? "Move to 5.4"?
> 
> Anything for PLDM / MCTP? For the 2.7 release it says "Partial PLDM 
> Support" and "Partial MCTP Support".
> 
> https://github.com/openbmc/docs/blob/master/release/release-notes.md
