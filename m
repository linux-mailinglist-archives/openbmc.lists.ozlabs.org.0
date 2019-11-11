Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CE5F8060
	for <lists+openbmc@lfdr.de>; Mon, 11 Nov 2019 20:44:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47BhCH1fQ9zF3QW
	for <lists+openbmc@lfdr.de>; Tue, 12 Nov 2019 06:44:11 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47BhBY2pGwzF35y
 for <openbmc@lists.ozlabs.org>; Tue, 12 Nov 2019 06:43:33 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 083C0166D31;
 Mon, 11 Nov 2019 14:43:30 -0500 (EST)
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: entity-manager: adding additional fru formats to fru-device
Message-Id: <80AD98E1-20D5-4ADD-ADD2-6901A3B77A43@fuzziesquirrel.com>
Date: Mon, 11 Nov 2019 14:43:29 -0500
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

Hi James

At the OSFC we chatted a little bit about adding support for other fru =
data formats to fru-device.  I=E2=80=99d like to get started on that.

For background and reference at IBM we call this sort of data =E2=80=9Cvit=
al product data=E2=80=9D or VPD.  Just so we are all on the same page =
this is the same stuff as IPMI FRU format data, just a different data =
structure.

When I look at fru-device in the context of adding support for =
additional data formats, the necessary interface seems to just be a set =
of key value pairs.  We already have an application that produces =
exactly that here: https://github.com/openbmc/openpower-vpd-parser

Do you have any thoughts on how you=E2=80=99d like that code brought =
into EM to the end of supporting the IBM FRU format?  My initial stab =
without any direction from you would be to:

1 - factor (shared) library logic out from application logic in =
openpower-vpd-parser
2a - update fru-device to try multiple formats instead of just IPMI when =
scanning eeproms
2b - add the option to remove support for ipmi or open power fru format =
parsers
3a - when power format parsing is enabled, link to new =
openpower-vpd-parser shared library
3b - when ipmi format parsing is enabled, link to existing code (static, =
not shared)

thx!

-brad=
