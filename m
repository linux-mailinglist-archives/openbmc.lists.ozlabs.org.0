Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9307436BD5B
	for <lists+openbmc@lfdr.de>; Tue, 27 Apr 2021 04:33:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FTm5p48XQz2yxn
	for <lists+openbmc@lfdr.de>; Tue, 27 Apr 2021 12:33:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=M3dIZkgb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c30;
 helo=mail-oo1-xc30.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=M3dIZkgb; dkim-atps=neutral
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FTm5Z0Ls7z2yQq
 for <openbmc@lists.ozlabs.org>; Tue, 27 Apr 2021 12:33:03 +1000 (AEST)
Received: by mail-oo1-xc30.google.com with SMTP id
 m25-20020a4abc990000b02901ed4500e31dso5773955oop.1
 for <openbmc@lists.ozlabs.org>; Mon, 26 Apr 2021 19:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=FJDQhyiDPcV87sMVqR9DMSohss4URBFVfTV3/Dea52k=;
 b=M3dIZkgbm77nt3M7LimrXALbeyHnFpbPX9pttl093VjZrmmgpcw/unL6Qu0g9zMWXm
 FgIxL7aCC46xGrTn6TYca9928PA5KmRN0NI60zZT6wlz5Ctfy+o19LyCpBJXo7282NlM
 REMEH7AcyGS6NKNsoL68cEn68wMoNle9cuuWM2iQMbWeHvXo9BvMtyPHzBrBwgiLB4la
 jRQb7T3QF0KKwp02A3Ou5IGZouReQec+B7aFEuc+2pnUWdvkDpz8Vx2Dp6Q4/c99GhVI
 6fSk6glOxdDOPjPUMxlrEKZKhzZrf+ijmJZDIk0usrab0fyNqxOlF7I42l2XemVl6mZu
 Xu7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=FJDQhyiDPcV87sMVqR9DMSohss4URBFVfTV3/Dea52k=;
 b=juvyZrtdMdlEL9rgKJlh5CvK4YAxcrSah1LTvslK3tsUHgj/z3VaUai1vTHVhCOWgr
 7BB4lwWliPVY6lLmnBlGaFRoJAH5CvquhiP74HKL6wmFiTWkQANNbLEFKChIlTOqZdrU
 8Q9nDsbDemCThYXZGwJbm5Z/r8pBxO4de2A9SdMaHDSLC04XgyZOwXutEafs94WifXaj
 egnzaCnm4hOKmR93LPH3X+sY8+QeZKKA+TlJBfHEas3W7P1rAuw6DktIDFtS/XXVxl4Q
 yOxpGR8j9Pr9S452zJJvItch/vp2ZP4/tBFLOaovG7KBeX0U7QBvklSIiIrbzxveXJcH
 n7MA==
X-Gm-Message-State: AOAM532y9LpQpx0rXqrztMCthszjtX95vRtAiqO0JgoSuA8d1fZ0V/F+
 QJg7ipmXFrr0CmvuiUBipY4=
X-Google-Smtp-Source: ABdhPJzHIeS7I4ad8AwytVgjhazKc4dVV8sYNYGe2BfZMbrj4vn9polaz/DuS4xTkb/i2rV4s+c9dw==
X-Received: by 2002:a4a:3904:: with SMTP id m4mr15738970ooa.47.1619490779504; 
 Mon, 26 Apr 2021 19:32:59 -0700 (PDT)
Received: from [10.25.18.6] ([70.39.92.27])
 by smtp.gmail.com with ESMTPSA id c1sm127560oto.20.2021.04.26.19.32.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 26 Apr 2021 19:32:59 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [pmbusplus] userspace i2c, pmbus interactions
From: Mike Jones <proclivis@gmail.com>
In-Reply-To: <CAHBbfcXj57K66ARd2_SQMCdNTPVtWk8Xrq0jn_k+WghjRcT-CA@mail.gmail.com>
Date: Mon, 26 Apr 2021 20:32:58 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <015CB0F4-95C4-46FA-975A-595F8685405D@gmail.com>
References: <CAHBbfcXj57K66ARd2_SQMCdNTPVtWk8Xrq0jn_k+WghjRcT-CA@mail.gmail.com>
To: Jason Ling <jasonling@google.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Jason,

I am interested, because within the PMBus Specification Committee, we =
are working on a data language intended for device programming. And =
there is hope that eventually it can become adopted into linux and/or =
OBMC.

There is a particular use model that is being driven by the IC suppliers =
and their tools. One reason is that all the vendors have proprietary =
tools, but they see no competitive advantage, and would rather support a =
universal standard.

Imagine that programming might be done for:

- ICT
- Proto Builds
- Engineering Bringup
- Remote upgrades

And the context is more than CPU based systems, but includes Networking, =
other boards with ASICS, etc. So broad context. Hence, it has to work =
within linux without OBMC.

My view is it is a linux library anyone can use, and OBMC is the piping =
if it were exposed to a web service, state management, etc.

Now, imagine the IC manufacturer's tool produces a file that can =
represent a qualified algorithm that is known to work under all possible =
scenarios, including CRC errors in parts, corrupt NVM, etc. This is what =
all the vendors do today. They take care of all the things that can go =
wrong. In the case of ADI, if power was lost while programming, and the =
BMC or linux can boot from an aux supply, our data files (encoding =
algorithms), can repair the part under ALL possible random values in the =
corrupt part.

Furthermore, an integrator (CM, Design House, software team) has to deal =
with segmented I2C busses, muxes, etc. And the integrator wants to write =
a wrapper file that integrates all the vendor files. So this integration =
file has to take care of muxes, order of operations, calling vendor =
files, etc.

My interest is two part:

1) I am interested in anything that enables our work
2) I am interested in inviting someone from the community, not IC =
vendor, to our meetings to offer advice and help us define something =
useful

Mike



> On Apr 23, 2021, at 4:22 PM, Jason Ling <jasonling@google.com> wrote:
>=20
> Hi all,
>=20
> What started as an attempt to create a simple command line tool to =
perform pmbus device upgrades over i2c has turned into the start of a =
user-space i2c library (with some pmbus support).
>=20
> I've already reused this library in some other obmc applications and =
it's been fairly well unit-tested. It also comes with all the public =
interfaces mocked (so you can unit test your own code).
>=20
> The idea is that more and more classes get added that will support =
different pmbus devices.=20
> General idea is that each device that gets support can expose methods =
to allow device upgrade, black box retrieval, etc..
>=20
> Anyways, wanted to gauge community interest in this so I can determine =
how motivated I should be to upstream it.
>=20

