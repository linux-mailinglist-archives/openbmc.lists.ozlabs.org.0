Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2673F76FAA8
	for <lists+openbmc@lfdr.de>; Fri,  4 Aug 2023 09:08:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=g0eVME82;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHGyN036Kz3cPS
	for <lists+openbmc@lfdr.de>; Fri,  4 Aug 2023 17:08:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=g0eVME82;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=shakeebbk@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHGxn2NM3z2ytR
	for <openbmc@lists.ozlabs.org>; Fri,  4 Aug 2023 17:07:39 +1000 (AEST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4fe15bfb1adso3102548e87.0
        for <openbmc@lists.ozlabs.org>; Fri, 04 Aug 2023 00:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691132853; x=1691737653;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JYfAbjyQkhNehNAD56dC9lp/bsjVNkAPByOVBTUB83g=;
        b=g0eVME82+HXJUsbpTmh0wwJ+Z1Y45Y9PhChOv0rvguY+vLoub22oAyVJp89SSelJWd
         QLGdAbfQsUr/kdb1cKiM8fRk8V2TpLuHktHyJjDZGxIMbPF0BTL3Iy4ZyWQX10sW+gXH
         HQjVx59MzY4DaqXXo+BW7srCS+dsUT1FGwhduSJfpF14p2Ldzu6Y0qZlPyVF5ydHV0f6
         0qy2jzBeuWUlCgGQRnI/K53lqZNky6ZUWP3IsMBKuYFYzUJMQzaMVyhfABpaTZu4erb6
         SkQKIFMqFqIME++3IDDOxwDiinHVXMnT7y9fIpJ60IrArQ+CbMOtcKDFV7fc8JNVxvD1
         JJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691132853; x=1691737653;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JYfAbjyQkhNehNAD56dC9lp/bsjVNkAPByOVBTUB83g=;
        b=PPXl3JJ2glDs2j6m2A9+YgcuMW26E3Y0tdYEcyRWf/Ud9tteFPkKi9aEuGVth7HGVv
         2wFKrX+rGHA6/bql4oG19BmMySxWqoC8Dc1PKc/WPmtTrhpbyDXsf8rhy4TsrTdvSceu
         FFScGD7ZRfaA80Otm9UDhWgmP9TqTQ1p+Zt8zTNBxF03jLtn9J5h+BmrXlxooj10ahSr
         R8NpoxqKFM6WATP5OYzP6NU1ZALiIDJKAubY/H9fP5jl4map1Tm4at6P8G5Rbiz+IZTL
         Spj9pVPFHASIT0lsVLyUIogCaESfpJnfK+fR9SWyeBAMfX5JkjYpkivWOwOCZ1hcsk3i
         VCmw==
X-Gm-Message-State: AOJu0Yxl0drdwc6hDgaaFDdOCsydWLOxuZD6z+m1OxXLXvx4g3OWRE/J
	kZI/KO+a0KLa8Gg1MHs+zYgwNt2j+tvvnDxiQ3s=
X-Google-Smtp-Source: AGHT+IEwAPGmPxc47KsxEB93Pje1E4SLKUr/1lnuQM0YG+aonFX7AntAwg9GuLisex9JdndOKwiS0CQa+hjaLnmRvzc=
X-Received: by 2002:a19:5f54:0:b0:4f8:7325:bcd4 with SMTP id
 a20-20020a195f54000000b004f87325bcd4mr612129lfj.0.1691132852626; Fri, 04 Aug
 2023 00:07:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAPY-kLVD7ONa6fkSrQ5sfAxK4UcGZSyHoMr6sb6oQPTafMT_fw@mail.gmail.com>
 <dd842255-9ab0-6fc7-7423-c9420f97dc3c@linux.ibm.com>
In-Reply-To: <dd842255-9ab0-6fc7-7423-c9420f97dc3c@linux.ibm.com>
From: Shakeeb Pasha <shakeebbk@gmail.com>
Date: Fri, 4 Aug 2023 12:37:21 +0530
Message-ID: <CABYu0Wg29+CefRbJg0ep+H6tcO9YZ9OY8Z8vdSUCZuwXgaEEew@mail.gmail.com>
Subject: Re: Error handling
To: Joseph Reynolds <jrey@linux.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000f2eaca0602138c4a"
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
Cc: openbmc@lists.ozlabs.org, chandu chanti <chandutmba@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000f2eaca0602138c4a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Joseph for the response.
>> I didn't see anyone else answer this.  Is your question about how to
>> architect or design your D-Bus interfaces?  Is the reference the BMCWeb
>> merely to provide context as a consumer of these D-Bus services?  I
>> assume so.
Question is two pronged, one we wanted to know the best way to
propagate error from dbus to bmcweb.
Options we tried:
1. Have handlers of each property throw an exception if there was an error.
But this did not work well with current bmcweb implementation(get all
method call), as it would lead to the entire resource not getting populated
even if we have one property failing.
2. Implement one additional associated rc property - and do the error
handling bmcweb by looking at that, but this doubled up the number of
properties on dbus.
3. Use "default values" per property data type, but this would fail for
extreme cases like if the property is u32, and if the default value used
was INT_MAX, then it breaks when the property could take value 0xFFFFFFFF
as valid value.
So the query here was to check if any preference from above options or hear
any new approaches as well.

The second query was about how to represent this error(per property error)
on redfish, our proposal for now is to return "NULL" for any property that
might be failing at the backend. Any thoughts on this approach?

>> I don't have any special insights.  Are you looking to follow a design
>> pattern?  Are you looking for direction from the BMCWeb maintainers?

Yes, we are working on a design pattern proposal and will publish it here
for review.
It would be great if we could get some directions/inputs from the
maintainers as well.

Thanks,
Shakeeb

On Thu, Aug 3, 2023 at 10:33=E2=80=AFPM Joseph Reynolds <jrey@linux.ibm.com=
> wrote:

> On 7/20/23 2:04 AM, chandu chanti wrote:
> > Hi Team, We are planning to handle errors from backend services in bmc
> > web. We are considering the following approaches to implement it, but
> > we are facing some issues. please provide your inputs. 1 . Using
> > exceptions in our backend D-Bus service
> > ZjQcmQRYFpfptBannerStart
> > This Message Is From an Untrusted Sender
> > You have not previously corresponded with this sender.
> > Report Suspicious
> > <
> https://us-phishalarm-ewt.proofpoint.com/EWT/v1/PjiDSg!12-vrJJyaRL1Nus7N2=
6ProiLa90y_FB6oawxkmvrT4YcN373bBkdTP-XPRTFLRBygswzt1TwX0wxp5Tel83pR4ZZR-wpx=
EYJpcKudcTfq2FH6iPLN9Ep4cV_tX4$>
>
> >
> > ZjQcmQRYFpfptBannerEnd
> >
> > Hi Team,
> >
> > We are planning to handle errors from backend services in bmc web. We
> > are considering the following approaches to implement it, but we are
> > facing some issues. please provide your inputs.
> >
>
> I didn't see anyone else answer this.  Is your question about how to
> architect or design your D-Bus interfaces?  Is the reference the BMCWeb
> merely to provide context as a consumer of these D-Bus services?  I
> assume so.
>
> I don't have any special insights.  Are you looking to follow a design
> pattern?  Are you looking for direction from the BMCWeb maintainers?
>
> Joseph
>
> > 1 . Using exceptions in our backend D-Bus service by throwing
> > exceptions in the D-Bus property get handlers. It works fine for the
> > Get property method call. However, when using the Get All method call,
> > if one property fails, an error is returned without checking the other
> > properties. Is there a way to implement exceptions in GetAll so that
> > even if one property fails, we can still fetch the remaining properties=
.
> >
> > 2. Using default values in D-Bus properties to indicate errors. Is
> > there a reference implementation available for setting default values
> > for string and integer data types in bmc web, similar to the
> > implementation of NaN (default value) for the double data type in
> > cable.hpp.
> >
> > 3. Implement associated return code per property on dbus, but this
> > would be very inefficient in terms of double the properties on dbus,
> > something we would like to avoid
> >
> > Thanks
> > Chandrasekhar T.
> >
>
>

--000000000000f2eaca0602138c4a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:large">Thanks=C2=A0Joseph for the response.</div><div class=3D"gmail=
_default" style=3D"font-size:large"><span style=3D"font-size:small">&gt;&gt=
; I didn&#39;t see anyone else answer this.=C2=A0 Is your question about ho=
w to</span><br style=3D"font-size:small"><span style=3D"font-size:small">&g=
t;&gt; architect or design your D-Bus interfaces?=C2=A0 Is the reference th=
e BMCWeb</span><br style=3D"font-size:small"><span style=3D"font-size:small=
">&gt;&gt; merely to provide context as a consumer of these D-Bus services?=
=C2=A0 I</span><br style=3D"font-size:small"><span style=3D"font-size:small=
">&gt;&gt; assume so.</span><br style=3D"font-size:small">Question is two p=
ronged, one we wanted to know the=C2=A0best way to propagate=C2=A0error fro=
m dbus to bmcweb.</div><div class=3D"gmail_default" style=3D""><font size=
=3D"4">Options we tried:</font></div><div class=3D"gmail_default" style=3D"=
"><font size=3D"4">1. Have handlers of each property throw an exception if =
there was an error. But this did not work well with current bmcweb implemen=
tation(get all method call), as it would lead to the entire resource=C2=A0n=
ot getting populated even if we have one property failing.</font></div><div=
 class=3D"gmail_default" style=3D""><font size=3D"4">2. Implement one addit=
ional associated rc property - and do the error handling bmcweb by looking =
at that, but this doubled up the number of properties on dbus.</font></div>=
<div class=3D"gmail_default" style=3D""><font size=3D"4">3. Use &quot;defau=
lt values&quot; per property data type, but this would fail for extreme cas=
es like if the property=C2=A0is u32, and if the default value used was INT_=
MAX, then it breaks when the property could take value 0xFFFFFFFF as valid =
value.</font></div><div class=3D"gmail_default" style=3D""><font size=3D"4"=
>So the query here was to check if any preference from above options or hea=
r any new approaches as well.</font></div><div class=3D"gmail_default" styl=
e=3D""><font size=3D"4"><br></font></div><div class=3D"gmail_default" style=
=3D""><font size=3D"4">The second query was about how to represent this err=
or(per property error) on redfish, our proposal for now is to return &quot;=
NULL&quot; for any property that might be failing at the backend. Any thoug=
hts on this approach?</font></div><div class=3D"gmail_default" style=3D""><=
font size=3D"4"><br style=3D""></font><span style=3D"font-size:small">&gt;&=
gt; I don&#39;t have any special insights.=C2=A0 Are you looking to follow =
a design</span><br style=3D"font-size:small"><span style=3D"font-size:small=
">&gt;&gt; pattern?=C2=A0 Are you looking for direction from the BMCWeb mai=
ntainers?</span><br></div><div class=3D"gmail_default" style=3D""><span sty=
le=3D"font-size:small"><br></span></div><div class=3D"gmail_default" style=
=3D"font-size:large">Yes, we are working on a design pattern proposal and w=
ill publish it here for review.</div><div class=3D"gmail_default" style=3D"=
font-size:large">It would be great if we could get some directions/inputs f=
rom the maintainers as well.</div><div class=3D"gmail_default" style=3D"fon=
t-size:large"><br></div><div class=3D"gmail_default" style=3D"font-size:lar=
ge">Thanks,</div><div class=3D"gmail_default" style=3D"font-size:large">Sha=
keeb</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Thu, Aug 3, 2023 at 10:33=E2=80=AFPM Joseph Reynolds &lt;<a hr=
ef=3D"mailto:jrey@linux.ibm.com">jrey@linux.ibm.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">On 7/20/23 2:04 AM, chan=
du chanti wrote:<br>
&gt; Hi Team, We are planning to handle errors from backend services in bmc=
 <br>
&gt; web. We are considering the following approaches to implement it, but =
<br>
&gt; we are facing some issues. please provide your inputs. 1 .=C2=A0Using =
<br>
&gt; exceptions in our backend D-Bus service<br>
&gt; ZjQcmQRYFpfptBannerStart<br>
&gt; This Message Is From an Untrusted Sender<br>
&gt; You have not previously corresponded with this sender.<br>
&gt; Report=C2=A0Suspicious<br>
&gt; &lt;<a href=3D"https://us-phishalarm-ewt.proofpoint.com/EWT/v1/PjiDSg!=
12-vrJJyaRL1Nus7N26ProiLa90y_FB6oawxkmvrT4YcN373bBkdTP-XPRTFLRBygswzt1TwX0w=
xp5Tel83pR4ZZR-wpxEYJpcKudcTfq2FH6iPLN9Ep4cV_tX4$" rel=3D"noreferrer" targe=
t=3D"_blank">https://us-phishalarm-ewt.proofpoint.com/EWT/v1/PjiDSg!12-vrJJ=
yaRL1Nus7N26ProiLa90y_FB6oawxkmvrT4YcN373bBkdTP-XPRTFLRBygswzt1TwX0wxp5Tel8=
3pR4ZZR-wpxEYJpcKudcTfq2FH6iPLN9Ep4cV_tX4$</a>&gt; <br>
&gt;<br>
&gt; ZjQcmQRYFpfptBannerEnd<br>
&gt;<br>
&gt; Hi Team,<br>
&gt;<br>
&gt; We are planning to handle errors from backend services in bmc web. We =
<br>
&gt; are considering the following approaches to implement it, but we are <=
br>
&gt; facing some issues. please provide your inputs.<br>
&gt;<br>
<br>
<span class=3D"gmail_default" style=3D"font-size:large"></span>I didn&#39;t=
 see anyone else answer this.=C2=A0 Is your question about how to <br>
architect or design your D-Bus interfaces?=C2=A0 Is the reference the BMCWe=
b <br>
merely to provide context as a consumer of these D-Bus services?=C2=A0 I <b=
r>
assume so.<br>
<br>
I don&#39;t have any special insights.=C2=A0 Are you looking to follow a de=
sign <br>
pattern?=C2=A0 Are you looking for direction from the BMCWeb maintainers?<b=
r>
<br>
Joseph<br>
<br>
&gt; 1 .=C2=A0Using exceptions in our backend D-Bus service by throwing <br=
>
&gt; exceptions in the D-Bus property get handlers. It works fine for the <=
br>
&gt; Get property method call. However, when using the Get All method call,=
 <br>
&gt; if one property fails, an error is returned without checking the other=
 <br>
&gt; properties. Is there a way to implement exceptions in GetAll so that <=
br>
&gt; even if one property fails, we can still fetch the remaining propertie=
s.<br>
&gt;<br>
&gt; 2. Using default values in D-Bus properties to indicate errors. Is <br=
>
&gt; there a reference implementation available for setting default values =
<br>
&gt; for string and integer data types in bmc web, similar to the <br>
&gt; implementation of NaN (default value) for the double data type in <br>
&gt; cable.hpp.<br>
&gt;<br>
&gt; 3. Implement associated return code per property on dbus, but this <br=
>
&gt; would be very inefficient in terms of double the properties on dbus, <=
br>
&gt; something we would like to avoid<br>
&gt;<br>
&gt; Thanks<br>
&gt; Chandrasekhar T.<br>
&gt;<br>
<br>
</blockquote></div></div>

--000000000000f2eaca0602138c4a--
