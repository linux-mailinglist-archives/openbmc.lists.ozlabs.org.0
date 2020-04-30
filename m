Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 723701BECF4
	for <lists+openbmc@lfdr.de>; Thu, 30 Apr 2020 02:28:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CGSY35J7zDrBJ
	for <lists+openbmc@lfdr.de>; Thu, 30 Apr 2020 10:28:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b31;
 helo=mail-yb1-xb31.google.com; envelope-from=yuenn@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=pP9sLcct; dkim-atps=neutral
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CGRr3k6LzDq5t
 for <openbmc@lists.ozlabs.org>; Thu, 30 Apr 2020 10:27:36 +1000 (AEST)
Received: by mail-yb1-xb31.google.com with SMTP id e16so41791ybn.7
 for <openbmc@lists.ozlabs.org>; Wed, 29 Apr 2020 17:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nICLDWLteFYxLkCLPpTIi62LSgiZDciIbT8IB3jddUE=;
 b=pP9sLcctwiIqt+1nosVJIS9ZyvcfqMOsV/tooH8uCKNGAAG5qli/WWMtTWTfJe+9XD
 ijfUar5KdiT8nCoIPZsggtCYdXD10AycXKpQvb//e14LesXSv5dWpXc8MH/nfeZXYmOw
 sQDZchU/q7CAsgMlbQ8FkeZcU4f4MtKj3MB9tzZa4o9MeyP4FpHIAJ/VkkDyasCyArbO
 T+B8LhghmI7SrP94p4qVeEpu+4bjsh3oyfcVzJCoWUyLxlJoAbpicxC/vhEy3sWTxgLA
 jO5xVkjtLpeFiG1pVq+Pgmn0ig+4RaXyXxXm7ur0dcv/GVbX6paRSuNqbx3TZsO2qCjF
 YPOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nICLDWLteFYxLkCLPpTIi62LSgiZDciIbT8IB3jddUE=;
 b=m5ADoijhOcDZELusYkpnxZdsbjTp5G0dR0uLjGlQASKPiwg6Dz1qElD7NFWpul1e0g
 fK5THwMkV8zeLy22BKYTgPvqdNIv3ANBj/TgxZk+ZIDvGFrp7YUGDK0q4M9I7idSXTbr
 vFMBHwTB4yBDFrUW6mKSVzkrcUWZO5QwJVI494SOlyBjO61Tw6bnX60XUzmCwxPNeikM
 j+U4InAzT2Hw+Xr2TVEtMeeLGoc2x1BvXj26BNUH1t9P203lYpoT3Ydhgmpg7B2tQbGd
 D6hvnVCNlTFIFaHEKJ+Hhj2rJJPtqN6IFCriM4peR3NjgJ+Fj0rGbEbMF3x9WkqxC1gs
 pIvg==
X-Gm-Message-State: AGi0Pub2Yn1niJw0HPENPs+knayWSB4N3Qc0HhQC/sjq+exOnhaQqgBB
 bsFlp45SA50T30z2lnxvgc3wEhIoYWk4AIOES7mCbg==
X-Google-Smtp-Source: APiQypILqL/TX3GuD5U8M0EdaNIBQ0MBR7zzwL7R+v3NTJNiD7RL5RpXaufT737cCkp9KpiWW+oJDUjnBsYEf8NQGi0=
X-Received: by 2002:a25:cd08:: with SMTP id d8mr1549160ybf.228.1588206452377; 
 Wed, 29 Apr 2020 17:27:32 -0700 (PDT)
MIME-Version: 1.0
References: <CADfYTpG8Jp6rkQXnAeRjyAf41jzrJa0sPHmc7K0gbR7=EigQNw@mail.gmail.com>
 <59A41CBD-05E4-4CE5-BFDB-19CA52FC8460@fb.com>
 <CH2PR21MB151047A95F646DD65268E902C8AA0@CH2PR21MB1510.namprd21.prod.outlook.com>
