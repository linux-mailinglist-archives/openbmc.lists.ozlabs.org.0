Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4702F6ACB
	for <lists+openbmc@lfdr.de>; Thu, 14 Jan 2021 20:23:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGvP50qDyzDrhh
	for <lists+openbmc@lfdr.de>; Fri, 15 Jan 2021 06:23:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGvLW4KDrzDrg8
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jan 2021 06:21:23 +1100 (AEDT)
IronPort-SDR: 0az93Jei6T4lk5jWMdCDfs1NIuX3Bwg2rjjqFw/jorDdGW6YFhx6JibssRLGc6EMtTjjLOLD6i
 p+hwLkkWA1Ug==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="175830826"
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; d="scan'208";a="175830826"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2021 09:38:07 -0800
IronPort-SDR: sZlSDJdldZrQ+7GelpbugBselpjY7QS/QJc/0tzRN2rsmiyX6a3mXupuJntWbkwABpWLFW0vut
 FfCkwWOdnDFA==
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; d="scan'208";a="352568143"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2021 09:38:07 -0800
Date: Thu, 14 Jan 2021 09:38:05 -0800
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Ed Tanous <edtanous@google.com>
Subject: Re: Intel-ipmi-oem repo
Message-ID: <20210114173805.GB45289@mauery.jf.intel.com>
References: <CAHwn2XkNiz7rZzn9RbpZCaUM8HD0HO+mJTD9D2ENc_p+SsmXHg@mail.gmail.com>
 <20210114143909.jf3vbk7zhxp3iguv@thinkpad.fuzziesquirrel.com>
 <CAH2-KxBgmEmfeQxsbTa1RPVO_nm5=G+ayZ9aDM+1hf7oRtoDGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAH2-KxBgmEmfeQxsbTa1RPVO_nm5=G+ayZ9aDM+1hf7oRtoDGA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Willy Tu <wltu@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 chunhui.jia@linux.intel.com, Brad Bishop <bradleyb@fuzziesquirrel.com>,
 apparao.puli@linux.intel.com, Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 14-Jan-2021 08:38 AM, Ed Tanous wrote:
>On Thu, Jan 14, 2021 at 6:40 AM Brad Bishop <bradleyb@fuzziesquirrel.com>
>wrote:
>
>> On Tue, Jan 12, 2021 at 06:54:14PM -0800, Willy Tu wrote:
>> >> Team,
>> >> Intel-ipmi-oem should be broken and 2 parts, genric and oem specific.=
 I
>> >see several functionality in this repo like sensors and storage commands
>> >are generic enough to be used by other platform who is using entity
>> >manager. So I feel that we should have these functionalities to be moved
>> to
>> >a separate common repo which can be used by everyone and this repo can
>> only
>> >contain Intel OEM specific IPMI command support.
>> >>
>> >> My 2 cents =F0=9F=98=8A
>> >
>> >Hi All,
>> >
>> >I guess I'll start working on this if no one has any objection to it.
>>
>> Awesome!
>>
>> >As mentioned in the beginning of the thread. The plan is to break down =
the
>> >intel-ipmi-oem repo into two parts.
>> >- True OEM at Intel
>> >- Dynamic Sensor stacks (new repo)
>>
>> Why is dynamic sensor stacks a new repo?  I would like to see this done
>> in the existing ipmid repo.  If the default implementations there today
>> are undesired, I'd be fine with seeing those moved to the
>> openpower-ipmi-oem repository.
>>
>
>I only suggested a new repo originally because today it's a separate repo,
>and the long ago patch to add it directly to ipmid got the feedback that
>was too different than the existing to go there.  If we're now ok with it
>going in IPMID, I'd prefer that as well.
>
>Would people prefer it to be a package config on IPMID to select between
>the two implementations?

I don't have a problem with a package config to select sensor=20
implementations.

>
>>
>> FWIW I would like to make use of dynamic SDR on my new systems (I work
>> for IBM) but I still have to maintain support for Witherspoon, which
>> relies on the old fixed & hardcoded sensor identifiers.

I would say that if IBM is the only company using the sensor=20
implementation that is currently in ipmid, it would be best to move it=20
to the IBM OEM layer. But it is difficult in a project this size who is=20
using what. So leaving it in ipmid for now is fine.

--Vernon
