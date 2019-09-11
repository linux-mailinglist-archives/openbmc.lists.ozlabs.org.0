Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CEAB03A6
	for <lists+openbmc@lfdr.de>; Wed, 11 Sep 2019 20:31:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T9Tm5tTYzF3tX
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 04:31:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T9T820FqzF3tN
 for <openbmc@lists.ozlabs.org>; Thu, 12 Sep 2019 04:31:06 +1000 (AEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Sep 2019 11:31:04 -0700
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; d="scan'208";a="196976222"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Sep 2019 11:31:03 -0700
Date: Wed, 11 Sep 2019 11:31:02 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: how to do large-ish IPC transfers
Message-ID: <20190911183102.GF45301@mauery.jf.intel.com>
References: <0938D0E7-0B8A-4F34-8195-FDC8E7F7606C@fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0938D0E7-0B8A-4F34-8195-FDC8E7F7606C@fuzziesquirrel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: derekh@us.ibm.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Matt Spinler <mspinler@linux.ibm.com>, zshelle@linux.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 11-Sep-2019 01:49 PM, Brad Bishop wrote:
> Hi everyone
>=20
> I have an application or two that need to collect and save ~ 16KiB of
> debugging data.  The applications have various triggers but they are very
> infrequent when deployed (on the order of months/years).  In the lab it
> would happen much more frequently.  It isn=E2=80=99t really debugging inf=
ormation
> for the developer of the application but rather for customer service
> personnel debugging broken components on a deployed server, after the eve=
nt
> (and state) that caused the data to be collected.
>=20
> The applications generating this data will not be the same applications t=
hat
> publish it (the webserver), so there is a need to transfer it using IPC.
>=20
> 16KiB seemed a little big for a DBus interface, and we=E2=80=99d have to =
ascii
> encode all that into a string.  Some other ideas were:
>=20
> 1 - passing a file descriptor over dbus

This would probably be the best, given our architecture. It would allow,=20
at some point in the future, to have the sender have different=20
permissions on the file and allow access to a less-privileged process.

> 2 - passing a file name over dbus
> 3 - shared memory

Two and three could be the same (if that file is in a tmpfs). System V=20
shared memory is a pain to use, so simply mmap'ing a file in tmpfs is=20
the easiest way to go. But both of these require permissions to align=20
between sender and receiver.

--Vernon

>=20
> Are there reasons to steer clear of any of these?  Security concerns?
> Performance concerns?  Maintainability concerns?
>=20
> Are there other choices I=E2=80=99m not thinking of?
>=20
> thanks in advance!
>=20
> -brad
