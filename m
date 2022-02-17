Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A2C4BA3D5
	for <lists+openbmc@lfdr.de>; Thu, 17 Feb 2022 15:58:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzycY1CNQz3cPD
	for <lists+openbmc@lfdr.de>; Fri, 18 Feb 2022 01:58:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=tORuF7e3;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=S4zqm7QB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=tORuF7e3; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=S4zqm7QB; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jzyc62m1hz3bcn
 for <openbmc@lists.ozlabs.org>; Fri, 18 Feb 2022 01:57:41 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C29595C017C;
 Thu, 17 Feb 2022 09:57:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 17 Feb 2022 09:57:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=TUjvHNV5+Gec7Ouno7Ey/A9489K0PpdLzGs6SZ
 YwmRQ=; b=tORuF7e31SR0hX6vIgPTrj6rmjdOSzVIf3PbtUUH5xvj0A6CyN13k0
 iyad7xQV/WxSpg5g3+QjSZAmNaO4umJGuyaIIUoUpq755xzqu+vW0gUPJ5aL9jTx
 uxG+6HDSEke5UryTPTMOfuUTFQFp8mOK/cW4SprBCVAzx/BtGgdzRr8LCWDxocrE
 vpQmWp0LfqDJA+Q89fi84gJwZJC+65rigaBr8ga8Um/8Ze7fRa/gZ23kegGVJYl0
 myfESs35Tv6MC9PBQejXISo741WXE9LNRmX4ZOln2bGznlgfrR/0SR5eHg49iath
 3tAYsFlFQ9XUk3/BtjCfBUdJLnvAm4Bw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=TUjvHNV5+Gec7Ouno7Ey/A9489K0PpdLzGs6SZYwm
 RQ=; b=S4zqm7QBz9/RQBUEg44VWd6zrp5isAQtRaBVETy9nBza3dXOlaz7yLRAl
 BgZRr46UBkfu8cvBdrXIQ9MXz/qfDWL/M26VL/C6XL50kr2lotloG/yq+1z3AlfX
 pJhk614SJP/Jbg1D7SQ3b6h4726p+yCWr1IK0b2+Xt9lnhkLCJ1ukgbpLZd/x9Hh
 5PDSpymljhfgu0ZfdgjBmlmt99+sppILQ84yac4olevBTYe+3hAaUtJgH5AhOmSf
 eQjs2TPvs9gUOctEtm1FLy3vOLQGMNclPqG/0xt5qwBOjZX/ZWSEjEmUc1FUEHWl
 9vPVvulB+r+kNR+mUzxqSuO0RaxSg==
X-ME-Sender: <xms:YWIOYpRrLiCT3Ud4UKcgnWzbZ6Doyy_BABId0XOGITjCsfgSdXsaFw>
 <xme:YWIOYizi0DQoATqT4JYYrEvX63DRXaE0swDTYs6eYoXhRaqoKBmI1dPOmfyF6XxzN
 YjX9I-UA7saKkb6GQM>
X-ME-Received: <xmr:YWIOYu0sFMjMxyB4pT4evt5vpj5MscDCNOumxuye5TGj1ZpxcikVWn9ESHbenQvjD6rnxg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjeekgdeilecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurheptggguffhjgffgffkfhfvofesthhqmhdthhdt
 vdenucfhrhhomhepuehrrgguuceuihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiih
 gvshhquhhirhhrvghlrdgtohhmqeenucggtffrrghtthgvrhhnpedttefhtdegudefteeg
 gfetueelgfffiedvheeifefhtdfgledvvdehkefgfeeufeenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsrhgrughlvgihsgesfhhuiiiiihgv
 shhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:YWIOYhB7U4avo43uR53tlI0mIXDyuu8eJpISdf84t3YrgdC_V1_QuA>
 <xmx:YWIOYiiKH8EIzodcalrjwxJlLy0umN_NRq236o37tpsDaNA2FgYwzA>
 <xmx:YWIOYlpfVB5-eGSaDetffdmTPPF3tIbAda52y0fQQl0Bn4a-pJWtKQ>
 <xmx:YWIOYmbY2P5viFflCy45HBSpN6ZuUsEOb-VwIbs-Mx-EdEp19znD1w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Feb 2022 09:57:37 -0500 (EST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: Upcoming OpenBMC release 2.11
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <YgbNmq8SVgJMHXcn@heinlein>
Date: Thu, 17 Feb 2022 09:57:36 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <4AF3D7E9-4752-4AF5-B556-BAD50F9560BD@fuzziesquirrel.com>
References: <YbposjOPwc1puNvR@heinlein> <YehtxgLG3KlzKFAk@heinlein>
 <CAH2KKeY_aGKzp+BjYJPagjWAR2WLuqeib4aPy2nBjSc4_ed_zg@mail.gmail.com>
 <YgbNmq8SVgJMHXcn@heinlein>
To: Patrick Williams <patrick@stwcx.xyz>
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>, Thaj <tajudheenk@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Feb 11, 2022, at 3:56 PM, Patrick Williams <patrick@stwcx.xyz> =
wrote:
>=20
> On Fri, Feb 11, 2022 at 03:33:12PM +0530, Thaj wrote:
>> Hi Patrick,
>=20
> Hello Thaj,
>=20
>>=20
>> 2.9 is quiet old. There are a lot of changes after that. A newer =
u-boot
>> with secure boot support, better AST2600 support etc. A new release =
is
>> necessary.=20
>=20
> It seems that not many people who are active contributors in the =
community
> actually care about releases, so there hasn't been much effort put =
into it.
> You used the word "necessary".  Would you care to expand, for the =
community,
> what your use case is where you rely on releases?
>=20
>> There is no 2.11.0-rc1 yet. Is it possible to initiate a release
>> process?
>=20
> The honister branch is effectively the '2.11.0-rc'.  I don't have =
permissions
> to create tags myself.  I'll see if Brad has bandwidth to create a tag =
in the
> near future.

We have a 2.11.0 tag now.=
