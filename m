Return-Path: <openbmc+bounces-713-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2345BB25E7
	for <lists+openbmc@lfdr.de>; Thu, 02 Oct 2025 04:30:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ccbPY3wl2z3000;
	Thu,  2 Oct 2025 12:30:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.153
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759372241;
	cv=none; b=gudxiXso0kHjwGOjWIvfDeKBiR/6+vKJKYgERM6DIS15tORnxGkabGt8MgDS91HRN3sVmKEdtNc08RQvjBV+TffY8HIsaW2YdYpGT2tOFKMz445FBgmNWEhdT2j0CMPRoYiP2kBaBYUsWFzjwbGRgnT7+iMUPUhrDch13eJmVZKwsaxskAs6n+B7YVKs7PNPpWBjADejH3L5PatKNUNhgY9ZyECJco2YHFTEvy+ayBkt6N1BBCy22IenLFASugnj8OjVEOt6JEklCVV6AvicRWjB2GUxoC7La2QlMJwlsF7VapbQjzT5oVxH2fVLpKa1FrLYzYC7vmBQiFK9yTZYog==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759372241; c=relaxed/relaxed;
	bh=3n+bimoQInZL/BiFXluDyvpnqyA2q9hhkPGcD9pCPQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ArTrt0hlhyEcTK1sgax3Q4RfzZvbOe5afsLsWPVrv7+ahDYSnPF9hFp+8TY1ctmNGSG9jfQmUeNqFhdNboBlJLNNldNd3WrIEH+RnWg8IJOdvBZmnbLGqUjxOUWS2A2Dx5UDh0vLnoutKMmAqglYCX48kNsSsIFy7IUIuk+dFKCForJhhO7Uegtgy8AGsZs/x2upb1CPcNTeu7jaY+QTt2G5w21h5+tX1xr+3ffbgr6JjbaKTFKlQ1+llQstiSpBga0hawKPh2q3kU9vDcFjELU/neKO6XyRhefty16TjJfpD3vzbTEF0afAZReTjoflwBrGFnj9TGHum+hUlTZvQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=Kbz8fspG; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=l3oGtXHC; dkim-atps=neutral; spf=pass (client-ip=202.12.124.153; helo=fhigh-b2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=Kbz8fspG;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=l3oGtXHC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=202.12.124.153; helo=fhigh-b2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ccbPW35pcz2yrT
	for <openbmc@lists.ozlabs.org>; Thu,  2 Oct 2025 12:30:39 +1000 (AEST)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 075F57A085E;
	Wed,  1 Oct 2025 22:30:35 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 01 Oct 2025 22:30:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1759372234; x=1759458634; bh=3n+bimoQIn
	ZL/BiFXluDyvpnqyA2q9hhkPGcD9pCPQ4=; b=Kbz8fspGudRFWc9ONGvYKDRh2T
	Wm7xqhDFboVt5EB1xVqlZwTIuECCl7Rx1Kexl9jT5EUJs443sK9DgGTdPXFkpLjK
	jU+PoP4ZHxL+FF+X02ambMc3c9JJhmEzk0wM3OhtQxfAwtqyKIDMdYr1k6VAe8jQ
	8aMWeEP/0DR+kfgcx2QRRHKzi0tOZ/tI8nfodR2UF0Jqd9x8haZPoymYfq8aTT4j
	bq9E+IBFamj56Fq+2QFs0MqDziVD2oCnrYM/OymMxna129XFlUC+5ArQwy6NameL
	CyyFBDsY1XBdV56zNQwd4yltB1yCoh63Zo5zmmsj9OlO5eY2N+vGXAR2LR5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1759372234; x=1759458634; bh=3n+bimoQInZL/BiFXluDyvpnqyA2q9hhkPG
	cD9pCPQ4=; b=l3oGtXHCwnoUVWYR3KAq4z3aHNek72B8pYnSBCcll5aTI0g+PRt
	GoFe9CcUyD/mYPM81wnpFkSRQSIufZHjC48eLLPE7NUrBhu7qAUX06P2pFW9xUbC
	oiZtJFUzKkiP6Rh3mxS9dv12AAS6wuDMrF/sfIRZbp4IXgytqZFqJBOn0uBRIB2l
	Ta3PO9Mw1FoEvr1i8W6gWwmHXspP46yoHvbtHhA4Rr3quFSNL/DLz9k4kd6/5jCm
	cOmlM7wy7oxWnaQcb1aqfo44XMqxG0PLWoNwJrg0Kgu+gQOGqASmqcFIoLqLrgau
	SEc+zZg6fMjMQz1BS1sm/Xd9wUVmHNMXOcw==
X-ME-Sender: <xms:yuPdaP9HNUjb53QGtCaE_36O669sKSMMqsVKGLQPv76ShLJtzd94Zw>
    <xme:yuPdaDK5RNBx8sl3JD7ZwTOjM9UQV2T4-mL0XfV67tVW5r2aFHFtrGlhtywpj7Qz7
    Rz7kwr9huHEcRikwGQsUNYy2AFStZrfPkEB4vIY0szguIhjPqYEHg>
X-ME-Received: <xmr:yuPdaKbOO7bVXogjws3MBbqW-wltgVinh8oQLkV69RczHvNwJodNzcViTWo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdekgeekvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlh
    cuvffnffculdejtddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfi
    gtgidrgiihiieqnecuggftrfgrthhtvghrnhepteetiefgfeegtefftdetueeltdduveeg
    leegkedvkeegudekudefhffhtedtuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihiidpnhgspghr
    tghpthhtohepfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepghgvihhsshhonh
    grthhorhesghhmrghilhdrtghomhdprhgtphhtthhopegvrhhitgdrhigrnhhgrdifihif
    hihnnhesghhmrghilhdrtghomhdprhgtphhtthhopehophgvnhgsmhgtsehlihhsthhsrd
    hoiihlrggsshdrohhrgh
X-ME-Proxy: <xmx:yuPdaFKk8rC1fLoDs6i4Cnpsq5rw_XWkOKKTTMgnv_sTpUfVpFsxUQ>
    <xmx:yuPdaIAe61h6xg6NWqlK_ZufYO__AeWB5GJaPuDLyIi29sKxFETWuA>
    <xmx:yuPdaKp9FEKf0dWesjE0SlMCb2PN1KGMzUhc1KW1fUDJ9Wd0VBDD9A>
    <xmx:yuPdaDhHKz7CjTyiCCDBrYR4HWyx6pdRQk4h3Wvj42oXYreCnTxrDA>
    <xmx:yuPdaA3UnlvatH62TMYkpYmESk-1aSlkOEFNKF6l78JWPoo5PSSlOhLM>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Oct 2025 22:30:34 -0400 (EDT)
Date: Wed, 1 Oct 2025 22:30:33 -0400
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Geissler <geissonator@gmail.com>
Cc: Eric Yang <eric.yang.wiwynn@gmail.com>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Resending (plain text): [DISCUSSION] Policy for handling
 ObjectMapper stop: reboot BMC and refuse manual stop
Message-ID: <aN3jyZP-G1edHSYt@heinlein>
References: <CAFme=r=6AbKYkFMUKA1Xwpt_b_4QFVkAb=+d03jHVfYX_5QaXg@mail.gmail.com>
 <CALLMt=pk4Z4Q4UV1snL-T3ySXsp0ePXQTHYt5kPyxeALx5WTjQ@mail.gmail.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DZP4gr7GfUOG+gVM"
Content-Disposition: inline
In-Reply-To: <CALLMt=pk4Z4Q4UV1snL-T3ySXsp0ePXQTHYt5kPyxeALx5WTjQ@mail.gmail.com>
X-Spam-Status: No, score=1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,PDS_OTHER_BAD_TLD,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--DZP4gr7GfUOG+gVM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 01, 2025 at 03:49:05PM -0500, Andrew Geissler wrote:
> On Wed, Oct 1, 2025 at 6:21=E2=80=AFAM Eric Yang <eric.yang.wiwynn@gmail.=
com> wrote:
>=20
> > Questions for the community:
> > - Placement: Should this live as a default in phosphor-objmgr, or be a
> > policy in meta-phosphor?
>=20
> I'd be ok if it was a configurable policy. I don't think we'd enable
> this on our systems. The issue is very rare but
> I have seen it a few times and being able to ssh in and debug it was
> very useful. Mapper is d-bus activated
> so for better or worse it's going to just be restarted forever.

Hmm.  Don't we already have phosphor-systemd-target-monitor that
identifies critical services, collects a BMC crashdump if they fail, and
then enters a "Quiesced" state?  If someone wants the BMC to restart, as
optional policy, can't they just insert that as a dependency on the
Quiesced target?

> > - Reboot reason visibility: Should we emit an event log indicating
> > that the BMC rebooted due to ObjectMapper stopping?
>=20
> Yes, I think a log and a BMC dump after the reboot to at least get the
> journal would be needed.
>=20
> I also struggle with where we draw the line once we start automatic
> reboots. What if
> phosphor-logigng fails and nothing can log an error? What if bmcweb
> crashes and there is no
> external interface into the BMC?

I don't want to see a one-off event for "object manager crashed".  I
think that it would be more reasonable to have an event for "BMC went
into Quiesced state" and the reason why, which isn't really interesting
for anyone except BMC developers, can be figured out from the
corresponding BMC crashdump.

--=20
Patrick Williams

--DZP4gr7GfUOG+gVM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmjd48kACgkQqwNHzC0A
wRkFfxAAjQbMm0703IcrXuS4TZU04drYdVVSJrPO34JnW/i0+VqS4zVEv2Mfg925
+5JKw+K3HHaP8bVTPTeyY61Izf9i8ATo/a95/m1zHz5OYCp9N0ZEcPX+dSu9JZCN
k4pm/DSMiwOH+wz+kqDjB6oSCTNe5T4ZZt91HRNdBKIKq1VFvgqeV6hwqYlDjV/f
zcbw1Lgp6DuGQnTR0uA4kI2wtllQ7oJUbfwwUUNdKbk47BSkJJDfAAHXDKrUe/Ae
99FRQqAzjMGxN5UIH/WAKF89OuzDIfNUAzufK9AncecgXnGjPDzfiMsCgYDgiL/w
PKutpq/tgmVpADbr4K4SUsip9XYRgHPWMC+4VNTzOZ+EfSZC7/6d5J03oMpe/wt5
SH+jiHX0VUOzNd0JKkufq7pHf8s2nW8xlSk59MUTueUQY/pTEtKt1fPhoAcucJNi
YgHIUs9fyrAHCWQDdgWiaFcGmGCsHPnq6aTHCDNuX2GRHYi05o4DzIgUaJc6mHEZ
mWceJCvUVaCM5vGzMD67l1i164nsdw4g83E0+86YSmcV37hnTQyBtM2KFkEpt98P
A7gBIiscZzeDRrGlRkVzYWxo79pFZzqSwPfipDfWumxWqt+yHyNx34doi7vMx4MS
XxpsK1ZPmNNsemG5cy4HEwnlMlTLE6WM2HO2Hu5ZftHzUNjnnh4=
=1Xmq
-----END PGP SIGNATURE-----

--DZP4gr7GfUOG+gVM--

