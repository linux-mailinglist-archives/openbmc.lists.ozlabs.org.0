Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB51E0B30
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 20:06:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46yLzk6Z2SzDqK1
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 05:06:26 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46yLxy3yJjzDqJ7
 for <openbmc@lists.ozlabs.org>; Wed, 23 Oct 2019 05:04:47 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Oct 2019 11:04:45 -0700
X-IronPort-AV: E=Sophos;i="5.68,217,1569308400"; 
 d="asc'?scan'208,217";a="191555034"
Received: from jmanteyx-desk.jf.intel.com ([10.54.51.79])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 22 Oct 2019 11:04:44 -0700
Subject: Re: x86-power-control
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
From: Johnathan Mantey <johnathanx.mantey@intel.com>
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
Message-ID: <a62a6c18-c184-61b4-2e47-b5a26088ba04@intel.com>
Date: Tue, 22 Oct 2019 11:04:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <286a9c11-565f-35f7-bdd6-2099e926bf5a@linux.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="mJ8UYO9HtPLWprXd4wj5M35W7WbnbMhtA"
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
--mJ8UYO9HtPLWprXd4wj5M35W7WbnbMhtA
Content-Type: multipart/mixed; boundary="GSoooX6qtwMBRcxCZHwPEaEFCNQFTpxqU"

--GSoooX6qtwMBRcxCZHwPEaEFCNQFTpxqU
Content-Type: multipart/alternative;
 boundary="------------09B1A7890ABC52C10EA7633D"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------09B1A7890ABC52C10EA7633D
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

You may want to delay the copy until the compile step.=C2=A0 For example:=


PROJECT_SRC_DIR :=3D "${THISDIR}/${PN}"
do_compile_prepend(){
=C2=A0=C2=A0=C2=A0 cp -f ${PROJECT_SRC_DIR}/your-header.hpp ${S}
}
> Don't patch, simply copy over your new header into the correct
> directory in a do_configure_prepend (I think that's the right yocto
> step to overwrite, but I might be off). --
Johnathan Mantey
Senior Software Engineer
*azad te**chnology partners*
Contributing to Technology Innovation since 1992
Phone: (503) 712-6764
Email: johnathanx.mantey@intel.com <mailto:johnathanx.mantey@intel.com>


--------------09B1A7890ABC52C10EA7633D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    You may want to delay the copy until the compile step.=C2=A0 For exam=
ple:<br>
    <br>
    <font face=3D"Courier New, Courier, monospace">PROJECT_SRC_DIR :=3D
      "${THISDIR}/${PN}"<br>
      do_compile_prepend(){<br>
      =C2=A0=C2=A0=C2=A0 cp -f ${PROJECT_SRC_DIR}/your-header.hpp ${S}<br=
>
      }</font><br>
    <blockquote type=3D"cite"
      cite=3D"mid:286a9c11-565f-35f7-bdd6-2099e926bf5a@linux.intel.com">D=
on't
      patch, simply copy over your new header into the correct directory
      in a do_configure_prepend (I think that's the right yocto step to
      overwrite, but I might be off).
      -- <br>
    </blockquote>
    <div class=3D"moz-signature">
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

--------------09B1A7890ABC52C10EA7633D--

--GSoooX6qtwMBRcxCZHwPEaEFCNQFTpxqU--

--mJ8UYO9HtPLWprXd4wj5M35W7WbnbMhtA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEVa822oZtYaVqAzq50EfviT3fHwkFAl2vRLcACgkQ0EfviT3f
HwnHIQgAsCdVsWHuP+1jTteTGoGFn1YVElG3Y56iYf7c+jZppxi8jEhChfcQGzcm
rQ4mReM+0blSk9kDw0aCzDmUfgll53WeH7VwTquKEWX+U9V+9NdQY7uTHxnvFnfn
Z4alyadBFtqTtYfR9l73S3E4ex5DB8k9flboy9lmy5BPlo3khpMpkzttBn+1+4wt
EHRDTVzKY6A2Y3tmsJ5EO8wib3bETkaspRC7gtfwO4f19zvuwomLJRKIiosRY2WV
I/upSDSEVtoCHtsvl+6mg4ayGsty5I+LD+qyE0lyQMQ6W0ki563RET0utjDulmZH
54rKyxpGnBOpeBgxkrxgxzjzhswmLA==
=Swoy
-----END PGP SIGNATURE-----

--mJ8UYO9HtPLWprXd4wj5M35W7WbnbMhtA--
