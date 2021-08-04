Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5567E3E0ACE
	for <lists+openbmc@lfdr.de>; Thu,  5 Aug 2021 01:24:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gg79H19TWz3cRf
	for <lists+openbmc@lfdr.de>; Thu,  5 Aug 2021 09:24:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=mtHcwAjF;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Lf+czWyK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=mtHcwAjF; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=Lf+czWyK; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gg78v2ldfz301s
 for <openbmc@lists.ozlabs.org>; Thu,  5 Aug 2021 09:23:42 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 914DD5C00F7;
 Wed,  4 Aug 2021 19:23:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 04 Aug 2021 19:23:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 content-type:content-transfer-encoding:from:mime-version:subject
 :date:message-id:references:cc:in-reply-to:to; s=fm2; bh=veWJ6eL
 5xIRRq/XEDC5+8dGL4PKRQSxvKsXUD1TvO8Q=; b=mtHcwAjFUEBELf/fTytmR3B
 2J/UB1F+uEdHrGSmijsWj6wwQKtNczook6IJJ24It9pFTxvEE4d2zXnssh1DgSPD
 k5OWmdwWWbwgivBzHaY23TfAD3ZR90n/qT3zuEM4Uv6sqNDh4f1PFJOavTuiIMwE
 vEs6zHADz1Z2YDgQbIvCw5DZTPxPOyi06PoBDXmbwL2qIiGS44u1lW2pde7l25jy
 1RnyuL75+z2e4CEaX5MOGbqzUresCHAH1wrkHClJ6zuQRMiMBUQJTafv+VSlFJMY
 WPuUNjLMS8KxOp0cmRmaaynT8p7FPacqDfdde5WCtJF/gdxvi7/eCVHhnJw7mXQ=
 =
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=veWJ6eL5xIRRq/XEDC5+8dGL4PKRQSxvKsXUD1TvO
 8Q=; b=Lf+czWyKXi0BBh5+/WGJSMf3mlGqPTfLY3Sh21hAbxtXKacrlazTE27uA
 OUrxjIjZousQ4Yz4wDVlGsyrkUKx/BbawLZS8r3INDnQjKsZosKlArH2kCTcR0Cv
 YOAcCXX+ID8NIZh1xO5bG4dNlQ4fCqB4jNjB2ctEoyP/+l2KMYls4mrJ3YKxraKW
 lao+B0agteVTaBpXD60WKk1dl15Vws6k4Pw2MrHnMKjfI/E7zOCiovp0IR+IUwj3
 7sn+jcnO4QEess9oeq4VyPTkDz67uRId0ed7y0mcZ+PbOIwdgrl1QOOEkuq/XjwY
 4q2/ir4foePZEv6qriSEeZkOLWnHw==
X-ME-Sender: <xms:eCELYd5SXAdXPH8EdvxQsTVxDC7VL0D_vOp8jT-2Azxk9_-9L1aPIQ>
 <xme:eCELYa7YYEXSshLaRCkI-GdegzZqHsdat6x8rtwyZ7HK0FER2sUEhw3T2_KFBqc22
 VfczggNmpJpoxfYAoo>
X-ME-Received: <xmr:eCELYUfusCh1K4yfJ7XYXTpBPM6BqLrpN4Jz5JIhBFSk32mxYSNJ8bnZZYcrSzazWDdVa6MOceQfdBDFY6_fIT-Y8xQWOWyl7x68qs0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieekgddulecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddvfedmnecujfgurheptgfghfggufffkfhfjgfvofesrgejmherhhdt
 jeenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgfetvefhhffghfetueelveehvedv
 vedvfeehffffveeivdfhjeevkeduvdfgudeinecuffhomhgrihhnpehgihhthhhusgdrtg
 homhdpkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
 pehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:eCELYWKqwMkhhJT2GnpQAWwwgB5cwapMaj5QsiBkW-gjPPqoOV9zBw>
 <xmx:eCELYRJcuErdmPqWr6VD2O-kwPCfEnxJzQ-B_l3EP7eAWKrfOZFlaA>
 <xmx:eCELYfz7tXDHnPN-XTiLfUBErqx_FC9smNpP0ad9wKCbfuMRs__E7g>
 <xmx:eiELYfjfKUX0M0BX2pzEF1nw0hbpAjLYTCO1eEBciw0cnPr5RhfqpQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Aug 2021 19:23:36 -0400 (EDT)
Content-Type: multipart/alternative;
 boundary=Apple-Mail-C6D10228-5A6C-41B2-A317-BB5FB774F1FA
Content-Transfer-Encoding: 7bit
From: Patrick Williams <patrick@stwcx.xyz>
Mime-Version: 1.0 (1.0)
Subject: Re: Security Working Group meeting - Wednesday August 4 - results
Date: Wed, 4 Aug 2021 18:23:35 -0500
Message-Id: <5CC24537-286A-473D-AD11-3986848C2C9B@stwcx.xyz>
References: <YQr9RWolIR7witlQ@heinlein>
In-Reply-To: <YQr9RWolIR7witlQ@heinlein>
To: Joseph Reynolds <jrey@linux.ibm.com>
X-Mailer: iPhone Mail (18F72)
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
Cc: openbmc@lists.ozlabs.org, Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Apple-Mail-C6D10228-5A6C-41B2-A317-BB5FB774F1FA
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Has this been read through?

https://docs.github.com/en/code-security/security-advisories/about-github-se=
curity-advisories

