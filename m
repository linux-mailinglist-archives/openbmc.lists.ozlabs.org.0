Return-Path: <openbmc+bounces-24-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 189ABAA594A
	for <lists+openbmc@lfdr.de>; Thu,  1 May 2025 03:18:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Znx5k0fCtz2ygK;
	Thu,  1 May 2025 11:18:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::236"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746062330;
	cv=none; b=MdI48bLB66RM285F3gCF2D/uiYirpYaQATd8iWZNeLZqbj3hA1pxI8chmNX7zq584a3zJ0qjcCP+41QFxSTuD0mCElggNOuYv+EmF1CFCnni3LJUwQP+wKHDVa3+if4Ev5Wl+FWGGifo+I2LDm5sIZxnemnLDvFKIjoMeWORJ25ZFwxRZJmIEulbOuWz+oeerUu1cRhSIUJCaYQZ1MxUVBVlNsmPerx3eAnct1mTuLz6DRMpAwxAUlXNTjp4I02ghJ5Sa/k8ixcCDe/UXUt06OXXVPYOrZ3jl8Dsk+kD+e/pdC6VaAyL7RQgwcwLv62Fb3jX7CF0tRUlsg53vyWHTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746062330; c=relaxed/relaxed;
	bh=DWSJXR0wFOKyp8hj1diIrz/6tDDyj0fRhs5OVJFZJ9I=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=SLQ626Cb69J76mVueHr67iF8IPDvlbbH36qluGutD5/xWufmm2VP3kYkq8duuxjCoJEDrBa+HO2rrO9VuH8RAVwFmZBhWBr4Ku+4ml9Z+gDAzoU5KrMBQ6gN5jkVDijVksVkSfkhRG/LEp7kvVGTNHkVysHdmRhnfj77Fu1swm5HKlZ0eIo6J/TTiVs9f9+DrXsw3tGGvehxXB1FR3zzeXbwvqU/g9LMGpsIOBjRlfxExanOM7Nis3H/oUNCHHGsgSnmRKcUvhZ89tvV03bRl+XoiwHvoSAh/0hp/eqoc9/xBbKaivCj71CcstN4F9Ela+UEHywmvZjLKwMtyqcFKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JHTNvVAX; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::236; helo=mail-oi1-x236.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JHTNvVAX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::236; helo=mail-oi1-x236.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Znx5d1HGsz2yYy
	for <openbmc@lists.ozlabs.org>; Thu,  1 May 2025 11:18:44 +1000 (AEST)
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3f6eaa017d0so452801b6e.0
        for <openbmc@lists.ozlabs.org>; Wed, 30 Apr 2025 18:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746062319; x=1746667119; darn=lists.ozlabs.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWSJXR0wFOKyp8hj1diIrz/6tDDyj0fRhs5OVJFZJ9I=;
        b=JHTNvVAXh0esMGaisEPU4KGHVE5FzKaUa2EQm12cIm5eCseqKxlgkpH19fq4EZc6ur
         GUEfR4F5lWimLXdDFyJqRhBB1e+jAw/DDqfSh46BPsHnAfGKp0+vhPadCoLc7CwWLSEu
         tTxj9Eb375RbjhyNecIDAf7q6VnGyIMNrKQRGKjzWPDIitjROrfheTKRSKYr4Fd0FICd
         4L/cEJm+3MdVBCIDqtIPTM0OGeEOAC9BjPdwY3G9Oh55LL6C9/4SRXXjGy70FjZlIC0i
         GZNehZbFiu5LC4nQkl6hvNo3kxZ90DwyQpNyzEcCqm05dxmH4tzsdyahlmSxhnXWiwWu
         vSiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746062319; x=1746667119;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DWSJXR0wFOKyp8hj1diIrz/6tDDyj0fRhs5OVJFZJ9I=;
        b=S1h+szAI75STFRh0MwgTBoxDEp9FunmKhssLUCgHqh3B9pJAcdgUOcyhm2xTyolyxv
         UPmebVsYgIeRalmNCsh4w7m/Pshg+6TGi3kDdNyJ/eXQHLNV5xGNaeo1O0DzkBSVTSUs
         yzVOa3Eaf4kctimF/NH3HoaWl2bCB7Qq6pwh3GImrXQSub5ZdzqhK4EFENY6YJ7lNqTw
         ZbMq354pba3fC7M33ecXiAZ11RYXDN7MMVYvETHdvFQsAxGLa1dw5oGZySvVbdOWl2Uc
         c7CfdU8TiZH8gw+Un4d/I7wWQV0jn88P6cSpI2cVndNzubL0mg28+oyzxevQqoCqrhii
         jyGA==
