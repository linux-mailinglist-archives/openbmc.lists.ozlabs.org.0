Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 266B9148E2B
	for <lists+openbmc@lfdr.de>; Fri, 24 Jan 2020 20:03:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4847pS43dwzDqhT
	for <lists+openbmc@lfdr.de>; Sat, 25 Jan 2020 06:03:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=johnathanx.mantey@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4847np622dzDqfP
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jan 2020 06:03:03 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jan 2020 11:03:00 -0800
X-IronPort-AV: E=Sophos;i="5.70,358,1574150400"; 
 d="asc'?scan'208,217";a="245786153"
Received: from jmanteyx-desk.jf.intel.com ([10.54.51.75])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 24 Jan 2020 11:02:59 -0800
From: Johnathan Mantey <johnathanx.mantey@intel.com>
Subject: NIC Enable/disable commit review
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
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
Message-ID: <45e70fab-f064-5154-ec9b-02e5303b10e0@intel.com>
Date: Fri, 24 Jan 2020 11:02:55 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="cGnx1fHWiEAG4g9fHxU3UNez2j8nrTBDH"
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
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--cGnx1fHWiEAG4g9fHxU3UNez2j8nrTBDH
Content-Type: multipart/mixed; boundary="nFC4Z6SSOZfrYnlnTybniy5kPKwWdHNZF"

--nFC4Z6SSOZfrYnlnTybniy5kPKwWdHNZF
Content-Type: multipart/alternative;
 boundary="------------0B7AD967C93EA42AA8102F3F"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------0B7AD967C93EA42AA8102F3F
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Ratan,

Will you please complete
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-networkd/+/26696?
The systemd team does not have any other control to cause a link up/down
state.=C2=A0 The perception there is "Why would you want to individually
enable/disable ports you've paid for?".=C2=A0 Since they have no ready
control to achieve the desired effect, I would appreciate accepting my
solution for the time being.=C2=A0 Should systemd make a change to improv=
e
the control of link status the change can be made then.

What is your opinion?

--=20
Johnathan Mantey
Senior Software Engineer
*azad te**chnology partners*
Contributing to Technology Innovation since 1992
Phone: (503) 712-6764
Email: johnathanx.mantey@intel.com <mailto:johnathanx.mantey@intel.com>


--------------0B7AD967C93EA42AA8102F3F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    Ratan,<br>
    <br>
    Will you please complete <a class=3D"moz-txt-link-freetext"
href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-networkd/+/=
26696"
      moz-do-not-send=3D"true">https://gerrit.openbmc-project.xyz/c/openb=
mc/phosphor-networkd/+/26696</a>?<br>
    The systemd team does not have any other control to cause a link
    up/down state.=C2=A0 The perception there is "Why would you want to
    individually enable/disable ports you've paid for?".=C2=A0 Since they=

    have no ready control to achieve the desired effect, I would
    appreciate accepting my solution for the time being.=C2=A0 Should sys=
temd
    make a change to improve the control of link status the change can
    be made then.<br>
    <br>
    What is your opinion?<br>
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

                      moz-do-not-send=3D"true">johnathanx.mantey@intel.co=
m</a></font></small><br>
                <br>
              </small></font></big></font></font> </div>
  </body>
</html>

--------------0B7AD967C93EA42AA8102F3F--

--nFC4Z6SSOZfrYnlnTybniy5kPKwWdHNZF--

--cGnx1fHWiEAG4g9fHxU3UNez2j8nrTBDH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEVa822oZtYaVqAzq50EfviT3fHwkFAl4rP18ACgkQ0EfviT3f
HwnYKwf/XupBij8UBxetP8wwVY+ysR9VlmW3ujOvNS+d99KunAMWXsrYW3zN8xcS
pkmv1bklo48ks3gxusLf+4j6ha8+5dFrZeDUtBft6fH3ORxTOi5V77vE4mww35JX
tO3RR6J2TYQmNb3xncvHvoJPl8P5pu9JT8OvaPm544B/k/rfGbPwjBHVI4lGCIJi
E7EaYPf8ZvC/9jalP3W5InVG1ih6WT8PEmLeIXl40bBc7EiZvKS69uPrNzfEZe5E
XTx4bvp8dTUVyxMEU4/GdSw3SaIGzjmK0Bb+qBxRWUYgohcMhm20YnNNDZSNHCJ2
VMm9OXUGCeyvnisahIK7vBODSk/Idg==
=3jg7
-----END PGP SIGNATURE-----

--cGnx1fHWiEAG4g9fHxU3UNez2j8nrTBDH--
