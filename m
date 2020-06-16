Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A961FC024
	for <lists+openbmc@lfdr.de>; Tue, 16 Jun 2020 22:40:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mg7664TxzDqr5
	for <lists+openbmc@lfdr.de>; Wed, 17 Jun 2020 06:40:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mg6Q02hNzDqcJ
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jun 2020 06:39:24 +1000 (AEST)
IronPort-SDR: uaFGNEuypllpZwvwZZkP1gu3hhCMc8q2KS9VoffP0uzu75yqN06w0EDetqWI89zeEv7ydtMOy1
 LYbVx33FTFQA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2020 13:39:19 -0700
IronPort-SDR: mBcBJccFXv34L01rfbKRxWCB+iZvOYauUtgthHdWuADII7UrNqmzwQbcnYgul18mlVxPTBIMSW
 8Q2IY8KiQOIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,519,1583222400"; d="scan'208";a="273278694"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.209.49.202])
 ([10.209.49.202])
 by orsmga003.jf.intel.com with ESMTP; 16 Jun 2020 13:39:19 -0700
Subject: Re: Message registries continuation
To: Matt Spinler <mspinler@linux.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <74794819-3b3c-0c39-30e0-b2ca6c46d9fb@linux.ibm.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <85015a54-0de6-42e2-bd56-732c7f0a420d@linux.intel.com>
Date: Tue, 16 Jun 2020 13:39:18 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <74794819-3b3c-0c39-30e0-b2ca6c46d9fb@linux.ibm.com>
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

On 6/16/2020 12:47 PM, Matt Spinler wrote:
> Hi James,
> 
> Picking up the discussion again from 
> https://lists.ozlabs.org/pipermail/openbmc/2020-February/020620.html
> about reading  in message registries...
> 
> When this was left off, I believe we were leaning toward being able to 
> copy message registry JSON files
> into some target directory on the BMC during the build where bmcweb 
> would load them on startup
> and leave them in their JSON objects, and they would be pulled from 
> there when LogService requests
> were made.
> 
> This was to be able to support multiple languages, and in general just 
> to support other registries besides
> the existing OpenBMC one that is hardcoded in a header file.  (We're 
> going to have an IBM registry we
> use together with our D-Bus logs based LogService.)

There's 3 registries, fwiw: 
https://github.com/openbmc/bmcweb/tree/master/redfish-core/include/registries

> 
> An open issue we still had was if these registries had to be validated, 
> or if that was left to whoever
> made them.  A stake in the ground could be that we leave the OpenBMC 
> registry as it is in a header
> file, which negates validation, or put it in JSON too and validate just 
> that one during the build.
> Or if there are any other ideas here...

Entity-manager uses valijson, in that way you could validate them 
against a schema: https://github.com/tristanpenman/valijson. It plays 
nicely with nlohmann-json. Although if these are compiled in json files, 
I'm not sure it's a large issue. We could just create a compile-time 
script to validate.

> 
> As far as the directory used, I think that /usr/share/bmcweb/ would be 
> appropriate, or maybe
> /usr/share/bmcweb/registries/ if either of those are OK with you.

I think the directory is a good idea so it can load any json file from 
that directory. Maybe /usr/share/bmcweb/registries/<language> even to 
make it easier to switch between languages?

> 
> Also, it may be overkill to need to  read in the same registry for every 
> language, as there could
> be dozens and realistically they will never all be used on a single 
> system, but if the desire is only
> to load them at startup before the current language is known I don't 
> really see a way around it.

I think this would require a default language and a bmcweb reload if the 
language changed? Its probably ok to change languages after startup, as 
long as the default language is loaded immediately to lower the chances 
of run-time issues. As changing languages is probably a very infrequent 
operation.

> 
> Thanks!
> Matt
