Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 025501AD154
	for <lists+openbmc@lfdr.de>; Thu, 16 Apr 2020 22:42:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493B3T6h0VzDrhF
	for <lists+openbmc@lfdr.de>; Fri, 17 Apr 2020 06:41:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=IbnqtAsU; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=X2md5S6S; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493B1X06TXzDr85
 for <openbmc@lists.ozlabs.org>; Fri, 17 Apr 2020 06:40:15 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 4A0EC5C0279;
 Thu, 16 Apr 2020 16:40:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Thu, 16 Apr 2020 16:40:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=xRbZcGhuIqbTVMbOYEoKzBW3U3w
 xkAQjzM7h6uPWucA=; b=IbnqtAsUrXJHZBFi+t8eTA7W4GGwhCoZEyijTLcC6+i
 YcPWpQzBAjhlOTlaPWqztcCwshKw6GIdafa3iQ95zkAkftlQQXiDPvgjSm/eRfLi
 s200VUePYnm2vF2nuPiDzzANkd/Ki2X6Aq2GMxcfKfPDPO7v+wVX9Lg717PAYMJ5
 kF8k8P4lJ9E3CCIoBqa/UCpYP2qwBkxRnsy2ld30fSclsnl05bNDnyXyXFJTPs00
 qv/QEH+X93Gke2gkRK87qN/Q5PIjg7yR5jzDvPuKiGiKaepz9SKRPgKm4BInh4jX
 NSwCJAwk+SvBxplelBrNtOdMdZ2lXUy3AdWThcODh3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=xRbZcG
 huIqbTVMbOYEoKzBW3U3wxkAQjzM7h6uPWucA=; b=X2md5S6ST7+7CDAOZAMxZV
 APp4IHJFcAzxN84BNo2MFxN3Q14sLQzY4Lt5ntHtQoPYngI7JUWdusyF+r4wHTnh
 YrfTg5tpITS86J46tI8LaRr/FCiOmK+iBkYDjoYGWrA6fx23zu29T3T+rIzrxy9W
 ysKYq2zB6ZsKty9dLDH1hjTsemMLU2EZxN2cERS4d50kr2DnbC4n3HrCKQyfjMFb
 8MjqDgORBk+1Td17dnASpG1j+k1iQPvEi8CczIsDhqghvK0xVQzQsYx8qEWEZIh+
 +XeS2ZbtuKvb9wCjgGMqgccSSSHfKLbBbcFNZhFwKNvw8V30liiVyqjGXJIqgg4g
 ==
X-ME-Sender: <xms:q8KYXjxMmPAutkJkhdYncWkF97LTejc767aUrKyMWrrzwF_tiRdx_Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrfeehgdduheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 udenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecukfhppedutdejrddutdejrddukeeirdduhedtnecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhessh
 htfigtgidrgiihii
X-ME-Proxy: <xmx:q8KYXvhSyzVp7y4VABXEKRwHKCJH5tHa-qwSUStfdr0g3xA0Pf8Amg>
 <xmx:q8KYXoUQaOKlKPx7DSWdgCg1S7PxIIVeq57tnEKvgVLvyBULlyN8Hg>
 <xmx:q8KYXh2QwYSjktIzpsWsW81b2POurD09kwRXvo6oJUegdoIJknAIuw>
 <xmx:rMKYXuDtjVcY5X8pFjN1BkB-qWaWtpd0NQ-F-BfokKcNXLPJmMMq9g>
Received: from localhost (mobile-107-107-186-150.mycingular.net
 [107.107.186.150])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7F9643060060;
 Thu, 16 Apr 2020 16:40:11 -0400 (EDT)
Date: Thu, 16 Apr 2020 15:40:10 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Gunnar Mills <gmills@linux.vnet.ibm.com>
Subject: Re: Why does OpenBMC use Avahi mDNS instead of SSDP?
Message-ID: <20200416204010.GD443018@heinlein.lan.stwcx.xyz>
References: <64ed3841-fc25-50d2-5353-d778301ce06d@linux.ibm.com>
 <20200407154653.GB5368@heinlein.lan.stwcx.xyz>
 <d3801437-bde4-ffe9-9f3e-1604ad174625@linux.ibm.com>
 <e292cc98-cdd8-2eff-3fd0-ba42762b2720@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="eheScQNz3K90DVRs"
