Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC64F80BE
	for <lists+openbmc@lfdr.de>; Mon, 11 Nov 2019 21:00:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47BhYg006TzF47j
	for <lists+openbmc@lfdr.de>; Tue, 12 Nov 2019 07:00:06 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47BhXs1Tr4zF3w8
 for <openbmc@lists.ozlabs.org>; Tue, 12 Nov 2019 06:59:24 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id A1B4C166D31;
 Mon, 11 Nov 2019 14:59:20 -0500 (EST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: entity-manager: adding additional fru formats to fru-device
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <120a78a0-1801-facf-040b-346471c37b70@linux.intel.com>
Date: Mon, 11 Nov 2019 14:59:20 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <D4FB1F4C-C279-47B5-A55B-108D7186A1C3@fuzziesquirrel.com>
References: <80AD98E1-20D5-4ADD-ADD2-6901A3B77A43@fuzziesquirrel.com>
 <120a78a0-1801-facf-040b-346471c37b70@linux.intel.com>
To: James Feist <james.feist@linux.intel.com>
X-Mailer: Apple Mail (2.3601.0.10)
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



> On Nov 11, 2019, at 2:48 PM, James Feist <james.feist@linux.intel.com> =
wrote:
>=20
> On 11/11/19 11:43 AM, Brad Bishop wrote:
>> Hi James
>> At the OSFC we chatted a little bit about adding support for other =
fru data formats to fru-device.  I=E2=80=99d like to get started on =
that.
>> For background and reference at IBM we call this sort of data =
=E2=80=9Cvital product data=E2=80=9D or VPD.  Just so we are all on the =
same page this is the same stuff as IPMI FRU format data, just a =
different data structure.
>> When I look at fru-device in the context of adding support for =
additional data formats, the necessary interface seems to just be a set =
of key value pairs.  We already have an application that produces =
exactly that here: https://github.com/openbmc/openpower-vpd-parser
>=20
> If you already have that, then there should be no reason for you to =
need to use fru-device.

This application doesn=E2=80=99t do any discovery on its own.  It relies =
on udev to launch it.  Further it doesn=E2=80=99t create any dbus =
objects it just calls phosphor-inventory-manager and then exits.

> Entity-Manager probes dbus, so as long as there is key-value pairs, =
you should be able to make your probe
> 'xyz.openbmc_project.MyInterface('KeyICareAbout':'ExpectedValue'). If =
this application can already do discovery,

It doesn=E2=80=99t do discovery.  It has a filename-to-parse command =
line argument.

> I don't think you need fru-device.  This might actually be a good =
excuse to pull fru-device out of the entity-manager repo, having them =
together makes it seem too much like they depend on each-other, which =
they don=E2=80=99t.

I think you are suggesting I simply add the discovery logic to =
openpower-vpd-parser, and change it from a short lived one shot =
application to a long running daemon?

That would certainly work but I wouldn=E2=80=99t mind re-using all the =
discovery logic in fru-device, since at the end of the day everything is =
exactly the same except the data structure in the eeprom.

thx -brad=
