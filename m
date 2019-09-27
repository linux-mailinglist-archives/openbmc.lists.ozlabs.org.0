Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EFAC0C9E
	for <lists+openbmc@lfdr.de>; Fri, 27 Sep 2019 22:29:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46g3LD57m1zDr0P
	for <lists+openbmc@lfdr.de>; Sat, 28 Sep 2019 06:29:24 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46g3KS5C1QzDqx1
 for <openbmc@lists.ozlabs.org>; Sat, 28 Sep 2019 06:28:43 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 781F113984F;
 Fri, 27 Sep 2019 16:28:39 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: witherspoon-pfault-analysis repository rename to phosphor-power
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <E413464F-B8BD-469C-8B58-432C25DEE77C@fuzziesquirrel.com>
Date: Fri, 27 Sep 2019 16:28:39 -0400
Message-Id: <4356A585-B928-4B27-B122-410AEAF8E632@fuzziesquirrel.com>
References: <E413464F-B8BD-469C-8B58-432C25DEE77C@fuzziesquirrel.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
Cc: Shawn McCarney <shawnmm@linux.vnet.ibm.com>,
 Brandon Wyman <bjwyman@gmail.com>, Matt Spinler <mspinler@gmail.com>,
 derekh@us.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

at 8:50 AM, Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:

> Today the witherspoon-pfault-analysis repo has =E2=80=9Cwitherspoon cen=
tric=E2=80=9D =20
> support for some power (as in power supply, not power processor) =20
> functions.
>
> Going forward, IBM is planning on porting this code to several more of =
=20
> our systems.  We also intend to add new features to it.  Some of our =20
> partners have expressed interest in working in this code base as well.
>
> There is nothing inherently power processor arch specific or even serve=
r =20
> specific about dealing with power.  So we=E2=80=99d welcome contributio=
ns from =20
> any collaborators from anywhere in the openbmc community.
>
> Given the above and barring any objections, we=E2=80=99d like to rename=
 this repo =20
> to phosphor-power and have it be a place to collaborate on any power =20
> related functions.
>
> thoughts/questions/concerns?
>
> thx - brad

No-one had any concerns on this so I moved on it and finally completed th=
is =20
migration today.  If anyone has any questions please reply.

thx - brad
