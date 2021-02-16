Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A39E31CB9E
	for <lists+openbmc@lfdr.de>; Tue, 16 Feb 2021 15:13:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dg2y92Vymz30NM
	for <lists+openbmc@lfdr.de>; Wed, 17 Feb 2021 01:13:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ppeqajvb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::235;
 helo=mail-oi1-x235.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ppeqajvb; dkim-atps=neutral
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dg2xx0ZQkz2y0B
 for <openbmc@lists.ozlabs.org>; Wed, 17 Feb 2021 01:13:23 +1100 (AEDT)
Received: by mail-oi1-x235.google.com with SMTP id k204so11347078oih.3
 for <openbmc@lists.ozlabs.org>; Tue, 16 Feb 2021 06:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=wWquFD3TWicLvoj15pXLW86nnGXGd7MjupgzuVM7H20=;
 b=ppeqajvb/J3Zu9pf6X8JUjy4PzloXbJOx6tHiCe5m1PHjiJ5UfFGOW9upFF2wnV3vN
 fvZjSMjleif2cJAszalS4OaLSS0JhTlRmEgVX9Nj7Zg0nP0RoY4RumocIxv8Yz3Ef+us
 QUiL5nUc9e20W7gABinN0svpLsHuIhyrZ3CjqcGKeItSylONcI8yhsVSay0Q6Text/8Q
 xCinrPMmn2tASrlgGqTfakcv+0ZoDBZqMQugrd31GjNdc2ejeC1qC7VW0Oh0vd0D3HRw
 8WvZW833kX3t0b1ho1YojYFvkzdjwdyv/fPnciMPabPPyReK9zTuqSttD139ET1ErIGj
 YjqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=wWquFD3TWicLvoj15pXLW86nnGXGd7MjupgzuVM7H20=;
 b=Cuozf+YNHf7swKJLUL94JjpsSmOsJPdSHI23bGvTF/jEouazx8oUPFrjONNjBU6KL+
 pBdX+pgAlAbxcHqD3KfldwAw2vaBnJdlXnNqK77NdRr7g5kFeTeYGInkDfsYrgJ9EU1H
 5RPj2+SDQEjCezyJ+YJvEADQI+9dKyZ0VOzBEORMSgxZqeeIVua8ijjkvlruUMo7gHzj
 4JFXEWVAWX1tMlLNpuP8Vw6PoYTh4zujg6pN6jv2ljrxp9It0r4IGEmkNmHlD9YO2tTl
 2fiw9g3vRI2+malv73pG8t3GWSd/plDY0n1p0ar1cvLMOLlrTa3JP/ME41Z1mOM6Xavo
 +/+g==
X-Gm-Message-State: AOAM531z8Lumo/kRoRqAQnm1rhC4g0+frusAkXEg4o7XipGN2zPe1uoM
 hPA2Fil8mIVNsMJg0jAVweqzwvCsD9iHbQ==
X-Google-Smtp-Source: ABdhPJzYdNyB4klaDYsJ11ycCW6Q232k2X/+6gqUnxmf64nf201hosvEYD8p20Mo7PPLczj1Cm+Y8Q==
X-Received: by 2002:a05:6808:4d0:: with SMTP id
 a16mr2697535oie.87.1613484796979; 
 Tue, 16 Feb 2021 06:13:16 -0800 (PST)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:f09a:78e2:9921:cd92])
 by smtp.gmail.com with ESMTPSA id t14sm4542665oif.30.2021.02.16.06.13.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Feb 2021 06:13:16 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: Upcoming enhancements to `run-unit-test-docker`
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <YCXLqK7KgvwYwWDl@heinlein>
Date: Tue, 16 Feb 2021 08:13:15 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <7E64EF5A-1C4A-4414-B3AA-D973ECCA0BBD@gmail.com>
References: <YCXLqK7KgvwYwWDl@heinlein>
To: Patrick Williams <patrick@stwcx.xyz>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Feb 11, 2021, at 6:28 PM, Patrick Williams <patrick@stwcx.xyz> =
wrote:
>=20
> Hello,
>=20
> Inside openbmc-build-scripts is a tool which is used by Jenkins to run
> repository-level CI and I think some developers also use it:
> `run-unit-test-docker`.  I've rewritten a component of this, which is
> now at `scripts/build-unit-test-docker`, in Python and done some
> enhancements to it.  The [currently] last commit in this sequence is =
at
> [1].
>=20
> Important notices:
>=20
>    - Location change: build-unit-test-docker.sh ->
>      scripts/build-unit-test-docker
>        + I suspect few people run this directly, but instead use
>          `run-unit-test-docker` which hides the rename.
>=20
>    - Python3.6 minimum.
>        + Bitbake already requires this so it really shouldn't be a
>          problem for anyone.
>=20
>    - Python 'sh' module needed.
>        + You can install this with the 'python3-sh' package on many
>          distros or 'pip install sh'.
>=20
>    - Docker stages are now tagged with different names / tag revs.
>        + I wrote a `scripts/clean-unit-test-docker` which will clean
>          out old Docker tags and can be ran periodically.
>=20
> Major changes:
>=20
>    - Rewrite in Python.
>    - Significant speed improvements:
>        - Docker stages all build in parallel to formulate the final =
image.
>        - All Docker stages are tagged and reused from run to run.
>        - CMake packages now use the Ninja backend.  This is the same =
as
>          bitbake and faster than make.
>    - Included packages are defined in a dictionary rather than as raw
>      Dockerfiles.


Thanks for doing this Patrick! I submitted your first set of
commits this morning so we=E2=80=99re officially on the new python
based scripts in CI.

Let Patrick and I know if you see anything amiss.

