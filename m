Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6144E63327E
	for <lists+openbmc@lfdr.de>; Tue, 22 Nov 2022 02:58:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGS8c201dz3cJq
	for <lists+openbmc@lfdr.de>; Tue, 22 Nov 2022 12:58:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RjCMysVY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=jejb@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RjCMysVY;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NG9sJ69vmz3cBD
	for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2022 02:14:12 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ALFCuWR016065;
	Mon, 21 Nov 2022 15:14:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version; s=pp1; bh=b6vHXgItSHN+Xu3NYcxbxGZpn2/cj9GWjba3cjOL0Qg=;
 b=RjCMysVYWcen0IFae6DlvklvzOSP7MzSaMqnFMjuPNGueuKb0Xx6C/JZl0QuFIXWrVkg
 03OSc795Q3N3DRKwJsZO8RXYSNwwu5NyyoSG0EMlnGZmKz94NsusK4VdiJJ/sfbz9WFg
 FJdyD1kyRVUknF/t/lgxVOxXhYLcjR/BOqfRVoVTKGxqJZ3D7HSz4mE2wbENfQXJOH3O
 1UlJ/i9VjtZ6ytrpbb2NhBXof43tJIdlvL8Ohk7A/DkHD72IcgoVCUiH39rsksMIVdeu
 TQGFZsrA0yDDMpwyHyVdb1L0PdBAmLb3NpifqB8qV69c1UVrKE/0nGyCPcDPGnLFfcfp pg== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ky8xtcy9y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Nov 2022 15:14:09 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2ALF4tKi003308;
	Mon, 21 Nov 2022 15:14:08 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([9.208.129.120])
	by ppma01dal.us.ibm.com with ESMTP id 3kxps9sh9r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Nov 2022 15:14:08 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2ALFE6Xb33554850
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Nov 2022 15:14:06 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 98CEF7805E;
	Mon, 21 Nov 2022 16:16:22 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F04C87805C;
	Mon, 21 Nov 2022 16:16:21 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.163.75.249])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
	Mon, 21 Nov 2022 16:16:21 +0000 (GMT)
Message-ID: <28bb9b375161541d22a627ea8de639521297bdd5.camel@linux.ibm.com>
Subject: Re: Security Working Group meeting - Wednesday October 12
From: James Bottomley <jejb@linux.ibm.com>
To: Patrick Williams <patrick@stwcx.xyz>
Date: Mon, 21 Nov 2022 10:14:02 -0500
In-Reply-To: <Y3uSSqWTZRNrPEs5@heinlein.taila677.ts.net>
References: <74f2b64b-9f53-d5a4-b616-510bd75664d5@linux.ibm.com>
	 <ed082ceea79c3b3ce2d814195f1c90a79ae166b3.camel@linux.ibm.com>
	 <Y3t60rxQ/ctsd184@heinlein.taila677.ts.net>
	 <389cde168ce81c86dc256fe2a8ad87d64780cdd7.camel@linux.ibm.com>
	 <Y3uSSqWTZRNrPEs5@heinlein.taila677.ts.net>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-D+Hy2WbHDY5r51DvJcqd"
User-Agent: Evolution 3.42.4 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xv4tquV90VaG0M1jRt_SgGLPlltd2WL3
X-Proofpoint-ORIG-GUID: xv4tquV90VaG0M1jRt_SgGLPlltd2WL3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-21_13,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211210117
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


--=-D+Hy2WbHDY5r51DvJcqd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2022-11-21 at 08:59 -0600, Patrick Williams wrote:
> On Mon, Nov 21, 2022 at 09:31:31AM -0500, James Bottomley wrote:
> > On Mon, 2022-11-21 at 07:19 -0600, Patrick Williams wrote:
[...]
> > > The only one that requires a verified phone number is "Highest".
> > >=20
> > > To test out what you are describing I did the following:
> > >=20
> > > =C2=A0=C2=A0 - Navigated to our invite link under Incognito (to avoid
> > > Discord
> > > =C2=A0=C2=A0=C2=A0=C2=A0 seeing my normal login):
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 https://discord.open=
bmc.org=C2=A0(or)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 https://discord.gg/6=
9Km47zH98
> > >=20
> > > =C2=A0=C2=A0 - Clicked "Register".=C2=A0 Filled out "myemail+burner@g=
mail.com",
> > > a
> > > =C2=A0=C2=A0=C2=A0=C2=A0 username, password, and an arbitrary date of=
 birth that is
> > > more
> > > =C2=A0=C2=A0=C2=A0=C2=A0 than 18 years old.
> > >=20
> > > =C2=A0=C2=A0 - Dealt with the captchas.
> >=20
> > Actually, no, this doesn't work either.=C2=A0 It brings me to the same
> > account creation screen on discord.com and then demands phone
> > number verification again.
>=20
> > I've no idea why this doesn't work for me.=C2=A0 I suppose it could be
> > source IP address (I am on comcast cable and discord.com seems to
> > be IPv4 only).
>=20
> I don't really have any other ideas either.=C2=A0 Maybe it doesn't like
> the domain name you've used for the email address?

I was using this one.  However, now it doesn't ask for email, it asks
for user name which doesn't have an account

> =C2=A0 Did it give you a captcha?=C2=A0 I assume you're "passing" that.

Yes, the account verification screen is after the captcha.

> =C2=A0 I suspect there is something Discord is detecting in your account
> signup that they are triggering a "higher probability of being spam"
> setting, but I don't know what that would be.

I tried using a socks proxy to the IBM network and that doesn't work
either, so it's likely some browser or OS test (I tried with both
chrome and firefox, with the same results, I've even tried a user agent
switcher).

Regards,

James


--=-D+Hy2WbHDY5r51DvJcqd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABMIAB0WIQTnYEDbdso9F2cI+arnQslM7pishQUCY3uVugAKCRDnQslM7pis
hch/AP9WJJ9Dk0tddMe5wi6MPRa3Y5rsMn0altyQsDFYsfsVpgD9EsTNd7xFa395
W3QCOSAem4gIUf+/8EXVBe87gTiP9Rk=
=W3hg
-----END PGP SIGNATURE-----

--=-D+Hy2WbHDY5r51DvJcqd--

