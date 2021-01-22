Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F609300615
	for <lists+openbmc@lfdr.de>; Fri, 22 Jan 2021 15:53:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DMj1P6J9kzDrqX
	for <lists+openbmc@lfdr.de>; Sat, 23 Jan 2021 01:53:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=qPSMjl5/; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=XKfcRI1f; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DMj0P3p80zDrng
 for <openbmc@lists.ozlabs.org>; Sat, 23 Jan 2021 01:52:20 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8FBD55C010F;
 Fri, 22 Jan 2021 09:52:16 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 22 Jan 2021 09:52:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=hG0rbNGmIGfMrzahlnEubq6GzjH
 VccmxDM7psmZRiIA=; b=qPSMjl5//7rcYS5mLbCxBinp7/LPY1nFCqW6Fx3Msr8
 5mvfRnDiKpt1IgGi4fjV2WD3zYhkrRmefmBvGsjY4Di0gDEUrnkLs3MrClJJ8nRS
 54f2aIs6JWY9ppzbR0mOOtOLvtQAFTut/zfo7lFeHDxeeZOIoNq2BWxdRdRIIGgW
 wUM5Rqh907pbrwjL8unXpXRHHRrQ1uNflo/QViT5sIVCS92nixvkbSDk/CF6qkVA
 C6kHaOaKZvymZMdOh6qGDy0O6tKe2HS2Ri26V0qUs0A5RS7jwcIoziAlUbmcjL5E
 2v0g33rOj6cuA7tTj7lW7zfqA/iVe0dDXMrqiu6uAdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=hG0rbN
 GmIGfMrzahlnEubq6GzjHVccmxDM7psmZRiIA=; b=XKfcRI1fU+im/AjI4y0ACl
 /3BWX69UObfacpvFJL7TrD8mxW4jag62zVNn3kACUh9ET4LCMEyAbAAwoC6d/Vft
 8cFDV1fHokMYikaBTPR2eYhgKZq2u9yCR48HY4ruaaYup0w1XN+MzY0oJkZugpkF
 Qp7fpaFzdeVeTsk1cSpJAUBvrRG1irsZ63IrI5qjL0VsqJMg8ir6fh5YF/Tx7HWB
 F0R/iwSf32H/ZePDq/hXI+etIfdhkUurhPLHtu6gsMu+j+zuYTIVYQZm+6NTQ1CA
 5MeVzkMAYe2GINb7gj8G1P6wGPZ3Q7tqQbKXOPKnzleiJmaDRn6OM+kN3O73K+/w
 ==
X-ME-Sender: <xms:oOYKYOBEZ7vhWJ_fDnMdDl8x2-vIDYU2eTNcpsR7ScARUtPXX6pdJA>
 <xme:oOYKYIivT5mfUMIJ0JRVdxBNjL9LYMVQPXIh5d8Den9suy2TC1l-fl5JrgYSrOsau
 z_bvYVeTCHzNTKJ0Ag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeigdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfduhfeg
 fefgtdehhfektdelffevkefgueffhedtieenucfkphepjeeirddvhedtrdekgedrvdefie
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprght
 rhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:oOYKYBlFYpeV2v9L8g2YO-hMhzst9smMm9-b9L8d5U2hmy9UEQ00Tw>
 <xmx:oOYKYMxN22RHGvYxL9G53FFF5lPerBj0fRqIwdlcG4jd-uSEX6kIsQ>
 <xmx:oOYKYDQsmdWM8SNn7feW9rRDFMnlNFKzrO6NX-EprwTWTrb64NA2Ow>
 <xmx:oOYKYGNLt4dWOcy7Eaa7soseed4BZUR-VgWxDnWkQ4pInt_D4EXHlQ>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id E06DF24005B;
 Fri, 22 Jan 2021 09:52:15 -0500 (EST)
