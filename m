Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5E15EAC72
	for <lists+openbmc@lfdr.de>; Mon, 26 Sep 2022 18:27:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mbp785cZ4z3bgh
	for <lists+openbmc@lfdr.de>; Tue, 27 Sep 2022 02:27:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=Pw8A9Z1i;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=fj2zbN2R;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=Pw8A9Z1i;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=fj2zbN2R;
	dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mbp6d2fVsz3bSW
	for <openbmc@lists.ozlabs.org>; Tue, 27 Sep 2022 02:26:30 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id A3CA4320092E;
	Mon, 26 Sep 2022 12:26:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 26 Sep 2022 12:26:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1664209586; x=1664295986; bh=WYuYI865W3
	uju+Gr7lT1w1OiJYxkxo93XMpn4X9hvoY=; b=Pw8A9Z1iWq/1GpSQp0X806aq8Z
	hR5TOb1lxKFufM98BYYcB8zLFufRqTOp++eaLbkc6RQIq5WshqK2Xkpjg6qLfY0B
	vhPnmUSIWIuyzeEBqoqQvhE5lgLScehFjErFNErr17goVujI5QBPG+fRV29CUGhl
	w4hpQOdLO7CM+z6LdkYAz+5ucBBUa1WgqRAy/Ghu/9EiWVAmZyBsMaWXu2W2D/Pr
	kOVdADJd5GNfTR1uwgFNc+RUAm7K/X1GWKPW07uS7b7ZrCnPDgj7yTKjVZ2niKWU
	SStJ2CEytsxKrKRyyWyipSSpxJlDZ4HmBvg5cnfCjAp7NnDe42rcPfiaNGqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1664209586; x=1664295986; bh=WYuYI865W3uju+Gr7lT1w1OiJYxk
	xo93XMpn4X9hvoY=; b=fj2zbN2RFnJ2Hq71T6nj7T8qoSP1Vy0xtFYy1TsUadcm
	yYm31sMA0dSNBCZRxBRTVQkLbLldXqDMc5CZzlYauGBB7N5cgYRdzUfwszDDOUyW
	hwAd34m34VSlikYUuYzsbQbSbPwJ2gRASri5/4mYItipVgwSHYu9it6WTTJFcNkM
	3aWeLvBb9C1Kb9Hln3E+b7fU/cDWPnUgKhqOJ2BFaXfbYw+BAwjl5aL3/CUoKzJF
	qi5HreLfhe1ignkrl/SkhxtBuYXXkMuAqUK8o28EWKNMGFdykUmhcuwUiZdMiLmb
	1KVhgQU5b4v0wLwaT0JGu1wBXGIqbXDonl73eMW0dw==
X-ME-Sender: <xms:sdIxY9-nCOLsaCyU8z-DFQ4-v0hl20FsG6DacNZvOMlhAyyEeNUT1g>
    <xme:sdIxYxvwC3Car3_LsgSLqEBsXB2afBn_QtC0TrQGwe71qDyV_v_CQnvkIz7F67-hd
    _Tu5ptvWEJccfpNWAk>
X-ME-Received: <xmr:sdIxY7DVESmPYj2o8x7yC09zFX1pdXK43vN-9tqjrpMfnhryTV0kUALdJVv1OPk5ah_ai_rxovOA9OsMPSZdG1ignZBACSlt>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeegvddguddttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enfghrlhcuvffnffculddvfedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreer
    tddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkh
    esshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepheefjeehfedtjeeivdefkeff
    heeludekudelleffkefgtdeludelvddtgedtheeknecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:sdIxYxeIt2XdOSQuPRGNdOcrVhuaYGtX14NJCKVTx8dmGbRPutdaTQ>
    <xmx:sdIxYyNg4dbeQSx7U0Xzi9o775OG3KtqWUkN_oA0zy_FDbdwW8NjAg>
    <xmx:sdIxYzn9f3UkkpGZavH36lY--qRGoYtVg-g8am-VJ9KIBVDody2lMg>
    <xmx:stIxY_pwq4m1Yx8K--65zpF2DDbp9vNY2ujlqdVdUB30L8NSrej4JQ>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Sep 2022 12:26:24 -0400 (EDT)
