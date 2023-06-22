Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4232F7394CE
	for <lists+openbmc@lfdr.de>; Thu, 22 Jun 2023 03:43:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=QpG7lSV2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmjnF1Crfz30Kf
	for <lists+openbmc@lfdr.de>; Thu, 22 Jun 2023 11:43:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=QpG7lSV2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=wak@google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qmjmg4144z2xLS
	for <openbmc@lists.ozlabs.org>; Thu, 22 Jun 2023 11:42:42 +1000 (AEST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f9c0abc876so11763915e9.3
        for <openbmc@lists.ozlabs.org>; Wed, 21 Jun 2023 18:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687398154; x=1689990154;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A9kSwiWn86NSb+0SmUzJtRDNDguzCriGWAYRsMYVNpw=;
        b=QpG7lSV2k7JRvx+8NvvWvUaBrrQKuupHaYxdbI3zjV8kI6YlbB3VW25xmNbF6i7MJZ
         J1fRNbaT6tT405l+/Ms1t+12p+8fSnkkNOiTyw/PGGJpkFdNodi+aauh0s/tpKIrQoIo
         e6hHp4qbPtvx6rfN0rtlpFqTny+XxRdzgD0IyjRc31EMoEv/8biar0TmaqA3AO1uJWQu
         PKKDTXnGUOMZtcVLeJ6f8xdKM9kXqapT4fhgkkgD5jCz7movVfKF7JlRhlYRtkCPawRE
         sPu2AprZSphEJYMGk6useqmDAWf134iBoKzh8GGe+ucH7N66H3WYo8TboXXO34Lxtmwl
         jiKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687398154; x=1689990154;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A9kSwiWn86NSb+0SmUzJtRDNDguzCriGWAYRsMYVNpw=;
        b=ZmGMzRoJjvNBYaZOnYifCj7OreKPN732M16S3LLjlwYd0w0+iZR3GR/pqaic/0pByj
         jM7ZWz2362DfOTAOSrVb/24KrpII4uLQNrBm7vYtRMJnEGP6AWykUbMUzt0hRj6j/aum
         NoNdEzz4AXuS1XQQx4r3RIIkrx/KPH7cyCUaWCjZxuxaO4AoxDn/lCpCSDA8i/uL2tRR
         U0bgEaAclafTVo6oOj5pXSbrihRIaXesdiYt3GSPFnYfl3/Lfp0nHONbbthfuJDzD5Ba
         TgshF60U0nrxh64GpIS1HSlGB8hG6oOG4PwYl4LhJbkR+Ag9D26x7WXv/PbZqd8WkDO0
         RKLw==
X-Gm-Message-State: AC+VfDxOFHHCb8lavjKaV1sXPPdRHXVeOL+1GgBZfyNlMlh6gDh7P7V0
	PhBoGs3/o3ui3/yOXv8JXgLbDLn2EZTdOCmw5lCE0w==
X-Google-Smtp-Source: ACHHUZ4rskudSuUYPmoDaF2avAlHgfmNfAmMeNjaz3V4WBcWKmMrvnt4vkVgsYkN67n7Mt/T2wqJiiUJLRA0M0E21Us=
X-Received: by 2002:a1c:7404:0:b0:3f9:e78d:8dcf with SMTP id
 p4-20020a1c7404000000b003f9e78d8dcfmr907458wmc.28.1687398154534; Wed, 21 Jun
 2023 18:42:34 -0700 (PDT)
MIME-Version: 1.0
References: <DS7PR10MB486175B1DBCE7437A2F8E980A55CA@DS7PR10MB4861.namprd10.prod.outlook.com>
 <CAMhqiMqGwvNFP7knyTQz7bLk1jHffhkqCb74oy7cZswQQz57wg@mail.gmail.com> <DS7PR10MB4861A9A481E8CF2955356128A55DA@DS7PR10MB4861.namprd10.prod.outlook.com>
In-Reply-To: <DS7PR10MB4861A9A481E8CF2955356128A55DA@DS7PR10MB4861.namprd10.prod.outlook.com>
From: William Kennington <wak@google.com>
Date: Wed, 21 Jun 2023 18:42:23 -0700
Message-ID: <CAPnigKnOE5hQqi4+5xyxhaqMaBbhHHw=J=oz+0RSW6XUOL2QAA@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: The design of multiple VLAN at OpenBMC
To: =?UTF-8?B?S2VubnkgV3UgKOWQs+W7uuWvrCk=?= <KennyWu@ami.com>
Content-Type: multipart/alternative; boundary="00000000000099348005feadffcd"
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
Cc: Ratan Gupta <ratankgupta31@gmail.com>, Pravinash Jeyapaul <pravinashj@ami.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000099348005feadffcd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Multiple VLANs should just work for an arbitrary number of VLANs from
phosphor-networkd. The only issue would be protocols like IPMI that do not
generalize the protocol to support more than 1 VLAN. I can't comment on how
redfish models multiple interfaces / VLANs.

On Wed, Jun 21, 2023 at 6:40=E2=80=AFPM Kenny Wu (=E5=90=B3=E5=BB=BA=E5=AF=
=AC) <KennyWu@ami.com> wrote:

> Hi @Ratan Gupta,
>
> Thanks you reply. It is helpful to us.
>
> But I want clear more detail about the number of VLAN. Due RD may need
> provide expect result to QA. RD can limit the number of VLAN by their own
> design ?
> And from your comment, a single VLAN is enough to using at general
> environment.
>
> Thanks,
> KennyWu.
>
> -----Original Message-----
> From: Ratan Gupta <ratankgupta31@gmail.com>
> Sent: Tuesday, June 20, 2023 2:11 PM
> To: Kenny Wu (=E5=90=B3=E5=BB=BA=E5=AF=AC) <KennyWu@ami.com>
> Cc: openbmc@lists.ozlabs.org; Pravinash Jeyapaul <pravinashj@ami.com>
> Subject: [EXTERNAL] Re: The design of multiple VLAN at OpenBMC
>
>
> **CAUTION: The e-mail below is from an external source. Please exercise
> caution before opening attachments, clicking links, or following guidance=
.**
>
> Hi Kenny,
>
> You can have multiple VLAN on the same interface, I don't see we have a
> restriction on the number of VLANs.
> It is up to the system admin, How many VLANs do they need? In a typical
> scenario, it should not be more than a single VLAN.
>
> Thanks,
> Ratan
>
> On Tue, Jun 20, 2023 at 9:39=E2=80=AFAM Kenny Wu (=E5=90=B3=E5=BB=BA=E5=
=AF=AC) <KennyWu@ami.com> wrote:
> >
> > Hi ,
> >
> >
> >
> > We are develop OpenBMC and meet some design question need to consult. I
> will be appreciate your responses.
> >
> >
> >
> > The VLAN behavior at OpenBMC. It support multiple VLAN. Is there are an=
y
> restricted maximum number at each service IPMI/WEB/Redfish. Or it is
> decided by developer?
> >
> >
> >
> > As I know IPMI is only service one interface, VLAN or non-VLAN. Once
> user enabled VLAN, the IPMI daemon will respond both ?
> >
> >
> >
> > Thanks,
> > KennyWu
> >
> >
> >
> > -The information contained in this message may be confidential and
> proprietary to American Megatrends (AMI). This communication is intended =
to
> be read only by the individual or entity to whom it is addressed or by
> their designee. If the reader of this message is not the intended
> recipient, you are on notice that any distribution of this message, in an=
y
> form, is strictly prohibited. Please promptly notify the sender by reply
> e-mail or by telephone at 770-246-8600 <(770)%20246-8600>, and then
> delete or destroy all copies of the transmission.
> -The information contained in this message may be confidential and
> proprietary to American Megatrends (AMI). This communication is intended =
to
> be read only by the individual or entity to whom it is addressed or by
> their designee. If the reader of this message is not the intended
> recipient, you are on notice that any distribution of this message, in an=
y
> form, is strictly prohibited. Please promptly notify the sender by reply
> e-mail or by telephone at 770-246-8600 <(770)%20246-8600>, and then
> delete or destroy all copies of the transmission.
>

--00000000000099348005feadffcd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Multiple=C2=A0VLANs should just work for an arbitrary numb=
er of VLANs from phosphor-networkd. The only issue would be protocols like =
IPMI that do not generalize the protocol to support more than 1 VLAN. I can=
&#39;t comment on how redfish models multiple interfaces / VLANs.</div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Ju=
n 21, 2023 at 6:40=E2=80=AFPM Kenny Wu (=E5=90=B3=E5=BB=BA=E5=AF=AC) &lt;<a=
 href=3D"mailto:KennyWu@ami.com">KennyWu@ami.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Hi @Ratan Gupta,<br>
<br>
Thanks you reply. It is helpful to us.<br>
<br>
But I want clear more detail about the number of VLAN. Due RD may need prov=
ide expect result to QA. RD can limit the number of VLAN by their own desig=
n ?<br>
And from your comment, a single VLAN is enough to using at general environm=
ent.<br>
<br>
Thanks,<br>
KennyWu.<br>
<br>
-----Original Message-----<br>
From: Ratan Gupta &lt;<a href=3D"mailto:ratankgupta31@gmail.com" target=3D"=
_blank">ratankgupta31@gmail.com</a>&gt;<br>
Sent: Tuesday, June 20, 2023 2:11 PM<br>
To: Kenny Wu (=E5=90=B3=E5=BB=BA=E5=AF=AC) &lt;<a href=3D"mailto:KennyWu@am=
i.com" target=3D"_blank">KennyWu@ami.com</a>&gt;<br>
Cc: <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@l=
ists.ozlabs.org</a>; Pravinash Jeyapaul &lt;<a href=3D"mailto:pravinashj@am=
i.com" target=3D"_blank">pravinashj@ami.com</a>&gt;<br>
Subject: [EXTERNAL] Re: The design of multiple VLAN at OpenBMC<br>
<br>
<br>
**CAUTION: The e-mail below is from an external source. Please exercise cau=
tion before opening attachments, clicking links, or following guidance.**<b=
r>
<br>
Hi Kenny,<br>
<br>
You can have multiple VLAN on the same interface, I don&#39;t see we have a=
 restriction on the number of VLANs.<br>
It is up to the system admin, How many VLANs do they need? In a typical sce=
nario, it should not be more than a single VLAN.<br>
<br>
Thanks,<br>
Ratan<br>
<br>
On Tue, Jun 20, 2023 at 9:39=E2=80=AFAM Kenny Wu (=E5=90=B3=E5=BB=BA=E5=AF=
=AC) &lt;<a href=3D"mailto:KennyWu@ami.com" target=3D"_blank">KennyWu@ami.c=
om</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi ,<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; We are develop OpenBMC and meet some design question need to consult. =
I will be appreciate your responses.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; The VLAN behavior at OpenBMC. It support multiple VLAN. Is there are a=
ny restricted maximum number at each service IPMI/WEB/Redfish. Or it is dec=
ided by developer?<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; As I know IPMI is only service one interface, VLAN or non-VLAN. Once u=
ser enabled VLAN, the IPMI daemon will respond both ?<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Thanks,<br>
&gt; KennyWu<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; -The information contained in this message may be confidential and pro=
prietary to American Megatrends (AMI). This communication is intended to be=
 read only by the individual or entity to whom it is addressed or by their =
designee. If the reader of this message is not the intended recipient, you =
are on notice that any distribution of this message, in any form, is strict=
ly prohibited. Please promptly notify the sender by reply e-mail or by tele=
phone at <a href=3D"tel:(770)%20246-8600" value=3D"+17702468600" target=3D"=
_blank">770-246-8600</a>, and then delete or destroy all copies of the tran=
smission.<br>
-The information contained in this message may be confidential and propriet=
ary to American Megatrends (AMI). This communication is intended to be read=
 only by the individual or entity to whom it is addressed or by their desig=
nee. If the reader of this message is not the intended recipient, you are o=
n notice that any distribution of this message, in any form, is strictly pr=
ohibited. Please promptly notify the sender by reply e-mail or by telephone=
 at <a href=3D"tel:(770)%20246-8600" value=3D"+17702468600" target=3D"_blan=
k">770-246-8600</a>, and then delete or destroy all copies of the transmiss=
ion.<br>
</blockquote></div>

--00000000000099348005feadffcd--
