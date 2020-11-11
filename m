Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9CB2AE929
	for <lists+openbmc@lfdr.de>; Wed, 11 Nov 2020 07:40:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWFTV4mrszDqJc
	for <lists+openbmc@lfdr.de>; Wed, 11 Nov 2020 17:39:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12d;
 helo=mail-lf1-x12d.google.com; envelope-from=wak@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=LOp8UtlK; dkim-atps=neutral
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWFSl5dKszDqG9
 for <openbmc@lists.ozlabs.org>; Wed, 11 Nov 2020 17:39:12 +1100 (AEDT)
Received: by mail-lf1-x12d.google.com with SMTP id d17so1661407lfq.10
 for <openbmc@lists.ozlabs.org>; Tue, 10 Nov 2020 22:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SHHM/dGTMKYIxjCd4CoXvtukP0UH2o8XOZ1iAFh1eow=;
 b=LOp8UtlKXqGGxQWTOhdhxyslUVhzNIoBO5xOOplSHwGQewhhLJW1GAY2rsbiHjtMpz
 U9XxqYjIa6ejcPrnRRwFMqdEKumSchoa4LxWeoihlvdOU3O2xH+KGspzTgwbXFBG3+/P
 pouKuhtEUScxeDiK8yX6dps6hjI6doE9Ch8lWB9yicFThkj0SGJ06mlExTezEtr6cRi7
 0OxsYOEZegGbzJRnjwtfmK0s1wDFr6XhXOD+ARFpofyUc9omStr/Nr/W0jDSi5DBIml1
 GFt//wkufBV+cJsCJwXxVc3LGtNig8pkwKHjFfVnBtuf+CRQX2oJNb/fyzwnLG6sZNKz
 RYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SHHM/dGTMKYIxjCd4CoXvtukP0UH2o8XOZ1iAFh1eow=;
 b=SAeNZYbeK4ByfSYFf1yrJcAK7GRdzYeIWFuj6vMk/Zf/Tk4+U7r+5BiBjEv2SvJYtU
 mu7J6udFQi0XpbW+SYBp/agYaA4fOwPcGECDYligA/CGYneJ9WvLciKlma1WfOKUKm9Z
 ywDv55pJtE9Sre9uiFYnyGhInKrDO3/Onkg+0232CJcLED1t4b7ZMGJ7WSDiVldz2w7m
 NlK1PX0L1KuwCYGc0bWUM6R6yp80bMMr549eRaAflIvT6Esrm41l2gSZ9/FPPdubKTQR
 S3qIyt8iE2FCN/TG/uxDVa9zE8vQsHuQ4AizOQSo44zMO+J9sfXTGN6NawKW5DgtFwQr
 Py6A==
X-Gm-Message-State: AOAM531wkNQC5J2Y/lX52j7UwZHz+oHPlAeQN7z27kFsBc3w6ZUL+mXi
 b3vaE6e7OFD9VUEASi1tzhNtJZmWj0x33pd3OhYY+A==
X-Google-Smtp-Source: ABdhPJz6optpchcIx9TEe31DdoKMVN/wt/j87FYL9Z6tWZZp/K7WruMhzU8xcHJ7kC2MiYqVwisi872HbSbhKGgbzyA=
X-Received: by 2002:a19:c1:: with SMTP id 184mr5120723lfa.170.1605076746501;
 Tue, 10 Nov 2020 22:39:06 -0800 (PST)
MIME-Version: 1.0
References: <CAJOps0sd-YFr5P+_N0i78pd9akBJS6DP99wugKvUDOGpXw2pcA@mail.gmail.com>
 <D355FA68-E163-4DA8-861E-7E9DB68F5EEB@fb.com>
 <CAJOps0uX9K25NgXpi3M45F=pvvW5Am+9R=wYTLN0SZ2vPUcX-A@mail.gmail.com>
 <EF663847-4E98-4AC2-8A8C-E37B853C131F@fb.com>
 <CAJOps0tR5t4sJQX0-fhBJuKJSnQZJm12gWV9S0OYv4xWU7uzKQ@mail.gmail.com>
 <20201007014324.GG6152@heinlein>
 <CAJOps0tKN4ACB46hoNu1EeX4uaSZ_UeArzcZ=ehGA2sz0oT+aQ@mail.gmail.com>
 <BC4115A9-0587-4135-981E-38C086DDD3F9@fb.com>
