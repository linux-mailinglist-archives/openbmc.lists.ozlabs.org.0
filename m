Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 89315F3732
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2019 19:27:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478Bht5vDMzF6d9
	for <lists+openbmc@lfdr.de>; Fri,  8 Nov 2019 05:27:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=johnathanx.mantey@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478Bh30ykkzF6cP
 for <openbmc@lists.ozlabs.org>; Fri,  8 Nov 2019 05:26:57 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Nov 2019 10:26:52 -0800
X-IronPort-AV: E=Sophos;i="5.68,278,1569308400"; 
 d="asc'?scan'208,217";a="196642940"
Received: from jmanteyx-desk.jf.intel.com ([10.54.51.79])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 07 Nov 2019 10:26:51 -0800
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Johnathan Mantey <johnathanx.mantey@intel.com>
Subject: cve-check and FC30
Autocrypt: addr=johnathanx.mantey@intel.com; prefer-encrypt=mutual; keydata=
 mQENBFija08BCAC60TO2X22b0tJ2Gy2iQLWx20mGcD7ugBpm1o2IW2M+um3GR0BG/bUcLciw
 dEnX9SWT30jx8TimenyUYeDS1CKML/e4JnCAUhSktNZRPBjzla991OkpqtFJEHj/pHrXTsz0
 ODhmnSaZ49TsY+5BqtRMexICYOtSP8+xuftPN7g2pQNFi7xYlQkutP8WKIY3TacW/6MPiYek
 pqVaaF0cXynCMDvbK0km7m0S4X01RZFKXUwlbuMireNk4IyZ/59hN+fh1MYMQ6RXOgmHqxSu
 04GjkbBLf2Sddplb6KzPMRWPJ5uNdvlkAfyT4P0R5EfkV5wCRdoJ1lNC9WI1bqHkbt07ABEB
 AAG0JUpvaG5hdGhhbiBNYW50ZXkgPG1hbnRleWpnQGdtYWlsLmNvbT6JATcEEwEIACEFAlij
 a08CGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4AACgkQ0EfviT3fHwmcBAgAkENzQ8s0RK+f
 nr4UogrCBS132lDdtlOypm1WgGDOVQNra7A1rvXFgN05RqrdRTpRevv7+S8ipbiG/kxn9P8+
 VhhW1SvUT8Tvkb9YYHos6za3v0YblibFNbYRgQcybYMeKz2/DcVU+ioKZ1SxNJsFXx6wH71I
 V2YumQRHAsh4Je6CmsiMVP4XNadzCQXzzcU9sstKV0A194JM/d8hjXfwMHZE6qnKgAkHIV3Q
 61YCuvkdr5SJSrOVo2IMN0pVxhhW7lqCAGBGb4oOhqePwGqOabU3Ui4qTbHP2BWP5UscehkK
 6TVKcpYApsUcWyxvvOARoktmlPnGYqJPnRwXpQBlqLkBDQRYo2tPAQgAyOv5Lgg2VkHO84R7
 LJJDBxcaCDjyAvHBynznEEk11JHrPuonEWi6pqgB8+Kc588/GerXZqJ9AMkR43UW/5cPlyF2
 wVO4aYaQwryDtiXEu+5rpbQfAvBpKTbrBfYIPc8thuAC2kdB4IO24T6PVSYVXYc/giOL0Iwb
 /WZfMd5ajtKfa727xfbKCEHlzakqmUl0SyrARdrSynhX1R9Wnf2BwtUV7mxFxtMukak0zdTf
 2IXZXDltZC224vWqkXiI7Gt/FDc2y6gcsYY/4a2+vjhWuZk3lEzP0pbXQqOseDM1zZXln/m7
 BFbJ6VUn1zWcrt0c82GTMqkeGUheUhDiYLQ7xwARAQABiQEfBBgBCAAJBQJYo2tPAhsMAAoJ
 ENBH74k93x8JKEUH/3UPZryjmM0F3h8I0ZWuruxAxiqvksLOOtarU6RikIAHhwjvluEcTH4E
 JsDjqtRUvBMU907XNotpqpW2e9jN8tFRyR4wW9CYkilB02qgrDm9DXVGb2BDtC/MY+6KUgsG
 k5Ftr9uaXNd0K4IGRJSyU6ZZn0inTcXlqD+NgOE2eX9qpeKEhDufgF7fKHbKDkS4hj6Z09dT
 Y8eW9d6d2Yf/RzTBJvZxjBFbIgeUGeykbSKztp2OBe6mecpVPhKooTq+X/mJehpRA6mAhuQZ
 28lvie7hbRFjqR3JB7inAKL4eT1/9bT/MqcPh43PXTAzB6/Iclg5B7GGgEFe27VL0hyqiqc=
