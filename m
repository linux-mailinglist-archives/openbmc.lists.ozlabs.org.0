Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A43392293
	for <lists+openbmc@lfdr.de>; Thu, 27 May 2021 00:13:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fr4vf3z5Lz2yyS
	for <lists+openbmc@lfdr.de>; Thu, 27 May 2021 08:13:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fr4vS26vXz2xgL
 for <openbmc@lists.ozlabs.org>; Thu, 27 May 2021 08:12:50 +1000 (AEST)
IronPort-SDR: QvpbTzuKpDUfEqBcsFsshRGJNVUBOiNaXR5xVwNNktTY8mYqlpApqhgxkd7CVkDwtJrAoPkqzZ
 K/F56FaR08kg==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="200696473"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="200696473"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 15:12:46 -0700
IronPort-SDR: BRHcnEgeiIYIPVau7gJ2Ixkh4njuEXOilUofj4q0hxAY8ByotT49c+w6BKYX29lCpxVKpK615d
 jiyQd4wErxKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="414642686"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga002.jf.intel.com with ESMTP; 26 May 2021 15:12:46 -0700
Received: from [10.209.101.140] (jmbills-MOBL.amr.corp.intel.com
 [10.209.101.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 5CD02580514
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 15:12:46 -0700 (PDT)
Subject: Re: [bmcweb] Device Level Logging Services
To: openbmc@lists.ozlabs.org
References: <CAHwn2XnqABuyc3uMQDs+YgwYJL+yKLwCYn1myOVdZ=gkhw3L-A@mail.gmail.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <dc3b9f0f-70d1-e403-9ab5-2c3734260240@linux.intel.com>
Date: Wed, 26 May 2021 15:12:45 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAHwn2XnqABuyc3uMQDs+YgwYJL+yKLwCYn1myOVdZ=gkhw3L-A@mail.gmail.com>
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



On 5/26/2021 1:50 PM, Willy Tu wrote:
> Hi all,
> 
> Main discussion: 
> https://lore.kernel.org/openbmc/CAHwn2XknKWyv6Bsq48tkvA52rHKZRFoEJgUuZUmMj6uZb584JQ@mail.gmail.com/ (a 
> bit outdated)
> 
> This will be a sub-thread about logging services that will be used to 
> support Drive (and could support others).
> 
> For bmcweb, I am wondering if we can support custom logging services 
> other than the static ones that we have in 
> https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/log_services.hpp.
> 
> I am thinking about supporting custom log service at a device level that 
> can be exported by different hardwares log entries that are more 
> specific. Then at each device resource can link  the Status.Condition to 
> the LogEntries.
> 
> Initial Idea,
> 
> For example, I want to have log entries for Drive devices.
> 
> ComputerSystemId could still be system or bmc and the Redfish 
> endpoint will be something like.
> 
> ```
> /redfish/v1/Systems/system/LogServices/Drive0LogService/Entries
> ```
Specifically regarding the endpoint, we have considered a similar 
approach for publishing a LogService for a memory device.  I don't know 
if we have finalized our proposal to the DMTF yet, but we were thinking 
it would be better to add a LogService to the individual resource rather 
than keep everything under Systems/system.

If the same idea is applied for your drive devices, each drive resource 
in Redfish would also contain its own LogService.

> 
> On the D-bus side, the service exporting the log can add log entry 
> <https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Logging/Entry.interface.yaml> under.
> 
> We can have
> ```
> /xyz/openbmc_project/logging/device/drive_0
> |__/xyz/openbmc_project/logging/device/drive_0/entry/...
> ```
> 
> We can parse the `xyz.openbmc_project.ObjectMapper` at 
> `/xyz/openbmc_project/logging/device` with depth of 1 to get all the new 
> device log services and so on.
> 
> Please let me know if there are any questions about it. If no one is 
> against it, I'll work on implementing it.
> 
> Best,
> 
> Willy Tu
> 
> 
> 
> 
> Best,
> 
> Willy Tu
