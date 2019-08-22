Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 435779A21B
	for <lists+openbmc@lfdr.de>; Thu, 22 Aug 2019 23:21:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DyCG6DcTzDrfM
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2019 07:21:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DyBM5tx0zDrdM
 for <openbmc@lists.ozlabs.org>; Fri, 23 Aug 2019 07:20:58 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id D147F12F66C;
 Thu, 22 Aug 2019 17:20:53 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: phosphor-ipmi-host sane entity map
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAO=notz7QgiHq-B3Sw0F89YzxK__CuLvn+1DRwwYFoPK-3r5Aw@mail.gmail.com>
Date: Thu, 22 Aug 2019 17:20:53 -0400
Message-Id: <7990850C-3EDA-42AB-92D4-27DED95F9F53@fuzziesquirrel.com>
References: <CAO=notz7QgiHq-B3Sw0F89YzxK__CuLvn+1DRwwYFoPK-3r5Aw@mail.gmail.com>
To: Patrick Venture <venture@google.com>
X-Mailer: Apple Mail (2.3445.104.11)
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
Cc: Emily Shaffer <emilyshaffer@google.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Tom Joseph <tomjoseph@in.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

at 2:48 PM, Patrick Venture <venture@google.com> wrote:

> With:
> https://github.com/openbmc/meta-phosphor/commit/fe88ee4211c93f4ca4acba5=
ecec502aef17944ce#diff-0838b00f3d431ade72af266d179a3e70
>
> How did you derive the entity record?  I ask because I'm replacing
> this with json:
> https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/24552
>
> And wanted to know if I should use the file you dropped in, or leave it=
 =20
> empty?

I assume I am the =E2=80=9Cyou=E2=80=9D here since I authored the commit =
you linked.  Are =20
you talking about entity.yaml?  I didn=E2=80=99t actually change the orig=
inal =20
content from Jaghathiswari I just patched it in-tree rather than using th=
e =20
out of tree mechanism.

-brad
