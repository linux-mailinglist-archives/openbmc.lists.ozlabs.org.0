Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9936B1E2622
	for <lists+openbmc@lfdr.de>; Tue, 26 May 2020 17:57:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Wdrk36LQzDq63
	for <lists+openbmc@lfdr.de>; Wed, 27 May 2020 01:57:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::235;
 helo=mail-oi1-x235.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vPrrwXky; dkim-atps=neutral
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49WdqZ1Y3WzDqDc
 for <openbmc@lists.ozlabs.org>; Wed, 27 May 2020 01:56:24 +1000 (AEST)
Received: by mail-oi1-x235.google.com with SMTP id m67so8687188oif.4
 for <openbmc@lists.ozlabs.org>; Tue, 26 May 2020 08:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=IHvKOhRpRF9gqMttMxYklQZZbYGfgnFhDdq4TDzrjdg=;
 b=vPrrwXkyXdj+BH0QP6vHlba4v2aQLaejY+GO8JcdE2FPnuwgNNbJoXjqb1ot4YLv2+
 4QYvr6E2CEm+wBAkzIQCbpL2ogfeeqxcE2YPsQ9A+0qyMo5Mx/JGwxIenDQkcWacvtys
 s6Tc+Y0yK3IEwWWFJ27ioCMMQJnwy7FLK7K+BVAmwp3VdGIv67cWupCs9N24BLfpglV2
 00r9XgmwhVEa98Daowi3GWWjKKTDKtPIPKpCM+HFGK6KAHcZmhEXVth3u24x/Sf9d1Fj
 CfhWKO2vmdLSW/2GtScBJuWQc3anDUWAJWZIfiPnMuMBqWqUNgSs3sVg/y0j34uuyohv
 nZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=IHvKOhRpRF9gqMttMxYklQZZbYGfgnFhDdq4TDzrjdg=;
 b=FzN9rDx+cqUBczsdD3+h4MVgWHj0ZeDpXZ6a05nRT3GMjR/2hiUxCLobqB9p6jeGVy
 AmO9n8lclrU73vaajf21vfAMaMcBrAw7iU6ouEvjEbOg+CERwv75fjuqQsycECwNYaaj
 4sgARIjVdBqs5cfPBOn4C4TyLrMhLGkIsMgR0XyyAZYXcIZwAC9IClONQxsjHzqGf+Q3
 DKcx7cFQbs8JT7hQQsopyk3IygJrvxq5HJUevH/VCUPSPB9RA9V36yRFvdARFNP+AcjN
 Fwrl4bv+g0gehil1ibddsX9RpQ5b+sVoEq/dEdxLTqFnCzH70aDoKfZ3SAJAQ+FjlrjS
 InAw==
X-Gm-Message-State: AOAM532aCfMArPJIlbHFpv1xx/Bd+6G8eu54U6EWSg5GPOcDrUeDh5Zw
 ItwYSJrP7KpBX90BD+6c/8afyYToGis=
X-Google-Smtp-Source: ABdhPJzuCeUv3TL2GqJ5bpkO1uG52/fd0Zw9UB+JWnd8ei1UJ0WAs7WzUCnpJXaMGdbAPhYR6OFvdA==
X-Received: by 2002:aca:478d:: with SMTP id u135mr14549520oia.49.1590508580890; 
 Tue, 26 May 2020 08:56:20 -0700 (PDT)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:e183:e6c2:2d7f:810])
 by smtp.gmail.com with ESMTPSA id d128sm104938oob.6.2020.05.26.08.56.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 May 2020 08:56:20 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: article on data in OpenBMC
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <58a733f5aac22446c8cab43535aaa2a133a20717.camel@fuzziesquirrel.com>
Date: Tue, 26 May 2020 10:56:19 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <E3CB1347-0E32-416F-9837-A955BF0F0613@gmail.com>
References: <58a733f5aac22446c8cab43535aaa2a133a20717.camel@fuzziesquirrel.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On May 22, 2020, at 3:46 PM, Brad Bishop <bradleyb@fuzziesquirrel.com> =
wrote:
>=20
> Hello
>=20
> I wrote this article on data in OpenBMC to begin an attempt at making
> it easier to find data, when porting new systems to OpenBMC.  I say
> begin because I only documented three repositories.  The idea is that
> more would be added to the list over time.  My intent would be to add
> this to the docs repository or to the wiki.  I would love to hear any
> feedback on my article or any ideas anyone has on data in OpenBMC.

Nice! Definitely a point of confusion for people so having something
like this to reference and point to the more detailed areas is great.

What=E2=80=99s your vision for this article? A doc repo? A wiki? Wikis =
def
make it more likely to get updated.

>=20
> thx - brad
>=20
> ----------------------------------------
> # Data Driven Applications in OpenBMC
>=20
> **Purpose:** Describe techniques for finding data in OpenBMC.
>=20
> **Intended Audience:** System integrators, system engineers, =
developers porting
> systems to OpenBMC.
>=20
> **Prerequisites:** None
>=20
> If you already know the techniques for finding data in OpenBMC, skip =
ahead to
> [the list of OpenBMC applications with
> data](#list-of-openbmc-applications-with-data).
>=20
> ## Techniques for finding data
> ### Runtime configuration files in bitbake metadata
> Some applications consume data in the form of runtime configuration =
files.
> Runtime means the application loads the configuration data when it is =
invoked,
> on the target (on the BMC).  Configuration files are =
`/etc/<packagename>.conf`
> or in `/etc/<packagename>/` in the target's root filesystem.  The =
format of a
> configuration file is application specific.

Not sure if this doc is the best place but I=E2=80=99d like to see a =
best practices on
file format (i.e. use .json) and runtime config file locations (i.=10e.=10=
 /etc/ /var type=20
decisions). Also, the recommendation to make your data runtime config
vs. build time config when possible (to make live debug/test easier).