Content-Disposition: inline
In-Reply-To: <e292cc98-cdd8-2eff-3fd0-ba42762b2720@linux.vnet.ibm.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>, ratagupt <ratagupt@linux.vnet.ibm.com>,
 Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--eheScQNz3K90DVRs
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2020 at 03:02:46PM -0500, Gunnar Mills wrote:
> On 4/8/2020 3:27 PM, Joseph Reynolds wrote:
> > On 4/7/20 10:46 AM, Patrick Williams wrote:
> >> On Tue, Apr 07, 2020 at 09:58:15AM -0500, Joseph Reynolds wrote:

> >> mDNS is used more in the UNIX world, SSDP is used more in Windows.
> >>
> Was on the Redfish call earlier and this forum thread was discussed. The=
=20
> Redfish members on the call did not totally agree with this statement.=20
> They believe SSDP has a wider adaption than just Windows. A wider=20
> adaption than mDNS.=A0 Since SSDP is already in the Redfish specification=
=20
> and has been adapted by Redfish implementations, adding a 2nd discovery=
=20
> service would damage interoperability in Redfish.

I'm not really interested in a debate on this point, but I'm not finding
much evidence to back it up.  Can anyone point to well-used OSS
implementation of SSDP?  The only thing I can find is gssdp, which seems
to require a lot of Gnome components; not something we could easily pull
in on the BMC.

> The members on the call really wanted to encourage OpenBMC to implement=
=20
> SSDP instead.

It probably isn't a bad thing to be able to support SSDP, don't get me
wrong, but "instead"?  Why would we want to take away service=20
advertisement functionality, unless someone wants to explicitly disable it?

I can understand if they don't want to document, in the standard, a way to
advertise the Redfish service over mDNS, but isn't that a different
problem from what we're asking for?  Aren't we asking for a method to
manage the enablement of services on the BMC, specifically our mDNS
service?  So, if we still have mDNS, don't we need a way to configure it
through Redfish?

--=20

Patrick Williams

--eheScQNz3K90DVRs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl6YwqgACgkQqwNHzC0A
wRkL3w/9FIOLdflc0zYNxJ6JYTRqI+BAlRR/GbkXnvMS9fUjyDSbDpDGvBtV9UUj
vCodd6ksMmkmCk7ZZe5wbRClfKBZWebfbDnF/mhgRcdtlY54O+2lh7Iury6Tfj0P
VxD5ecOYbVth6nJgbHeRsd6KZlNlAzDR+NMkwqPN6nOPDrBrKecPIAdYvRr79lgX
dNRE6osENGl6oFVl3gwqoI0V65U0OzA0/v0X91/8zUeMYeD/BB2vuhQuZSwCStLA
qEE7aQtcMd5ozaakzP79l2oB9LoNY4gZk3JTLcu5DMGJT15qTS1yLTo3ehvf2Zez
wQcwKzhbMllaWqwFK3RH9HUAnptYc3XOLluv8DAtwnJqdMWc1oVoOzYdG1ivfsJt
hnNDOfbNosOrw8/p22QbnLvbCC+7xCpUuxu+PRcAQ3h7IZ086wmijj9E3ewsSrSk
s+lKwLDrW50RQnlexVt9MuG8uxy3TXJsp01WwFT6JLpfg/T3/DZnKaUb+ch0mErL
FU7nesZgQBiZEpogM48lF4DAtMbpfBAqx1Mc9xcC0sqijSqpPyQm1VC6Xed0ckY9
3RouJBXX6h/l1njP61ih0ZZw8Q6AuLo7gIYbgTmSY4GyohhL5VuxExrszFzmC/0E
n5tUQC4BhDGzQQaaelLhiGQLYPVzK6NGwkcgf8dQjJB0uI1Qa7c=
=YJf1
-----END PGP SIGNATURE-----

--eheScQNz3K90DVRs--
