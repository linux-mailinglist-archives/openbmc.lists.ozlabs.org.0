Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C92082AF05A
	for <lists+openbmc@lfdr.de>; Wed, 11 Nov 2020 13:16:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWNy06Bx4zDqTT
	for <lists+openbmc@lfdr.de>; Wed, 11 Nov 2020 23:16:40 +1100 (AEDT)
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
 header.s=fm3 header.b=dOyPhESK; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=T8f0WwPG; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWNvg6JzFzDqNK
 for <openbmc@lists.ozlabs.org>; Wed, 11 Nov 2020 23:14:38 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7AC695C032E;
 Wed, 11 Nov 2020 07:14:34 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 11 Nov 2020 07:14:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=wHEkg/DT+OXmb+GHMvCTuXfU10X
 aeNCUlTbRNTXy0Qc=; b=dOyPhESKZn8+kWRKB+s9RmCIoxpOunFE5AN92W/Zv4N
 K3nTRJQaovR5rOYylV2iopFnI5UGemJioInrK4OAvrnaKGITioMLbYScK1/YYyIR
 dY0QEJ5tMbbvRoN0pTOogd/GjNPY6WfmHg8hMSy4N/AbK1klMYdRq8Ea8Mfz6MpM
 kwe2+72mTlVRhvwX1LdmRqZ8IYINJOmRn5aiXZueX9p29rY9QexEpynyLlpgDDGP
 VVjz8QqnaOpPHPruK+z9FmETg1AyMN6pnuUKfHonLNyykco5rFwPVbuUnOc9Gokk
 jovSofPu+DHSKwKKlmhX2Eeh6hoU1R+/C+UpJ9dLMkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=wHEkg/
 DT+OXmb+GHMvCTuXfU10XaeNCUlTbRNTXy0Qc=; b=T8f0WwPGLPO9CrcImtzXCw
 wFvNSWSKOvQje2qFKl4HNDeGQxwTuXEjbP8zZN3d2RciBjEsUCHKFnPgCOMIfBnj
 cXmri9Qil18SUpg9aevjXkmoI1+rDlhJyrotjcuMRR0uLRVUbq3crGieq1hQMUiY
 WGA9Zyd6FwCUfYcYFLWdtFvJvIAdChfM0fhCsOLFp2PJnz+Fe5RTCxdFacq83MVW
 mRoC3NXOouYUt3LSCJfpyJxpaj/jvJ3zSW3viwSs1uVNrbaD66YuUeA1mfAjoIWf
 1rPyffwgN1S4HD25okdmuiA+obJIeG13+nr3fSWBn3m/494ijCxLorivFYwItV0g
 ==
X-ME-Sender: <xms:qtWrX8IHWU9gPDLi_AX3q3bzBNMxz0exSMiGqdCuwR9jE1dv8lEjRA>
 <xme:qtWrX8K1rnDSgHQZU7FSJolLZ845uwPG5rD56B6Xa2NaJNXPLJMAHYFDDZNoUVvTA
 opCgZ09sbC0cFLF3IY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudduledgudegjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeduudefleeuhefhleehjeejgfeu
 jeehhfdtledufeehkeduudevkeeiuddugfegkeenucffohhmrghinhepohhpvghnsghmtg
 dqphhrohhjvggtthdrgiihiienucfkphepjeeirddvhedtrdekgedrvdefieenucevlhhu
 shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghkse
 hsthiftgigrdighiii
X-ME-Proxy: <xmx:qtWrX8sH6LOUUscsHJoZf4xqoTR6NnXmeMfmK6DOigUyjm9te7IQ4w>
 <xmx:qtWrX5Yf045-Wwq1DrbOuf_OEjOZK8-nKxoBkwFfPgqhGq2Wk25kZg>
 <xmx:qtWrXzb70OxEgx5tjjTcQDjCpyQlto0X5AB8XF9PMZChu4RIzffKdQ>
 <xmx:qtWrX6xH2l-DEX65Ne49jcZOkv3FvztJRl7PGV-8e25dg36_CUj-DQ>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2621A3280065;
 Wed, 11 Nov 2020 07:14:32 -0500 (EST)
Date: Wed, 11 Nov 2020 06:14:31 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: William Kennington <wak@google.com>
Subject: Re: Request to create repository google-ipmi-bmc-health
Message-ID: <20201111121431.GI3614@heinlein>
References: <CAJOps0sd-YFr5P+_N0i78pd9akBJS6DP99wugKvUDOGpXw2pcA@mail.gmail.com>
 <D355FA68-E163-4DA8-861E-7E9DB68F5EEB@fb.com>
 <CAJOps0uX9K25NgXpi3M45F=pvvW5Am+9R=wYTLN0SZ2vPUcX-A@mail.gmail.com>
 <EF663847-4E98-4AC2-8A8C-E37B853C131F@fb.com>
 <CAJOps0tR5t4sJQX0-fhBJuKJSnQZJm12gWV9S0OYv4xWU7uzKQ@mail.gmail.com>
 <20201007014324.GG6152@heinlein>
 <CAJOps0tKN4ACB46hoNu1EeX4uaSZ_UeArzcZ=ehGA2sz0oT+aQ@mail.gmail.com>
 <BC4115A9-0587-4135-981E-38C086DDD3F9@fb.com>
 <CAPnigKn5cRVz3RuK-czkHVo2od1ZLpHCVgRu9q4OET-_nPwrWw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WR+jf/RUebEcofwt"
