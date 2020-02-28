Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EA085173CFB
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 17:33:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TZpg07mDzDrNb
	for <lists+openbmc@lfdr.de>; Sat, 29 Feb 2020 03:33:15 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TZms38l7zDrN7
 for <openbmc@lists.ozlabs.org>; Sat, 29 Feb 2020 03:31:41 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [OpenBMC]: Unit test coverage analysis on openbmc repositories
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
X-Priority: 3 (Normal)
In-Reply-To: <OF34BD4883.6AE8E4F8-ON0025851C.005A7EA7-0025851C.005AAACB@notes.na.collabserv.com>
Date: Fri, 28 Feb 2020 11:31:38 -0500
Message-Id: <ABE45DC2-0C5E-42B6-AE1F-60C5F608D1F1@fuzziesquirrel.com>
References: <1B448D94-3C6C-42D5-991B-A6AFD720F999@fuzziesquirrel.com>
 <OFBAC0E531.E7E68FE5-ON0025851C.0053A4C8-0025851C.0055AA1E@notes.na.collabserv.com>
 <OF34BD4883.6AE8E4F8-ON0025851C.005A7EA7-0025851C.005AAACB@notes.na.collabserv.com>
To: Lakshminarayana R Kammath <lkammath@in.ibm.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

at 11:30 AM, Lakshminarayana R Kammath <lkammath@in.ibm.com> wrote:

> sure Brad!
>
> If Some one can confirm the list of repo's that can be ignored we can p=
ut =20
> them to blacklist

Is it possible to use the GitHub api to query this?  Then we don=E2=80=99=
t need to =20
maintain a blacklist.  How are you building the list of repos?
