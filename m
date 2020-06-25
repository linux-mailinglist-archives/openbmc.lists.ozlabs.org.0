Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 485B520A6C0
	for <lists+openbmc@lfdr.de>; Thu, 25 Jun 2020 22:27:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tBQC4pvJzDqxg
	for <lists+openbmc@lfdr.de>; Fri, 26 Jun 2020 06:27:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::330;
 helo=mail-ot1-x330.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dUDzgqc/; dkim-atps=neutral
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tBPM5SdbzDqwp
 for <openbmc@lists.ozlabs.org>; Fri, 26 Jun 2020 06:26:31 +1000 (AEST)
Received: by mail-ot1-x330.google.com with SMTP id t6so6517136otk.9
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jun 2020 13:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=yUo7db6EHKnz0DqKUq9JGosB7Km4xXMFt82gYBSJoHg=;
 b=dUDzgqc/OT5EVvT57VxO0GmwhDI4idWywmvlA1nnseDIeDkPjLRMpfy14kQm8fKCz5
 DueMu4Aug3d/2ezbx8BS4rcpUqhLVkbuYtN2X9HiOi8VBLivVZZTZ5sUIjwwMGaiG0QK
 sLl7PcPmglEY3GaVjldrT7HFKorEHj0K7JEE6X0d/rWYRO5lOZXZs8B3ijXBrcm4enWn
 psuwbebeDUcmy7r3eMw68pCTPfLizw2iVPYInYi7ERNJ2uv8jMZxDPw6RyReq3zi25gr
 MZlgbIB1NbGeKLEZ4NHPousYQ5EtVdfUSeihASDAlb0btLGF1N3L33PK9vvn8D3ir7+N
 dUcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=yUo7db6EHKnz0DqKUq9JGosB7Km4xXMFt82gYBSJoHg=;
 b=d+NnDxCcQqNNT9ylYYHbA0mdSsFZ03T4s2Q8SZusCYft9uniw1cWl+Q9Jg7BeO/+Xt
 0Kr9Lzt2eV2/cGyJ3x+D9JChsocbkOwONr5ysxvCBKd4f2C/IvPBz6zg0wTPfVl1cqwv
 PU1p5tcIGOhZxt7yADwwJN288CdRrpUHU7oEpA+lz5/iBgtHn2oTVp+fBCkimOcCtwEv
 banvcGL3jrTKmDLQXscBpGlkYtMZpV6SSq5q2vaNCuxzsK2bZU+wJcwRAHSW20WQw3Wt
 Vvrv8wUQBmuYOjF3iE4J38OoMwWg2Zg/Q/V8oGKlseQs1z35mA/RRO6w9qfztQ9ImdZa
 3Qxg==
X-Gm-Message-State: AOAM53367GrbP9hpapA3CxZEJrGrMfY2Vm4RdXaRky1il0HF/clFaLvC
 OQ4RStk1gy9toc1HyV5tAaI=
X-Google-Smtp-Source: ABdhPJy06fh6VJbAQnZYVya36EshYs8bgU9G4HP6P/H/jAYsFJ/nMBr6u8zB3HKEWLpTcO9catCAKA==
X-Received: by 2002:a05:6830:22ee:: with SMTP id
 t14mr29284385otc.92.1593116786445; 
 Thu, 25 Jun 2020 13:26:26 -0700 (PDT)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:3907:b988:f10a:cf9f])
 by smtp.gmail.com with ESMTPSA id l195sm5618401oib.40.2020.06.25.13.26.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jun 2020 13:26:25 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: Expanding CI to live testing
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <B50DC7EF-D1F7-4D7F-B502-DEA4EA2A6145@hpe.com>
Date: Thu, 25 Jun 2020 15:26:24 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <3E8DA024-827D-4D4E-A90C-FC5BFE29910A@gmail.com>
References: <B50DC7EF-D1F7-4D7F-B502-DEA4EA2A6145@hpe.com>
To: "Verdun, Jean-Marie" <jean-marie.verdun@hpe.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
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



