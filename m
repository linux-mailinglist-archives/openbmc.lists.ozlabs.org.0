Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7223324A619
	for <lists+openbmc@lfdr.de>; Wed, 19 Aug 2020 20:39:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWxQj3FkQzDqxc
	for <lists+openbmc@lfdr.de>; Thu, 20 Aug 2020 04:39:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWxPr4YmZzDqX0
 for <openbmc@lists.ozlabs.org>; Thu, 20 Aug 2020 04:38:55 +1000 (AEST)
IronPort-SDR: KgFy2OQtf1svwBH9yxE3cr6m5ryZgdgwqLbIqvwoaHhuoUJOiiqPLAtpMWTTuZWvjd20vd89CY
 0tSsz1wOySZg==
X-IronPort-AV: E=McAfee;i="6000,8403,9718"; a="142996645"
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; d="scan'208";a="142996645"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2020 11:38:52 -0700
IronPort-SDR: 7gm/otuLmaxPaL4ymIq4bdZsWn5aVmyNBsrNSANrJXHJoba4jDYJnmObbQ4qr0ASqkWBddI6d7
 EZZ0j2/iKDHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; d="scan'208";a="320580096"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga004.fm.intel.com with ESMTP; 19 Aug 2020 11:38:52 -0700
Received: from [10.212.21.160] (jmbills-mobl.amr.corp.intel.com
 [10.212.21.160])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id CD2F558081E
 for <openbmc@lists.ozlabs.org>; Wed, 19 Aug 2020 11:38:51 -0700 (PDT)
Subject: Re: Generate Crashdump log via Redfish
To: openbmc@lists.ozlabs.org
References: <CAB2jT4Yt5=biGEiOWYEdzix7ydc3XH8JcTs7VPoHdec+JhYVrw@mail.gmail.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <439e92d3-a9ae-8bf7-7edf-b9401dedea49@linux.intel.com>
Date: Wed, 19 Aug 2020 11:38:50 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAB2jT4Yt5=biGEiOWYEdzix7ydc3XH8JcTs7VPoHdec+JhYVrw@mail.gmail.com>
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



On 8/14/2020 7:02 AM, Venkata Chalapathy wrote:
> Hi Everyone,
> 
> I’m looking for guidance on generating a crashdump log via the Redfish 
> interface. There are two actions available to the user to generate the 
> dump – OnDemand and SendRawPeci. But I’m not aware of the payload data I 
> need to be sending along with the request to generate the dump in either 
> of the cases. Could you please share the payload that I need to attach 
> to the request.
> 
> "#Crashdump.OnDemand": {
> 
> "target": 
> "/redfish/v1/Systems/system/LogServices/Crashdump/Actions/Oem/Crashdump.OnDemand"
> 
>        },
This is the OEM action to trigger the Intel crashdump application. 
There is no payload required for this action.

It's on my list to move this to the new standard dump service "Create" 
action when it's finalized.

> 
> "#Crashdump.SendRawPeci": {
> 
> "target": 
> "/redfish/v1/Systems/system/LogServices/Crashdump/Actions/Oem/Crashdump.SendRawPeci"
> 
PECI is a communication protocol for BMC on Intel processors.  This is 
an OEM action to send a PECI command to the CPU.  The payload is a 
single "PECICommands" JSON object that is a double array of bytes where 
each row is a raw PECI command.
{
     "PECICommands": [[48, 5, 9, 161, 0, 0, 0, 0],
                      [48, 5, 9, 161, 0, 0, 4, 0]]
}

We had proposed a standard Processor commands resource but the DMTF 
rejected it and proposed we keep this as OEM.  We're still working out 
how to handle it, but I'd like to make this standard as well.

> Best Regards,
> 
> Venka
> 
