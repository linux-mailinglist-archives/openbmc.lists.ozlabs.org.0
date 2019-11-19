Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C00102E1E
	for <lists+openbmc@lfdr.de>; Tue, 19 Nov 2019 22:17:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Hdv56jbhzDqLS
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 08:17:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32b;
 helo=mail-ot1-x32b.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OhYyJjS5"; 
 dkim-atps=neutral
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HdtV0rKDzDqCD
 for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2019 08:16:47 +1100 (AEDT)
Received: by mail-ot1-x32b.google.com with SMTP id u13so19273480ote.0
 for <openbmc@lists.ozlabs.org>; Tue, 19 Nov 2019 13:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=pDJlTmNyegtJ/3OOvlZd4EZokIEqZbc7HwoAq8mXfuo=;
 b=OhYyJjS5c/krN82zlDzBQz+BGQWn29Y/ppPBV2g26/HdKUCjFr5Du1wGuo5e/Lm8Gy
 1Vv8NmPCjBqaLpLfbwS8qs/TNi6wXVrvykeWkW4qMGDi+ZxNa3OTAyqCu5nwroxYBMcW
 d36A3b79cBZuW/HpUY37G+6nSJmF7kzGaSPuvFvU6OoyM5DdG4jlBqP/hjOyP6TIXn2j
 05zTuzFyqVF5Vv4eGS4egmHIuldkqUEyR+d6BLA+buvT2XsJ72nUn+YB28c3IbXEHtAM
 BYrg5ATH5FVyFpuFjINPZDqCCluvV/Ro+HNES3ytbUVZx2x8tXL3EAs3mWVWknxRaVcq
 NTOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=pDJlTmNyegtJ/3OOvlZd4EZokIEqZbc7HwoAq8mXfuo=;
 b=p/Z5f6qMUiYMWeTRBGlGTpcRENH1kN2YQ7NZQ5saP528WU0IRTJOfCnRzMBJuGIYb4
 9RChaEILNc5Way/3mrGX/CEkTpqHsJGd7g60NZqBTZovReTyDNhLfps4h+eW/vQAG7qI
 1ASHefvhGqzLVXDbYsXU0QbJn03vSal0+cj9PA1MJr9R37Ra7ReLnEPPabWbldroRX0N
 KIaYXaOfCrrgRJZj4FqWYDX59ZEwkmoTDmFYpqdTAidY1qsUqHM5FGUlw0JcLDRulMcG
 ABX48VmVJTvb8pRne62w6GmIIe84ecuPom/KtYxDYRf4d1xFLnVuFGyzZV4iiVbAehVp
 pJuA==
X-Gm-Message-State: APjAAAVfvzR4yBFE15NJfFcBcpYpsKuAApJz9YH+4kgxnwx5hmPmmj1v
 +j7qDFNa7zzyOFDa6CQxgPk=
X-Google-Smtp-Source: APXvYqzoDYrWPzEmAMFSSUkK7Z9lBmOl7Ud+su4iQeUyROyausmPeILOdJC/7D8jALd5dOkFlOETmA==
X-Received: by 2002:a05:6830:155a:: with SMTP id
 l26mr5545606otp.119.1574198203899; 
 Tue, 19 Nov 2019 13:16:43 -0800 (PST)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:c810:fa2c:7dc8:2e7f])
 by smtp.gmail.com with ESMTPSA id z66sm7885611ota.54.2019.11.19.13.16.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Nov 2019 13:16:42 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: 2 patch dependency
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <20191119165440.GB93344@patrickw3-mbp>
Date: Tue, 19 Nov 2019 15:16:42 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <6E519880-9A69-411B-8DD4-BF86AB7E543C@gmail.com>
References: <EACBC95B-0761-4667-A622-E1C0EA6EF1ED@fb.com>
 <E782C583-DBB7-4589-BFE6-EC69E2343424@fuzziesquirrel.com>
 <20191119003509.GA80304@patrickw3-mbp.dhcp.thefacebook.com>
 <2231F8C7-719B-468B-BABB-92AF197F92C8@gmail.com>
 <20191119165440.GB93344@patrickw3-mbp>
To: Patrick Williams <patrick@stwcx.xyz>
X-Mailer: Apple Mail (2.3601.0.10)
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Nov 19, 2019, at 10:54 AM, Patrick Williams <patrick@stwcx.xyz> =
wrote:
>=20
> On Tue, Nov 19, 2019 at 09:45:34AM -0600, Andrew Geissler wrote:
>>=20
>> I know in general we really try to encourage people to not cause
>> co-req issues across repositories. Making this easier for people
>> may cause more of it to happen.
>=20
> I understand and agree.  I don't know how often this kind of breaking
> behavior has happened, like these IPMI related changes, it was just
> coincidentally at the top of my email queue as I've started digging
> through.
>=20
>> Also, I believe we=E2=80=99re going back to just having everything in
>> openbmc/openbmc so that should alleviate a lot of our meta-*
>> co-req issues since they can all go in together again. Brad was
>> working on getting the gerrit plugin running that allows people
>> to maintain sub-directories in a repository. This will allow multiple
>> maintainers of openbmc/openbmc for their specific areas.
>=20
> Ooh.  Was this talked about on the mailing list somewhere?  I've gone
> back through at least August and haven't come across it.  Was there
> an exploration of moving to `repo` instead?

May have only been IRC, I=E2=80=99ll let Brad handle this one. I just =
know
that my vote is to get away from subtree. It made the dev process
more difficult/complex and it doubled the required capacity of our CI
infrastructure.

>=20
>> So to answer your question, I=E2=80=99m not sure. I think it could =
still
>> be useful to have between code repos and openbmc/openbmc
>> at times but I=E2=80=99d rather people just do the extra work to =
avoid
>> dependencies all together.
>=20
> Another "first step" might be to get a Jenkins job for code =
repositories
> that builds the full openbmc/openbmc stack with the code change, so =
that
> we can identify breaking changes like this before they are merged.

Yes, this is definitely on the list. We run redfish validation on all
images and it continues to find good regressions but that=E2=80=99s =
always
after the code has been merged into bmcweb and pushed up to
meta-phosphor. We would like to at least enable this feature
(full flash image build) for bmcweb so we can get this
coverage earlier. Once we get rid of the meta-* layer CI
we should have enough compute power to do this.

> AFAIK, the code repo Jenkins jobs are still independent from the Yocto
> recipes, correct?

Yes, still independent. So we=E2=80=99d run that normal code repo CI
and if that passed, do a devtool or recipe update to build
the change into a bitbake image for further CI.

>=20
> --=20
> Patrick Williams

