Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 504E9E3700
	for <lists+openbmc@lfdr.de>; Thu, 24 Oct 2019 17:49:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zWsF6FS7zDqTZ
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 02:49:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=johnathanx.mantey@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zWrZ3VMrzDqTN
 for <openbmc@lists.ozlabs.org>; Fri, 25 Oct 2019 02:49:11 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Oct 2019 08:49:08 -0700
X-IronPort-AV: E=Sophos;i="5.68,225,1569308400"; 
 d="asc'?scan'208,217";a="192226761"
Received: from jmanteyx-desk.jf.intel.com ([10.54.51.79])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 24 Oct 2019 08:49:08 -0700
Subject: Re: Continuous Integration Build Failures
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Andrew Geissler <geissonator@gmail.com>
References: <1b633df0-8ce7-963c-cb6b-d79ee7d24a9c@intel.com>
 <907DC60D-00EE-403D-82D0-4EFADD245A9D@fuzziesquirrel.com>
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
Message-ID: <b7c8b873-15d8-8e16-eb5d-077bb4f5cc4f@intel.com>
Date: Thu, 24 Oct 2019 08:49:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <907DC60D-00EE-403D-82D0-4EFADD245A9D@fuzziesquirrel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="TM4dk5infl02TbcyAgId3JLw8lyaApeLb"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--TM4dk5infl02TbcyAgId3JLw8lyaApeLb
Content-Type: multipart/mixed; boundary="b17En3q3NB1el9u04w9yc8AaMGOFv1zxs"

--b17En3q3NB1el9u04w9yc8AaMGOFv1zxs
Content-Type: multipart/alternative;
 boundary="------------B5B80DAB92E6C169259C0878"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------B5B80DAB92E6C169259C0878
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Brad,
No I had not seen that doc.=C2=A0 That said, I worked with someone here t=
o
run the CI build locally.=C2=A0 I got the Docker instance to perform a bu=
ild
on the submission that instigated this email trail. The Docker instance
passed on my code changes.=C2=A0 Yet, the upstream Gerrit build does not.=
=C2=A0
Now I don't have logfiles on the upstream Gerrit server to find out
why.=C2=A0 I believe I've done my due diligence for preparing the code fo=
r a
successful build.=C2=A0 At the end of the day the only place that matters=
 for
build success/failure is the upstream system.=C2=A0 As such anything that=
 can
be done to improve that system is, in my opinion, a benefit to the
community.

My specific issue is:
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-networkd/+/24666
I have no idea why this is failing now that the logs have been deleted,
and I can't determine a way to manually start a new build to get logs
without pushing meaningless commits.=C2=A0 I'd rather not waste reviewers=

time having to see email messages about meaningless commits.

On 10/24/19 8:40 AM, Brad Bishop wrote:
>
>> On Oct 24, 2019, at 11:16 AM, Johnathan Mantey <johnathanx.mantey@inte=
l.com> wrote:
>>
>> I would like to propose a change to how the continuous integration sys=
tem works.
>>
>> I understand there are many builds, and there is a lot of data associa=
ted with the builds. Thus the current desire to remove the log file data =
in a short amount of time is a requirement. This works alright when the b=
uild succeeds. It's unhelpful when the build fails. Identifying where the=
 build fails is impossible after approximately an hour. As an ordinary co=
ntributor I don't know how to make the CI system rebuild the source code =
so that the log files are available again without pushing some new change=
 that consists of a useless piece of whitespace (or some other pointless =
change).  It shouldn't be necessary for the contributor to make requests =
for a build restart to the CI maintainers, they have their own agenda.=20
> Are you referring to the bitbake CI jobs or the repository CI jobs?
>
>> Are the maintainers of the CI system willing to make a change that aid=
s in debug?
>>
>> Suggestions:
>> 	=E2=80=A2 Don't delete the log on build fails.
>> 	=E2=80=A2 Delete everything but the log ascii output on build fails.
>> 	=E2=80=A2 Email the ascii logfile for build fails
>> 	=E2=80=A2 Email a compressed debug bundle to the submitter?
>> 	=E2=80=A2 Allow build fails to be restarted by the submitter so the l=
ogs can be regenerated, inspected, and captured.
>> 	=E2=80=A2 other...?
> At first glance these are all good ideas.  Andrew how many of these can=
 Jonathan implement himself and how many of them require access to the Je=
nkins instance?

--=20
Johnathan Mantey
Senior Software Engineer
*azad te**chnology partners*
Contributing to Technology Innovation since 1992
Phone: (503) 712-6764
Email: johnathanx.mantey@intel.com <mailto:johnathanx.mantey@intel.com>


