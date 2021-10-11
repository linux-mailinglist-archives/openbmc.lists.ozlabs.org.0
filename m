Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 496E4429641
	for <lists+openbmc@lfdr.de>; Mon, 11 Oct 2021 20:01:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HSmnk6Rtbz2yS9
	for <lists+openbmc@lfdr.de>; Tue, 12 Oct 2021 05:01:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=QdI+Opdy;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=ODEwj31s;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm3 header.b=QdI+Opdy; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=ODEwj31s; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HSmnG6HVSz2xss
 for <openbmc@lists.ozlabs.org>; Tue, 12 Oct 2021 05:01:06 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id CD3565C0115;
 Mon, 11 Oct 2021 14:01:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 11 Oct 2021 14:01:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=content-type:mime-version:subject:from
 :in-reply-to:date:cc:content-transfer-encoding:message-id
 :references:to; s=fm3; bh=LeF+75auewHD+dZ71kiS0+twWRwu91eWN+049K
 la8c8=; b=QdI+OpdyvQUYUOBmJC7oEYcNLLkYfKlRqt/UdJno1uM5EdYqPf4d6H
 W57TrCcj/Snfr+a/uLGSoIESrpDJnIZ54t0W6WmksM3324pAZ+/d3FhBSrD3/wt5
 LhO70GGhWSyFOOsN/Bks2YE09oF0TR+RQjRb2S53Adywbasth3iSNofNz19sdKE0
 0SnfL/3FubWQwC7wgUb+UdTGZPi7Ugc+DqFhUjU/6gabKiUrawcXjnj0tEKG0dwU
 QPnVVqlAPVe219wYkudEntFR0Kj/2tEqEWaeaDOvWt5xx3KJxIa44Il/Ygf5phTU
 Hmu9jIf2GVbKYNwYmx1oIhowGmhCUkMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=LeF+75auewHD+dZ71kiS0+twWRwu91eWN+049Kla8
 c8=; b=ODEwj31saYJRVgZHQsyHo1lcEk65N4sKcgNN9vw0SrQR1ixUmNx6i+Rqy
 1E1riAXECC1tAUsnsBIC/cDbaj0AvsH3khgX/xoFKrDEHEW3NugabyzE6ghZw2nt
 qdS9sG26Z1M7HYT2FyP4djV8AKyPWXdLng+X4z9+FN+XnWsLMhYKSZI9ZeATJi8w
 80KClvLFfJ5/6qKK9dChp6BQQRCWq2wr1aUwquBB8ifIP7NSWyqZ0s/kqiNul70i
 XZXDU4My3eiynqdDUZcbUTDhV3ktN9kPS5l8EnvLyOleHedByuF7HmYA1JEmDFAz
 PECp+YTGcqO+0BysGFWh6c8D4k7qw==
X-ME-Sender: <xms:4HtkYU73oXhbqQwpggjU4r6usU6bxCGvho0K9_Y4HlPZx07w8X089w>
 <xme:4HtkYV58BMnJvSRvPVbrBRFL8_2BbqCePZWw_4BtJEHmpniFV1udJMi8oP3RfcCKp
 oUoucdlx8zN3H06jjQ>
X-ME-Received: <xmr:4HtkYTfArcBjLbRG42uwIsz4x6_Gbs2SX5EIF9UImjC5Tp5c68wfsO_m-LWcg-HaApcnPA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddtiedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurheptggguffhjgffgffkfhfvofesth
 hqmhdthhdtjeenucfhrhhomhepuehrrgguuceuihhshhhophcuoegsrhgrughlvgihsges
 fhhuiiiiihgvshhquhhirhhrvghlrdgtohhmqeenucggtffrrghtthgvrhhnpeetkeeile
 etueehteeutdelfeefgfekffduffeufffhueeflefhteeijeetudffleenucffohhmrghi
 nhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtgho
 mh
X-ME-Proxy: <xmx:4HtkYZKtQ0561vFqNY-vb_RROgjswlzkii51-UsBE0ehNMHeIqFy7A>
 <xmx:4HtkYYLXnfszjdHirNdBjxMtuAz1zdpGE94nkv0oNjGCzSSX-A397A>
 <xmx:4HtkYawqktoJ6wYv3ByVfPe837J9QIr3qgqE5jC_WtDcKFjHtHCt5Q>
 <xmx:4HtkYfWSxxhu0JKa1sGhUH5s4n8KrwiBvDcLS8Lgnhrtll_rX7dr0g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Oct 2021 14:01:04 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: Softoff features in PLDM lib.
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <702956f7-e667-8fd5-ed8c-4ddafbe67ccd@amperemail.onmicrosoft.com>
Date: Mon, 11 Oct 2021 14:01:03 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <C7E88C14-8945-4556-8B2A-0C871398320C@fuzziesquirrel.com>
References: <702956f7-e667-8fd5-ed8c-4ddafbe67ccd@amperemail.onmicrosoft.com>
To: Thu Nguyen <thu@amperemail.onmicrosoft.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, liuxiwei@inspur.com,
 duanzhijia01@inspur.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Oct 9, 2021, at 7:47 AM, Thu Nguyen =
<thu@amperemail.onmicrosoft.com> wrote:
>=20
> Dear Chicago Duan and George Liu,
>=20
>=20
> In PLDM source, I saw that Inspur supported graceful shutdown the host =
OS thru PLDM commands.
>=20
> =
https://github.com/openbmc/pldm/commit/184f60263a0e4c3dda934d94ecb2a904ef8=
35299#diff-59fd39a9594f6d6f82af25037f211858fafa418aacc055e85b4cc29abccf9de=
e
>=20
> The feature used PLDM Platform SetEffecterState command to request the =
host OS shutdown.
>=20
> I wonder which part in the host software will response for this PLDM =
request?
>=20
> Does the host OS ( Centos, Ubuntu...) directly handle this type of =
command?
>=20
>=20
> Thanks.
>=20
> Thu Nguyen.

Some POWER architecture servers run a type one hypervisor called =
PowerVM.  This is the only operating system I=E2=80=99m aware of that =
has a PLDM implementation.  If anyone watching is aware of any others =
please correct me.

The BMC code you reference was written specifically with PowerVM in =
mind.  In theory any software running on the host processor _could_ =
implement mctp & plum and support this effector but I honestly don=E2=80=99=
t ever see that happening in say, Windows or a typical Linux =
distribution (Centos, Ubuntu...).

How did you implement soft-off-via-bmc before OpenBMC?

I=E2=80=99d be curious to know how this soft-off-via-bmc functionality =
is typically implemented in x86 or arm based server designs with =
arbitrary operating systems.

thx - brad=
