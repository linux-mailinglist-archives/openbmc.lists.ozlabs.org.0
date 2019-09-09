Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 174F1AD860
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2019 13:59:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Rmtb2WnqzDqKN
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2019 21:59:51 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Rmt45kndzDqGF
 for <openbmc@lists.ozlabs.org>; Mon,  9 Sep 2019 21:59:24 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 0260F5C09F;
 Mon,  9 Sep 2019 07:59:21 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: witherspoon-pfault-analysis repository rename to phosphor-power
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <22c0f2b4-1411-5690-3d19-b0a90890e642@linux.vnet.ibm.com>
Date: Mon, 9 Sep 2019 07:59:21 -0400
Message-Id: <D7110269-FC33-4C7F-85A6-5A2B26B7FD52@fuzziesquirrel.com>
References: <E413464F-B8BD-469C-8B58-432C25DEE77C@fuzziesquirrel.com>
 <CAARXrt=SpBeZ+kcg5zjTZ2mHr7Q1YCbNLPJrqaqsBwbv8-AfDA@mail.gmail.com>
 <22c0f2b4-1411-5690-3d19-b0a90890e642@linux.vnet.ibm.com>
To: Shawn McCarney <shawnmm@linux.vnet.ibm.com>
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
Cc: derekh@us.ibm.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Matt Spinler <mspinler@gmail.com>, Brandon Wyman <bjwyman@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

at 11:39 AM, Shawn McCarney <shawnmm@linux.vnet.ibm.com> wrote:

> On 8/21/2019 9:18 PM, Lei YU wrote:
>> It's noticed that there is `phosphor-power-monitor`, is it the repo to=
 =20
>> hold the
>> previous `witherspoon-pfault-analysis`, or it is a separated one from
>> `phosphor-power`?
>
> I believe the plan is to rename 'witherspoon-pfault-analysis' to =20
> 'phosphor-power' and then remove 'phosphor-power-monitor'.  Brad is sti=
ll =20
> working through the details.

Yes this is (still) the plan.  I=E2=80=99m hoping to get this wrapped up =
this week.

-brad
