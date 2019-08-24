Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 067369BAC8
	for <lists+openbmc@lfdr.de>; Sat, 24 Aug 2019 03:59:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46FhKD5bddzDvrF
	for <lists+openbmc@lfdr.de>; Sat, 24 Aug 2019 11:59:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=yuenn@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="TLEvn6DR"; 
 dkim-atps=neutral
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46FhJT3G8xzDrD2
 for <openbmc@lists.ozlabs.org>; Sat, 24 Aug 2019 11:58:46 +1000 (AEST)
Received: by mail-io1-xd32.google.com with SMTP id x4so24270056iog.13
 for <openbmc@lists.ozlabs.org>; Fri, 23 Aug 2019 18:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RzMIc7ollaI/4Nb1OhF5G6r24/MRq9mk9A38B1eDGHU=;
 b=TLEvn6DRG9Qk4M+5aPEWoDLtxZwbZRpnzUgvkPlRrh14q2fB8xFZ+gOcvJ84diX9Gh
 PrAqfMel4gAZJZyzfbV4hgc84cDcTWoFYl4xzR9Q1hseR+MvdFwd6dcJVGlwo7uhB7Jb
 FpSoqL0RsiMp9qguB/GB339DspY+ZKN/4ZuHyyGbM44cDFXZ9l2j1IrBroN/EKwzH3+3
 1Eb1mfuOhKauvnAjqsHKi//cy3Egad0/+VVPmurovWgUo3OcAFgyLBb7IZBYxXeMeE96
 U4luZDUaBvTOdPHQWknCv0Pbk3it+SLMnTPqBse+qgwKU5tUr3bOYn1fgKXWJ+y+2GPU
 JpyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RzMIc7ollaI/4Nb1OhF5G6r24/MRq9mk9A38B1eDGHU=;
 b=CccCGcGZtSskJSkOG4N9sjD2Lxa60h6SX1Udj+oGaZ48Y72W9iq4rh5Vh6fNnXoom7
 WEmEafxOQOTSmqQP9UDmXWaX/O/cUI9jrUggyJKwlYp8DDLW6utec7l45Y9WclgAb3dT
 I6j2nRYQMgxHo4zi/rcLTzLRriA80W4Ks7A2JbEYeUdgRRJ7KFwygAxYjzkz6cCbvsNt
 tsQP9+3pUieYU2nxYglwhh/YMV94jsfZje5SnFO1peNRS6zzNJdYZluyvYuTUeeWQScE
 phI4syN8SylmsW0EXqGCr4SMMUL4vQTBQhNGbUsj9VFzCJ/Bh/mNcNpe1ccJozrIxOqg
 pFwQ==
X-Gm-Message-State: APjAAAVONlHdKemPC6yL2Qa8QFCRUrFSXKlfTkfKUEMw/+31cA1JbUt8
 UcehhSWBsULKVIcgUlxmJZsYSwTK2hqY4fAU7+SH4Q==
X-Google-Smtp-Source: APXvYqzBwIeeFzh63Qbgc7u8IhILC8K9a5g3sXHMveeBXqV3j+eFTuXMOPsPfhxreVhc4vvJRbXO6yCAztziXE1kHQg=
X-Received: by 2002:a5e:a502:: with SMTP id 2mr3589970iog.269.1566611923144;
 Fri, 23 Aug 2019 18:58:43 -0700 (PDT)
MIME-Version: 1.0
References: <CADfYTpEGPt5Bo+X689iaaFm5zWsx4CZrtj9yuNiedw5X5Orejw@mail.gmail.com>
 <aaba7044-b4fd-4906-ff11-74227eaf7d77@linux.vnet.ibm.com>
In-Reply-To: <aaba7044-b4fd-4906-ff11-74227eaf7d77@linux.vnet.ibm.com>
From: Nancy Yuen <yuenn@google.com>
Date: Fri, 23 Aug 2019 18:58:06 -0700
Message-ID: <CADfYTpFz_W0JEzv_pHahu2pmTP4M7SFJfuPUGKYyFFRBfD2=Qw@mail.gmail.com>
Subject: Re: OpenBMC Hackathon will be at OSFC Sept 2019
To: Gunnar Mills <gmills@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary="0000000000002e83110590d343de"
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

--0000000000002e83110590d343de
Content-Type: text/plain; charset="UTF-8"

Hi Gunnar,

As I understand it, the 2 days are for people to hack on whatever interests
them.  Aside from arranging the lightning talks it's completely up to the
attendees.  I'm open to putting together a list of ideas for OpenBMC though
if that's what everyone wants.  Please let me know!

----------
Nancy


On Fri, Aug 23, 2019 at 8:33 AM Gunnar Mills <gmills@linux.vnet.ibm.com>
wrote:

>
> On 6/20/2019 10:34 AM, Nancy Yuen wrote:
>
> OpenBMC will hold a Hackathon as part of the Open Source Firmware
> Conference <https://osfc.io/> (OSFC) in September.  OpenBMC will have
> it's own track there.
>
> *Location*
> Presentations Sept 3-4 @ Google in Sunnyvale
> Google Building MP1
> 1155 Borregas Ave
> Sunnyvale, CA, 94089
> USA
>
> Hacking Sept 5-6 @ Facebook in
> Facebook Building MPK60
> 150 Independence Dr
> Menlo Park, CA, 94025
> USA
>
> Hi Nancy,
>
> What is the format of the hacking part of the OSFC? Do we have a list of
> ideas?
>

--0000000000002e83110590d343de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Gunnar,<div><br></div><div>As I understand it, the 2 da=
ys are for people to hack on whatever interests them.=C2=A0 Aside from arra=
nging=C2=A0the lightning talks it&#39;s completely up to the attendees.=C2=
=A0 I&#39;m open to putting together a list of ideas for OpenBMC though if =
that&#39;s what everyone wants.=C2=A0 Please let me know!</div><div><br cle=
ar=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature">----------<br>Nancy</div></div><br></div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 2=
3, 2019 at 8:33 AM Gunnar Mills &lt;<a href=3D"mailto:gmills@linux.vnet.ibm=
.com">gmills@linux.vnet.ibm.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF">
    <p><br>
    </p>
    <div>On 6/20/2019 10:34 AM, Nancy Yuen
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div dir=3D"ltr">OpenBMC will hold a Hackathon as part of the <a hr=
ef=3D"https://osfc.io/" target=3D"_blank">Open Source
            Firmware Conference</a> (OSFC) in September.=C2=A0 OpenBMC will
          have it&#39;s own track there.</div>
        <div><br>
        </div>
        <div dir=3D"ltr">
          <div dir=3D"auto"><b>Location</b></div>
          <div dir=3D"auto">Presentations Sept 3-4 @ Google in Sunnyvale</d=
iv>
          <div dir=3D"auto">Google Building MP1<br>
            1155 Borregas Ave <br>
            Sunnyvale, CA, 94089 <br>
            USA<br>
          </div>
          <div dir=3D"auto"><br>
          </div>
          <div dir=3D"auto">Hacking Sept 5-6=C2=A0@ Facebook in=C2=A0</div>
          <div dir=3D"auto">Facebook Building MPK60<br>
            150 Independence Dr <br>
            Menlo Park, CA, 94025 <br>
            USA</div>
        </div>
        <div dir=3D"ltr"><br>
        </div>
      </div>
    </blockquote>
    Hi Nancy,<br>
    <br>
    What is the format of the hacking part of the OSFC? Do we have a
    list of ideas?<br>
  </div>

</blockquote></div>

--0000000000002e83110590d343de--
