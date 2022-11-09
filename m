Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF47F622166
	for <lists+openbmc@lfdr.de>; Wed,  9 Nov 2022 02:45:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6STQ4btSz3cJd
	for <lists+openbmc@lfdr.de>; Wed,  9 Nov 2022 12:45:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=kzVdAo1w;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=cweinan@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=kzVdAo1w;
	dkim-atps=neutral
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N6SSp1tLbz303P
	for <openbmc@lists.ozlabs.org>; Wed,  9 Nov 2022 12:44:41 +1100 (AEDT)
Received: by mail-ej1-x62c.google.com with SMTP id m22so5857384eji.10
        for <openbmc@lists.ozlabs.org>; Tue, 08 Nov 2022 17:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g6CNCr63WkLHMR4EqdjZGnJfG8kWvZiUAeo++JMmtz4=;
        b=kzVdAo1wXSOPH4CPhKgo1z9E7gLZZfFL3TnbUxI8REOyAZq8bQef7tPqwxLizy98u4
         wW8m9F8cu6w9gkmG29nsfA14x0Z2a3Z3UKNhhFBHOYuwbSD/4Y0AJphWbrqeLmGsAiQk
         xiPMos37LaOnCweDk5fzZppmpXOUJ/UFRY6+rJVk2I+OgSp4D02+u2w+frBai9X0tJ9L
         frsh8qyarAeKPEqSfOGRB4QGmDnl/w9hcTeZt4pP5ttOTF9Vmq6beSpO7RF1muRgDI2U
         7qV50OYlL6IyA+gfKXyHE5142eJa6v0A/9qh5ABNkXiqcRMveuwxs8Ozd3t+o/gjHb15
         Z3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g6CNCr63WkLHMR4EqdjZGnJfG8kWvZiUAeo++JMmtz4=;
        b=YB+MI10RJXTkv0SFr2LiMWeaqr+yJ5IdqB2Mtf81XSmmcQLMhJYTGRGOp2AiIQRuDG
         z+cIRdB8+CaWA8x1xlxMGe8aCTRb3n5plCRhFqpiR1+emiwSqp0hb3bcFz3XRlyImgMN
         EVjBKH6l27LI76r9KqvItVvLb494hTtFXvJ28ZGyVVDta6OD1fgXdG3+lK7HpX8SRmZV
         L+REAfbO7ZoeqsPRpTCAu8GtlIgmRLW7+iZBp36BW262YdovzL8JCPSUSlQHS1Sbd5Jv
         5G0xeQL6kQqSCYZkiidvn8xOyLt8N/y2Ink9D7/3A05ziKjQ4MIucAdswaU0s2dvjJcQ
         d16w==
X-Gm-Message-State: ACrzQf320inDZVLIXbmAD4D2+lDuHfVbx0qOsJYPSoQh6TW7u2HnItdd
	4+Q10UGuisyy/IUn5UKnspKfo5am6Vq6kIX8bQzWH0jpuPPd6Q==
X-Google-Smtp-Source: AMsMyM5Pjbzx4SVpH7mPOz6vVBV8XNLXJjYPVrlHRysCC/dMQZhk45VvMOtpCmwgBO9BSy7yAu/zdgLT1+5/mcfYtuI=
X-Received: by 2002:a17:907:7f11:b0:7ae:32b7:eb53 with SMTP id
 qf17-20020a1709077f1100b007ae32b7eb53mr24399990ejc.5.1667958273779; Tue, 08
 Nov 2022 17:44:33 -0800 (PST)
MIME-Version: 1.0
References: <CAC4LpBw+H2v5tHT8gAThLrmx8X-Oe6xVLhQ+STBXm0LXgGgv2Q@mail.gmail.com>
 <CAH2-KxCURVzcjWL2feRS8BE_V5XVGLtR2e1WeTdWMXjpBL2d8Q@mail.gmail.com> <CAC4LpBxZxu=q2C21SuXHZvG-R1E9=MUyQG0NBCY2k=4Z1q6w_w@mail.gmail.com>
