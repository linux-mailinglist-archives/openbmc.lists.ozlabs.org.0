Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 51765D2F4E
	for <lists+openbmc@lfdr.de>; Thu, 10 Oct 2019 19:10:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46pyKB3CKWzDqLr
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2019 04:10:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::e30; helo=mail-vs1-xe30.google.com;
 envelope-from=yuenn@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="fqweQs0R"; 
 dkim-atps=neutral
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com
 [IPv6:2607:f8b0:4864:20::e30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46pyJ32WjdzDqLD
 for <openbmc@lists.ozlabs.org>; Fri, 11 Oct 2019 04:09:54 +1100 (AEDT)
Received: by mail-vs1-xe30.google.com with SMTP id m22so4382370vsl.9
 for <openbmc@lists.ozlabs.org>; Thu, 10 Oct 2019 10:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mgr0leTGKL5RnvHODLjtThE0/a2si2NNn8N2M6WKATM=;
 b=fqweQs0RVt9iz/fA5D5M6cUjorG+PnV//9V/6OZL6YyDPRrB8ceJJcKMxSaBe4Vwnt
 1auqZzX+IBDZu5rwOg4aBnNTSEbkiAvec0dHuvFjhd7PfTpLqK6IMFTLSj572laZtNA1
 foCS3cBX6gCLIKL7kWBHjYhsWa+5yPzt4lQOZ/HPttHslyUr1G1qotBIY4nHAG9CdD6e
 IvOXZvUVvQSxlQ01ODHQw8YrbWHL/hz180p9JVZlRW1xc5BQywZT/Q+/zCSf4newRtFF
 1Ou12QOzkgt0ubDMwMkXBQXeOAxpT9S2pCdIusyS9Dn9oN66qSZd4ymn20DjGZykJc0l
 bmSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mgr0leTGKL5RnvHODLjtThE0/a2si2NNn8N2M6WKATM=;
 b=CZCPcJOD+lTBsYKJd+KEa1sdr/dQIx23CDKMzdKxUwZaOHvHjVCSkzI6lSDXYt1h/V
 7RQBvhsXkK8vkZByX75rJ+knL76Owq3XYzZekilHp2UF8n+kMgG5n7MaNtNK0kJwqD/q
 FyEiBuqgjERL2TboKZvw1gud6kMMW+Cb+LRNDP7k4jB7foDlCArrkk/Qrv7iRi3p85/f
 l9PGre9p9d43obRPWIS9EXnNmVTJRKGlO2V/+BlbNAgAldvFKXiBNhNI1plwRGDp8RDh
 DAJ5s4lWy8XfiIVbwqpXhZxWWfBlUa0OjyGgOy38WhDEWikHjMKkVls5W1axo2GYM993
 cbzA==
X-Gm-Message-State: APjAAAUx5SNBiN3nyQo+mCXoc4wnPPDG2grd+tXnnv/4moakPHEwuGVB
 BMQ69LNtWVgPxy5GxrLVGr0Bv/FstEg3UAcaEB0Ypw==
X-Google-Smtp-Source: APXvYqwVHUYX0nkkNZ0R4V29qTOqFeeOKm8rUyyBUWOLNtr7+vg2NmUxJgMTem7AiSV6HuYnTaJg5Su83xFpQucVCOY=
X-Received: by 2002:a67:ea01:: with SMTP id g1mr6148705vso.106.1570727388644; 
 Thu, 10 Oct 2019 10:09:48 -0700 (PDT)
MIME-Version: 1.0
References: <CADfYTpG_Sy4_jNGqZTJKx1Tyivsu+SpBpWy=vNSH7L=Z0PXAEQ@mail.gmail.com>
 <2F98B4CC-2C61-4AF7-B41A-897C9BA4E32F@fuzziesquirrel.com>
In-Reply-To: <2F98B4CC-2C61-4AF7-B41A-897C9BA4E32F@fuzziesquirrel.com>
From: Nancy Yuen <yuenn@google.com>
Date: Thu, 10 Oct 2019 10:09:12 -0700
Message-ID: <CADfYTpEut49XPWs+Ahz5dsRgayLkHToRh-6btHeqbaSR3wnK2A@mail.gmail.com>
Subject: Re: Redfish Aggregator
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: multipart/alternative; boundary="0000000000000ab9a90594917892"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, dkodihal@in.ibm.com,
 Richard Hanley <rhanley@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000000ab9a90594917892
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Brad!  We are envisioning aggregating the separate Redfish stacks to
present a single unified system view.  There is another slide deck of
Redfish Aggregator requirement uploaded to DMTF a few days ago with a
slightly different idea of aggregation (it sounds more like batching, the
aggregator will send a reboot or a fw update, to a bunch of redfish stacks
on multiple systems).

Our next step is to write up the requirements for a Redfish Aggregator for
our use cases. We would love input from others in OpenBMC as well.  We can
share this with the Redfish Forum.

----------
Nancy


On Tue, Oct 8, 2019 at 11:54 AM Brad Bishop <bradleyb@fuzziesquirrel.com>
wrote:

> at 3:59 PM, Nancy Yuen <yuenn@google.com> wrote:
>
> > Has anyone looked at the Redfish Aggregator proposal that was voted on
> in
> > DMTF recently?
> > We have a need for this functionality. Would anyone else find it
> useful?
> > Would anyone be interested in collaborating?
>
> Hi Nancy
>
> In the past IBM has made NUMA systems with multiple chassis that are
> stitched together into a single SMP fabric.  In these systems each
> chassis
> has one or more BMCs.
>
> If a =E2=80=9CRedfish Aggregator=E2=80=9D would aggregate the Redfish sta=
cks on each BMC
> in
> a system like this, then that sounds like an effort that IBM would
> potentially find useful and want to contribute to.
>
> thx!  -brad
>

--0000000000000ab9a90594917892
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Brad!=C2=A0 We are envisioning aggregating the sepa=
rate Redfish stacks to present a single unified system view.=C2=A0 There is=
 another slide deck of Redfish Aggregator requirement uploaded to DMTF a fe=
w days ago with a slightly different idea of aggregation (it sounds more li=
ke batching, the aggregator will send a reboot or a fw update, to a bunch o=
f redfish stacks on multiple systems).<div><br></div><div>Our next step is =
to write up the requirements for a Redfish Aggregator for our use cases. We=
 would love input from others in OpenBMC as well.=C2=A0 We can share this w=
ith the Redfish Forum.</div><div><br clear=3D"all"><div><div dir=3D"ltr" da=
ta-smartmail=3D"gmail_signature">----------<br>Nancy</div></div><br></div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Tue, Oct 8, 2019 at 11:54 AM Brad Bishop &lt;<a href=3D"mailto:bradleyb@f=
uzziesquirrel.com" target=3D"_blank">bradleyb@fuzziesquirrel.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">at 3:59 PM,=
 Nancy Yuen &lt;<a href=3D"mailto:yuenn@google.com" target=3D"_blank">yuenn=
@google.com</a>&gt; wrote:<br>
<br>
&gt; Has anyone looked at the Redfish Aggregator proposal that was voted on=
 in=C2=A0 <br>
&gt; DMTF recently?<br>
&gt; We have a need for this functionality. Would anyone else find it usefu=
l?=C2=A0 <br>
&gt; Would anyone be interested in collaborating?<br>
<br>
Hi Nancy<br>
<br>
In the past IBM has made NUMA systems with multiple chassis that are=C2=A0 =
<br>
stitched together into a single SMP fabric.=C2=A0 In these systems each cha=
ssis=C2=A0 <br>
has one or more BMCs.<br>
<br>
If a =E2=80=9CRedfish Aggregator=E2=80=9D would aggregate the Redfish stack=
s on each BMC in=C2=A0 <br>
a system like this, then that sounds like an effort that IBM would=C2=A0 <b=
r>
potentially find useful and want to contribute to.<br>
<br>
thx!=C2=A0 -brad<br>
</blockquote></div>

--0000000000000ab9a90594917892--
