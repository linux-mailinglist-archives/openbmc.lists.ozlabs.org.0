Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B693D101041
	for <lists+openbmc@lfdr.de>; Tue, 19 Nov 2019 01:31:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47H6Fs6fPlzDqVC
	for <lists+openbmc@lfdr.de>; Tue, 19 Nov 2019 11:31:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=stwcx.xyz
 (client-ip=136.143.188.54; helo=sender4-of-o54.zoho.com;
 envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=stwcx.xyz header.i=patrick@stwcx.xyz header.b="eVPsdSS5";
 dkim-atps=neutral
X-Greylist: delayed 914 seconds by postgrey-1.36 at bilbo;
 Tue, 19 Nov 2019 11:30:49 AEDT
Received: from sender4-of-o54.zoho.com (sender4-of-o54.zoho.com
 [136.143.188.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47H6Dn1t6MzDqYW
 for <openbmc@lists.ozlabs.org>; Tue, 19 Nov 2019 11:30:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1574122531; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=JyQpFns7vqqWLaUQnZW7zTZN4oFnbX94NyS4D+gNfCOhznTUwv88Hi5aPQvAL4HQFHoBRgQP6I3VhEh0Yu+KxcV/FriBfFeS1sBNAgQz1iOdfD0NhnQM2SEI27W0zMWXkn//WPkCsO0roKICjhSVvRASlFW5AymEE4irXB8IrXI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1574122531;
 h=Content-Type:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=BHwUf6ELwrHlCHkoewRseC6DPrrJVZEU1vII0Mx1Zhk=; 
 b=mdGDdYXTzkexxng+d+B0CntvrxHyE3h8NoQ1zzHWqdyiD9aFpGUSse3xt/wOtto6+xp80tx60eQAyltHiWa9oB0M2DZd5FE8WS+Oi2YfvKpj75kjp1IsUJXFPvD4k5wwCsGfF7MnltH0BsefyNLMhSB7pxczE6Kj0O1+gFC9yeM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=stwcx.xyz;
 spf=pass  smtp.mailfrom=patrick@stwcx.xyz;
 dmarc=pass header.from=<patrick@stwcx.xyz> header.from=<patrick@stwcx.xyz>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574122531; 
 s=zoho; d=stwcx.xyz; i=patrick@stwcx.xyz;
 h=Date:From:To:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
 l=1700; bh=BHwUf6ELwrHlCHkoewRseC6DPrrJVZEU1vII0Mx1Zhk=;
 b=eVPsdSS5jeFnTj/5zg3cx7woY196waCPM30uzYk3wgzMSy8CaK77EHq7YxqlTPYV
 n97/ULPn9bdwbAqW+u6uTKQ0WVBXEhkaeSYHbhCr78hYooocNbq7U0Mv9oC9FjG3E0B
 iGY/gb0EqZ2rm9AEAAlYCgVvLlxEYmE7gect48zk=
Received: from localhost (163.114.130.128 [163.114.130.128]) by mx.zohomail.com
 with SMTPS id 1574122529033315.91282880328697;
 Mon, 18 Nov 2019 16:15:29 -0800 (PST)
Date: Mon, 18 Nov 2019 18:15:26 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re-joining the project
Message-ID: <20191119001526.GB98839@patrickw3-mbp.lan>
References: <20170925113628.GA4313@heinlein.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="i0/AhcQY5QxfSsSZ"
Content-Disposition: inline
In-Reply-To: <20170925113628.GA4313@heinlein.lan>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--i0/AhcQY5QxfSsSZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 25, 2017 at 06:36:29AM -0500, Patrick Williams wrote:
> (deleted a bunch of text)
> --=20
> Patrick Williams

Hello!  Observant individuals might have noticed that Sai added a
familiar name to the FB CLA.  I started at Facebook a few weeks
ago and will be a developer on the OpenBMC team here.  Lots of=20
aspects of the project have changed and I have two years worth of
mailing list emails to catch up on, so it'll be a while before I'm
ramped up much here, but I will be starting to participate more
regularly now.  Looking forward to catching up!

--=20
Patrick Williams

--i0/AhcQY5QxfSsSZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl3TNBsACgkQqwNHzC0A
wRkqww/+JPMR5RzfBtUF5JbXx6OyA0H2htbFzVs6N1yeFV/wko6GBu72MRLiwnU1
PRt4jev9tEzLAiup3jgFxur0nXnxF/fdItegA1dbc8gpOA7CjSdRuZOGAQ9sX7OG
fDxLm3Eg1hlNv19SubWOtz28r6Ys0Ra3nAXbllBHujOUyuKqecP5O2a2SjnMKmdx
PaR1JLySkrn8J09lb6p1fmgGQi9FVxfsl3b3ccEOy7j1B+bxMQvVA68XRovu2vlt
5lmiYhgNDr1JSxTJbT8uaCbeB9Tq6Lc0dNaIZGOzrnhhsACWLXmUIvBRqj5cym4m
NWSFY3h87BANQ+p4UKTVFVSF4bKXUQ/2GEbtIpxiQVZ7hlEIeEHjB1aZWRVlqJS7
sbBC60Wz97no7JKY2IRPMGRckJilW9OgRkwTn/dx/0kpaGRqSX8d//x1GZ/O0bIl
6NSYeZs1LqNs9g1fuorRUiZmU3XGU3kOlaP3ZwnS45DNYGDlRIHBS9ojWVUtH/bd
TEa01MsW89/+PC0bDkNZyLjGns9M6rHMoyko4JXe3PK+MLni78Gl8XddNm3J2JAX
pcPu/G23qduQuxO7yY8CrFntiGjYUBHYFSaBdZ49GyVNPrtdspLH7rxfbLIAAgQG
9DEIK7bXjAhPncO8WF2rikavvXXeV74vSdxVTosowdH/QA65DDE=
=L9JY
-----END PGP SIGNATURE-----

--i0/AhcQY5QxfSsSZ--

