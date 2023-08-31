Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5234C78F053
	for <lists+openbmc@lfdr.de>; Thu, 31 Aug 2023 17:29:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=qfBWT03S;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=wgMgOaQu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rc4pR0xtKz3bvW
	for <lists+openbmc@lfdr.de>; Fri,  1 Sep 2023 01:29:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=qfBWT03S;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=wgMgOaQu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rc4nk6dgCz2yVh
	for <openbmc@lists.ozlabs.org>; Fri,  1 Sep 2023 01:28:57 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 206445C0114;
	Thu, 31 Aug 2023 11:28:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 31 Aug 2023 11:28:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1693495733; x=1693582133; bh=2F
	kd1auKBXTLwkhyx1isKp+/84EtO6doQrrkGxbD+sc=; b=qfBWT03SKYp5tOoDkS
	XgKbXKeftbrSXhdwnYy3VQhzgASVMYvNFU6ciJxvQbAmLj6Mkb3a+m0LFCjIWtc3
	pdVd4EJ9NgXde2zHly7wv/kX8HKK2eexP41MeC0yYWcRlqwC5rXVVFAIyNzQAa3G
	z/05McCS6F5xWsbJ7wGAOJpCKDYL/M3ZQL4S2M+kEKeAQcmGyoEU6sYix1kPQbtr
	/vmjsShgmn2eCT0Z7BoSrILJAROwUDk4n6+dJRWj4v1/nBSuwml7tqv1yyoEEd+W
	ek/VhRo46RAGjc/Sw1e/tQeTEnZyVD9/Y/W5WfWHScNrJAtni63JukbFXc8aHsml
	PP1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1693495733; x=1693582133; bh=2Fkd1auKBXTLw
	khyx1isKp+/84EtO6doQrrkGxbD+sc=; b=wgMgOaQuH89S7wR6+7buH6PfzcMmN
	zMAvrqrLuq1LnqtU4Fnmz3p5vLM2LBLVPE3lkwphKw6l918uIjTJVVjo5Uo7kJoV
	reHSeHg8JXIITustIXJIW5Zi9GxENkmGQ2kVzHu5AOUL3o6/aBP1TAmtcfec+mmY
	nwVQy8y4fMDxq+InDHuTSr3kv0iDjg3VExCjO6oDqiPeRZtXyUbWMVShTcYiBqsA
	hmcB99WUON5EsQFZwS9ST6ZIOA9Nnp55DFLezoNxmA39ix9OaMFA1DT3yJkzvLC7
	SkkRgj9k5pmkXEPUX38IMDRFcCnVccu7G1JpM0gt78B/ISxYEgyfe+OHw==
X-ME-Sender: <xms:tLHwZFKxAJHvcDj5URSNQLKcg66JhETgvE7N5sa_aBkhS0aSPzg43A>
    <xme:tLHwZBJIKTjo3krDvxz7km-CDOqXaSVbg2V_NZ0MtD8bWs0Vw1dbdn5pkOn8QPzV9
    GXnvYEyyJoc6zt_mUA>
X-ME-Received: <xmr:tLHwZNszTAQRy_Gg0dQK8OHBi2OhX9SJdTFGNPjIpdUC8yuQY-Bm7M_dYxJe7VoDPbq1bdFvpclTNOdIDi5ZY4FoaZNwlv7VVeU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudegtddgkeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdludejmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtdorredt
    tdejnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpedugffhkefghfefvdegueehhfdu
    teekfedtvdfhvdekteffkeejheegjeetvdejudenucffohhmrghinheptghpphhrvghfvg
    hrvghntggvrdgtohhmpdhophgvnhgsmhgtrdhorhhgpdhprhhoohhfphhoihhnthdrtgho
    mhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprg
    htrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:tLHwZGZC0EcB5OPKPzvu0oP0Gw0B3Ate4JqBsjqd0wUNhTnO-79dgg>
    <xmx:tLHwZMatn5XycGjwc-KegOfsZhuEZMibvxl54I4BI49t0D_4in1BGA>
    <xmx:tLHwZKB9i5Jf1r5b08H8KHFC1-TSmZW_DIWsgwmtAF0EdiYdGwLhmg>
    <xmx:tbHwZLlt7EqKMx7ds8VDUNovJb4AYF4ophheh5w0BM-PMZu3sKUopw>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 31 Aug 2023 11:28:52 -0400 (EDT)
Date: Thu, 31 Aug 2023 10:28:50 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: chandu chanti <chandutmba@gmail.com>
Subject: Re: Error handling
Message-ID: <ZPCxsnrNsNDFazBl@heinlein.vulture-banana.ts.net>
References: <CAPY-kLVD7ONa6fkSrQ5sfAxK4UcGZSyHoMr6sb6oQPTafMT_fw@mail.gmail.com>
 <dd842255-9ab0-6fc7-7423-c9420f97dc3c@linux.ibm.com>
 <CABYu0Wg29+CefRbJg0ep+H6tcO9YZ9OY8Z8vdSUCZuwXgaEEew@mail.gmail.com>
 <CAPY-kLUTFpsjD4=HxoYfE=fedJHeKKOLafp_7_BkJy0wEAFZEg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RoDuHwwJ0lz4cUM6"
