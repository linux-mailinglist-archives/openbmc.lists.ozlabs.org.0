Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 598527904B0
	for <lists+openbmc@lfdr.de>; Sat,  2 Sep 2023 03:53:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=TR+WxDEw;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=pQFpP69/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RcybJ1CSFz3c6c
	for <lists+openbmc@lfdr.de>; Sat,  2 Sep 2023 11:53:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=TR+WxDEw;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=pQFpP69/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RcyZb2Q4pz30Q4
	for <openbmc@lists.ozlabs.org>; Sat,  2 Sep 2023 11:52:21 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id A09463200948;
	Fri,  1 Sep 2023 21:52:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 01 Sep 2023 21:52:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1693619536; x=1693705936; bh=ij
	5WVEtEgpG2fDl/JXprRKQvZb/s0M107scTeNT0L90=; b=TR+WxDEw/j0pCS9dLX
	DcmXSKU5IslYrjg3ReBoWBdbSvV23OwsYyJxVl06wlH5fgLZjCe4QHRSgfnV793W
	aIIw5E/EEhJlwbcvxvNxrV/z3oVNzgyhbkht+3cbzDIzs6QDrFOmcHr+qUHytml2
	8hp/z2P6o9mygWPSdbfP5H72rNRZbgAFS+ryne+sbfkicWUzm9fu/1TdDE8Y/bZu
	izUNj5ZVH0quP14WyJAu73OknbSPwxXYzMIb6ubh7aRTn8umKscm52EMgmyD/tTg
	l/GZsxi7KUDxbOnOs2Fxd6AEObtnZMt6gacjN1vo8Z5NG5tFOWlmYMW4llnV/nUE
	O/Tw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1693619536; x=1693705936; bh=ij5WVEtEgpG2f
	Dl/JXprRKQvZb/s0M107scTeNT0L90=; b=pQFpP69/xjRiF2Ppr4SmXoc/x3zQ2
	vZNQByMcpnYSFB1nVmMelfeOjHliG16oYtAouHVdwo1DjaDWPBhPze24xJpeD/Fp
	pbhWgH8xncoCNoRagYJajwQc5+33UBpZoo17/+TBr31EiDRMjJ/f2h/djMxKyZwY
	XHSTI8WUIZqoqXwormZjgckXW3N6ZUcESk5Rf53CsXeMcwL+X7QHi0c2ferURtNC
	qyRMVTwueg1PW3Fwd4wxeFmhS9Mb77KmF/BD3vTrzMt6K2FFbTEUd8D0j6ASZuMb
	+1r+az/bgyPEspjrh1TTA5hlejbe3OQowsJhfp149MnpXNhDOIYadOwwg==
X-ME-Sender: <xms:T5XyZBBHt3vZhhfCmkPmXsvMFC91l8_2y-o-O7pjmoGgqDkeBWEQ1A>
    <xme:T5XyZPi9lwEgdU1pdyQBfctuSoCMi_6lToQCTL1fJH9VymLzfE86l_2r7CNEP3aur
    vYhSPZr_FbhxhRytNE>
X-ME-Received: <xmr:T5XyZMkKSSrhEk9cp-TV-aN6Y52OmMu8j-Ih_h2s3mSc5E2mPL67k-XYD8AOZEs0WUeVj-O0-IbIstMmXO3_nPvVK_d3ew19sxU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudegfedgheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdludejmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tdejnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpefhfeeuleelieeufeekteffheel
    vddvvdffheevvddvudevudejteehjedugeffgfenucffohhmrghinheptghpphhrvghfvg
    hrvghntggvrdgtohhmpdhophgvnhgsmhgtrdhorhhgpdhprhhoohhfphhoihhnthdrtgho
    mhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprg
    htrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:T5XyZLyZ-SSfbVkFq9wmslU1937-r3lHfG21nTOccGtCPmtzZJ00-A>
    <xmx:T5XyZGQh-fvjhw4Iw5JvfbUx9BFo4tlKiCJsUsvPIcgsneQBXVwqMQ>
    <xmx:T5XyZOarKR4iQNssiSG_LNdLSOZwa5RGNoX75AUdIwxZEKwYTocOlQ>
    <xmx:UJXyZBd3GeMhMmZeMtInxTPUcLww_poDtR-MzPX941h_QcAYrfHg9A>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Sep 2023 21:52:15 -0400 (EDT)
