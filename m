Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FB6E542D
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 21:18:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 470DQw2Ql7zDqtj
	for <lists+openbmc@lfdr.de>; Sat, 26 Oct 2019 06:18:00 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 470DQD4Fy8zDqs1
 for <openbmc@lists.ozlabs.org>; Sat, 26 Oct 2019 06:17:23 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 98E2E6E201;
 Fri, 25 Oct 2019 15:17:19 -0400 (EDT)
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3594.4.19\))
Subject: consolidation of *-dbus-interfaces
Message-Id: <8371D980-4DCC-42C3-9BFA-4DB7C9475D80@fuzziesquirrel.com>
Date: Fri, 25 Oct 2019 15:17:19 -0400
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
Cc: richard.marian.thomaiyar@linux.intel.com, Matt Spinler <mspinler@gmail.com>,
 Yong Li <yong.b.li@linux.intel.com>, James Feist <james.feist@linux.intel.com>,
 wak@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi everyone

I=E2=80=99ve discussed with a couple people off list the idea of =
consolidating all the dbus interfaces into a single repository.  Today =
there exist four:

phosphor-dbus-interfaces
openpower-dbus-interfaces
ibm-dbus-interfaces
intel-dbus-interfaces

The idea is that going forward all dbus interfaces would just go in =
phosphor-dbus-interfaces regardless of the namespace.  That should cut =
away a lot of complexity in the bitbake metadata and in other places as =
well.

Is there any opposition to this idea?  If anyone is worried about =
maintainer-ship, I am working on deploying the owners file plugin on our =
Gerrit install which enables kernel style ownership of different files =
depending on path, regex matches, etc.

I would guess there would be a desire to configure (as in autoconf) in =
or out different namespaces.  Am I correct in that thinking?  Any =
thoughts on how exactly that should be done?

On a somewhat related note I tried migrating phosphor-dbus-interfaces =
build to meson and failed miserably when I got to generated sdbus++ =
header file placement.  If anyone has any ideas on how to do that I=E2=80=99=
d love to hear about it.

thx -brad=
