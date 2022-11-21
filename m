Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6AA63327A
	for <lists+openbmc@lfdr.de>; Tue, 22 Nov 2022 02:57:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGS7X5Y2qz2xml
	for <lists+openbmc@lfdr.de>; Tue, 22 Nov 2022 12:57:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kwxmiYCK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=jejb@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kwxmiYCK;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NG8wH0mJkz3c71
	for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2022 01:31:42 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ALDvTF4027233;
	Mon, 21 Nov 2022 14:31:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version; s=pp1; bh=qomsqQfKKZ/lGa19nuqHQoD/AST0nPvF9KeW6fhid/A=;
 b=kwxmiYCKoQMMChzOzwlIPfOu2VOPhFmtB/+O/FMMgTzOOmSC1cAua1wyWuGBbKteICC0
 3SS7eXDPqVSmySXtiDwPZZBajmU2SwKibc7aorkKGoy/wYP+tkSvDYattsxLFW354rwR
 kXIC5uJ5JpT+/tzVNzWAV4UEDEu21fhsdwyxoo4c0zBjYBjFbjTdfDO9n03DjXz4vY74
 zEPyxGhW/2Lb/cbaXkU5WU2psPiRSejEvbir2YEuYHemimpqlDk4f/46XSj1FY1Uy6AY
 CaevjrEF5UQCWhQpAVN2Rsp8tbtW2SF147wahEJQqY4TRp5iHSCiNqM4/DeP51Erh+Vh xA== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ky91kjqjg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Nov 2022 14:31:37 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2ALEKxiT002423;
	Mon, 21 Nov 2022 14:31:36 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([9.208.130.102])
	by ppma04wdc.us.ibm.com with ESMTP id 3kxps95vmj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Nov 2022 14:31:36 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2ALEVZ2f24314220
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Nov 2022 14:31:35 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7025C7805E;
	Mon, 21 Nov 2022 15:33:50 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9E53D7805C;
	Mon, 21 Nov 2022 15:33:49 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.163.75.249])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
	Mon, 21 Nov 2022 15:33:49 +0000 (GMT)
Message-ID: <389cde168ce81c86dc256fe2a8ad87d64780cdd7.camel@linux.ibm.com>
Subject: Re: Security Working Group meeting - Wednesday October 12
From: James Bottomley <jejb@linux.ibm.com>
To: Patrick Williams <patrick@stwcx.xyz>
Date: Mon, 21 Nov 2022 09:31:31 -0500
In-Reply-To: <Y3t60rxQ/ctsd184@heinlein.taila677.ts.net>
References: <74f2b64b-9f53-d5a4-b616-510bd75664d5@linux.ibm.com>
	 <ed082ceea79c3b3ce2d814195f1c90a79ae166b3.camel@linux.ibm.com>
	 <Y3t60rxQ/ctsd184@heinlein.taila677.ts.net>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-3lQS/oecTz1Bbhshq8WL"
User-Agent: Evolution 3.42.4 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XYTcp2F7jFUtIOkd1eig5AphCakvTByo
X-Proofpoint-GUID: XYTcp2F7jFUtIOkd1eig5AphCakvTByo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-21_13,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1011 adultscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211210112
X-Mailman-Approved-At: Tue, 22 Nov 2022 12:55:05 +1100
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
Reply-To: jejb@linux.ibm.com
Cc: openbmc@lists.ozlabs.org, jrey@linux.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--=-3lQS/oecTz1Bbhshq8WL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2022-11-21 at 07:19 -0600, Patrick Williams wrote:
> On Fri, Nov 18, 2022 at 08:00:25AM -0500, James Bottomley wrote:
>=20
> > I thought I should note here that I can't join this meeting because
> > I
> > can't get a discord account.=C2=A0 I'm not sure it's a huge loss becaus=
e
> > I'm
> > only advising on the TPM pieces of the current IBM Research OpenBMC
> > effort, but I mention it just in case this problem is excluding
> > anyone
> > else from the meetings and because it is a discriminatory decision
> > of a
> > proprietary platform which is impeding collaboration.
> >=20
> > When I try to sign up for a discord account it insists on a phone
> > number verification (OK, annoying, but lots of other proprietary
> > silos
> > do this as well, so not unusual).=C2=A0 My problem is it won't accept
> > any of
> > the phone numbers I possess because they're all VOIP ones (I
> > switched
> > to using VOIP for my phones [both mobile and land line] decades ago
> > because I've got family in several countries around the world and
> > have
> > moved around as well so keeping all my numbers and in-country local
> > ones for family was a trick only VOIP could do in the early days).=20
> > There appears to be no basis for discord's discrimination against
> > VOIP
> > other than the company running the silo also provides VOIP services
> > and
> > presumably doesn't like the competition.=C2=A0 Now I could go out and
> > buy a
> > non-VOIP SIM chip for my mobile just for this, but these are hoops
> > I
> > shouldn't have to be forced to jump through to participate in an
> > open
> > source project.
>=20
> Hello James,
>=20
> It is unfortunate you are having issues.=C2=A0 It isn't our intention to
> block anyone and this is the first time I've heard this complaint
> (regarding phone number activation).=C2=A0 There is a setting our Discord
> servers that can be used to block people who do not have phone
> activation, but I do not have that enabled.=C2=A0 The anti-spam setting I
> have enabled is:
> =C2=A0=C2=A0 - "Medium" :
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Require verified email address.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Must be registered for 5 minutes.

Right, but if I follow the instructions below, I'm not registering with
your servers, I'm redirected to the main discord.com site.

> The only one that requires a verified phone number is "Highest".
>=20
> To test out what you are describing I did the following:
>=20
> =C2=A0=C2=A0 - Navigated to our invite link under Incognito (to avoid Dis=
cord
> =C2=A0=C2=A0=C2=A0=C2=A0 seeing my normal login):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 https://discord.openbmc.=
org=C2=A0(or)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 https://discord.gg/69Km4=
7zH98
>=20
> =C2=A0=C2=A0 - Clicked "Register".=C2=A0 Filled out "myemail+burner@gmail=
.com", a
> =C2=A0=C2=A0=C2=A0=C2=A0 username, password, and an arbitrary date of bir=
th that is more
> =C2=A0=C2=A0=C2=A0=C2=A0 than 18 years old.
>=20
> =C2=A0=C2=A0 - Dealt with the captchas.

Actually, no, this doesn't work either.  It brings me to the same
account creation screen on discord.com and then demands phone number
verification again.

> At this point I could see the OpenBMC server but not post anything.
> There was a message that I needed to verify my email.=C2=A0 I went to
> gmail and opened the email link in the same incognito session and
> then refreshed the Discord tab.=C2=A0 Then it gave a message that I neede=
d
> to wait 5 minutes after registering and proceeded with a count down.=C2=
=A0
> After 5 minutes I was able to both post and join the meeting
> channels.
>=20
> Please give this a try and feel free to reach out directly if you are
> still running into issues.

I've no idea why this doesn't work for me.  I suppose it could be
source IP address (I am on comcast cable and discord.com seems to be
IPv4 only).

Regards,

James


--=-3lQS/oecTz1Bbhshq8WL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABMIAB0WIQTnYEDbdso9F2cI+arnQslM7pishQUCY3uLwwAKCRDnQslM7pis
hW7QAQDUS8OyalCOL5J5zHon7Nz5i05QGhiNyfLl4SqsjXjNyAD/dYBY98ZDub1i
zrMVDfrKNdJ57w0JauvArr0d0ZSoA8g=
=FbKD
-----END PGP SIGNATURE-----

--=-3lQS/oecTz1Bbhshq8WL--

