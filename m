Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FA92E287B
	for <lists+openbmc@lfdr.de>; Thu, 24 Dec 2020 19:06:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D1yh471hgzDqQ8
	for <lists+openbmc@lfdr.de>; Fri, 25 Dec 2020 05:06:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=sgG10+aA; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=WnznbKJ8; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D1ygP4Y0yzDqLy
 for <openbmc@lists.ozlabs.org>; Fri, 25 Dec 2020 05:06:02 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id ACB3E5C0101;
 Thu, 24 Dec 2020 13:05:58 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 24 Dec 2020 13:05:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 content-type:content-transfer-encoding:from:mime-version:subject
 :date:message-id:references:cc:in-reply-to:to; s=fm3; bh=yJP6l09
 GBoLU1xnDu0gEKJZOA8FGBIxAFFVqKsyTq9I=; b=sgG10+aATmQIHDDdcCFt9YY
 mWsZFaTTCDTEgVqf2tVTc1m134k1GGQ1WoLBV77orehXI2JmsV9eET9++9YAcukJ
 J/3b9kPP4438Hy+zIeMN/qFCQHdFYKqItRjWhajNxVBpf3rai4C+qwjA920R0rRU
 b6xz1OnvCduh+GMjlwJQZYFuZcae3zPOVaq/p1SNWTrB5RiyZUArXSkmrFvi9Xb/
 0jHkTnKHf2YauHTI8+lxuYMVDYwVLNV0Gr/p6fbkqrTmDz8ldYCLkVSC2rKtGrBe
 4AlMRH82k3/kPIW0zDOqwmB1P1NcKhMPILvJypL5UYlOs079GwglsGlHGtCG5qQ=
 =
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=yJP6l09GBoLU1xnDu0gEKJZOA8FGBIxAFFVqKsyTq
 9I=; b=WnznbKJ8+fHKk6WTB+X3AJ5lj9TstLt2Ay7DjiqPxsBcZRZWXZEUlqidk
 kVb76JldzWRuXWqGsaRFdmAYDEXc8skNnosloyNNvVuqxZVj1YjuzvqBcyygsvkV
 4hh7hvC/ainke9VHMYaCFJhpAB3c0s16UUh18tmI0Yo7LYY4+Qm2SsdXZfH3nzy7
 7crXUJ6SvI23BlJHVIOQaW4U9DJqEr1Hx5Vp08frWJlqtx4B3z5GAWERAc2ySBfQ
 0ksPZPoq1ww1BQ7+7hpbh8Bilmii25PBTWJdLswex/GprenLyaOLMlpIJQTIpG3j
 dEvLnYTYDqW8QL/PmjgIvNXs/aC5A==
X-ME-Sender: <xms:hdjkX1g4mL6jx5vjmqx2wF1dbugQqXP5Fg0Qbej65q213XDkW11C5g>
 <xme:hdjkX6AphXJjoULoGopGkNZ7XEnsvI-fLR2f0olvZu-InGntUbaZjNjYjFvx4vzRh
 0jd3wH0zvnLQ24CJlw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddtledguddtlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdefhedmnecujfgurheptgfghfggufffkfhfjgfvofesthhqmhdt
 hhdtjeenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkh
 esshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepvdelueduffdtvdfgueetveeh
 tdevtdefleevtdevtdeivdeitedujeetvdfgudegnecukfhppeejiedrvdehtddrkeegrd
 dvfeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
 phgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:hdjkX1HR-HxSDB39XU1VOCsZ2fv7pJIxo5rEpHC8NtsGXAO5BZlX-Q>
 <xmx:hdjkX6RRjzt2zFWjJNjCiRvjdjU8bdjrZQALshbvjftVWHBD29iP2w>
 <xmx:hdjkXyzf0tYJNXM9x6If8K2OBbtBl7aiglN5WhSrgGE4i3PiHzqrJA>
 <xmx:htjkX4ZnFl5wJwjq76y9N38JDdOZ8VfaNY7GU1sxQYrNLkXuq_PJDw>
Received: from [192.168.2.57] (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id A59A5108005B;
 Thu, 24 Dec 2020 13:05:57 -0500 (EST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Patrick Williams <patrick@stwcx.xyz>
Mime-Version: 1.0 (1.0)
Subject: Re: peci-pcie CI issues
Date: Thu, 24 Dec 2020 12:05:56 -0600
Message-Id: <EC305987-22B3-40D2-86A6-4FF95B395956@stwcx.xyz>
References: <6c2c44435e704f6eee95b7e35cbc39ccfae32b62.camel@yadro.com>
In-Reply-To: <6c2c44435e704f6eee95b7e35cbc39ccfae32b62.camel@yadro.com>
To: Andrei Kartashev <a.kartashev@yadro.com>
X-Mailer: iPhone Mail (18B92)
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
Cc: "jason.m.bills" <jason.m.bills@linux.intel.com>,
 openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

We have had this issue with a number of repositories lately. The most recent=
 version of boost::asio does not allow -fno-rtti.  The makefile needs to be c=
hanged to no longer force this option.=20

Sent from my iPhone

> On Dec 24, 2020, at 9:48 AM, Andrei Kartashev <a.kartashev@yadro.com> wrot=
e:
>=20
> =EF=BB=BFHello Jason,
>=20
> I push several patches to peci-pcie repo, but looks like CI broken
> there. Could you take a look on how to fix CI?
>=20
> [ 90%] Building CXX object CMakeFiles/peci-pcie.dir/src/peci_pcie.cpp.o
> In file included from /usr/local/include/boost/asio/execution.hpp:19,
>                 from /usr/local/include/boost/asio/system_executor.hpp:20,=

>                 from /usr/local/include/boost/asio/associated_executor.hpp=
:22,
>                 from /usr/local/include/boost/asio/detail/bind_handler.hpp=
:20,
>                 from /usr/local/include/boost/asio/detail/wrapped_handler.=
hpp:18,
>                 from /usr/local/include/boost/asio/io_context.hpp:23,
>                 from /usr/local/include/boost/asio/io_service.hpp:18,
>                 from /home/jenkins-op/workspace/ci-repository/openbmc/peci=
-pcie/src/peci_pcie.cpp:22:
> /usr/local/include/boost/asio/execution/any_executor.hpp: In static member=
 function =C3=A2=C2=80=C2=98static const std::type_info& boost::asio::execut=
ion::detail::any_executor_base::target_type_void()=C3=A2=C2=80=C2=99:
> /usr/local/include/boost/asio/execution/any_executor.hpp:811:23: error: ca=
nnot use =C3=A2=C2=80=C2=98typeid=C3=A2=C2=80=C2=99 with =C3=A2=C2=80=C2=98-=
fno-rtti=C3=A2=C2=80=C2=99
>  811 |     return typeid(void);
>      |                       ^
> /usr/local/include/boost/asio/execution/any_executor.hpp: In static member=
 function =C3=A2=C2=80=C2=98static const std::type_info& boost::asio::execut=
ion::detail::any_executor_base::target_type_ex()=C3=A2=C2=80=C2=99:
> /usr/local/include/boost/asio/execution/any_executor.hpp:851:21: error: ca=
nnot use =C3=A2=C2=80=C2=98typeid=C3=A2=C2=80=C2=99 with =C3=A2=C2=80=C2=98-=
fno-rtti=C3=A2=C2=80=C2=99
>  851 |     return typeid(Ex);
>      |                     ^
>=20
> --=20
> Best regards,
> Andrei Kartashev
>=20
>=20

