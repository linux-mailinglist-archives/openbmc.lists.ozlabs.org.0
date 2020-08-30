Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EE9256B4E
	for <lists+openbmc@lfdr.de>; Sun, 30 Aug 2020 05:54:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BfKGR5fkRzDqg8
	for <lists+openbmc@lfdr.de>; Sun, 30 Aug 2020 13:54:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::32c;
 helo=mail-ot1-x32c.google.com; envelope-from=ztai@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=mt9BJ2BB; dkim-atps=neutral
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BfKFZ1K3szDqdv
 for <openbmc@lists.ozlabs.org>; Sun, 30 Aug 2020 13:53:52 +1000 (AEST)
Received: by mail-ot1-x32c.google.com with SMTP id 109so2635534otv.3
 for <openbmc@lists.ozlabs.org>; Sat, 29 Aug 2020 20:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SDiKPvyTJgnKswyU/QzYFkFXZdpz2ex79BBQHY692Ns=;
 b=mt9BJ2BBFJAIxCvDGvPAguY1o+Cqnqvee6VUJZA1zFq4oUAfUgA2hjGHW9TdheOw3k
 AZ6g6/eiFMhBSytkdX7o7e9lwCO++RmeG/eWCGxRb99INP/sQFpeKBT2dxeLRgdiUzcb
 YvXanMbpK4q9uHrbSCX83CM+ZRjf5KqFpCbXXZcWoJnT14d+BIB0LHFHwHd8xvhjUHnN
 vbZhEE6Ff0c3fOs7R6WqkqLZYCWPLavGqdpreXSq7R3plpIdGrd4JPDZdHfsevPo/1AQ
 puZaBjv2StesABHikMXEdGIgQsKpnUVsLEgqAGd/pk5fVlHcUj6GFwUwPr30M1e8As/L
 /brg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SDiKPvyTJgnKswyU/QzYFkFXZdpz2ex79BBQHY692Ns=;
 b=t6jr3sSTFDMRA7GQl3f5pPjapM7m79egaS/sv5X20SldLDxrzjLNt51CBYlHbRR4wy
 DSSU8nGXVyL90XB73yXN93oUMwi6zUxNz6N1dUNYiPZyiMxlQALIS0QKTmefFJPzPhzc
 WnS8mff9QeKN6iAox9WTKiqipXABbhlWBEMoLZwg9HE1MsMKE19I9ntA8M2mMhwUynYU
 pOP/Sztf8PMGAUEHWTQ8fOMa61Q9a6NWtmIit1GzZvHZSNleHfZy/5ZrTy3euIhRVubh
 Ynx3zHYpVIrgbNn3EayjyfFkEev09WswFtBVrFzEktXIJMx8SuwyHB/KK4/aNMgZRpcB
 +d7Q==
X-Gm-Message-State: AOAM533BSyuP7qHPJBvPukktaumLJedwf+kWki9Yf1UambfN1NLRNVgW
 m6INXj8F81K1SJzp16tEDmld35EOlH1VsT1jwZHFZw==
X-Google-Smtp-Source: ABdhPJyZnvQoV2mxB1pM9mVxt1AMFOtIQ3wt+PSnzEkYMfEnQZeXbkrrHvMpVJdM4tU0xlX/V8eB+7o7s1YbzOGOY7k=
X-Received: by 2002:a9d:2f23:: with SMTP id h32mr3913589otb.334.1598759628356; 
 Sat, 29 Aug 2020 20:53:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAMXw96MQ-=Ftc5HjNThKd8A6X0hdBdjC43d6RJfzyDoN+b=7YQ@mail.gmail.com>
 <CACWQX82jRpfpeqc9a3kFA+08-CgyOjc8+jYU2Xh307hq-0_DHQ@mail.gmail.com>
 <419f732a-8d73-0450-fca6-b89d82fcd96c@linux.intel.com>
In-Reply-To: <419f732a-8d73-0450-fca6-b89d82fcd96c@linux.intel.com>
From: Zhenfei Tai <ztai@google.com>
Date: Sat, 29 Aug 2020 20:53:37 -0700
Message-ID: <CAMXw96Onss5O3dRzV-vSV4bK=ri=QV0932cBSYpZS7U3G+_5kw@mail.gmail.com>
Subject: Re: Seek feedback: BMC console and debug info
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Content-Type: multipart/alternative; boundary="000000000000bb05c305ae103b44"
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

--000000000000bb05c305ae103b44
Content-Type: text/plain; charset="UTF-8"

Thanks a lot for the feedback and we're glad that it's something the
community is interested in!
We'll incorporate the advice and improve the patchset.

Jason - If you have time, could you share the findings of the
"AdditionalDataURI" schema change? I've only managed to find some slides
<https://www.dmtf.org/sites/default/files/Redfish_Diagnostic_Data_Logging_Proposal_05-2020-WIP_0.pdf>
from May.

Thanks,
Zhenfei

On Wed, Aug 26, 2020 at 1:00 PM Bills, Jason M <
jason.m.bills@linux.intel.com> wrote:

