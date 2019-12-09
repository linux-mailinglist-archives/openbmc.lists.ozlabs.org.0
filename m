Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D66116D0C
	for <lists+openbmc@lfdr.de>; Mon,  9 Dec 2019 13:23:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Wj643YZzzDqFt
	for <lists+openbmc@lfdr.de>; Mon,  9 Dec 2019 23:23:40 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Wj4Q2GpnzDqLX
 for <openbmc@lists.ozlabs.org>; Mon,  9 Dec 2019 23:22:12 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: To add a new interface for timed power on feature
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAARXrtmNP3upYusBU6quTcfkU_Po3QvcM-SD=D7v0JKJGWzUXA@mail.gmail.com>
Date: Mon, 9 Dec 2019 07:22:07 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <14F75671-F93C-41EB-A879-4E44C6F24F71@fuzziesquirrel.com>
References: <CAARXrtmNP3upYusBU6quTcfkU_Po3QvcM-SD=D7v0JKJGWzUXA@mail.gmail.com>
To: Lei YU <mine260309@gmail.com>
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



> On Dec 9, 2019, at 4:49 AM, Lei YU <mine260309@gmail.com> wrote:
>=20
> This email is to introduce a new interface to be added to
> phosphor-dbus-interfaces, and ask for feedback where it should be
> placed into.
>=20
> There is a feature Timed-Power-On (TPO), that host could schedule a
> timer to BMC to power on the host.
> For BMC there will be a service to handle the above case, and the plan
> is to add a new interface to represent the timer (actually a date) for
> TPO.
>=20
> It could look like:
> /org/open_power/TimedPowerOn/Epoch.interface.yaml
> Where it defines the epoch time when the host is going to be powered =
on.
>=20
> The question is, is this feature common for other systems?
> If yes, I would like to put it in `/xyz/openbmc_project`, instead of
> `/org/open_power`

It is just an interface, and one that doesn=E2=80=99t have anything to =
do with POWER hardware, so I don=E2=80=99t see a problem with putting it =
in the xyz namespace.  Do you already have an implementation plan?

thx - brad=
