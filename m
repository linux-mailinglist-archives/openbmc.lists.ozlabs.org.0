Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B66E12500C
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 19:03:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dNDH56WPzDqkW
	for <lists+openbmc@lfdr.de>; Thu, 19 Dec 2019 05:03:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=stwcx.xyz
 (client-ip=136.143.188.51; helo=sender4-of-o51.zoho.com;
 envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=stwcx.xyz header.i=patrick@stwcx.xyz header.b="jybl6/Eq";
 dkim-atps=neutral
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dNCM1gW9zDqjb
 for <openbmc@lists.ozlabs.org>; Thu, 19 Dec 2019 05:02:54 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1576692166; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=bC3VuoD07niA+wmg9Y4vJAobkHw+I2hMHZ2bWrRiXaJ5pxLmOyR8ay9IIDztoIpvFDk1jeTkc3okZucpCuW89G45Qd3ZqoiLGu+G0cNb6irv++Es9/YLZ6h4F8YwtSDIWrID64YHTJSRIViQe76bqFxO7K14+AttZWtFFtAT4Mg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1576692166;
 h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=kBXMZpY38bfbvq0fPMHgPDMk6nkdeE93khWmqI6Xolk=; 
 b=a4PBs5DiW5d7udBpC4T2atA0j20XByf3lQQqPodeZt2xhu+0HNMw6aqeB51xgjj8whkxGuSpEOo3u25Q11b72vYCLi0Wlhe7jfS41pX//wfuxhRvJ9YpvgTvnVVLClxjm5prlIDWfuxm3NGehDO3QQYWIQqKsS/XmiYMJTLS8cA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=stwcx.xyz;
 spf=pass  smtp.mailfrom=patrick@stwcx.xyz;
 dmarc=pass header.from=<patrick@stwcx.xyz> header.from=<patrick@stwcx.xyz>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1576692166; 
 s=zoho; d=stwcx.xyz; i=patrick@stwcx.xyz;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
 bh=kBXMZpY38bfbvq0fPMHgPDMk6nkdeE93khWmqI6Xolk=;
 b=jybl6/Eqg7cCVmbxoyY5ZOaM/965do2uUj2JU92plmdKmv70pn9RY/vom/zo+1dw
 ci73o3UWQ7ySjnrc44bNdpXQ7840IE+FfkV+qFzuMfJH1QG4cNasVAHVinzkoFJTfC7
 n9D0iY9AmWIH22BCiviskue65sunnJiBS4dp6kcU=
Received: from localhost (163.114.130.128 [163.114.130.128]) by mx.zohomail.com
 with SMTPS id 15766921647351022.7071942283399;
 Wed, 18 Dec 2019 10:02:44 -0800 (PST)
Date: Wed, 18 Dec 2019 12:02:42 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Geissler <geissonator@gmail.com>
Subject: Re: bitbake of individual repositories
Message-ID: <20191218180242.GA61593@patrickw3-mbp.dhcp.thefacebook.com>
References: <CALLMt=oyMtrZ4iU5BukqrNF4-7wXWPaSOxg20Hr3Y4Lo182Ejw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="r5Pyd7+fXNt84Ff3"
Content-Disposition: inline
In-Reply-To: <CALLMt=oyMtrZ4iU5BukqrNF4-7wXWPaSOxg20Hr3Y4Lo182Ejw@mail.gmail.com>
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


--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2019 at 04:02:12PM -0600, Andrew Geissler wrote:
> Other ideas out there?

I've mentioned repo before as it can assist with this.  Bitbake has a
feature where you can set "SRCREV=3D${AUTOREV}" and it will automatically
pick up what is in the git repo.  What I've done on another project is
this:

   1. Use `repo` to pull down all the source repositories in a consistent
      tree (and ensure it is in the Docker build image, such as in
      /workdir).

   2. Run a small script to fetch the GERRIT_REFSPEC and/or GERRIT_TOPIC
      on top of the checked out `repo` location.

   3. Add a small .bbclass that replaces "SRCREV=3D${AUTOREV}" when an
      environment variable is set and update the recipes to inherit
      this class.

   4. Set the environment variable prior to running `bitbake` and add a
      source mirror to point at the /workdir location instead of Gerrit
      directly (eg. 1 line in local.conf).

Now when bitbake runs you're getting the full bitbake to run against the
commit (or commits in the case of a GERRIT_TOPIC) that you've extracted.

--=20
Patrick Williams

--r5Pyd7+fXNt84Ff3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl36ab8ACgkQqwNHzC0A
wRk0Ow//XCKZZvGudMGrHVoxNd5wI8Ni0G7mp+jnKQxWzp0jYo+kVKrP4dV4nlbe
aRYd0pzQsIv6/Q5Cfx95iyFEG1H+sI8gmvfpu9Q/qWA+LuU/7uDQ42sc+q+8gGE7
WC5npsekuaNIktapyJxWmgN/JheB185kC70paxO4U/8GHISqeaci3MrSV8OM9hyF
eAlv1GYeDK4PDjp8iJm29R5TmG5tJSOLy3P0h+JjSmrE5UfQwOJ857SyZKvK8IYB
WkwzjROUeuFiTginv4BAVLPKGDmYJBaeoGWfuSWvkCgYqBc9PNrBav4hkNvVQ8YG
se+SePt6avCkj+VrlMp/+wwbwvRqa9qGlyFgnJNb+1t/P3pXiq/3UFYvHNOgRl3e
X8aZG/aWYFpeTodfg1JdIfYGKNHu2ejOucqApZKQ2xtrrkyBAHZSJ3R3n+W06+TV
khUSzRnWaEQUXOT5S8a2N6Rthve4Q4MNJa02waCCc0ySktZQn+QLsdRCf7UZjC/u
frekAcOk5ivVaDtfiPZgSuujxexr29HwiSUSOVXMBmDBqwmfumKvV8lEsw8MD6v4
AvWNJc6SwMcdoPlsRjde7epPWFE5nUJxqxJXdfusRyZJ18tnHw+pm9k5BMkFpWP3
CKvZMPSka67j8shhci84b6GR5Q1wtN6nFGxbwYMAGU9KSO2I57Y=
=bERZ
-----END PGP SIGNATURE-----

--r5Pyd7+fXNt84Ff3--