Date: Fri, 1 Sep 2023 20:52:13 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: chandu chanti <chandutmba@gmail.com>
Subject: Re: Error handling
Message-ID: <ZPKVTWX9xNoFEElM@heinlein.vulture-banana.ts.net>
References: <CAPY-kLVD7ONa6fkSrQ5sfAxK4UcGZSyHoMr6sb6oQPTafMT_fw@mail.gmail.com>
 <dd842255-9ab0-6fc7-7423-c9420f97dc3c@linux.ibm.com>
 <CABYu0Wg29+CefRbJg0ep+H6tcO9YZ9OY8Z8vdSUCZuwXgaEEew@mail.gmail.com>
 <CAPY-kLUTFpsjD4=HxoYfE=fedJHeKKOLafp_7_BkJy0wEAFZEg@mail.gmail.com>
 <ZPCxsnrNsNDFazBl@heinlein.vulture-banana.ts.net>
 <CAPY-kLVAtihQXiL-2gTgSGU6BHYfRUfbCbJf-XjqmEVwwsLeUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oVZXY4Uv0I3QWbA3"
Content-Disposition: inline
In-Reply-To: <CAPY-kLVAtihQXiL-2gTgSGU6BHYfRUfbCbJf-XjqmEVwwsLeUQ@mail.gmail.com>
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
Cc: Shakeeb Pasha <shakeebbk@gmail.com>, openbmc@lists.ozlabs.org, Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--oVZXY4Uv0I3QWbA3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 01, 2023 at 07:55:28PM +0530, chandu chanti wrote:
> >I don't understand the proposal. Is this something contained within
> bmcweb, or does it affect other repositories?
> >Does it also affect sdbusplus, or is it limited to the backend
> applications?
> >I am unable to interpret your writing in terms of dbus property and/or
> method behaviors.
>=20
> yes We require changes in the backend dbus service; sdbusplus changes are
> not required.

I don't think we're going to change all the backend services to follow
this proposal.  The magic-values-that-mean-error that you have proposed
are actually values we use sometimes, also.  How would somoeone
differentiate between an error and a valid value of these values?

>=20
> Implementation details for the backend dbus service are as follows:
>=20
> All dbus properties will use the values mentioned in the table as
> representations of error values.
> For string data types, we will use the predefined value "BE_ERROR-XXX=E2=
=80=9D to
> indicate error conditions.
> For double data types, we will use "nan" to represent error conditions.
> For all integer data types, we will use the corresponding MAX values based
> on the data type.

Maybe we should step back.  Why do properties have error results?  Is
this a case of a specific [upstreamed] backend, or is this just
something you're seeing in your implementation?  Generally, accessing a
dbus-property should not result in an error.  If we have lots of dbus
properties that are regularly resulting in an error, we should fix that.

Can you give specific examples?

