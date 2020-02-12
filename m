Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B87815A834
	for <lists+openbmc@lfdr.de>; Wed, 12 Feb 2020 12:46:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48HdCC18bdzDqLD
	for <lists+openbmc@lfdr.de>; Wed, 12 Feb 2020 22:46:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=wiktor.golgowski@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48HdB33KqHzDqKw
 for <openbmc@lists.ozlabs.org>; Wed, 12 Feb 2020 22:45:26 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Feb 2020 03:45:22 -0800
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; d="scan'208";a="237690023"
Received: from gklab-127-200.igk.intel.com (HELO [10.91.127.200])
 ([10.91.127.200])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 12 Feb 2020 03:45:21 -0800
Subject: Re: Enabling OpenBMC Debug
To: Joseph Reynolds <jrey@linux.ibm.com>,
 Andrew Geissler <geissonator@gmail.com>
References: <776B4FA1-4427-4FC1-802A-BC4192CA3D2E@gmail.com>
 <27a538db-96e4-f83f-6541-93e974f78ead@linux.ibm.com>
From: =?UTF-8?Q?Wiktor_Go=c5=82gowski?= <wiktor.golgowski@linux.intel.com>
Message-ID: <95ebd954-01ad-c60a-7619-d2d7a39a2a58@linux.intel.com>
Date: Wed, 12 Feb 2020 12:45:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <27a538db-96e4-f83f-6541-93e974f78ead@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 2/11/20 6:58 PM, Joseph Reynolds wrote:
> On 2/11/20 9:51 AM, Andrew Geissler wrote:
>> I find myself running a lot of different commands to enable a variety of
>> debug data on OpenBMC when debugging different issues (usually BIOS
>> communication issues). I also end up giving these commands to a lot of people
>> when recreating issues for me. Stuff like this:
>>
>> # enable debug logs in journal
>> sed -i 's/info/debug/' /lib/systemd/journald.conf.d/journald-maxlevel-policy.conf
>> systemctl restart systemd-journald.service
>>
>> # Enable BIOS communication service debug
>> sed -i 's/mboxd/mboxd -vv/' /lib/systemd/system/mboxd.service
>> sed -i 's/btbridged/btbridged --vv/' /lib/systemd/system/org.openbmc.HostIpmi.service
>> sed -i 's/ipmid/ipmid -d 0xff/'  /lib/systemd/system/phosphor-ipmi-host.service
>> sed -i 's/0/1/' /etc/default/pldmd
>> systemctl daemon-reload
>> systemctl restart mboxd.service
>> systemctl restart org.openbmc.HostIpmi.service
>> systemctl restart phosphor-ipmi-host.service
>> systemctl restart pldmd.service
>>
>> I was contemplating wrapping the above stuff in a obmcutil command so instead
>> of telling people to do all of the above (and dealing with situations when
>> those commands change), I could say something like run "obmcutil debugon".
>>
>> Any thoughts out there? Would finer granularity of the debug be useful?
>> Are there other forms of debug people would like enabled?
> 
> Thank you for the information.  I keep learning all the time.
> 
> These settings factor into service scenarios and also deployment readiness.  For example:
> - I want to turn off debug.  For example, I want a debug-off command.
> - I would want a way to validate (or at least show) these settings when testing firmware image release candidates.  For example, another obmcutil command "debug-show" which uses "grep -H" instead of "sed".
> - I would want some documentation added the BMC administrator's guide to make them aware of OpenBMC debug support.  Draft: The obmcutil command can control debug settings for a variety of the components running on the BMC.  For more information, see https://github.com/openbmc/phosphor-state-manager/blob/master/obmcutil
> 
> The obmcutil tool is a shell script, so folks can take just the pieces they need.  That is, don't be more granular at this time.

Could we consider some sort of debug hooks directory (Like /etc/obmc-debug-hooks.d/) where applications could drop in their relevant scripts? 
Or is this going too far?

- Wiktor

> 
> In summary, it seems like a good idea.  It seems like we should ask our service architects to weight in.  I'll go ask mine....
> 
> - Joseph
> 
>>
>> Andrew
> 
