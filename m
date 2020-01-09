Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0955D1360AB
	for <lists+openbmc@lfdr.de>; Thu,  9 Jan 2020 20:04:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47twXK6B3zzDqbg
	for <lists+openbmc@lfdr.de>; Fri, 10 Jan 2020 06:04:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=stwcx.xyz
 (client-ip=136.143.188.51; helo=sender4-of-o51.zoho.com;
 envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=stwcx.xyz header.i=patrick@stwcx.xyz header.a=rsa-sha256
 header.s=zoho header.b=CNYaZdYm; dkim-atps=neutral
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47twWd5WPbzDqQy
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jan 2020 06:03:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1578596629; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=d+jBLVB9hgzjbyvz1U9sSFgZiXQX+m/WE+ghKe+g6ZHA5lToyloW1TZlnSXpIBA1bRjc/rU6VLsn37KLHoJPt0jKZUixJHsmHUCJ9IXz+ybcLjbgY/T5oPtdqOfp1T7K7uNgdvEyEOIpJy9mIh7yd0QfZqIRyqKvynWXpAmbWnE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1578596629;
 h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=OGAcA4m+jfiMRTQMypNyJhJuHwrLug9RPYrNpA+PhzI=; 
 b=Iq7LbhjR2fnoObWdjPdXviA4t1AwumwF5xwLCKf1X73Jf6oA6jUn7JqkfC0uxitsTbJ5HW1JTdllJLC4sGBI6wIcSPUKn4sQjESZpnUW4abL3zXLQ+ELzchyIK7rMXm3khrG1VN6dJfKyQWNa7dAXf6G+UDPyGoKcnDfXXfDQuE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=stwcx.xyz;
 spf=pass  smtp.mailfrom=patrick@stwcx.xyz;
 dmarc=pass header.from=<patrick@stwcx.xyz> header.from=<patrick@stwcx.xyz>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1578596629; 
 s=zoho; d=stwcx.xyz; i=patrick@stwcx.xyz;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
 bh=OGAcA4m+jfiMRTQMypNyJhJuHwrLug9RPYrNpA+PhzI=;
 b=CNYaZdYmbv2iaEoKaugcFspcf8Hu71OM7EJG1gKEZ5dkCaQ025HwDjuK/LM0RdQP
 woqIfyup46nd1Zg4xuK6a07Yt2q9lBTmTVdACON++RmmLVxfr899HE594ws7ks5hKVz
 kf+iuK0M9EzV0GrAzkp/UZpcht3mHhStxltAvWgQ=
Received: from localhost (163.114.130.128 [163.114.130.128]) by mx.zohomail.com
 with SMTPS id 1578596625713180.79503221243374;
 Thu, 9 Jan 2020 11:03:45 -0800 (PST)
Date: Thu, 9 Jan 2020 13:03:43 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Matt Spinler <mspinler@linux.ibm.com>
Subject: Re: Using a struct[enum] as an sdbusplus D-Bus method arg?
Message-ID: <20200109190343.GF1233@patrickw3-mbp.dhcp.thefacebook.com>
References: <ad2ea491-9eb0-375b-1832-c2a50e63b3c7@linux.ibm.com>
 <20200109162238.GD1233@patrickw3-mbp.dhcp.thefacebook.com>
 <0de28bd0-95a7-11f6-f2bd-9806508ec5cd@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="oPmsXEqKQNHCSXW7"
Content-Disposition: inline
In-Reply-To: <0de28bd0-95a7-11f6-f2bd-9806508ec5cd@linux.ibm.com>
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--oPmsXEqKQNHCSXW7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 09, 2020 at 11:25:24AM -0600, Matt Spinler wrote:
>=20
>=20
> On 1/9/2020 10:22 AM, Patrick Williams wrote:
> > On Wed, Jan 08, 2020 at 01:32:49PM -0600, Matt Spinler wrote:

> Since the vectors are of different types, I think the code generated code
> would have to
> do the equivalent of?
>=20
>     std::vector<std::tuple<std::string, uint8_t>> data{};
> =A0=A0=A0 m.read(data);
>=20
>     std::vector<std::tuple<Types, uint8_t>> apiData{};
>=20
>     for (const auto& [arg0, arg1]: data)
>        apiData.emplace_back(convertStringToEnum(arg0), arg1))
>     o->createStuff(apiData);
> That's a pretty big change from what's there today.  Think that's possible
> to do generically?
>=20

It seems like that is something that should have been done in the
`message::read` function.  First, since your initial data type is wrong
(that funny enum<...>), I think we need to figure out why this function
isn't working correctly:

https://github.com/openbmc/sdbusplus/blob/master/tools/sdbusplus/property.p=
y#L72

It was suppose to have handled, through recursion, enums.  I would have
expected data's type to be vector<tuple<Interface::Types, uint8_t>>.
After that, I suspect you'll get compile errors that m.read doesn't know
how to handle an Interface::Types enum type.  This would require some
C++ template magic, but I think it could be handled there.  We need to
teach m.read to be able to call convertToMessage and convertFromMessage
if those exist.  I don't know why we originally did that lifting in the
=66rom the generated code, except maybe that enums were bolted on later
and never fully complete?

--=20
Patrick Williams

--oPmsXEqKQNHCSXW7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl4XeQwACgkQqwNHzC0A
wRn0BA//YWz4MoEePDjiVcO824/5oosFbQTNZY/3wm8EpiD073AwADY6yWTx85f9
SBZ5qu7nRyyE53a0JsJ9hullSwM9r/vwN65rP7MUg5rBLL6yTp4sC/5n45S0RKsA
VAXDl5aIkoqiLx9xJ3031THfFKDobv2ZP5Amm9mNAj+mKdKGEFZwOfbTOGSKYK0v
FQOyJO7bDST73+7tIBF8r2Tzen9Ld8Er56HaHvaWs3WcWOZDktW+HiRchWiSZRag
uq1SXlG4RlVda2uhrkMuwhPphAzQsOokbxJ3wrR7nvv1m8/kyGRSC7htU0A1rXmK
9K9Nvfz8SJ1yvn92phmxP1hUWSbeJAv+5r9bg774MKraBq/qzN/ctdRGt0YCz/Qb
Ipgpe3es9BtdfWqZFC+EUS7DdJh7vaJ3ocR4lPVkEw3b0x6hlZthdxb8aXoV0nz3
2HxQTM971OYxa40Tw7z+MWFsU3gWH2Ykg6lnEy71B8g/MbLIyWmPN9u2lViSGXfS
End+bQ3XzzZb4pDTbwgH7MbEY9I2o+O3PGL60fHuTwcTi+FakIpygpMSNcazXDRh
o5wKSU9SmaLJhAQQTrxwdqtvAac1FhAbWNIcU7C3LZ6TD1M3QJTOs4uOdClkY8S/
xBdtjCDbax8FG2au2QIKtMcOz+/QXcePQ0l+U+Ri40JGnwedoKE=
=HkKU
-----END PGP SIGNATURE-----

--oPmsXEqKQNHCSXW7--