>=20
> >Regarding the content below, is it intended to be presented as a table?
> >I'm having trouble understanding what this extensive list of types and
> values is meant to convey.
>=20
> Yes, it's a table. There seems to be an issue with formatting. We have
> organized all data types in a table.
> Error represenation Table for different data types
> | D-Bus Data Type | Value of the D-Bus Property in case of Error | Proper=
ty
> Value as seen on Redfish |
> |-----------------|---------------------------------------------|--------=
--------------------------|
> | INT16           | INT_MAX                                     | null
>                         |
> | UINT16          | UINT_MAX                                    | null
>                         |
> | INT32           | LONG_MAX                                    | null
>                         |
> | UINT32          | ULONG_MAX                                   | null
>                         |
> | INT64           | LLONG_MAX                                   | null
>                         |
> | UINT64          | ULLONG_MAX                                  | null
>                         |
> | DOUBLE          | std::numeric_limits<T>::quiet_NaN()        | null
>                       |
> | STRING          | BE_ERROR-XXX                                | null
>                         |
> | BOOL            | uint8_t {0=E2=80=93false, 1=E2=80=93true, others- err=
or}    | null
>                         |
>=20
> On Thu, Aug 31, 2023 at 8:58=E2=80=AFPM Patrick Williams <patrick@stwcx.x=
yz> wrote:
>=20
> > On Thu, Aug 31, 2023 at 05:16:50PM +0530, chandu chanti wrote:
> > > Hi team,
> > >
> > > We have drafted a proposal for  "Using default values in D-Bus proper=
ties
> > > to indicate errors"  as communicated in previous mail.
> > >
> > > Issue with Existing Implementation:
> > > Error handling is not implemented in the existing bmcweb source. The
> > values
> > > fetched from D-Bus are used directly in the Redfish response, except =
for
> > > some properties. There was no way to represent error for a given data
> > type
> > > on Redfish.
> > >
> > > New Implementation Proposal:
> > > We plan to handle errors from backend D-Bus services in bmcweb using a
> > > custom data type class. We will implement a helper class to create a =
new
> > > data type called mydatatype_t. An object of this class will be created
> > with
> > > the D-Bus property value as input. This object will be assigned to the
> > JSON
> > > response using the assignment operator. This assignment operation will
> > > invoke the to_json function with the mydatatype_t object, where D-Bus
> > > values will be validated based on their data types.
> >
> > I don't understand the proposal.  Is this something contained to bmcweb,
> > or does it affect other repos?  sdbusplus also, or just the backend
> > applications?  I am unable to translate what you've written to dbus
> > property
> > and/or method behaviors.
> >
> > >
> > > Data Types and Default Values:
> > > The following values will be set on the D-Bus property in case of an
> > error,
> > > based on the data type. In Redfish, we will validate these properties=
=2E If
> > > the D-Bus property value matches the error value, we will update the
> > > property value as null in the Redfish JSON response; otherwise, the
> > > corresponding value on D-Bus will be used.
> > >
> >
> > Is the below intended to be a table?  I can't figure out what this long
> > list of types and values is suppose to be.
> >
> > > *D-Bus*
> > >
> > > *data type*
> > >
> > > *Value of the D-Bus Property incase of Error *
> > >
> > > *Property value as seen on Redfish *
> > >
> > > INT16
> > >
> > > INT_MAX
> > >
> > > null
> > >
> > > UINT16
> > >
> > > UINT_MAX
> > >
> > > null
> > >
> > > INT32
> > >
> > > LONG_MAX
> > >
> > > null
> > >
> > > UINT32
> > >
> > > ULONG_MAX
> > >
> > > null
> > >
> > > INT64
> > >
> > > LLONG_MAX
> > >
> > > null
> > >
> > > UINT64
> > >
> > > ULLONG_MAX
> > >
> > > null
> > >
> > > DOUBLE
> > >
> > > std::numeric_limits <
> > http://en.cppreference.com/w/cpp/types/numeric_limits>
> > > <T>::quiet_NaN()
> > >
> > > null
> > >
> > > STRING
> > >
> > > BE_ERROR-XXX
> > >
> > > null
> > >
> > > BOOL
> > >
> > > uint8_t
> > > {0=E2=80=93false , 1=E2=80=93true,
> > >   others- error}
> > >
> > > null
> > >
> > > In case of error conditions Redfish will report "null" for a property
> > > irrespective  of the data type.
> > >
> > > For error validation, we will implement a custom class, which will
> > > facilitate error validation for D-Bus values. In instances of errors,=
 a