X-Forwarded-Encrypted: i=1; AJvYcCXSWZv/2yQ8eJXlh6OjOlRWZgfSlsgtlbKHhe/xctUJboGQkxgEtZCgo6AHb8RPtaZgZylnyuKO@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwCCy7MvtnDYyvj+vn1L5WY64ttu4kMPiKGg0cBGFnv5mNaeHs/
	ixCNqf2VrTF7Btuy0LjBAyH9kuZMr6LIZMyzSISDHNlGvmGJ0GId
X-Gm-Gg: ASbGnct/Y5RfS7cI+Qc/I6or6nMwXBKbo7aaju0+lWY8sbF4Hea7TLAWVC0quziLxjN
	dNFJ4l606RXNxdJxO56Iz1uXCtjhQ/f8kmPL3XC+YkRVrulf9ZdGiCbXQz8bJIAZUVbNRUJT2WY
	KfRXz8GVmD6o+OZNa98imihFh/t3Lv6Mks/4mF3TzLYDAPcUaVnZkzDMYLarCbeAeL+imMMjXgo
	X+DhDE4cUQVgPCkOoBeLTi42pSKoLwvOd/aqBiqxP1pY+p5QlVnr+QeQry/eLZLG7eR3XQY+nTF
	tS2Widym0JdwCgOZf1sQ49Fh1eIFZO8a4XH6/K7NhcmFJRVkTCKux2kKcUDh8eiFOo+IZicKK0K
	LIx1W9V7FQsJYnR+MTe0K4So=
X-Google-Smtp-Source: AGHT+IH51/3Inz6uEJLQrQOC5vymI+28YNxnS5NSR86cWqZZRSZ9m1itPgNJE2E0TycZa1XZLogn3Q==
X-Received: by 2002:a05:6808:6906:b0:400:b3a8:2cb8 with SMTP id 5614622812f47-40335d526camr344293b6e.25.1746062319414;
        Wed, 30 Apr 2025 18:18:39 -0700 (PDT)
Received: from ?IPV6:2605:a601:aaf4:7400:ac70:33be:ac3a:3c99? ([2605:a601:aaf4:7400:ac70:33be:ac3a:3c99])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-60686e96d33sm1001670eaf.7.2025.04.30.18.18.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 18:18:39 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------FhxDSQIUoLuyeyxajdE8cIwl"
Message-ID: <04bc51b1-d676-44a1-a784-b92d3ee82113@gmail.com>
Date: Wed, 30 Apr 2025 20:18:38 -0500
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Quantas CCLA Schedule A update 20250430
To: =?UTF-8?B?TGl0enVuZyBDaGVuICjpmbPliKnnkK4p?= <Litzung.Chen@quantatw.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Cc: =?UTF-8?B?Q29zbW8gQ2hvdSAo5ZGo5qW35Z+5KQ==?= <Cosmo.Chou@quantatw.com>
References: <SEYPR04MB77552DD941E8BE0C886E8083F1832@SEYPR04MB7755.apcprd04.prod.outlook.com>
Content-Language: en-US
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <SEYPR04MB77552DD941E8BE0C886E8083F1832@SEYPR04MB7755.apcprd04.prod.outlook.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This is a multi-part message in MIME format.
--------------FhxDSQIUoLuyeyxajdE8cIwl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 4/30/2025 5:12 AM, Litzung Chen (陳利琮) wrote:
>
> Hiteam,
>
> Please find the attached file for updated Schedule A of CCLA from Quant
>

Thanks for keeping it up to date. I've updated the projects google drive 
folder with this update.

Andrew

> .
>
> Best Regards,
>
> Litzung
>
> Software Advanced R&D Division
>
> Business Headquarters
>
> Quanta Computer Inc.
>

