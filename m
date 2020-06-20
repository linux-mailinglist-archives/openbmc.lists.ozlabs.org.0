Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B83EE201F43
	for <lists+openbmc@lfdr.de>; Sat, 20 Jun 2020 02:39:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49pcJ41NlhzDrbg
	for <lists+openbmc@lfdr.de>; Sat, 20 Jun 2020 10:39:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::22f;
 helo=mail-oi1-x22f.google.com; envelope-from=xqiu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=cLBHHQh1; dkim-atps=neutral
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49pcHL1McjzDrQJ
 for <openbmc@lists.ozlabs.org>; Sat, 20 Jun 2020 10:38:53 +1000 (AEST)
Received: by mail-oi1-x22f.google.com with SMTP id a3so10060314oid.4
 for <openbmc@lists.ozlabs.org>; Fri, 19 Jun 2020 17:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ys75m3cVxvNApGx18NYT/oyhZFrROXwmk1rh5moIn/I=;
 b=cLBHHQh1cdHWoNQ0tMuP1GLwv20GtY47ijxXATQroLV5cU9ZSpuuT4Pc7iHjKdHm/v
 hqdJPvUIejhPCTvklU9FkE1G2fceJbM7EzcU4Kcf51BFyeVKvLQW83+HO7GqoLbF+j1w
 lUpaK8nxWug6xyIxqqi/wZAHoRmVdgojODe5WQnosBUfnv7aweMEaVg3tMqL2j2b+0zt
 q0PrCaFMgotiif6eZBER9roZmKeCTyZyW0kSYgz2BUFCU+L6MDlv3CBmMi4My8kYbdMW
 /l8QATLlA8vMQlz1IE0tPAgBy0DRclKp8Y5pgiIyX7fnwfKatF3L59nGjgdryPDDF7vS
 nldA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ys75m3cVxvNApGx18NYT/oyhZFrROXwmk1rh5moIn/I=;
 b=kBOQ2597eZlJ9NU1bJykMCaQxgT8aW8B5VrQCbqwT9Z8/E21Zc5Plkj4yKijK7j5SS
 i7Pxd1VMqtBNunloWmGsY1wUtbShZtYbVBYVppzGO+8nAyOpu6Fz1LNtSjXFqL0zewXJ
 idKnwWyPccHq1bfZa/g2tdkIL9WbryFBYZ4S5tdhmPlGbapjEkDszOzaXwqbr81lXdKr
 37obQ1V2XJMExybrk0tYLUlJK7dKRFeyT5j1m9pwj/jerBdhTBsqYk2SWGbRVBHqsiN7
 4OyP8o0leeEaOOjLMeZv60LVz+KfBZ3uf2x52Z2Cx2E5FwVf70RAWipGbp5rhiVtoMjZ
 cj3g==
X-Gm-Message-State: AOAM531J9oyh2HRkk5o1YDgjmFp/ZnPVZSeoRHRfSyQNeq5rWlmZp/gc
 ZPdTcq8tD2L63BwqaVMjxkl2tgf1WxEUrdaS0Z4N5WOTGCA=
X-Google-Smtp-Source: ABdhPJyflVg8nFaD8yP03cL978WFXBxJGX4DvBZp4u4ckcFuObJLrqvDjMmOpJiUIiKwXFRS5D5IJ7jc37HkI9DmIpQ=
X-Received: by 2002:a54:4495:: with SMTP id v21mr4975698oiv.35.1592613528795; 
 Fri, 19 Jun 2020 17:38:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAA_a9xLB2PjJ7hYTrksY41LFhOk+Kuu-Hs4YCDTeJX4THZ1KQQ@mail.gmail.com>
 <CAA_a9xKDS=342c+s3QUv8oECkjzqxxCZgHBigT2_CxdCQa5CuQ@mail.gmail.com>
