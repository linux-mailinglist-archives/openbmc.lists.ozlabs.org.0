Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA9AF7C33
	for <lists+openbmc@lfdr.de>; Mon, 11 Nov 2019 19:44:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Bftr6T82zF3Zv
	for <lists+openbmc@lfdr.de>; Tue, 12 Nov 2019 05:44:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::22d;
 helo=mail-lj1-x22d.google.com; envelope-from=rhanley@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="uqMl/Gbm"; 
 dkim-atps=neutral
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47BfsY61gdzF3NZ
 for <openbmc@lists.ozlabs.org>; Tue, 12 Nov 2019 05:43:44 +1100 (AEDT)
Received: by mail-lj1-x22d.google.com with SMTP id r7so14944979ljg.2
 for <openbmc@lists.ozlabs.org>; Mon, 11 Nov 2019 10:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NXV0dyx2kb6lKI+o0Yhzq0yQOccCGDcaeMkjsjEEg7k=;
 b=uqMl/GbmKKHT2ovRH+Hkedz1pTxN74psJ9aB13mgG8UQE+9URImlX8hXyYENi1B5e0
 eu0+SwC2kY70mNHgbEMXVTOlX71YAgvhxLim30GxmfaemhjBW98IDma+wuCdJg5xEIbD
 9u7xJnPJfxNncBtbncUUytC9umj0bPfgg7z2imGf3VJQn7s1Vf+NeZfLSXTA6IYi4cWU
 nYgr7ZSUR8kW/Rp53lE7NmME+V7SgxU47QqTy+JfBBfJ3KjPIj7xsZNtbx9vKKrYoMDR
 Lh/HXAZgcnEQd1kFSXQx9jAGbDhe/pHYrLHeeIplNrkzuA2SeCNdPjTpJMeSDedkOuqF
 DEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NXV0dyx2kb6lKI+o0Yhzq0yQOccCGDcaeMkjsjEEg7k=;
 b=imUmNWm/QO8diwV5nHBRoNsG+baBB8vFZJ/a1ACXMP06vdO70F1ztG5fxtmjrQW8RY
 IQLyjcjGOWnv8nslhRXSmPPlUGU1kXx5SCz0shz0AeVYUvTN+/luVs+NtczJC0ZhgurF
 PFSocRlhJlauG5l2yXKN2f5lClbEkrO7u0A/6OqyJkWO/vcJPzzVaV4XNVHAwqWQtB5h
 jRLKrUZke9SMfSogTG7rNw/as1x9S8Kyod8tJCU+J3cY+ZHsnRA5WDR0gHWttnH7dBya
 YSsChVoangP+L9YZekxX02LTffbnJUYVhEzsVZwrmKQCxVyz+GdZRBovcbjxy7/p5KPi
 OxUg==
X-Gm-Message-State: APjAAAUo8G9JfCy5f60aQDxxWX9aPkxveaOG3locyt1Qy7zKVQhJs1/q
 t2crXqGhgbRUYMU+dpfRwDO+MqfRH6zwigfEzOoFCA==
X-Google-Smtp-Source: APXvYqwXoblxzuQJ9u1a0x8hhQuKhgP8SIjQbjUNCpzo80IcPEmRXrnLUeRfrgJzKGdkaX9x9i0UnDoFfHW9t0JDqaA=
X-Received: by 2002:a2e:9449:: with SMTP id o9mr5669022ljh.75.1573497820085;
 Mon, 11 Nov 2019 10:43:40 -0800 (PST)
MIME-Version: 1.0
References: <18608ACD-34D8-4408-B0C1-B5185A92CE2B@fuzziesquirrel.com>
 <CABoTLcQUrCjzbA1qELhug370fKFK6+Gii9ZsF=FX59oYwNRMVg@mail.gmail.com>
In-Reply-To: <CABoTLcQUrCjzbA1qELhug370fKFK6+Gii9ZsF=FX59oYwNRMVg@mail.gmail.com>
From: Richard Hanley <rhanley@google.com>
Date: Mon, 11 Nov 2019 10:43:28 -0800
Message-ID: <CAH1kD+Zb5wVqupNjRLsOAoiZ_CS_EP1PN890Zi6PqjQcv47B+Q@mail.gmail.com>
Subject: Re: in-band hardware management after IPMI
To: Oskar Senft <osk@google.com>
Content-Type: multipart/alternative; boundary="0000000000009f7dcc0597168228"
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
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 "OCP-HWmgt@ocp-all.groups.io" <OCP-HWmgt@ocp-all.groups.io>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000009f7dcc0597168228
Content-Type: text/plain; charset="UTF-8"