In-Reply-To: <BC4115A9-0587-4135-981E-38C086DDD3F9@fb.com>
From: William Kennington <wak@google.com>
Date: Tue, 10 Nov 2020 22:38:55 -0800
Message-ID: <CAPnigKn5cRVz3RuK-czkHVo2od1ZLpHCVgRu9q4OET-_nPwrWw@mail.gmail.com>
Subject: Re: Request to create repository google-ipmi-bmc-health
To: Vijay Khemka <vijaykhemka@fb.com>
Content-Type: multipart/alternative; boundary="00000000000050647c05b3cf0ddc"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Sui Chen <suichen@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000050647c05b3cf0ddc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

My 2c... We have plenty of blob handlers that have their own repos to keep
maintainership and purposes separate. The phosphor-ipmi-blobs
repository intends to provide a framework, not specific implementations.

On Tue, Nov 10, 2020 at 10:35 PM Vijay Khemka <vijaykhemka@fb.com> wrote:

>
>
> =EF=BB=BFOn 11/5/20, 3:55 PM, "Sui Chen" <suichen@google.com> wrote:
>
>     On Tue, Oct 6, 2020 at 6:43 PM Patrick Williams <patrick@stwcx.xyz>
> wrote:
>     >
>     > On Tue, Oct 06, 2020 at 03:57:30PM -0700, Sui Chen wrote:
>     > > On Fri, Oct 2, 2020 at 1:54 PM Vijay Khemka <vijaykhemka@fb.com>
> wrote:
>     > > > If I understand correctly, protocol buffer will be used by
> daemon who
>     > > > Is responding to the IPMI request and connecting to this daemon
> via
>     > > > library call, then it is completely restricted for the use of
> protocol buffer.
>     > > > If you are passing protocol buffer to this daemon then we have
> to define
>     > > > some policy here.
>     > >
>     > > The Protocol buffer is only for serializing the data to be sent
>     > > outside of the BMC. It is not used for communication inside
>     > > phosphor-health-monitor and will not be passed to the daemon.
>     >
>     > Why isn't this part done from within an existing IPMI provider
> (ideally
>     > to me a google-ipmi-* repository at this time)?  I'm not especially
> keen
>     > on these details leaking out into other non-IPMI repositories.
>     >
>     > > >
>     > > >     Other than these two things I think adding new metrics to
>     > > >     phosphor-health-monitor should be manageable. I can start b=
y
> trying to
>     > > >     add the IPMI blob handler to phosphor-health-monitor; my
> first attempt
>     > > >     might not look very elegant, but if we find answers to the
> two
>     > > >     questions above, the merged result will look a lot better.
> Hopefully
>     > > >     we can find a solution that works well for everyone.
>     > > >
>     > > > I am looking forward to your patches
>     > >
>     > > Please check out this WIP:
>     > >
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-health-monitor/+/37=
092
>     > >
>     > > This WIP currently just adds the IPMI blob-based code to
>     > > phosphor-health-monitor almost as-is.
>     > > It also shows what we already have now.
>     > >
>     > > There will be some work to merge the daemon and the blob handler
> in an
>     > > organic way, and I am open to discussion with you how to do that.
> The
>     > > first step I think I can do is to put the code for extracting the
>     > > metrics (metrics.cpp, blob/metric.cpp) into a single file and sha=
re
>     > > that between the daemon and the IPMI blob handler.
>     > >
>     > > Another issue I found is I am not using the latest sdbusplus so I
> have
>     > > to comment out the usage of ValueIface::Unit::Percent for now.
>     > >
>     > > To build this requires 1) adding a pkgconfig file to
>     > > phosphor-ipmi-blobs (before
>     > >
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-ipmi-blobs/+/37133
>     > > gets merged) and 2) adding phosphor-ipmi-blobs and protobuf to
> DEPENDS
>     > > in phosphor-health-monitor's Bitbake recipe.
>     > >
>     > > Hope this WIP change illustrates our intention clearly.
>     > >
>     > > Thanks!
>     >
>     > --
>     > Patrick Williams
>
>
>     Hello Patrick and Vijay,
>
>     As far as I know, the only two "google-ipmi-*" repositories are 1)
>     google-ipmi-sys and 2) google-ipmi-i2c, and neither seem to be relate=
d
>     to the health monitoring task we're doing right now.
>     In my understanding one similar library is phosphor-pid-control; its
>     IPMI handler is also in the repository rather than in a separate
>     repository.
>
>     The "health monitoring IPMI Blob Handler" (that the request in the
>     first email in this thread was indended for) was a monolithic IPMI
>     blob handler; it used to both generate metrics and handle IPMI
>     requests.
>     In the last month, I had de-coupled these two functions so the IPMI
>     blob handler does not generate metrics but reads metrics from the
>     daemon in phosphor-health-monitor via DBus. In other words, the
> "monolithic"
>     handler has now become a thin layer. On the other hand,
>     phosphor-health-monitor will have to be significantly modified to
>     generate the metrics that are in a different format from what it's
>     generating right now, and Vijay and I are working on that. I had
> create a chain
>     of changes
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-health-monitor/+/37=
659
>     to illustrate what I intend to do.
>     As a result, there comes the question of where the IPMI blob handler
>     should live, and it appears I have the following choices:
>     1. in phosphor-health-monitor, or
>     2. some centralized location, along with many other IPMI blob
> handlers, or
>     3. as a separate, new repository, or
>     4. something else?
>
>     I am facing a confusing situation as to where I should put the IPMI
>     blob handler, due to conflicting opinions:
>     1. The maintainers of phosphor-ipmi-blobs told me it's not desirable
>     to put all IPMI blob handlers into the same place.
>     2. By reading this email thread, I had the impression that it's not a
>     good idea to create too many repositories either.
>     3. Because of #1 and #2, I felt we should put the IPMI blob handler
>     into phosphor-health-monitor itself, just like phosphor-pid-control
>     does.
>     4. In the last reply from Patrick it sounds it's a bad idea to put th=
e
>     IPMI blob handler into phosphor-health-monitor because of IPMI detail=
s
>     leaking out into non-IPMI repositories.
>     5. Vijay seemed to prefer to have all IPMI blob handlers in one place
>     based on our discussion on IRC. However, according to #1 this is goin=
g
>     to face pushback. As such, I created all my changes in
>     phosphor-health-monitor for review and for showing my intent on how
>     the IPMI implementation is done.
>     6. Because of #4 and #5, it sounds like I can't put the IPMI blob
> handler into
>     phosphor-health-monitor either.
>     So now, there is no place I can place this handler, and I am now at a
> dead end.
>
> I still feel that this should go to phosphor-ipmi-blobs, you can create a
> separate
> directory (handler) under the same repo and it can become home for all th=
e
> futures blob handler as these are going to interact with ipmi blobs anywa=
y.
>
>     I need to find a way out and would greatly appreciate it if we can
>     reach a consensus here so that BMC health monitoring can move forward=
.
>
>     Thanks!
>
>

