Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A03EFFB4
	for <lists+openbmc@lfdr.de>; Tue,  5 Nov 2019 15:28:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476sTc0n0zzF1sD
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2019 01:28:20 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 476sSb57vfzF4tQ
 for <openbmc@lists.ozlabs.org>; Wed,  6 Nov 2019 01:27:26 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 6F4135C08B;
 Tue,  5 Nov 2019 09:27:21 -0500 (EST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: 2 patch dependency
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <EACBC95B-0761-4667-A622-E1C0EA6EF1ED@fb.com>
Date: Tue, 5 Nov 2019 09:27:21 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <E782C583-DBB7-4589-BFE6-EC69E2343424@fuzziesquirrel.com>
References: <EACBC95B-0761-4667-A622-E1C0EA6EF1ED@fb.com>
To: Vijay Khemka <vijaykhemka@fb.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Nov 1, 2019, at 3:18 PM, Vijay Khemka <vijaykhemka@fb.com> wrote:
>=20
> Hi Brad,
> We have issue of merging 2 commit which are dependent to each other. I =
am not sure how are we going address this.=20
> https://gerrit.openbmc-project.xyz/#/c/openbmc/meta-facebook/+/26629/ =
and=20
> https://gerrit.openbmc-project.xyz/#/c/openbmc/meta-phosphor/+/25651/
>=20
> Regards
> -Vijay
>=20

Hi Vijay

I=E2=80=99m working on this today:

https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/26910

-brad=
