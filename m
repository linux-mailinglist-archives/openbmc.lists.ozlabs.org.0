Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBC66152FA
	for <lists+openbmc@lfdr.de>; Tue,  1 Nov 2022 21:16:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N21Wm4Sr9z3cKv
	for <lists+openbmc@lfdr.de>; Wed,  2 Nov 2022 07:16:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=REAVnqAf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=cweinan@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=REAVnqAf;
	dkim-atps=neutral
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N21W913w2z2xG6
	for <openbmc@lists.ozlabs.org>; Wed,  2 Nov 2022 07:16:19 +1100 (AEDT)
Received: by mail-ej1-x636.google.com with SMTP id q9so40017544ejd.0
        for <openbmc@lists.ozlabs.org>; Tue, 01 Nov 2022 13:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+76ZiTvhKHiwlzvFXnn7SrZHjj2eprvSDdTl6m51edo=;
        b=REAVnqAfZrN7D4c6g5vklcgfykn06aF0QrbiAceOg7bAWNJ8zJC/a0BFMyKLTqCde/
         7eip6RUZirjCJMwmnMOASNKz2/WZljaJ2kSedc+68aq6uicxJRn5I4BgSnMocsBEnwPk
         hv/uhms/ApuwidjGLwY22GFD6Hv55JHMivmjmLsIuv2gEl/03CteqhFJItHhyW/M2aAG
         tsERUYbZ/JCulyFkSWJLihjxfXwuWSWnzrgoIi0tog2b7n0NqGt4rkZlkm794Zad/6KR
         Ts+Y6AWeIW979P2ZhMwXGH6mv43Fp/nEwazs2mgVAoJsetrRszphANH0O59RawEXV26/
         cW1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+76ZiTvhKHiwlzvFXnn7SrZHjj2eprvSDdTl6m51edo=;
        b=W5RH/xInopf3e0Z0H5XxG+DU7F42s9JUCVFZNz1nzwDgtZAqchbWSAWUa8DOkFVpi/
         +L7yuVIS3FiYnv8m42I9XsrkG3P50TyngtqoVwr02FCNOJULCon+jujyECptrQCMWjtV
         PUjnmN0qwG+u0yrGJ/5lFIq/lQbyy5clY8Cm3kUDdHh2l7BlahJ5OljDgwnwjzRy3hP7
         oMfcj7y8RBashvgb8iRTMi64s1Vf8jTwFXStlaCBKw/DSLFRFCIxQSfRYfNEqH2R7mHl
         sm90b3EFXBQ3m4c2USYIgQpTstNq4jMzenbBUhyob1aUMhAAp9SifIt2CffCZzff9MQf
         mdXQ==
X-Gm-Message-State: ACrzQf1uz1kIdAvetMSE8oZmek1aI3i54EhIsAoADwZxVOiRmbFzNEGI
	zgz5LzoLklcYnAGqhOGCs0WQpOAvDsjyuIfXbk1LBg==
X-Google-Smtp-Source: AMsMyM4aTjAbAjtR/yD9T+UB73uTQHv6gHGMRp4AgI8YlX86P1qihFGNyitC6RCkA2/2HB2q8wrzTVRyLOGz8Aqo9M8=
X-Received: by 2002:a17:907:e88:b0:78d:fb98:6f5d with SMTP id
 ho8-20020a1709070e8800b0078dfb986f5dmr20974980ejc.5.1667333774181; Tue, 01
 Nov 2022 13:16:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAC4LpBw+H2v5tHT8gAThLrmx8X-Oe6xVLhQ+STBXm0LXgGgv2Q@mail.gmail.com>
 <CAH2-KxCURVzcjWL2feRS8BE_V5XVGLtR2e1WeTdWMXjpBL2d8Q@mail.gmail.com>
In-Reply-To: <CAH2-KxCURVzcjWL2feRS8BE_V5XVGLtR2e1WeTdWMXjpBL2d8Q@mail.gmail.com>
From: Claire Weinan <cweinan@google.com>
Date: Tue, 1 Nov 2022 13:16:02 -0700
Message-ID: <CAC4LpBxZxu=q2C21SuXHZvG-R1E9=MUyQG0NBCY2k=4Z1q6w_w@mail.gmail.com>
Subject: Re: Proposed bmcweb dump LogService "Name" change
To: Ed Tanous <edtanous@google.com>
Content-Type: multipart/alternative; boundary="00000000000055640405ec6e6511"
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

