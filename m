Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AD1131B8F
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2020 23:37:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47s9PH6FBNzDqH4
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 09:37:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2e;
 helo=mail-yb1-xb2e.google.com; envelope-from=james.mihm@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="K5FtjEqz"; 
 dkim-atps=neutral
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47s9Nd2J14zDq9S
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jan 2020 09:36:43 +1100 (AEDT)
Received: by mail-yb1-xb2e.google.com with SMTP id n66so22802545ybg.0
 for <openbmc@lists.ozlabs.org>; Mon, 06 Jan 2020 14:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BMWAJjaI/jFmmxy3ufoXWTOt9hLi55ZZW3m7rJtM210=;
 b=K5FtjEqznEZVJUaqjP576vu+FjRYR0SRz6iLmVaNTUvOlfMGuusJwK8sgEQXr93h/s
 acuToAOy2iTn/RE5UbMaUkZfRsGmvDswdVYiC1ae3p1OueMDd+Ny6c3Obp8bgdAToImL
 kN5B+sI8LyL5e0R8WiKXazL/kEqtBiojIkIevEPVnM772gKnl7bLmSlruLb4AozCDYQ7
 7o7H67Bq1dTcliK7WCuU+Fa81wa44yGjvPRatsafz/XAOvXFSb3JdkY5biLXwZMy3syQ
 T8o8RTUi1MG2G6oxRZyqGEC0VTQseH56c5WbMZbuDBWlvzCwUKh2bcWVHnMnCUatvJD/
 W4ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BMWAJjaI/jFmmxy3ufoXWTOt9hLi55ZZW3m7rJtM210=;
 b=igLi1VJv+aPJcL9u8loDqI8xA3Gwem7KjKKzpsZywD0kqL6C27UAR0LdGf4ftmIu4K
 3A/f1DjbTy1Kpeob6/QX/bqkGiilkpON6vZJnagR1YDG1Q4kyrrCnRn37xD8HeAbiNGu
 VIS2MveKxKHoKkdKjO41iJQjKSYbicTyD5/wbqA0fgFQTJfOyEHGFJf6zNhrJnInRqQC
 Nk4/1tLZutFNQP9PU1vFXjX2tFhqLYvREsTUIbogHl/pSEL+LDsEHrKExm//315fFQdn
 kA+j/Ne6cQ9P3YuspVSZ+9umS5SwlsBZ6C875zWrpQcAYKeG2pgDLqtUCEa/bw7TtXs6
 ma3Q==
X-Gm-Message-State: APjAAAUNW+KuGLqI/eae/WJtdEkmLDyQHWqcOTfsSe3HwqjoEyFFJMu8
 yVWBfqCKj8yqhU3zls4/FjM28JnEv/O6MSF//Fg=
X-Google-Smtp-Source: APXvYqwS4dtvxnfaBzNWr0Ygu+jeNszByxbCey7Sg7/qXQpDOahAKltZRpVEOYDo6cX/J9ZnhLbywTwc9jOMhz4jSH8=
X-Received: by 2002:a5b:84b:: with SMTP id v11mr75501717ybq.367.1578350200051; 
 Mon, 06 Jan 2020 14:36:40 -0800 (PST)
MIME-Version: 1.0
References: <CAG5OiwjaiBnGw17NZdW4=XDmiWpuEM=z5_jsTcJ8ws=p1umeRQ@mail.gmail.com>
 <1fdc7be1-71f7-4926-83aa-a531de6d5b81@www.fastmail.com>
 <477d3fbb-5aa8-d4e8-958c-62fb94e2acc7@gmail.com>
 <b9ef7897-f4a7-445d-a79b-289b399528ee@www.fastmail.com>
 <391eaabe-6ade-e23d-97ef-a0c1d6630f8c@gmail.com>
 <8d4e9e9c-2568-4ab0-960c-7383a981fbbe@www.fastmail.com>