In-Reply-To: <CAC4LpBxZxu=q2C21SuXHZvG-R1E9=MUyQG0NBCY2k=4Z1q6w_w@mail.gmail.com>
From: Claire Weinan <cweinan@google.com>
Date: Tue, 8 Nov 2022 17:44:22 -0800
Message-ID: <CAC4LpBxJEiMft0k+B0vNTwAUKM779fakQOiK4ZJzec5afA1jrA@mail.gmail.com>
Subject: Re: Proposed bmcweb dump LogService "Name" change
To: Ed Tanous <edtanous@google.com>
Content-Type: multipart/alternative; boundary="00000000000069497205ecffcc8f"
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000069497205ecffcc8f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Just an update: I have created a pull request (
https://github.com/DMTF/Redfish/pull/5336) at the Redfish github proposing
a new LogPurpose (enum) property and a new OemLogPurpose (string) property
in the LogService schema, and welcome feedback on them.

Best Regards,
Claire

On Tue, Nov 1, 2022 at 1:16 PM Claire Weinan <cweinan@google.com> wrote:

> Thanks Ed for your response.
> I have opened an issue at https://github.com/DMTF/Redfish/issues/5326
> When we discussed it at the Redfish working group meeting today the group
> generally supported adding one or more new properties to the LogService
> schema for describing a log's "purpose" (i.e. content type, in contrast t=
o
> format type). (It seemed like using "Name" to differentiate a log's purpo=
se
> is possible but not encouraged.) The next step will be to create a propos=
al
> for the new properties.
>
> Best Regards,
> Claire
>
> On Mon, Oct 31, 2022 at 8:53 AM Ed Tanous <edtanous@google.com> wrote:
>
>> On Tue, Oct 25, 2022 at 6:19 PM Claire Weinan <cweinan@google.com> wrote=
:
>> >
>> > Hi All,
>> >
>> > I have opened a bmcweb code review (
>> https://gerrit.openbmc.org/c/openbmc/bmcweb/+/57949) proposing a change
>> to the "Name" property of dump LogServices. This is best shown with
>> examples:
>> >
>> > Example from /redfish/v1/Managers/bmc/LogServices/FaultLog:
>> > Before: "Name": "Dump LogService"
>> > After: "Name": "FaultLog Dump LogService"
>> >
>> > Example from /redfish/v1/Managers/bmc/LogServices/Dump:
>> > Before: "Name": "Dump LogService"
>> > After: "Name": "BMC Dump LogService"
>> >
>> > Example from /redfish/v1/Systems/system/LogServices/Dump:
>> > Before: "Name": "Dump LogService"
>> > After: "Name": "System Dump LogService"
>> >
>> > Are any Redfish clients currently matching on this "Name" value? If so=
,
>> would it be feasible to change from checking if "Name" equals "Dump
>> LogService" to checking if "Name" contains "Dump LogService"?
>> >
>> > ---
>> > Details on the reasoning for changing to a more specific name:
>> >
>> > This allows a client to differentiate the dump types of various dump
>> LogServices based on the "Name" property. (For example, the client might
>> only be interested in examining LogServices of one particular dump type.=
)
>> >
>> > From Redfish spec v1.16.0, section 9.6.7 "Name": "The Name property
>> conveys a human-readable moniker for a resource. The data type of the Na=
me
>> property shall be string. The value of Name is NOT required to be unique
>> across resource instances within a resource collection."
>> >
>> > Based on the above, the primary purpose of "Name" is to be a
>> "human-readable moniker=E2=80=9D. I did not find a statement in the Redf=
ish spec on
>> whether it can be used for type matching.
>> > One type-related property in the LogService schema is "LogEntryType" -=
-
>> however the possible values (Event, Multiple, OEM, SEL) aren't fine-grai=
ned
>> enough to determine the exact dump type for this use case.
>>
>> Please open a discussion in a DMTF forum to discuss this.  Not finding
>> a statement would imply that there's something that needs to be
>> changed in the redfish specification itself.
>>
>> >
>> > So in the absence of another suitable LogService property for a client
>> to use to differentiate between dump types (and various OEM LogService
>> types in general), we opt to use the "Name" property.
>>
>> Lets get clarification from the standards body on how this feature is
>> intended to work (I believe there's already some discussion going on)
>> and go from there.  Depending on what the decision is, we can decide
>> what the next steps are, but as proposed, this would make the "Name"
>> field part of the unchangeable API.  When we've hit this issue before
>> in the case of sensors, we ended up making it a system-specific
>> decision.  I'm not sure that's the right approach here.
>>
>> As an added comment, there are more than just OpenBMC systems out
>> there running Redfish, so if we actually want to use the Name field
>> for this purpose, it would need prefixed with "OpenBMC" to
>> differentiate it from other types of logs with similar naming.
>>
>> >
>> > Best Regards,
>> > Claire Weinan
>> > --
>> >
>> > Claire Weinan
>> > Software Engineer
>> > cweinan@google.com
>>
>

--00000000000069497205ecffcc8f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Just an update: I have created a pull request (<a href=3D"=
https://github.com/DMTF/Redfish/pull/5336">https://github.com/DMTF/Redfish/=
pull/5336</a>) at the Redfish github=C2=A0proposing a new LogPurpose (enum)=
 property and a new OemLogPurpose (string) property in the LogService schem=
a, and welcome feedback on them.<br><div><br></div><div>Best Regards,</div>=
<div>Claire</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Tue, Nov 1, 2022 at 1:16 PM Claire Weinan &lt;<a href=
=3D"mailto:cweinan@google.com">cweinan@google.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Thanks Ed=
 for your response.<div>I have opened an issue at=C2=A0<a href=3D"https://g=
ithub.com/DMTF/Redfish/issues/5326" target=3D"_blank">https://github.com/DM=
TF/Redfish/issues/5326</a></div><div>When we discussed it at the Redfish wo=
rking group meeting today the group generally supported adding one or more =
new properties to the LogService schema for describing a log&#39;s &quot;pu=
rpose&quot; (i.e. content type, in contrast to format type). (It seemed lik=
e using &quot;Name&quot; to differentiate a log&#39;s purpose is possible b=
ut not encouraged.) The next step will be to create=C2=A0a proposal for the=
 new properties.</div><div><br></div><div>Best Regards,</div><div>Claire</d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Mon, Oct 31, 2022 at 8:53 AM Ed Tanous &lt;<a href=3D"mailto:edtanous=
@google.com" target=3D"_blank">edtanous@google.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, Oct 25, 2022 at 6=
:19 PM Claire Weinan &lt;<a href=3D"mailto:cweinan@google.com" target=3D"_b=
lank">cweinan@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi All,<br>
&gt;<br>
&gt; I have opened a bmcweb code review (<a href=3D"https://gerrit.openbmc.=
org/c/openbmc/bmcweb/+/57949" rel=3D"noreferrer" target=3D"_blank">https://=
gerrit.openbmc.org/c/openbmc/bmcweb/+/57949</a>) proposing a change to the =
&quot;Name&quot; property of dump LogServices. This is best shown with exam=
ples:<br>
&gt;<br>
&gt; Example from /redfish/v1/Managers/bmc/LogServices/FaultLog:<br>
&gt; Before: &quot;Name&quot;: &quot;Dump LogService&quot;<br>
&gt; After: &quot;Name&quot;: &quot;FaultLog Dump LogService&quot;<br>
&gt;<br>
&gt; Example from /redfish/v1/Managers/bmc/LogServices/Dump:<br>
&gt; Before: &quot;Name&quot;: &quot;Dump LogService&quot;<br>
&gt; After: &quot;Name&quot;: &quot;BMC Dump LogService&quot;<br>
&gt;<br>
&gt; Example from /redfish/v1/Systems/system/LogServices/Dump:<br>
&gt; Before: &quot;Name&quot;: &quot;Dump LogService&quot;<br>
&gt; After: &quot;Name&quot;: &quot;System Dump LogService&quot;<br>
&gt;<br>
&gt; Are any Redfish clients currently matching on this &quot;Name&quot; va=
lue? If so, would it be feasible to change from checking if &quot;Name&quot=
; equals &quot;Dump LogService&quot; to checking if &quot;Name&quot; contai=
ns &quot;Dump LogService&quot;?<br>
&gt;<br>
&gt; ---<br>
&gt; Details on the reasoning for changing to a more specific name:<br>
&gt;<br>
&gt; This allows a client to differentiate the dump types of various dump L=
ogServices based on the &quot;Name&quot; property. (For example, the client=
 might only be interested in examining LogServices of one particular dump t=
ype.)<br>
&gt;<br>
&gt; From Redfish spec v1.16.0, section 9.6.7 &quot;Name&quot;: &quot;The N=
ame property conveys a human-readable moniker for a resource. The data type=
 of the Name property shall be string. The value of Name is NOT required to=
 be unique across resource instances within a resource collection.&quot;<br=
>
&gt;<br>
&gt; Based on the above, the primary purpose of &quot;Name&quot; is to be a=
 &quot;human-readable moniker=E2=80=9D. I did not find a statement in the R=
edfish spec on whether it can be used for type matching.<br>
&gt; One type-related property in the LogService schema is &quot;LogEntryTy=
pe&quot; -- however the possible values (Event, Multiple, OEM, SEL) aren&#3=
9;t fine-grained enough to determine the exact dump type for this use case.=
<br>
<br>
Please open a discussion in a DMTF forum to discuss this.=C2=A0 Not finding=
<br>
a statement would imply that there&#39;s something that needs to be<br>
changed in the redfish specification itself.<br>
<br>
&gt;<br>
&gt; So in the absence of another suitable LogService property for a client=
 to use to differentiate between dump types (and various OEM LogService typ=
es in general), we opt to use the &quot;Name&quot; property.<br>
<br>
Lets get clarification from the standards body on how this feature is<br>
intended to work (I believe there&#39;s already some discussion going on)<b=
r>
and go from there.=C2=A0 Depending on what the decision is, we can decide<b=
r>
what the next steps are, but as proposed, this would make the &quot;Name&qu=
ot;<br>
field part of the unchangeable API.=C2=A0 When we&#39;ve hit this issue bef=
ore<br>
in the case of sensors, we ended up making it a system-specific<br>
decision.=C2=A0 I&#39;m not sure that&#39;s the right approach here.<br>
<br>
As an added comment, there are more than just OpenBMC systems out<br>
there running Redfish, so if we actually want to use the Name field<br>
for this purpose, it would need prefixed with &quot;OpenBMC&quot; to<br>
differentiate it from other types of logs with similar naming.<br>
<br>
&gt;<br>
&gt; Best Regards,<br>
&gt; Claire Weinan<br>
&gt; --<br>
&gt;<br>
&gt; Claire Weinan<br>
&gt; Software Engineer<br>
&gt; <a href=3D"mailto:cweinan@google.com" target=3D"_blank">cweinan@google=
.com</a><br>
</blockquote></div>
</blockquote></div>

--00000000000069497205ecffcc8f--
