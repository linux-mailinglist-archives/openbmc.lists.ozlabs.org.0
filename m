Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B10B0322
	for <lists+openbmc@lfdr.de>; Wed, 11 Sep 2019 19:50:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T8Z8466GzF3qB
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 03:50:24 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T8YR0qDBzF3MT
 for <openbmc@lists.ozlabs.org>; Thu, 12 Sep 2019 03:49:46 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 205D85C09F;
 Wed, 11 Sep 2019 13:49:42 -0400 (EDT)
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: how to do large-ish IPC transfers
Message-Id: <0938D0E7-0B8A-4F34-8195-FDC8E7F7606C@fuzziesquirrel.com>
Date: Wed, 11 Sep 2019 13:49:41 -0400
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
Cc: derekh@us.ibm.com, Matt Spinler <mspinler@linux.ibm.com>,
 zshelle@linux.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi everyone

I have an application or two that need to collect and save ~ 16KiB of =20
debugging data.  The applications have various triggers but they are very=
 =20
infrequent when deployed (on the order of months/years).  In the lab it =20
would happen much more frequently.  It isn=E2=80=99t really debugging inf=
ormation =20
for the developer of the application but rather for customer service =20
personnel debugging broken components on a deployed server, after the eve=
nt =20
(and state) that caused the data to be collected.

The applications generating this data will not be the same applications =20
that publish it (the webserver), so there is a need to transfer it using =
=20
IPC.

16KiB seemed a little big for a DBus interface, and we=E2=80=99d have to =
ascii =20
encode all that into a string.  Some other ideas were:

1 - passing a file descriptor over dbus
2 - passing a file name over dbus
3 - shared memory

Are there reasons to steer clear of any of these?  Security concerns?  =20
Performance concerns?  Maintainability concerns?

Are there other choices I=E2=80=99m not thinking of?

thanks in advance!

-brad
