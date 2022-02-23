Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 506A14C14E5
	for <lists+openbmc@lfdr.de>; Wed, 23 Feb 2022 14:59:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3d1k4Rc3z3bV6
	for <lists+openbmc@lfdr.de>; Thu, 24 Feb 2022 00:59:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=o7v1QDxE;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=nzNLSQpr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=o7v1QDxE; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=nzNLSQpr; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3d1N3MQRz2xC6
 for <openbmc@lists.ozlabs.org>; Thu, 24 Feb 2022 00:58:48 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 01BF75C0121;
 Wed, 23 Feb 2022 08:58:47 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 23 Feb 2022 08:58:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=+pYZHoqE7xWYxp5v3tOmQhSVMTvcEl2Ye0W17b
 Ax2No=; b=o7v1QDxEMdVCmuJ9G9FpHDHDwfN7KbVoFZDOd/Qqw4bcn6llsuKhpz
 4k/2HDnMLmvuSBCy9WP3tJD0mOyuB0Imq2BuTU8BT1zkSDBrWUP+aGXOOwaPAgoH
 MD5zjFELwLWSq8odS6qq7/MnSJiwXv5wNkg5bicIZTpzFEt97Owei4p7Q7AcCLK9
 hOrUIAfQNQYItL74HPPoS3HEpiy6UMpWosPDjHYxcQ0iVj9MoXpUfF9WNxEfwvFz
 968DTa6AZlneDvuFIGgk3VFFwE9hkLFMSEAQNoz/Dj8DkI/MoOrplvxCxUUWaNJ7
 fheUdOtNDU6eP82sHqZNBPEsigNTCUVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=+pYZHoqE7xWYxp5v3
 tOmQhSVMTvcEl2Ye0W17bAx2No=; b=nzNLSQpridPxJMPhrRmRPTaaCRjKUEjfZ
 w/DUp8H7+7t7z1DN+02lsdROdjaDX2xrZ0NCoCjyRGZBzBDnHv1e9vyZzriAysW7
 CBdNZMaz7TuMjW+2We9O+PZijPV1xAsSFjpEp/ET1TGU19bBI47UIi4BnRrapcEo
 wYnDtFUgH0AImxYHOL+D4mWw06MH0XGL7kcCzCvZLPDJ7qsFY6Uyw659wv/TXE9s
 Mt8JtDo/V5AswQwDT6p1dSK7GRMiRXdLzFdF+XWOTNb1QohP3jdz09rsP0u1M3z3
 MNsN2NtjKYZX8EhmIu4rueLbnzmbhaU/oLTfgDrE0CxV28O/LMTRQ==
X-ME-Sender: <xms:lj0WYv7pqG91fCgX0BnyAJ2IENqb2JatI-qPwMFNJb2by1dqOnsf1Q>
 <xme:lj0WYk7xQ4_ptwODsRxp09PwZ5yzCIehqDJmLiURqYrbaH_f7cD0IbLWk6CxLELle
 VmtUs54C2kKBe1s76o>
X-ME-Received: <xmr:lj0WYmcqAhogtN3cyqcBBZxeWKBL6cHQxUAm0IcgPeP7Dol2NC0c0iaZpmfSTlcq4tlJ6HwyXhV3q876RBYofj0G1uxXw4MSGHQVTQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrledtgdehjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfduhfeg
 fefgtdehhfektdelffevkefgueffhedtieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:lj0WYgIE3LKav7xUsZdjM22dNNBlLl8cC99DK0C1EhcSEmZNVTh-Lw>
 <xmx:lj0WYjJFY32VWNxXOqb1CRumShH1fNsQGxpa2q9ftvA4Lf7A9_RBvA>
 <xmx:lj0WYpz-bTrxe7f4wGC4UquXvNRN7YDtw5hGGrjVSRh35WB9ZH7q6Q>
 <xmx:lj0WYpjNeqLVecvzUcQ1C53zrgfLFXfZY9CDiSaKIHjdZuqDeouCww>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Feb 2022 08:58:46 -0500 (EST)
Date: Wed, 23 Feb 2022 07:58:45 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Johnathan Mantey <johnathanx.mantey@intel.com>
Subject: Re: Checking for network online
Message-ID: <YhY9lX6a8RDGcY2K@heinlein>
References: <af9a0274-2fb3-8195-a02b-c1d5ecf4848e@intel.com>
 <c5ca733f6c1dc5041c787fc160d5bf3e4d722b36.camel@intel.com>
 <5c14f9f8-886e-236d-3953-47c27f1e61bd@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xjEx7ZdV82RFuc6m"
