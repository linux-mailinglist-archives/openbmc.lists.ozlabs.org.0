Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D68A1ED6E3
	for <lists+openbmc@lfdr.de>; Wed,  3 Jun 2020 21:30:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cfBf0BZRzDqg3
	for <lists+openbmc@lfdr.de>; Thu,  4 Jun 2020 05:30:18 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cdwX01cGzDqc8
 for <openbmc@lists.ozlabs.org>; Thu,  4 Jun 2020 05:18:03 +1000 (AEST)
IronPort-SDR: dAC+ZcI5Xr/SeujRs+gZ9aIvpkEOKyerad4HXydC686Pf6QGPJ9HbT42Y1Xo7SVt9su/69kM2K
 CTIVM4Eu9vEg==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2020 12:18:01 -0700
IronPort-SDR: JrFe8p4hJBfwwYaQSqffIMVXTLoMonP5uNmbydAsNThu7AhBafNiGqNbURn152xqiBf9oaefiq
 mT2llWSknrSw==
X-IronPort-AV: E=Sophos;i="5.73,468,1583222400"; 
 d="asc'?scan'208,217";a="416663414"
Received: from jmanteyx-desk.jf.intel.com ([10.54.51.75])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2020 12:18:01 -0700
Subject: Re: OpenBMC Logging and Error Handling Dos and Don'ts
To: Vijay Khemka <vijaykhemka@fb.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 Patrick Williams <patrick@stwcx.xyz>
References: <4c4aa12b1ffde80ebbf49ad78b6046889f4226c0.camel@fuzziesquirrel.com>
 <CAGm54UGorGfE-0FKj_+o3faU6sO-DW5jRoqPxFzx0VKwuD6Juw@mail.gmail.com>
 <CAPnigKku77Tc60TAAb_yTJaWNePYWM204BF8erJS7CjhxrAPRA@mail.gmail.com>
 <20200602230639.GK17541@heinlein> <20200603000702.GC7478@mauery.jf.intel.com>
 <2673E963-830B-410C-BE4D-18807CDF93F4@fb.com>
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
Message-ID: <41f9a41f-1681-54be-2cb5-dc71e86829f7@intel.com>
Date: Wed, 3 Jun 2020 12:17:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <2673E963-830B-410C-BE4D-18807CDF93F4@fb.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="8TYHAOybLKgCEC8sQBQya8716X6qSYqJj"
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
Cc: openbmc <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>,
 William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--8TYHAOybLKgCEC8sQBQya8716X6qSYqJj
Content-Type: multipart/mixed; boundary="SeuMM4PA3bMcC9Syy3ZvPe1qXQH3h8Bnr"

--SeuMM4PA3bMcC9Syy3ZvPe1qXQH3h8Bnr
Content-Type: multipart/alternative;
 boundary="------------A990DB1B860087A5974EC0F6"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------A990DB1B860087A5974EC0F6
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

I would like it to be easier to determine how to change the error
message level.
I don't bother with the log code because I don't know where it's controll=
ed.

On 6/3/20 12:02 PM, Vijay Khemka wrote:
>
> =EF=BB=BFOn 6/2/20, 5:08 PM, "openbmc on behalf of Vernon Mauery" <open=
bmc-bounces+vijaykhemka=3Dfb.com@lists.ozlabs.org on behalf of vernon.mau=
ery@linux.intel.com> wrote:
>
>     On 02-Jun-2020 06:06 PM, Patrick Williams wrote:
>     >On Mon, Jun 01, 2020 at 11:07:46PM -0700, William Kennington wrote=
:
>     >> If you use the fmt library it would only require one extra tempo=
rary string
>     >> to be constructed and it works trivially with something like pho=
sphor
>     >> logging.
>     >>
>     >> log<level::INFO>(fmt::format("My error: {}", filename));
>     >>
>     >> It also has the advantage of understanding basic c++ types like
>     >> std::strings and std::string_views.
>     >>
>     >> On Mon, Jun 1, 2020 at 8:33 PM =E9=83=81=E9=9B=B7 <yulei.sh@byte=
dance.com> wrote:
>     >>
>     >> > I have a bit concern about this. The existing phosphor-logging=
 API