In-Reply-To: <8d4e9e9c-2568-4ab0-960c-7383a981fbbe@www.fastmail.com>
From: James Mihm <james.mihm@gmail.com>
Date: Mon, 6 Jan 2020 14:36:03 -0800
Message-ID: <CADy_Pt1tqqHjUaHER6T01kt_Wq6oqn6HtV=8Nn7KwK3CSMm7Ug@mail.gmail.com>
Subject: Re: OpenBMC Project metrics
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: multipart/alternative; boundary="000000000000015ed3059b804bba"
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
 Kurt Taylor <kurt.r.taylor@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000015ed3059b804bba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Getting caught up on emails and ARs.

I agree with the others that the context of metrics are not clear nor is
the goal in presenting this data as is.

When I look at the chart, it's not clear to me what it represents either. I
see from Kurts comment in this email that this graph represents the 'merge
metrics', but that is nowhere on the chart. There's also a disclaimer on
the wiki page that these metrics may not be a true representation of
project contribution. So, what's the true value of the metrics then?

What does the y-axis represent in units?
What repositories out of the 140 possible are represented in the graph?

I see charts like this as having one main purpose which is to communicate
who are making contributions, and how do they rank amongst the others. With
the target audience for the metrics being managers. Which bothers me,
because it's too subjective and ambiguous.

We do need to have a clear statement on the goal in providing a chart on
metrics. Here are my thoughts for what I would like to see in the metrics.
Which are focused on the what and not the who.

The primary goal is to represent a holistic view the openbmc project by
providing insight to the progress and health of the openbmc project.

Where progress is represented by the code that attains sufficient quality
to be merged upstream. I would include any upstream projects that were made
on behalf of the openbmc project (i.e., linux, u-boot, etc=E2=80=A6).

Health as measured by amount pull requests/code commits being made, reviews
that are in progress, the amount of code added versus deleted, abandoned
code, and aging of commits/reviews.

1 - To show source code contributions that make it into the upstream
repository (i.e., merged)
2 - To show incoming code contributions via pull requests or commits (i.e.,
being reviewed)
3 - To show lines of code additions, deletions, or abandoned
4 - To show contributions via review comments (i.e., number of review
comments)
5 - Snapshots in time weekly, bi-weekly, or monthly (x-axis)

Thanks,
James.

On Tue, Dec 10, 2019 at 3:14 PM Andrew Jeffery <andrew@aj.id.au> wrote:

