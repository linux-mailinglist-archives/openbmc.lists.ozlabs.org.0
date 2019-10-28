Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 567B5E77D1
	for <lists+openbmc@lfdr.de>; Mon, 28 Oct 2019 18:48:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4722Hl43g7zDrhn
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2019 04:48:03 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4722H51KGjzDrcK
 for <openbmc@lists.ozlabs.org>; Tue, 29 Oct 2019 04:47:28 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 9AD416E201;
 Mon, 28 Oct 2019 13:47:23 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3594.4.19\))
Subject: Re: Could someone help to review bmcweb code?
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <a7c7c24e-4711-4890-7c1f-ea57c3a3eebc@linux.intel.com>
Date: Mon, 28 Oct 2019 13:47:23 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <3600C284-3968-4278-84EC-C7DF39D5BC88@fuzziesquirrel.com>
References: <CALzeG+989c4bQ-JQRjCV2g_zTKgDHpByJ_G-PsasZMqsg+__Lg@mail.gmail.com>
 <a7c7c24e-4711-4890-7c1f-ea57c3a3eebc@linux.intel.com>
To: James Feist <james.feist@linux.intel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, apparao.puli@linux.intel.com,
 Carol Wang <karo33bug@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


> On Oct 28, 2019, at 1:08 PM, James Feist <james.feist@linux.intel.com> =
wrote:
>=20
> On 10/28/19 5:51 AM, Carol Wang wrote:
>> Hi,
>> I wanna know who can help to review bmcweb code? I'm not sure if the =
list of maintainers I added
>> is changed or not. This is the link of my coding about setting =
PowerCap. ---->
>> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/26223
>=20
> It looks like this patch has been -1ed for over a week,

Actually it got the -1 just last Wednesday.  Prior to that it had a +1 =
without any -1s for 6 days.

> generally the maintainers will not look at a patch that has been -1ed.

I don=E2=80=99t agree with this and I=E2=80=99d suggest you don=E2=80=99t =
make this your general policy.  If you do this, then you are going to =
miss reviewers giving people bad advice, which the reviewers will then =
implement at great waste of time.  I see kernel maintainers correcting =
bad advice from reviewers all the time.

> I would work with the community to come to resolution and get some =
+1s.

Carol responded to the feedback (with questions, that remain unanswered) =
the same day it was given, 5 days ago.  I=E2=80=99d say "working with =
the community" is exactly what Carol is trying to do here.=
