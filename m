Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B57B26DFFD
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 17:47:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BshDj2ggxzDqfS
	for <lists+openbmc@lfdr.de>; Fri, 18 Sep 2020 01:47:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=I8VvqbJA; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=m6JxjpfS; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BshBY30JzzDqXM
 for <openbmc@lists.ozlabs.org>; Fri, 18 Sep 2020 01:45:41 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id E5C2C5C0135;
 Thu, 17 Sep 2020 11:45:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Thu, 17 Sep 2020 11:45:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=8RuT7smzSRkCKtxp1ehvCPD2bq2
 P2TKyuGtlB41pc2c=; b=I8VvqbJA5v77dGwjUiVIG86h5krvVb7paCWyHJs7jZl
 kPfkTV5Er95nyT8g9HBP497f1+5YPDbm9l1gZZeClgUGJRvhRhHFx3Q9qPXCduxx
 l24UgfIuqJMz5+Tb7nwYpnIxvrVIyGBHw5pYdHeYHdxQZbTnLcUXKS4oosG6P5mf
 BRjgeZHDIn+z5p+O9YFEktxjxD7DuPALbI/M9X+6eAIzdEfpC66wCVC1Cc2coYGo
 OEb3s/4orqV2mQSt/dwqdtd3yrR/D/n9te5IXIqr4zmK/8qMbhlUgXorrQVX3op8
 jS1V5ajW2xXmEQpzKn0k56NmB/idhjo8bJ5eVilcQqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=8RuT7s
 mzSRkCKtxp1ehvCPD2bq2P2TKyuGtlB41pc2c=; b=m6JxjpfS5m9AcQQbpP4RCn
 E9LtamcNLBINIRG0UbRWYKTmiinHZN7ah7JoDUYGAuqXytiz8zCezB/EQ38PP4EZ
 mIBmnf1spqANBJmwmD3J9vj3omvyoY7haRw/hE/ERE9EOZCuRsEqJsNutQHMH07G
 QIeFwzI/Qq9PSGKOmOoyWSsWKPxmHm+UF0WaH2YohJWpdQgBQvPIGEid4ikKwxOE
 KhodoHWiTppbiDX2oT2LEWPJiQJKm9P+I9iKmr6Gv2yAbLF8R1RIeiCnkmrcLtwR
 yl2DL0M7ThvS1MCuywsq4/JadBI38kBdpsNJA4Y6+0UzjuU5umoC7xPxQLABLaRg
 ==
X-ME-Sender: <xms:oIRjX9kS1ELCthoaQjq6C_J2FxiJnn0xmHQaJpKiSpJ8joL03-iVvQ>
 <xme:oIRjX40YPdOTH_5p9Xv4pwyXZQqaL_Bkzzf11-rOhM-G9XuNV2ttlNSWMK0kLFymN
 SeVdC_id-CYhedKRxg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrtdeggdelgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddvfedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpedvfeelkedtleejhfeitdduhfeviedu
 jeelheektefgieefiedtjeegvdeggfffffenucffohhmrghinhepohiilhgrsghsrdhorh
 hgnecukfhppeejiedrvdehtddrkeegrddvfeeinecuvehluhhsthgvrhfuihiivgeptden
 ucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:oIRjXzp6brS4LdLJb6xZV_SZ8hBw_cSQd6yGftXSx-uWH1q4AFAnEA>
 <xmx:oIRjX9mSNVOXrDl0kteSuANLhEnGr5eFwXtFDRARUPBKUA8D-hRB7w>
 <xmx:oIRjX71ADlqCalUBLkI0RYMco90KBn-6jTRavhcTR85AN4BWeBRIvw>
 <xmx:ooRjX4_k1riSc0ckPr2euMmAs7Pnc0LmJhGQ3whhVf1tXK44mGbWuA>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6846F3064674;
 Thu, 17 Sep 2020 11:45:36 -0400 (EDT)
Date: Thu, 17 Sep 2020 10:45:34 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Jayashree D <jayashree-d@hcl.com>
Subject: Re: Connection issue in OpenBMC image
Message-ID: <20200917154534.GI6152@heinlein>
References: <SG2PR04MB30932185827E6DCADD02F422E1240@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <SG2PR04MB3093E7C8F543D9AD318B4653E1230@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <68131600080119@mail.yandex-team.ru>
 <SG2PR04MB309303A2C979A689DE8B67CFE1200@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <18221600180837@mail.yandex-team.ru>
 <SG2PR04MB3093A564F0482CE5FF12BA42E1210@SG2PR04MB3093.apcprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jaTU8Y2VLE5tlY1O"
Content-Disposition: inline
In-Reply-To: <SG2PR04MB3093A564F0482CE5FF12BA42E1210@SG2PR04MB3093.apcprd04.prod.outlook.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Konstantin Klubnichkin <kitsok@yandex-team.ru>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--jaTU8Y2VLE5tlY1O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Jayashree,