> On Tue, 10 Dec 2019, at 04:54, krtaylor wrote:
> > On 12/8/19 6:06 PM, Andrew Jeffery wrote:
> > > On Sat, 7 Dec 2019, at 00:03, krtaylor wrote:
> > >> Measuring a project always improves it. That, and I have been
> > >> asked to start gathering metrics from several of our contributing
> > >> companies.
> > >
> > > Where did this discussion occur? Can you provide a link?
> >
> > The conversations have happen many times over the last 2 years.
> >
> > At TSC and community meetings (not recorded in the meeting minutes that
> > I could find, but it was discussed)
> >
> > At release planning meetings (see minutes):
> > https://github.com/openbmc/openbmc/wiki/Release-Planning
>
> Ah, okay, but it just briefly talks about metrics directly and not about
> the
> questions we're trying to answer with the metrics?
>
> >
> > I would rather not disclose email (without consent) that I have receive=
d
> > privately from several companies supporting this work.
>
> That's okay, but I'm still trying to understand motivations here.
>
> >
> > No one has ever had any objection to gathering this information (until
> > now). Remember, anyone can go see this information any time they want.
>
> I'm not objecting to gathering it at all, I'm objecting to the lack of
> context in
> presentation of the data. Why are we gathering it? What questions are we
> answering? "Who commits the most" is the first order question, but why ar=
e
> we asking it? Are we trying to establish the breadth of contributing
> companies?
> Are we trying to identify first time contributions from companies and wor=
k
> with
> them to drive further participation?
>
> > >
> > > I'm concerned that we're trying to create a stick to beat contributin=
g
> companies with
> > > rather than working to find ways increase contributions for mutual
> benefit. Competition
> > > works as a motivator when community members feel safe to take it on
> but I'm not sure
> > > the community is mature enough for that to be true. Adding the contex=
t
> for your
> > > statistics might help remove my concerns.
> >
> > Honestly I'm surprised at this reaction to a *potential* situation I
> > have never witnessed
>
> This is the problem with the lack of context. We can both have different
> ideas about the motivations because they aren't written down anywhere.
> It was just a concern of mine, I'm not claiming that it _is_ the
> motivation,
> and I certainly hope that it's not. My concern could be eliminated if we
> wrote down why we're gathering the metrics.
>
> > but, I am willing to add any wording that you feel
> > is necessary to create a safe development environment.
>
> I don't think it's about adding words here to create a safe environment,
> just
> I don't expect everyone engaging with the project has 20+ years of
> experience
> in open source software development. Open source work can be intimidating
> with scrutiny that can be applied through code review and other
> interactions,
> and not everyone is comfortable with that out of the gate. Certainly we'v=
e
> done a lot of work internal to IBM to help people become comfortable with
> working in open source. What I'd hate to see is people being discouraged
> from
> interacting in the upstream community through metrics that don't have cle=
ar
> goals.
>
> OpenBMC is flipping the switch on what was a very propriety ecosystem, an=
d
> we will have contributors that don't have strong backgrounds in open
> source.
> If the metrics have been discussed in meetings that's fine, but I'd hope
> the
> context would make its way out as well and be attached to the data that
> we've
> collected.
>
> >
> > I value your feedback. When do you feel we as a community are mature
> > enough to start monitoring reviews, commits, and other project data?
>
> As above I don't think that we can pick a point on a timeline, and I don'=
t
> think that's even the point. I think that there should be engagement
> through
> the general project channels (mailing list, IRC, not targeted meetings wi=
th
> limited audiences) to determine what we're trying to measure, gather the
> data, and then _present the data in the context of the question we're
> trying
> to answer_. My consistent complaint is the lack of context.
>
> > Should we hide this "early" data until some future time when it
> > represents everyone equally?
>
> No, I think you have a misunderstanding of my point here. We just need
> to make the question that we're answering is provided with the view of
> the data. Context is important.
>
> > Personally, I don't feel like we will ever
> > get to that place. There will always be people that contribute more in
> > one particular area than others and they just can't be upset that they
> > may have done less. Open Source requires thick skin.
>
> It shouldn't necessarily, and we need to work at making sure we're
> approachable as a community. Providing context with metrics will give
> people the information they need to know how the metrics are being
> used by the project.
>
> >
> > Eventually, I'd like to break this data down by project and individual,
> > not just company.
>
> But why? I keep asking this. It's not because there's not a valid answer
> and I'm trying to trap you, I just want to understand what the motivation=
s
> are.
>
> Anyway, Github provides some of this information for us already. For
> example:
>
> https://github.com/openbmc/openbmc/graphs/contributors
>
> Cheers,
>
> Andrew
>

--000000000000015ed3059b804bba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Getting caught up on emails and ARs.=
</div><div><br></div><div>I
agree with the others that the context of metrics are not clear nor is the =
goal
in presenting this data as is. <br>
<br>
When I look at the chart, it&#39;s not clear to me what it represents eithe=
r. I see from
Kurts comment in this email that this graph represents the &#39;merge metri=
cs&#39;, but
that is nowhere on the chart. There&#39;s also a disclaimer on the wiki pag=
e that
these metrics may not be a true representation of project contribution. So,
what&#39;s the true value of the metrics then?<br>
<br>
What does the y-axis represent in units? <br>
What repositories out of the 140 possible are represented in the
graph?<br>
<br>
I see charts like this as having one main purpose which is to communicate w=
ho
are making contributions, and how do they rank amongst the others. With the
target audience for the metrics being managers. Which bothers me, because i=
t&#39;s
too subjective and ambiguous.<br>
<br>
We do need to have a clear statement on the goal in providing a chart on
metrics. Here are my thoughts for what I would like to see in the
metrics. Which are focused on the what and not the who.<br>
<br>
The primary goal is to represent a holistic view the openbmc project by
providing insight to the progress and health of the openbmc
project.<br>
<br>
Where progress is represented by the code that attains sufficient quality t=
o be
merged upstream. I would include any upstream projects that were made on be=
half
of the openbmc project (i.e., linux, u-boot, etc=E2=80=A6).<br>
<br>
Health as measured by amount pull requests/code commits being made, reviews
that are in progress, the amount of code added versus deleted, abandoned co=
de,
and aging of commits/reviews. <br>
<br>
1 - To show source code contributions that make it into the upstream reposi=
tory
(i.e., merged)<br>
2 - To show incoming code contributions via pull requests or commits (i.e.,
being reviewed)<br>
3 - To show lines of code additions, deletions, or abandoned<br>4 - To show=
 contributions via review comments (i.e., number of review comments)</div><=
