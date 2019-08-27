Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9180C9F19B
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2019 19:32:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Hwt06f9YzDqNH
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2019 03:32:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HwsF0tx0zDqhY
 for <openbmc@lists.ozlabs.org>; Wed, 28 Aug 2019 03:31:28 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Aug 2019 10:31:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,438,1559545200"; d="scan'208";a="355838901"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga005.jf.intel.com with ESMTP; 27 Aug 2019 10:31:25 -0700
Received: from [10.241.245.68] (unknown [10.241.245.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 0BFDE580409
 for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2019 10:31:25 -0700 (PDT)
Subject: Re: [ExternalEmail] Re: Asynchronous Event Notification support.
To: openbmc@lists.ozlabs.org
References: <ad95a67f-dbf9-450b-9cf4-38d9a595bf76@linux.vnet.ibm.com>
 <CF0228C6-5A25-452E-8849-7BCC778593FA@fb.com>
 <MWHPR13MB1360DD37BA66B55F2A1E0495EDA00@MWHPR13MB1360.namprd13.prod.outlook.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <2a89f6df-5e60-1dfb-b2d9-a8a16b194b13@linux.intel.com>
Date: Tue, 27 Aug 2019 10:31:24 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <MWHPR13MB1360DD37BA66B55F2A1E0495EDA00@MWHPR13MB1360.namprd13.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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



On 8/27/2019 12:02 AM, Troy.Lee@vertiv.com wrote:
> Hi,
> 
> As far as I know, the phosphor-sel-logger has the ability to monitor the threshold crossing which generated by phosphor-hwmon or dbus-sensors on DBus, and then it will generate redfish event log or journal log.
> 
> However, I didn't see the IPMI SEL being generated regarding to the name of the repository.
Hi Troy,

The phosphor-sel-logger will log the IPMI SEL and Redfish event to the 
journal.  Other modules are then responsible for getting the events out 
of the journal and making them available to a user.

For example in Intel systems, we use rsyslog to extract the IPMI SEL log 
entries from the journal and store them to a persisted syslog file. (See 
https://github.com/Intel-BMC/openbmc/tree/intel/meta-openbmc-mods/meta-common/recipes-extended/rsyslog.)

Then, IPMI uses the SEL entries in the syslog file to handle the SEL 
IPMI commands. (See 
https://github.com/openbmc/intel-ipmi-oem/blob/master/src/storagecommands.cpp.) 

> 
> Thanks,
> Troy Lee
> 
> -----Original Message-----
> From: openbmc <openbmc-bounces+troy.lee=vertiv.com@lists.ozlabs.org> On Behalf Of Vijay Khemka
> Sent: Tuesday, August 27, 2019 10:30 AM
> To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>; openbmc@lists.ozlabs.org; Tanous, Ed <ed.tanous@intel.com>
> Subject: [ExternalEmail] Re: Asynchronous Event Notification support.
> 
> 
> 
> ﻿On 8/25/19, 3:43 AM, "openbmc on behalf of Ratan Gupta" <openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org on behalf of ratagupt@linux.vnet.ibm.com> wrote:
> 
>      Hi All,
> 
>      Does anyone have suggestions on enabling Asynchronus Event notification
>      support for Redfish?
> Are you looking for redfish only? Are we even handling any such event in BMC Like sensor threshold crossing or any system failure etc.
> 
>      We are doing some exploration on this area and wanted to hear if someone
>      is already working on it. Will be happy to collaborate.
> 
>      Thanks,
>      Ratan
> 
> 
> 
> 
> 
> CONFIDENTIALITY NOTICE: This e-mail and any files transmitted with it are intended solely for the use of the individual or entity to whom they are addressed and may contain confidential and privileged information protected by law. If you received this e-mail in error, any review, use, dissemination, distribution, or copying of the e-mail is strictly prohibited. Please notify the sender immediately by return e-mail and delete all copies from your system.
> 