I saw an output `ssh -v` from you earlier, but there really wasn't any
useful information there.  It looked like the connection was being made
and keys were exchanged and then the log just stopped abruptly.  This
tells me it likely isn't a networking issue but an issue in the
handshake between the ssh-client (your computer) and ssh-server
(dropbear).  You can continue to add '-v' parameters up to `ssh -vvv`
and you'll get increasingly more information.

Joseph Reynolds recently posted a reminder about dropbear disabling weak
ciphers[1].  Is it possible that your client is using an old cipher?

On Wed, Sep 16, 2020 at 11:35:28AM +0000, Jayashree D wrote:
> root@tiogapass:~# journalctl | grep drop
=2E..
> Jan 01 00:15:28 tiogapass systemd[1]: dropbear@0-10.0.128.108:22-10.0.0.1=
:51810.service: Succeeded.
> Jan 01 00:15:44 tiogapass dropbear[2753]: Child connection from ::ffff:10=
=2E0.0.1:51944
> Jan 01 00:15:50 tiogapass dropbear[2753]: PAM password auth succeeded for=
 'root' from ::ffff:10.0.0.1:51944

This looks like a valid connection was established.

> 15.09.2020, 16:12, "Jayashree D" <jayashree-d@hcl.com<mailto:jayashree-d@=
hcl.com>>:
>=20
> OpenSSH_7.4p1, OpenSSL 1.0.2k-fips  26 Jan 2017
> debug1: Reading configuration data /etc/ssh/ssh_config
> debug1: /etc/ssh/ssh_config line 58: Applying options for *
> debug1: Connecting to 10.0.128.108 [10.0.128.108] port 22.
> debug1: Connection established.
> debug1: permanently_set_uid: 0/0
> debug1: key_load_public: No such file or directory
> debug1: identity file /root/.ssh/id_rsa type -1
> debug1: key_load_public: No such file or directory
> debug1: identity file /root/.ssh/id_rsa-cert type -1
> debug1: key_load_public: No such file or directory
> debug1: identity file /root/.ssh/id_dsa type -1
> debug1: key_load_public: No such file or directory
> debug1: identity file /root/.ssh/id_dsa-cert type -1
> debug1: key_load_public: No such file or directory
> debug1: identity file /root/.ssh/id_ecdsa type -1
> debug1: key_load_public: No such file or directory
> debug1: identity file /root/.ssh/id_ecdsa-cert type -1
> debug1: key_load_public: No such file or directory
> debug1: identity file /root/.ssh/id_ed25519 type -1
> debug1: key_load_public: No such file or directory
> debug1: identity file /root/.ssh/id_ed25519-cert type -1
> debug1: Enabling compatibility mode for protocol 2.0
> debug1: Local version string SSH-2.0-OpenSSH_7.4

This is the log that also looks like a good connection.  Identity files
were attempted to be exchanged.  Version strings were exchanged.  And
then the log just abruptly stops.  Was the connection dropped?  Is it
hung?

1. https://lists.ozlabs.org/pipermail/openbmc/2020-September/023071.html

--=20
Patrick Williams

--jaTU8Y2VLE5tlY1O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9jhJ4ACgkQqwNHzC0A
wRkewA/+IgCcMOeZpKWwq53Y1FV8fF/v9/kzvCMK3W2rW9E3z1kWrvbeAT2eNIbE
lcNrXZrq316tj1l836GfUsfLiG4fyJU0BFjJTf8uhimXhjSGEQ5We6LjZXi6SSLt
2KOeCfjZ+LqfBiIVmEByHJ/7OmWk+H7lb1bF0ufUWZ2t/oGaY+9WBD0tEPNggknB
xo2lTpyAB/GNCRVEX4QcheMN7S8UHkRMbc95aX+N3Lytl5m5KkjcTs53qK+M+d5n
FqCd6NurkMsX4UCbeaLm/710gkqJmD5wH2wrCefoxspO8P9sMKpKqLh7zz1iNTjq
P1kR3rSqThyI9EPJJJhR9A1fADdQ2vBYLeDYxGGb9eakuVoWEj7MCx8KcGUB8ENu
7pKSUPVVGYYDiAIssavCRP3w85f6GuT20kJn+4qt8cVVefRVZb5puhdhSAKmNcCo
sM+H94H1AFDa1HoKVXcbsbJnaw8X5EDoNzmPQroubg0QyyH6ss/53tjbPLlDbihG
FJwlLZXOO1bGdI4Gj0gSEmolrVQZEWL/JrLf20Jnjs4ZfjMXdsEmbDI+T6s7ReW0
j3HZDoE38Uh4ofkYJvBuwkGIdVaQYV2TqC9oGJyxK2A1B/v/y10TEyYbxvYWS4qD
sn5pL0HreebryDFY6nm9IAuFZFATDaWIjUALwV0induuMekQYl4=
=gjgJ
-----END PGP SIGNATURE-----

--jaTU8Y2VLE5tlY1O--