> On Aug 4, 2021, at 3:49 PM, Patrick Williams <patrick@stwcx.xyz> wrote:
>=20
> =EF=BB=BFOn Wed, Aug 04, 2021 at 03:39:45PM -0500, Joseph Reynolds wrote:
>>> On 8/4/21 3:09 PM, Patrick Williams wrote:
>>>> On Wed, Aug 04, 2021 at 01:47:31PM -0500, Joseph Reynolds wrote:
>>>=20
>>>> 4 Surya set up a bugzilla within Intel and will administer it.  Demo=E2=
=80=99d
>>>> the database. We briefly examined the database fields and agreed it
>>>> looks like a good start.
>>>>=20
>>> Once again I'll ask ***WHY***??!?
>>>=20
>>> https://lore.kernel.org/openbmc/YNzsE1ipYQR7yfDq@heinlein/
>>> https://lore.kernel.org/openbmc/YPiK8xqFPJFZDa1+@heinlein/
>>>=20
>>> Can we please create a private Github repository and be done with this t=
opic?
>>=20
>> I don't have any insight into how to resolve this question.
>>=20
>> =46rom today's meeting: using bugzilla has advantages over github issues:=

>> - lets us define the fields we need: fix commitID, CVSS score, etc.
>=20
> These are pretty minor when you could just add a comment template with thi=
s
> information.
>=20
>> - has desirable access controls, specifically acess by the security=20
>> respone tram plus we can add access for the problem submitter and the=20
>> problem fixer
>=20
> So does Github.
>=20
> ----
>=20
> I really don't think that some subset of the community should go off on th=
eir
> own bug tracking system.  This is a waste of time to maintain and just fur=
ther
> segments this "Security Team" off in their own bubble.
>=20
> --=20
> Patrick Williams

--Apple-Mail-C6D10228-5A6C-41B2-A317-BB5FB774F1FA
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Has this been read through?<div><br></div><=
div><a href=3D"https://docs.github.com/en/code-security/security-advisories/=
about-github-security-advisories">https://docs.github.com/en/code-security/s=
ecurity-advisories/about-github-security-advisories</a><br><div dir=3D"ltr">=
<br><blockquote type=3D"cite">On Aug 4, 2021, at 3:49 PM, Patrick Williams &=
lt;patrick@stwcx.xyz&gt; wrote:<br><br></blockquote></div><blockquote type=3D=
"cite"><div dir=3D"ltr">=EF=BB=BF<span>On Wed, Aug 04, 2021 at 03:39:45PM -0=
500, Joseph Reynolds wrote:</span><br><blockquote type=3D"cite"><span>On 8/4=
/21 3:09 PM, Patrick Williams wrote:</span><br></blockquote><blockquote type=
=3D"cite"><blockquote type=3D"cite"><span>On Wed, Aug 04, 2021 at 01:47:31PM=
 -0500, Joseph Reynolds wrote:</span><br></blockquote></blockquote><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote></b=
lockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><span>4 Surya set up a bugzilla within Intel and will administer=
 it.&nbsp; Demo=E2=80=99d</span><br></blockquote></blockquote></blockquote><=
blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"=
><span>the database. We briefly examined the database fields and agreed it</=
span><br></blockquote></blockquote></blockquote><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><span>looks like a good st=
art.</span><br></blockquote></blockquote></blockquote><blockquote type=3D"ci=
te"><blockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></b=
lockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><span>Once again I'll ask ***WHY***??!?</span><br></blockquote><=
/blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span></span=
><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>https://lore.kernel.org/openbmc/YNzsE1ipYQR7yfDq@heinlein/</spa=
n><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>https://lore.kernel.org/openbmc/YPiK8xqFPJFZDa1+@heinlein/</spa=
n><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span></span><br></blockquote></blockquote><blockquote type=3D"cite">=
<blockquote type=3D"cite"><span>Can we please create a private Github reposi=
tory and be done with this topic?</span><br></blockquote></blockquote><block=
quote type=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite">=
<span>I don't have any insight into how to resolve this question.</span><br>=
</blockquote><blockquote type=3D"cite"><span></span><br></blockquote><blockq=
uote type=3D"cite"><span> =46rom today's meeting: using bugzilla has advanta=
ges over github issues:</span><br></blockquote><blockquote type=3D"cite"><sp=
an>- lets us define the fields we need: fix commitID, CVSS score, etc.</span=
><br></blockquote><span></span><br><span>These are pretty minor when you cou=
ld just add a comment template with this</span><br><span>information.</span>=
<br><span></span><br><blockquote type=3D"cite"><span>- has desirable access c=
ontrols, specifically acess by the security </span><br></blockquote><blockqu=
ote type=3D"cite"><span>respone tram plus we can add access for the problem s=
ubmitter and the </span><br></blockquote><blockquote type=3D"cite"><span>pro=
blem fixer</span><br></blockquote><span></span><br><span>So does Github.</sp=
an><br><span></span><br><span>----</span><br><span></span><br><span>I really=
 don't think that some subset of the community should go off on their</span>=
<br><span>own bug tracking system. &nbsp;This is a waste of time to maintain=
 and just further</span><br><span>segments this "Security Team" off in their=
 own bubble.</span><br><span></span><br><span>-- </span><br><span>Patrick Wi=
lliams</span><br></div></blockquote></div></body></html>=

--Apple-Mail-C6D10228-5A6C-41B2-A317-BB5FB774F1FA--