>     >> > does not support this well.
>     >> > Specifically, it does not support the "printf" way to generate=
 a
>     >> > string with the variables to log.
>     >> > So previously we typically put the variables in entries.
>     >> > I do agree that logging the variables in the MESSAGE field is =
much better.
>     >> > But to encourage such logging, the logging API should be enhan=
ced to
>     >> > support the "printf" way.
>     >> > E.g.
>     >> >     log<level::INFO>("Something is wrong: %s:%d", xx, xxx);
>     >> > is much better than:
>     >> >     std::string to_log =3D xxx; // generate the message manual=
ly
>     >> >     log<level::INFO>(to_log);
>     >> >
>     >> > Otherwise, it's really not convenient to write such logging co=
de.
>     >> >
>     >
>     >Separate from this proposal from Brad, I'd like to work on a
>     >next-generation of phosphor-logging.  When we originally implement=
ed
>     >phosphor-logging we were all pretty new to C++14.  I think there c=
an be
>     >some great improvement in the syntax of phosphor-logging now that =
we
>     >have C++17 (and more experience).
>     >
>     >The biggest change I'd like to do is in the way the structured ent=
ries
>     >are defined, but I think we can improve the verbosity of syntax in=

>     >making a log in general.
>
>     One more change I would like to see is a way to actually have the r=
eal=20
>     filename and line number show up in the systemd log. Right now the =

>     filename and line number are always the logger code:
>         CODE_LINE=3D76
>         CODE_FUNC=3Dhelper_log
>         CODE_FILE=3D.../usr/include/phosphor-logging/log.hpp
>
> It will be good if we can have debug as a level and somehow we can see
> messages from debug by enabling or disabling.
>
>     It looks like C++20 has a shiny new helper for this: source_locatio=
n
>     https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__en.cpprefere=
nce.com_w_cpp_experimental_source-5Flocation&d=3DDwIFaQ&c=3D5VD0RTtNlTh3y=
cd41b3MUw&r=3Dv9MU0Ki9pWnTXCWwjHPVgpnCR80vXkkcrIaqU7USl5g&m=3DqFbu7FdFQSH=
VMy4ZvMtHDH5RzYQnqMUQ_T0h4qL0Xd0&s=3DQRsbQvb4LKAEoa8AITFyPFhcoCSVHtFLMOU6=
6UodPnM&e=3D=20
>
>     --Vernon
>
>     >Some example syntax:
>     >
>     >// Current syntax (and I'm being especially verbose on the namespa=
ces).
>     >phosphor::logging::log<phosphor::logging::level::ERR>("Some messag=
e",
>     >    phosphor::logging::entry("EXAMPLE=3D%s"), example_str);
>     >
>     >// Potential syntax
>     >lg::error("Some message", "EXAMPLE"_s, example_str);
>     >
>     >In a code-review I was on, we had some discussions about how diffi=
cult
>     >it is to create data that isn't in the "-o verbose" and I think Wi=
lliam
>     >and Lei are both referring to that as well.  I am concerned that a=

>     >generic format leads us more to unstructured logging, which person=
ally I
>     >don't like.  My suggestion is that we have some easy syntax to ind=
icate
>     >"also put this structured data into the raw message" so that my ex=
ample
>     >above the message becomes "Some message. EXAMPLE=3D'the string'".
>     >
>     >I'd be interested to hear what "next generation logging" others ha=
ve in
>     >mind.
>     >
>     >--=20
>     >Patrick Williams
>
>
>

--=20
Johnathan Mantey
Senior Software Engineer
*azad te**chnology partners*
Contributing to Technology Innovation since 1992
Phone: (503) 712-6764
Email: johnathanx.mantey@intel.com <mailto:johnathanx.mantey@intel.com>


