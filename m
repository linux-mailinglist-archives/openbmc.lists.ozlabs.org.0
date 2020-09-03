Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D6E25B937
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 05:30:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhmXY0WNrzDr3D
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 13:30:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::234;
 helo=mail-lj1-x234.google.com; envelope-from=rhanley@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=J/h99prE; dkim-atps=neutral
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhmWl6Z0tzDqw8
 for <openbmc@lists.ozlabs.org>; Thu,  3 Sep 2020 13:29:38 +1000 (AEST)
Received: by mail-lj1-x234.google.com with SMTP id w3so1771277ljo.5
 for <openbmc@lists.ozlabs.org>; Wed, 02 Sep 2020 20:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DCetx3NO7xTVFsMWjejSnEIlHar0hjsqYkAhv27sXEI=;
 b=J/h99prEYI/2X0L1YJCH0YoCpHTGZomMgBcZ0gq2wvpK4btrFjje+fy/nVuuvuzNad
 vDlOVQx7U+g1zsks7c1u61sSiq7N49Z6RP2cU3BAuJ9hzOodsu8y5sA//Df1Re1N+FlW
 ZOj7kRhbRDOrDKgNbCcQuyBPl6H4AoS4Nds2PdTz7OKalNkVZQi0PhqNLDSWIq7zIMcJ
 TZ3PNVQDDzlSiQYQElwDiTRkcfKpMjjvGPEjUVM/yzOzLp2AyWv9FH6V7T9nLJU6is6r
 lFbsTgTI6OVfiHrexYcJyISRAvOjt1AXRmjHElKeEW0l+WMrprGM8qm6FqjTsMqw3JyM
 5qUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DCetx3NO7xTVFsMWjejSnEIlHar0hjsqYkAhv27sXEI=;
 b=MqI9avzioL8Ou6pvdxQ9vg2ZK0a+pglt09w292pK4E+lQdppfT+OEDpiJJ7WDp84c+
 2QPOQO/SIUrJ1zLgPb2t7F+oCqOBhBileNBTLX95cK+7953Hc+59ElcphK7N1EAAZPgR
 8tBP0KkJipYU7yxLp9aKy8SAa3dfKLWzdwTv5qSHGIfPOz4oUnorTM1pCN5S2zbnq95N
 xiB6MNDEr0LYA7lidk/L17SQETvtVeS9sFX1ta0wDnOV0jA+G7aBjDKmOEP5GvAkdeCR
 KkZZIlH8QSA2YmsXD46wJ7Dgv4nFMlLGJ72wwhS5h9uk//ljJSSgSOSfAuX7DHfx63C1
 svTw==
X-Gm-Message-State: AOAM532VRVcNDLuF7Ds/F9mg2vIxXTNcryekfy1+BnSC2nVIfcIPIqsn
 cl0G173t2Ps3bdc9OPAjbo29tTPtQ35Pb2fQUQE5nYk+gbg=
X-Google-Smtp-Source: ABdhPJyGAMTKrp26LFhn4dSEAqSIvLUBnH9EwTmlgh8p1akWIDqKL1XuEsrvao83g0LWnGBNwkiNb8lzzhxmholZzas=
X-Received: by 2002:a2e:5857:: with SMTP id x23mr8945ljd.360.1599103773967;
 Wed, 02 Sep 2020 20:29:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAMXw96MQ-=Ftc5HjNThKd8A6X0hdBdjC43d6RJfzyDoN+b=7YQ@mail.gmail.com>
 <CACWQX82jRpfpeqc9a3kFA+08-CgyOjc8+jYU2Xh307hq-0_DHQ@mail.gmail.com>
 <419f732a-8d73-0450-fca6-b89d82fcd96c@linux.intel.com>
 <CAMXw96Onss5O3dRzV-vSV4bK=ri=QV0932cBSYpZS7U3G+_5kw@mail.gmail.com>
 <17248f66-6879-1118-9fdf-30295070d5d2@linux.intel.com>
In-Reply-To: <17248f66-6879-1118-9fdf-30295070d5d2@linux.intel.com>
From: Richard Hanley <rhanley@google.com>
Date: Wed, 2 Sep 2020 20:29:22 -0700
Message-ID: <CAH1kD+Yo8Yq-cHhRfYwvZbNXaG1_hbr0qCwNMOxT+PAB9rELHw@mail.gmail.com>
Subject: Re: Seek feedback: BMC console and debug info
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Content-Type: multipart/alternative; boundary="00000000000068631f05ae605c24"
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

--00000000000068631f05ae605c24
Content-Type: text/plain; charset="UTF-8"

I've been out of the loop on this for a while. Does anyone know if progress
has been made on the DumpService in DMTF. I remember there were some
proposals a while back, but I can't remember where they left off.