Message-ID: <ac0e717a-f1ea-06f4-e05a-870cb4521a3a@intel.com>
Date: Thu, 7 Nov 2019 10:26:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="OmAB1FJLXAKeTR3h7Lds70qyKQmOATgxW"
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--OmAB1FJLXAKeTR3h7Lds70qyKQmOATgxW
Content-Type: multipart/mixed; boundary="aRL0rPkiFfvB5p7hROZDbUR4fMPbWuUSk"

--aRL0rPkiFfvB5p7hROZDbUR4fMPbWuUSk
Content-Type: multipart/alternative;
 boundary="------------DBB91EC5B5E528276F397CEF"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------DBB91EC5B5E528276F397CEF
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

SSdtIHVuYWJsZSB0byBidWlsZCB3aXRoIHRoZSBsYXRlc3QgdXBzdHJlYW0gY2hhbmdlcy7C
oCBJJ3ZlIGlzb2xhdGVkIHRoZQpwcm9ibGVtIHRvIHRoaXMgY29tbWl0OgoKM2UzNmFiOGRh
ZGFiMzZiYjI4NmRjNmQ3NTBhYzZjNDkzNGY1MGQwNCBjdmUtY2hlY2s6IGVuc3VyZSBhbGwg
a25vd24KQ1ZFcyBhcmUgaW4gdGhlIHJlcG9ydAoKVGhlIGVycm9yIGlzOgrCoMKgwqDCoCAw
MjcyOsKgwqDCoCBwbGFjZWhvbGRlciA9ICIsIi5qb2luKCI/IiAqIGxlbihjdmVzKSkKwqDC
oMKgwqAgMDI3MzrCoMKgwqAgcXVlcnkgPSAiU0VMRUNUICogRlJPTSBOVkQgV0hFUkUgaWQg
SU4gKCVzKSIgJSBwbGFjZWhvbGRlcgrCoMKgwqDCoCAwMjc0OsKgwqDCoCBjb25uID0gc3Fs
aXRlMy5jb25uZWN0KGRiX2ZpbGUpCsKgwqDCoMKgIDAyNzU6wqDCoMKgIGN1ciA9IGNvbm4u
Y3Vyc29yKCkKwqAqKiogMDI3NjrCoMKgwqAgZm9yIHJvdyBpbiBjdXIuZXhlY3V0ZShxdWVy
eSwgdHVwbGUoY3ZlcykpOgrCoMKgwqDCoCAwMjc3OsKgwqDCoMKgwqDCoMKgIGN2ZV9kYXRh
W3Jvd1swXV0gPSB7fQrCoMKgwqDCoCAwMjc4OsKgwqDCoMKgwqDCoMKgIGN2ZV9kYXRhW3Jv
d1swXV1bInN1bW1hcnkiXSA9IHJvd1sxXQrCoMKgwqDCoCAwMjc5OsKgwqDCoMKgwqDCoMKg
IGN2ZV9kYXRhW3Jvd1swXV1bInNjb3JldjIiXSA9IHJvd1syXQrCoMKgwqDCoCAwMjgwOsKg
wqDCoMKgwqDCoMKgIGN2ZV9kYXRhW3Jvd1swXV1bInNjb3JldjMiXSA9IHJvd1szXQpFeGNl
cHRpb246IHNxbGl0ZTMuT3BlcmF0aW9uYWxFcnJvcjogdG9vIG1hbnkgU1FMIHZhcmlhYmxl
cwoKV2hlbiBJIHJldmVydCB0aGlzIGNoYW5nZSBJIGFtIGFibGUgdG8gYnVpbGQuCgpIYXMg
YW55b25lIGVsc2Ugc2VlbiB0aGlzLCBhbmQsIGlmIHNvLCBjcmVhdGVkIGEgc29sdXRpb24/
CgotLSAKSm9obmF0aGFuIE1hbnRleQpTZW5pb3IgU29mdHdhcmUgRW5naW5lZXIKKmF6YWQg
dGUqKmNobm9sb2d5IHBhcnRuZXJzKgpDb250cmlidXRpbmcgdG8gVGVjaG5vbG9neSBJbm5v
dmF0aW9uIHNpbmNlIDE5OTIKUGhvbmU6ICg1MDMpIDcxMi02NzY0CkVtYWlsOiBqb2huYXRo
YW54Lm1hbnRleUBpbnRlbC5jb20gPG1haWx0bzpqb2huYXRoYW54Lm1hbnRleUBpbnRlbC5j
b20+Cgo=
--------------DBB91EC5B5E528276F397CEF
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>

    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    I'm unable to build with the latest upstream changes.=C2=A0 I've isol=