Date: Fri, 22 Jan 2021 08:52:14 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
Subject: Re: Progress Codes in BMC
Message-ID: <YArmnhlS33TpVo63@heinlein>
References: <4795347F-477D-45EF-A145-0C7B163FE01B@getmailspring.com>
 <CAM=TmwXEmFc95mBEg4G8bUNoBq7qDL9i_vv=YtomRDrVPDYBEw@mail.gmail.com>
 <7821f27b-31d5-a9d9-a6e6-d709e5456af5@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FNdRpVGgxWld77IN"
Content-Disposition: inline
In-Reply-To: <7821f27b-31d5-a9d9-a6e6-d709e5456af5@amd.com>
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


--FNdRpVGgxWld77IN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 22, 2021 at 08:18:29AM -0600, Supreeth Venkatesh wrote:
> On 1/22/21 6:32 AM, Deepak Kodihalli wrote:
> > On Fri, Jan 22, 2021 at 5:25 PM manoj kiran <manojkiran.eda@gmail.com> =
wrote:
> > Maybe some of the apps I pointed above can be extended for this
> > purpose, but I'm yet to take a closer look.
> One of the deviations on AMD platforms is that POST code is usually 32 bi=
t code.
> I did extend phosphor-host-postd to read 32 bit codes and added experimen=
tal associated driver in Linux, as LPC ports supported is only two.
> However, it is far from production quality code at this point. We can def=
initely collaborate on this to arrive at a generic solution.

I was also going to point to the postcode daemons as a good starting
point.  On Intel platforms, the postcodes are typically 1 byte.  The
previous postcode daemon got its data from the LPC "port 80" mechanism,
but Facebook/HCL recently extended it to support multi-host and to be
able to consume postcodes from an IPMB end-point (which is how we talk
to our per-host microcontroller).

I think it should be fairly straight-forward to add a new mechanism to
pick up data from PLDM or whatever your path is on Power.  The daemons
in question here already support keeping a history as well.  I think the
only think you'd need to do is extend it to be 32-bit or 64-bit progress
codes instead of just 8-bit, but I see no reason why that shouldn't be
acceptable.  It sounds like Supreeth might even have some code as a
starting point?

(Supreeth maybe you can throw up anything you've done to the postcode
daemons into Gerrit as a starting point?)

--=20
Patrick Williams

--FNdRpVGgxWld77IN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmAK5pwACgkQqwNHzC0A
wRkqYg/7B9jmk0RpHQZmJEO5nK9mZVBP3X881nKChdeopU7SXx8UjCTNrcDnVxLn
qPS9EJCOh6vkZO/aPFgzKrvcdQGuDH0lEwrWufDtwFaukOeuFnk7gsnbMjICS0AC
yMUwF79awyTY/WUt+s51XSyMuj23AxHrTHQ6cgEn+W4TJjvjUsYXEgzOmiYmfu0U
1SsNY6hmDVWrQhm9FDfw48kculUL9bUEGfgL/CmnRfH0z+W1cVpvRBh6tK1EmpdZ
0u/CNTNJRU3TCxSm4NkCgCK7739XVtGHrhAmtUSMvAq1jTIzQ9i+9YnAdi2iBAMb
GwamBO8r9ZT5BzZyaG9r80zMtiyu6de2zyJggAwvRxFmv3foqbr6AwootmBOIUIr
90DkXBkyM0nn463zHaiosfUAThoX1TV+ikoDVzBSQ24X306gWp+y5i+VYUSyW126
NDI/9enVkFQVkyuGeICR7kQzX5nySp0J9A85geFVMjYIqMY9yenVVCU8iIMScLeU
aKr9GEn3WnfMcZTn214hvXmFtL0pXUi3FZc8RdlBAdiij2LspAEY4a5pfrwTaar0
W+4AOyzjJqyQdPjjKFQhBW2CBkrEps1a3DtSTKQp2j/R+baLUQDEKVRE7urfLWjW
Au246u3AgQQ2BA9svOZSIXSTwGZwKzV55LeQ01+AZWT4VoWzU6Q=
=LHbl
-----END PGP SIGNATURE-----

--FNdRpVGgxWld77IN--
