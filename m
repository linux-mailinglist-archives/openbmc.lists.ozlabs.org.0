Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEF41628BC
	for <lists+openbmc@lfdr.de>; Tue, 18 Feb 2020 15:43:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MNrB3kBszDqnp
	for <lists+openbmc@lfdr.de>; Wed, 19 Feb 2020 01:43:06 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MNnl2xfGzDqkJ
 for <openbmc@lists.ozlabs.org>; Wed, 19 Feb 2020 01:40:57 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: Request for Feedback :: Time Mode setting in timemanager
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <68732B2D-EB7D-418A-86D9-3095223A31FB@linux.vnet.ibm.com>
Date: Tue, 18 Feb 2020 09:40:53 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <5B7FD9A0-8A4A-4BCC-9BC5-77B5DEBCDD00@fuzziesquirrel.com>
References: <68732B2D-EB7D-418A-86D9-3095223A31FB@linux.vnet.ibm.com>
To: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Feb 18, 2020, at 7:56 AM, Vishwanatha Subbanna =
<vishwa@linux.vnet.ibm.com> wrote:
>=20
> Hello,
>=20
> Sending this email requesting feedback on one of the feature that we =
currently have in phosphor-timemanager.
>=20
> Time manager uses TimeMode setting and can have either [NTP] or =
[Manual] as the valid options and are provided via =
xyz/openbmc_projects/settings/ for external users.
>=20
> When the system power is off and BMC is in ready state, any changes to =
these settings are readily consumed by time manager daemon.
>=20
> However, if the user changes the setting when the Host is booting, =
timemanager puts them in deferred state. Meaning, timemanager does not =
take the settings into effect until the Host is powered off.

Can you elaborate on why it does this?

>=20
> So, if someone wants to move from [Manual] to [NTP] or vice-versa, =
when the Host is [On], they need to [power-off] the Host and power it =
back on.

This seems less than ideal?  Would you agree?

>=20
> This design was chosen because we wanted to give priority to Host.

What does it mean to give priority to the Host?  Are you trying to hide =
time changes in the time from the host?  Why?

> Some of us are asking me if we can make a change to take the setting =
changes in effect immediately, not caring the state of the Host.

Without additional background this is what seems intuitive to me.

>=20
> Please could you help with your thoughts on this ?.. What is the =
Industry norm on this ?

FWIW on our (IBM) system designs we usually hook an RTC up to the BMC, =
and any host software needing a RTC has to get it via some in-band =
software interface.  I think I heard somewhere though that often in =
other systems designs the RTC is connected to the host processors and =
the BMC doesn=E2=80=99t have access to it.=
