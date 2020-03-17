Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C6472188E53
	for <lists+openbmc@lfdr.de>; Tue, 17 Mar 2020 20:50:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hkLQ6XNdzDqr5
	for <lists+openbmc@lfdr.de>; Wed, 18 Mar 2020 06:50:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::22f;
 helo=mail-lj1-x22f.google.com; envelope-from=rhanley@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=jajfW47g; dkim-atps=neutral
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hkKg3FbtzDqlZ
 for <openbmc@lists.ozlabs.org>; Wed, 18 Mar 2020 06:50:12 +1100 (AEDT)
Received: by mail-lj1-x22f.google.com with SMTP id u12so24380761ljo.2
 for <openbmc@lists.ozlabs.org>; Tue, 17 Mar 2020 12:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mKdjIVklShwrD85yFVSsm2igDADR9ax3lV08lcvMCi4=;
 b=jajfW47gRfVoxYi4ghVHmPPAO7iwMZRcNSmfsb/LnV6sCMnYYYp/fXcyK0CKafiyxP
 +WvenQHB5jl6UFhhUZ1jQb7fdkMYJpPFFAlgInUfE6k07UxrHp1GGfjQNslU0Fl+r1eR
 KUjr5iGmHz00dQCZFd+tg7NqxR4YSml5jA7KJ1pufQ0tHpBERySjPsHoAnIMMgPaXL5s
 vaIWJc878udxN3cZCMSRh7iSKx2YDnq2gfEUP8JnGBWGWG6vX7VdfQGk6YhBQ7acuBls
 nQzHDhmpX49+GJrEB0QATP6VpOdQ30MMhvsLq9rEa1sMYt1NZdXZx7UtE4xMhZzAW3Cj
 6Lyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mKdjIVklShwrD85yFVSsm2igDADR9ax3lV08lcvMCi4=;
 b=VyMYhJUDp1d/OwwQsWuTOcXEfVpeGW/6Ntaa8BMjV7mrOBUoECPsozy3KtuSA2nSWH
 Uw+iggkhhpM3HPB744gDoSZJ8BsdK65jZdA/El4Z9T3vcFGyADCDIApX00+nr74Mit9F
 SNgh//mpX6cjo1O8dqSP6reTWN1FJpkYdnAqrl9JBNfy7azCIoi6CF/HRNSGB1tPby8o
 oTy0p/ve5yzAqFFt2bBJAAexBzYgxFIIqrCvMQjjKZcyYFw0hEW1eMiLWiDlldUbdJ9A
 fbsTf7VZSuJEqm7v3QalfNiqOF3dGrzAIHTvs9uFN44UVvlxgHLnUqjBCqHzOdfD11bk
 aglQ==
X-Gm-Message-State: ANhLgQ1FjkS3jQy1uRpMmKRnTE0FzWz45sX25H6pLVouDsd2qFqS7JcU
 DUp5YSHgXNOZBT1Ri52z5JP2gVasgQql9zawxHEwsw==
X-Google-Smtp-Source: ADFU+vsxj4eM972YB4rIyCyWZIH0n2suFeysrF66gRzXoAlPLY37HxC46xnTx4krtilPKYq9QSR0dZDFgA72npRz4LE=
X-Received: by 2002:a05:651c:112c:: with SMTP id
 e12mr255802ljo.7.1584474607740; 
 Tue, 17 Mar 2020 12:50:07 -0700 (PDT)
MIME-Version: 1.0
References: <94469ba3-2b59-b131-ecbe-d708054aef89@linux.vnet.ibm.com>
 <bfd9332f-1a27-d00f-4379-8c039b9e9b24@linux.vnet.ibm.com>
 <530d856cf60f594e39a81e5b8b6f12253d0f3544.camel@yadro.com>
In-Reply-To: <530d856cf60f594e39a81e5b8b6f12253d0f3544.camel@yadro.com>
From: Richard Hanley <rhanley@google.com>
Date: Tue, 17 Mar 2020 12:49:56 -0700
Message-ID: <CAH1kD+aJVELPFNR=F-rL3Bkp8pv8=yO+aRJOJFWEFEi_awgKNA@mail.gmail.com>
Subject: Re: Proposal for the connected redfish client info
To: Ivan Mikhaylov <i.mikhaylov@yadro.com>
Content-Type: multipart/alternative; boundary="000000000000269bfa05a1123e8a"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>,
 Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000269bfa05a1123e8a
Content-Type: text/plain; charset="UTF-8"

>Show the connected redfish client info.
> ClientIP
> Client Unique Identifier(unique serial number of the client etc)