> > > null value will be allocated to the JSON response. Example for the
> > uint16_t
> > > data type.
> > >
> > > [image: image.png]
> > >
> > > [image: image.png]
> > >
> > > For more implementation details please refer the following gerrit lin=
k,
> > we
> > > implemented it for redfish URI /redfish/v1/Systems/<str>/Memory/<str>=
/.
> > > https://gerrit.openbmc.org/c/openbmc/bmcweb/+/66368
> > >
> > > Your feedback and insights are greatly appreciated.
> > >
> > > Thanks,
> > > Chandrasekhar T.
> > >
> > > On Fri, Aug 4, 2023 at 12:37=E2=80=AFPM Shakeeb Pasha <shakeebbk@gmai=
l.com>
> > wrote:
> > >
> > > > Thanks Joseph for the response.
> > > > >> I didn't see anyone else answer this.  Is your question about ho=
w to
> > > > >> architect or design your D-Bus interfaces?  Is the reference the
> > BMCWeb
> > > > >> merely to provide context as a consumer of these D-Bus services?=
  I
> > > > >> assume so.
> > > > Question is two pronged, one we wanted to know the best way to
> > > > propagate error from dbus to bmcweb.
> > > > Options we tried:
> > > > 1. Have handlers of each property throw an exception if there was an
> > > > error. But this did not work well with current bmcweb
> > implementation(get
> > > > all method call), as it would lead to the entire resource not getti=
ng
> > > > populated even if we have one property failing.
> > > > 2. Implement one additional associated rc property - and do the err=
or
> > > > handling bmcweb by looking at that, but this doubled up the number =
of
> > > > properties on dbus.
> > > > 3. Use "default values" per property data type, but this would fail=
 for
> > > > extreme cases like if the property is u32, and if the default value
> > used
> > > > was INT_MAX, then it breaks when the property could take value
> > 0xFFFFFFFF
> > > > as valid value.
> > > > So the query here was to check if any preference from above options=
 or
> > > > hear any new approaches as well.
> > > >
> > > > The second query was about how to represent this error(per property
> > error)
> > > > on redfish, our proposal for now is to return "NULL" for any proper=
ty
> > that
> > > > might be failing at the backend. Any thoughts on this approach?
> > > >
> > > > >> I don't have any special insights.  Are you looking to follow a
> > design
> > > > >> pattern?  Are you looking for direction from the BMCWeb maintain=
ers?
> > > >
> > > > Yes, we are working on a design pattern proposal and will publish it
> > here
> > > > for review.
> > > > It would be great if we could get some directions/inputs from the
> > > > maintainers as well.
> > > >
> > > > Thanks,
> > > > Shakeeb
> > > >
> > > > On Thu, Aug 3, 2023 at 10:33=E2=80=AFPM Joseph Reynolds <jrey@linux=
=2Eibm.com>
> > > > wrote:
> > > >
> > > >> On 7/20/23 2:04 AM, chandu chanti wrote:
> > > >> > Hi Team, We are planning to handle errors from backend services =
in
> > bmc
> > > >> > web. We are considering the following approaches to implement it,
> > but
> > > >> > we are facing some issues. please provide your inputs. 1 . Using
> > > >> > exceptions in our backend D-Bus service
> > > >> > ZjQcmQRYFpfptBannerStart
> > > >> > This Message Is From an Untrusted Sender
> > > >> > You have not previously corresponded with this sender.
> > > >> > Report Suspicious
> > > >> > <
> > > >>
> > https://us-phishalarm-ewt.proofpoint.com/EWT/v1/PjiDSg!12-vrJJyaRL1Nus7=
N26ProiLa90y_FB6oawxkmvrT4YcN373bBkdTP-XPRTFLRBygswzt1TwX0wxp5Tel83pR4ZZR-w=
pxEYJpcKudcTfq2FH6iPLN9Ep4cV_tX4$
> > >
> > > >>
> > > >> >
> > > >> > ZjQcmQRYFpfptBannerEnd
> > > >> >
> > > >> > Hi Team,
> > > >> >
> > > >> > We are planning to handle errors from backend services in bmc we=
b.
> > We
> > > >> > are considering the following approaches to implement it, but we=
 are
