Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E63E431FC5
	for <lists+openbmc@lfdr.de>; Mon, 18 Oct 2021 16:32:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HXzqX0VF8z304x
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 01:32:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PskFiPf7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d34;
 helo=mail-io1-xd34.google.com; envelope-from=rahulmaheshwari01@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=PskFiPf7; dkim-atps=neutral
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HXzq3682pz2ymZ
 for <openbmc@lists.ozlabs.org>; Tue, 19 Oct 2021 01:32:14 +1100 (AEDT)
Received: by mail-io1-xd34.google.com with SMTP id e144so16526331iof.3
 for <openbmc@lists.ozlabs.org>; Mon, 18 Oct 2021 07:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FkyVVdmY6x9OrnqlgBn2ZAobdAnSVOG/k7tAh9fBeyk=;
 b=PskFiPf72Ihkoz71F2uMY6JMFi8zDxhf2eSulyxnTvMry0+JXBtGMognwgARak6ise
 cV7U9cNs7wtgMViBgJt6jwXr+X4fq7gP2e+dXVzYt7gc4OjdLl9jJNlrSp26wSYdksI8
 MhlylQg88VnLD3ZQGm5j6aBYHAJAAZ/GcDPnjaLaArdsAC4SgELHjF2TRgH+J2xs5OaU
 0miBCOTXvOY8Rp9GDc8ph1q1Z/rObOF5LwInPj/mKCyeT29mD2Oqkx74mblzoVGo1D0g
 3lb6M4lGVkEgxDGNZRzlLtBPPw75sN32T2DsWYSED4LkOA3Ge7EJfxmgynrogNgIucvV
 g4AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FkyVVdmY6x9OrnqlgBn2ZAobdAnSVOG/k7tAh9fBeyk=;
 b=lKLnNToFkydTAbP9+zY8C29x2KmbuDshA/6m60mPmBJTgYniR3RQAfYYq/H3IBnsHb
 bPFAckjgSYJXNas+EdKSOdN0SZjKptHlLeZECk6PFxG6VZD8IQvCRDYo3AspW60JM20Y
 OeyT5spWcJtEYXb37WubeUW5oKHQ/JEkPyIY5dvoZIU/w+L5B9SwghzOSCpKfxBRRVnt
 sAsuS3LKZ7r4ipGJHwjqsv33cc6dYd41rPVWy7HzZxXnrYdI3/jBKYOJeOnqFfjbdQD2
 JBy8JXzHjh2/g6XebSnJpYgdDcpWj3howtIv0yO3CGu1GsYRqi3bJNPi2jLcQofEMbbo
 k2fQ==
X-Gm-Message-State: AOAM5313HiF3XkQnyl+bRjBFIgRs+KlecfKGCuUnAoOxfEwBCcJNzHzo
 Ab0cp+BaodAQzWlP/Pr6vcNgAPu59l0jTdD4Sis=
X-Google-Smtp-Source: ABdhPJx0EqOdFDPMPsRknHJGDQs9pi8u5VA7Wt61bBBWkb5g7BUXk3fCxw4ebkQzB2KojMgf1nfSZGZn0qARy4xILyA=
X-Received: by 2002:a5d:9492:: with SMTP id v18mr14580203ioj.158.1634567530425; 
 Mon, 18 Oct 2021 07:32:10 -0700 (PDT)
MIME-Version: 1.0
References: <HK0PR04MB305832327CA30B3FB2D70985E6B69@HK0PR04MB3058.apcprd04.prod.outlook.com>
In-Reply-To: <HK0PR04MB305832327CA30B3FB2D70985E6B69@HK0PR04MB3058.apcprd04.prod.outlook.com>
From: Rahul Maheshwari <rahulmaheshwari01@gmail.com>
Date: Mon, 18 Oct 2021 20:01:59 +0530
Message-ID: <CAAMkS12rPtK9QJJxz8nTmhocyhZJ7R-Zi8T9BCU5KUKjahCBZw@mail.gmail.com>
Subject: Re: Expected response table for ipmi standard commands used for
 verification