Content-Disposition: inline
In-Reply-To: <CAPnigKn5cRVz3RuK-czkHVo2od1ZLpHCVgRu9q4OET-_nPwrWw@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Vijay Khemka <vijaykhemka@fb.com>, Sui Chen <suichen@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--WR+jf/RUebEcofwt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2020 at 10:38:55PM -0800, William Kennington wrote:
> My 2c... We have plenty of blob handlers that have their own repos to keep
> maintainership and purposes separate. The phosphor-ipmi-blobs
> repository intends to provide a framework, not specific implementations.

Thanks William for the background on phosphor-ipmi-blobs intentions.

> On Tue, Nov 10, 2020 at 10:35 PM Vijay Khemka <vijaykhemka@fb.com> wrote:
> > <11/5/20, 3:55 PM, "Sui Chen" <suichen@google.com> wrote:
> >     The "health monitoring IPMI Blob Handler" (that the request in the
> >     first email in this thread was indended for) was a monolithic IPMI
> >     blob handler; it used to both generate metrics and handle IPMI
> >     requests.
> >     In the last month, I had de-coupled these two functions so the IPMI
> >     blob handler does not generate metrics but reads metrics from the
> >     daemon in phosphor-health-monitor via DBus. In other words, the
> > "monolithic"
> >     handler has now become a thin layer. On the other hand,
> >     phosphor-health-monitor will have to be significantly modified to
> >     generate the metrics that are in a different format from what it's
> >     generating right now, and Vijay and I are working on that. I had
> > create a chain
> >     of changes
> > https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-health-monitor/+/=
37659
> >     to illustrate what I intend to do.
> >     As a result, there comes the question of where the IPMI blob handler
> >     should live, and it appears I have the following choices:
> >     1. in phosphor-health-monitor, or
> >     2. some centralized location, along with many other IPMI blob
> > handlers, or
> >     3. as a separate, new repository, or
> >     4. something else?

Sui,

Now that the design has been separated so that the majority of the
metric implementation is in p-h-m and the protobuf-ipmi-specific parts
just do light-weight dbus operations, it seems reasonable to me to
create a new repository to hold that part.  That part seems fairly
unique to what Google intends to do and I don't think we should burden
the maintainers of another repository with that effort.

I don't have a strong opinion on the IPMI blob handlers being all in one
vs spread out in individual repositories, as long as those repositories
are light-weight translations from the dbus APIs to the specific IPMI
blob format.

--=20
Patrick Williams

--WR+jf/RUebEcofwt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl+r1aUACgkQqwNHzC0A
wRl4bRAAiVuBr58YQvGoedzK8WJKWKjWtEWlt11raGX7Wd2j1ANJB3WwwZ1kRd5A
eGdkeph7X7hSXSYCKEYC3VuxKwzqErgt7BeXbtjY+TCKyaYOmEHZxLz2RllySFnB
k959scnU4sHViW8+1HZOlJcOtvGQUNnn9BHti3Td1UnWJZSr3XOkL4Z65YRk9oCL
GYPAJM+wykIr8lfg+DPAnrgxv0m5Izpe4bYd6XTupMgODdPCSvPmDB/BFrfrCKDJ
8lRou9PA/4JduDHExGsiozlRFNtKcqBrdiluaiw48R4gf4/sbInnQz1Ikua9d0Ne
QkTADpv5ByEqsPD8xVyxE3EMI6ORPyBsaRKHk4Kz2a/sh/xNUWxYDgsmfEb1yaHe
BCCRE+qXBq7WIdSyFBA5Txq+aANl9h2A6xMv3grJ+rW/CVYJ5SDPtmG67yB94ESV
TIUZGoMsqrWrA5WcBLlH+pR7ra2LrJX9gxUR82UiRUTwSOpkjB8JelB36QXcHJlF
nTODUv5y8WqbJKy/gLTTBntXisLXKoL/z6mYurLtgfYmmUkhP5YytAgtNcMn3tjI
opmZhEzXQTbDy3IvdGmiW6nyFCmMw+x0fDWvq8zJx82wE7a63445a+WvkC/UM/Op
DlL3whf52Sv0Xj0/C6fvJusm18Zg0aaWB/0IwTY0Nh5HR7q9hLU=
=6IIt
-----END PGP SIGNATURE-----

--WR+jf/RUebEcofwt--
