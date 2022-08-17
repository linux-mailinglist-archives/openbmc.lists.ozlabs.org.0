Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 393C6597AC9
	for <lists+openbmc@lfdr.de>; Thu, 18 Aug 2022 02:59:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7RNL02yRz3c2R
	for <lists+openbmc@lfdr.de>; Thu, 18 Aug 2022 10:58:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mkdvNylI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com; envelope-from=nicholas.rivers1984@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mkdvNylI;
	dkim-atps=neutral
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7Ffs5M3xz2xn8
	for <openbmc@lists.ozlabs.org>; Thu, 18 Aug 2022 03:40:51 +1000 (AEST)
Received: by mail-lj1-x230.google.com with SMTP id by6so14207636ljb.11
        for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2022 10:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=MqEdZEAcNEcvt4tNR1LvhqxJ2DOVjTx+2LUzFaEzQrA=;
        b=mkdvNylIKY2EgrDC419JYSnxXITStNdd8wCPdKCX4QiO8cvax6q/8UuzHoBQRIKAOr
         buEOtHr0z06Y4Hj2JygvWGc4pKUeZJXenSE3S7rt8FwIX9SJF785efldefzeGQ4TYxSF
         obp9pyL/qxFOQkbx5W1Ss08OVf2emDtb1FPR2TMVQ+CzNAWLcZbzAHzVU+Ge/7P07xQO
         Kv/y8MOcqf1/oyAKQufP8L+CFPnLszS1vUHBGgSlrc4fOTcm9XCNCf5s82MCCHu67kow
         t4gh9mCKvLXEN4b9noTeQi4ch5BKQb5KnbEZ3URZn70DC+iJMdbg3/wxTJL1lkyqVnuD
         PZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=MqEdZEAcNEcvt4tNR1LvhqxJ2DOVjTx+2LUzFaEzQrA=;
        b=mKT/rNVnyOCqLBEgXMs09xWQ4jCXvWhtb1pn8hAE8NIT+14+36cOTaWEriUGGsXMgB
         5WrK9qmviiIv5m0Y6b4CN0HSNgTuxm7kn2RASirBnLAjEv1StTnAcFMemJnNr2+9WShm
         6po/PvhI5aaLFnDMTJLsipq5I6mACOHLacjRJoLf8t++3ZoCv3pa6Wjx0yGN+bcJnF6H
         EXHAYF7Jx4dmGpP6jtW2e4qzqMgyBDs0GRdzW88QXKn5QfF9o2Cboc6pk6QCe7/5tEW1
         PLZkCixglN19NnOZ6aMp+5/8cydurCUsp8I5NUCMdjx9iXluTRWKUmLX4RW3QUEXJz9d
         D8oA==
X-Gm-Message-State: ACgBeo0ZvBMGXwSwYojZT2vmh+ZggXF0Uy1FaiJO7mtmpgzHMBEU/9t1
	tvFH+NkaZRzAf/Ek4+MG7UNm/iTtuOQHDNH42y0=
X-Google-Smtp-Source: AA6agR6j0t5mfImXYGmTkr2+gpK43uXTNQ88c2wkdq4DcZZ5u/TFLiDgOyNw2IHx7fatUjVXCIac6oCvL/4mk/u706g=
X-Received: by 2002:a2e:a0d1:0:b0:25e:7518:a02c with SMTP id
 f17-20020a2ea0d1000000b0025e7518a02cmr8503373ljm.370.1660758044397; Wed, 17
 Aug 2022 10:40:44 -0700 (PDT)
MIME-Version: 1.0
From: Nick Rivers <nicholas.rivers1984@gmail.com>
Date: Wed, 17 Aug 2022 10:40:33 -0700
Message-ID: <CAHzptbLV=Fzo+FSC-PWkemMNHcPWCF2Hd8FOzMTzPX5MdtYtvw@mail.gmail.com>
Subject: Re: Security Working Group meeting - Wednesday August 17
To: bradleyb@fuzziesquirrel.com, jrey@linux.ibm.com, andrew@aj.id.au, 
	openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000004b53da05e6735ded"
X-Mailman-Approved-At: Thu, 18 Aug 2022 10:58:39 +1000
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

