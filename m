Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C33F615F733
	for <lists+openbmc@lfdr.de>; Fri, 14 Feb 2020 20:55:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48K3yR6jSZzDqkf
	for <lists+openbmc@lfdr.de>; Sat, 15 Feb 2020 06:55:27 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48JzNp5NhjzDqR5
 for <openbmc@lists.ozlabs.org>; Sat, 15 Feb 2020 03:29:29 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: Community support - where do want to be in a year?
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <cf55586d-7e66-a3a6-30da-6980deb9be69@intel.com>
Date: Fri, 14 Feb 2020 11:29:22 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <23111C94-4A98-4422-A1FC-BDE23C3C2C47@fuzziesquirrel.com>
References: <CAG5OiwhNq55Om4=NU8F7SSebDqMQpKhHuhAC-aFz=QKBLM6Wig@mail.gmail.com>
 <cf55586d-7e66-a3a6-30da-6980deb9be69@intel.com>
To: Johnathan Mantey <johnathanx.mantey@intel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Kurt Taylor <kurt.r.taylor@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Feb 14, 2020, at 10:24 AM, Johnathan Mantey =
<johnathanx.mantey@intel.com> wrote:
>=20
> Kurt,
>=20
> I would like to see a more developer friendly unit test framework.
> I have had only a couple of occasions where I needed to run the test =
suite.
> My most recent attempt was not successful because my test repo was out =
of sync with the remainder of the OBMC infrastructure.
> I would like to see:
>=20
> 	=E2=80=A2 A way to test my changes within the framework of more =
than one repo.

can you elaborate on this?

> 	=E2=80=A2 A less heavy handed, quicker turn time test sequence

What is a rough target for your desired turn time?=
