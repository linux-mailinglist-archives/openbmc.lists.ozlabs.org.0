Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A95939D739
	for <lists+openbmc@lfdr.de>; Mon, 26 Aug 2019 22:09:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HNPY313bzDqlD
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2019 06:09:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=johnathanx.mantey@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HNHl4dSwzDqQM
 for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2019 06:03:57 +1000 (AEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Aug 2019 13:03:55 -0700
X-IronPort-AV: E=Sophos;i="5.64,433,1559545200"; 
 d="asc'?scan'208,217";a="182551122"
Received: from jmanteyx-desk.jf.intel.com ([10.54.51.79])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/AES256-SHA;
 26 Aug 2019 13:03:55 -0700
To: openbmc@lists.ozlabs.org
From: Johnathan Mantey <johnathanx.mantey@intel.com>
Subject: QEMU native compile issue
Openpgp: preference=signencrypt
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
Message-ID: <85985690-0f45-9c8e-cde7-caa7d932ff12@intel.com>
Date: Mon, 26 Aug 2019 13:03:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="9W0bn0ACYSPwbMIjJog2nm7mxnlpA7Kse"
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
--9W0bn0ACYSPwbMIjJog2nm7mxnlpA7Kse
Content-Type: multipart/mixed; boundary="NyGU0lNzTj9R3IIuok1snTAV0W5Pso4Xo";
 protected-headers="v1"
From: Johnathan Mantey <johnathanx.mantey@intel.com>
To: openbmc@lists.ozlabs.org
Message-ID: <85985690-0f45-9c8e-cde7-caa7d932ff12@intel.com>
Subject: QEMU native compile issue

--NyGU0lNzTj9R3IIuok1snTAV0W5Pso4Xo
Content-Type: multipart/alternative;
 boundary="------------69EF2F30194EF8EB84BF081A"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------69EF2F30194EF8EB84BF081A
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Friday I ran into an issue compiling qemu-native.=C2=A0 I tracked the iss=
ue
to the the fact that the most recent kernel creates a new definition for
SIOCGSTAMP in sockios.h.=C2=A0 The prior definition was in sys/socket.h.=C2=
=A0 I
have pushed a change request to the QEMU code base.=C2=A0 It's a one-line=
r:

linux-user/syscall.c:
=C2=A0#include <linux/random.h>
+#include <linux/sockios.h>


--=20
Johnathan Mantey
Senior Software Engineer
*azad te**chnology partners*
Contributing to Technology Innovation since 1992
Phone: (503) 712-6764
Email: johnathanx.mantey@intel.com <mailto:johnathanx.mantey@intel.com>


--------------69EF2F30194EF8EB84BF081A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>

    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    Friday I ran into an issue compiling qemu-native.=C2=A0 I tracked the=

    issue to the the fact that the most recent kernel creates a new
    definition for SIOCGSTAMP in sockios.h.=C2=A0 The prior definition wa=
s in
    sys/socket.h.=C2=A0 I have pushed a change request to the QEMU code
    base.=C2=A0 It's a one-liner:<br>
    <br>
    linux-user/syscall.c:<br>
    =C2=A0#include &lt;linux/random.h&gt;<br>
    +#include &lt;linux/sockios.h&gt;<br>
    <br>
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

--------------69EF2F30194EF8EB84BF081A--

--NyGU0lNzTj9R3IIuok1snTAV0W5Pso4Xo--

--9W0bn0ACYSPwbMIjJog2nm7mxnlpA7Kse
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEVa822oZtYaVqAzq50EfviT3fHwkFAl1kOycACgkQ0EfviT3f
Hwkkxwf/Rkqi8rQr5trzqUJQZdnh49Ba6pVkwxdrXHSpj69Ri87vSMtGrG5IJ4SH
9PRMFJ+19yLzKS/zdpknbmmy8CeUDCX2ubnbD3hnoJYN1WGNBkkQfk+MWR365Exu
4HtjiGH+11TFlwTwyHxGb+quwFqLBv0RyMKI21Cs5Q5V2lUDyq4AZ8U/XthKMUJ1
dZBJsTJjZu+EYc4sg/7//3V1ibrw+NjpEYjaLTNAEcijJ392IYbw5Nkom5LNALO2
VWUp0To2UPhETR/12wo/XSH8GBdeutW/OdhFRk5ItKUqSk8dZuMotlJbxBu/GaVm
9SRuYLYrosE5hDkOS7ePkmyaiDjmKQ==
=ZcYS
-----END PGP SIGNATURE-----

--9W0bn0ACYSPwbMIjJog2nm7mxnlpA7Kse--
