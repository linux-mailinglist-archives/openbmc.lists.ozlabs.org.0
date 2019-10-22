Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 315ACE0C3A
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 21:07:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46yNLH5pgBzDqJN
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 06:07:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=johnathanx.mantey@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46yNKP0lJRzDqJB
 for <openbmc@lists.ozlabs.org>; Wed, 23 Oct 2019 06:06:47 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Oct 2019 12:06:44 -0700
X-IronPort-AV: E=Sophos;i="5.68,217,1569308400"; 
 d="asc'?scan'208,217";a="191572306"
Received: from jmanteyx-desk.jf.intel.com ([10.54.51.79])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 22 Oct 2019 12:06:44 -0700
Subject: Re: x86-power-control
From: Johnathan Mantey <johnathanx.mantey@intel.com>
To: James Feist <james.feist@linux.intel.com>,
 Vijay Khemka <vijaykhemka@fb.com>,
 "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <EA590716-271A-4F5C-9B36-80260B7F35B6@fb.com>
 <66afaaab-baee-fc02-371b-2ef4a9f0d1ee@linux.intel.com>
 <37843B68-8D1C-48EB-B4B6-64CBC8F62F77@fb.com>
 <79190494-f452-286b-e304-7a901a3db26c@linux.intel.com>
 <8F55F038-A6E7-46A4-8C27-93C738AFEBDC@fb.com>
 <5d43146c-b8b9-164e-ed54-33df4bae6dce@linux.intel.com>
 <F590F665-9327-4C8D-8C23-C317DA71D7F0@fb.com>
 <54c375be-e45e-fc2a-dd31-6c9d61158169@linux.intel.com>
 <6DA89556-AD25-4BEE-AF40-9D7A129B7CB9@fb.com>
 <548712d2-820b-7c20-f05e-fbd80ab38c62@linux.intel.com>
 <4230479D-77FD-4073-B478-2D0B34C2927A@fb.com>
 <286a9c11-565f-35f7-bdd6-2099e926bf5a@linux.intel.com>
 <a62a6c18-c184-61b4-2e47-b5a26088ba04@intel.com>
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
Message-ID: <76c2d813-3e28-416c-1826-188f868b9eae@intel.com>
Date: Tue, 22 Oct 2019 12:06:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <a62a6c18-c184-61b4-2e47-b5a26088ba04@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="TGAtR8NvJMCddpIv1eVetqEebugTB7WAt"
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
--TGAtR8NvJMCddpIv1eVetqEebugTB7WAt
Content-Type: multipart/mixed; boundary="33RFm6ZC2P1mjC0sccqel3ZpeM6LLBvvx"

--33RFm6ZC2P1mjC0sccqel3ZpeM6LLBvvx
Content-Type: multipart/alternative;
 boundary="------------44EA15D30EDFD81D47BA4657"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------44EA15D30EDFD81D47BA4657
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

One observation about this method.
It may not work for the way CI unit tests are presently behaving.

For phosphorr-networkd, I think, the unit tests insist that everything
being tested be Git committed. The copy of the source file will not be.
This will prevent the unit test from running. I found this requirement
by the unit tests to be an irritant. I would clang-format my source, and
commit.=C2=A0 The unit tests would do an automated reformat, causing my
commit to be useless.=C2=A0 I'd have to recommit the source one more time=
 to
proceed.=C2=A0 It would be nice to eliminate/modify this requirement in t=
he
unit tests.

On 10/22/19 11:04 AM, Johnathan Mantey wrote:
> You may want to delay the copy until the compile step.=C2=A0 For exampl=
e:
>
> PROJECT_SRC_DIR :=3D "${THISDIR}/${PN}"
> do_compile_prepend(){
> =C2=A0=C2=A0=C2=A0 cp -f ${PROJECT_SRC_DIR}/your-header.hpp ${S}
> }
>> Don't patch, simply copy over your new header into the correct
>> directory in a do_configure_prepend (I think that's the right yocto
>> step to overwrite, but I might be off). --
> Johnathan Mantey
> Senior Software Engineer
> *azad te**chnology partners*
> Contributing to Technology Innovation since 1992
> Phone: (503) 712-6764
> Email: johnathanx.mantey@intel.com <mailto:johnathanx.mantey@intel.com>=

