Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E319DE967
	for <lists+openbmc@lfdr.de>; Fri, 29 Nov 2024 16:30:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y0HFG12Snz3bTN
	for <lists+openbmc@lfdr.de>; Sat, 30 Nov 2024 02:30:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::32a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732894239;
	cv=none; b=fWmhGPYkkuBipmCiPtP8K6GpvSGGlhQwvbGQU3kiHiqoNTM/07R8ePCsnVpUk8+vc5kUXF/CyNORwlHsZaLIFFBctJ1B16HfYf48R9QMDoV8NaXZCtpGatVpJ4RMs7pejiT5OgV+Ga9kjuA+GB5IWBnc97OlMAG04l7BBmAlZvZlSbgLaQ1knFYIe+92cFH4EUrgcyLHj2exFQFUbHch7jo401YEhLIQ4xpAg1RnWQevtdI9P3l46b0fepBn2DO2fNguUzhKDc0StvZUqOY683tDwoe/CPlkrlf1tDOTzXHsDT2wyq2AO+NkL0dxoWwmPbhgLmDxMMUK8lLJhgvoUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732894239; c=relaxed/relaxed;
	bh=kInNx0j466caoP9Tqr4sobkJilcpxFkciOlrig1dWWo=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:References:
	 Cc:From:In-Reply-To; b=eUc91n55sagvvAIu+HV/J2ojYlR+QJon1JyCdDQ04csx7cZRCp6Kkmy+nnvtwjmU45UFwFW6wxI16mHn3XN4glRTGTVZP+XeZN7K2EZ1+W0ysdcwWZpRjmZPMa9Pb5FMxynGL7zOPfZgFd0JytGYSvDuLER6//iBrO1CmSTNcbfzC+TrQgw/ava7zY2JF7Qox8yj3omykwQQVxzywpJJKHintBP5402uyU9J2Iahs1ed9+uvtnvQ0gajOdRH3+Eq1nfkefSKHDDPiKPSsLl2nD8fJepoQfnh6i2wylD/3xVF6gPdypGy5u6qqEKhrn6O28pmdMqghSUNKMKo0Pi7yw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fXMCMUZi; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::32a; helo=mail-ot1-x32a.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fXMCMUZi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32a; helo=mail-ot1-x32a.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y0HF84Ffgz2y8q
	for <openbmc@lists.ozlabs.org>; Sat, 30 Nov 2024 02:30:35 +1100 (AEDT)
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-71d4ba17cd2so796614a34.3
        for <openbmc@lists.ozlabs.org>; Fri, 29 Nov 2024 07:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732894232; x=1733499032; darn=lists.ozlabs.org;
        h=in-reply-to:from:cc:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kInNx0j466caoP9Tqr4sobkJilcpxFkciOlrig1dWWo=;
        b=fXMCMUZijfHfs7JAWcycJ4wNmuK/G60/hTr8wT0nO/vDJjFlDP8S1lkOtEZhjSTc2V
         yH0UI7jkI1tgYOhnO6DU3mrwBySzlDQ8sIZdqa/EfCSVn7RqKP49n4/kKQOyAkayIXYj
         6PRI66TNJoWUo10z0hF4PfJVm58XDDoAn3HURGFebwVloHrgGyBko+AgFVh8YH/jn/cC
         3V9rvEYsviDnV+tuYXp57XHbq+xeJ9lGl9Roz5fbJEXhIf2THIp4EvJTrQATlkiS0TSk
         FYA04RdOOumXcuvv9rHqwl/sA71FCHnrV/E5d3mOGEJJcNgYRVq+2Fpj4/KTjrgMxvA7
         C+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732894232; x=1733499032;
        h=in-reply-to:from:cc:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kInNx0j466caoP9Tqr4sobkJilcpxFkciOlrig1dWWo=;
        b=j1yTr8zeRM7RDH+2J/8eHv0ZckxuDwU6XgHb13oIzv145PMjCGrcIS1S1uzYV9WuXt
         CVjzoYjTyZF/1xv806tDr8hRawXZ5M8N0GZGHlQQ8lTLQ9ohwNkU6Rk7hBlYH4d4pB+i
         5ofDQnhGAo01mRtzXWjLZNyR/gXKufsxRmGU092s+CutoA6+3AhNGKsMVAgA7fplzJRZ
         vv/XKmOPjM7c208ll18Su0UMSEHv4n6BQSZDVH+zVot2A3yMP/hUM/3YMYz2M+a6hlcD
         EoloAYRHESJjRdh4jRNqWecEtxfU7lHw/tgOnVANU/R2iVxWfw1AEKnvQSKsocf1E2t5
         12Ow==
X-Gm-Message-State: AOJu0Yw7qML83+29opIRPLwUEdAjJ36CW1Pe10O2fqgj8tGT6QKm7569
	pPL13A4Gwn6kxE5XdmcmYZdzsTzbgm+f67FkDx8Uh5e3/WRCqN5qBrxUI797
