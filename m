Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D024B0645
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 02:42:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TKk13pFXzF41D
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 10:42:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Q3tRQXAm"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="yyxlnYs5"; dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46TKjJ3lnczF3wM
 for <openbmc@lists.ozlabs.org>; Thu, 12 Sep 2019 10:42:11 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id A1EEC45A;
 Wed, 11 Sep 2019 20:42:07 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 11 Sep 2019 20:42:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm3; bh=iL2ds
 kkafA12SxfVEJEkiwwvPoQRvi0ZoL2YLX2k7Vk=; b=Q3tRQXAmNYaGDS58WWjMz
 8GdW1smAyXQun+obdDHY9ghQhq9Sjr26bElsENCX3UCMQ+Wpz+6KFizaS9TopJVH
 UiEVObzkWJxakIxhBe4D5ehka8SJNQluG3QuZ0HXGkEm0O9wFdRi7GQz/Qn1tJWJ
 axUPm7Uvttgq1z5FLX9QYkPxtO/AB+20/zXxmKb9JmV4SjccnYnZTpsIicr5mmKn
 dTe3xY/QhMypsxXXEpdAq8nKGWPTPywUEznZhpgA84V/uVnOeSokvwV5I5wFjP7F
 ThMh+/dthz4N7fCvl8mG/Fl2DXKDIy8Dv94+lq0afl6zSZeC/EF94BlzHYTEcDiZ
 w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=iL2dskkafA12SxfVEJEkiwwvPoQRvi0ZoL2YLX2k7
 Vk=; b=yyxlnYs5ZAjgr51ZAEa63AcXmoNCptgg9r4EFmli3mBN6XiQ4IgHbScKF
 haTDEvfiV7h4UfTgM0Z0O7rwQRQKuVEwhXHDS0VNrB/yydYdT9BRJLqX+pFNGCZj
 8cl+9KEiXUT1SLGttZ6KO3efv5CXxj5bNLN1JP0mMjUy9SOInAcF9bnBHP+Pu3h4
 AcrkGavMkQFMqTZCM86WKJlyktyr3QdYIS7mzaeVWU9t8CC8AMxokgrRHNTQgn17
 29lb5ddYmqqGNPOpUQ+3D0NhifDYP/ntzoZxQaFp05FYzrLdpd8b6/KX02g35iwJ
 48HMZZzSjBkdxJJq99ivcL/IKwaWA==
X-ME-Sender: <xms:XpR5XVJB5IOPvsmqqnznNIbegikAM_9PFcgGZJqEgqTRXh5dDkpQzQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrtdeggdefkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:XpR5XRG92I1IeQl04XRHsOs93cRNXc-2Ih4PbBQLfvMdC9Kc9JIE9Q>
 <xmx:XpR5XZTk0jhAQWkhSzwBZ0onJIL4WWTw-gRpAfpaBvHcPmrqwRbZBw>
 <xmx:XpR5XbWfYBiQQ_rztAe7qzl7HRhqys2cpq1Jn9Ndhktveyx0rGDD7w>
 <xmx:X5R5XfVREM5itMDwqG61_8QqNAMhC5642rpoEYchZkCaI_J8XIpu6Q>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 82808E00B1; Wed, 11 Sep 2019 20:42:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-227-g18586b54-fmstable-20190911v1
Mime-Version: 1.0
Message-Id: <a955b8ce-661f-4da9-8835-ee44903281e1@www.fastmail.com>
In-Reply-To: <20190911183102.GF45301@mauery.jf.intel.com>
References: <0938D0E7-0B8A-4F34-8195-FDC8E7F7606C@fuzziesquirrel.com>
 <20190911183102.GF45301@mauery.jf.intel.com>
Date: Thu, 12 Sep 2019 10:12:38 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Vernon Mauery" <vernon.mauery@linux.intel.com>,
 "Brad Bishop" <bradleyb@fuzziesquirrel.com>
Subject: Re: how to do large-ish IPC transfers
Content-Type: text/plain;charset=utf-8
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
Cc: derekh@us.ibm.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Matt Spinler <mspinler@linux.ibm.com>, zshelle@linux.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 12 Sep 2019, at 04:01, Vernon Mauery wrote:
> On 11-Sep-2019 01:49 PM, Brad Bishop wrote:
> > Hi everyone
> >=20
> > I have an application or two that need to collect and save ~ 16KiB o=
f
> > debugging data.  The applications have various triggers but they are=
 very
> > infrequent when deployed (on the order of months/years).  In the lab=
 it
> > would happen much more frequently.  It isn=E2=80=99t really debuggin=
g information
> > for the developer of the application but rather for customer service=

> > personnel debugging broken components on a deployed server, after th=
e event
> > (and state) that caused the data to be collected.
> >=20
> > The applications generating this data will not be the same applicati=
ons that
> > publish it (the webserver), so there is a need to transfer it using =
IPC.
> >=20
> > 16KiB seemed a little big for a DBus interface, and we=E2=80=99d hav=
e to ascii
> > encode all that into a string.  Some other ideas were:
> >=20
> > 1 - passing a file descriptor over dbus
>=20
> This would probably be the best, given our architecture. It would allo=
w,=20
> at some point in the future, to have the sender have different=20
> permissions on the file and allow access to a less-privileged process.=

>=20
> > 2 - passing a file name over dbus
> > 3 - shared memory
>=20
> Two and three could be the same (if that file is in a tmpfs). System V=
=20
> shared memory is a pain to use, so simply mmap'ing a file in tmpfs is=20=

> the easiest way to go. But both of these require permissions to align=20=

> between sender and receiver.
>=20

I agree with Vernon here on all fronts.

Andrew