--------------A990DB1B860087A5974EC0F6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    I would like it to be easier to determine how to change the error
    message level.<br>
    I don't bother with the log code because I don't know where it's
    controlled.<br>
    <br>
    <div class=3D"moz-cite-prefix">On 6/3/20 12:02 PM, Vijay Khemka wrote=
:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:2673E963-830B-410C-BE4D-18807CDF93F4@fb.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

=EF=BB=BFOn 6/2/20, 5:08 PM, "openbmc on behalf of Vernon Mauery" <a clas=
s=3D"moz-txt-link-rfc2396E" href=3D"mailto:openbmc-bounces+vijaykhemka=3D=
fb.com@lists.ozlabs.orgonbehalfofvernon.mauery@linux.intel.com">&lt;openb=
mc-bounces+vijaykhemka=3Dfb.com@lists.ozlabs.org on behalf of vernon.maue=
ry@linux.intel.com&gt;</a> wrote:

    On 02-Jun-2020 06:06 PM, Patrick Williams wrote:
    &gt;On Mon, Jun 01, 2020 at 11:07:46PM -0700, William Kennington wrot=
e:
    &gt;&gt; If you use the fmt library it would only require one extra t=
emporary string
    &gt;&gt; to be constructed and it works trivially with something like=
 phosphor
    &gt;&gt; logging.
    &gt;&gt;
    &gt;&gt; log&lt;level::INFO&gt;(fmt::format("My error: {}", filename)=
);
    &gt;&gt;
    &gt;&gt; It also has the advantage of understanding basic c++ types l=
ike
    &gt;&gt; std::strings and std::string_views.
    &gt;&gt;
    &gt;&gt; On Mon, Jun 1, 2020 at 8:33 PM =E9=83=81=E9=9B=B7 <a class=3D=
"moz-txt-link-rfc2396E" href=3D"mailto:yulei.sh@bytedance.com">&lt;yulei.=
sh@bytedance.com&gt;</a> wrote:
    &gt;&gt;
    &gt;&gt; &gt; I have a bit concern about this. The existing phosphor-=
logging API
    &gt;&gt; &gt; does not support this well.
    &gt;&gt; &gt; Specifically, it does not support the "printf" way to g=
enerate a
    &gt;&gt; &gt; string with the variables to log.
    &gt;&gt; &gt; So previously we typically put the variables in entries=
=2E
    &gt;&gt; &gt; I do agree that logging the variables in the MESSAGE fi=
eld is much better.
    &gt;&gt; &gt; But to encourage such logging, the logging API should b=
e enhanced to
    &gt;&gt; &gt; support the "printf" way.
    &gt;&gt; &gt; E.g.
    &gt;&gt; &gt;     log&lt;level::INFO&gt;("Something is wrong: %s:%d",=
 xx, xxx);
    &gt;&gt; &gt; is much better than:
    &gt;&gt; &gt;     std::string to_log =3D xxx; // generate the message=
 manually
    &gt;&gt; &gt;     log&lt;level::INFO&gt;(to_log);
    &gt;&gt; &gt;
    &gt;&gt; &gt; Otherwise, it's really not convenient to write such log=
ging code.
    &gt;&gt; &gt;
    &gt;
    &gt;Separate from this proposal from Brad, I'd like to work on a
    &gt;next-generation of phosphor-logging.  When we originally implemen=
ted
    &gt;phosphor-logging we were all pretty new to C++14.  I think there =
can be
    &gt;some great improvement in the syntax of phosphor-logging now that=
 we
    &gt;have C++17 (and more experience).
    &gt;
    &gt;The biggest change I'd like to do is in the way the structured en=
tries
    &gt;are defined, but I think we can improve the verbosity of syntax i=
n
    &gt;making a log in general.

    One more change I would like to see is a way to actually have the rea=
l=20
    filename and line number show up in the systemd log. Right now the=20
    filename and line number are always the logger code:
        CODE_LINE=3D76
        CODE_FUNC=3Dhelper_log
        CODE_FILE=3D.../usr/include/phosphor-logging/log.hpp