Date: Mon, 26 Sep 2022 11:26:23 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Naveen Moses <naveen.moses@hotmail.com>
Subject: Re: phosphor-buttons multihost control
Message-ID: <YzHSr0DUdjHpCtnm@heinlein.stwcx.org.github.beta.tailscale.net>
References: <000001d8d178$845d0900$8d171b00$@inventron.com.tr>
 <HK0PR04MB3236B36A4CDA767F59DB290891529@HK0PR04MB3236.apcprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BxUOwNLbQIWqOB4i"
Content-Disposition: inline
In-Reply-To: <HK0PR04MB3236B36A4CDA767F59DB290891529@HK0PR04MB3236.apcprd04.prod.outlook.com>
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
Cc: zehra.ozdemir@inventron.com.tr, openbmc@lists.ozlabs.org, "M. Erhan Yigitbasi" <erhan.yigitbasi@inventron.com.tr>, naveen.mosess@hcl.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--BxUOwNLbQIWqOB4i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Zehra,

On Mon, Sep 26, 2022 at 07:38:39PM +0530, Naveen Moses wrote:
> The host Selector object is not strictly required. The host selector obje=
ct
> check was only added to identify if the system is single host or multi ho=
st
> system based on host selector availability.
> Thanks.
>=20
> On Mon, Sep 26, 2022 at 12:58 PM <zehra.ozdemir@inventron.com.tr> wrote:
>=20
> > Hello,
> >
> >
> >
> > There is an isMultiHost() method to control to return true in case the
> > host selector object is available in button-handler.cpp of the
> > phosphor-buttons. And if it is not available, it does not return false =
and
> > the project gets an error. So we covered this return line with try catch
> > and it works.

Based on what Naveen wrote, it would be helpful if you could submit a
change to improve the implementation to not have this issue.  I'm
surprised no one else has ran into the issues you are seeing.

> >
> > But my question is, does this host selector object has to be strictly
> > defined for the project to run properly?
> >
> >
> >
> > Thanks.
> >

--=20
Patrick Williams

--BxUOwNLbQIWqOB4i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmMx0q0ACgkQqwNHzC0A
wRndMA/+JBjxZz5v+9w9lCgET9RS/0Utb5HhYsJOCUPDy91Vj4dDJOKJspgNqNWj
218lTwJPvaQq1FJDtvOW7GrhWoM4tbeWxfltOehcJFNKdO1gw413QMmTk0PkC87c
Wdw5XqlkD9rqjKFFO2qGSFFIsDXPFJn/OFuyhrSN1nC6RQ8zftHIQTFZYTRamMKU
U8z709gbtFp3cflhteppCQ8XP8cAQ4Lcu24C/IRqff8f66sjFR1u6rQnu1BsqJ6+
yB0NO22reDLiRSSY5anfM940ijP5v6Jwhtt+2w656imc4sZ7Zwn45u1mwF7hifYD
A7+SiOe6oMX930md6VSgeKrF6TdiTlV6jaSZe0lPstfB7l+5oumn5fXEdc3+InWz
Tijre1Jg0fWfF6XFVAUn+9WnET212HaIgX1RIZ0tfasxJMHrMVrQHpEjIuePFNHH
kDaLJ9qHTNTbLzToHe2xNFQT8pQok6akR+p36hQm1+ZFKNuIP+o4zJEV65apjCLb
CpAcocJXpT1h+9aE0N75rGIdFs+GM4Deqk8oNG1QItre30Zk8vp5U4onhY+5gjTf
dTZl8KjwyW0yRSdrggU3fd7zTJAjTyfauzxam+IgV0h4uQwOHtO3y2rG9Y7M6Uwv
897aFym3y9kXPK7wVGx4sBtW+KNzhVi9DwI68zQR2tUcAopk+pg=
=UhCQ
-----END PGP SIGNATURE-----

--BxUOwNLbQIWqOB4i--
