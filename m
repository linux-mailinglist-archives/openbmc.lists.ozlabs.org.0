Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A741727647A
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 01:29:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxZCJ1M0nzDqWs
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 09:29:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxZBY2MyfzDqW7
 for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2020 09:29:07 +1000 (AEST)
IronPort-SDR: 3GYGcIcQ0WNHXTsDMhDlouDGInPopyMzQiAKbE73NVErU9I1NDBAgELP3sDL1doGAFbqb2m8io
 qowLs4riVOag==
X-IronPort-AV: E=McAfee;i="6000,8403,9753"; a="141051144"
X-IronPort-AV: E=Sophos;i="5.77,295,1596524400"; d="scan'208";a="141051144"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2020 16:29:05 -0700
IronPort-SDR: 8E1bIXpRXieZwZowWNV1JxHUzLWrbkb8KP/Om+mvFdrg2qjDungguJAvtjWI6xpKJb7pGWK/w/
 5i0n7sac9lag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,295,1596524400"; d="scan'208";a="486654211"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga005.jf.intel.com with ESMTP; 23 Sep 2020 16:29:03 -0700
Received: from [10.251.15.151] (jmbills-MOBL.amr.corp.intel.com
 [10.251.15.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id B8FC1580298
 for <openbmc@lists.ozlabs.org>; Wed, 23 Sep 2020 16:29:03 -0700 (PDT)
Subject: Re: Chassis reset
To: openbmc@lists.ozlabs.org
References: <CACWQX802HpRT20Zj2YFEnVE7XXBOJXx66-8B1E7TEZdCNwPbsQ@mail.gmail.com>
 <9EC0D657-2D58-4544-BA9E-65D3C4148A81@fb.com>
 <CACWQX80SivNLLE3gAUk+Ao=0eHf_ooezumXGmkkkVhVPFyyNSA@mail.gmail.com>
 <C6292DFD-EAF1-4658-85A7-F81941B12D5A@fb.com>
 <CACWQX83GJ9V9--5WGmVjvacYnw2=fr7URhqOcwkSq4C8GpFoiQ@mail.gmail.com>
 <F46D657F-D4DA-49BD-B78D-CDD420768728@fb.com>
 <20200923191051.GR6152@heinlein>
 <CACWQX81tyY1Wo6a8e4hnk3fvinfV-x3ogRK1q1W5cfx28tpfrw@mail.gmail.com>
 <20200923202113.GT6152@heinlein>
 <CACWQX8135vU++ztaVaaKjJyq2C=DdqDti623xGdCeT9fSJDQAA@mail.gmail.com>
 <20200923214237.GV6152@heinlein>
 <e6cbdf1e-8504-d9d5-2554-fe2d4986e54b@linux.intel.com>
 <CACWQX827ftfPo-D9gBtDm_bdp7xq71c+hkxfHRVvzVqPoSfztg@mail.gmail.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <4e78f884-a256-6ae7-fefd-ba3c6cdc0d52@linux.intel.com>
Date: Wed, 23 Sep 2020 16:29:03 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CACWQX827ftfPo-D9gBtDm_bdp7xq71c+hkxfHRVvzVqPoSfztg@mail.gmail.com>
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



On 9/23/2020 3:35 PM, Ed Tanous wrote:
> On Wed, Sep 23, 2020 at 3:01 PM Bills, Jason M
> <jason.m.bills@linux.intel.com> wrote:
>>
>>
>>
>> On 9/23/2020 2:42 PM, Patrick Williams wrote:
>>>
>>> I'm not understanding what you mean by "come up with an API to steer the
>>> Redfish..."  I think everything is specified here at a dbus level.  The
>>> issue is figuring out the appropriate Redfish model of
>>> Chassis/ComputerSystem objects (along with the included Resource.Reset
>>> types).  To a casual reader, who hasn't been involved much in Redfish
>>> implementation, the current mapping of these ResetTypes seems fairly
>>> arbitrary.
>>>
>>> With CIM there use to be these Profile documents that showed "the right
>>> way" to fit all these pieces together.  Does that not exist with
>>> Redfish?  How does any external application consume Redfish in a
>>> consistent way?
>>
>> I'm not sure it helps with the overall consistency question, but for
>> OpenBMC, we defined our mapping of Redfish ResetType values to Chassis
>> and Host State Transitions on D-Bus, here:
>> https://github.com/openbmc/docs/blob/838fa962b73deb1ef7908ee8dfa1203fa5263517/designs/state-management-and-external-interfaces.md#proposed-design.
>>
>> This is what x86-power-control aspires to match and I think what led to
>> creating new D-Bus interfaces for the chassis_system and AC power state
>> changes (since we didn't want to break this mapping).
> 
> Sounds reasonable, it just makes things slightly more complex for
> Redfish, as now there's two things that could be a redfish Chassis
> reset.  Not a huge deal.
> 
>>
>> Perhaps we need to separate the Host and Chassis on the Redfish side and
>> extend the D-Bus interfaces to support all the needed ResetTypes?
>>>
> 
> I'm not following.  There's a Host (ie ComputerSystem) and Chassis in
> redfish today.  How would we separate them further?
I meant in the table here: 
https://github.com/openbmc/docs/blob/838fa962b73deb1ef7908ee8dfa1203fa5263517/designs/state-management-and-external-interfaces.md#proposed-design.

Extend it to include both Chassis and System ResetType values and map 
them all to the correct State Transition on D-Bus.

> 
