Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1855D179837
	for <lists+openbmc@lfdr.de>; Wed,  4 Mar 2020 19:44:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XjTf35DwzDqdf
	for <lists+openbmc@lfdr.de>; Thu,  5 Mar 2020 05:44:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32d;
 helo=mail-ot1-x32d.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VHIsqpeJ; dkim-atps=neutral
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XjT02LKBzDqbX
 for <openbmc@lists.ozlabs.org>; Thu,  5 Mar 2020 05:43:48 +1100 (AEDT)
Received: by mail-ot1-x32d.google.com with SMTP id 66so3043561otd.9
 for <openbmc@lists.ozlabs.org>; Wed, 04 Mar 2020 10:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=q47vrHuyPOUWtPL4n2Iz2jDG0+kXsGWaQDSi5phqHbk=;
 b=VHIsqpeJbUA1mEfOuREDMzdiGja2KBpExgsOu3kXkBwVcv6PK6QR331gZHQVFtEr0F
 GUYbT3g6vCNuUyJITP/Ae1TCawm+wfrYAvAoElFBfYFxyhvu3y9vyFnsZagGzQkoFR2b
 5TpdMkMiKqEMgilqeZMUGc07Vby90NB2gRUxWniee+G1RPRaXz4eDOG/v3Mlk1uypoOc
 Q7UPuUjmq3gu19vKJDWRg547aDs72xXecgcH0AcUoYZDhgFeHrv0yMi8ugy7YLXDkCVi
 rOqrZYk5MG29WNL2OLXoQCLc/VYVtia1yOPZvjKRPRBzY2h4mhM6cnGzCN2xkhzJkxKZ
 HBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=q47vrHuyPOUWtPL4n2Iz2jDG0+kXsGWaQDSi5phqHbk=;
 b=N9Ja9P32J3+Kqb2kN3N4+yOeJp15s7sLZAveM297CNPsmS/VUeD7iquBnXVDUekRPT
 vp+TcV2J84STn+h2frXzt4AhIGj8NrDaMVHV6zmkq0rgbamumxKflNg3jT1dIMzHrY0R
 dKcxZcSV3gIH54KG158T49vr8pI0mhCeenqx/J3r1GyHcnrRsI+aW+uglV5IqAEU3G6F
 UPAJ3iQUzF/lIkQq5VV1p/t6bTM3AGbu7qBmRqnxmCMHBSdn0ZFw9Kd9LuNgnQyjDFsA
 i8mPpSoclYqvxuOjpD/O58qP9VnvwECp0M0GcqWWOHh5BVZ0nbwwHEwG8zdwKa3CKBJ8
 +DxA==
X-Gm-Message-State: ANhLgQ07cTGc8sl2Fn+hon9gVi0H8qz8coQwbKl+2DvdDZI44HIzZgIK
 4fbH+0BXMdUf7/4dZ/refnc=
X-Google-Smtp-Source: ADFU+vuDeRVFVCJv1nktbSR/PfktAjH6ZszgJSPtrd4A+Tn9VjeBq756riGhnxvdLKwCNPb/GNeXVw==
X-Received: by 2002:a9d:3f4b:: with SMTP id m69mr3243010otc.146.1583347424734; 
 Wed, 04 Mar 2020 10:43:44 -0800 (PST)
Received: from ?IPv6:2600:1700:19e0:3310:5187:9c8f:6e2f:fa36?
 ([2600:1700:19e0:3310:5187:9c8f:6e2f:fa36])
 by smtp.gmail.com with ESMTPSA id 17sm8172242oth.7.2020.03.04.10.43.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 04 Mar 2020 10:43:43 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [OpenBMC]: Unit test coverage analysis on openbmc repositories
From: Andrew Geissler <geissonator@gmail.com>
X-Priority: 3 (Normal)
In-Reply-To: <OFBAC0E531.E7E68FE5-ON0025851C.0053A4C8-0025851C.0055AA1E@notes.na.collabserv.com>
Date: Wed, 4 Mar 2020 12:43:42 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <EDA605F3-6630-49FC-9244-0A2499138CFC@gmail.com>
References: <OFBAC0E531.E7E68FE5-ON0025851C.0053A4C8-0025851C.0055AA1E@notes.na.collabserv.com>
To: Lakshminarayana R Kammath <lkammath@in.ibm.com>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
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



> On Feb 28, 2020, at 9:35 AM, Lakshminarayana R Kammath =
<lkammath@in.ibm.com> wrote:
>=20
> Hi All,
> =20
> Recently we worked on pulling the UT coverage analysis from all the =
available OpenBMC repositories
> =20
> =
https://github.com/openbmc/openbmc-build-scripts/commit/229b76a95f87af60c9=
76a0c0dfe84716c9ce5318
> =20
> This script does following
> 	=E2=80=A2 Clone the repo
> 	=E2=80=A2 Use the CI build environment to build code
> 	=E2=80=A2 Publish the result in the following format
> Feedback's , views highly appreciated

Good stuff. I added this to a jenkins job which will run each day.

https://openpower.xyz/job/openbmc-unit-test-coverage/

You can then look at coverage info for your repo of interest by
clicking through the artifacts and getting to your coverage info.

For example:
=
https://openpower.xyz/job/openbmc-unit-test-coverage/lastSuccessfulBuild/a=
rtifact/openbmc-build-scripts/scripts/unit-test-meta-data/pldm/build/meson=
-logs/coveragereport/index.html=20

The job uses the following to know which repositories to check so feel
free to throw up some commits if there are missing or invalid repos:
=
https://github.com/openbmc/openbmc-build-scripts/blob/master/scripts/repos=
itories.txt

> =20
> Thanks & Regards,
> Lakshminarayana Kamath
> =
--------------------------------------------------------------------------=
------------------------
> Senior Engineer,
> IBM India Software Labs
> Bangalore
> github:lkammath
> =
--------------------------------------------------------------------------=
-------------------------
> =20
>=20

