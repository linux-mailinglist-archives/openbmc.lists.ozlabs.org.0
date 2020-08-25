Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61983251ED3
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 20:04:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbcM53yhLzDqXm
	for <lists+openbmc@lfdr.de>; Wed, 26 Aug 2020 04:04:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d30;
 helo=mail-io1-xd30.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RewzM95j; dkim-atps=neutral
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbcL92x7HzDqJV
 for <openbmc@lists.ozlabs.org>; Wed, 26 Aug 2020 04:03:28 +1000 (AEST)
Received: by mail-io1-xd30.google.com with SMTP id g14so13443071iom.0
 for <openbmc@lists.ozlabs.org>; Tue, 25 Aug 2020 11:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=N/5Nzr9ge0IfftaOmVPcs7Se5/DB7Fw0qeaR00mFPw0=;
 b=RewzM95j0KctBT22gaXyczj99W+m9+MFrIcjrDD2Z32GggBUHsCsTwCFwVotbSh05A
 WNcj8QSIzqTE153Gnx0pzbLEQ7kaEMJdyQ5rq1iU2Q476i9aVWgvcdIMDORax8KqgxCa
 4d7VP06JpEIXFWZ+19G2bXFb01LbiGJf7N0CSaOO3dU6l1q0urlDVC+OqukAl+W+meDQ
 k4J2bKwNzbYX/YgnOhTwPWBHNc5TVgteWvr4tVzW6zwdYJTX0z/UotWoKY3PvZOVXr58
 lPmCRa1gkjMTx73QuIj4tsGe0KctiwyNt+yUW4wXUBwD15yHKVw9hNy9hZisbgCiSVYQ
 kgFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=N/5Nzr9ge0IfftaOmVPcs7Se5/DB7Fw0qeaR00mFPw0=;
 b=R8zn/bOBEvPRGM7dXayR10e1Gj+ZXvBA3zYQJ+hQUCrU6i5gdIXi88QAjjqeO74rYX
 tFjvIFDDqo6FCyPrQGEAojZ/vNt07XzRNqnNHAlk5FiTvAHtjGVyKuuQaisNpnnpGDh6
 3Ypx804HKcR+uTYX0SUxksdAaeejSiPJQXA4CmDxVmL6XQkAspxNDEfiS6GJDi9s1NKb
 3owSJDAgE8IdeMbjPXJQrth1HJR7VXY5fKh2ynQD4ERojoKFOqLEGTzCFc1QxxQ509ZH
 9mUYatvKcjndsUj4feANpmv02xq/4ESxqMBILZ4A+RXIDYYPpK3QSG8GuMhJHbS5x21Q
 71Tw==
X-Gm-Message-State: AOAM533tL2homLy1MFw8P5IkqcPln7pClCtSx1zUe5ZYQgfcoyNQVFxK
 HN3oqJmj5siBgMPtPn0NmsQ=
X-Google-Smtp-Source: ABdhPJyzR68pGf1yGW9lDzJNW32Lgv19ph0n23tpOGvomURpR95knQ6cCzOt4NEeuVjD8Qm2Uy9Ufw==
X-Received: by 2002:a6b:f608:: with SMTP id n8mr10042260ioh.148.1598378604600; 
 Tue, 25 Aug 2020 11:03:24 -0700 (PDT)
Received: from [10.86.10.6] ([174.128.226.18])
 by smtp.gmail.com with ESMTPSA id c24sm8850578iom.46.2020.08.25.11.03.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Aug 2020 11:03:24 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: systemd clarification
From: Mike Jones <proclivis@gmail.com>
In-Reply-To: <20200825165258.GT20886@morley.fr.hpecorp.net>
Date: Tue, 25 Aug 2020 12:03:23 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <B3E8FB77-80E3-4BB0-BFF0-A685403DF9B4@gmail.com>
References: <C255655B-FA25-4CC3-9982-211D71352F74@gmail.com>
 <20200825165258.GT20886@morley.fr.hpecorp.net>
To: Bruno Cornec <Bruno.Cornec@hpe.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Bruno,

A related question.

When I look through the services and targets installed when including =
meta-phosphor, power on/off seems to lead to dead ends, meaning no exe =
to do the work.

So I looked at meta-facebook, and it adds host-poweron.service, which =
calls exec power-util=E2=80=A6

So it seems to me that meta-phosphor only puts in the infrastructure, =
and a particular use/design requires adding services to do the actual =
work of power on/off. This seems logical wrt factoring out behaviors. Is =
this correct?

This would mean in my cause of use meta-raspberrypi, I need to add the =
missing pieces if I want power control of my externally connected =
regulators to get powered on/off.

Mike

> On Aug 25, 2020, at 10:52 AM, Bruno Cornec <Bruno.Cornec@hpe.com> =
wrote:
>=20
> Hello,
>=20
> /etc/systemd is used to override or add locally units which are not =
delivered as part of the std systemd delivery which is under =
/lib/systemd (or /usr/lib/systemd depending on Linux distribuions). It's =
an easy way to modify a std unit file and change say the options used to =
start the daemon e.g.
> So:
>=20
> Mike Jones said on Tue, Aug 25, 2020 at 10:20:54AM -0600:
>> The lib path is not a search path in the systemd documentation, and =
the etc path has links into the lib path. So I assume services in the =
lib path are only run if they are linked into the etc path. Is this =
correct?
>=20
> No. they are run if they are enabled (systemctl list-units to see =
that)
>=20
>> If there is a an After=3D that lists something found only in the lib =
path, I assume it will run because After is not strong enough to prevent =
start. But if it was Requires=3D, then I assume it cannot start unless =
it is linked into the etc path so that it is available. Is this correct?
>=20
> No. No link is necessary.=20
> Best regards,
> Bruno.
> --=20
> HPE WW FLOSS Technology Strategist      =
http://www.hpe.com/engage/opensource
> Open Source Profession, WW Linux Community Lead    =
http://github.com/bcornec
> FLOSS projects:     http://mondorescue.org        =
http://project-builder.org
> Musique ancienne?   http://www.musique-ancienne.org  =
http://www.medieval.org

