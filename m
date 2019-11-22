Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3170E10742E
	for <lists+openbmc@lfdr.de>; Fri, 22 Nov 2019 15:44:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47KK2R1Sr0zDrJv
	for <lists+openbmc@lfdr.de>; Sat, 23 Nov 2019 01:44:31 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47KJzq6lS5zDrJY
 for <openbmc@lists.ozlabs.org>; Sat, 23 Nov 2019 01:42:13 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 973C154C;
 Fri, 22 Nov 2019 09:42:08 -0500 (EST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: consolidation of *-dbus-interfaces
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <9bffebe0-601c-1b4e-d40b-4f55fd68ac76@linux.ibm.com>
Date: Fri, 22 Nov 2019 09:42:08 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <F7A6B208-1675-4529-AD61-5E85CEF61405@fuzziesquirrel.com>
References: <8371D980-4DCC-42C3-9BFA-4DB7C9475D80@fuzziesquirrel.com>
 <CAARXrt=UOQiyKdzUHkuLXqh+3oB7c=wq6UtvWaLVmz8v8WAfzg@mail.gmail.com>
 <9bffebe0-601c-1b4e-d40b-4f55fd68ac76@linux.ibm.com>
To: Matt Spinler <mspinler@linux.ibm.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Matt Spinler <mspinler@gmail.com>, Yong Li <yong.b.li@linux.intel.com>,
 "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>, William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Nov 19, 2019, at 10:33 AM, Matt Spinler <mspinler@linux.ibm.com> =
wrote:
>=20
> I took a crack at this with =
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/27=
380.
> Please take a look.

This looks great to me Matt, thanks for doing this.  Now if someone =
could just figure out how to move this over to meson...

> Next I will try to build an image that uses meta-openpower using it =
instead of openpower-dbus-interfaces.

One concern I have is the dual maint of the interfaces while the =
transition is in progress.  Should we hold off on merging your first =
change (the one you linked to above) until you are closer to getting a =
full image build working with the consolidated repo?

thx - brad=
