Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C160C10753C
	for <lists+openbmc@lfdr.de>; Fri, 22 Nov 2019 16:52:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47KLYG0VlczDrMD
	for <lists+openbmc@lfdr.de>; Sat, 23 Nov 2019 02:52:50 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47KLXZ6QWkzDrFl
 for <openbmc@lists.ozlabs.org>; Sat, 23 Nov 2019 02:52:14 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id AC8DF114C3A;
 Fri, 22 Nov 2019 10:52:11 -0500 (EST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: 2 patch dependency
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <20191119003509.GA80304@patrickw3-mbp.dhcp.thefacebook.com>
Date: Fri, 22 Nov 2019 10:52:11 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <658B392E-33D5-416E-A87D-BBEBBFF5F4B3@fuzziesquirrel.com>
References: <EACBC95B-0761-4667-A622-E1C0EA6EF1ED@fb.com>
 <E782C583-DBB7-4589-BFE6-EC69E2343424@fuzziesquirrel.com>
 <20191119003509.GA80304@patrickw3-mbp.dhcp.thefacebook.com>
To: Patrick Williams <patrick@stwcx.xyz>
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



> On Nov 18, 2019, at 7:35 PM, Patrick Williams <patrick@stwcx.xyz> =
wrote:
>=20
> On Tue, Nov 05, 2019 at 09:27:21AM -0500, Brad Bishop wrote:
>>=20
>>=20
>>> On Nov 1, 2019, at 3:18 PM, Vijay Khemka <vijaykhemka@fb.com> wrote:
>>>=20
>>> We have issue of merging 2 commit which are dependent to each other. =
I am not sure how are we going address this.=20
>>=20
>> I=E2=80=99m working on this today:
>>=20
>> https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/26910
>=20
> Do we have any sort of topic-based multi-repo testing?  If not, is =
there
> any interest in developing it?

I=E2=80=99m certainly interested in having this capability.=
