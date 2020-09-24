Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6744127770E
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 18:44:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4By18g4yCCzDqgq
	for <lists+openbmc@lfdr.de>; Fri, 25 Sep 2020 02:44:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4By12g5wfLzDqfj
 for <openbmc@lists.ozlabs.org>; Fri, 25 Sep 2020 02:38:48 +1000 (AEST)
IronPort-SDR: wGjGwfL9yJhFdAUK4ca/JxneTDlA2XxAbS/GXAYUNH6Obh/yONHaEk676Qz6XaEwPQO2S25kxv
 7khJ24Gacfjw==
X-IronPort-AV: E=McAfee;i="6000,8403,9754"; a="158616872"
X-IronPort-AV: E=Sophos;i="5.77,298,1596524400"; d="scan'208";a="158616872"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2020 09:38:43 -0700
IronPort-SDR: LUB1szhS7DgiagWqrXNYDUmlVpd+jby6DEywq5gDhsQc07vTqXeTXlwBMsk/+fw2TIg4Iv6RWf
 HtHZGbovg3Ew==
X-IronPort-AV: E=Sophos;i="5.77,298,1596524400"; d="scan'208";a="305887219"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.209.117.65])
 ([10.209.117.65])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2020 09:38:43 -0700
Subject: Re: entity manager configurations and dbus interfaces
To: Ed Tanous <ed@tanous.net>, Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <20200924143036.inmugtvxkj3f6zny@thinkpad.fuzziesquirrel.com>
 <CACWQX82BLnW9joot+VmLZGydCBm2riQ88Ncq9twqyf0UJdrtNw@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <cc51f754-93d2-c2be-ba29-17ecb50ecac0@linux.intel.com>
Date: Thu, 24 Sep 2020 09:38:42 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CACWQX82BLnW9joot+VmLZGydCBm2riQ88Ncq9twqyf0UJdrtNw@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 9/24/2020 8:50 AM, Ed Tanous wrote:
> On Thu, Sep 24, 2020 at 7:30 AM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>>
>> Hi Ed
>>
>> Will quote a comment from this EM review:
>>
>> https://gerrit.openbmc-project.xyz/36702
>>
>>> entity-manager was designed with the tenant that it config files have
>>> no knowledge of dbus.
>>
>> FWIW I had no idea this was the case.
>>
>>> We've broken that a little with the inventory interfaces on the entity
>>> as a short term patch to gain some compatibility, but its easy enough
>>> to roll back in the future.
>>
>> Interesting - so there is a vision here, but I have no idea what it is.
>> Can you elaborate on how you envision inventory working if EM is not
>> implementing the inventory dbus interfaces?
> 
> In the simplest terms, one goal of entity-manager is for an engineer
> unfamiliar with OpenBMC to be able to add support for a new component,
> be it a baseboard, drive, or add in card, in less than a day.  Dbus
> APIs take more than a day to learn, so we need to find a way to
> provide a syntax that is self describing (and ideally well documented,
> but that's another issue that I'm hoping to tackle soon) as well as
> relatively isolated from the complexities of the OpenBMC core.
> 
> Another advantage of this is portability, if any wide sweeping
> architecture changes happen (ex, we rewrite the core in rust or we
> build a DBusless OpenBMC) we have a minimum definition of the things
> that are unique about the pieces of hardware we support, and don't
> have to re-engineer every piece of hardware that's in the list.
> 

While I agree with this, to fit in the current architecture, I'm not 
sure its entirely possible. We already expose some d-bus interfaces from 
the configuration files: 
https://github.com/openbmc/entity-manager/blob/0a2ab3c911d35c4c8421c47a7ce83d9341237785/configurations/WFT%20Baseboard.json#L1601. 
This particular change does add a new prescience to be able to add them 
anywhere, which I don't think should be taken lightly. However I'm not 
sure if there's any better way to support lower level assets interfaces 
such as a Fan FRU, unless you think it'd be better to add that to the 
FanSensor? I'm not sure I like that idea any better.

> 
>>
>> thx - brad