> On Jun 24, 2020, at 3:16 PM, Verdun, Jean-Marie =
<jean-marie.verdun@hpe.com> wrote:
>=20
> Hi,
> =20
> As some of you are aware I am working on a Continuous Integration =
system which allow developer to test their build on a real hardware. I =
built a proof of concept before we had to lockdown our Houston Campus. =
The good news is that it starts to work, and I am using it extensively =
to work on linuxboot (it is available here: https://osfci.tech). So what =
can I do ?

Hi Jean-Marie, welcome to OpenBMC. My name is Andrew and I=E2=80=99m =
involved with a lot of our OpenBMC CI efforts.

> =20
> My secondary goal is to automatize live testing on real hardware and =
probably interface the CTRL pool to a Robot server ( =
https://robotframework.org/). This part still need to be developed, and =
the current API has the basic coding to support it, but seriously need =
renaming, and convention build up.

There are two types of CI in OpenBMC, repository CI, where we build and =
compile an individual software based repository and run it=E2=80=99s =
unit tests. This all happens within a docker container and does a =
variety of other tests like code formatting and valgrind type checks.

The second type of CI is where we do the full bitbake and build a real =
image that can be verified within QEMU and on real hardware. This CI =
happens once a change has been merged into a software repository.  This =
CI is also all driven from within docker containers. Our public OpenBMC =
jenkins builds a variety of system configurations. The systems built in =
CI are chosen based on getting the most coverage of openbmc code. Once =
HPE has a system in upstream, we could discuss adding it into our public =
CI.

=
https://github.com/openbmc/openbmc/wiki/OpenBMC-Infrastructure-Workgroup#i=
nfrastructure-scripts has a somewhat dated but still relevant overview =
of the scripts we use for CI within openbmc.

> =20
> My current challenge with OpenBMC is related to build time and not =
compete with the existing infrastucture but more being integrated to it. =
I tried to understand how we test new pull request and it looks like =
that we are using Jenkins. I have no experience with it, but that is =
fine (I used travisci and Appveyorci).

Yes, it=E2=80=99s better to just get the system you need added to the =
openbmc upstream CI.  The way we do hardware CI within IBM is the =
following:

- We have our own Jenkins running within our lab.
- This jenkins monitors for the upstream jenkins to mark a gerrit commit =
as Verified (i.e it=E2=80=99s passed all upstream CI)
- Once this occurs, the downstream jenkins runs some logic to find the =
flash image it needs from the upstream jenkins
- It then uses the openbmc robot test framework suite =
(https://github.com/openbmc/openbmc-test-automation) to flash the image =
and run a set of test cases on one of our servers
- Upon completion of the downstream hardware CI, the downstream jenkins =
will add a comment to the gerrit review on whether it passed or failed=20=

=20
> So I do have a couple of questions:
> =20
> 	=E2=80=A2 Does the Jenkins build could be made into a Docker =
image knowing that my compile node runs under Ubuntu (I believe 18.04)
> 	=E2=80=A2 Could we find a way when our Jenkins cluster build is =
done to extract the build result, automatize the transfer of it to =
perhaps an object storage pool with a unique UUID identifier. The =
challenge will be to retrieve that UUID into the gerrit page, or the =
Jenkins log.
> 	=E2=80=A2 If the build is successful, the end user could use =
that unique UUID to test on a live system. The osfci system will then =
extract from the object storage backend the build results and bootstrap =
it on the first CTRL node available.
> 	=E2=80=A2 Then an interactive session could start, or the robot =
framework system could have a look to the results and feedback jenkins, =
or the end user=20

I think it would be great if we could have your infrastructure follow a =
similar design as laid out above. Have it monitor gerrit for the Verify =
tags and then kick off validating the image(s) on your collection of =
hardware and report status back via a comment to the gerrit review.

> vejmarie