It will be good if we can have debug as a level and somehow we can see
messages from debug by enabling or disabling.

    It looks like C++20 has a shiny new helper for this: source_location
    <a class=3D"moz-txt-link-freetext" href=3D"https://urldefense.proofpo=
int.com/v2/url?u=3Dhttps-3A__en.cppreference.com_w_cpp_experimental_sourc=
e-5Flocation&amp;d=3DDwIFaQ&amp;c=3D5VD0RTtNlTh3ycd41b3MUw&amp;r=3Dv9MU0K=
i9pWnTXCWwjHPVgpnCR80vXkkcrIaqU7USl5g&amp;m=3DqFbu7FdFQSHVMy4ZvMtHDH5RzYQ=
nqMUQ_T0h4qL0Xd0&amp;s=3DQRsbQvb4LKAEoa8AITFyPFhcoCSVHtFLMOU66UodPnM&amp;=
e=3D">https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__en.cpprefere=
nce.com_w_cpp_experimental_source-5Flocation&amp;d=3DDwIFaQ&amp;c=3D5VD0R=
TtNlTh3ycd41b3MUw&amp;r=3Dv9MU0Ki9pWnTXCWwjHPVgpnCR80vXkkcrIaqU7USl5g&amp=
;m=3DqFbu7FdFQSHVMy4ZvMtHDH5RzYQnqMUQ_T0h4qL0Xd0&amp;s=3DQRsbQvb4LKAEoa8A=
ITFyPFhcoCSVHtFLMOU66UodPnM&amp;e=3D</a>=20

    --Vernon

    &gt;Some example syntax:
    &gt;
    &gt;// Current syntax (and I'm being especially verbose on the namesp=
aces).
    &gt;phosphor::logging::log&lt;phosphor::logging::level::ERR&gt;("Some=
 message",
    &gt;    phosphor::logging::entry("EXAMPLE=3D%s"), example_str);
    &gt;
    &gt;// Potential syntax
    &gt;lg::error("Some message", "EXAMPLE"_s, example_str);
    &gt;
    &gt;In a code-review I was on, we had some discussions about how diff=
icult
    &gt;it is to create data that isn't in the "-o verbose" and I think W=
illiam
    &gt;and Lei are both referring to that as well.  I am concerned that =
a
    &gt;generic format leads us more to unstructured logging, which perso=
nally I
    &gt;don't like.  My suggestion is that we have some easy syntax to in=
dicate
    &gt;"also put this structured data into the raw message" so that my e=
xample
    &gt;above the message becomes "Some message. EXAMPLE=3D'the string'".=

    &gt;
    &gt;I'd be interested to hear what "next generation logging" others h=
ave in
    &gt;mind.
    &gt;
    &gt;--=20
    &gt;Patrick Williams



</pre>
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

--------------A990DB1B860087A5974EC0F6--

--SeuMM4PA3bMcC9Syy3ZvPe1qXQH3h8Bnr--

--8TYHAOybLKgCEC8sQBQya8716X6qSYqJj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEVa822oZtYaVqAzq50EfviT3fHwkFAl7X92EACgkQ0EfviT3f
HwmKrAf6AjcnW89aPxB6iObQsnPn0bXDlUY9sh0CxPmUKLVXh2IeHjGAPwj48KRI
bUJOXhfbmmwodC4wg4HdiTwaX7P5cyG3pC3f9lKIUywEtlH7eOLh8DAvZXefMOIQ
/kB5QOHsybitEglyItAnhHdPiXaYSjfD6iRfKVMboHtCctQ6w245YzuBEocnEfVi
TSBWwkHeP0i+XKXXf3k3Dl3Or2YGE47ynlDq+uODRnX/KxotkvJoYABtZ7Phs+Rv
R/h8Kruq3Bld9S/7iQUCiDTxCIvco/BDR+QBSvx9ZQCiVercMuhFchqeeP2n4mf+
nu0znDql+NVzd371LVmu+CqQBzg2fw==
=vJTv
-----END PGP SIGNATURE-----

--8TYHAOybLKgCEC8sQBQya8716X6qSYqJj--
