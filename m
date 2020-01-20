Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E398214312C
	for <lists+openbmc@lfdr.de>; Mon, 20 Jan 2020 18:57:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 481fXP15lpzDqgG
	for <lists+openbmc@lfdr.de>; Tue, 21 Jan 2020 04:57:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=johnathanx.mantey@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 481fWd6RZYzDqc3
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jan 2020 04:57:15 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jan 2020 09:57:12 -0800
X-IronPort-AV: E=Sophos;i="5.70,342,1574150400"; 
 d="asc'?scan'208,217";a="219710909"
Received: from jmanteyx-desk.jf.intel.com ([10.54.51.75])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 20 Jan 2020 09:57:12 -0800
Subject: Re: Redfish metadata implementation
To: Joseph Reynolds <jrey@linux.ibm.com>,
 Ratan Gupta <ratagupt@linux.vnet.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 james.feist@linux.intel.com
References: <20116922-06a2-897c-55ba-d037675ea52e@linux.vnet.ibm.com>
 <cd830dd2-1add-5bb4-db60-50f186abe310@linux.ibm.com>
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
Message-ID: <32b329ae-ba48-3dc9-071e-541e6199b6ca@intel.com>
Date: Mon, 20 Jan 2020 09:57:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <cd830dd2-1add-5bb4-db60-50f186abe310@linux.ibm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Uvq6dVsEmVw3GizQyYyQixjZuXSCLXrzD"
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
--Uvq6dVsEmVw3GizQyYyQixjZuXSCLXrzD
Content-Type: multipart/mixed; boundary="hP55dJDZKHuYICGDSMiJPxdCEIJsPZtRk"

--hP55dJDZKHuYICGDSMiJPxdCEIJsPZtRk
Content-Type: multipart/alternative;
 boundary="------------2397D997116594D54DB770BC"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------2397D997116594D54DB770BC
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

I just ran this using my restclient utility, and the metadata is being
reported correctly.

=C2=A0=C2=A0=C2=A0=C2=A0 <?xml version=3D"1.0" encoding=3D"UTF-8"?>
=C2=A0=C2=A0=C2=A0=C2=A0 <edmx:Edmx xmlns:edmx=3D"http://docs.oasis-open.=
org/odata/ns/edmx"
Version=3D"4.0">
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <edmx:Reference Uri=3D"/redfish/v1/s=
chema/AccelerationFunction_v1.xml">
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <edmx:Include Namespace=3D=
"AccelerationFunction"/>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <edmx:Include Namespace=3D=
"AccelerationFunction.v1_0_0"/>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <edmx:Include Namespace=3D=
"AccelerationFunction.v1_0_1"/>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <edmx:Include Namespace=3D=
"AccelerationFunction.v1_0_2"/>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </edmx:Reference>

I think Joseph is correct, the problem is a shell expansion issue.

On 1/20/20 9:38 AM, Joseph Reynolds wrote:
> On 1/20/20 4:07 AM, Ratan Gupta wrote:
>>
>> Hi James,
>>
>> I was looking at the current master metadata redfish url
>> implementation and seems that is not correct.
>>
>> Currently redfish/v1 and redfish/v1/$metadata is giving the same
>> service root data(service root).
>>
>> curl -k -H "X-Auth-Token: $bmc_token" -X GEThttps://${bmc}/redfish/v1
>> curl -k -H "X-Auth-Token: $bmc_token" -X
>> GEThttps://${bmc}/redfish/v1/$metadata
>
> I wonder if=C2=A0 $metadata=C2=A0 is being expanded as a shell variable=
=2E=C2=A0 The
> shell expands un-set variables to the empty string and you get the
> result you are seeing.=C2=A0 If this is happening to you, you could quo=
te
> your command in one of these ways (but be careful not to quote the
> ${bmc} variable):
>
> curl -k -H "X-Auth-Token: $bmc_token" -X
> GEThttps://${bmc}/redfish/v1/\$metadata
>
> -or-
>
> curl -k -H "X-Auth-Token: $bmc_token" -X
> GEThttps://${bmc}'/redfish/v1/$metadata'
>
>
> Also, note that URI /redfish/v1/$metadata does not require
> authentication, so the X-Auth-Token header is not needed.
>
> - Joseph
>
>> I am hoping the redfish/v1/$metadata should return the following data
>>
>> https://github.com/openbmc/bmcweb/blob/master/static/redfish/v1/%24met=
adata/index.xml
>>
>>
>> Ratan
>>
>>
>>
>

--=20
Johnathan Mantey
Senior Software Engineer
*azad te**chnology partners*
Contributing to Technology Innovation since 1992
Phone: (503) 712-6764
Email: johnathanx.mantey@intel.com <mailto:johnathanx.mantey@intel.com>


--------------2397D997116594D54DB770BC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    I just ran this using my restclient utility, and the metadata is
    being reported correctly.<br>
    <br>
    =C2=A0=C2=A0=C2=A0=C2=A0 &lt;?xml version=3D"1.0" encoding=3D"UTF-8"?=