Content-Disposition: inline
In-Reply-To: <5c14f9f8-886e-236d-3953-47c27f1e61bd@intel.com>
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
Cc: "Doman, Jonathan" <jonathan.doman@intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--xjEx7ZdV82RFuc6m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 18, 2022 at 11:39:03AM -0800, Johnathan Mantey wrote:
> On 2/18/22 11:04, Doman, Jonathan wrote:
> > On Thu, 2022-02-17 at 14:54 -0800, Johnathan Mantey wrote:

> >=20
> > Did you try removing the Wants/After=3Dnetwork-online.target from
> > rsyslog.service to see if the situation improves? If it does, then we
> > can discuss removing that dependency or making it configurable.
>=20
> No, I had not tried that. My take on doing so is that it'll be like=20
> playing whack a mole. Some other service may decide to rely on=20
> systemd-networkd-wait-online. The issue is now compounded as a result.

I don't understand why this is a particularly difficult problem.  You asked=
 me
on Discord how I figured this out and I said "grep".  You literally just lo=
ok
for a service that depends on `network-online.target`.

No service should depend on systemd-networkd-wait-online directly.  If they=
 do,
this is a bug.  They are always depending on network-online.target.

Services depend on network-online.target for valid reasons.  As far as I can
tell, currently, only rsyslog* has this dependency (at least on Witherspoon=
 and
Bletchley).  If a new service adds this dependency, and you have an issue w=
ith
it, I think you should take some time to reason about why this dependency w=
as
added rather than simply ignoring it (by a force-disable on
systemd-networkd-wait-online).

"Fixing" the rsyslog dependency in your system is a pretty trivial
`do_install:append` with a `sed` in it to strip out the line.  Catching new
dependencies is a fairly simple `ROOTFS_POSTPROCESS_COMMAND` to check all t=
he
service files in `/lib/systemd/system` for a `network-online.target` depend=
ency.

* As I mentioned in Discord, rsyslog having this dependency by default makes
  good sense from the upstream's perspective.  rsyslog is _typically_
  configured for remote offload of the syslog (hence, r in rsyslog).  It ju=
st
  happens that we have this unusual Rube Goldberg transformation using rsys=
log
  for formulating the SEL and Redfish log files.  For that transformation t=
he
  dependency isn't necessary, but for people who use rsyslog as it is inten=
ded
  they probably want the dependency (as I've mentioned in another email we =
do).

--=20
Patrick Williams

--xjEx7ZdV82RFuc6m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmIWPZAACgkQqwNHzC0A
wRmGRw/6A/rjvIOI0Xk6uy1S/xqH8Cvul8zLTmLEee48TB8YheGDbm0QPv2UtYwe
vgqtnLkW6cILfHpOZXyk3ADFZOyTQse60nm4fb1MVzOvxq082/mlHT3YnCchuN3+
alMVJflRUQ4gMEsZbvEups+PX1XppSQdNZtR+3U3md//7vUQir42MGK++oxWsKau
ZFSIZOa0gAzWdyfT8RyDJ/QJ8+o1IAIn3L2BON5dCflkKN6hNZUNdEuGa0vFp1di
fn1CAKNW7g5aYNRyajGJ5dpnJgx+tMWgXMsq/Pgk0cyIIq723CgPY6hPgjPnuSGO
aUzpYvzWKAf2nhbvJqQFrUgnO+6MKkhPQSYfhCxyVkXuxntVsmPO4eWGB7yusLyF
W7JMyII7LHh+HaOCbVyp3ooWzjitknnV4OOZW5RV0ODNKfo2DlQoeeJwT+/Y7Ohv
hjb/+viKzxHaSRSYVTgigpFyPLokPbB18RI/u9A4cG3Yc/GNeBd5pnCPrKrjz2l6
L0kSpqUwY8K+VkTwfWYxTmGh7mvk/Cn09TAbN/9SLoCvHmIrR5GAiAarKeWWli5O
eaYyu5LRUKAhOQQg/541YlGLHwEtO0VNFUWY7nIabhtojEZ0oGi39iERAS0IdbVn
s/Y3WhsgR4DleFi+/MHOy5CIagGPO9pYFH1DaNWnEQA8ZfCJ2LQ=
=fkwE
-----END PGP SIGNATURE-----

--xjEx7ZdV82RFuc6m--
