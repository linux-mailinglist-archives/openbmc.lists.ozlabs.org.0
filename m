Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0ED310104C
	for <lists+openbmc@lfdr.de>; Tue, 19 Nov 2019 01:36:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47H6Lk0sQwzDqSn
	for <lists+openbmc@lfdr.de>; Tue, 19 Nov 2019 11:35:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=stwcx.xyz
 (client-ip=136.143.188.54; helo=sender4-of-o54.zoho.com;
 envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=stwcx.xyz header.i=patrick@stwcx.xyz header.b="FnfM0rb6";
 dkim-atps=neutral
Received: from sender4-of-o54.zoho.com (sender4-of-o54.zoho.com
 [136.143.188.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47H6Kz4zyszDqM7
 for <openbmc@lists.ozlabs.org>; Tue, 19 Nov 2019 11:35:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1574123712; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=clsMTBRP2GCqm+w9WIYY5eR2BDhcGhg6IQkCNAFGE7kGRc5fs/o57A6fyzVS6dJ/73UBKu9xI+El4Cz5zGI+mj5psmhuOvX1jGbFBDiywa6zlicrl163HHWInA+rKOxkhmHeAl0un/Pz5oyJhCBzWczXVeiSCe2ykRuZWm/JaRk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1574123712;
 h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=5FZOxtsx5tvWn/4Q19qHlgNGJ8vPt6jtynN9K2/ffW0=; 
 b=COoudwhcXDXTuYHMUNhT8LC18s/AOhEPj4AGDHz6f+IDTkUOAog6/TI7K0GJtzXqX4F4zCNyrizfQF/Yl60DmcbtgaZMa3XubOlRN3hWYHzkqSNkFvbTqa9ROMPgX7d3OA0UGAenGTLkhiAyjVy1/aKEJy+08ZkcrfL+Q33kDEI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=stwcx.xyz;
 spf=pass  smtp.mailfrom=patrick@stwcx.xyz;
 dmarc=pass header.from=<patrick@stwcx.xyz> header.from=<patrick@stwcx.xyz>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574123712; 
 s=zoho; d=stwcx.xyz; i=patrick@stwcx.xyz;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
 l=2670; bh=5FZOxtsx5tvWn/4Q19qHlgNGJ8vPt6jtynN9K2/ffW0=;
 b=FnfM0rb6o+AI1zSN+eOaKaiY1avEe4tREq7k3Ygef0eFheWOGnQZHwZSNDcCBNcE
 6SFyhEOpFfBc3Z5Yz1PqSXtGsut7v6hW6BWaXd8mjLC4Dv7IYAwXbd6oK/f4I8UT+MQ
 JkkYdWPSA2ax0tdB/cW5JcWH0NrenBh5j/JyOOoY=
Received: from localhost (mobile-107-107-189-186.mycingular.net
 [107.107.189.186]) by mx.zohomail.com
 with SMTPS id 1574123711537627.935011811209;
 Mon, 18 Nov 2019 16:35:11 -0800 (PST)
Date: Mon, 18 Nov 2019 18:35:09 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: 2 patch dependency
Message-ID: <20191119003509.GA80304@patrickw3-mbp.dhcp.thefacebook.com>
References: <EACBC95B-0761-4667-A622-E1C0EA6EF1ED@fb.com>
 <E782C583-DBB7-4589-BFE6-EC69E2343424@fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Content-Disposition: inline
In-Reply-To: <E782C583-DBB7-4589-BFE6-EC69E2343424@fuzziesquirrel.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 05, 2019 at 09:27:21AM -0500, Brad Bishop wrote:
>=20
>=20
> > On Nov 1, 2019, at 3:18 PM, Vijay Khemka <vijaykhemka@fb.com> wrote:
> >=20
> > We have issue of merging 2 commit which are dependent to each other. I =
am not sure how are we going address this.=20
>=20
> I=E2=80=99m working on this today:
>=20
> https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/26910

Do we have any sort of topic-based multi-repo testing?  If not, is there
any interest in developing it?

I implemented this on another project:
   * Whenever Jenkins was triggered by Gerrit, it looked at the
     GERRIT_TOPIC variable to determine if the change belonged to a
     topic.
   * If the commit was in a topic, Jenkins queried Gerrit for all open
     changes that belonged to the same topic.  Using `repo`, Jenkins
     would extract all of these changes into a working directory and
     `bitbake` to kick off a build.

This was useful both commits that spanned metas and for commits that
involved both code and recipe changes.  This was really useful for
changes that added a new dependency so you didn't have to add a
free-standing recipe update with a "trust me, the code is coming that is
going to need this dependency" kind of comment.

I know we're not using `repo` right now and so there is some work
involved in making this span the OpenBMC code repositories, but a simple
first step would be to get this working across the meta subtrees.  Would
this help changes like Vijay's so we don't need to involve a cross-meta
maintainer?

--=20
Patrick Williams

--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl3TOLgACgkQqwNHzC0A
wRkBBQ/+K0J69fOfBygULTMtLqteNYyFGbaRUnDsJ2393dIf+34h3OBy7KxbshEA
wu063nGWUC72oP5+hn/jZ+gorQR6yYxCxDNP7sHW1/8fmkY7iRwonnLQvTaYpW23
jBZF+FQzL6toSJzUpL68zOwQWOpRwhh/j4SawwWX//lTbNfhzcIBx4q8wHjzL+kG
AKI/eJUK3982QZm8T0eC3j9A6Rjllt5MbGRqQMWCHdwHE5IEm2SaQnF2xAbTCgS7
h9/y5nNg+Y4W6Kp74IzRve4EElHX0keZVOQdjHqzE3CwrV+2hagOFU35rOyJRWQ9
DRcWWUMapvKYaT1qjv3gLq1R2Ku+Cx0sJVZKosDz1QneQQasn0D26zefuI/Gzuzj
vUFxij6VRKCG0pfT4FhvHX8aYWX8fYn9e9L7cGgQ94nux1jB1wEVfKsrwbXWGSui
LJIBSDWw4+16pGpZD5/TnuXqQtJpFS+vXE5spRruHa44BkWTOnLT1ZGT4snO8asZ
BDt5Jo+U1S9+D07VQH84+5GubVM7xBfeD608wS7HuZGT6L9EqaFnAQbaZUYZESjz
cZjDW6PliNZ/ZxEHsSisu0Sy6G5ezX5HemI4PkjqbEPVkjmDttjjob3KGMdeAXX4
buLFV+T/bFJv4AfqvDaih2AufEcD9n1ZhVoUp7pG8hoQAaERHmo=
=GXt4
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--