> > > >> > facing some issues. please provide your inputs.
> > > >> >
> > > >>
> > > >> I didn't see anyone else answer this.  Is your question about how =
to
> > > >> architect or design your D-Bus interfaces?  Is the reference the
> > BMCWeb
> > > >> merely to provide context as a consumer of these D-Bus services?  I
> > > >> assume so.
> > > >>
> > > >> I don't have any special insights.  Are you looking to follow a de=
sign
> > > >> pattern?  Are you looking for direction from the BMCWeb maintainer=
s?
> > > >>
> > > >> Joseph
> > > >>
> > > >> > 1 . Using exceptions in our backend D-Bus service by throwing
> > > >> > exceptions in the D-Bus property get handlers. It works fine for=
 the
> > > >> > Get property method call. However, when using the Get All method
> > call,
> > > >> > if one property fails, an error is returned without checking the
> > other
> > > >> > properties. Is there a way to implement exceptions in GetAll so =
that
> > > >> > even if one property fails, we can still fetch the remaining
> > properties.
> > > >> >
> > > >> > 2. Using default values in D-Bus properties to indicate errors. =
Is
> > > >> > there a reference implementation available for setting default
> > values
> > > >> > for string and integer data types in bmc web, similar to the
> > > >> > implementation of NaN (default value) for the double data type in
> > > >> > cable.hpp.
> > > >> >
> > > >> > 3. Implement associated return code per property on dbus, but th=
is
> > > >> > would be very inefficient in terms of double the properties on d=
bus,
> > > >> > something we would like to avoid
> > > >> >
> > > >> > Thanks
> > > >> > Chandrasekhar T.
> > > >> >
> > > >>
> > > >>
> >
> >
> >
> >
> > --
> > Patrick Williams
> >

--=20
Patrick Williams

--oVZXY4Uv0I3QWbA3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmTylUwACgkQqwNHzC0A
wRmttw//RHbG7SQf89aJNxYs0e4CgDbHwomdkOvywaRkoJBtocwwDhTLq8G5e8tc
KUf3GfAEugZ+nid84Qd2DXSzZAcHBEsqErT8soZaQdsR3xpxvv5gYprqXVUKNoSR
ZF4IRjUZ/Erm+9+Np2Bu/RTefcNmURJYTTKPCZLS2Yna5rGsbZCb1fefBg18SoZj
UtBU2l/HHE780h3eE5CVUaV2hHan5Ts0UUsqpE4u2tu1yVzvy1PfbOqDP59b9Q/K
JhqcUa+7IT3+jRYM12N6+pSASRBIDI4iutQc0jdTaGr5HtMire6Cob9vs2AEL8dN
H9310MCFcwGAJQToEa8Ub6FGQeP54KWmL3eFeuOnulvhZYlxgFPgj/yzLNu5PeF5
4qPSrOYZQlWLNXIZGGs0ArpJ8z3xqcewXr7VFzYPxkYrlSK3ZkyCNPhpc0sRtmHE
1F/6AUdTYpaFdl79oO8I/Xy3iMuu1fX95TmIjOpEIuQCFZdRNZdhiXSwyfIxWGf6
c6ollAVrV0RJkK/VUh9Jnf2imbcwB/341YF/DeubmDXYG8mKFLqW/nKcPUE822xP
Pl7+BU8HKPrcNgQAnKu3RElNlrLrp1XllY3GSt4FlPk4BBaET9hJzS/bK2baPpmu
DGsB2crg28rn+iN7TmgOJqyrcMfdGH8j2x0KICrWaV7VMgcOXwk=
=fSa/
-----END PGP SIGNATURE-----

--oVZXY4Uv0I3QWbA3--
