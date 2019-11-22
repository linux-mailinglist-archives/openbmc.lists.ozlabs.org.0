Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EDB107522
	for <lists+openbmc@lfdr.de>; Fri, 22 Nov 2019 16:45:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47KLNH233bzDrL9
	for <lists+openbmc@lfdr.de>; Sat, 23 Nov 2019 02:45:03 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47KLMV4W8yzDrHy
 for <openbmc@lists.ozlabs.org>; Sat, 23 Nov 2019 02:44:21 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 72938114C3A;
 Fri, 22 Nov 2019 10:44:16 -0500 (EST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: 2 patch dependency
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <6E519880-9A69-411B-8DD4-BF86AB7E543C@gmail.com>
Date: Fri, 22 Nov 2019 10:44:16 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <29544933-52D7-4133-8AA2-B78F3A8441C5@fuzziesquirrel.com>
References: <EACBC95B-0761-4667-A622-E1C0EA6EF1ED@fb.com>
 <E782C583-DBB7-4589-BFE6-EC69E2343424@fuzziesquirrel.com>
 <20191119003509.GA80304@patrickw3-mbp.dhcp.thefacebook.com>
 <2231F8C7-719B-468B-BABB-92AF197F92C8@gmail.com>
 <20191119165440.GB93344@patrickw3-mbp>
 <6E519880-9A69-411B-8DD4-BF86AB7E543C@gmail.com>
To: Andrew Geissler <geissonator@gmail.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Sorry - been a bit behind on email lately.

>> Ooh.  Was this talked about on the mailing list somewhere?  I've gone
>> back through at least August and haven't come across it.  Was there
>> an exploration of moving to `repo` instead?
>=20
> May have only been IRC, I=E2=80=99ll let Brad handle this one. I just =
know
> that my vote is to get away from subtree. It made the dev process
> more difficult/complex and it doubled the required capacity of our CI
> infrastructure.

Right=E2=80=A6I didn=E2=80=99t think this had left my head.  Apparently =
I told Andrew about it :-)

A brief history lesson for any that aren=E2=80=99t aware - the original =
workflow was patches were submitted to openbmc/openbmc for subtrees =
where we are as far upstream as you can get.  We moved from that to the =
workflow we have today because of a desire of mine and others for =
de-centralized ownership of metadata.

To enable that I proposed the same process that the Yocto project uses =
to aggregate the various sub-projects into the poky distribution.  This =
is how we wound up with the workflow we have today.  In hindsight this =
was a mistake.

The proposed change would simply be that we revert back to the old =
workflow, which was much simpler, and use the Gerrit plugin to implement =
the de-centralized ownership requirement.  There have been and will be a =
couple enhancements since we last used that workflow though:

1 - I track poky/meta-openembedded head. Last time we tracked the latest =
released version.  This has worked fine; I am not aware of a single =
instance of upstream breaking us or causing any instability.

2 - I would automate the subtree pushes. Last time this was done =
manually (and thus the subtrees were often stale).

As far as repo goes - in my mind that is something completely separate.  =
If anyone wants to maintain a repo manifest somewhere I don=E2=80=99t =
have a problem with that.  It doesn=E2=80=99t have to have anything to =
do with the patch submission workflow.

thx - brad=