--00000000000050647c05b3cf0ddc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">My 2c... We have plenty of blob handlers that have their o=
wn repos to keep maintainership and purposes separate. The phosphor-ipmi-bl=
obs repository=C2=A0intends to provide a framework, not specific implementa=
tions.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Tue, Nov 10, 2020 at 10:35 PM Vijay Khemka &lt;<a href=3D"mailto:v=
ijaykhemka@fb.com">vijaykhemka@fb.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><br>
<br>
=EF=BB=BFOn 11/5/20, 3:55 PM, &quot;Sui Chen&quot; &lt;<a href=3D"mailto:su=
ichen@google.com" target=3D"_blank">suichen@google.com</a>&gt; wrote:<br>
<br>
=C2=A0 =C2=A0 On Tue, Oct 6, 2020 at 6:43 PM Patrick Williams &lt;<a href=
=3D"mailto:patrick@stwcx.xyz" target=3D"_blank">patrick@stwcx.xyz</a>&gt; w=
rote:<br>
=C2=A0 =C2=A0 &gt;<br>
=C2=A0 =C2=A0 &gt; On Tue, Oct 06, 2020 at 03:57:30PM -0700, Sui Chen wrote=
:<br>
=C2=A0 =C2=A0 &gt; &gt; On Fri, Oct 2, 2020 at 1:54 PM Vijay Khemka &lt;<a =
href=3D"mailto:vijaykhemka@fb.com" target=3D"_blank">vijaykhemka@fb.com</a>=
&gt; wrote:<br>
=C2=A0 =C2=A0 &gt; &gt; &gt; If I understand correctly, protocol buffer wil=
l be used by daemon who<br>
=C2=A0 =C2=A0 &gt; &gt; &gt; Is responding to the IPMI request and connecti=
ng to this daemon via<br>
=C2=A0 =C2=A0 &gt; &gt; &gt; library call, then it is completely restricted=
 for the use of protocol buffer.<br>
