Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB35A560B4
	for <lists+openbmc@lfdr.de>; Fri,  7 Mar 2025 07:23:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z8GSz6myvz3d2N
	for <lists+openbmc@lfdr.de>; Fri,  7 Mar 2025 17:23:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741328624;
	cv=none; b=cWhfpGfZXZXnrRngyMiGXBkQweJE1wLXq+5ZB10d2hHGeSVF6CJp2NULdb7vIWWB2iYJKHPwqqLhZ6H8z67EY1qcbaL0oJGk6aAmaEN7G5W24SRePvoiZ2bLsin0ZcJqNFhc0A270u7aJp7ayEjfhFpViQHiDXL14HufAtIYRWsu17ECnVQcPttvTaxcpDwb7ReBcEsjGI5LCxzj1v3pp7gk9fbpFMRRXkH+mzd33fRPHPZZcyO8y4pMFA5JaGExT/Qu8+H8Hcusm6XJhBvI0gaydaIjJa2+BgrjbEQEHwKayOunbqk3Hho8IoIJFP+PI9qql/MsCX30RGp9fW/3Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741328624; c=relaxed/relaxed;
	bh=xcS2gDIVtLjNxEqAExjI/Cez3jDGGinXrtl51ZETImE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YNZta2VzybyfrZufZ9dWIh5WZwbDaqERb1qx6wPQp2ba9DtQY3E7mvIkI/p6RoEZyjTTOQSukt648tNagGKLDDQTMBC6AQKl1rXhKZyIXvpno66pF4lOvm2KWKYnn/rb2dsHWyC66xU39bsVqMhjg2QGrJoSM6U5MP582oURNHoHPo9BlyogsJxyN2T4ZjwQPmIhOU0JRRBKwArhRvq+26cgNJ2naSeYgoEV14pslkPBc/ZZ3cHo75EtMPFzqWvK6Ta9gInQt39jITt/DJePcsQh5vuB6KTvdWWCN/6gTsqNzYeoeQIyBUO0PfiZbz5zugNAapOKfUv6iO/hLjJG7Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=vi1BOnbq; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=zhichuang@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=vi1BOnbq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=zhichuang@google.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z8GSv3fy2z3089
	for <openbmc@lists.ozlabs.org>; Fri,  7 Mar 2025 17:23:42 +1100 (AEDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5e50bae0f5bso5795a12.0
        for <openbmc@lists.ozlabs.org>; Thu, 06 Mar 2025 22:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741328620; x=1741933420; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xcS2gDIVtLjNxEqAExjI/Cez3jDGGinXrtl51ZETImE=;
        b=vi1BOnbqCxvmZ3emLDCkqa+gaY4qG8119feiHEkHzlkVBVEKeGgVXAhhpAY70Qtl51
         oeDeyRbjen7XaeVv121/pd394f723Q5on3YjoqdvV+LYuuzefCndhQ1inJ0vlIRDDa4j
         v2cn7cTbSuEutiV4afq4aLJfvvbP6lG7v9x9gLOArDgrBBqxK/yAOn4xJ6nBXCDE1EeZ
         /E65mJ2mEdlvqPbqLhw2JFh/nYHO1/yEuYjhX4G7t39dQ7YdkB1SQY2unKN+vOOoB1V6
         JsWcn0HIyOgef4GI1BWbHUtVYOeb1LcmCY91DZjPKxgpK+1OEKLU4ob7eSoSJcMraRL5
         nu4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741328620; x=1741933420;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xcS2gDIVtLjNxEqAExjI/Cez3jDGGinXrtl51ZETImE=;
        b=b0pFno6sEA3LHREu2CebSVRwXkEDQ/VOB1xaEp8DnV+GZ54qSp55KuVCANbIgLCeFJ
         j5Yk3Ra96DPZsUy12d+7eeQEjl9cngw/LEzIZN8O56nB4TZ+hApjoPBdGy13g1EhAzX3
         bNDGLUJpamHdZ/iVSodHImiI15wG3T7q++7g/3hEwNGaigHUf1OK8gKGUzEITNf0re82
         3d7VQgzgdZItX4zcZI4d8vuWmyc851wS0IRNIPkuCdAiqnCZKn/UB68Sldv2UTN4BvE2
         OEt16ZKzRRoFLkBPEaYsW9vdcuKYkr70k7PqtUKyAoXSJbDJYdXASOIXveZ6Efqcg6ZT
         OkEA==
X-Forwarded-Encrypted: i=1; AJvYcCWV1kS778mXNPbgzc61nfAvZp5V2WA2dz4q++6UZrE0VA3qEJwnkAcLIGxxtUZgvW2qdKKq2K8R@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwnKnMyWsDZjTM6AJ8Jm3/yQmM8MtvVpOjVtA0w1so2lLJ1DBvQ
	4Msy7xcUMqIvoj6PtnMgfLlXDxSvtsKrWABkTVOPOW3rQohgyJ9rX+J752Li9xNZ0PLSA5Kity1
	Wlps1mpk3JWjchJMB8xcIFzW/d/NT8Lvhmvvp
X-Gm-Gg: ASbGncvsVAUqrpOIqx0S7foFEwvof8hCVyIsxBQn34CE1nKrZb2K5a785rrIcKwXOXJ
	D5IG0d9eqMMmKUI/NUrayzuqj2Ge+MWrK0kglnWdJEt5iLKiOdFs+BzGf8+vznvq4r5DJpJQ1hB
	atLpF/IUNzbD377bXn3KDNZk6EyEy87xamwUopb6o+JiPrlXk3R/XQ/2213iw=
X-Google-Smtp-Source: AGHT+IEw93XJEBy5ezyhU+CSEJVMjgZZFewI6Tsz4tcqKcBwzJR9Wkrpv3XuespSXTgnV6c1Mj2e8FGtmA8ZwZQ1Tg0=
X-Received: by 2002:aa7:c58a:0:b0:5dc:ccb4:cb11 with SMTP id
 4fb4d7f45d1cf-5e5e33fef8emr76510a12.4.1741328618034; Thu, 06 Mar 2025
 22:23:38 -0800 (PST)
MIME-Version: 1.0
References: <e674332a-6956-4184-b077-39a0cc0e624d@gmail.com> <CAMhqiMr3gdVuAsbaJ+MJuU61fWxoUWjE_-7fFrvojr=+OYgm_Q@mail.gmail.com>
In-Reply-To: <CAMhqiMr3gdVuAsbaJ+MJuU61fWxoUWjE_-7fFrvojr=+OYgm_Q@mail.gmail.com>
From: Zhichuang Sun <zhichuang@google.com>
Date: Thu, 6 Mar 2025 22:23:26 -0800
X-Gm-Features: AQ5f1JrpEtsGtGqAs4tDUWGmWg8zAXYn0oIcBezwTwor1zpB0JTHCuijKmPD1tM
Message-ID: <CA+g7whQUEo5kJu9YziKvNWt+tsX664jU_-6z4D9KapX9eQ6_Vg@mail.gmail.com>
Subject: Re: SPDM Daemon status & Collaboration
To: Ratan Gupta <ratankgupta31@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000b796c8062fbaa9c3"
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: Kumar Anand <kumaranand@google.com>, Justin York <jeyork@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>, Jerome Glisse <jglisse@google.com>, Manojkiran Eda <manojkiran.eda@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000b796c8062fbaa9c3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ratan and Manoj,

The current spdmd design has multiple transport support in consideration.
It=E2=80=99s pretty straightforward to add a new transport support.

I have asked Patrick about the process to create a spdmd repo within
OpenBMC. I=E2=80=99m happy to work with you folks together to upstream our =
spdmd
with builtin support for multiple transport layers.

Thanks,
Zhichuang




On Thu, Mar 6, 2025 at 8:48=E2=80=AFPM Ratan Gupta <ratankgupta31@gmail.com=
> wrote:

> Hi Manoj,
>
> Thanks for bringing this up again. I've also been discussing with
> Zhichuang about upstreaming the SPDM stack over the past few months. We
> plan to start pushing our patches to Gerrit by next week.
>
> One thing to consider is the possibility of supporting different transpor=
t
> bindings, such as TCP and MCTP.
>
> We can go over these details in the design enhancement discussion you
> initiated: Gerrit <https://gerrit.openbmc.org/c/openbmc/docs/+/78257>.
>
> Thanks,
> Ratan
>
>
>
> On Mon, Feb 17, 2025 at 6:11=E2=80=AFPM Manojkiran Eda <manojkiran.eda@gm=
ail.com>
> wrote:
>
>> Hi Zhichuang,
>>
>> I hope you are doing well.
>>
>> I noticed that the SPDM daemon design document where you were the
>> primary contributor was merged around Feb 2023 [1]; however, I have not
>> seen any corresponding repository creation or code contributions since
>> then. At IBM, we are keen on leveraging the recently released SPDM over
>> TCP specification from DMTF [2] and extending the existing design to
>> support attestation over TCP [3].
>>
>> I wanted to check whether you are still interested in up-streaming the
>> implementation. If so, I would be delighted to collaborate and
>> contribute the necessary enhancements to accommodate TCP-based use
>> cases. If you don=E2=80=99t intend to upstream, I am happy to
>> contribute/maintain code & develop a solution that ensures the stack is
>> architected to seamlessly scale for both TCP and MCTP transport
>> mechanisms.
>>
>> I look forward to your thoughts and the opportunity to collaborate.
>>
>>
>> **References:**
>> 1.
>>
>> https://github.com/openbmc/docs/blob/master/designs/redfish-spdm-attesta=
tion.md
>>
>> 2. https://gerrit.openbmc.org/c/openbmc/docs/+/78257
>> 3.
>>
>> https://www.dmtf.org/sites/default/files/standards/documents/DSP0287_1.0=
.0.pdf
>>
>>
>>
>> Best regards,
>> Manoj
>>
>>

--000000000000b796c8062fbaa9c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi=C2=A0Ratan and Manoj,</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">The current spdmd design has multiple transport support =
in consideration. It=E2=80=99s pretty straightforward to add a new transpor=
t support.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">I have =
asked Patrick about the process to create a spdmd repo within OpenBMC. I=E2=
=80=99m happy to work with you folks together to upstream our spdmd with bu=
iltin support for multiple transport layers.</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">Thanks,</div><div dir=3D"auto">Zhichuang=C2=A0</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br=
></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_qu=
ote gmail_quote_container" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_att=
r">On Thu, Mar 6, 2025 at 8:48=E2=80=AFPM Ratan Gupta &lt;<a href=3D"mailto=
:ratankgupta31@gmail.com">ratankgupta31@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><div dir=3D"ltr">Hi Manoj,<br><br>Thanks for =
bringing this up again. I&#39;ve also been discussing with Zhichuang about =
upstreaming the SPDM stack over the past few months. We plan to start pushi=
ng our patches to Gerrit by next week.<br><br>One thing to consider is the =
possibility of supporting different transport bindings, such as TCP and MCT=
P.<br><br>We can go over these details in the design enhancement discussion=
 you initiated: <a href=3D"https://gerrit.openbmc.org/c/openbmc/docs/+/7825=
7" target=3D"_blank">Gerrit</a>.<br><br>Thanks,<br>Ratan<div><br></div></di=
v><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Mon, Feb 17, 2025 at 6:11=E2=80=AFPM Manojkiran Eda &lt;<a href=3D"mailt=
o:manojkiran.eda@gmail.com" target=3D"_blank">manojkiran.eda@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Zh=
ichuang,<br>
<br>
I hope you are doing well.<br>
<br>
I noticed that the SPDM daemon design document where you were the <br>
primary contributor was merged around Feb 2023 [1]; however, I have not <br=
>
seen any corresponding repository creation or code contributions since <br>
then. At IBM, we are keen on leveraging the recently released SPDM over <br=
>
TCP specification from DMTF [2] and extending the existing design to <br>
support attestation over TCP [3].<br>
<br>
I wanted to check whether you are still interested in up-streaming the <br>
implementation. If so, I would be delighted to collaborate and <br>
contribute the necessary enhancements to accommodate TCP-based use <br>
cases. If you don=E2=80=99t intend to upstream, I am happy to <br>
contribute/maintain code &amp; develop a solution that ensures the stack is=
 <br>
architected to seamlessly scale for both TCP and MCTP transport mechanisms.=
<br>
<br>
I look forward to your thoughts and the opportunity to collaborate.<br>
<br>
<br>
**References:**<br>
1. <br>
<a href=3D"https://github.com/openbmc/docs/blob/master/designs/redfish-spdm=
-attestation.md" rel=3D"noreferrer" target=3D"_blank">https://github.com/op=
enbmc/docs/blob/master/designs/redfish-spdm-attestation.md</a> <br>
<br>
2. <a href=3D"https://gerrit.openbmc.org/c/openbmc/docs/+/78257" rel=3D"nor=
eferrer" target=3D"_blank">https://gerrit.openbmc.org/c/openbmc/docs/+/7825=
7</a><br>
3. <br>
<a href=3D"https://www.dmtf.org/sites/default/files/standards/documents/DSP=
0287_1.0.0.pdf" rel=3D"noreferrer" target=3D"_blank">https://www.dmtf.org/s=
ites/default/files/standards/documents/DSP0287_1.0.0.pdf</a> <br>
<br>
<br>
<br>
Best regards,<br>
Manoj<br>
<br>
</blockquote></div>
</blockquote></div></div>

--000000000000b796c8062fbaa9c3--