In-Reply-To: <CH2PR21MB151047A95F646DD65268E902C8AA0@CH2PR21MB1510.namprd21.prod.outlook.com>
From: Nancy Yuen <yuenn@google.com>
Date: Wed, 29 Apr 2020 17:26:55 -0700
Message-ID: <CADfYTpHZghvGZOhKFt=T4khNCjsgBKRk-GvJeYUV0omLLLhB0A@mail.gmail.com>
Subject: Re: Multiple BMCs in a system: IPMB? Redfish? MCTP?
To: Neeraj Ladkani <neladk@microsoft.com>
Content-Type: multipart/alternative; boundary="0000000000006ce1ec05a477214b"
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
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000006ce1ec05a477214b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Neeraj, that's a great question.  I'm not sure we have a good answer in
some cases.  I think the closest analog in general (for us) is multiple
blades with their own BMCs in a chassis.

----------
Nancy


On Wed, Apr 29, 2020 at 5:23 PM Neeraj Ladkani <neladk@microsoft.com> wrote=
:

> Redfish defines computer system to be multiple chassis or multiple blades
> within a chassis.  It would be good to clarify if you are referring to
> =E2=80=9CSystem=E2=80=9D as:
>
>
>
>    - Multiple chassis with their own BMCs ( Storage, Compute, GPU etc )
>    - Multiple Blades with their own BMC within a chassis.
>
>
>
> Neeraj
>
>
>
> *From:* openbmc <openbmc-bounces+neladk=3Dmicrosoft.com@lists.ozlabs.org>=
 *On
> Behalf Of *Vijay Khemka
> *Sent:* Wednesday, April 29, 2020 5:16 PM
> *To:* Nancy Yuen <yuenn@google.com>; OpenBMC Maillist <
> openbmc@lists.ozlabs.org>
> *Subject:* [EXTERNAL] Re: Multiple BMCs in a system: IPMB? Redfish? MCTP?
>
>
>
> Hi Nancy,
>
> We are currently using (1) in our current multi host design. Option (3)
> also looks good.
>
>
>
> Regards
>
> -Vijay
>
>
>
> *From: *openbmc <openbmc-bounces+vijaykhemka=3Dfb.com@lists.ozlabs.org> o=
n
> behalf of Nancy Yuen <yuenn@google.com>
> *Date: *Wednesday, April 29, 2020 at 3:53 PM
> *To: *OpenBMC Maillist <openbmc@lists.ozlabs.org>
> *Subject: *Multiple BMCs in a system: IPMB? Redfish? MCTP?
>
>
>
> I've talked with some people a while back (long while back) about multipl=
e
> BMCs in a system.  Either for redundancy or managing separate parts of a
> system.   I'm wondering what other people are thinking in this area if at
> all.
>
>
>
> We are considering similar designs and I'm looking into options for
> BMC-BMC communications.  Some BMCs may not be externally accessible. Here
> are some options that we've looked at:
>
>    1. i2c/IPMB
>    2. usbnet/Redfish
>    3. i2c/MCTP/PLDM or something else?
>    4. internal network via switch chip/Redfish or MCTP
>
>  I'd like to reduce our use of IPMI so I want to avoid (1).
>
>
>
> ----------
> Nancy
>

--0000000000006ce1ec05a477214b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Neeraj, that&#39;s a great question.=C2=A0 I&#39;m not sur=
e we have a good answer in some cases.=C2=A0 I think the closest analog in =
general (for us) is multiple blades with their own BMCs in a chassis.<div><=
br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smart=
mail=3D"gmail_signature">----------<br>Nancy</div></div><br></div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, A=
pr 29, 2020 at 5:23 PM Neeraj Ladkani &lt;<a href=3D"mailto:neladk@microsof=
t.com">neladk@microsoft.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">