Content-Disposition: inline
In-Reply-To: <CAPY-kLUTFpsjD4=HxoYfE=fedJHeKKOLafp_7_BkJy0wEAFZEg@mail.gmail.com>
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


--RoDuHwwJ0lz4cUM6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 31, 2023 at 05:16:50PM +0530, chandu chanti wrote:
> Hi team,
>=20
> We have drafted a proposal for  "Using default values in D-Bus properties
> to indicate errors"  as communicated in previous mail.
>=20
> Issue with Existing Implementation:
> Error handling is not implemented in the existing bmcweb source. The valu=
es
> fetched from D-Bus are used directly in the Redfish response, except for
> some properties. There was no way to represent error for a given data type
> on Redfish.
>=20
> New Implementation Proposal:
> We plan to handle errors from backend D-Bus services in bmcweb using a
> custom data type class. We will implement a helper class to create a new
> data type called mydatatype_t. An object of this class will be created wi=
th
> the D-Bus property value as input. This object will be assigned to the JS=
ON
> response using the assignment operator. This assignment operation will
> invoke the to_json function with the mydatatype_t object, where D-Bus
> values will be validated based on their data types.

I don't understand the proposal.  Is this something contained to bmcweb,
or does it affect other repos?  sdbusplus also, or just the backend
applications?  I am unable to translate what you've written to dbus property
and/or method behaviors.

>=20
> Data Types and Default Values:
> The following values will be set on the D-Bus property in case of an erro=
r,
> based on the data type. In Redfish, we will validate these properties. If
> the D-Bus property value matches the error value, we will update the
> property value as null in the Redfish JSON response; otherwise, the
> corresponding value on D-Bus will be used.
>=20

Is the below intended to be a table?  I can't figure out what this long
list of types and values is suppose to be.

> *D-Bus*
>=20
> *data type*
>=20
> *Value of the D-Bus Property incase of Error *
>=20
> *Property value as seen on Redfish *
>=20
> INT16
>=20
> INT_MAX
>=20
> null
>=20
> UINT16
>=20
> UINT_MAX
>=20
> null
>=20
> INT32
>=20
> LONG_MAX
>=20
> null
>=20
> UINT32
>=20
> ULONG_MAX
>=20
> null
>=20
> INT64
>=20
> LLONG_MAX
>=20
> null
>=20
> UINT64
>=20
> ULLONG_MAX
>=20
> null
>=20
> DOUBLE
>=20
> std::numeric_limits <http://en.cppreference.com/w/cpp/types/numeric_limit=
s>
> <T>::quiet_NaN()
>=20
> null
>=20
> STRING
>=20
> BE_ERROR-XXX
>=20
> null
>=20
> BOOL
>=20
> uint8_t
> {0=E2=80=93false , 1=E2=80=93true,
>   others- error}
>=20
> null
>=20
> In case of error conditions Redfish will report "null" for a property
> irrespective  of the data type.
>=20
> For error validation, we will implement a custom class, which will
> facilitate error validation for D-Bus values. In instances of errors, a
> null value will be allocated to the JSON response. Example for the uint16=
_t
> data type.
>=20
> [image: image.png]
>=20
> [image: image.png]
>=20
> For more implementation details please refer the following gerrit link, we
> implemented it for redfish URI /redfish/v1/Systems/<str>/Memory/<str>/.
> https://gerrit.openbmc.org/c/openbmc/bmcweb/+/66368
>=20
> Your feedback and insights are greatly appreciated.
>=20
> Thanks,
> Chandrasekhar T.
>=20
> On Fri, Aug 4, 2023 at 12:37=E2=80=AFPM Shakeeb Pasha <shakeebbk@gmail.co=
m> wrote:
>=20
> > Thanks Joseph for the response.
> > >> I didn't see anyone else answer this.  Is your question about how to
> > >> architect or design your D-Bus interfaces?  Is the reference the BMC=
Web
> > >> merely to provide context as a consumer of these D-Bus services?  I
> > >> assume so.
> > Question is two pronged, one we wanted to know the best way to
> > propagate error from dbus to bmcweb.
> > Options we tried:
> > 1. Have handlers of each property throw an exception if there was an
> > error. But this did not work well with current bmcweb implementation(get
> > all method call), as it would lead to the entire resource not getting
> > populated even if we have one property failing.
> > 2. Implement one additional associated rc property - and do the error
> > handling bmcweb by looking at that, but this doubled up the number of
> > properties on dbus.
> > 3. Use "default values" per property data type, but this would fail for
> > extreme cases like if the property is u32, and if the default value used
> > was INT_MAX, then it breaks when the property could take value 0xFFFFFF=
FF
> > as valid value.
> > So the query here was to check if any preference from above options or
> > hear any new approaches as well.
> >
> > The second query was about how to represent this error(per property err=
or)
> > on redfish, our proposal for now is to return "NULL" for any property t=
hat
> > might be failing at the backend. Any thoughts on this approach?
> >
> > >> I don't have any special insights.  Are you looking to follow a desi=
gn
> > >> pattern?  Are you looking for direction from the BMCWeb maintainers?
> >
> > Yes, we are working on a design pattern proposal and will publish it he=
re
> > for review.
> > It would be great if we could get some directions/inputs from the
> > maintainers as well.
> >
> > Thanks,
> > Shakeeb
> >
> > On Thu, Aug 3, 2023 at 10:33=E2=80=AFPM Joseph Reynolds <jrey@linux.ibm=
=2Ecom>
> > wrote:
> >
> >> On 7/20/23 2:04 AM, chandu chanti wrote:
> >> > Hi Team, We are planning to handle errors from backend services in b=
mc
> >> > web. We are considering the following approaches to implement it, but
> >> > we are facing some issues. please provide your inputs. 1 . Using
> >> > exceptions in our backend D-Bus service
> >> > ZjQcmQRYFpfptBannerStart
> >> > This Message Is From an Untrusted Sender
> >> > You have not previously corresponded with this sender.
> >> > Report Suspicious
> >> > <
> >> https://us-phishalarm-ewt.proofpoint.com/EWT/v1/PjiDSg!12-vrJJyaRL1Nus=
7N26ProiLa90y_FB6oawxkmvrT4YcN373bBkdTP-XPRTFLRBygswzt1TwX0wxp5Tel83pR4ZZR-=
wpxEYJpcKudcTfq2FH6iPLN9Ep4cV_tX4$>
> >>
> >> >
> >> > ZjQcmQRYFpfptBannerEnd
> >> >
> >> > Hi Team,
> >> >
> >> > We are planning to handle errors from backend services in bmc web. We
> >> > are considering the following approaches to implement it, but we are
> >> > facing some issues. please provide your inputs.
> >> >
> >>
> >> I didn't see anyone else answer this.  Is your question about how to
> >> architect or design your D-Bus interfaces?  Is the reference the BMCWeb
> >> merely to provide context as a consumer of these D-Bus services?  I
> >> assume so.
> >>
> >> I don't have any special insights.  Are you looking to follow a design
> >> pattern?  Are you looking for direction from the BMCWeb maintainers?
> >>
> >> Joseph
> >>
> >> > 1 . Using exceptions in our backend D-Bus service by throwing
> >> > exceptions in the D-Bus property get handlers. It works fine for the
> >> > Get property method call. However, when using the Get All method cal=
l,
> >> > if one property fails, an error is returned without checking the oth=
er
> >> > properties. Is there a way to implement exceptions in GetAll so that
> >> > even if one property fails, we can still fetch the remaining propert=
ies.
> >> >
> >> > 2. Using default values in D-Bus properties to indicate errors. Is
> >> > there a reference implementation available for setting default values
> >> > for string and integer data types in bmc web, similar to the
> >> > implementation of NaN (default value) for the double data type in
> >> > cable.hpp.
> >> >
> >> > 3. Implement associated return code per property on dbus, but this
> >> > would be very inefficient in terms of double the properties on dbus,
> >> > something we would like to avoid
> >> >
> >> > Thanks
> >> > Chandrasekhar T.
> >> >
> >>
> >>




