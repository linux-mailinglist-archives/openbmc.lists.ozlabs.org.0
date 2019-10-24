Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB8AE3650
	for <lists+openbmc@lfdr.de>; Thu, 24 Oct 2019 17:17:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zW7x3Ps7zDqFG
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 02:17:33 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zW7304sLzDqLJ
 for <openbmc@lists.ozlabs.org>; Fri, 25 Oct 2019 02:16:45 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Oct 2019 08:16:39 -0700
X-IronPort-AV: E=Sophos;i="5.68,225,1569308400"; 
 d="asc'?scan'208,217";a="192217515"
Received: from jmanteyx-desk.jf.intel.com ([10.54.51.79])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 24 Oct 2019 08:16:39 -0700
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Johnathan Mantey <johnathanx.mantey@intel.com>
Subject: Continuous Integration Build Failures
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
Message-ID: <1b633df0-8ce7-963c-cb6b-d79ee7d24a9c@intel.com>
Date: Thu, 24 Oct 2019 08:16:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Wc0KhA1CLRC3pi4ArLRAdPjTRSHofK8ll"
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
--Wc0KhA1CLRC3pi4ArLRAdPjTRSHofK8ll
Content-Type: multipart/mixed; boundary="0QYXthlXwbIHLtAKdQYWMxBhEsRjf0sY5"

--0QYXthlXwbIHLtAKdQYWMxBhEsRjf0sY5
Content-Type: multipart/alternative;
 boundary="------------5D57F906A2790F7B111008BF"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------5D57F906A2790F7B111008BF
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

I would like to propose a change to how the continuous integration
system works.

I understand there are many builds, and there is a lot of data
associated with the builds. Thus the current desire to remove the log
file data in a short amount of time is a requirement. This works alright
when the build succeeds. It's unhelpful when the build fails.
Identifying where the build fails is impossible after approximately an
hour. As an ordinary contributor I don't know how to make the CI system
rebuild the source code so that the log files are available again
without pushing some new change that consists of a useless piece of
whitespace (or some other pointless change).=C2=A0 It shouldn't be necess=
ary
for the contributor to make requests for a build restart to the CI
maintainers, they have their own agenda.

Are the maintainers of the CI system willing to make a change that aids
in debug?

Suggestions:

 1. Don't delete the log on build fails.
 2. Delete everything but the log ascii output on build fails.
 3. Email the ascii logfile for build fails
 4. Email a compressed debug bundle to the submitter?
 5. Allow build fails to be restarted by the submitter so the logs can
    be regenerated, inspected, and captured.
 6. other...?

--=20
Johnathan Mantey
Senior Software Engineer
*azad te**chnology partners*
Contributing to Technology Innovation since 1992
Phone: (503) 712-6764
Email: johnathanx.mantey@intel.com <mailto:johnathanx.mantey@intel.com>


--------------5D57F906A2790F7B111008BF
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>

    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    I would like to propose a change to how the continuous integration
    system works.<br>
    <br>
    I understand there are many builds, and there is a lot of data
    associated with the builds. Thus the current desire to remove the
    log file data in a short amount of time is a requirement. This works
    alright when the build succeeds. It's unhelpful when the build
    fails. Identifying where the build fails is impossible after
    approximately an hour. As an ordinary contributor I don't know how
    to make the CI system rebuild the source code so that the log files
    are available again without pushing some new change that consists of
    a useless piece of whitespace (or some other pointless change).=C2=A0=
 It
    shouldn't be necessary for the contributor to make requests for a
    build restart to the CI maintainers, they have their own agenda. <br>=

    <br>
    Are the maintainers of the CI system willing to make a change that
    aids in debug?<br>
    <br>
    Suggestions:<br>
    <ol>
      <li>Don't delete the log on build fails.<br>
      </li>
      <li>Delete everything but the log ascii output on build fails.</li>=

      <li>Email the ascii logfile for build fails</li>
      <li>Email a compressed debug bundle to the submitter?<br>
      </li>
      <li>Allow build fails to be restarted by the submitter so the logs
        can be regenerated, inspected, and captured.</li>
      <li>other...?</li>
    </ol>
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

--------------5D57F906A2790F7B111008BF--

--0QYXthlXwbIHLtAKdQYWMxBhEsRjf0sY5--

--Wc0KhA1CLRC3pi4ArLRAdPjTRSHofK8ll
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEVa822oZtYaVqAzq50EfviT3fHwkFAl2xwFIACgkQ0EfviT3f
HwnCdgf+M/inzYyP8Ik7JiKGobZhg85fZdmp2ujeMLemmJ8Uup59dY7/LEj4mKnq
3z2g6CJ1zexApOfgGyXGXSVsUlV9kRID4iFYzkf6RRn3hwikAXzWsRFaZyuRud2P
8RJWysleoFVfJDnAoTZrXIztWMYG7ISJOf/ZbF3XLjxrtFYTHLtTM11Hmvu826UH
0AGEePbx41+U5VH0tLN007mhw5g8Tx4C1zmXOP2uHan8ojaFymRdk2kN4deCYtdZ
NMpYTEuUEIpOuOJ2RqgVL0pXrvf74vAiHfApY4L8Jdr2cxSsr50pmXCCBdg2xm5p
+QVS+EVwDVeEDzB2QYta5LAlBnFiWA==
=Zn1P
-----END PGP SIGNATURE-----

--Wc0KhA1CLRC3pi4ArLRAdPjTRSHofK8ll--