--------------B5B80DAB92E6C169259C0878
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    Brad,<br>
    No I had not seen that doc.=C2=A0 That said, I worked with someone he=
re
    to run the CI build locally.=C2=A0 I got the Docker instance to perfo=
rm a
    build on the submission that instigated this email trail. The Docker
    instance passed on my code changes.=C2=A0 Yet, the upstream Gerrit bu=
ild
    does not.=C2=A0 Now I don't have logfiles on the upstream Gerrit serv=
er
    to find out why.=C2=A0 I believe I've done my due diligence for prepa=
ring
    the code for a successful build.=C2=A0 At the end of the day the only=

    place that matters for build success/failure is the upstream
    system.=C2=A0 As such anything that can be done to improve that syste=
m
    is, in my opinion, a benefit to the community.<br>
    <br>
    My specific issue is:
    <a class=3D"moz-txt-link-freetext" href=3D"https://gerrit.openbmc-pro=
ject.xyz/c/openbmc/phosphor-networkd/+/24666">https://gerrit.openbmc-proj=
ect.xyz/c/openbmc/phosphor-networkd/+/24666</a><br>
    I have no idea why this is failing now that the logs have been
    deleted, and I can't determine a way to manually start a new build
    to get logs without pushing meaningless commits.=C2=A0 I'd rather not=

    waste reviewers time having to see email messages about meaningless
    commits.<br>
    <br>
    <div class=3D"moz-cite-prefix">On 10/24/19 8:40 AM, Brad Bishop wrote=
:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:907DC60D-00EE-403D-82D0-4EFADD245A9D@fuzziesquirrel.com=
">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">On Oct 24, 2019, at 11:16 =
AM, Johnathan Mantey <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:jo=
hnathanx.mantey@intel.com">&lt;johnathanx.mantey@intel.com&gt;</a> wrote:=


I would like to propose a change to how the continuous integration system=
 works.

I understand there are many builds, and there is a lot of data associated=
 with the builds. Thus the current desire to remove the log file data in =
a short amount of time is a requirement. This works alright when the buil=
d succeeds. It's unhelpful when the build fails. Identifying where the bu=
ild fails is impossible after approximately an hour. As an ordinary contr=
ibutor I don't know how to make the CI system rebuild the source code so =
that the log files are available again without pushing some new change th=
at consists of a useless piece of whitespace (or some other pointless cha=
nge).  It shouldn't be necessary for the contributor to make requests for=
 a build restart to the CI maintainers, they have their own agenda.=20
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Are you referring to the bitbake CI jobs or the repository CI jobs?

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
Are the maintainers of the CI system willing to make a change that aids i=
n debug?

Suggestions:
	=E2=80=A2 Don't delete the log on build fails.
	=E2=80=A2 Delete everything but the log ascii output on build fails.
	=E2=80=A2 Email the ascii logfile for build fails
	=E2=80=A2 Email a compressed debug bundle to the submitter?
	=E2=80=A2 Allow build fails to be restarted by the submitter so the logs=
 can be regenerated, inspected, and captured.
	=E2=80=A2 other...?
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
At first glance these are all good ideas.  Andrew how many of these can J=
onathan implement himself and how many of them require access to the Jenk=
ins instance?</pre>
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

--------------B5B80DAB92E6C169259C0878--

--b17En3q3NB1el9u04w9yc8AaMGOFv1zxs--

--TM4dk5infl02TbcyAgId3JLw8lyaApeLb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEVa822oZtYaVqAzq50EfviT3fHwkFAl2xx/AACgkQ0EfviT3f
HwkZHwf/Xn170dNRpy0zFUeD4Tkym9hv4ZIsE3dBKH8XzOz7YNVQJXgJzlmpfEqX
fFPySoD5vfzIDhW2IaBCFWHH7qaSRIGeMQT4Pfu520u0PDZh76oTg1ulqAf+0nU7
I4JGV99xO5nTbJnI9r3Y+Px2XQgtsOBJEjh309QElvpj5wvf5I0thOz0WSmCit9s
G50a3sWhLom/iZzKDVmdvO6pve5Hhdoq+CVNO+baocF5OxzEbIyvxA0CBRnP4UDk
Q8M5+bx6g9Zpwf2j40Idy8q6kM0mcWtra/o43eN97pC/XCWkMxcRQmXGKIHJt08u
lQuSzGAG05Op6Cty8tC/pUP8xULwnw==
=WhLo
-----END PGP SIGNATURE-----

--TM4dk5infl02TbcyAgId3JLw8lyaApeLb--