&gt;<br>
    =C2=A0=C2=A0=C2=A0=C2=A0 &lt;edmx:Edmx
    xmlns:edmx=3D<a class=3D"moz-txt-link-rfc2396E" href=3D"http://docs.o=
asis-open.org/odata/ns/edmx">"http://docs.oasis-open.org/odata/ns/edmx"</=
a>
    Version=3D"4.0"&gt;<br>
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &lt;edmx:Reference
    Uri=3D"/redfish/v1/schema/AccelerationFunction_v1.xml"&gt;<br>
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &lt;edmx:Include Nam=
espace=3D"AccelerationFunction"/&gt;<br>
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &lt;edmx:Include
    Namespace=3D"AccelerationFunction.v1_0_0"/&gt;<br>
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &lt;edmx:Include
    Namespace=3D"AccelerationFunction.v1_0_1"/&gt;<br>
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &lt;edmx:Include
    Namespace=3D"AccelerationFunction.v1_0_2"/&gt;<br>
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &lt;/edmx:Reference&gt;<br>
    <br>
    I think Joseph is correct, the problem is a shell expansion issue.<br=
>
    <br>
    <div class=3D"moz-cite-prefix">On 1/20/20 9:38 AM, Joseph Reynolds
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:cd830dd2-1add-5bb4-db60-50f186abe310@linux.ibm.com">On
      1/20/20 4:07 AM, Ratan Gupta wrote:
      <br>
      <blockquote type=3D"cite">
        <br>
        Hi James,
        <br>
        <br>
        I was looking at the current master metadata redfish url
        implementation and seems that is not correct.
        <br>
        <br>
        Currently redfish/v1 and redfish/v1/$metadata is giving the same
        service root data(service root).
        <br>
        <br>
        curl -k -H "X-Auth-Token: $bmc_token" -X
        GEThttps://${bmc}/redfish/v1
        <br>
        curl -k -H "X-Auth-Token: $bmc_token" -X
        GEThttps://${bmc}/redfish/v1/$metadata
        <br>
      </blockquote>
      <br>
      I wonder if=C2=A0 $metadata=C2=A0 is being expanded as a shell vari=
able.=C2=A0
      The shell expands un-set variables to the empty string and you get
      the result you are seeing.=C2=A0 If this is happening to you, you c=
ould
      quote your command in one of these ways (but be careful not to
      quote the ${bmc} variable):
      <br>
      <br>
      curl -k -H "X-Auth-Token: $bmc_token" -X
      GEThttps://${bmc}/redfish/v1/\$metadata
      <br>
      <br>
      -or-
      <br>
      <br>
      curl -k -H "X-Auth-Token: $bmc_token" -X
      GEThttps://${bmc}'/redfish/v1/$metadata'
      <br>
      <br>
      <br>
      Also, note that URI /redfish/v1/$metadata does not require
      authentication, so the X-Auth-Token header is not needed.
      <br>
      <br>
      - Joseph
      <br>
      <br>
      <blockquote type=3D"cite">I am hoping the redfish/v1/$metadata
        should return the following data
        <br>
        <br>
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/openbmc/bmc=
web/blob/master/static/redfish/v1/%24metadata/index.xml">https://github.c=
om/openbmc/bmcweb/blob/master/static/redfish/v1/%24metadata/index.xml</a>=

        <br>
        <br>
        Ratan
        <br>
        <br>
        <br>
        <br>
      </blockquote>
      <br>
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

--------------2397D997116594D54DB770BC--

--hP55dJDZKHuYICGDSMiJPxdCEIJsPZtRk--

--Uvq6dVsEmVw3GizQyYyQixjZuXSCLXrzD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEVa822oZtYaVqAzq50EfviT3fHwkFAl4l6fQACgkQ0EfviT3f
Hwkpxgf/eljJ6wJwOqNSsueZbVVlcMnFsm9YT6+BWis6BGlcALScx53N4uV6OP7W
SamnhuhdP7LfaxxD7h6N17B+V3d36ct+CgCDi8d0g2CB3LU8yjXaTdLeqb2brUq3
M3xEpX+i2UJ+gEfYp/pXMevJVC9XMD1EINx1UkBWNQvHubk2hSKMgE+9erQoWSSP
TuWEs83iS7nIvFR0stk0iRUBy2QVU7aAHpMtheM4BfeWmtLLvWJITv98RbuI0hrX
GHcU5xdxHOMAi7A7/XMb+gjUpbYVLvvRqRLeWKPQYCm1UWSuOtEPk8EVaKmDji1R
RU2x23qJ38Hblc+Ahs0AUTE57PUJcg==
=hR7C
-----END PGP SIGNATURE-----

--Uvq6dVsEmVw3GizQyYyQixjZuXSCLXrzD--
