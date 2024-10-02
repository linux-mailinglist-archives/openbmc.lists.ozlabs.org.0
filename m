Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFF998E3EB
	for <lists+openbmc@lfdr.de>; Wed,  2 Oct 2024 22:08:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJm7p1wgjz3c6f
	for <lists+openbmc@lfdr.de>; Thu,  3 Oct 2024 06:07:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.155
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727899664;
	cv=none; b=c8SifOcZHjKePV6UNyYLLesEInkNDWwdfMw7uzhQ8G4Bggl4Rokrlj8mx2O8+ty3OOf1CCh7AKeiOv2wcEO20VLP4rPZSnYb0QdhnFjxxKGyTXqG6ECmpbm3MYVzv+sxMDjfBrg7sm0dOL3LMxYrGDkqPp/de5BsFPTA4D0noJxJahoLjWx26LQLpEzaw0HfPsWAifi+Ufia/8poE8YwfvDuDGN1MevZD7lvs+MEtAuCyX40hDMYZPe9S6QXlEIS4w3/6nXzrVGKe32mde493x7BC47R6vQxssbX3dPLI80Xiu5hqk0aqn1KPCmGqvG4hIEibztyX6QXvXVUat8cSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727899664; c=relaxed/relaxed;
	bh=vGBIeOQrZvmzHHw3KuzOB3B0Orb3a3RsMoIdPchpNMY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UuAd9Hcibw7CeSZEDN88m5ECjtjjbB2Kd2gKbHwCHdDEGQT0B2Fr247Z8gPY/RafIhNp51u86r7h8qF/HAulDgG5PhTgrK/WLFUrxXZZyti3uaK4E2hgderyzPUWMUX7IwOnsVNWXSh0xHuoX4k7WvGee6WNq5J1b/nkOh5XuJ9WAAuOwkH38s26DI6lC2Zs2/gXGcTFuXVyM9ko2cCt8GfMPVL/V6jFMgYgwtku4939pZelljuogcOlwiVCaB3HXSAUn/H4NOVejVqKMrogcbTd/6cgraQemfr7wNWMIs2mSVBIv3Nf6sLqLx6Ejgbv9rd9YnAh8/w+v+P5ynyE3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=p6KuNbnh; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=YgutmyzP; dkim-atps=neutral; spf=pass (client-ip=103.168.172.155; helo=fhigh-a4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=p6KuNbnh;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=YgutmyzP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=103.168.172.155; helo=fhigh-a4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJm7c6r7Xz2yQn
	for <openbmc@lists.ozlabs.org>; Thu,  3 Oct 2024 06:07:38 +1000 (AEST)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 0A6B7114013C
	for <openbmc@lists.ozlabs.org>; Wed,  2 Oct 2024 16:07:36 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Wed, 02 Oct 2024 16:07:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm1;
	 t=1727899656; x=1727986056; bh=vGBIeOQrZvmzHHw3KuzOB3B0Orb3a3Rs
	MoIdPchpNMY=; b=p6KuNbnhzJRobwXL4YZuO4sp+oKO269FczXCrPjo9M16UQAN
	jOhuX/tO8/iTsizr156ovRCQ7UBd2qfpSSAZ59ViI/s7L1bRlGyVGasGY0MunZ2y
	BA74kxbwtBSxW/Ksz+ONNbPk31t8pDrGrxoGI0t9SatB3tw7CGkrQsM+yfSGQFM1
	UXrwxHg9KBo4dn/qR/0tB/fx82k+5Jl9umamMNMhkdHfEavmMuUjQCMWAl7VE/7m
	qdlDyLJbkg+YBI25jvSW6bEUE1DT76sz1VVWHF9QOWCM0wJJ+hUp2Hv0qD+zvpN9
	Umh8fxXm8t7jLENW2+WR3W+JYhhfKg4fvpO1zw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1727899656; x=1727986056; bh=vGBIeOQrZvmzHHw3KuzOB3B0Orb3a3RsMoI
	dPchpNMY=; b=YgutmyzPwQD5dCz/ioc0elHnPfU1vKn84AskTamumLeSIgfC00p
	J2RJvp6ac4F1AI98EqIXsKeyoEj5+F4xZSSRY62Lw201u16ORRAVunb/EfyCM1UL
	9k3lsfNJG6G/lFDzx0hzg/Ej1G9CbZSOaV44Myj3jCgnDzImhMlL3JvnMI+mVMhl
	Evcf5ghsBrj+8XoeXb613HmWaJNe8xTWPwH2TWuq/Mrp56N1M2vE2h37FyK89zKe
	tdixU7ABoWDznjdXHF1OiaLxMvwXDo3mqdNiUimxokmmUHzwFXJaMvJZhAJ3CTNH
	HCtdBWJyH1wjwTW4JYuhlcyfkE1v7Y5DdBQ==
X-ME-Sender: <xms:B6j9ZhuXfvAD1Gj6ZujI0uiuLOzcWKh09D-DKrC_aXrGj9lij3uotQ>
    <xme:B6j9Zqe0giBStRdCJznvgIzp1UuLV1tBgN4kYXfoGZkNEJdZAj-Se4RBM4P7zWbh8
    2lLLQosp7V_7GegGHo>
X-ME-Received: <xmr:B6j9ZkxNSZngC4mqc4aLj1fWAW7pICR2wcVDe8SwHf_qCpNEh06XEvKqRaU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdduledgudegvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecufghrlhcuvffnffculd
    dvfedmnecujfgurhepfffhvffukfggtggusehgtderredttddvnecuhfhrohhmpefrrght
    rhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenuc
    ggtffrrghtthgvrhhnpeffhefgtddukedtteduvdekteegheelhfdvtdeiffeujeffieet
    keevhfejhfeukeenucffohhmrghinhepohhpvghnsghmtgdrohhrghenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthif
    tgigrdighiiipdhnsggprhgtphhtthhopedupdhmohguvgepshhmthhpohhuthdprhgtph
    htthhopehophgvnhgsmhgtsehlihhsthhsrdhoiihlrggsshdrohhrgh
X-ME-Proxy: <xmx:B6j9ZoOdm46wkBdea1ZscwMIDUypUzFVJJVQT0XN243GNBwOJZm4Sg>
    <xmx:B6j9Zh-HzZKUvmGToa-nDFc8vx7TaU-1VsH0x7U84QwF_lLO58VBqw>
    <xmx:B6j9ZoX-YhwR9jx4U94bvLNnt_bg0yrx-3cBlacVlaXvo-CpH1N32w>
    <xmx:B6j9ZiduC3JDrFbAGFqyAbVJliK9Tc72RkWFBJ3wAc0-gvHIs1hakg>
    <xmx:CKj9Zjm2KUUwBD-r3BjTwJcrsJsJi35uDfw-Dlzn1qAbzJCCSiMlo42k>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Wed, 2 Oct 2024 16:07:34 -0400 (EDT)
Date: Wed, 2 Oct 2024 16:07:34 -0400
From: Patrick Williams <patrick@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: Announcing Topic-Based CI
Message-ID: <Zv2oBkO0J6OEUvie@heinlein.vulture-banana.ts.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vU1KBLjt3ROryVI9"
Content-Disposition: inline
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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


--vU1KBLjt3ROryVI9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Greetings,

Up until now we've not been able to perform CI on dependent commits that
span repositories.  Generally you have to inform the maintainer(s) that
the commits are dependent and let them know that CI will fail until one
of the commits are merged.  Often, maintainers ignore commits that
have a "-1 Verified", so this can slow down the code review process.

In order to improve this situation I've written an enhancement[1] to our
CI that allows us to run CI on dependent commits, using Gerrit "topics".

Typically we run into this with phosphor-dbus-interfaces, but any
repository specified in the `build-unit-test-docker` can act as a
library / dependency for CI.  In order to get this to pass, upload the
PDI change to Gerrit first and add a "topic" (you can do this either
through the UI or by adding "%topic=3Dfoobar" to your `refs/for/branch`).
Then upload the depender change to Gerrit and add the same "topic".
Jenkins will then download the dependency when building the Docker
container to execute CI.

Caveats:
    1. To simplify the implementation, I only allow topic-based commit
       per repository.

       Suppose you have 3 commits to PLDM and 1 commit
       to PDI under the same topic.  This is fine because each PLDM
       commit will leverage the single PDI dependency and the PLDM
       commits will be tested individually (in git-order).

       Suppose you have 1 commit to PLDM and 3 commits to PDI.  This
       will not work unless the _last_ commit to PDI was the only one
       with the "topic" set.

    2. MAINTAINERS need to keep any eye out for this and confirm that
       all of the "topic" dependencies are ready for merge.  If you
       merge a commit, but the dependencies are rejected, we're going to
       have to revert.  You need to make sure there is good alignment on
       the direction across all the commits in the topic before
       accepting.

None that this currently doesn't affect openbmc/openbmc recipe bump
commits.  We'll still need to manually rebase and/or squash those to
ensure the proper merge order.  AndrewG and myself usually keep an eye
out on those and take care of it.

[1]: https://gerrit.openbmc.org/c/openbmc/openbmc-build-scripts/+/74987

--=20
Patrick Williams

--vU1KBLjt3ROryVI9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmb9qAMACgkQqwNHzC0A
wRlcTRAAhLEXpfxSe/nlIhdCM8XYOUrt/O1BAgpf4rlDlbwHw2V1Zotmv5LLhkGd
yL6h/1qilP4ocHUNeTdHBTbFFOg+bPamFV1/5p2zhap09gAVbYveyiZASLFckRxX
fPYulyENUiGaYhP5trxyiiZQ+vEptbdZbwx7QElJA9D3Ot/2gIwEgLRuVycaYGtx
slkJ1g9hMRmVyyNyZnJsv5yeVo769IkHGuXSiQRMlo3yT5m0PbD4UFe181Iu2QHI
NDDJbxx6rRzTeBX3HVxpku1sxVkzMtWCDt8Z1pumcLaFCRQF67MVINfcAScTFhwp
YnIQJYDTBw2N24SgMnTY/rmAgcQ1NIYlcDlLcxBzvQDxoMV/t4p1I/ugSzUbAcfj
kM/dliDMD4legzXGQxoMrnyKjafqT5eXcGjLxrH93rxjyZ+NRn/Vvi2KyKFtAAXX
daAtRFTDzEdp49qPl37K7uGVuuLOoeBE/UlM3qHG8xpBo3/CeZOjkXKn3Fk+fM39
Iz4UhhNuq6nJDHAfa3Y9VHt4SZJyJisQWN6eNd7rfZU3KmbXT4VqfXOVt6ZqJmYg
suEJeKOmZAjEsRvNv0xhPCSO6vQRXd1DRqEk2Pvnz+ujPper5Vpl20Hnyw4cObBm
m/YABjhJ8aMpvqmw6N/xKv2CA4cOfQv087srqbxa6VCK6LS/oYg=
=7TRB
-----END PGP SIGNATURE-----

--vU1KBLjt3ROryVI9--
