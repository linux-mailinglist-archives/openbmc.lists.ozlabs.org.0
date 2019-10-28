Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6FDE78AC
	for <lists+openbmc@lfdr.de>; Mon, 28 Oct 2019 19:42:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4723Vs0xtNzDrdT
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2019 05:42:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=173.167.31.197;
 helo=bajor.fuzziesquirrel.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4723VG0R0YzDqYP
 for <openbmc@lists.ozlabs.org>; Tue, 29 Oct 2019 05:42:13 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id D5A2C6E201;
 Mon, 28 Oct 2019 14:42:10 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3594.4.19\))
Subject: Re: Could someone help to review bmcweb code?
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <e514cc74-ecf5-7137-cf60-3a44ce7ed298@linux.intel.com>
Date: Mon, 28 Oct 2019 14:42:10 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <D2F9CCC1-AAB3-4365-9C5A-E4764D7D099A@fuzziesquirrel.com>
References: <CALzeG+989c4bQ-JQRjCV2g_zTKgDHpByJ_G-PsasZMqsg+__Lg@mail.gmail.com>
 <a7c7c24e-4711-4890-7c1f-ea57c3a3eebc@linux.intel.com>
 <3600C284-3968-4278-84EC-C7DF39D5BC88@fuzziesquirrel.com>
 <e514cc74-ecf5-7137-cf60-3a44ce7ed298@linux.intel.com>
To: James Feist <james.feist@linux.intel.com>,
 apparao.puli@linux.intel.com
X-Mailer: Apple Mail (2.3594.4.19)
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Carol Wang <karo33bug@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Oct 28, 2019, at 2:13 PM, James Feist <james.feist@linux.intel.com> =
wrote:
>=20
> On 10/28/19 10:47 AM, Brad Bishop wrote:
>>> On Oct 28, 2019, at 1:08 PM, James Feist =
<james.feist@linux.intel.com> wrote:
>>>=20
>>> On 10/28/19 5:51 AM, Carol Wang wrote:
>>>> Hi,
>>>> I wanna know who can help to review bmcweb code? I'm not sure if =
the list of maintainers I added
>>>> is changed or not. This is the link of my coding about setting =
PowerCap. ---->
>>>> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/26223
>>>=20
>>> It looks like this patch has been -1ed for over a week,
>> Actually it got the -1 just last Wednesday.  Prior to that it had a =
+1 without any -1s for 6 days.
>=20
> It was WIP on the 17th, and +1ed on the 23rd? The same day it was =
-1ed. But we're splitting hairs.

I see that now, my bad.

> Regardless it's been -1ed for quite a few days,


> and it would make the process better if at least the things that both =
Appu and Carol agreed with were fixed.

I=E2=80=99ve not run across this expectation before.  Good to know.

> However a direct email to Appu would be good to get him to reply to =
comments.

I don=E2=80=99t do direct email and I ask my team not to as well, so =
I=E2=80=99ll do it here - Appu could you reply to Carol=E2=80=99s =
questions?

>=20
>>> generally the maintainers will not look at a patch that has been =
-1ed.
>> I don=E2=80=99t agree with this and I=E2=80=99d suggest you don=E2=80=99=
t make this your general policy.  If you do this, then you are going to =
miss reviewers giving people bad advice, which the reviewers will then =
implement at great waste of time.  I see kernel maintainers correcting =
bad advice from reviewers all the time.
>=20
> Sure, but anyone should be able to say that the advice is bad. And if =
the back and forth isn't working, then I agree that it can be escalated. =
I'm not saying it is a general rule, but most repos won't look at code =
if it is -1ed, and some wont look unless it is +1ed. I know I've been =
told many times that my code can't be merged unless someone on my team =
+1s it.

Ok - yes, I can=E2=80=99t argue with any of your logic here.

-brad=