Hi Brad,

To Oskar's point, we have plans in the works to use Redfish on both a linux
host and BMCs.

I've just started investigating PLDM.  I think there are a handful of use
cases where RDE over PLDM could be useful, but we're still unsure about how
much effort it will take to integrate PLDM.

If we did move to PLDM, it would definitely be mixed in with Redfish.

- Richard

On Mon, Nov 11, 2019 at 10:20 AM Oskar Senft <osk@google.com> wrote:

> Hi Brad
>
> At least in my group, we're currently looking into using Redfish over the
> USB virtual NIC between host and BMC. The host would be running Linux
> (un-virtualized).
>
> Oskar.
>
> On Mon, Nov 11, 2019 at 11:56 AM Brad Bishop <bradleyb@fuzziesquirrel.com>
> wrote:
>
>> Hi everyone
>>
>> This is my first post to the hardware management list.  I'm Brad, I work
>> for IBM and I'm the TSC chair of the OpenBMC project.  I've cross posted to
>> both the OCP HW management mailing list and the OpenBMC project mailing
>> list because I expect both audiences are interested in the discussion.
>>
>> My question is mostly simple - The answers will likely not be.  I would
>> like to know whatever anyone is willing to share about in-band hardware
>> management plans in a post-IPMI world.  By in-band I mean applications (or
>> firmware) running on host processors in the same server as a BMC.
>>
>> Will you use Redfish?  PLDM?  A mix?  From host firmware?  From Windows?
>> From Linux?  From virtualized OSes?  From un-virtualized OSes?
>>
>> Thanks!
>>
>> -brad
>
>

--0000000000009f7dcc0597168228
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Brad,<div><br></div><div>To Oskar&#39;s point, we have =
plans in the works to use Redfish on both a linux host and BMCs.</div><div>=
<br></div><div>I&#39;ve just started investigating PLDM.=C2=A0 I think ther=
e are a handful of use cases where RDE over PLDM could be useful, but we&#3=
9;re still unsure about how much effort it will take to integrate PLDM.</di=
v><div><br></div><div>If we did move to PLDM, it would definitely be mixed =
in with Redfish.</div><div><br></div><div>- Richard</div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 11, 20=
19 at 10:20 AM Oskar Senft &lt;<a href=3D"mailto:osk@google.com">osk@google=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><div dir=3D"ltr">Hi Brad<div><br></div><div>At least in my group, we&#3=
9;re currently looking into using Redfish over the USB virtual NIC between =
host and BMC. The host would be running Linux (un-virtualized).</div><div><=
br></div><div>Oskar.</div><div></div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 11, 2019 at 11:56 AM Brad =
Bishop &lt;<a href=3D"mailto:bradleyb@fuzziesquirrel.com" target=3D"_blank"=
>bradleyb@fuzziesquirrel.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Hi everyone<br>
<br>
This is my first post to the hardware management list.=C2=A0 I&#39;m Brad, =
I work for IBM and I&#39;m the TSC chair of the OpenBMC project.=C2=A0 I&#3=
9;ve cross posted to both the OCP HW management mailing list and the OpenBM=
C project mailing list because I expect both audiences are interested in th=
e discussion.<br>
<br>
My question is mostly simple - The answers will likely not be.=C2=A0 I woul=
d like to know whatever anyone is willing to share about in-band hardware m=
anagement plans in a post-IPMI world.=C2=A0 By in-band I mean applications =
(or firmware) running on host processors in the same server as a BMC.<br>
<br>
Will you use Redfish?=C2=A0 PLDM?=C2=A0 A mix?=C2=A0 From host firmware?=C2=
=A0 From Windows?=C2=A0 From Linux?=C2=A0 From virtualized OSes?=C2=A0 From=
 un-virtualized OSes?<br>
<br>
Thanks!<br>
<br>
-brad</blockquote></div>
</blockquote></div>

--0000000000009f7dcc0597168228--