X-Gm-Gg: ASbGncv68AXjfT6cgboj+kBwWDmYBejDSQyrk3J9dpOC5M4RYYOWptjY2qqcKZeGfjS
	zPVHxRLWyllGsP1FMqT/tMKN+2dAoHqEfI6t6uHNEiz24c76V1sNhQjTKvp99QLy0zl31Rsv1Ji
	uzXuHE9SVjDbCanBSebcpohQ8WFbJJDUCYR+Yk0OcbA9h9HXwb+y6dFLB5RY+Kj6SbyLrGqBjDi
	vjC8Vgq454lo3MCAw5SRdR/ESsho10FQQ7jKpTcmPzRYtusgXaURlTxXKyjDfjuCcY10SlQYIlm
	GCIFAz63DhVPKS026sWObtbtcE8qHki0
X-Google-Smtp-Source: AGHT+IGQjdmVpSxnmXfKlvAyQAbv8Gnl/UQddzLnvowZvfp3nLtgRD9tTnGgThtkAMJxlZJ1h2lcNw==
X-Received: by 2002:a05:6830:6e9c:b0:719:dd54:ee79 with SMTP id 46e09a7af769-71d65cafa6dmr10629753a34.15.1732894232515;
        Fri, 29 Nov 2024 07:30:32 -0800 (PST)
Received: from ?IPV6:2605:a601:aa83:2800:790f:f0a3:3837:4689? ([2605:a601:aa83:2800:790f:f0a3:3837:4689])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71d7255f7bfsm770350a34.38.2024.11.29.07.30.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2024 07:30:32 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------D03D2bjWyiIy01eAqfgMiW27"
Message-ID: <ea506101-a1e8-4078-a1f3-0ed4926d64a4@gmail.com>
Date: Fri, 29 Nov 2024 09:30:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Quantas CCLA Schedule A update 20241121
To: Litzung.Chen@quantatw.com
References: <TYZPR04MB774135726E51B37D588B80E3F1222@TYZPR04MB7741.apcprd04.prod.outlook.com>
Content-Language: en-US
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <TYZPR04MB774135726E51B37D588B80E3F1222@TYZPR04MB7741.apcprd04.prod.outlook.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------D03D2bjWyiIy01eAqfgMiW27
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/21/2024 3:35 AM, Litzung Chen (陳利琮) wrote:
>
> Hiteam,
>
> Please find the attached file for updated Schedule A of CCLA from Quanta.
>
Thanks for keeping it up to date. I've uploaded it to the Quanta CLA folder.

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
--------------D03D2bjWyiIy01eAqfgMiW27
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/21/2024 3:35 AM, Litzung Chen
      (陳利琮) wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:TYZPR04MB774135726E51B37D588B80E3F1222@TYZPR04MB7741.apcprd04.prod.outlook.com">
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
	text-decoration:underline;}span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Verdana",sans-serif;
	color:blue;}span.apple-converted-space
	{mso-style-name:apple-converted-space;}.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}div.WordSection1
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
style="font-size:10.0pt;font-family:&quot;Verdana&quot;,sans-serif;color:#0033CC"> </span></span><span
            lang="EN-US"
style="font-size:10.0pt;font-family:&quot;Verdana&quot;,sans-serif;color:#0033CC">team</span><span
            lang="EN-US"
style="font-size:10.0pt;font-family:&quot;Verdana&quot;,sans-serif;color:blue">,</span><span
            lang="EN-US"><o:p></o:p></span></p>
        <p class="MsoNormal"
          style="text-align:justify;text-justify:inter-ideograph"><span
            lang="EN-US"
style="font-size:10.0pt;font-family:&quot;Verdana&quot;,sans-serif;color:blue"> </span><span
            lang="EN-US"><o:p></o:p></span></p>
        <p class="MsoNormal"
          style="text-align:justify;text-justify:inter-ideograph"><span
            lang="EN-US"
style="font-size:10.0pt;font-family:&quot;Verdana&quot;,sans-serif;color:#0033CC">Please
            find the attached file for updated Schedule A of CCLA from
            Quanta.</span><span lang="EN-US"><br>
          </span></p>
      </div>
    </blockquote>
    Thanks for keeping it up to date. I've uploaded it to the Quanta CLA
    folder.<br>
    <br>
    <blockquote type="cite"
cite="mid:TYZPR04MB774135726E51B37D588B80E3F1222@TYZPR04MB7741.apcprd04.prod.outlook.com">
      <div class="WordSection1">
        <p class="MsoNormal"
          style="text-align:justify;text-justify:inter-ideograph"><span
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
  </body>
</html>

--------------D03D2bjWyiIy01eAqfgMiW27--