=C2=A0 =C2=A0 &gt; &gt; &gt; If you are passing protocol buffer to this dae=
mon then we have to define<br>
=C2=A0 =C2=A0 &gt; &gt; &gt; some policy here.<br>
=C2=A0 =C2=A0 &gt; &gt;<br>
=C2=A0 =C2=A0 &gt; &gt; The Protocol buffer is only for serializing the dat=
a to be sent<br>
=C2=A0 =C2=A0 &gt; &gt; outside of the BMC. It is not used for communicatio=
n inside<br>
=C2=A0 =C2=A0 &gt; &gt; phosphor-health-monitor and will not be passed to t=
he daemon.<br>
=C2=A0 =C2=A0 &gt;<br>
=C2=A0 =C2=A0 &gt; Why isn&#39;t this part done from within an existing IPM=
I provider (ideally<br>
=C2=A0 =C2=A0 &gt; to me a google-ipmi-* repository at this time)?=C2=A0 I&=
#39;m not especially keen<br>
=C2=A0 =C2=A0 &gt; on these details leaking out into other non-IPMI reposit=
ories.<br>
=C2=A0 =C2=A0 &gt;<br>
=C2=A0 =C2=A0 &gt; &gt; &gt;<br>
=C2=A0 =C2=A0 &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Other than these two things=
 I think adding new metrics to<br>
=C2=A0 =C2=A0 &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0phosphor-health-monitor sho=
uld be manageable. I can start by trying to<br>
=C2=A0 =C2=A0 &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0add the IPMI blob handler t=
o phosphor-health-monitor; my first attempt<br>
=C2=A0 =C2=A0 &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0might not look very elegant=
, but if we find answers to the two<br>
=C2=A0 =C2=A0 &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0questions above, the merged=
 result will look a lot better. Hopefully<br>
=C2=A0 =C2=A0 &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0we can find a solution that=
 works well for everyone.<br>
=C2=A0 =C2=A0 &gt; &gt; &gt;<br>
=C2=A0 =C2=A0 &gt; &gt; &gt; I am looking forward to your patches<br>
=C2=A0 =C2=A0 &gt; &gt;<br>
=C2=A0 =C2=A0 &gt; &gt; Please check out this WIP:<br>
=C2=A0 =C2=A0 &gt; &gt; <a href=3D"https://gerrit.openbmc-project.xyz/c/ope=
nbmc/phosphor-health-monitor/+/37092" rel=3D"noreferrer" target=3D"_blank">=
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-health-monitor/+/3709=
2</a> <br>
=C2=A0 =C2=A0 &gt; &gt;<br>
=C2=A0 =C2=A0 &gt; &gt; This WIP currently just adds the IPMI blob-based co=
de to<br>
=C2=A0 =C2=A0 &gt; &gt; phosphor-health-monitor almost as-is.<br>
=C2=A0 =C2=A0 &gt; &gt; It also shows what we already have now.<br>
=C2=A0 =C2=A0 &gt; &gt;<br>
=C2=A0 =C2=A0 &gt; &gt; There will be some work to merge the daemon and the=
 blob handler in an<br>