div>5 - Snapshots in time weekly, bi-weekly, or monthly (x-axis)<br>=C2=A0<=
/div><div>Thanks,</div><div>James.</div></div></div><br><div class=3D"gmail=
_quote"><div class=3D"gmail_attr" dir=3D"ltr">On Tue, Dec 10, 2019 at 3:14 =
PM Andrew Jeffery &lt;<a href=3D"mailto:andrew@aj.id.au">andrew@aj.id.au</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;padding-left:1ex;border-left-color:rgb(204,204,204);border-l=
eft-width:1px;border-left-style:solid">On Tue, 10 Dec 2019, at 04:54, krtay=
lor wrote:<br>
&gt; On 12/8/19 6:06 PM, Andrew Jeffery wrote:<br>
&gt; &gt; On Sat, 7 Dec 2019, at 00:03, krtaylor wrote:<br>
&gt; &gt;&gt; Measuring a project always improves it. That, and I have been=
<br>
&gt; &gt;&gt; asked to start gathering metrics from several of our contribu=
ting<br>
&gt; &gt;&gt; companies.<br>
&gt; &gt; <br>
&gt; &gt; Where did this discussion occur? Can you provide a link?<br>
&gt; <br>
&gt; The conversations have happen many times over the last 2 years.<br>
&gt; <br>
&gt; At TSC and community meetings (not recorded in the meeting minutes tha=
t <br>
&gt; I could find, but it was discussed)<br>
&gt; <br>
&gt; At release planning meetings (see minutes):<br>
&gt; <a href=3D"https://github.com/openbmc/openbmc/wiki/Release-Planning" t=
arget=3D"_blank" rel=3D"noreferrer">https://github.com/openbmc/openbmc/wiki=
/Release-Planning</a><br>
<br>
Ah, okay, but it just briefly talks about metrics directly and not about th=
e<br>
questions we&#39;re trying to answer with the metrics?<br>
<br>
&gt; <br>
&gt; I would rather not disclose email (without consent) that I have receiv=
ed <br>
&gt; privately from several companies supporting this work.<br>
<br>
That&#39;s okay, but I&#39;m still trying to understand motivations here.<b=
r>
<br>
&gt; <br>
&gt; No one has ever had any objection to gathering this information (until=
 <br>
&gt; now). Remember, anyone can go see this information any time they want.=
<br>
<br>
I&#39;m not objecting to gathering it at all, I&#39;m objecting to the lack=
 of context in<br>
presentation of the data. Why are we gathering it? What questions are we<br=
>
answering? &quot;Who commits the most&quot; is the first order question, bu=
t why are<br>
we asking it? Are we trying to establish the breadth of contributing compan=
ies?<br>
Are we trying to identify first time contributions from companies and work =
with<br>
them to drive further participation?<br>
<br>
&gt; &gt; <br>
&gt; &gt; I&#39;m concerned that we&#39;re trying to create a stick to beat=
 contributing companies with<br>
&gt; &gt; rather than working to find ways increase contributions for mutua=
l benefit. Competition<br>
&gt; &gt; works as a motivator when community members feel safe to take it =
on but I&#39;m not sure<br>
&gt; &gt; the community is mature enough for that to be true. Adding the co=
ntext for your<br>
&gt; &gt; statistics might help remove my concerns.<br>
&gt; <br>
&gt; Honestly I&#39;m surprised at this reaction to a *potential* situation=
 I <br>