>

--=20
Johnathan Mantey
Senior Software Engineer
*azad te**chnology partners*
Contributing to Technology Innovation since 1992
Phone: (503) 712-6764
Email: johnathanx.mantey@intel.com <mailto:johnathanx.mantey@intel.com>


--------------44EA15D30EDFD81D47BA4657
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    One observation about this method.<br>
    It may not work for the way CI unit tests are presently behaving.<br>=

    <br>
    For phosphorr-networkd, I think, the unit tests insist that
    everything being tested be Git committed. The copy of the source
    file will not be. This will prevent the unit test from running. I
    found this requirement by the unit tests to be an irritant. I would
    clang-format my source, and commit.=C2=A0 The unit tests would do an
    automated reformat, causing my commit to be useless.=C2=A0 I'd have t=
o
    recommit the source one more time to proceed.=C2=A0 It would be nice =
to
    eliminate/modify this requirement in the unit tests.<br>
    <br>
    <div class=3D"moz-cite-prefix">On 10/22/19 11:04 AM, Johnathan Mantey=

      wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:a62a6c18-c184-61b4-2e47-b5a26088ba04@intel.com">
      <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DU=
TF-8">
      You may want to delay the copy until the compile step.=C2=A0 For
      example:<br>
      <br>
      <font face=3D"Courier New, Courier, monospace">PROJECT_SRC_DIR :=3D=

        "${THISDIR}/${PN}"<br>
        do_compile_prepend(){<br>
        =C2=A0=C2=A0=C2=A0 cp -f ${PROJECT_SRC_DIR}/your-header.hpp ${S}<=
br>
        }</font><br>
      <blockquote type=3D"cite"
        cite=3D"mid:286a9c11-565f-35f7-bdd6-2099e926bf5a@linux.intel.com"=
>Don't
        patch, simply copy over your new header into the correct
        directory in a do_configure_prepend (I think that's the right
        yocto step to overwrite, but I might be off). -- <br>
      </blockquote>
      <div class=3D"moz-signature">
        <meta http-equiv=3D"content-type" content=3D"text/html;
          charset=3DUTF-8">
        <title></title>
        <font color=3D"#1F497D"><font face=3D"Century Gothic">Johnathan
            Mantey<br>
            <small>Senior Software Engineer</small><br>
            <big><font color=3D"#555555"><small><b>azad te</b><b>chnology=

                    partners</b></small><br>
                <small><font color=3D"#1F497D"><small>Contributing to
                      Technology Innovation since 1992</small></font><sma=
ll><br>
                    <font color=3D"#1F497D">Phone: (503) 712-6764<br>
                      Email: <a
                        href=3D"mailto:johnathanx.mantey@intel.com"
                        moz-do-not-send=3D"true">johnathanx.mantey@intel.=
com</a></font></small><br>
                  <br>
                </small></font></big></font></font> </div>
    </blockquote>
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

--------------44EA15D30EDFD81D47BA4657--

--33RFm6ZC2P1mjC0sccqel3ZpeM6LLBvvx--

--TGAtR8NvJMCddpIv1eVetqEebugTB7WAt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEVa822oZtYaVqAzq50EfviT3fHwkFAl2vUz8ACgkQ0EfviT3f
Hwkedwf/R2Z2tqbLnyDAFPzOQmoTMluqzIHUSMssrBvUC2qxpbkLp8VoMkgCPank
OK7uqYreDN9q1k4PvRz32WzoGIc6+UBrLUm/ByO34CAC/js0agTwEsEFQjmm5vAD
BqjAbiT48D6T7LK6VTlTKxDC0h2A5Mza4/B76AEgKCqODrTGrIsJOtY2h3iEGt7y
F6mWZQv6rd6TiZLfu4AlQk5fdJ/sF1RgZS642DB0zKC34kRjmVpNVo77gjtVOqaT
QFI3/mBqzEtQ16pNUXLNgwcEKC90ySdy+CxGFJxKb8SnfFtW3jw0GFMXIWlF3VO9
rMe3OEj8KQd5a/5RRFMBUIXnm/erZA==
=mFhY
-----END PGP SIGNATURE-----

--TGAtR8NvJMCddpIv1eVetqEebugTB7WAt--
