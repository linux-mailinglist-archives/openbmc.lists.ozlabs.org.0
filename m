Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3514A5183DC
	for <lists+openbmc@lfdr.de>; Tue,  3 May 2022 14:03:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KszB905TLz3bd2
	for <lists+openbmc@lfdr.de>; Tue,  3 May 2022 22:03:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=UVfWhqBR;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=uHQb0JhT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=UVfWhqBR; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=uHQb0JhT; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ksz9g6M0zz2xgJ
 for <openbmc@lists.ozlabs.org>; Tue,  3 May 2022 22:02:46 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 634C73200A14;
 Tue,  3 May 2022 08:02:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 03 May 2022 08:02:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1651579360; x=1651665760; bh=nFUlhpTYIT
 2wThNeQewgssnqKWf3P8OAOqcTUo3qMfQ=; b=UVfWhqBRp5GN+3ACsC/V4G6hOK
 +wmqBx8KIhz9/2X4cagVOry/HdpLqJBiS8e6Ea2OFAJpTv48R8H7XWKN6txzBMEg
 Yz1I1wjaV7QeusO7c6vFjyvXAUIU8vLbd5dM9P0pMIIRAVU/3CvwxQ0AxjW69TVy
 DF813zMtyEO/4uALYpyIKpzNRuCF9tZqOQaEBEYL7bDq0n0BzTPbEwjeLH5jb+w4
 D9xK3Bo16p1XLUI1dOxjtMii5owUMpWX0KDqY4sxETLz/9jA4M8wmHFBaCBwe1+7
 Bo6R10GtjCn98wyUosbRPk4/JZRK4ew3jJwcjrqwRzoHg4LZo7B69PPdSkxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1651579360; x=
 1651665760; bh=nFUlhpTYIT2wThNeQewgssnqKWf3P8OAOqcTUo3qMfQ=; b=u
 HQb0JhTvGTkO3A2WOJre0ovoV9EL7IVCtRmKalCYpKUFYKHc9ZjZlIF7MBQzaY+Z
 8s0IZUfuePJcj5IAz9Itevyl01WvQ9vO01rJyrETdK/Zj5AKsBGE8aQR0G+9BF9b
 o0JFdzZzOvsf06xk9NDVRNEyhR7FEYMY4WvqgSzmXe92+N4aNCURUCEM5YSPAfR+
 WNeTwNP+PGcJOvTxho73WlAjbyl14DzptIv0eHJKOhkA0olJr15FvQkY392NLXEv
 bP74gbI9AJFrHPsdyUhgXJrEsgThm/moJ3CeHppH7RmHBr/3DCyR965UaZAiIqcq
 OCuXp9LcmGE/TgJz3DP3A==
X-ME-Sender: <xms:4BlxYiyQXlVw4HkRaDbYkjFDJpvXGDHNInIeNoDq4FRHwzjCJVASnA>
 <xme:4BlxYuQGUacxxgMvgEm3LDfYbrNUDO5cCkglHiIzBv1oIdW2j3vSMQVWlwBbOQjqz
 ejSr46dHp_tD-vxSz8>
X-ME-Received: <xmr:4BlxYkUfQROPTT3RGqu3PuRHz5HxABY1aTgfoCQAmwPkN7BFuSEZtRgxeh8ZW2SVri-lpzRoEzFacMzRghkhzIKrjnsUrW8LOtA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejgdegjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepheefjeehfedtjeeivdefkeffheel
 udekudelleffkefgtdeludelvddtgedtheeknecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:4BlxYoi6UaPN30srOX5UGRrwgkSF_fH2jis-2ercRfT73hHrdR_o_g>
 <xmx:4BlxYkBgBhkNVJm21bVCvQwmrqqWig20pDV53QRbCizuZN36YbfpDg>
 <xmx:4BlxYpIXFx7U6PY2e45eHLKDstfwedDLVj5Dgt8t1SvO5WJrRJcn8w>
 <xmx:4BlxYt6OYlmV9HT93stpOO5SLoTZdc-P1y33RQNAjy9k6syeda-nmg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 May 2022 08:02:39 -0400 (EDT)
Date: Tue, 3 May 2022 07:02:38 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Nirav Shah <nirav.j2.shah@linux.intel.com>
Subject: Re: Running OpenBMC Daemons/Applications as non root using D-Bus
 Session/User Bus.
Message-ID: <YnEZ3irWISTwEikW@heinlein.stwcx.org.github.beta.tailscale.net>
References: <16ba58d6-d06b-1c92-340b-e94119a47708@linux.intel.com>
 <YnBcJ6GPKIBpqYWN@heinlein.stwcx.org.github.beta.tailscale.net>
 <cfed9171-10fa-d8a7-e1e5-74cef23bc299@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Ku/JCfyO/Ua4iflf"
