Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADAE97AC6
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 15:29:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46D7mw04NRzDr45
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 23:29:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46D7m02BMCzDqXY
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 23:28:47 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id C91E61542A;
 Wed, 21 Aug 2019 09:28:42 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: Re-use witherspoon-psu-monitor
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <5ae2cd44-0c3c-b960-c614-31d7920d9f05@linux.ibm.com>
Date: Wed, 21 Aug 2019 09:28:42 -0400
Message-Id: <0ED07A03-3592-4C51-8536-304616D3A7C3@fuzziesquirrel.com>
References: <l7vrab9ffh6cynjgiq6wmlqm.1565599934470@email.jadenine.com>
 <5ae2cd44-0c3c-b960-c614-31d7920d9f05@linux.ibm.com>
To: Matt Spinler <mspinler@linux.ibm.com>
X-Mailer: Apple Mail (2.3445.104.11)
Content-Transfer-Encoding: quoted-printable
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
Cc: derekh@us.ibm.com, Shawn McCarney <shawnmm@linux.vnet.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 =?utf-8?B?Ikdlb3JnZSBMaXUgKOWImOmUoeS8nyki?= <liuxiwei@inspur.com>,
 Brandon Wyman <bjwyman@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

at 2:22 PM, Matt Spinler <mspinler@linux.ibm.com> wrote:

>
>
> On 8/12/2019 3:54 AM, George Liu (=E5=88=98=E9=94=A1=E4=BC=9F) wrote:
>> Hi All,
>>
>> Recently I need to get the asset information of psu on the fp5280g2 =20
>> machine. For the downstream, I think re-use witherspoon-psu-monitor is=
 =20
>> better. but currently it`s only adapted witherspoon machine.Is it =20
>> possible to change this recipes to a general repo, so that a repo can =
be =20
>> adapted to a variety of machines for future maintenance and updates?
>
> Sounds like a good idea to me!  The only reason we put a witherspoon on=
 =20
> the repo name in  the first place was because we didn't know how others=
 =20
> would want to do PSU interaction at that time and we didn't want to =20
> presume that we should be a generic repo for it.
>
>> I have a couple of question:
>>
>> 1. For the recipes of the witherspoon-psu-monitor, could it be changed=
 =20
>> to a generic name, for example...
>
> Yea, we would definitely want to change the recipe name if we change th=
e =20
> repo name.
>
>> 2. When reading and updating the properties of the =20
>> xyz.openbmc_project.Inventory.Decorator.Asset interface via the pmbus =
=20
>> driver, could it be changed to a common configuration (eg yaml or json=
, =20
>> etc.)
>
> I'm not exactly sure what you're looking to do, but if the goal is to =20
> make it more generic, I'm all for it.  I have no problem with making =20
> things configurable.
>
>> 3. /sys/kenerl/debug/pmbus/hwmonX/XXX/... Does each file name need to =
be =20
>> unified?
>
> If you're suggesting adding some configurable way of specifying which =20
> sysfs files to read, that also sounds like a good idea.
>
>> Thanks!

I=E2=80=99ve put out a proposal to move forward on this in another thread=
 here:
https://lists.ozlabs.org/pipermail/openbmc/2019-August/017729.html

I should have just replied to this thread=E2=80=A6sorry ABT.

thx - brad