In-Reply-To: <CAA_a9xKDS=342c+s3QUv8oECkjzqxxCZgHBigT2_CxdCQa5CuQ@mail.gmail.com>
From: Alex Qiu <xqiu@google.com>
Date: Fri, 19 Jun 2020 17:38:37 -0700
Message-ID: <CAA_a9xLqoikFZm0yYo21jBTAZzthZezYPpBmBEXGSB7Yod-JAg@mail.gmail.com>
Subject: Re: Feedback on Current OpenBMC and Proposing Some Improvements
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000a685f305a8793b82"
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
Cc: Peter Lundgren <peterlundgren@google.com>,
 Kais Belgaied <belgaied@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Ofer Yehielli <ofery@google.com>, Josh Lehan <krellan@google.com>,
 gBMC Discussions <gbmc-discuss@google.com>,
 Richard Hanley <rhanley@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000a685f305a8793b82
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

As promised, I made a runnable Python 3 demo to illustrate my ideas:
https://github.com/alex310110/bmc-proto-20q2

Thank you!

- Alex Qiu


On Thu, Jun 18, 2020 at 2:40 PM Alex Qiu <xqiu@google.com> wrote:

> Just sent out the additional email threads. You can also find them in
> these links:
>
> Feedback on Current OpenBMC and Proposing Some Improvements ----
> Difficulties and Issue Examples:
> https://lists.ozlabs.org/pipermail/openbmc/2020-June/022065.html
>
> Feedback on Current OpenBMC and Proposing Some Improvements ----
> "Improvements" Ideas:
> https://lists.ozlabs.org/pipermail/openbmc/2020-June/022067.html
>
> Thank you!
>
> - Alex Qiu
>
>
> On Thu, Jun 18, 2020 at 2:25 PM Alex Qiu <xqiu@google.com> wrote:
>
>> Hi OpenBMC community,
>>
>> It has been a while since Google has adopted the dynamic software stack
>> of OpenBMC, namely using entity-manager for FRU discovery, dbus-sensors =
for
>> sensor reading, and intel-ipmi-oem for IPMI command handling. We discove=
red
>> issues and limitations with this dynamic software stack along the way, s=
o
>> I=E2=80=99m proposing some ideas on how OpenBMC may improve, which may l=
ead to
>> detailed designs about it. Let me call it "Improvements" in this email p=
er
>> say. I think the highlight of these ideas are: 1) having a robust framew=
ork
>> to handle hardware topology, and 2) having accommodations for code to
>> intervene on varieties of BMC tasks.
>>
>>
>> I'll split the content of this topic into two additional emails for
>> easier digestion: 1) Difficulties and Issue Examples; 2) "Improvements"
>> Ideas. The main discussion may still stay in this thread.
>>
>>
>> Since this is a big architectural change compared to the existing dynami=
c
>> software stack, I would like to hear feedback or review on the conceptua=
l
>> ideas before we turn these ideas into more concrete designs or prototype=
s.
>> On the other hand, there is a high probability that I didn=E2=80=99t exp=
ress my
>> idea well enough to understand, and there may be a language barrier to g=
et
>> over. I=E2=80=99ll try to see if I can use some code to make a tiny prot=
otype to
>> illustrate the ideas better at some point. Thank you!
>>
>>
>> - Alex Qiu
>>
>

