Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 104D8160757
	for <lists+openbmc@lfdr.de>; Mon, 17 Feb 2020 00:38:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48LNpY5v4kzDqc9
	for <lists+openbmc@lfdr.de>; Mon, 17 Feb 2020 10:38:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=FVxYOZVu; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=BbC/Q2UN; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48LNng14RdzDqc4
 for <openbmc@lists.ozlabs.org>; Mon, 17 Feb 2020 10:37:25 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 8EB62312;
 Sun, 16 Feb 2020 18:37:21 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 16 Feb 2020 18:37:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm2; bh=oVvWt
 sLNTID7U8ywpAhfNWwo3hA3nnOCpuGds7DbrjU=; b=FVxYOZVu70nTDBUEwvK7k
 y7FrK5OOwy8JkaNPkri7e2a9v9WU8hA3AoO0Q6zI7iaEbNoTSBGFXMIHCUetBb5r
 OcxicW1vUf+0os1JDYf4fGTKmJxXgYMwtW8sAHm0aCuSS/fkSaKlB/56faGIGDHs
 IgT9EsePTfep59qhDV/hEcsXEgJCxzQsW8qE4y6dYrzsyssLB+te8fZDBTFbsCsD
 MEOluNssr2z6o+6dd1akfg77HQ9UbxflCJsvlVZn5wIGzlX+tWlfS4CqcN+4oWxK
 +mNdbvVhNYNRYYVMIupQNtHy9n0f2RjukMeU02FW7h5WP2hvj1U4VWQ4dHt6oHcm
 Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=oVvWtsLNTID7U8ywpAhfNWwo3hA3nnOCpuGds7Dbr
 jU=; b=BbC/Q2UNx7P1VfLXS5ejy/jDDWRsfxCJSDS8zpeeJZNMZUrQvkJyKbyAp
 K3bl31IxbMWhcxslhHdodCDmb+l2uaIcY8zfyEC2hccA9jWKH4GqRp1cke6ek5hl
 NTa0lphPo4m3USLnNKs0wCAeP2PuJbD0g3UwxaM+Zak32JTpvikedUT6j4nIChA3
 NUDpaf64917mlVbjYwdN93WfdNAqxJm/AWSFChRS9fRJqSrpQVUr1sxKWPSy3w4u
 /NFlx4zVKfWh3zkfW1OTcM7SkQGiEu6A8ej2WdWRSLWD0f+ZJIlDEDDy4D7VZWzt
 ZyVuq6AG3EY0J/zmEQseH3Q903jMg==
X-ME-Sender: <xms:MNJJXrF2_0Yn2kPHN-nd2EKk_8z94TM5eer2aZ3SbPYiYofWNfwMVw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeehgdduudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuffhomh
 grihhnpehgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
 rghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:MNJJXqu1BozSI9fgmey2hYjVlnl4gc06L05Nheay5UgmGlppsQECOw>
 <xmx:MNJJXmb9SWMZS8WgGCm4RVsuQQb0aQnLbSl-9dkRVGBVKNLSlyI3DA>
 <xmx:MNJJXsMz81lkoiXTFIgM_b2iKxftDlt2zheURX3Zh8a1IaZVilpyxg>
 <xmx:MdJJXgk3OPC6EBZauT-2yLpLRuXl3RIBeb0hIcm_QbvRhhGa0yIv5A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 4994EE00A2; Sun, 16 Feb 2020 18:37:20 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-802-g7a41c81-fmstable-20200203v1
Mime-Version: 1.0
Message-Id: <2c599df0-6de4-485c-b5aa-bff816348a09@www.fastmail.com>
In-Reply-To: <a30efe6c-83b2-8f25-5cd6-7a70ab1113f9@linux.ibm.com>
References: <a30efe6c-83b2-8f25-5cd6-7a70ab1113f9@linux.ibm.com>
Date: Mon, 17 Feb 2020 10:07:13 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Matt Spinler" <mspinler@linux.ibm.com>,
 "James Feist" <james.feist@linux.intel.com>, openbmc@lists.ozlabs.org
Subject: Re: Redfish message registries, plus translation
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Sat, 15 Feb 2020, at 06:27, Matt Spinler wrote:
> Hi James,
>=20
> It's looking like in our future we will have to provide:
>=20
> 1) Redfish logs using multiple message registries that probably can't =
be
>  =C2=A0=C2=A0 hardcoded into hpp files and checked in.
>  =C2=A0=C2=A0 - For example, a registry for our host firmware and hype=
rvisor errors,
>  =C2=A0=C2=A0=C2=A0=C2=A0 as our BMC handles displaying logs for them,=
 that we would pick up
>  =C2=A0=C2=A0=C2=A0=C2=A0 during our build process.
> and
>=20
> 2) Message registry text in multiple languages
>=20
> Those being my goals, I have a few questions:
>=20
> In general, is the multi-language strategy to just provide a standalon=
e
> registry array for each language which the code then selects based on =
the
> Language property?
>=20
> To support both of the above, would you be open to having functionalit=
y=20
> added
> to read in registries from data files, including based on language? Or=
,=20
> would you
> have any other ideas for how to support these items?

Bit of a drive-by question, but shouldn't we be using GNU gettext[1] to
handle translation?

[1] https://www.gnu.org/software/gettext/

Andrew
