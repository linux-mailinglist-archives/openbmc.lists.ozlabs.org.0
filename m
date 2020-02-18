Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 626D2163058
	for <lists+openbmc@lfdr.de>; Tue, 18 Feb 2020 20:40:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MWRb1xfHzDqM4
	for <lists+openbmc@lfdr.de>; Wed, 19 Feb 2020 06:40:43 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MWFG6YFwzDqfH
 for <openbmc@lists.ozlabs.org>; Wed, 19 Feb 2020 06:31:45 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: thoughts on vim modelines
Message-Id: <9DA30018-DE7D-4F21-A5C6-9BE3E0896946@fuzziesquirrel.com>
Date: Tue, 18 Feb 2020 14:31:41 -0500
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello everyone.  I recently put up a patch that removes the vim =
modelines from the yaml files in phosphor-dbus-interfaces.  I wanted to =
quickly describe my rationale for doing that.

As the maintainer of phosphor-dbus-interfaces I want to provide a =
neutral developer and contributor experience that is not preferential to =
any specific usage pattern, workflow, tool, or in this case, text =
editor.

It is my opinion that this mode of thinking can only foster additional =
goodwill and engagement and it is further my opinion that if one fails =
to subscribe to this mode of thinking, that will drive potential =
collaborators elsewhere (e.g. a fork).  So if you are a project =
maintainer - I encourage you to subscribe to this type of thinking as =
well.

If anyone has the time to kick off a =E2=80=9Cbest practices for =
maintainers=E2=80=9D document I think that would be very welcome and =
valued contribution to the OpenBMC community.

A final thought - I have long been an advocate of maintainer discretion. =
 A natural reaction to the above might be that we should adopt a global =
OpenBMC policy of "no vim modelines."  I have no desire to do adopt any =
such overreaching mandates - I would prefer instead to let =E2=80=9Cnatura=
l selection=E2=80=9D weed out projects with maintainers that stray too =
far from norms.

thx - brad=