- Richard

On Wed, Sep 2, 2020 at 12:00 PM Bills, Jason M <
jason.m.bills@linux.intel.com> wrote:

>
>
> On 8/29/2020 8:53 PM, Zhenfei Tai wrote:
> > Thanks a lot for the feedback and we're glad that it's something the
> > community is interested in!
> > We'll incorporate the advice and improve the patchset.
> >
> > Jason - If you have time, could you share the findings of the
> > "AdditionalDataURI" schema change? I've only managed to find some slides
> > <
> https://www.dmtf.org/sites/default/files/Redfish_Diagnostic_Data_Logging_Proposal_05-2020-WIP_0.pdf>
>
> > from May.
> Sorry, I don't know much about it besides that the schema change is
> coming.  I checked on the DMTF website and it doesn't look like the new
> schema has been posted, yet.
>
> >
> > Thanks,
> > Zhenfei
> >
> > On Wed, Aug 26, 2020 at 1:00 PM Bills, Jason M
> > <jason.m.bills@linux.intel.com <mailto:jason.m.bills@linux.intel.com>>
> > wrote:
> >
> >
> >
> >     On 8/25/2020 8:35 PM, Ed Tanous wrote:
> >      > Yes, this would be useful to others.  A number of commercial
> stacks
> >      > (including some I helped write) have this feature, and I had hoped
> >      > someone would tackle it at some point in the future.
> >      >
> >      > My only comment is I'd rather that we don't duplicate the
> >     endpoints in
> >      > Redfish, and have both a Console and a ConsoleDownload
> >     collection.  If
> >      > we need a mechanism to download the full log files, I'd recommend
> >     that
> >      > the Console endpoint obey an Accept header of "text/plain;
> >      > charset=utf-8" and an Accept-Encoding header of "gzip".  That way,
> >      > we're still meeting the intent of the HTTP and Redfish specs,
> even if
> >      > we're providing more data download options than they require.
> >     I still need to go dig into it, but I think the new Redfish schemas
> >     that
> >     were added to support the Dump service, added an "AdditionalDataURI"
> >     property that can provide a URI to download a larger set of
> additional
> >     dump data.  It may be what you need for the log file download.
> >
> >      >
> >      > Other than that, yeah, sounds great, lets see the patchset.
> >      >
> >      > -Ed
> >      >
> >      > On Tue, Aug 25, 2020 at 8:24 PM Zhenfei Tai <ztai@google.com
> >     <mailto:ztai@google.com>> wrote:
> >      >>
> >      >> Hi,
> >      >>
> >      >> We have worked with our vendor on a system that provides console
> >     and debug information, which can be useful in times of debugging BMC
> >     issues.
> >      >>
> >      >> On a high level, we use obmc-console and
> >     phosphor-debug-collector to collect data.
> >      >>
> >      >> obmc-console: We collect console inputs from the host and save
> >     to local log files (max 8 files of 1 MB size with rotation.)
> >      >> phosphor-debug-collector: We run this process on the BMC with no
> >     modification.
> >      >>
> >      >> For the interface, the data is exposed via bmcweb where there
> >     are a pair of URIs for console inputs and debug collector
> respectively.
> >      >> e.g.
> >      >>
> >      >> /redfish/v1/Systems/system/LogServices/Console -- Enable/disable
> >     console inputs data collection.
> >      >> /redfish/v1/Systems/system/LogServices/ConsoleDownload --
> >     Download the log files in a zipped file.
> >      >>
> >      >> It will be great if we can get some feedback on whether the
> >     community finds such a system useful and advice to improve the
> design.
> >      >>
> >      >> Thanks,
> >      >> Zhenfei
> >
>

--00000000000068631f05ae605c24
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve been out of the loop on this for a while. Does an=
yone know if progress has been made on the DumpService in DMTF. I remember =
there were some proposals a while back, but I can&#39;t remember where they=
 left off.<div><br></div><div>- Richard</div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 2, 2020 at 12:00 P=