<div lang=3D"EN-US">
<div class=3D"gmail-m_3326843684431877378WordSection1">
<p class=3D"MsoNormal">Redfish defines computer system to be multiple chass=
is or multiple blades within a chassis.=C2=A0 It would be good to clarify i=
f you are referring to =E2=80=9CSystem=E2=80=9D as:<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<ul style=3D"margin-top:0in" type=3D"disc">
<li class=3D"gmail-m_3326843684431877378MsoListParagraph" style=3D"margin-l=
eft:0in">Multiple chassis with their own BMCs ( Storage, Compute, GPU etc )
<u></u><u></u></li><li class=3D"gmail-m_3326843684431877378MsoListParagraph=
" style=3D"margin-left:0in">Multiple Blades with their own BMC within a cha=
ssis.
<u></u><u></u></li></ul>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Neeraj<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0in 0in">
<p class=3D"MsoNormal"><b>From:</b> openbmc &lt;openbmc-bounces+neladk=3D<a=
 href=3D"mailto:microsoft.com@lists.ozlabs.org" target=3D"_blank">microsoft=
.com@lists.ozlabs.org</a>&gt;
<b>On Behalf Of </b>Vijay Khemka<br>
<b>Sent:</b> Wednesday, April 29, 2020 5:16 PM<br>
<b>To:</b> Nancy Yuen &lt;<a href=3D"mailto:yuenn@google.com" target=3D"_bl=
ank">yuenn@google.com</a>&gt;; OpenBMC Maillist &lt;<a href=3D"mailto:openb=
mc@lists.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;<br>
<b>Subject:</b> [EXTERNAL] Re: Multiple BMCs in a system: IPMB? Redfish? MC=
TP?<u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Hi Nancy,<u></u><u></u></p>
<p class=3D"MsoNormal">We are currently using (1) in our current multi host=
 design. Option (3) also looks good.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Regards<u></u><u></u></p>
<p class=3D"MsoNormal">-Vijay<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(181,196,223);padding:3pt 0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:12pt;color:black">From: =
</span></b><span style=3D"font-size:12pt;color:black">openbmc &lt;<a href=
=3D"mailto:openbmc-bounces+vijaykhemka=3Dfb.com@lists.ozlabs.org" target=3D=
"_blank">openbmc-bounces+vijaykhemka=3Dfb.com@lists.ozlabs.org</a>&gt;
 on behalf of Nancy Yuen &lt;<a href=3D"mailto:yuenn@google.com" target=3D"=
_blank">yuenn@google.com</a>&gt;<br>
<b>Date: </b>Wednesday, April 29, 2020 at 3:53 PM<br>
<b>To: </b>OpenBMC Maillist &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org"=
 target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;<br>
<b>Subject: </b>Multiple BMCs in a system: IPMB? Redfish? MCTP?<u></u><u></=
u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal">I&#39;ve talked with some people a while back (long =
while back) about multiple BMCs in a system.=C2=A0 Either for redundancy or=
 managing separate parts of a system.=C2=A0=C2=A0 I&#39;m wondering what ot=
her people are thinking in this area if at all.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">We are considering similar designs and I&#39;m looki=
ng into options for BMC-BMC communications.=C2=A0 Some BMCs may not be exte=
rnally accessible.=C2=A0Here are some options that we&#39;ve looked at:<u><=
/u><u></u></p>
</div>
<div>
<ol start=3D"1" type=3D"1">
<li class=3D"MsoNormal">
i2c/IPMB<u></u><u></u></li><li class=3D"MsoNormal">
usbnet/Redfish<u></u><u></u></li><li class=3D"MsoNormal">
i2c/MCTP/PLDM or something else?<u></u><u></u></li><li class=3D"MsoNormal">
internal network via switch chip/Redfish or MCTP<u></u><u></u></li></ol>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0I&#39;d like to reduce our use of IPMI so I wa=
nt to avoid (1).<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">----------<br>
Nancy<u></u><u></u></p>
</div>
</div>
</div>
</div>

</blockquote></div>

--0000000000006ce1ec05a477214b--