=C2=A0 =C2=A0 &gt; &gt; organic way, and I am open to discussion with you h=
ow to do that. The<br>
=C2=A0 =C2=A0 &gt; &gt; first step I think I can do is to put the code for =
extracting the<br>
=C2=A0 =C2=A0 &gt; &gt; metrics (metrics.cpp, blob/metric.cpp) into a singl=
e file and share<br>
=C2=A0 =C2=A0 &gt; &gt; that between the daemon and the IPMI blob handler.<=
br>
=C2=A0 =C2=A0 &gt; &gt;<br>
=C2=A0 =C2=A0 &gt; &gt; Another issue I found is I am not using the latest =
sdbusplus so I have<br>
=C2=A0 =C2=A0 &gt; &gt; to comment out the usage of ValueIface::Unit::Perce=
nt for now.<br>
=C2=A0 =C2=A0 &gt; &gt;<br>
=C2=A0 =C2=A0 &gt; &gt; To build this requires 1) adding a pkgconfig file t=
o<br>
=C2=A0 =C2=A0 &gt; &gt; phosphor-ipmi-blobs (before<br>
=C2=A0 =C2=A0 &gt; &gt; <a href=3D"https://gerrit.openbmc-project.xyz/c/ope=
nbmc/phosphor-ipmi-blobs/+/37133" rel=3D"noreferrer" target=3D"_blank">http=
s://gerrit.openbmc-project.xyz/c/openbmc/phosphor-ipmi-blobs/+/37133</a> <b=
r>
=C2=A0 =C2=A0 &gt; &gt; gets merged) and 2) adding phosphor-ipmi-blobs and =
protobuf to DEPENDS<br>
=C2=A0 =C2=A0 &gt; &gt; in phosphor-health-monitor&#39;s Bitbake recipe.<br=
>
=C2=A0 =C2=A0 &gt; &gt;<br>
=C2=A0 =C2=A0 &gt; &gt; Hope this WIP change illustrates our intention clea=
rly.<br>
=C2=A0 =C2=A0 &gt; &gt;<br>
=C2=A0 =C2=A0 &gt; &gt; Thanks!<br>
=C2=A0 =C2=A0 &gt;<br>
=C2=A0 =C2=A0 &gt; --<br>
=C2=A0 =C2=A0 &gt; Patrick Williams<br>
<br>
<br>
=C2=A0 =C2=A0 Hello Patrick and Vijay,<br>
<br>
=C2=A0 =C2=A0 As far as I know, the only two &quot;google-ipmi-*&quot; repo=
sitories are 1)<br>
=C2=A0 =C2=A0 google-ipmi-sys and 2) google-ipmi-i2c, and neither seem to b=
e related<br>
=C2=A0 =C2=A0 to the health monitoring task we&#39;re doing right now.<br>
=C2=A0 =C2=A0 In my understanding one similar library is phosphor-pid-contr=
ol; its<br>
=C2=A0 =C2=A0 IPMI handler is also in the repository rather than in a separ=
ate<br>
=C2=A0 =C2=A0 repository.<br>
<br>
=C2=A0 =C2=A0 The &quot;health monitoring IPMI Blob Handler&quot; (that the=
 request in the<br>
=C2=A0 =C2=A0 first email in this thread was indended for) was a monolithic=
 IPMI<br>
=C2=A0 =C2=A0 blob handler; it used to both generate metrics and handle IPM=
I<br>
=C2=A0 =C2=A0 requests.<br>
=C2=A0 =C2=A0 In the last month, I had de-coupled these two functions so th=
e IPMI<br>
=C2=A0 =C2=A0 blob handler does not generate metrics but reads metrics from=
 the<br>