M Bills, Jason M &lt;<a href=3D"mailto:jason.m.bills@linux.intel.com">jason=
.m.bills@linux.intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><br>
<br>
On 8/29/2020 8:53 PM, Zhenfei Tai wrote:<br>
&gt; Thanks a lot for the feedback=C2=A0and we&#39;re glad that it&#39;s so=
mething the <br>
&gt; community is interested in!<br>
&gt; We&#39;ll incorporate the advice and improve the patchset.<br>
&gt; <br>
&gt; Jason - If you have time, could you share the findings of the <br>
&gt; &quot;AdditionalDataURI&quot; schema change? I&#39;ve only managed to =
find some slides <br>
&gt; &lt;<a href=3D"https://www.dmtf.org/sites/default/files/Redfish_Diagno=
stic_Data_Logging_Proposal_05-2020-WIP_0.pdf" rel=3D"noreferrer" target=3D"=
_blank">https://www.dmtf.org/sites/default/files/Redfish_Diagnostic_Data_Lo=
gging_Proposal_05-2020-WIP_0.pdf</a>&gt; <br>
&gt; from May.<br>
Sorry, I don&#39;t know much about it besides that the schema change is <br=
>
coming.=C2=A0 I checked on the DMTF website and it doesn&#39;t look like th=
e new <br>
schema has been posted, yet.<br>
<br>
&gt; <br>
&gt; Thanks,<br>
&gt; Zhenfei<br>
&gt; <br>
&gt; On Wed, Aug 26, 2020 at 1:00 PM Bills, Jason M <br>
&gt; &lt;<a href=3D"mailto:jason.m.bills@linux.intel.com" target=3D"_blank"=
>jason.m.bills@linux.intel.com</a> &lt;mailto:<a href=3D"mailto:jason.m.bil=
ls@linux.intel.com" target=3D"_blank">jason.m.bills@linux.intel.com</a>&gt;=
&gt; <br>
&gt; wrote:<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 8/25/2020 8:35 PM, Ed Tanous wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Yes, this would be useful to others.=C2=A0 A =
number of commercial stacks<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; (including some I helped write) have this fea=
ture, and I had hoped<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; someone would tackle it at some point in the =
future.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; My only comment is I&#39;d rather that we don=
&#39;t duplicate the<br>
&gt;=C2=A0 =C2=A0 =C2=A0endpoints in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Redfish, and have both a Console and a Consol=
eDownload<br>
&gt;=C2=A0 =C2=A0 =C2=A0collection.=C2=A0 If<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; we need a mechanism to download the full log =
files, I&#39;d recommend<br>
&gt;=C2=A0 =C2=A0 =C2=A0that<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; the Console endpoint obey an Accept header of=
 &quot;text/plain;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; charset=3Dutf-8&quot; and an Accept-Encoding =
header of &quot;gzip&quot;.=C2=A0 That way,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; we&#39;re still meeting the intent of the HTT=
P and Redfish specs, even if<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; we&#39;re providing more data download option=
s than they require.<br>
&gt;=C2=A0 =C2=A0 =C2=A0I still need to go dig into it, but I think the new=
 Redfish schemas<br>
&gt;=C2=A0 =C2=A0 =C2=A0that<br>
&gt;=C2=A0 =C2=A0 =C2=A0were added to support the Dump service, added an &q=
uot;AdditionalDataURI&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0property that can provide a URI to download a large=
r set of additional<br>
&gt;=C2=A0 =C2=A0 =C2=A0dump data.=C2=A0 It may be what you need for the lo=
g file download.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Other than that, yeah, sounds great, lets see=
 the patchset.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -Ed<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; On Tue, Aug 25, 2020 at 8:24 PM Zhenfei Tai &=
lt;<a href=3D"mailto:ztai@google.com" target=3D"_blank">ztai@google.com</a>=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:ztai@google.com" targe=
t=3D"_blank">ztai@google.com</a>&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Hi,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; We have worked with our vendor on a syste=
m that provides console<br>
&gt;=C2=A0 =C2=A0 =C2=A0and debug information, which can be useful in times=
 of debugging BMC<br>
&gt;=C2=A0 =C2=A0 =C2=A0issues.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; On a high level, we use obmc-console and<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0phosphor-debug-collector to collect data.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; obmc-console: We collect console inputs f=
rom the host and save<br>
&gt;=C2=A0 =C2=A0 =C2=A0to local log files (max 8 files of 1 MB size with r=
otation.)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; phosphor-debug-collector: We run this pro=
cess on the BMC with no<br>
&gt;=C2=A0 =C2=A0 =C2=A0modification.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; For the interface, the data is exposed vi=
a bmcweb where there<br>
&gt;=C2=A0 =C2=A0 =C2=A0are a pair of URIs for console inputs and debug col=
lector respectively.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; e.g.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; /redfish/v1/Systems/system/LogServices/Co=
nsole -- Enable/disable<br>
&gt;=C2=A0 =C2=A0 =C2=A0console inputs data collection.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; /redfish/v1/Systems/system/LogServices/Co=
nsoleDownload --<br>
&gt;=C2=A0 =C2=A0 =C2=A0Download the log files in a zipped file.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; It will be great if we can get some feedb=
ack on whether the<br>
&gt;=C2=A0 =C2=A0 =C2=A0community finds such a system useful and advice to =
improve the design.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Thanks,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Zhenfei<br>
&gt; <br>
</blockquote></div>

--00000000000068631f05ae605c24--