--=20
Patrick Williams

--RoDuHwwJ0lz4cUM6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmTwsbAACgkQqwNHzC0A
wRnyTw//T83QPB9vrHoPk8LSHrSjZ+7FIGeSvpaIJjREU+eezuy0JGYAN+lyZsAH
Wikp6jLRN2lYiVRc6KJur1fAvQ/ZAkuZDCf3HuvCPcvmbX4n4mKz5I93r0vN5cvP
t+zZRpgtITNpcZOsMwSiSuB6ytt3E2nd7mNfeyZzMFJl/ZlGXYpYSFcNGCiE3L9n
KEedL5RoVHuYWpFKFpXj7ACEi13PsZJSLCSlOOaJBrK9BM4F7Nl8aCiNSen0TpC7
rqAXIdwaUcJKbShE92QsqWdh4nv8XYEr3zbn0h+I9pGHAoGkqSePB+XauQ1sXu0+
xLowT4kf+oR/SGqnKXOcXSvIruh7sAf53TQ/oZN4TzbvwSc/6DWRHqyaTw67KQNQ
Xdgt7WaYcSDbCLLDNeM4ZbwQzN/emmQT0I8lRIFh5SDqr1md9KHj6E8edipv5OJU
qhLtA3frLJmjNd9VnpZXcyruw5aLKzr564e2Rt0UZdbfocOnkJsXa7n4qcg3ORit
4xS0QxiDChrI9htXL/pJxG3K6VSrrNh11/CmshSSKMRYuAYj4pbogS1Mabo0DdvC
WWV1W3cefFqFajpGZwzKanx+LHMdB0Tbrq7iqZJ5IO3xbS+KabFUVZgsZ/GBOqAT
PMLuoR1H+StLHTMu/t4xFh08dEpea6QuMKtWR+pDwlkhMjSy4GA=
=56NO
-----END PGP SIGNATURE-----

--RoDuHwwJ0lz4cUM6--