I'd like to know a bit more of the use case for this information.  Is this
done to help clients find each other in realtime? Or is this being to log
accesses for security audits?  I think that would help me figure out what
direction we should move towards.

If this is related to auditing, then we should be thinking about how this
feature might expand over time.

Cheers,
Richard

On Tue, Mar 17, 2020 at 11:00 AM Ivan Mikhaylov <i.mikhaylov@yadro.com>
wrote:

> On Tue, 2020-03-17 at 18:31 +0530, Ratan Gupta wrote:
> > Hi Team,
> >
> > Looking for your inputs
> >
> > James, How about option1 for the below use case
> >
> > Ratan
> >
> > On 3/11/20 3:48 PM, Ratan Gupta wrote:
> > > Hi Team,
> > >
> > > In IBM we have a following requirement
> > >
> > > Show the connected redfish client info.
> > >   ClientIP
> > >   Client Unique Identifier(unique serial number of the client etc)
> > >
> > > Presently there is no way through which we can get this info.
> > >
> > > I have following two proposal for the above requirement.
> > >
> > > 1/ (Extend the session schema)
> > >
> > > Add the IPaddress and the client Identifier as a OEM in the session
> schema,
> > > Clinet IP would be read only and will be updated once the redfish
> client
> > > creates the session.
>
> We've already some sort of it in our local env for old builds. I don't mind
> about client ip read only property inside session/connection inside
> bmcweb.
>
> > > ClientIdentifier(Management console unique serial number etc) will be
> > > writable property and can be set by the redfish client
> > > during creation of the session or after creating the session.
>
> What is 'ClientIdentifier' and why it should be there?
>
>

--000000000000269bfa05a1123e8a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt;Show the connected=C2=A0<span>redfish</span>=C2=A0clie=
nt info.<br>&gt; ClientIP<div>&gt; Client Unique Identifier(unique serial n=
umber of the client etc)</div><div><br></div><div>I&#39;d like to know a bi=
t more of the use case for this information.=C2=A0 Is this done to help cli=
ents find each other in realtime? Or is this being to log accesses for secu=
rity audits?=C2=A0 I think that would help me figure out what direction we =
should move towards.</div><div><br></div><div>If this is related to auditin=
g, then we should be thinking about how this feature might expand over time=
.</div><div><br></div><div>Cheers,</div><div>Richard</div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 17, 2=
020 at 11:00 AM Ivan Mikhaylov &lt;<a href=3D"mailto:i.mikhaylov@yadro.com"=
 target=3D"_blank">i.mikhaylov@yadro.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">On Tue, 2020-03-17 at 18:31 +0530, =
Ratan Gupta wrote:<br>
&gt; Hi Team,<br>
&gt; <br>
&gt; Looking for your inputs <br>
&gt; <br>
&gt; James, How about option1 for the below use case<br>
&gt; <br>
&gt; Ratan<br>
&gt; <br>
&gt; On 3/11/20 3:48 PM, Ratan Gupta wrote:<br>
&gt; &gt; Hi Team,<br>
&gt; &gt; <br>
&gt; &gt; In IBM we have a following requirement<br>
&gt; &gt; <br>
&gt; &gt; Show the connected redfish client info.<br>
&gt; &gt;=C2=A0 =C2=A0ClientIP<br>
&gt; &gt;=C2=A0 =C2=A0Client Unique Identifier(unique serial number of the =
client etc)<br>
&gt; &gt; <br>
&gt; &gt; Presently there is no way through which we can get this info.<br>
&gt; &gt; <br>
&gt; &gt; I have following two proposal for the above requirement.<br>
&gt; &gt; <br>
&gt; &gt; 1/ (Extend the session schema)<br>
&gt; &gt; <br>
&gt; &gt; Add the IPaddress and the client Identifier as a OEM in the sessi=
on schema,<br>
&gt; &gt; Clinet IP would be read only and will be updated once the redfish=
 client<br>
&gt; &gt; creates the session.<br>
<br>
We&#39;ve already some sort of it in our local env for old builds. I don&#3=
9;t mind<br>
about client ip read only property inside session/connection inside bmcweb.=
 <br>
<br>
&gt; &gt; ClientIdentifier(Management console unique serial number etc) wil=
l be<br>
&gt; &gt; writable property and can be set by the redfish client <br>
&gt; &gt; during creation of the session or after creating the session.<br>
<br>
What is &#39;ClientIdentifier&#39; and why it should be there?<br>
<br>
</blockquote></div>

--000000000000269bfa05a1123e8a--
