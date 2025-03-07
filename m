Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D70BA55F9B
	for <lists+openbmc@lfdr.de>; Fri,  7 Mar 2025 05:48:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z8DLm3GY1z3d23
	for <lists+openbmc@lfdr.de>; Fri,  7 Mar 2025 15:48:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4860:4864:20::2b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741322893;
	cv=none; b=hfByYMiFE3REs9usLpBTI6og7vQLAXXlGINSIe04Tbnyv2XnLh22Mr+cLcC7FgMoY5XqwL9AsPuWmPmc4Gm7Kn0wQ0D//VLt8IWIgnmBp2Mqucm2OcCh57uNs0g5uc+rPHBk1XVu9Fqm36duy8y9oDw5VSbfycHugtIRetpSeIo9KFsI+z88F9eiodOPZ0ywNJfDO+ohP7LCit9ZxA75k8plue6U1l+IgSvIwTddsRzIBlt7uqXzgiIVC4tVRHVhwZf1GIBa23SowmrDWsqQdxTBW03EHWy9B8xloLlziqK6/pUxekBkgllwdwKlt607AZZAdIHkwTO0aaxgo6zVLA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741322893; c=relaxed/relaxed;
	bh=UpG/EA941FzxwMPsRoN6tYySpptVQvyGSx0eTTmtGXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MuU5pzh3vZyl1SCI0QCdpai6oz9b+5U11a2hjeOqepUtsbyXsryeP22DN1mLD7t4xgCrgDP2iJ4u8CGVHBTB1GB8Cw9jSZjo6AsMNuZ+jOdI+UiKOgL2re3wXUtIEVCx4UyST+kSKSQ0VLzfenMehREW+jRmiPQqMjjdsWfSA4PdRKC/rUIYbP84cwuXJF1OJhXnxfdn7QwYFJfwdI1xsj3B0blsm6wJhoopTAv+fKAEbDgGjm680DkliMyzW2e90xf2IlzXsjM/CgmB96doYUzRuFEc6pws7OeYFiC4mVJJcO/1lhECWOBwRrZdC4MlD8dvgvIDo+T+7q+itA6n8A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Z91TCxfF; dkim-atps=neutral; spf=pass (client-ip=2001:4860:4864:20::2b; helo=mail-oa1-x2b.google.com; envelope-from=ratankgupta31@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Z91TCxfF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2b; helo=mail-oa1-x2b.google.com; envelope-from=ratankgupta31@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z8DLg12NCz3089
	for <openbmc@lists.ozlabs.org>; Fri,  7 Mar 2025 15:48:10 +1100 (AEDT)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-2bcdf5ea8faso907092fac.2
        for <openbmc@lists.ozlabs.org>; Thu, 06 Mar 2025 20:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741322887; x=1741927687; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UpG/EA941FzxwMPsRoN6tYySpptVQvyGSx0eTTmtGXg=;
        b=Z91TCxfFP4sMZUNBP3lO5v5mGwa8P2SrdCjWREIyK6hZeWUQCef2WE4TmOM8iJBS7D
         tPEbvJnbynTRnbB6irZGYvArKFCg5j9VqCotj7ds1lQPO2EloQKyxj2ylodGBhSqaISC
         wsGO/0+1hLi2gR6WWl7pTIUFEphVkZN20fwQS3pz33hqD7+VBOzLp/0nRjrjT4Vt99WH
         JkLUQXu3t+FowIfyfRF3JEa2eKrgilTOA6r9tHXDlVyScQOZqfk7VePmtRJTXAGdkIDv
         Gfi0V07sxfJ+7ZeekxUdw8BznIr/EVCkMCNiZz2vGoQWHeuG8rA5082rkUqqxZjBL85Y
         INUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741322887; x=1741927687;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UpG/EA941FzxwMPsRoN6tYySpptVQvyGSx0eTTmtGXg=;
        b=VT2axgts+w4Az4fnWxQNRTjXLAT49napMpDfgLI3GEYCn7Zkj47L+7GNEiuFX3w9tn
         IpN/BXwqqpqpycgdzu8Z2V1bX2CbmquVlaEwqZbRQCuES+vKFI0nP8gCOpOy2HAh+03Q
         nf0HBYuI2duvfuPcqdAM58m49BtJJjKK7sWLLAu0gUOhrGq5qOP4XGwLblDCiUkS8MZq
         M9zbrcS1Tm1DP8zK/kYLx6nhYt/PCDhHSTaKBV8Fkp172k+Kg6YShHO/o+VmJ4zIYI22
         tPcj5XnDapffMdnMYEUhbCPsv/A2Vr9tgl1AXDUPm3oB+CwlYokOnPM8S/uKjY4HRZXS
         bEyA==
X-Forwarded-Encrypted: i=1; AJvYcCXmWoGx5CTXNyPOpXIXRQE07INz1bKhpJW7Ce7MSKUHe3MulOkUeJwYeOtSwb9HZiys0DGuwCvl@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxiJGQURMguHrW10lkTgCJpEVCx61jVw9DxpA5CCcVafLK2BhWG
	zQb/9650xo+02mskGIW8KNkb+RGTQKh/XwY+dBYUQe5BmR7yOVrIVIQcvPGVayw64JCCND6enjh
	T8ptlqFkGL5oyHlHj0rMpsF9LxAA=
X-Gm-Gg: ASbGncu5OcKXf/wP58dCgtZZywHv2UmO5e5lvdY4pYgA3gThZaqOZQ+HI4GE2M39FnC
	uP0hqboUdB0B5C3ylvYwbmNN4K+lSePtjKMq75076NZPQljw0sS7IWvovVl/VzlDowRZ8JvhsGa
	Pv4I/v1q+Dx/kQPsPZuHb94GPcq9xBtgeFB97tNVDgiN6tn/BwmJNptVuxEm4=
X-Google-Smtp-Source: AGHT+IHQabJt4jtD2hxw8GzsF0uBtgAbC3h//Bu+XmmUjcOMsQ1wBvGpbQmFqJeRSIdmPSa2Z8Kq4y9kcPtzdeM+xF8=
X-Received: by 2002:a05:6871:522c:b0:2c1:5674:940e with SMTP id
 586e51a60fabf-2c2610cf6e4mr1082403fac.21.1741322886846; Thu, 06 Mar 2025
 20:48:06 -0800 (PST)
MIME-Version: 1.0
References: <e674332a-6956-4184-b077-39a0cc0e624d@gmail.com>
In-Reply-To: <e674332a-6956-4184-b077-39a0cc0e624d@gmail.com>
From: Ratan Gupta <ratankgupta31@gmail.com>
Date: Fri, 7 Mar 2025 10:17:55 +0530
X-Gm-Features: AQ5f1Jovw3Bla5yUVo2zVxg2YTRvk70QOe33-GVqANu70_7GR9hgryhyl0RFIug
Message-ID: <CAMhqiMr3gdVuAsbaJ+MJuU61fWxoUWjE_-7fFrvojr=+OYgm_Q@mail.gmail.com>
Subject: Re: SPDM Daemon status & Collaboration
To: Manojkiran Eda <manojkiran.eda@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000001c212a062fb954a2"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>, zhichuang@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000001c212a062fb954a2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Manoj,

Thanks for bringing this up again. I've also been discussing with Zhichuang
about upstreaming the SPDM stack over the past few months. We plan to start
pushing our patches to Gerrit by next week.

One thing to consider is the possibility of supporting different transport
bindings, such as TCP and MCTP.

We can go over these details in the design enhancement discussion you
initiated: Gerrit <https://gerrit.openbmc.org/c/openbmc/docs/+/78257>.

Thanks,
Ratan



On Mon, Feb 17, 2025 at 6:11=E2=80=AFPM Manojkiran Eda <manojkiran.eda@gmai=
l.com>
wrote:

> Hi Zhichuang,
>
> I hope you are doing well.
>
> I noticed that the SPDM daemon design document where you were the
> primary contributor was merged around Feb 2023 [1]; however, I have not
> seen any corresponding repository creation or code contributions since
> then. At IBM, we are keen on leveraging the recently released SPDM over
> TCP specification from DMTF [2] and extending the existing design to
> support attestation over TCP [3].
>
> I wanted to check whether you are still interested in up-streaming the
> implementation. If so, I would be delighted to collaborate and
> contribute the necessary enhancements to accommodate TCP-based use
> cases. If you don=E2=80=99t intend to upstream, I am happy to
> contribute/maintain code & develop a solution that ensures the stack is
> architected to seamlessly scale for both TCP and MCTP transport mechanism=
s.
>
> I look forward to your thoughts and the opportunity to collaborate.
>
>
> **References:**
> 1.
>
> https://github.com/openbmc/docs/blob/master/designs/redfish-spdm-attestat=
ion.md
>
> 2. https://gerrit.openbmc.org/c/openbmc/docs/+/78257
> 3.
>
> https://www.dmtf.org/sites/default/files/standards/documents/DSP0287_1.0.=
0.pdf
>
>
>
> Best regards,
> Manoj
>
>

--0000000000001c212a062fb954a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Manoj,<br><br>Thanks for bringing this up again. I&#39;=
ve also been discussing with Zhichuang about upstreaming the SPDM stack ove=
r the past few months. We plan to start pushing our patches to Gerrit by ne=
xt week.<br><br>One thing to consider is the possibility of supporting diff=
erent transport bindings, such as TCP and MCTP.<br><br>We can go over these=
 details in the design enhancement discussion you initiated: <a href=3D"htt=
ps://gerrit.openbmc.org/c/openbmc/docs/+/78257">Gerrit</a>.<br><br>Thanks,<=
br>Ratan<div><br></div></div><br><br><div class=3D"gmail_quote gmail_quote_=
container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 17, 2025 at 6:=
11=E2=80=AFPM Manojkiran Eda &lt;<a href=3D"mailto:manojkiran.eda@gmail.com=
">manojkiran.eda@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">Hi Zhichuang,<br>
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

--0000000000001c212a062fb954a2--
