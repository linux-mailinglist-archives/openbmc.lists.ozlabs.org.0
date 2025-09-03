Return-Path: <openbmc+bounces-578-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C9CB420AA
	for <lists+openbmc@lfdr.de>; Wed,  3 Sep 2025 15:15:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cH34f5dsnz2xQ0;
	Wed,  3 Sep 2025 23:15:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=162.0.218.231
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756905314;
	cv=none; b=B43/WVpXY+aHPiZvY8jRA+j6Rg+uvc5V1oBK9NMvDw0aRvOi3ZFeLA3WXule6Tbuyqf/5p1LLVbdRFO0Zpbt8W+1IfWsJ/CD66/zy8J1GYp/kxQtzPYdNzhbKTB+L8iQPoCgxGX536aReF3p8pdLjGGywqx9oM6Rd9nDUIS3PUZKbspE1YBLV61UQYK9FTaZDvi2ZxKDfpytWhm4/4IdOQaeoaECufSEmdJ7nE2+9dD1gYPw6uEP3zcN3UJ/57wwrDoFT6PsW/7b5leyEpdhi69+5ZDfbmfPQq3wvK+wI1H/BLd00uST+CNcDwul5pi0gOrorJoe3r0ZygujRQZa1g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756905314; c=relaxed/relaxed;
	bh=ptCq0ROyBCwAoyrWeTrE2w71aLEbbiqCpSjzXnAdBSM=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=MaeVHWZF25W0HZX4K85BUDR6WVFej/bEv8TQ73PUNKlAhDVC36NusFFiXLggDFL9cah0TNAoEyjhI6Bxfw6A9QBYSJosYaAagklMurJry8TJ86pE2p3qUDzRkMLief096jnheNTYAn8wXKEyqFFaswkaovBNIisu2JME+ujevBonCEhzkOZsHds3JPbfKXquV0yU8eEMWc8317tsX25cWtLiUIliybv15vaZfiyDm0Tfr/JYLv3m7d725D1NpXf9wP7HWh12IccX7NDss2cU1r7kHypL9W/9fUqsFC7WGPUTvi08GQpwxLrX38bE8ljd/BDLXM/e/CY4u9OduNvREQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=gmills.xyz; dkim=pass (2048-bit key; unprotected) header.d=gmills.xyz header.i=@gmills.xyz header.a=rsa-sha256 header.s=default header.b=Wq0HtOcG; dkim-atps=neutral; spf=pass (client-ip=162.0.218.231; helo=h8.fbrelay.privateemail.com; envelope-from=gunnar@gmills.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=gmills.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=gmills.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmills.xyz header.i=@gmills.xyz header.a=rsa-sha256 header.s=default header.b=Wq0HtOcG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmills.xyz (client-ip=162.0.218.231; helo=h8.fbrelay.privateemail.com; envelope-from=gunnar@gmills.xyz; receiver=lists.ozlabs.org)
X-Greylist: delayed 666 seconds by postgrey-1.37 at boromir; Wed, 03 Sep 2025 23:15:11 AEST
Received: from h8.fbrelay.privateemail.com (h8.fbrelay.privateemail.com [162.0.218.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cH34b51y3z2xHY
	for <openbmc@lists.ozlabs.org>; Wed,  3 Sep 2025 23:15:11 +1000 (AEST)
Received: from MTA-06-4.privateemail.com (mta-06.privateemail.com [198.54.118.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by h7.fbrelay.privateemail.com (Postfix) with ESMTPSA id 4cH2qd6c9Kz2xbW
	for <openbmc@lists.ozlabs.org>; Wed,  3 Sep 2025 09:03:57 -0400 (EDT)
Received: from mta-06.privateemail.com (localhost [127.0.0.1])
	by mta-06.privateemail.com (Postfix) with ESMTP id 4cH2qW6r2kz3hhRt;
	Wed,  3 Sep 2025 09:03:51 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=gmills.xyz; s=default;
	t=1756904632; bh=dEIjEQd8ZmstFZrF+1JLB3ZQyXnIT0rHh/HhPEYD8XM=;
	h=Date:From:To:In-Reply-To:References:Subject:From;
	b=Wq0HtOcGPy1vwpmLZj4ttgwAQ2JtkPTOtgCTnQrEraHwhwzG7WF8SPDHdGNwO/1Ia
	 +U8iHpDvoynJ76IBU7B9CR1G99ngc7ZB+yU4cmMbffcMM2RDreQadVjhCoSelwv7+V
	 xYsplBS+X9oDAP+suJHy8PBCwwJg8wTqXOsv/bcAYy79wSlSiBODoijJkSepRpJQIY
	 u1Ia15UnkXIWS3j7vcdiKItmllfhJfApgcrFiOtijOCWGgElmCE3EWLJlQJvjLVD83
	 ALWLQrHMB3bDA8svCGjOKfnRsUFEo0u+lbFcvAb1MfHEYywP3nr832fNoQXjyADQ7p
	 YQvrazyWcA8ew==
Received: from APP-03 (unknown [10.50.14.153])
	by mta-06.privateemail.com (Postfix) with ESMTPA;
	Wed,  3 Sep 2025 09:03:49 -0400 (EDT)
Date: Wed, 3 Sep 2025 07:03:49 -0600 (MDT)
From: Gunnar M <gunnar@gmills.xyz>
To: Sridevi Ramesh <sridevra@in.ibm.com>,
	Patrick Williams <patrick@stwcx.xyz>,
	OpenBMC List <openbmc@lists.ozlabs.org>
Message-ID: <47229775.2248000.1756904629730@privateemail.com>
In-Reply-To: <SJ4PPFB81778326B86AFDA80C5BC46671E8F601A@SJ4PPFB81778326.namprd15.prod.outlook.com>
References: <aKOKlY97pOtfuaEv@heinlein> <aLek2wDSYDGMLPH6@heinlein>
 <SJ4PPFB81778326B86AFDA80C5BC46671E8F601A@SJ4PPFB81778326.namprd15.prod.outlook.com>
Subject: RE: TOF elections for 2025H2
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_2247999_145447255.1756904629726"
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.6-Rev81
X-Originating-Client: open-xchange-appsuite
X-Virus-Scanned: ClamAV using ClamSMTP
X-Spam-Status: No, score=2.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,HTML_MESSAGE,
	PDS_OTHER_BAD_TLD,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

------=_Part_2247999_145447255.1756904629726
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

=20

> On 09/03/2025 12:34 AM MDT Sridevi Ramesh <sridevra@in.ibm.com> wrote:
> =20
> =20
> Hi,
> =20
> I would like to vote for Manoj and Andrew G
> =20
> Regards,
> Sridevi.R
>=20
Please follow the steps below and create a Pull-Request to submit your vote=
.

Thx,
Gunnar
=20
=20

> =20
> On 03/09/25, 7:46=E2=80=AFAM, "Patrick Williams" <patrick@stwcx.xyz> wrot=
e:
>=20
> Greetings,
> =20
> For the TOF elections this half, we had 4 qualified individuals
> nominated and there are 3 seats expiring.  Therefore, we are going to
> have to hold an election for the half.
> =20
> Per the TOF election rules[1] (with minor date adjustments):
>     - The election will begin on Sept 3rd, 2025.
>     - The election will conclude on Sept 10th, 2025 (*).
>     - The election will be by Ranked Choice Voting of qualified OpenBMC
>       developers.
> =20
> For refreshment, you are considered "qualified" if your Github user ID
> is found at the rollcall[2].
> =20
> The 4 nominated developers are (alphabetical by Github IDs):
>     * dkodihal:         Deepak Kodihalli
>     * edtanous:         Ed Tanous
>     * geissonator:      Andrew Geissler
>     * manojkiraneda:    ManojKiran Eda
> =20
> I'll again say this is a Ranked Choice Voting.  That means you should
> ideally vote for at least 3 individuals, in the order of your
> preference[3].
> =20
> As with the last election, we have a tool to facilitate voting[4].  You a=
re
> expected to fork the Github repository, run the tool, commit the
> resulting JSON file, and create a Pull-Request to submit your vote.
> =20
> If you have the `gh` tool this would be as follows:
> ```
> gh repo fork --clone openbmc/tof-election
> cd tof-election
> ./vote --user <github-id>
> # make your selections with 'vote N', 'save', 'quit'
> git add 2025H2/votes/<github-id>.json
> git commit -s -m "2025H2: <github-id>: add vote"
> git push origin
> gh pr create
> ```
> =20
> If you don't use the `gh` tool hopefully you know the equivalent
> git-commands / github webui operations.
> =20
> Please reach out either by email or in #tsc-and-tof in Discord if you
> have trouble voting.
> =20
> (*) - Since the election rules do not specify a timezone for the
>       election, please submit your vote/PR by 23:59:59 Samoa Standard
>       Time (SST).
> =20
> [1]: https://github.com/openbmc/docs/blob/master/tof/membership-and-votin=
g.md#terms-and-elections https://github.com/openbmc/docs/blob/master/tof/me=
mbership-and-voting.md#terms-and-elections
> [2]: https://github.com/openbmc/tof-election/blob/main/2025H2/rollcall.js=
on https://github.com/openbmc/tof-election/blob/main/2025H2/rollcall.json
> [3]: https://en.wikipedia.org/wiki/Instant-runoff_voting https://en.wikip=
edia.org/wiki/Instant-runoff_voting
> [4]: https://github.com/openbmc/tof-election https://github.com/openbmc/t=
of-election
> =20
> --
> Patrick Williams
> =20
>=20

------=_Part_2247999_145447255.1756904629726
MIME-Version: 1.0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!doctype html>
<html>
 <head>=20
  <meta charset=3D"UTF-8">=20
 </head>
 <body>
  <div>
   &nbsp;
  </div>=20
  <blockquote type=3D"cite">=20
   <div>
    On 09/03/2025 12:34 AM MDT Sridevi Ramesh &lt;sridevra@in.ibm.com&gt; w=
rote:
   </div>=20
   <div>
    &nbsp;
   </div>=20
   <div>
    &nbsp;
   </div>=20
   <div dir=3D"ltr" style=3D"font-family: Aptos, Arial, Helvetica, sans-ser=
if; font-size: 12pt; color: #000000;">
    Hi,
   </div>=20
   <div dir=3D"ltr" style=3D"font-family: Aptos, Arial, Helvetica, sans-ser=
if; font-size: 12pt; color: #000000;">
    &nbsp;
   </div>=20
   <div dir=3D"ltr">
    <span style=3D"font-family: Aptos, Arial, Helvetica, sans-serif; font-s=
ize: 12pt; color: #000000;">I would like to vote for </span><span style=3D"=
font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size:=
 15px; color: #1d1c1d; background-color: #f8f8f8;">Manoj and Andrew G</span=
>
   </div>=20
   <div dir=3D"ltr" style=3D"font-family: Aptos, Arial, Helvetica, sans-ser=
if; font-size: 12pt; color: #000000;">
    &nbsp;
   </div>=20
   <div dir=3D"ltr" style=3D"font-family: Aptos, Arial, Helvetica, sans-ser=
if; font-size: 12pt; color: #000000;">
    Regards,
   </div>=20
   <div dir=3D"ltr" style=3D"font-family: Aptos, Arial, Helvetica, sans-ser=
if; font-size: 12pt; color: #000000;">
    Sridevi.R
   </div>=20
  </blockquote>=20
  <div>
   Please follow the steps below and create a Pull-Request to submit your v=
ote.
   <br>
   <br>Thx,
   <br>Gunnar
  </div>=20
  <div class=3D"default-style">
   &nbsp;
  </div>=20
  <div class=3D"default-style">
   &nbsp;
  </div>=20
  <blockquote type=3D"cite">=20
   <div dir=3D"ltr" style=3D"font-family: Aptos, Arial, Helvetica, sans-ser=
if; font-size: 12pt; color: #000000;">
    &nbsp;
   </div> On 03/09/25, 7:46=E2=80=AFAM, "Patrick Williams" &lt;patrick@stwc=
x.xyz&gt; wrote:
   <br>
   <br>=20
   <div>
    Greetings,
   </div>=20
   <div dir=3D"ltr">
    &nbsp;
   </div>=20
   <div>
    For the TOF elections this half, we had 4 qualified individuals
   </div>=20
   <div>
    nominated and there are 3 seats expiring.&nbsp;&nbsp;Therefore, we are =
going to
   </div>=20
   <div>
    have to hold an election for the half.
   </div>=20
   <div dir=3D"ltr">
    &nbsp;
   </div>=20
   <div>
    Per the TOF election rules[1] (with minor date adjustments):
   </div>=20
   <div>
    &nbsp;&nbsp;&nbsp;&nbsp;- The election will begin on Sept 3rd, 2025.
   </div>=20
   <div>
    &nbsp;&nbsp;&nbsp;&nbsp;- The election will conclude on Sept 10th, 2025=
 (*).
   </div>=20
   <div>
    &nbsp;&nbsp;&nbsp;&nbsp;- The election will be by Ranked Choice Voting =
of qualified OpenBMC
   </div>=20
   <div>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;developers.
   </div>=20
   <div dir=3D"ltr">
    &nbsp;
   </div>=20
   <div>
    For refreshment, you are considered "qualified" if your Github user ID
   </div>=20
   <div>
    is found at the rollcall[2].
   </div>=20
   <div dir=3D"ltr">
    &nbsp;
   </div>=20
   <div>
    The 4 nominated developers are (alphabetical by Github IDs):
   </div>=20
   <div>
    &nbsp;&nbsp;&nbsp;&nbsp;* dkodihal:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; Deepak Kodihalli
   </div>=20
   <div>
    &nbsp;&nbsp;&nbsp;&nbsp;* edtanous:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; Ed Tanous
   </div>=20
   <div>
    &nbsp;&nbsp;&nbsp;&nbsp;* geissonator:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;Andrew Geissler
   </div>=20
   <div>
    &nbsp;&nbsp;&nbsp;&nbsp;* manojkiraneda:&nbsp;&nbsp;&nbsp;&nbsp;ManojKi=
ran Eda
   </div>=20
   <div dir=3D"ltr">
    &nbsp;
   </div>=20
   <div>
    I'll again say this is a Ranked Choice Voting.&nbsp;&nbsp;That means yo=
u should
   </div>=20
   <div>
    ideally vote for at least 3 individuals, in the order of your
   </div>=20
   <div>
    preference[3].
   </div>=20
   <div dir=3D"ltr">
    &nbsp;
   </div>=20
   <div>
    As with the last election, we have a tool to facilitate voting[4].&nbsp=
;&nbsp;You are
   </div>=20
   <div>
    expected to fork the Github repository, run the tool, commit the
   </div>=20
   <div>
    resulting JSON file, and create a Pull-Request to submit your vote.
   </div>=20
   <div dir=3D"ltr">
    &nbsp;
   </div>=20
   <div>
    If you have the `gh` tool this would be as follows:
   </div>=20
   <div>
    ```
   </div>=20
   <div>
    gh repo fork --clone openbmc/tof-election
   </div>=20
   <div>
    cd tof-election
   </div>=20
   <div>
    ./vote --user &lt;github-id&gt;
   </div>=20
   <div>
    # make your selections with 'vote N', 'save', 'quit'
   </div>=20
   <div>
    git add 2025H2/votes/&lt;github-id&gt;.json
   </div>=20
   <div>
    git commit -s -m "2025H2: &lt;github-id&gt;: add vote"
   </div>=20
   <div>
    git push origin
   </div>=20
   <div>
    gh pr create
   </div>=20
   <div>
    ```
   </div>=20
   <div dir=3D"ltr">
    &nbsp;
   </div>=20
   <div>
    If you don't use the `gh` tool hopefully you know the equivalent
   </div>=20
   <div>
    git-commands / github webui operations.
   </div>=20
   <div dir=3D"ltr">
    &nbsp;
   </div>=20
   <div>
    Please reach out either by email or in #tsc-and-tof in Discord if you
   </div>=20
   <div>
    have trouble voting.
   </div>=20
   <div dir=3D"ltr">
    &nbsp;
   </div>=20
   <div>
    (*) - Since the election rules do not specify a timezone for the
   </div>=20
   <div>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;election, please submit your vote/P=
R by 23:59:59 Samoa Standard
   </div>=20
   <div>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Time (SST).
   </div>=20
   <div dir=3D"ltr">
    &nbsp;
   </div>=20
   <div>
    [1]: <a href=3D"https://github.com/openbmc/docs/blob/master/tof/members=
hip-and-voting.md#terms-and-elections" data-outlook-id=3D"4d82eec6-a2d5-442=
3-bd7b-b0db7be0965a"> https://github.com/openbmc/docs/blob/master/tof/membe=
rship-and-voting.md#terms-and-elections</a>
   </div>=20
   <div>
    [2]: <a href=3D"https://github.com/openbmc/tof-election/blob/main/2025H=
2/rollcall.json" data-outlook-id=3D"5f9796ac-f9cc-4144-ac1b-2f48af574ac4"> =
https://github.com/openbmc/tof-election/blob/main/2025H2/rollcall.json</a>
   </div>=20
   <div>
    [3]: <a href=3D"https://en.wikipedia.org/wiki/Instant-runoff_voting" da=
ta-outlook-id=3D"0516e3e1-e624-440d-8626-b359d675f145"> https://en.wikipedi=
a.org/wiki/Instant-runoff_voting</a>
   </div>=20
   <div>
    [4]: <a href=3D"https://github.com/openbmc/tof-election" data-outlook-i=
d=3D"e196a29b-44c1-4236-885c-1ea39dc8acae"> https://github.com/openbmc/tof-=
election</a>
   </div>=20
   <div dir=3D"ltr">
    &nbsp;
   </div>=20
   <div>
    --
   </div>=20
   <div>
    Patrick Williams
   </div>=20
   <div dir=3D"ltr">
    &nbsp;
   </div>=20
  </blockquote>
 </body>
</html>
------=_Part_2247999_145447255.1756904629726--