--000000000000a685f305a8793b82
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>As promised, I made a runnable Python 3 demo to illus=
trate my ideas:=C2=A0<a href=3D"https://github.com/alex310110/bmc-proto-20q=
2">https://github.com/alex310110/bmc-proto-20q2</a></div><div><br></div><di=
v>Thank you!</div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_si=
gnature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">- Alex Qiu</di=
v></div></div><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Thu, Jun 18, 2020 at 2:40 PM Alex Qiu &lt;<a href=3D"m=
ailto:xqiu@google.com">xqiu@google.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Just sent out t=
he additional email threads. You can also find them in these links:</div><d=
iv><br></div><div>Feedback on Current OpenBMC and Proposing Some Improvemen=
ts ---- Difficulties and Issue Examples:<br></div><div><a href=3D"https://l=
ists.ozlabs.org/pipermail/openbmc/2020-June/022065.html" target=3D"_blank">=
https://lists.ozlabs.org/pipermail/openbmc/2020-June/022065.html</a></div><=
div><br></div><div>Feedback on Current OpenBMC and Proposing Some Improveme=
nts ---- &quot;Improvements&quot; Ideas:<br><a href=3D"https://lists.ozlabs=
.org/pipermail/openbmc/2020-June/022067.html" target=3D"_blank">https://lis=
ts.ozlabs.org/pipermail/openbmc/2020-June/022067.html</a><br></div><div><br=
></div><div>Thank you!</div><br clear=3D"all"><div><div dir=3D"ltr"><div di=
r=3D"ltr">- Alex Qiu</div></div></div><br></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 18, 2020 at 2:25 PM A=
lex Qiu &lt;<a href=3D"mailto:xqiu@google.com" target=3D"_blank">xqiu@googl=
e.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><div dir=3D"ltr"><span id=3D"gmail-m_8305637106486404367gmail-m_100762=
8602065475378gmail-docs-internal-guid-17443d56-7fff-26a3-292e-564725539854"=
><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"=
><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);backgroun=
d-color:transparent;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;vertical-align:baseline;white-space:pre-wrap">Hi OpenBMC community,</sp=
an></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-b=
ottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0)=
;background-color:transparent;font-variant-numeric:normal;font-variant-east=
-asian:normal;vertical-align:baseline;white-space:pre-wrap">It has been a w=
hile since Google has adopted the dynamic software stack of OpenBMC, namely=
 using entity-manager for FRU discovery, dbus-sensors for sensor reading, a=
nd intel-ipmi-oem for IPMI command handling. We discovered issues and limit=
ations with this dynamic software stack along the way, so I=E2=80=99m propo=
sing some ideas on how OpenBMC may improve, which may lead to detailed desi=
gns about it. Let me call it &quot;Improvements&quot; in this email per say=
. I think the highlight of these ideas are: 1) having a robust framework to=
 handle hardware topology, and 2) having accommodations for code to interve=
ne on varieties of BMC tasks.</span></p><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-=
family:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-num=
eric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-sp=
ace:pre-wrap"><br></span></p><p style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(=
0,0,0);background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">I&#39;ll =
split the content of this topic into two additional emails for easier diges=
tion: 1) Difficulties and Issue Examples; 2) &quot;Improvements&quot; Ideas=
. The main discussion may still stay in this thread.</span></p><p style=3D"=
line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size=
:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-=
variant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseli=
ne;white-space:pre-wrap"><br></span></p><p style=3D"line-height:1.38;margin=
-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial=
;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;=
font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap=
"><span id=3D"gmail-m_8305637106486404367gmail-m_1007628602065475378gmail-d=
ocs-internal-guid-7fd06023-7fff-c2d3-8375-7d31c58ce52b"><span style=3D"font=
-size:11pt;background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;vertical-align:baseline">Since this is a big archit=
ectural change compared to the existing dynamic software stack, I would lik=
e to hear feedback or review on the conceptual ideas before we turn these i=
deas into more concrete designs or prototypes. On the other hand, there is =
a high probability that I didn=E2=80=99t express my idea well enough to und=
erstand, and there may be a language barrier to get over. I=E2=80=99ll try =
to see if I can use some code to make a tiny prototype to illustrate the id=
eas better at some point. Thank you!</span></span>
</span></p><p style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><=
span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-=
color:transparent;font-variant-numeric:normal;font-variant-east-asian:norma=
l;vertical-align:baseline;white-space:pre-wrap"><span><span style=3D"font-s=
ize:11pt;background-color:transparent;font-variant-numeric:normal;font-vari=
ant-east-asian:normal;vertical-align:baseline"><br></span></span></span></p=
></span><div><div dir=3D"ltr"><div dir=3D"ltr">- Alex Qiu</div></div></div>=
</div>
</blockquote></div>
</blockquote></div>

--000000000000a685f305a8793b82--
