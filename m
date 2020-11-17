Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 563D02B565A
	for <lists+openbmc@lfdr.de>; Tue, 17 Nov 2020 02:42:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZpbK2L3nzDqKW
	for <lists+openbmc@lfdr.de>; Tue, 17 Nov 2020 12:42:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=XahfKL/9; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=dGAqvr+z; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZpZM6H31zDqJW
 for <openbmc@lists.ozlabs.org>; Tue, 17 Nov 2020 12:41:31 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 57F095C01C4;
 Mon, 16 Nov 2020 20:41:28 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 16 Nov 2020 20:41:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=cc0RD141nwGgQ13Uc89fIqPCkIE
 1mqD/+nOKRjxjFww=; b=XahfKL/94RXJTjt+cxjVfJmsPmJ9FVtC039yzRNBLrW
 EjqLQyqYghrCYzBNoV9mueFvgCTD+y8r0mEcZQn/ZaqYmQy/gjX4qH8mhK3ympwX
 fN/1YJLG7DFkupmhqPOoQVWVIA1EcMLYpYF/AOqMI+iAhtur0eom1irmo25TMRWc
 GbRrrKTg1wfPglc6MprEIXM49pbkNvXHxrJhRiWmKHMIXRaWtO7oFGv8zSEScqqt
 Hnv7rvggSJcA2BUFWdx/wJG4kWnjOW4Rjl/0qkzKlrpQOfxwVzU3Xa3fPa2N1VDj
 LfWmMZdTBDRhb2AmYvGqjo82pCuUa5lDuqcVdh3+EzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=cc0RD1
 41nwGgQ13Uc89fIqPCkIE1mqD/+nOKRjxjFww=; b=dGAqvr+z/OFV95P3QM5bf2
 SHK0LUlf4zEd5KlVVn+88u4lcWPN29JmyN8IjHBzfPL3M7UKeubAqg/5Yz/TypT6
 EUeJAf2WQh4Nux4D5szpRW326yFe1RfB1UPP+oaX4qiG5i+8wuFlUBMdu8VI+Gc7
 FaG1xGLUHkqpBN4HyjbxJORlid8jMhVg2kLQK1jlxQ5+d63AsCqy94sBv2aKPSYR
 TuwIqqYX4v2uW54Pt7pSjW/uK9yLTRMrAG7oIqBZONWbfY0lVWadU0Kl7gdnZ6gE
 2uZMgdMyy97g+ZBCImwJ4iAuxM56PWXbRf0C7YOh7VSZ1p8sgJzIIduulXX2WLKg
 ==
X-ME-Sender: <xms:SCqzX3izaA4x5I4QK0hVCqgQyUUpvs-WH--WvSwQfB58ob_HLhQXrA>
 <xme:SCqzX0BWaP5_pFu0DkdOZ07pDOO4yYTAibWOLsc2izamafgw73p38wDK-Nemc7nZJ
 tDfKgdS2hynHeSRL4U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudefvddgvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecukfhppeejiedrvdehtddrkeegrddvfe
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:SCqzX3GRSgrX599WoeTEFKmj57TtICsClJzP1V_CMdGb1UtYUbE8eA>
 <xmx:SCqzX0TfercX2k1pX5lyFBHCa-Bo1VB6xCWWV5hgn5dIBbtgE18IGA>
 <xmx:SCqzX0zs24rkAAzT54Ybecfjq7F400qJShcMxsSV01z3h09a-xyhJg>
 <xmx:SCqzXxoPrZMSeaf_5QMQ7tiQ-Ow5D5aaOpWOTq1Ls40bjv22odKC6w>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id D22AD3280067;
 Mon, 16 Nov 2020 20:41:27 -0500 (EST)
Date: Mon, 16 Nov 2020 19:41:26 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Sui Chen <suichen@google.com>
Subject: Re: Request to create repository google-ipmi-bmc-health
Message-ID: <20201117014126.GD4495@heinlein>
References: <D355FA68-E163-4DA8-861E-7E9DB68F5EEB@fb.com>
 <CAJOps0uX9K25NgXpi3M45F=pvvW5Am+9R=wYTLN0SZ2vPUcX-A@mail.gmail.com>
 <EF663847-4E98-4AC2-8A8C-E37B853C131F@fb.com>
 <CAJOps0tR5t4sJQX0-fhBJuKJSnQZJm12gWV9S0OYv4xWU7uzKQ@mail.gmail.com>
 <20201007014324.GG6152@heinlein>
 <CAJOps0tKN4ACB46hoNu1EeX4uaSZ_UeArzcZ=ehGA2sz0oT+aQ@mail.gmail.com>
 <BC4115A9-0587-4135-981E-38C086DDD3F9@fb.com>
 <CAPnigKn5cRVz3RuK-czkHVo2od1ZLpHCVgRu9q4OET-_nPwrWw@mail.gmail.com>
 <20201111121431.GI3614@heinlein>
 <CAJOps0vS6+eiZSdL=w6Trb2K_rTj3Rb2TTyp5_n2=_YrjUgH_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="48TaNjbzBVislYPb"
