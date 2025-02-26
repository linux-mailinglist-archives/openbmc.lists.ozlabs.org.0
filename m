Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD94A468B7
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2025 18:59:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z32KM5WRpz3cZd
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2025 04:59:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::536"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740592738;
	cv=none; b=Ao2Hu03a0gUy3mXzojFH7NWI12xpSKPJsoOJDFIyQoJvCl+wbQvq6cIopcCe8dEX6w8q+f+887iS5z8zshz9d+MJJidmtobb9wbVazsTp9le1EotuYIpmXl6/6b6oQV5HGOnnJiQB5YZbppxiZ7urzKlFBdm9Opk5p82zD1SoL7wgntlColdpY5vWmVmDxy4+VQUXuFNm2JKDJzM3JUa3j+cSz1iCO/DRabuhWHBByVDwzJr/XKop6Is2SYO8kUDZ9jOJVzGlLS911SqnuZ7fjjdpi/6sEcc5izfQmLKaCWAaGGp66GL/iBJEhNIf9YeuzNbgDWv3Ou5d+xuxiIJcA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740592738; c=relaxed/relaxed;
	bh=CmkvS9UxDR5qE1R0qpi8xu0M47AOrXg9dt+J8qRSXRU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MQ1nlfA+vVVNg2c/pYGfsxe1rF3m2ZTkanHi03LGQhmGDo5lNFLuDxHgK3dY/gyKD0qwXzfdqW2taWE+DYqOK9DUoFDCIgewcJNsLJd2jIa+hkTq5GY+9nxvtigewXufWMN16hjQHhgzWU090XuS0q32z1XrnsJTpeVyy7MoFYi56C8tdLfb9eSYgUu+p7dezAOjCn3I7qD2PGsWAqdjyiQuidsVREr/PPxfsI0Li8XL1b439GETG0zk62KByJcr3Qw+YWlHKr8+l+h3M+iYrS3jls9Mqs+CzEqDC+GzPHxixJq24tgZo1/jQynfgpYgNh4w5sU0KJ0Mt4UAx33+3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=CiRsee0I; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com; envelope-from=zhichuang@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=CiRsee0I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com; envelope-from=zhichuang@google.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z32KD3WtQz3bjM
	for <openbmc@lists.ozlabs.org>; Thu, 27 Feb 2025 04:58:56 +1100 (AEDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5ded4a3bf0bso202a12.0
        for <openbmc@lists.ozlabs.org>; Wed, 26 Feb 2025 09:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740592730; x=1741197530; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CmkvS9UxDR5qE1R0qpi8xu0M47AOrXg9dt+J8qRSXRU=;
        b=CiRsee0IyvhVyo3AsivZR0mn2UmyjDLE7cHDIPBWMWQicFBdtgaagU/5uBz29XgsPH
         PIzHjhdO5iUdrsCzeCW2gKD0IecEYqpsnup/IXYodjbIEaIwDWURGTnk3tR1dLCm6zQ6
         LqCu2jDyJ55LdKDPh/lQuNPO6TobD08WhBZitQwl/X3BCOXECP41fgYPt0kAif5UIFg3
         WbrTB1Y9hQewGMsuSWBzBVMsradg/2fKz9XAE8For95ZsYeyN93sDCwdy8rZQLLQSCIQ
         pYc5RNb08f0NpMyt1j0/bf1d7oqK1rfKnKfPprZPNnDR7nOyhMbySmn/ZBr654de6chO
         HlIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740592730; x=1741197530;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CmkvS9UxDR5qE1R0qpi8xu0M47AOrXg9dt+J8qRSXRU=;
        b=qQ2ee9XrJSErIdnSLFmhO3dF15UlQ0mH65UfbFytrN3vTQTmpaAZZEYTEEyR3P/HeA
         1nLCWHEdHiG4hWERNIv+erRqmXJDrMZ3k69GlezMmCuaQi0rsdEPooNDStfsxJmfxO9b
         XdCUCwbp1o/ZTprK6bLtVWHIVSLZB8cfy1S84ZyAejIZ1strs+65+NjId7ts45wzcWih
         DquQqZt1JAw0m2F/uezusRHbZX4/pc3o/rmPWu2Pg8PMUFNmsHMbsUkmd1oaY53TviFX
         upojK7M9OioJGUhTDhJq1Re+kKS9w50QSRK/kzMF+2ywSzVRDXFjLey3zuoWgAgsD9VB
         bx+w==
X-Gm-Message-State: AOJu0YzUw2w1wECqOT4InNyB4RXX7Roq0+5lk8RiMs0ejGUKrWlR2G1+
	lnCvYigF6kRxTToqS7C6Fbtz0nPQbnw1FalGCiwoZitUTQQ3FajRx+w3F7nTII6lou4Plnmwt+Y
	HKIsbesuWWUbGTIVjIMDaNoRyX+ZQC+6fB/7M
X-Gm-Gg: ASbGncsGC6SZ8Cqpcbjf54MOq0Jkw6/JI2l/FejxLSsuKPvREipIpTb9GCE+A/ypyAI
	Vsavo90g4mtXIg/9dZVBLbAlmpEcBxucbPHZBc5ztvpw8ecaw+BUkDkod3J8SWfpMFW748hdUHu
	qehqZtQXXaUcFPD9loOrZLJ2eWoNL8uevw+qFicg==
X-Google-Smtp-Source: AGHT+IHxvpzi+QLsAzuVWW6kW9sA7ibOQb8WsjXII3pM3KpB/NkBwEx/JJzKcD9m91L4Hxwl4wH6c/ZV5yQchBIEAuI=
X-Received: by 2002:a50:cd5e:0:b0:5dc:ccb4:cb11 with SMTP id
 4fb4d7f45d1cf-5e407be4a1dmr280205a12.4.1740592729918; Wed, 26 Feb 2025
 09:58:49 -0800 (PST)
MIME-Version: 1.0
References: <e674332a-6956-4184-b077-39a0cc0e624d@gmail.com>
In-Reply-To: <e674332a-6956-4184-b077-39a0cc0e624d@gmail.com>
From: Zhichuang Sun <zhichuang@google.com>
Date: Wed, 26 Feb 2025 09:58:38 -0800
X-Gm-Features: AQ5f1Jr99pgITo2yrg_ATXqCD-K7ZMh03zoV_Xbx2RMzSiIphl8mjeb7Qlsut_A
Message-ID: <CA+g7whTWJsZaQvpDmTB7Ohjhy6sgGEH9WxPh007qKQyzjNzhJw@mail.gmail.com>
Subject: Re: SPDM Daemon status & Collaboration
To: Manojkiran Eda <manojkiran.eda@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000005e5b9b062f0f53a4"
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
Cc: Kumar Anand <kumaranand@google.com>, Changming Liu <cmliu@google.com>, Justin York <jeyork@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>, Jerome Glisse <jglisse@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000005e5b9b062f0f53a4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Manoj,

We have already upstreamed our spdmd to https://github.com/google/spdmd. We
are looking forward to adding recipe files into openbmc so that it can be
tested with it.

Thank you,
Zhichuang

On Mon, Feb 17, 2025 at 4:41=E2=80=AFAM Manojkiran Eda <manojkiran.eda@gmai=
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

--0000000000005e5b9b062f0f53a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Hi =
Manoj,</div><div class=3D"gmail_default" style=3D"font-size:small"><br></di=
v><div class=3D"gmail_default" style=3D"font-size:small">We have already up=
streamed our spdmd to=C2=A0<a href=3D"https://github.com/google/spdmd">http=
s://github.com/google/spdmd</a>. We are looking forward to adding recipe fi=
les into openbmc so that it can be tested with it.=C2=A0</div><div class=3D=
"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_def=
ault" style=3D"font-size:small">Thank you,</div><div class=3D"gmail_default=
" style=3D"font-size:small">Zhichuang</div></div><br><div class=3D"gmail_qu=
ote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Fe=
b 17, 2025 at 4:41=E2=80=AFAM Manojkiran Eda &lt;<a href=3D"mailto:manojkir=
an.eda@gmail.com">manojkiran.eda@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">Hi Zhichuang,<br>
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

--0000000000005e5b9b062f0f53a4--
