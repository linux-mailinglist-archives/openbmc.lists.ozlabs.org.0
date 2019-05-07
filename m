Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D574156F1
	for <lists+openbmc@lfdr.de>; Tue,  7 May 2019 02:30:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44ygVR2pYPzDqM4
	for <lists+openbmc@lfdr.de>; Tue,  7 May 2019 10:30:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lenovo.com
 (client-ip=67.219.246.210; helo=mail1.bemta23.messagelabs.com;
 envelope-from=skochar@lenovo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
 [67.219.246.210])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ygTN6WF6zDqHw
 for <openbmc@lists.ozlabs.org>; Tue,  7 May 2019 10:29:11 +1000 (AEST)
Received: from [67.219.247.54] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-3.bemta.az-d.us-east-1.aws.symcld.net id 11/94-19550-451D0DC5;
 Tue, 07 May 2019 00:29:08 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrPIsWRWlGSWpSXmKPExsWSLveKXTf44oU
 Yg8MbjC1OtbxgcWD0OD9jIWMAYxRrZl5SfkUCa0bXq0/MBXuEKz7MXcnYwPiPv4uRi0NIYAmT
 xJWm1awQzhpGickLFzB1MXJysAloSKx+dIcZxBYRsJRY8qCdrYuRg0NYwEzizzZ7iLC5xJd3y
 6BK9CRu3Z8E1soioCKxq/c5I4jNK+AkcbhzNVicUUBM4vupNWA2s4C4xK0n88FsCQEBiSV7zj
 ND2KISLx//Y4WwFSTmtj1hhqjXkViw+xMbhK0tsWzha2aI+YISJ2c+YZnAKDgLydhZSFpmIWm
 ZhaRlASPLKkbzpKLM9IyS3MTMHF1DAwNdQ0MjIK1raGakl1ilm6JXWqybmlhcomuol1herFdc
 mZuck6KXl1qyiREY7CkFXIt2ML5bmn6IUZKDSUmUt3z+hRghvqT8lMqMxOKM+KLSnNTiQ4wyH
 BxKErxc54FygkWp6akVaZk5wLiDSUtw8CiJ8D45B5TmLS5IzC3OTIdInWI05jiw6OFcZo57B5
 /PZRZiycvPS5US590FMkkApDSjNA9uECwdXGKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzPs
 RZCFPZl4J3L5XQKcwAZ0yr+McyCkliQgpqQZG40MLEriLUnZc+tERym+ceib5tOuTHVpnDh39
 9mC/2fzWkkMs80Miq/WPbJn5Ordvosb3ox6PpCWsI6QXNRq8TW6UXSeW4LlC4F9NVciOFjmO2
 2FNubZHb67OXhMyZQFf6pSlNee48pc7xVb/XyHJX/bgrJFDqmf6j9z1lUkK65/wTZ6qvbVaia
 U4I9FQi7moOBEATunEYgIDAAA=
X-Env-Sender: skochar@lenovo.com
X-Msg-Ref: server-3.tower-426.messagelabs.com!1557188945!7587388!1
X-Originating-IP: [103.30.234.7]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12408 invoked from network); 7 May 2019 00:29:07 -0000
Received: from unknown (HELO apsmtp.lenovo.com) (103.30.234.7)
 by server-3.tower-426.messagelabs.com with DHE-RSA-AES256-GCM-SHA384 encrypted
 SMTP; 7 May 2019 00:29:07 -0000
Received: from USMAILCH02.lenovo.com (unknown [10.62.32.6])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id BF6D2E605AE2BAE6072F
 for <openbmc@lists.ozlabs.org>; Tue,  7 May 2019 08:29:04 +0800 (CST)
Received: from USMAILMBX03.lenovo.com ([10.62.32.3]) by USMAILCH02.lenovo.com
 ([fe80::39de:234f:e770:d116%25]) with mapi id 14.03.0415.000;
 Mon, 6 May 2019 17:29:03 -0700
From: Sumeet Kochar <skochar@lenovo.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: [External]  QEMU models for new BMC chips
Thread-Topic: [External]  QEMU models for new BMC chips
Thread-Index: AdUEZ9Cnv/PCq7v3Sd28r2MjH0BshQ==
Date: Tue, 7 May 2019 00:29:01 +0000
Message-ID: <7F0BA69AEB211847B189840D81AA97F0EAB1AFE3@USMAILMBX03>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.38.104.23]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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

Community came together and drove vendors to deliver drivers to device tree=
 bindings. Most of us who are part of this community purchase some BMC solu=
tions in one form or the other and a large group in here has vested interes=
t in deploying a stack that is vetted out through CI as best it can be. Sol=
ving it as a general requirement is more powerful in my mind than some of u=
s solving on the side with a vendor. Vendors are part of this community so =
would love their feedback. I see mutual benefit. In long term as OpenBMC im=
proves the CI model to me it would make more sense that code/drivers submit=
ted for review have atleast gone through the CI flow without issues vs. the=
 community running the CI and/or during manual reviews finding  issues late=
 which could be discovered earlier through automation ? We certainly will c=
ontribute what we can individually and upstream what is ok to share publica=
lly respecting vendor IP on a new chip but to me that is catching the probl=
em late. Doing what we can to avoid finding things late by making initial c=
hecklist more automated and effective can only help save limited cycles we =
all have. I'll leave it at that and let the community decide. Thanks again =
for response.=20

Date: Wed, 01 May 2019 00:32:18 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Sumeet Kochar" <skochar@lenovo.com>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>
Subject: Re: [External]  openbmc Digest, Vol 44, Issue 120
Message-ID: <52d67ef7-a7a4-4a5f-8af0-3a5cda3e4130@www.fastmail.com>
Content-Type: text/plain

Hi Sumeet,

On Wed, 1 May 2019, at 10:56, Sumeet Kochar wrote:
> I want to seek input from the community on QEMU support from BMC chip=20
> vendors for their new BMC chips.

I agree it would be great to have the chip vendors on board. I think some h=
ave seen the utility of qemu, but ultimately it's up to them to either act =
on it for their own purposes or for their customers to start pressuring for=
 this as part of their purchase arrangement.

We can start advocating for it as a community, but given the community isn'=
t the one purchasing the chips we don't have a lot of sway. As such from a =
community perspective it's largely still a scratch-your-own-itch problem.

As such if you want to see improved qemu support please don't hesitate to s=
tart contributing! Just like the kernel, we want the patches upstream, so s=
end them there first and we can backport as required.

>>=20

Cheers,

Andrew