--------------FhxDSQIUoLuyeyxajdE8cIwl
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 4/30/2025 5:12 AM, Litzung Chen
      (陳利琮) wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:SEYPR04MB77552DD941E8BE0C886E8083F1832@SEYPR04MB7755.apcprd04.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="Generator"
        content="Microsoft Word 15 (filtered medium)">
      <style>@font-face
	{font-family:新細明體;
	panose-1:2 2 5 0 0 0 0 0 0 0;}@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}@font-face
	{font-family:Verdana;
	panose-1:2 11 6 4 3 5 4 4 2 4;}@font-face
	{font-family:微軟正黑體;
	panose-1:2 11 6 4 3 5 4 4 2 4;}@font-face
	{font-family:"\@微軟正黑體";}@font-face
	{font-family:"\@新細明體";
	panose-1:2 1 6 1 0 1 1 1 1 1;}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:"新細明體",serif;}span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Verdana",sans-serif;
	color:blue;}span.apple-converted-space
	{mso-style-name:apple-converted-space;}span.EmailStyle20
	{mso-style-type:personal;
	font-family:"Verdana",sans-serif;
	color:blue;}span.EmailStyle21
	{mso-style-type:personal-compose;
	font-family:"Verdana",sans-serif;
	color:blue;}.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}div.WordSection1
	{page:WordSection1;}</style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal"
          style="text-align:justify;text-justify:inter-ideograph"><span
            lang="EN-US"
style="font-size:10.0pt;font-family:&quot;Verdana&quot;,sans-serif;color:blue">Hi</span><span
            class="apple-converted-space"><span lang="EN-US"
style="font-size:10.0pt;font-family:&quot;Verdana&quot;,sans-serif;color:#0033CC">
            </span></span><span lang="EN-US"
style="font-size:10.0pt;font-family:&quot;Verdana&quot;,sans-serif;color:#0033CC">team</span><span
            lang="EN-US"
style="font-size:10.0pt;font-family:&quot;Verdana&quot;,sans-serif;color:blue">,</span><span
            lang="EN-US"><o:p></o:p></span></p>
        <p class="MsoNormal"
          style="text-align:justify;text-justify:inter-ideograph"><span
            lang="EN-US"><o:p> </o:p></span></p>
        <p class="MsoNormal"
          style="text-align:justify;text-justify:inter-ideograph"><span
            lang="EN-US"
style="font-size:10.0pt;font-family:&quot;Verdana&quot;,sans-serif;color:#0033CC">Please
            find the attached file for updated Schedule A of CCLA from
            Quant</span></p>
      </div>
    </blockquote>
    <br>
    Thanks for keeping it up to date. I've updated the projects google
    drive folder with this update.<br>
    <br>
    Andrew<br>
    <br>
    <blockquote type="cite"
cite="mid:SEYPR04MB77552DD941E8BE0C886E8083F1832@SEYPR04MB7755.apcprd04.prod.outlook.com">
      <div class="WordSection1">
        <p class="MsoNormal"
          style="text-align:justify;text-justify:inter-ideograph"><span
            lang="EN-US"
style="font-size:10.0pt;font-family:&quot;Verdana&quot;,sans-serif;color:#0033CC">.</span><span
            lang="EN-US"><o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US"
style="font-size:10.0pt;font-family:&quot;Verdana&quot;,sans-serif;color:blue"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US"
style="font-size:10.0pt;font-family:&quot;Verdana&quot;,sans-serif;color:blue">Best
            Regards,<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US"
style="font-size:10.0pt;font-family:&quot;Verdana&quot;,sans-serif;color:blue">Litzung<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US"
style="font-size:10.0pt;font-family:&quot;Verdana&quot;,sans-serif;color:silver">Software
            Advanced R&amp;D Division<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US"
style="font-size:10.0pt;font-family:&quot;Verdana&quot;,sans-serif;color:silver">Business
            Headquarters<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US"
style="font-size:10.0pt;font-family:&quot;Verdana&quot;,sans-serif;color:silver">Quanta
            Computer Inc.</span><span lang="EN-US" style="color:blue"><o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US"><o:p> </o:p></span></p>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------FhxDSQIUoLuyeyxajdE8cIwl--

