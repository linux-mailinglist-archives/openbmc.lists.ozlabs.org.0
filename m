Return-Path: <openbmc+bounces-1263-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOihGFjmcGk+awAAu9opvQ
	(envelope-from <openbmc+bounces-1263-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Wed, 21 Jan 2026 15:44:40 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2817D58964
	for <lists+openbmc@lfdr.de>; Wed, 21 Jan 2026 15:44:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dx6R70y0hz2xqD;
	Thu, 22 Jan 2026 01:44:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.154
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769006675;
	cv=none; b=TJQrVR5zNH33KGZbOiW6RSoATwy7X3ldYtVBnPTyZX8HBGZJeLptLS5y+qji5xQRnzjbz2p0Y12VYF9ksxDZKs0wTBe4JnA3VBLre1unjWipHF7awI8KX03vjN4BsDg0aWIsoIorgfC+bjCw92FuUVX6RhRxMPoblRyK0TY/cG1P+I6+Cy3tzzoHjgpZ3N7ti/VxTTZSzDwUB+EnL6jREDQv7FaR3iOc/kuc9R8RZaQAUqAYREiTSCVBgXUXBN6LqOkbEnJ5WlSPRWF3XkT8RFRIOKAaXT+YXR5zymrme3Vzx4qA8lgd/l9gwnXTEJb+zIjqP8iKNr97PCwONyMiYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769006675; c=relaxed/relaxed;
	bh=BdUTKG3wrUKpN70TK1cU7PXLq4/wHQHqsSYy3lrVn3M=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QJCAvk4c4Kopm9t4TnXzMuTPZNBRrTJBSzWqhhZVDsGlQCqyVpQ8rjRakqOdGFG/y0UX8N13RptIY/gXJP287sUZtNNDZmWDwXU95N94tCkOMnS7un+5GlJHiiKH0H7R7sWmpQ4Q3kKo5PMOwMA8fHesu48V626vTk8HSMGp31mkM1XmdLD2bfr7H35byZQuW7jMbTuHouJmYHaR2wC44VuYyokiDVnT8qjUQKBzIoaEFeD7p2DBbRYtyA3u4/6yWssHMQ692oC+FbtThTDwZrT3P5i/3mbiCvyRV29rwjHcTJG59g5MoGe1eSr1pv0146sgigxcx3iMNB1FDTUpvA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=GnFyw+S2; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=GjZXLquo; dkim-atps=neutral; spf=pass (client-ip=202.12.124.154; helo=fhigh-b3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=GnFyw+S2;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=GjZXLquo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=202.12.124.154; helo=fhigh-b3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dx6R422Kwz2xpk
	for <openbmc@lists.ozlabs.org>; Thu, 22 Jan 2026 01:44:31 +1100 (AEDT)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 8CD427A00B6
	for <openbmc@lists.ozlabs.org>; Wed, 21 Jan 2026 09:44:28 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 21 Jan 2026 09:44:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm1;
	 t=1769006668; x=1769093068; bh=BdUTKG3wrUKpN70TK1cU7PXLq4/wHQHq
	sSYy3lrVn3M=; b=GnFyw+S2OTwLXNXZ/wxLHizpaICSDoHKX4LgAN8Gm5u/ebSR
	SAMxC8+5ed2QIt2qL8yd9phgtYw6Y50cYX8GDWmPs5mD1cVhyxQc1bEqh5HPrNnh
	Ndam0BiIlcMbgStIaQeuYKFePVhoa4YPRnHb1xVF0Au4Kk9VKdpYYvD0iTgocosE
	UClwrw05iVQCCZrtg3U3BQXI5WUotU1Bh4nYK7td7lZn5l4XIguxczyvN/VGsFcl
	468H04C3av0wyu612QCCbLVeV/a8APxg9byr1+WnLx9j94lxPRdv9tGhCTA5byUJ
	GWK9xWZniyYPvfNWeFv1dqF6QdYN94vpusse2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1769006668; x=
	1769093068; bh=BdUTKG3wrUKpN70TK1cU7PXLq4/wHQHqsSYy3lrVn3M=; b=G
	jZXLquouGdBVOwDDmFaKs2p3Y0AmSAeFZ6dCd5k1sInqoH+BQQ59WNm3r9ESJRks
	gxJsRb1gz860jiM0xH6F0K99F974WIuebolvkxazGFmB79i4C1HhDWAIC4Jd6zM9
	+1i6sIdDXRTlAMX+9anA+Ke5kjviGz/orrd2rS8iigXtycsCzz/9eT14GTjGwzL+
	vi00gXlMCRFVr2RTh0FSnhDbcKEBJNQntG2Pj9uTFXcveYuyvV7F6pmZZ1gYrlBI
	Vwv4cCtSEVJV7NPNKDQgOB6FUuOpbl12K3x/r7ltzPSKwnoUFhPV6WI/XIWNP21Q
	uYB3tTrrNdxr2asR/b3IA==
X-ME-Sender: <xms:TOZwaVKt79qFrsEtFuCdyn55dUXFAPPruFFCRqSXpK6JZKfn0jJ3EA>
    <xme:TOZwaYGM_BfbUwcTnbsJP0dLtwNKDyoMU8mn7eKyuZk7jFNMSG4F0hZcFlhMJNagR
    rGM5EzNMMExdNePbOIRB6yswqSW06rY6SgHatbsd0pqFlqYP7lYeQ>
X-ME-Received: <xmr:TOZwaTUk0v0ECWyhF9svwioej3usnqmJQFYPp5dDRp8SouzuForbcS3LdY0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeefheehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrh
    hlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkgggtugesghdtreertddtvdenucfh
    rhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfigtgi
    drgiihiieqnecuggftrfgrthhtvghrnhepudeuvdeftddvveejudeuleelkeeiudevjeff
    ffffvdffvdejkeeujeevteeifeefnecuffhomhgrihhnpehgihhthhhusgdrtghomhenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhi
    tghksehsthiftgigrdighiiipdhnsggprhgtphhtthhopedupdhmohguvgepshhmthhpoh
    huthdprhgtphhtthhopehophgvnhgsmhgtsehlihhsthhsrdhoiihlrggsshdrohhrgh
X-ME-Proxy: <xmx:TOZwabiJUp4Q_sezYz2rw61MK70waYq8ZudPtAHwOyatUjUC8kjxzA>
    <xmx:TOZwacTopLddfYuJgcbJyqJ-H5R4wR_qYIcLelqztekas54HjO729Q>
    <xmx:TOZwaWEgsqhtLDsAQRQX6ffPT9rWWm-a69_2vwpzsu8kwGhcFWGwmA>
    <xmx:TOZwacn4WeMxEu2WfTg3KOkJEAcsV4EsYfLWt6nVTp4x92f8Fx-LOw>
    <xmx:TOZwac5E3Mzjs5_0YhIGOtI8vKOBv4COmjFeWTF8WxWoNs9EFzFFo_fd>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Wed, 21 Jan 2026 09:44:28 -0500 (EST)
Date: Wed, 21 Jan 2026 09:44:27 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: TOF elections for 2026H1
Message-ID: <aXDmS4BmR6AGXKGW@heinlein>
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
	protocol="application/pgp-signature"; boundary="24OWl2b655JEQg10"
Content-Disposition: inline
X-Spam-Status: No, score=3.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
	FROM_SUSPICIOUS_NTLD_FP,PDS_OTHER_BAD_TLD,RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-3.30 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[stwcx.xyz:s=fm1,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.19)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-1263-lists,openbmc=lfdr.de];
	DMARC_NA(0.00)[stwcx.xyz];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[stwcx.xyz:+,messagingengine.com:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[patrick@stwcx.xyz,openbmc@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[openbmc];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stwcx.xyz:dkim,messagingengine.com:dkim]
X-Rspamd-Queue-Id: 2817D58964
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--24OWl2b655JEQg10
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

It is time again for TOF elections.  The current roll-call is available
at:
    https://github.com/openbmc/tof-election/tree/main/2026H1/rollcall.json

For this half, we have 4 seats up for election.  Currently those are
held by Andrew Jeffery, Patrick Williams, Jagpal Gill and Jayanth Othayoth.
All 4 are eligible for re-nomination / re-election.

Nominations for those 4 seats may be sent to the mailing list by
replying to this email.  Only those eligible to vote may nominate or be
nominated.

Nominations are due by Sunday Feb 15, 2026.  The election, if
required, will be held beginning March 1st with more details to follow.

As usual, disagreements with the rollcall results can be raised to the
TOF.

--=20
Patrick Williams

--24OWl2b655JEQg10
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmlw5kgACgkQqwNHzC0A
wRnCVQ/+JYREAwNv/58RsXspUiAUWV7blOhJhw5qfg8dsrlsitXGzsw5sJwh1e2H
wqJRLOXNPTScL+eFxRBmJ9wPTrUw8DuLSGr1Qfj6sVjuys9i87IVNZ95ZEjZOGdw
Z+SAFYBzJo9OSC5fZPIeU9GpxH0V7RbXjd2wd6KrQbr/v9jgw5VjnuFXNlWZLkjn
XVVhY0lhsp7Nhjb52lARVOtU5lkBNaWLYHHORBqP/vJGG6MzLn5+Y5wMO3hNS1Z8
OZEcSZ4OOIdXDVLJMOSbYxLsIhwVYqfBMQT7HSk0RDa4XUpctiUU3lxnIesLoX1p
Dye5kshLk8fMvlt7MXR9E2N+j8evCdEWv4358xLvk4owU8lRM7JzciuLFSCA4bRr
zfZU55M17dmFm79arH/ODehZee3LryxtGNJnhSjxS7L9wTRoA2p0bj5uTWOAAKQ4
jFT2otf6kjWMBX4zdWhsvnAIMPcCNtcXG0Bty+9q7O1oUx+uIGRlrhOW4FHijcFg
624hdkXsGTuaXDOvJzAB3JxAFsOB6XbHQDSxE1V9ukWOclaxec67ihd+BpG3uxxl
6xZLAetpy5dxSR+TNFd+1ZFfw+uIRSH5uE2aBCFdY77rqpdOc6srwBF4lhLgwSoY
XWljwq5A6JBMQ1pENAkOqmNjSoiVENSWCtVDcGubVm74w/cVqgo=
=qVcA
-----END PGP SIGNATURE-----

--24OWl2b655JEQg10--