To: =?UTF-8?B?VG9ueSBMZWUgKOadjuaWh+WvjCk=?= <Tony.Lee@quantatw.com>
Content-Type: multipart/alternative; boundary="00000000000003312305cea16934"
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
Cc: openbmc <openbmc@lists.ozlabs.org>, George Keishing <gkeishin@in.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000003312305cea16934
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tony,

It would be better if you can come up with a sample file with the required
fields for IPMI standard commands. And the sample file can have the table
which you have suggested except the machine field. Later command usage for
required IPMI standard commands can be changed in IPMI suite. Others can
use the same sample file to create one for their specific system and use it=
.

Thanks
Rahul


On Tue, Oct 12, 2021 at 4:49 PM Tony Lee (=E6=9D=8E=E6=96=87=E5=AF=8C) <Ton=
y.Lee@quantatw.com>
wrote:

> Hi George,
>
> I would like to add a table which similar to data/ipmi_raw_cmd_table.py
> for ipmi standard commands.
>
> For example, in the test "Verify_SDR_Info".
> The output of the SDR info command could be different for different
> machines.
>
> The table will be like:
> '''
> ipmi_standard_cmd_resp_map =3D {
>     "${machine}": {
>         "sdr_info": {
>             "free_space": "unspecified",
>             "most_recent_addition": "01/01/1970 00:00:59",
>             "most_recent_erase": "01/01/1970 00:00:59",
>             "sdr_overflow": "yes",
>             "sdr_repository_update_support": "unspecified",
>             "delete_sdr_supported": "no",
>             "partial_add_sdr_supported": "no",
>             "reserve_sdr_repository_supported": "yes",
>             "sdr_repository_alloc_info_supported": "yes"
>         },
>                 "${ipmi_standard_cmd}":{
>
>                 ...
>                 }
>     }
> '''
>
> Does this seem feasible to you?
>
> Thanks
> Best Regards,
> Tony
>
>

--00000000000003312305cea16934
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Tony,<div><br></div><div>It would be better if you can =
come up with a sample file with the required fields for IPMI standard comma=
nds. And the sample file can have the table which you have suggested except=
 the machine=C2=A0field. Later command usage for required IPMI standard com=
mands can be changed in IPMI suite. Others can use the same sample file to =
create one for their specific system and use it.</div><div><br></div><div>T=
hanks</div><div>Rahul<br><div><br></div></div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 12, 2021 at 4:49 =
PM Tony Lee (=E6=9D=8E=E6=96=87=E5=AF=8C) &lt;<a href=3D"mailto:Tony.Lee@qu=
antatw.com">Tony.Lee@quantatw.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hi George,<br>
<br>
I would like to add a table which similar to data/ipmi_raw_cmd_table.py for=
 ipmi standard commands.<br>
<br>
For example, in the test &quot;Verify_SDR_Info&quot;.<br>
The output of the SDR info command could be different for different machine=
s.<br>
<br>
The table will be like:<br>
&#39;&#39;&#39;<br>
ipmi_standard_cmd_resp_map =3D {<br>
=C2=A0 =C2=A0 &quot;${machine}&quot;: {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;sdr_info&quot;: {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;free_space&quot;: &quot;uns=
pecified&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;most_recent_addition&quot;:=
 &quot;01/01/1970 00:00:59&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;most_recent_erase&quot;: &q=
uot;01/01/1970 00:00:59&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;sdr_overflow&quot;: &quot;y=
es&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;sdr_repository_update_suppo=
rt&quot;: &quot;unspecified&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;delete_sdr_supported&quot;:=
 &quot;no&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;partial_add_sdr_supported&q=
uot;: &quot;no&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;reserve_sdr_repository_supp=
orted&quot;: &quot;yes&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;sdr_repository_alloc_info_s=
upported&quot;: &quot;yes&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${ipmi_standa=
rd_cmd}&quot;:{<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ...<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 }<br>
&#39;&#39;&#39;<br>
<br>
Does this seem feasible to you?<br>
<br>
Thanks<br>
Best Regards,<br>
Tony<br>
<br>
</blockquote></div>

--00000000000003312305cea16934--