=C2=A0 =C2=A0 daemon in phosphor-health-monitor via DBus. In other words, t=
he &quot;monolithic&quot;<br>
=C2=A0 =C2=A0 handler has now become a thin layer. On the other hand,<br>
=C2=A0 =C2=A0 phosphor-health-monitor will have to be significantly modifie=
d to<br>
=C2=A0 =C2=A0 generate the metrics that are in a different format from what=
 it&#39;s<br>
=C2=A0 =C2=A0 generating right now, and Vijay and I are working on that. I =
had create a chain<br>
=C2=A0 =C2=A0 of changes <a href=3D"https://gerrit.openbmc-project.xyz/c/op=
enbmc/phosphor-health-monitor/+/37659" rel=3D"noreferrer" target=3D"_blank"=
>https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-health-monitor/+/376=
59</a> <br>
=C2=A0 =C2=A0 to illustrate what I intend to do.<br>
=C2=A0 =C2=A0 As a result, there comes the question of where the IPMI blob =
handler<br>
=C2=A0 =C2=A0 should live, and it appears I have the following choices:<br>
=C2=A0 =C2=A0 1. in phosphor-health-monitor, or<br>
=C2=A0 =C2=A0 2. some centralized location, along with many other IPMI blob=
 handlers, or<br>
=C2=A0 =C2=A0 3. as a separate, new repository, or<br>
=C2=A0 =C2=A0 4. something else?<br>
<br>
=C2=A0 =C2=A0 I am facing a confusing situation as to where I should put th=
e IPMI<br>
=C2=A0 =C2=A0 blob handler, due to conflicting opinions:<br>
=C2=A0 =C2=A0 1. The maintainers of phosphor-ipmi-blobs told me it&#39;s no=
t desirable<br>
=C2=A0 =C2=A0 to put all IPMI blob handlers into the same place.<br>
=C2=A0 =C2=A0 2. By reading this email thread, I had the impression that it=
&#39;s not a<br>
=C2=A0 =C2=A0 good idea to create too many repositories either.<br>
=C2=A0 =C2=A0 3. Because of #1 and #2, I felt we should put the IPMI blob h=
andler<br>
=C2=A0 =C2=A0 into phosphor-health-monitor itself, just like phosphor-pid-c=
ontrol<br>
=C2=A0 =C2=A0 does.<br>
=C2=A0 =C2=A0 4. In the last reply from Patrick it sounds it&#39;s a bad id=
ea to put the<br>
=C2=A0 =C2=A0 IPMI blob handler into phosphor-health-monitor because of IPM=
I details<br>
=C2=A0 =C2=A0 leaking out into non-IPMI repositories.<br>
=C2=A0 =C2=A0 5. Vijay seemed to prefer to have all IPMI blob handlers in o=
ne place<br>
=C2=A0 =C2=A0 based on our discussion on IRC. However, according to #1 this=
 is going<br>
=C2=A0 =C2=A0 to face pushback. As such, I created all my changes in<br>
=C2=A0 =C2=A0 phosphor-health-monitor for review and for showing my intent =
on how<br>
=C2=A0 =C2=A0 the IPMI implementation is done.<br>
=C2=A0 =C2=A0 6. Because of #4 and #5, it sounds like I can&#39;t put the I=
PMI blob handler into<br>
=C2=A0 =C2=A0 phosphor-health-monitor either.<br>
=C2=A0 =C2=A0 So now, there is no place I can place this handler, and I am =
now at a dead end.<br>
<br>
I still feel that this should go to phosphor-ipmi-blobs, you can create a s=
eparate<br>
directory (handler) under the same repo and it can become home for all the<=
br>
futures blob handler as these are going to interact with ipmi blobs anyway.=
<br>
<br>
=C2=A0 =C2=A0 I need to find a way out and would greatly appreciate it if w=
e can<br>
=C2=A0 =C2=A0 reach a consensus here so that BMC health monitoring can move=
 forward.<br>
<br>
=C2=A0 =C2=A0 Thanks!<br>
<br>
</blockquote></div>

--00000000000050647c05b3cf0ddc--