Content-Disposition: inline
In-Reply-To: <CAJOps0vS6+eiZSdL=w6Trb2K_rTj3Rb2TTyp5_n2=_YrjUgH_w@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Vijay Khemka <vijaykhemka@fb.com>, William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--48TaNjbzBVislYPb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2020 at 04:00:47PM -0800, Sui Chen wrote:
> On Wed, Nov 11, 2020 at 4:14 AM Patrick Williams <patrick@stwcx.xyz> wrot=
e:
> > Sui,
> >
> > Now that the design has been separated so that the majority of the
> > metric implementation is in p-h-m and the protobuf-ipmi-specific parts
> > just do light-weight dbus operations, it seems reasonable to me to
> > create a new repository to hold that part.  That part seems fairly
> > unique to what Google intends to do and I don't think we should burden
> > the maintainers of another repository with that effort.
>=20
> Our team had also met last Friday for a discussion on where the
> implementation of the blob handler should go, and we also agreed it is
> preferable to create a new repository compared to putting its
> implementation in phosphor-health-monitor or phosphor-ipmi-blobs.
>=20
> Now that the IPMI blob handler lives in its own separate repo, it
> seems to me that the design does not have to be separated right now;
> the new repo could, for now, hold the monolithic IPMI blob handler
> where the metric implementation is entirely in the handler.

I don't really agree with going this direction if I understand
correctly.  We started this discussion because people felt there were
bits that were useful to others in a more generic repository and bits
that were only useful to Google.  Now that we've come to agreement that
the Google-bits belong in a separate repository, why would we go down
the path that all the bits belong in a separate repository where nobody
else can usefully interact with them?

Given some of the code review comments I left in the
phosphor-health-monitor proposal, I'm not sure we've really come to a
consensus on how metrics like this should be handled architecturally.
If you continue doing the Google-specific parts, I think it is going to
be difficult to unravel the design into something that can be globally
applicable.

--=20
Patrick Williams

--48TaNjbzBVislYPb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl+zKkQACgkQqwNHzC0A
wRlfhw//Ts4sJGCurinMbeNshtBO3lgOp1wO5va+AavvnVSlncbkNkaKX/vAbZoK
3Ticrop0T8E+SPGxDs0XGhhUOdmMIpxuZqkoosThw4lih8MUDc0e75SMRw4V6o34
ybfVR/8vxwKvbWdeMw58MfOiGzYnlFoClwAfiwAqo+lG5D5Rq3cbWs1agap2ogN3
ntoBe9hVXrfG2dcWgxUGc7hAqTONkedBNxUN26EBOEHisX8q0tfho6zNAyXqN83G
hs2m+aEwaInMGc5bbiJlw+YotFg+7erXrHtEm2WF8Y2bJ0zxVqd6XkeAtwH+imEH
6aG4uwLmAawEUTp4KEttUpNo81vAptyThVWjuhEjWknwj5wLVdrMb7BVPUDsdoV2
0FhiYq4q4IeZsAaUegKAXL/1XYzGM+GmXfW/JYi6qUAATgeQBevgktpryDUYhC9f
idCZHeQG4s5iiQeTSQ35PqEw3TL7SqkFnZwYDAd0Cl1yAi/mk6466ZnkN761go9T
fLL1983lYB6XBafO2+y4Ped1yvjApsByO/8LYbTItX1E1VwWImPKxz2aFtAKylI+
41/sfV6fzc8axF7SqhB8YReIGyyGA/yxJAfUCa4mzHaaEyNGBrgOl2wBOFfrsX0K
LP4WYjcAhIV0esmqUbo5IoPi//UsaV5MJYMqOyse6MGiCesRPFU=
=MM8A
-----END PGP SIGNATURE-----

--48TaNjbzBVislYPb--
