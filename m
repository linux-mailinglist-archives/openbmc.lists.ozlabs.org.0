Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B653D5391F6
	for <lists+openbmc@lfdr.de>; Tue, 31 May 2022 15:45:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCD6n4MCmz3blj
	for <lists+openbmc@lfdr.de>; Tue, 31 May 2022 23:45:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=CzVU94Hk;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=IJo7b1rp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=CzVU94Hk;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=IJo7b1rp;
	dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCD6J6VBVz2x9G
	for <openbmc@lists.ozlabs.org>; Tue, 31 May 2022 23:44:39 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id C8D8F3200994;
	Tue, 31 May 2022 09:44:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 31 May 2022 09:44:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1654004674; x=1654091074; bh=jbSAZXb1H0
	nakW5FPAOCFa3hBj01wtMk8v+4hdAAvRU=; b=CzVU94HkkyioQtA+AUNdKw+hBl
	B9ha1EUXnDqnKPUEhecORn71A/DCFAubEVqL8G3q5kaiURFyMDmxMm3TjEThOfA2
	TyMPIdLRlHGFVG0UCBFmjmaOhg2hsiv8XK/+74n4/LgHLfixVj88eXO2Rz+jFzrf
	7puoyGjEwi8BECnSjSGYJj2f3sgoHlBU5M9nH0yVxB/Fdc3likSlJH5TR+yWwVId
	WQGkelMWvbVxCMoNcVBmMeK2njo0tLWW5PCqVJc3xIHhMkOY5b8ZhEkalJJoXk2a
	IzRvTlAaWB5vB/t5md4TrJ/w/NpAi8myM8hgKAGaVdSbmTZgphIqIzsLl80w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1654004674; x=1654091074; bh=jbSAZXb1H0nakW5FPAOCFa3hBj01
	wtMk8v+4hdAAvRU=; b=IJo7b1rpMJFdjis+ZretijJ9ontx3p42TbOnEpkvQNMN
	F2HGAlzvqI+qpLW/iXZsEilkY9G3R3PVAbqL54uieDL6nRZQwWG4Nm1TlPaZo6CW
	gxMdkuH7rE+bJSSVYfMmLJMSMcstE29VwXHOVN0F5tp993lX2rCG4Tv59fL2WT2Z
	KdFYGXRxWw+0bJOg40K2LwsgirATQABQNa6o3WdoNaq74co3drcG9v7TCnQPl72f
	d4TpcuiNXKDEvQ+oEpWIETE6kM0uyTZG7CVnPuhoz0nL9ybwMkoAnKri2iTD3RW3
	g5wJBQ2rWzcYRgVzD5anU9kZaON8QttpUL+FAcUZAw==
X-ME-Sender: <xms:wRuWYq3byk6qSIOwoOPhzd8dUuSsPVqS8DzKGl7wIWXL9LrG7yh-4g>
    <xme:wRuWYtESL59fi2MwyLi2a63MdaHaYW8ehgZeLEEEsK4HH01spIxN0CGzbZYefJ7M3
    QDgURNyckyX4K8KsSs>
X-ME-Received: <xmr:wRuWYi4h_5-ezTBK7USnC7HF0FAkCvjQCGO5eyjqM1emYkQ-EsvJibTbDpzEo_EDJ0gpGgUOzAZZ5tymSnOKdg3wbYYyu3tdyfI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrkeekgdeijecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdefhedmnecujfgurhepfffhvf
    evuffkfhggtggujgesghdtreertddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
    ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
    epheefjeehfedtjeeivdefkeffheeludekudelleffkefgtdeludelvddtgedtheeknecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrih
    gtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:wRuWYr3guxa2AvqE6Mhtx1245Mp94wWZ5hjGS2aQCsFZwJfDmsVdLg>
    <xmx:wRuWYtFCaMqTG1WeRTML-5EP3hz4gtHqC_WNN9CSUpCqHSSzSgYCvw>
    <xmx:wRuWYk_V_jHYuO-tnvv-wxnyiiTaX34sEE4Vp4W1SsSz33rANda5Xw>
    <xmx:whuWYgP2cZuRAcZeNeoOEbpg7f6n0Mmj-7otUtPToQYMZBIWEcByeA>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 May 2022 09:44:33 -0400 (EDT)
Date: Tue, 31 May 2022 08:44:32 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Gangadhar N <gangadhar.ubuntu@gmail.com>
Subject: Re: Usage of SHA384 signature for FIT image instead of SHA256
Message-ID: <YpYbwIAec+Fc+iaw@heinlein.stwcx.org.github.beta.tailscale.net>
References: <CAKxnL=hnWt8ZYL2eU8yaYMRTF7wMO8asb_YLmY2361CWddMkXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SsYEH7GpIJfqhCeD"
Content-Disposition: inline
In-Reply-To: <CAKxnL=hnWt8ZYL2eU8yaYMRTF7wMO8asb_YLmY2361CWddMkXg@mail.gmail.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--SsYEH7GpIJfqhCeD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 30, 2022 at 02:56:10PM +0530, Gangadhar N wrote:
> Hi All,
> I am facing an issue while using SHA384 signature for FIT image instead of
> SHA256. I get build errors.
=2E..

> uboot-mkimage Can't add hashes to FIT blob: -93
> Unsupported hash algorithm (sha384) for 'hash@1' hash node in 'kernel@1'
> image node

This is reporting that the mkimage tool generated by u-boot doesn't
support SHA384.  Which u-boot are you attempting to use?  It appears
that v2016.07 doesn't support sha384 but v2019.04 likely does.

--=20
Patrick Williams

--SsYEH7GpIJfqhCeD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmKWG74ACgkQqwNHzC0A
wRk6FBAAj7mViv+iHs59j6EDAPzoUL9ugTzU7Lyl3ugHlNYJh4mBFrBG6Oe3oTMa
WON8Zqm6DcJlQyGQxNOLuNPGwrCtLLHomoai8GwPuIVbtAgyUhe47VEf+g5ezkCl
X8YE9ADQmdOWCXjHEJiUwvxBeBw4VRdAtReNIcBS9DLID38X/GEiPBoUaESPsbEk
e1rquFUv9W550lyFyOhmCeq8XJPwtQRuehVgjF26cGOn+r5GUzOjuwovqyBLg71/
r45zJHlSlfTFvkaFMnSDaolsthF/7nlBVTbZrdxq0kgsaT56v69c7GGZysXBAs0H
fuZ9IA5s3Anm+NPNBR16UwDhiq+2tmVqoC7PV2N+Hdd4+bvXASPmFCMSvfqe/pPW
aEW+18V4aC+PwfJ5BbJr52O+Nkfn6HWXHBnz0g4g9J7TcOLbzDLH/v0ohrtuddRb
6R++mEQh0i/5XDWzefxl8GiqJ2zIO3EyHYT5zEaeQk+XVKfEkfNkpqLD1KOEBMfX
XbVoEBJrj+oyLi5umjGADsXG+JoMN8mb3zNG4anNA1FWFdLGh20Zy5poQTcz5Lq1
5vumUbZr8Uh/7+iOUIkwmm+VOlaLM4tFDaIUGZdhI/JQdeTDxZIkL7DtKW3/+CE4
s7FjjUkCf5qQi60OwiCO5Rl/zvr7PGHcTpYVIZoJJUFXDCF4fDM=
=nkPZ
-----END PGP SIGNATURE-----

--SsYEH7GpIJfqhCeD--
