Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1CDBBBA0
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 20:31:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cXwP33tbzDqLx
	for <lists+openbmc@lfdr.de>; Tue, 24 Sep 2019 04:31:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=johnathanx.mantey@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cXvc6DRCzDqCT
 for <openbmc@lists.ozlabs.org>; Tue, 24 Sep 2019 04:31:00 +1000 (AEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Sep 2019 11:30:54 -0700
X-IronPort-AV: E=Sophos;i="5.64,541,1559545200"; 
 d="asc'?scan'208,217";a="363715962"
Received: from jmanteyx-desk.jf.intel.com ([10.54.51.79])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 23 Sep 2019 11:30:54 -0700
Subject: Re: Proposal for 2 properties for Nameservers
To: Manojkiran Eda <manojeda@in.ibm.com>, openbmc@lists.ozlabs.org
References: <OFDC47175F.41C9D828-ON0025847E.0008C328-0025847E.00091D63@notes.na.collabserv.com>
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
Message-ID: <ba5410ad-5859-4d43-1215-3fa7cd5cfc11@intel.com>
Date: Mon, 23 Sep 2019 11:30:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <OFDC47175F.41C9D828-ON0025847E.0008C328-0025847E.00091D63@notes.na.collabserv.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="9U2qHcgyB9kpiFdG9kRB8Imr4mx0Bg8fL"
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
--9U2qHcgyB9kpiFdG9kRB8Imr4mx0Bg8fL
Content-Type: multipart/mixed; boundary="EcfbArWrUqAvAvfF7WrjEqFmT2N8X7ZCn"

--EcfbArWrUqAvAvfF7WrjEqFmT2N8X7ZCn
Content-Type: multipart/alternative;
 boundary="------------9192BDCDC306D2F6729A0ABD"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------9192BDCDC306D2F6729A0ABD
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

I agree with adding this to DBus.

On 9/22/19 6:39 PM, Manojkiran Eda wrote:
> Hi All,
> =C2=A0
> This mail is regarding , the proposal for adding an additional
> property `StaticNameservers` and also for changing the definition of
> the existing `Nameservers` property.
> =C2=A0
> - Currently, we have a single DBUS property under Ethernet interface
> named `Nameservers` that captures only StaticNameservers configured on
> the system. It does not populate the information regarding the DNS
> information that is obtained by DHCP server.
> =C2=A0
> It is also to be noted that the static & dynamic configuration can
> co-exist at the same time(means we might have the DNS set manually by
> user and also by the DHCP Server at the same time).
> =C2=A0
> As per the discussion with Ratan &
> Wak(https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-networkd/+/=
24224/),we
> had come to a conclusion that we need have two properties in the
> Backend for nameservers (similar to what we have in redfish):
> =C2=A0
> 1. Nameservers - A read only property which captures the current
> nameservers on the system (which may be static or/and dynamic)
> 2. StaticNameservers - A writeable property which captures only the
> static nameservers.
> =C2=A0
> Please let me know, if anyone have concerns with this proposal.
> =C2=A0
> Thanks,
> Manoj
>

--=20
Johnathan Mantey
Senior Software Engineer
*azad te**chnology partners*
Contributing to Technology Innovation since 1992
Phone: (503) 712-6764
Email: johnathanx.mantey@intel.com <mailto:johnathanx.mantey@intel.com>


--------------9192BDCDC306D2F6729A0ABD
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    I agree with adding this to DBus.<br>
    <br>
    <div class=3D"moz-cite-prefix">On 9/22/19 6:39 PM, Manojkiran Eda
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:OFDC47175F.41C9D828-ON0025847E.0008C328-0025847E.00091D63@not=
es.na.collabserv.com">
      <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DU=
TF-8">
      <div class=3D"socmaildefaultfont" dir=3D"ltr"
        style=3D"font-family:Arial, Helvetica, sans-serif;font-size:10pt"=
>
        <div dir=3D"ltr" style=3D"font-family:Arial, Helvetica,
          sans-serif;font-size:10pt">
          <div dir=3D"ltr">
            <div>Hi All,</div>
            <div>=C2=A0</div>
            <div>This mail is regarding , the proposal for adding an
              additional property `StaticNameservers` and also for
              changing the definition of the existing `Nameservers`
              property.</div>
            <div>=C2=A0</div>
            <div>- Currently, we have a single DBUS property under
              Ethernet interface named `Nameservers` that captures only
              StaticNameservers configured on the system. It does not
              populate the information regarding the DNS information
              that is obtained by DHCP server.</div>
            <div>=C2=A0</div>
            <div>It is also to be noted that the static &amp; dynamic
              configuration can co-exist at the same time(means we might
              have the DNS set manually by user and also by the DHCP
              Server at the same time).</div>
            <div>=C2=A0</div>
            <div>As per the discussion with Ratan &amp;
Wak(<a class=3D"moz-txt-link-freetext" href=3D"https://gerrit.openbmc-pro=
ject.xyz/#/c/openbmc/phosphor-networkd/+/24224/">https://gerrit.openbmc-p=
roject.xyz/#/c/openbmc/phosphor-networkd/+/24224/</a>),we
              had come to a conclusion that we need have two properties
              in the Backend for nameservers (similar to what we have in
              redfish):</div>
            <div>=C2=A0</div>
            <div>1. Nameservers - A read only property which captures
              the current nameservers on the system (which may be static
              or/and dynamic)<br>
              2. StaticNameservers - A writeable property which captures
              only the static nameservers.</div>
            <div>=C2=A0</div>
            <div>Please let me know, if anyone have concerns with this
              proposal.</div>
            <div>=C2=A0</div>
            <div>Thanks,<br>
              Manoj</div>
          </div>
        </div>
      </div>
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

--------------9192BDCDC306D2F6729A0ABD--

--EcfbArWrUqAvAvfF7WrjEqFmT2N8X7ZCn--

--9U2qHcgyB9kpiFdG9kRB8Imr4mx0Bg8fL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEVa822oZtYaVqAzq50EfviT3fHwkFAl2JD1kACgkQ0EfviT3f
HwmJ3Af/fFu0PeA9iIjMtxrkS/6f3XNBADSua/QGDRuQqoxiOO0plznzkC5t3+bU
0oGKN2OE055CH06T1MR5J7EWbJ5EAPCl8WIQTzhlP91UTOIGbDiwTSb1VuZwDL2A
KxYtIU1IV64OZj3522Z/mLLqFcxsejLgyGGEOI+dlbNKwcpy/2Bf8pAHO1PqVEYL
/0IuwgsiHKw7ESDDnG2yyv7cIKIyqZF9qcwdNE9dbvaG4Hhi0MqJNXLNNlhuF0GS
GhaV5YzMYH41AlSRzl6N9hy2zxTWZaiHTe0OdHQvBWizoD1mPyAiSANobZmyCYYv
gcvunM+5UNf/gvdTu9wzyxIvm86Wnw==
=Qufo
-----END PGP SIGNATURE-----

--9U2qHcgyB9kpiFdG9kRB8Imr4mx0Bg8fL--
