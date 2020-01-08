Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDDC134C4C
	for <lists+openbmc@lfdr.de>; Wed,  8 Jan 2020 21:05:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tKwv0WflzDqSD
	for <lists+openbmc@lfdr.de>; Thu,  9 Jan 2020 07:05:19 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tKw80vHWzDqM5
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jan 2020 07:04:39 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: Redfish Dump Service Proposal
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <ac75a152-9bdf-0029-67e8-60e4e99eb1cc@linux.intel.com>
Date: Wed, 8 Jan 2020 15:04:34 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <B3B51CCE-D255-489C-9C4C-57DB2F962B31@fuzziesquirrel.com>
References: <c31757a8-c71d-43b3-f207-426e94548065@linux.vnet.ibm.com>
 <OF3E82A637.78F050C7-ON002584CE.0025B2F4-002584CE.00271DE9@notes.na.collabserv.com>
 <CAH1kD+YfetwAmGQfjF4ytCQYhhaEorgdiA5svwjm7X91-yG1Tg@mail.gmail.com>
 <CACkAXSpCwhUwzh1uZMMkFvtkO7Tdi4xoHaq1KtaAndR8pR2gbA@mail.gmail.com>
 <ac75a152-9bdf-0029-67e8-60e4e99eb1cc@linux.intel.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>
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
Cc: devenrao@in.ibm.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ratan Gupta <ratagupt@linux.vnet.ibm.com>, dhruvaraj@in.ibm.com,
 Richard Hanley <rhanley@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Dec 13, 2019, at 3:01 PM, Bills, Jason M =
<jason.m.bills@linux.intel.com> wrote:
>=20
> I like this as well.  I'm trying to support a CPU crashdump that would =
fit perfectly with this proposal.

Hi Jason

Could you say a few words about how your crash dump service works?  =
I=E2=80=99m asking because Dhruv is working on an implementation of this =
proposal:

https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/28260

Right now it looks pretty POWER-centric but depending on how your code =
works I=E2=80=99m wondering which makes more sense:

1 - a single implementation with =E2=80=94-enable-power =E2=80=94-enable-x=
86 type configure options.

-or-

2 - two completely different implementations with the same dbus =
interfaces.

thoughts?=
