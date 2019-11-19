Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD8A1029BE
	for <lists+openbmc@lfdr.de>; Tue, 19 Nov 2019 17:49:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HWyR2d8YzDqW9
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 03:49:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=stwcx.xyz
 (client-ip=136.143.188.54; helo=sender4-of-o54.zoho.com;
 envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=stwcx.xyz header.i=patrick@stwcx.xyz header.b="YVpdY6j2";
 dkim-atps=neutral
Received: from sender4-of-o54.zoho.com (sender4-of-o54.zoho.com
 [136.143.188.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HWx96NBQzDqdl
 for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2019 03:48:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1574182122; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=PRTJSV5wEbatXUfdXmOsgxOBVdnYTElKyc35bZVq3OUgl8nV1b62r8vUcOWwGXCXXK2bbQG6UEhoj/C8Bx6rqaNuHuWKBgSQv7YsQ2Xsq/1di7f3Ngsxrvz8g3nqGSFujeBRAhXpR7zh6s63YbhmeyTZmp+IEYOPcfDlrOnYLBI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1574182122;
 h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=Nfv4pruA47IlPw7hs6tripwWEc7T3+D8J0/dULnl3QI=; 
 b=ODdufJc6hLPZ9g2MfGAdx6UdCDp+KcaVJj/6nUxS1aphzucsyYoYAQvjDn+0C7OgPvRLbujM5TNtL2SQeVjgLk9PFCW3btmGwRMteVWlvVQOyroPaWrFSEPbospotPhFOfpA548HOsLUxe5H1jZGe/84wBIkPNJeBZF0qbqWbmM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=stwcx.xyz;
 spf=pass  smtp.mailfrom=patrick@stwcx.xyz;
 dmarc=pass header.from=<patrick@stwcx.xyz> header.from=<patrick@stwcx.xyz>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574182122; 
 s=zoho; d=stwcx.xyz; i=patrick@stwcx.xyz;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
 l=1660; bh=Nfv4pruA47IlPw7hs6tripwWEc7T3+D8J0/dULnl3QI=;
 b=YVpdY6j20mBueSjqlfCzKNg6lpwSCXTQ6CAvlyzffIoT/+FV1ZTlxFUofY97S6pI
 xxP1E+XY7NsuLY7wzB68JAW76dAiqb3Y7hvu6/lZtyf4f1cXXY4xo7ULrAGrGTVg59d
 KsSQQgKoqLFQp2HDxtZa9/y9agv5FhQ1l19rotns=
Received: from localhost (163.114.130.128 [163.114.130.128]) by mx.zohomail.com
 with SMTPS id 157418212030526.70229870335936;
 Tue, 19 Nov 2019 08:48:40 -0800 (PST)
Date: Tue, 19 Nov 2019 10:48:37 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Geissler <geissonator@gmail.com>
Subject: Re: Re-joining the project
Message-ID: <20191119164837.GA93344@patrickw3-mbp>
References: <20170925113628.GA4313@heinlein.lan>
 <20191119001526.GB98839@patrickw3-mbp.lan>
 <ED91B0D1-9C81-43CB-9234-4679F6C6A70D@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="liOOAslEiF7prFVr"
Content-Disposition: inline
In-Reply-To: <ED91B0D1-9C81-43CB-9234-4679F6C6A70D@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
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


--liOOAslEiF7prFVr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2019 at 09:37:55AM -0600, Andrew Geissler wrote:
> > On Nov 18, 2019, at 6:15 PM, Patrick Williams <patrick@stwcx.xyz> wrote:
> > On Mon, Sep 25, 2017 at 06:36:29AM -0500, Patrick Williams wrote:

> Welcome back! Any big features or functions on Facebooks
> list for OpenBMC?

Nothing I can competently talk about yet.  I know there is already
on-going work to get TiogaPass, which is an OCP system, running
OpenBMC.

https://github.com/openbmc/meta-facebook/tree/master/meta-tiogapass

>=20
> Andrew

--=20
Patrick Williams

--liOOAslEiF7prFVr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl3UHOMACgkQqwNHzC0A
wRn+aA/8Csj8USJiJxHHnDsXgQu+eUp8RyBpwTO6w31S/6NDQ7SjwKkphpMXY7P6
SwIJfBw78rqAGs7jcsBaJOSW99oMDuiNTGihPrTRytMTJiKy6JfQekShB/voHS8c
gdsQEr37udjTOw542+Ex9KC00twt5f7LF8CaTHuPoY8bcphvKnUsEVwADTRtLqnh
1nN/0ZroltXTtdwX2uDdUD9WxvTqxuGTKTFyB8J1sv8NhTNiAk++R7bBSIwtvjYf
7lyE1bGIrR43uWhV1g8e3+wKv8lHsh4Zdjot8F89jfdJ32k8wUsSMH39rsL8f0mw
x7iCOPwvn2CSvK3zyz83vwadcHW0gws/m+P3iGWlTh06Lr6VLxg4x9j4GJYFTenG
128QJ/x6fH87BRdH8ZtqcTbZaui9p5f+I98E2pR1QLF1S9LO+8PcGyM+sHR7iiVK
y/WZcWosZ/P6KVgFiPrzlVv+drP2hNa17Q+C5JYdCOItUxooqRSgN3KpUZoDbP3k
oF5K8SHO+87XMB+d4WUiIBttDAkSMwXYWlH214CkZYIwOUBp9dhc8RHzLQykdxlG
BgBdbQOMpSEHdUXNsMhotmXZDix2BAiIkF/AJj+p6fkZ9+88hlV5NNO+3YVWewUK
Q6N7v62MlnHyHd0iq3AH5PU3uPoNh6+srexEfQwJQltUbMxG9WY=
=vJQC
-----END PGP SIGNATURE-----

--liOOAslEiF7prFVr--

