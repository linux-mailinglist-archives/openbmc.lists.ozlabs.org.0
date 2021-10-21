Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66272436A7D
	for <lists+openbmc@lfdr.de>; Thu, 21 Oct 2021 20:21:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZwmf5WB2z3btR
	for <lists+openbmc@lfdr.de>; Fri, 22 Oct 2021 05:21:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=La3a9yEx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::231;
 helo=mail-oi1-x231.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=La3a9yEx; dkim-atps=neutral
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZwmD3Z7Vz2ymg
 for <openbmc@lists.ozlabs.org>; Fri, 22 Oct 2021 05:21:31 +1100 (AEDT)
Received: by mail-oi1-x231.google.com with SMTP id g125so1934012oif.9
 for <openbmc@lists.ozlabs.org>; Thu, 21 Oct 2021 11:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=KjZOq1dRtD84BjkUibNXA4Zq+OLL9NWVpMbiLgbHyGM=;
 b=La3a9yExIOviuvgpsRPn4fcds+xZ4Tdns0Wj5rsY6RB+97MYvmPNjGfa58YaG3UMOc
 WGg8Bg08fKWxeGVUloHfUrFSAAHRoYHidnMB6Y1e4dLS5leZ75Irsf+7hFlwt/6ENKG5
 lJ4fC/7GJFxylOOr4dd4Qe3ErFMEApj4rr/LnpIXj4CpzLjPuUD+ufJxs5lGF2Q1VhE2
 kHbvwcIGJ2ToCwvsK85ODuvJaFXXPM5Oyg74QckjBFkAyPZ1WJx/9j9MIgTrSP1Xeo1x
 CPxCzi3TIOfYflztyEuKXMJo2IbLrIIpo4p+7rc84oAlY9Ql5DiC34OnZjXbN6sH0put
 2b6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=KjZOq1dRtD84BjkUibNXA4Zq+OLL9NWVpMbiLgbHyGM=;
 b=cx60zdVbgy8Z3mmpy0Fgsl6qYxowFeppy4a7x8S76qZ9B7PGkgXpuilvA76IJbuo7F
 1c31y6u1JFlCyVlz+QIpwc3ZZH0OE7K9HkhYoRjt4CvR83mzNeXEhIpWj6I+PSlD7oeD
 WIhrFk/+e56p+uKpFK9b6bVP4O/wds9NguYIleemnxykuQQA8yJ3H698ea+Bqju+0r8m
 MGMmu9DpoMPOjA2V2HXmGgDF4o7dam4NcT3Vj7vhBq+G47f7ZNkvJvL5bs1dTamYkaMA
 D900ZWhftas8doimyJUslSa0xX3d0oYfRK4/6bVqQjudS8KTNCaqj6PrPp3nlRyVDlNw
 BMuw==
X-Gm-Message-State: AOAM533rWlKGyvyuAbtLRQ8yk2L6ynKeccbiDS/FKOBbOakq8smu2Zi9
 S6J09IICmbcfc74jdQlVlmqWsLywPlv6wA==
X-Google-Smtp-Source: ABdhPJyt6ptF+zDLl79qld/6d9eDEtQkjPh/fiIQB1FflQrPgwjU46ckrJeuBWOrAOmkWvB/el7ADg==
X-Received: by 2002:a05:6808:118a:: with SMTP id
 j10mr6095325oil.101.1634840488318; 
 Thu, 21 Oct 2021 11:21:28 -0700 (PDT)
Received: from smtpclient.apple ([2600:1700:19e0:3310:f8cf:abaa:f9b1:b3f])
 by smtp.gmail.com with ESMTPSA id a10sm1221605otb.7.2021.10.21.11.21.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 Oct 2021 11:21:28 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: Open BMC Jenkins information
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <CALGk7QU0mNzuS0M34RE1PhjhYKUjDTOf7wLZoG8DYvjArfS9Xw@mail.gmail.com>
Date: Thu, 21 Oct 2021 13:21:27 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <7BE36D46-D8AA-4B63-96ED-AA081DD85490@gmail.com>
References: <CALGk7QU0mNzuS0M34RE1PhjhYKUjDTOf7wLZoG8DYvjArfS9Xw@mail.gmail.com>
To: Kiran Gopal Patil <patilkg@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
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



> On Oct 21, 2021, at 12:01 AM, Kiran Gopal Patil <patilkg@gmail.com> =
wrote:
>=20
> Hello,
>=20
> I am trying to understand the OpenBMC continuous integration.

Sure, I handle a lot of the CI infrastructure for OpenBMC. Can I ask why =
you are interested? Looking to set up some CI for your machine?

> I would like to know more about what are the master hardware =
configuration, server hardware information, number of slaves and various =
jobs configuration. How the docker images are used etc.

=
https://github.com/openbmc/openbmc/wiki/OpenBMC-Infrastructure-Workgroup#i=
nfrastructure-scripts-and-jenkins-jobs has a link to the jobs and =
scripts used by the jobs.
=
https://github.com/openbmc/openbmc/wiki/OpenBMC-Infrastructure-Workgroup#c=
urrent-infrastructure has some info on current nodes, although it needs =
to be updated to include the 4 that Facebook donated a while back.

>=20
> Also, what kind of tests are run in the CI.=20

For the full bitbake builds, we run the Romulus image in CI and do some =
basic REST/IPMI/SSH test cases.  This was just updated recently via =
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-test-automation/+/469=
87. We then have some other jenkins instances that do some HW CI tests =
as well. =
https://github.com/openbmc/openbmc/wiki/Adding-a-System-to-Hardware-Contin=
uous-Integration has some info on that.

>=20
> Also, through my github account I can login to =
https://jenkins.openbmc.org/ however this does not enable me to see the =
job configuration.
> Is there any repo where all these configuration is versioned?

We utilize the ThinBackup plugin to back everything up (and a cron job =
periodically offloads it) but the actual jenkins configs are not =
available to the general public. Mostly I haven=E2=80=99t wanted to deal =
with worrying about any security holes in giving everyone access. The =
goal has been to keep the jobs very simple, they run a bash script which =
we version control in =
https://github.com/openbmc/openbmc-build-scripts/tree/master/jenkins.

>=20
>=20
> Please let me know if there is any contact to check all these things =
or any document which explains all the things.
> Thanks in advance for your help.
>=20
> --=20
> Thanks & Regards,
> Kiran Patil