ated
    the problem to this commit:<br>
    <br>
    3e36ab8dadab36bb286dc6d750ac6c4934f50d04 cve-check: ensure all known
    CVEs are in the report<br>
    <br>
    The error is:<br>
    =C2=A0=C2=A0=C2=A0=C2=A0 0272:=C2=A0=C2=A0=C2=A0 placeholder =3D ",".=
join("?" * len(cves))<br>
    =C2=A0=C2=A0=C2=A0=C2=A0 0273:=C2=A0=C2=A0=C2=A0 query =3D "SELECT * =
FROM NVD WHERE id IN (%s)" %
    placeholder<br>
    =C2=A0=C2=A0=C2=A0=C2=A0 0274:=C2=A0=C2=A0=C2=A0 conn =3D sqlite3.con=
nect(db_file)<br>
    =C2=A0=C2=A0=C2=A0=C2=A0 0275:=C2=A0=C2=A0=C2=A0 cur =3D conn.cursor(=
)<br>
    =C2=A0*** 0276:=C2=A0=C2=A0=C2=A0 for row in cur.execute(query, tuple=
(cves)):<br>
    =C2=A0=C2=A0=C2=A0=C2=A0 0277:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 cve_data[row[0]] =3D {}<br>
    =C2=A0=C2=A0=C2=A0=C2=A0 0278:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 cve_data[row[0]]["summary"] =3D row[1]<br>
    =C2=A0=C2=A0=C2=A0=C2=A0 0279:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 cve_data[row[0]]["scorev2"] =3D row[2]<br>
    =C2=A0=C2=A0=C2=A0=C2=A0 0280:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 cve_data[row[0]]["scorev3"] =3D row[3]<br>
    Exception: sqlite3.OperationalError: too many SQL variables<br>
    <br>
    When I revert this change I am able to build.<br>
    <br>
    Has anyone else seen this, and, if so, created a solution?<br>
    <br>
    <div class=3D"moz-signature">-- <br>
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DU=
TF-8">
      <title></title>
      <font color=3D"#1F497D"><font face=3D"Century Gothic">Johnathan Man=
tey<br>
          <small>Senior Software Engineer</small><br>
          <big><font color=3D"#555555"><small><b>azad te</b><b>chnology
                  partners</b></small><br>
              <small><font color=3D"#1F497D"><small>Contributing to
                    Technology Innovation since 1992</small></font><small=
><br>
                  <font color=3D"#1F497D">Phone: (503) 712-6764<br>
                    Email: <a href=3D"mailto:johnathanx.mantey@intel.com"=
>johnathanx.mantey@intel.com</a></font></small><br>
                <br>
              </small></font></big></font></font> </div>
  </body>
</html>

--------------DBB91EC5B5E528276F397CEF--

--aRL0rPkiFfvB5p7hROZDbUR4fMPbWuUSk--

--OmAB1FJLXAKeTR3h7Lds70qyKQmOATgxW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEVa822oZtYaVqAzq50EfviT3fHwkFAl3EYegACgkQ0EfviT3f
HwmmEAf/d/X0pwvg6BY3YQj2paPmbx+mUT6fXCOk0MpELC3KuMAh7x2mD+Lq5q95
RuBrmzDRfHIc8LBPqB/rzY0f8Dp3BOSUR5OZnqxM6Q5BmxQugblkoG2Yuhgwo5EL
QcQtqVecl5o3ePD425+27OwI0EozvCHyhtC8cxelM37E63cLmSjdlgxbRGrYQyHv
S0QHXrgmWPcRxCbFYoIFtXU2cOqBe/OWwcKLHYqvjnuv7pde8Pkig7CY8DcGgrnk
ai8OZ0KWTMZ/ILXSvxKGfemYRwAvVhh1O5qgpRq093P7LadD+RRQqNE1sRK39qd3
WdUaG3LKyjCEChkpk9VMsOlGpO9Yqg==
=CzdT
-----END PGP SIGNATURE-----

--OmAB1FJLXAKeTR3h7Lds70qyKQmOATgxW--