>
>
> On 8/25/2020 8:35 PM, Ed Tanous wrote:
> > Yes, this would be useful to others.  A number of commercial stacks
> > (including some I helped write) have this feature, and I had hoped
> > someone would tackle it at some point in the future.
> >
> > My only comment is I'd rather that we don't duplicate the endpoints in
> > Redfish, and have both a Console and a ConsoleDownload collection.  If
> > we need a mechanism to download the full log files, I'd recommend that
> > the Console endpoint obey an Accept header of "text/plain;
> > charset=utf-8" and an Accept-Encoding header of "gzip".  That way,
> > we're still meeting the intent of the HTTP and Redfish specs, even if
> > we're providing more data download options than they require.
> I still need to go dig into it, but I think the new Redfish schemas that
> were added to support the Dump service, added an "AdditionalDataURI"
> property that can provide a URI to download a larger set of additional
> dump data.  It may be what you need for the log file download.
>
> >
> > Other than that, yeah, sounds great, lets see the patchset.
> >
> > -Ed
> >
> > On Tue, Aug 25, 2020 at 8:24 PM Zhenfei Tai <ztai@google.com> wrote:
> >>
> >> Hi,
> >>
> >> We have worked with our vendor on a system that provides console and
> debug information, which can be useful in times of debugging BMC issues.
> >>
> >> On a high level, we use obmc-console and phosphor-debug-collector to
> collect data.
> >>
> >> obmc-console: We collect console inputs from the host and save to local
> log files (max 8 files of 1 MB size with rotation.)
> >> phosphor-debug-collector: We run this process on the BMC with no
> modification.
> >>
> >> For the interface, the data is exposed via bmcweb where there are a
> pair of URIs for console inputs and debug collector respectively.
> >> e.g.
> >>
> >> /redfish/v1/Systems/system/LogServices/Console -- Enable/disable
> console inputs data collection.
> >> /redfish/v1/Systems/system/LogServices/ConsoleDownload -- Download the
> log files in a zipped file.
> >>
> >> It will be great if we can get some feedback on whether the community
> finds such a system useful and advice to improve the design.
> >>
> >> Thanks,
> >> Zhenfei
>

--000000000000bb05c305ae103b44
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks a lot for the feedback=C2=A0and we&#39;re glad that=
 it&#39;s something the community is interested in!<div>We&#39;ll incorpora=
te the advice and improve the patchset.<br><div><br></div><div>Jason - If y=
ou have time, could you share the findings of the &quot;AdditionalDataURI&q=
uot; schema change? I&#39;ve only managed to find <a href=3D"https://www.dm=
tf.org/sites/default/files/Redfish_Diagnostic_Data_Logging_Proposal_05-2020=
-WIP_0.pdf">some slides</a> from May.</div><div><br></div><div>Thanks,</div=
><div>Zhenfei</div><div></div></div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 26, 2020 at 1:00 PM Bills, =
Jason M &lt;<a href=3D"mailto:jason.m.bills@linux.intel.com">jason.m.bills@=
linux.intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><br>
<br>
On 8/25/2020 8:35 PM, Ed Tanous wrote:<br>
&gt; Yes, this would be useful to others.=C2=A0 A number of commercial stac=
ks<br>
&gt; (including some I helped write) have this feature, and I had hoped<br>
&gt; someone would tackle it at some point in the future.<br>
&gt; <br>
&gt; My only comment is I&#39;d rather that we don&#39;t duplicate the endp=
oints in<br>
&gt; Redfish, and have both a Console and a ConsoleDownload collection.=C2=
=A0 If<br>
&gt; we need a mechanism to download the full log files, I&#39;d recommend =
that<br>
&gt; the Console endpoint obey an Accept header of &quot;text/plain;<br>
&gt; charset=3Dutf-8&quot; and an Accept-Encoding header of &quot;gzip&quot=
;.=C2=A0 That way,<br>
&gt; we&#39;re still meeting the intent of the HTTP and Redfish specs, even=
 if<br>
&gt; we&#39;re providing more data download options than they require.<br>
I still need to go dig into it, but I think the new Redfish schemas that <b=
r>
were added to support the Dump service, added an &quot;AdditionalDataURI&qu=
ot; <br>
property that can provide a URI to download a larger set of additional <br>
dump data.=C2=A0 It may be what you need for the log file download.<br>
<br>
&gt; <br>
&gt; Other than that, yeah, sounds great, lets see the patchset.<br>
&gt; <br>
&gt; -Ed<br>
&gt; <br>
&gt; On Tue, Aug 25, 2020 at 8:24 PM Zhenfei Tai &lt;<a href=3D"mailto:ztai=
@google.com" target=3D"_blank">ztai@google.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hi,<br>
&gt;&gt;<br>
&gt;&gt; We have worked with our vendor on a system that provides console a=
nd debug information, which can be useful in times of debugging BMC issues.=
<br>
&gt;&gt;<br>
&gt;&gt; On a high level, we use obmc-console and phosphor-debug-collector =
to collect data.<br>
&gt;&gt;<br>
&gt;&gt; obmc-console: We collect console inputs from the host and save to =
local log files (max 8 files of 1 MB size with rotation.)<br>
&gt;&gt; phosphor-debug-collector: We run this process on the BMC with no m=
odification.<br>
&gt;&gt;<br>
&gt;&gt; For the interface, the data is exposed via bmcweb where there are =
a pair of URIs for console inputs and debug collector respectively.<br>
&gt;&gt; e.g.<br>
&gt;&gt;<br>
&gt;&gt; /redfish/v1/Systems/system/LogServices/Console -- Enable/disable c=
onsole inputs data collection.<br>
&gt;&gt; /redfish/v1/Systems/system/LogServices/ConsoleDownload -- Download=
 the log files in a zipped file.<br>
&gt;&gt;<br>
&gt;&gt; It will be great if we can get some feedback on whether the commun=
ity finds such a system useful and advice to improve the design.<br>
&gt;&gt;<br>
&gt;&gt; Thanks,<br>
&gt;&gt; Zhenfei<br>
</blockquote></div>

--000000000000bb05c305ae103b44--