--00000000000055640405ec6e6511
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Ed for your response.
I have opened an issue at https://github.com/DMTF/Redfish/issues/5326
When we discussed it at the Redfish working group meeting today the group
generally supported adding one or more new properties to the LogService
schema for describing a log's "purpose" (i.e. content type, in contrast to
format type). (It seemed like using "Name" to differentiate a log's purpose
is possible but not encouraged.) The next step will be to create a proposal
for the new properties.

Best Regards,
Claire

On Mon, Oct 31, 2022 at 8:53 AM Ed Tanous <edtanous@google.com> wrote:

> On Tue, Oct 25, 2022 at 6:19 PM Claire Weinan <cweinan@google.com> wrote:
> >
> > Hi All,
> >
> > I have opened a bmcweb code review (
> https://gerrit.openbmc.org/c/openbmc/bmcweb/+/57949) proposing a change
> to the "Name" property of dump LogServices. This is best shown with
> examples:
> >
> > Example from /redfish/v1/Managers/bmc/LogServices/FaultLog:
> > Before: "Name": "Dump LogService"
> > After: "Name": "FaultLog Dump LogService"
> >
> > Example from /redfish/v1/Managers/bmc/LogServices/Dump:
> > Before: "Name": "Dump LogService"
> > After: "Name": "BMC Dump LogService"
> >
> > Example from /redfish/v1/Systems/system/LogServices/Dump:
> > Before: "Name": "Dump LogService"
> > After: "Name": "System Dump LogService"
> >
> > Are any Redfish clients currently matching on this "Name" value? If so,
> would it be feasible to change from checking if "Name" equals "Dump
> LogService" to checking if "Name" contains "Dump LogService"?
> >
> > ---
> > Details on the reasoning for changing to a more specific name:
> >
> > This allows a client to differentiate the dump types of various dump
> LogServices based on the "Name" property. (For example, the client might
> only be interested in examining LogServices of one particular dump type.)
> >
> > From Redfish spec v1.16.0, section 9.6.7 "Name": "The Name property
> conveys a human-readable moniker for a resource. The data type of the Nam=
e
> property shall be string. The value of Name is NOT required to be unique
> across resource instances within a resource collection."
> >
> > Based on the above, the primary purpose of "Name" is to be a
> "human-readable moniker=E2=80=9D. I did not find a statement in the Redfi=
sh spec on
> whether it can be used for type matching.
> > One type-related property in the LogService schema is "LogEntryType" --
> however the possible values (Event, Multiple, OEM, SEL) aren't fine-grain=
ed
> enough to determine the exact dump type for this use case.
>
> Please open a discussion in a DMTF forum to discuss this.  Not finding
> a statement would imply that there's something that needs to be
> changed in the redfish specification itself.
>
> >
> > So in the absence of another suitable LogService property for a client
> to use to differentiate between dump types (and various OEM LogService
> types in general), we opt to use the "Name" property.
>
> Lets get clarification from the standards body on how this feature is
> intended to work (I believe there's already some discussion going on)
> and go from there.  Depending on what the decision is, we can decide
> what the next steps are, but as proposed, this would make the "Name"
> field part of the unchangeable API.  When we've hit this issue before
> in the case of sensors, we ended up making it a system-specific
> decision.  I'm not sure that's the right approach here.
>
> As an added comment, there are more than just OpenBMC systems out
> there running Redfish, so if we actually want to use the Name field
> for this purpose, it would need prefixed with "OpenBMC" to
> differentiate it from other types of logs with similar naming.
>
> >
> > Best Regards,
> > Claire Weinan
> > --
> >
> > Claire Weinan
> > Software Engineer
> > cweinan@google.com
>

--00000000000055640405ec6e6511
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Ed for your response.<div>I have opened an issue at=
=C2=A0<a href=3D"https://github.com/DMTF/Redfish/issues/5326">https://githu=
b.com/DMTF/Redfish/issues/5326</a></div><div>When we discussed it at the Re=
dfish working group meeting today the group generally supported adding one =
or more new properties to the LogService schema for describing a log&#39;s =
&quot;purpose&quot; (i.e. content type, in contrast to format type). (It se=
emed like using &quot;Name&quot; to differentiate a log&#39;s purpose is po=
ssible but not encouraged.) The next step will be to create=C2=A0a proposal=
 for the new properties.</div><div><br></div><div>Best Regards,</div><div>C=
laire</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Mon, Oct 31, 2022 at 8:53 AM Ed Tanous &lt;<a href=3D"mailto:=
edtanous@google.com">edtanous@google.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">On Tue, Oct 25, 2022 at 6:19 PM Cla=
ire Weinan &lt;<a href=3D"mailto:cweinan@google.com" target=3D"_blank">cwei=
nan@google.com</a>&gt; wrote:<br>
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

--00000000000055640405ec6e6511--