--0000000000004b53da05e6735ded
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 8/17/2022 09:57, Brad Bishop wrote:
> On Wed, 2022-08-17 at 11:13 -0500, Joseph Reynolds wrote:
>> On 8/17/22 12:11 AM, Andrew Jeffery wrote:
>>>
>>> On Wed, 17 Aug 2022, at 12:37, Joseph Reynolds wrote:
>>>> This is a reminder of the OpenBMC Security Working Group meeting
>>>> scheduled for this Wednesday August 17 at 10:00am PDT.
>>> Given the discussion from last meeting, is this on Discord?
>>
>> No.  The meeting access for Aug 17 is the same as before:
>> https://ibm.webex.com/meet/joseph.reynolds1
>>
>> I wanted to give a couple of weeks notice (A) for attendees to firm up
>> any objections to moving
>
> Injecting my opinions in case they are helpful...but probably not =F0=9F=
=A4=A3
>
> I likely sound clich=C3=A9 but someone will always be unhappy with every
> decision, including this one. As the WG host, have -you- been convinced
> that improved collalboration between the security working group and the
> developer community is worthwhile, and that moving to Discord will
> improve that? If so - go for it!
>
> People were (and still are) opposed to moving from IRC to Discord, but
> we now have 500 people on our server and levels of collaboration in the
> developer community never before seen in OpenBMC...
>
Thus not really supporting diverse and inclusive workplace thinking.And
encouraging fit "The Organization's Model" with little room for those who
do not fit "The Organization's Model".I agree that utopia is not achievable=
.

--0000000000004b53da05e6735ded
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail-moz-cite-prefix">On 8/17/202=
2 09:57, Brad Bishop wrote:<br></div>
<span style=3D"white-space:pre-wrap;display:block;width:98vw">&gt; On Wed, =
2022-08-17 at 11:13 -0500, Joseph Reynolds wrote:<br>&gt;&gt; On 8/17/22 12=
:11 AM, Andrew Jeffery wrote:<br>&gt;&gt;&gt;<br>&gt;&gt;&gt; On Wed, 17 Au=
g 2022, at 12:37, Joseph Reynolds wrote:<br>&gt;&gt;&gt;&gt; This is a remi=
nder of the OpenBMC Security Working Group meeting<br>&gt;&gt;&gt;&gt; sche=
duled for this Wednesday August 17 at 10:00am PDT.<br>&gt;&gt;&gt; Given th=
e discussion from last meeting, is this on Discord?<br>&gt;&gt;<br>&gt;&gt;=
 No.=C2=A0 The meeting access for Aug 17 is the same as before:<br>&gt;&gt;=
 <a href=3D"https://ibm.webex.com/meet/joseph.reynolds1">https://ibm.webex.=
com/meet/joseph.reynolds1</a><br>&gt;&gt;<br>&gt;&gt; I wanted to give a co=
uple of weeks notice (A) for attendees to firm up<br>&gt;&gt; any objection=
s to moving<br>&gt; <br>&gt; Injecting my opinions in case they are helpful=
...but probably not =F0=9F=A4=A3<br>&gt; <br>&gt; I likely sound clich=C3=
=A9 but someone will always be unhappy with every<br>&gt; decision, includi=
ng this one.  As the WG host, have -you- been convinced<br>&gt; that improv=
ed collalboration between the security working group and the<br>&gt; develo=
per community is worthwhile, and that moving to Discord will<br>&gt; improv=
e that?  If so - go for it!<br>&gt; <br>&gt; People were (and still are) op=
posed to moving from IRC to Discord, but<br>&gt; we now have 500 people on =
our server and levels of collaboration in the<br>&gt; developer community n=
ever before seen in OpenBMC...<br>&gt; </span><span style=3D"white-space:pr=
e-wrap;display:block;width:98vw"><br></span><span style=3D"white-space:pre-=
wrap;display:block;width:98vw">Thus not really supporting diverse and inclu=
sive workplace thinking.</span><span style=3D"white-space:pre-wrap;display:=
block;width:98vw">And encouraging fit &quot;The Organization&#39;s Model&qu=
ot; with little room for those who do not fit &quot;The Organization&#39;s =
Model&quot;.</span><span style=3D"white-space:pre-wrap;display:block;width:=
98vw">I agree that utopia is not achievable.</span><span style=3D"white-spa=
ce:pre-wrap;display:block;width:98vw"><br></span><span style=3D"white-space=
:pre-wrap;display:block;width:98vw"><br></span></div></div></div></div></di=
v></div>

--0000000000004b53da05e6735ded--