&gt; have never witnessed<br>
<br>
This is the problem with the lack of context. We can both have different<br=
>
ideas about the motivations because they aren&#39;t written down anywhere.<=
br>
It was just a concern of mine, I&#39;m not claiming that it _is_ the motiva=
tion,<br>
and I certainly hope that it&#39;s not. My concern could be eliminated if w=
e<br>
wrote down why we&#39;re gathering the metrics.<br>
<br>
&gt; but, I am willing to add any wording that you feel <br>
&gt; is necessary to create a safe development environment.<br>
<br>
I don&#39;t think it&#39;s about adding words here to create a safe environ=
ment, just<br>
I don&#39;t expect everyone engaging with the project has 20+ years of expe=
rience<br>
in open source software development. Open source work can be intimidating<b=
r>
with scrutiny that can be applied through code review and other interaction=
s,<br>
and not everyone is comfortable with that out of the gate. Certainly we&#39=
;ve<br>
done a lot of work internal to IBM to help people become comfortable with<b=
r>
working in open source. What I&#39;d hate to see is people being discourage=
d from<br>
interacting in the upstream community through metrics that don&#39;t have c=
lear<br>
goals.<br>
<br>
OpenBMC is flipping the switch on what was a very propriety ecosystem, and<=
br>
we will have contributors that don&#39;t have strong backgrounds in open so=
urce.<br>
If the metrics have been discussed in meetings that&#39;s fine, but I&#39;d=
 hope the<br>
context would make its way out as well and be attached to the data that we&=
#39;ve<br>
collected.<br>
<br>
&gt; <br>
&gt; I value your feedback. When do you feel we as a community are mature <=
br>
&gt; enough to start monitoring reviews, commits, and other project data? <=
br>
<br>
As above I don&#39;t think that we can pick a point on a timeline, and I do=
n&#39;t<br>
think that&#39;s even the point. I think that there should be engagement th=
rough<br>
the general project channels (mailing list, IRC, not targeted meetings with=
<br>
limited audiences) to determine what we&#39;re trying to measure, gather th=
e<br>
data, and then _present the data in the context of the question we&#39;re t=
rying<br>
to answer_. My consistent complaint is the lack of context.<br>
<br>
&gt; Should we hide this &quot;early&quot; data until some future time when=
 it <br>
&gt; represents everyone equally? <br>
<br>
No, I think you have a misunderstanding of my point here. We just need<br>
to make the question that we&#39;re answering is provided with the view of<=
br>
the data. Context is important.<br>
<br>
&gt; Personally, I don&#39;t feel like we will ever <br>
&gt; get to that place. There will always be people that contribute more in=
 <br>
&gt; one particular area than others and they just can&#39;t be upset that =
they <br>
&gt; may have done less. Open Source requires thick skin.<br>
<br>
It shouldn&#39;t necessarily, and we need to work at making sure we&#39;re<=
br>
approachable as a community. Providing context with metrics will give<br>
people the information they need to know how the metrics are being<br>
used by the project.<br>
<br>
&gt; <br>
&gt; Eventually, I&#39;d like to break this data down by project and indivi=
dual, <br>
&gt; not just company.<br>
<br>
But why? I keep asking this. It&#39;s not because there&#39;s not a valid a=
nswer<br>
and I&#39;m trying to trap you, I just want to understand what the motivati=
ons<br>
are.<br>
<br>
Anyway, Github provides some of this information for us already. For<br>
example:<br>
<br>
<a href=3D"https://github.com/openbmc/openbmc/graphs/contributors" target=
=3D"_blank" rel=3D"noreferrer">https://github.com/openbmc/openbmc/graphs/co=
ntributors</a><br>
<br>
Cheers,<br>
<br>
Andrew<br>
</blockquote></div>

--000000000000015ed3059b804bba--