Content-Disposition: inline
In-Reply-To: <cfed9171-10fa-d8a7-e1e5-74cef23bc299@linux.intel.com>
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
Cc: openbmc@lists.ozlabs.org, nirav.j2.shah@intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Ku/JCfyO/Ua4iflf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 02, 2022 at 11:00:01PM -0700, Nirav Shah wrote:
> Hello,
>=20
> <<<< Moving everything from the system to session /bus/ doesn't really=20
> improve either of these aspects.
>=20
> I agree i am not proposing a complete transition to session bus. The=20
> proposal is to move the interactions to and from as you defined it=20
> "external facing application" and anything that does _*NOT*_ really need=
=20
> root access to the session bus by running them as non-root. Applications=
=20
> that "may" need root access (may be because the hardware interface=20
> requires root privilege) will continue to use the system bus for=20
> communicating with other root application and session bus for=20
> communication with non root applications.

To be honest, this sounds even more complex than just using the session
bus for almost everything.

> I agree that BMCWeb can run as non root today and still be on the system=
=20
> bus. Also agree, this is better than running BMCWeb as root. However,=20
> "We can then figure out how to further limit the DBus APIs after that"=20
> is what I want to address. How does having a session bus help solve=20
> this? This for me is complicated to put down in an email. If my=20
> explanation below sounds too high level, I would agree with that too.
=2E..
> This is the approach I have seen in most of the Linux Distros for=20
> desktop. I understand OpenBMC does not have the same use cases as=20
> desktop but in this case it could be lot similar. Does this change your=
=20
> mind?

Not really. :)  Yes, "too high level" is probably the simplest statement
here.

Let me switch this discussion around a bit.  Please name me 4 daemons,
which currently reside on the system bus, and that bmcweb does not and
should not ever access. =20

I think you'll find it hard to enumerate because our architecture is
purposefully very flat.  I know the codebase fairly well and have thought
about it for a bit and can only come up with one: kcsbridge (or btbridge).
Perhaps you could expand to a few of the systemd daemons (org.freedesktop)
where we've created an abstraction (xyz.openbmc_project), but I actually see
present day code in bmcweb which interacts with the ones I was thinking of
there.

So, effectively everything would need to be moved to the session bus
_and_ we'd still need a mechanism for bmcweb to access some of the
system bus end-points (via restricted ACLs), but effectively that is
still every single dbus endpoint.  This proposed move didn't actually
accomplish anything from a security standpoint in practice.

--=20
Patrick Williams

--Ku/JCfyO/Ua4iflf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmJxGd0ACgkQqwNHzC0A
wRl79Q//ZS4Wle5mpy4q0bsPGX3dsHQPMsxGKdsdaPxc99IWlyGb4NrYfpr+zhKF
kot+kQVsCuM5TK6AmI0FJJa38l02qbjLTdPwvsFdie2P01fajEGIgOsLE0eiEYfo
HGgFkN3Thb5ADXzyO8tiPuFR628OThmaYEhqiC2GAgsYsQuInkSD4XI5Q2cawqOV
c5bOl+7wkMywvvU9sJVe7avF/e+Dz/T6fZVFKKcoAYM/RerVY7F98H/LXL9L9rmE
peIXwweIwvAMK42rte6TM6SkPcShUBTzbzTyeZZUCpYT3JQ7f/Y7u3a0bM9hGEIv
dwpR0lD2S9I4UmhohfhDSofEGxcXOz2NI6JESublRF6qNzX4ZUZVyi8tlLJmmMcx
xu70YYnvaoKMsXhD/pNlMvMMmO59mkgLAOHF2xtHYSYTGeuUHV1x8Bl3JhwFOXN1
tUidXB21rvgUsvf4x+78swxT64SeJc/A/Ttafb9A2OQYvOTOhaP9lNzUD6qwSKrI
IXIQUhW5QQahXk4oEMnWsXGsjiU/yJAGbCgC29TLdk7qMyZTs2Us79x+94cD2OY9
7sEh8IjB0fVPoqqiSh+9eeaWINVqLjI+hg+RnQalBIu29j8lsdj67kfjYE6Cvr1v
M1rTJUqAa/WTZBkoS5oJRn3e+8S3YeeqhXCONkHzigEn/8aUg3I=
=AA0h
-----END PGP SIGNATURE-----

--Ku/JCfyO/Ua4iflf--
