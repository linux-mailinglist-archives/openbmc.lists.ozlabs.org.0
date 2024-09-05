Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 913B296CBEC
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2024 02:53:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzgpH3DQXz3c9N
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2024 10:53:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::c31"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725497603;
	cv=none; b=F4b+fIsybQrXUTEMYU2hkmC4KWfSw0LAlq6q2QBW7pnn5JE8kq4iLiWz7kF73xKHskQMll9kvsmnLDojDhJwNpJ8crYYvRYPKb4WNYdTGS5liQzjJSn9+u2z8A713XelsPBjW1GvFJitMrsI5I4NlARarETKN0GycMqxdSwLM8f5RXhgEOEnTtPopeAb/qBC5PTUs71KMi7EzNumUD2enSLOxti8HJxu8DUCWuM5aDHoHMlyxfqGqryn27Gwy89stc5jsr8g7ztyIrUieX2hli0752UbgxMvjOjOCLsmeIV0MoC+6gjB/Yi8b8dQGZYwsm7xd0EoaSyKrezROgq9oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725497603; c=relaxed/relaxed;
	bh=EBe0DwYPEL6JD2PmT9xEI0qtoSdhSUsmuvZEe7oddXY=;
	h=DKIM-Signature:Content-Type:Message-ID:Date:MIME-Version:Subject:
	 To:References:From:In-Reply-To; b=UnjLUO+0dRpXmkgR7ZxcAoE+NbsQDBSeGMF/MRG79V5y+zGKz8fvF4BcbNI+MAYDt4H4Esbvglw70Q2O5ZfnoxA1104aCn+YtD2mLKS6RK8pcXaHlgTOVROJr9XLHN+tajB5l8kfJt0J2sGMFzBXlaz5ru059ipJhrf7Bqp7qbd8Jrg45EW5ntYw/ttlJ7s47u9aT0QvyVr/qUs7HW1hEHaWfRz+yVnbdhbgT2rClrhvSidsXH4AT3FNkhizOKXVxIC5k8T5ucXlNY6mFbXICcTd3wokKoajuRyLOf/s7hG+ew0SkCJbGhf3mBTpTlRJOWSr6tiOfY9ES/rh8LX5RA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ffC5V7xl; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::c31; helo=mail-oo1-xc31.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ffC5V7xl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c31; helo=mail-oo1-xc31.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzgpC1NNpz2xb3
	for <openbmc@lists.ozlabs.org>; Thu,  5 Sep 2024 10:53:22 +1000 (AEST)
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-5dfaff47600so152144eaf.0
        for <openbmc@lists.ozlabs.org>; Wed, 04 Sep 2024 17:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725497599; x=1726102399; darn=lists.ozlabs.org;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EBe0DwYPEL6JD2PmT9xEI0qtoSdhSUsmuvZEe7oddXY=;
        b=ffC5V7xlkT27UNe8EWYCbCLBydyzlqZXCJpNQ5z9rkffx28G0HK0KuwmrSFW2pMRgj
         XMmdzLdN/wwlbEce8BdxMS5elkvCW9L4m1NICT2evH6aoJUG88c8AQ5hWoyY3FtxpLKw
         /eBDUIp1oDfOc8KBf9larwLLa8jkQZo3vate6BDjSMXXWFK1naSmp+YHsMMP2P9YOVDP
         9FhCCIrq3/eAXxyir3viLHXEMT2XBHRgOjzLdEZVzUwarvC+7L5ur/to4HzK+HG+TKRd
         V+Ixab1ahN5nYu4E3/o6/VWCt/NOalbbG5pMDoz9m2g4seyA47oub01Ldn6Rc+4AZltx
         2DTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725497599; x=1726102399;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EBe0DwYPEL6JD2PmT9xEI0qtoSdhSUsmuvZEe7oddXY=;
        b=ciNh+lg21g5SH5tYiOnfEmMLmMh1VTgUgWrWHVOkyIkxEOYP0DgLqXy3a34/ubvaav
         rl2HrfZEWZrU+kl04U/VUQwXhGAIz3QgFhTu1OjmlADPcxqoArHbPH0t5r9JTg/G8cmq
         q6c6zbEZyVmk8roDYf4X/9Pg1Q19T2mfqgzQM9/0OXOR7aXONoJL7eIYrMz6F9NzYF0r
         Mosx11hjficUD+xAOZjAaTVVyv91Amwhns89MDpGO5IpE/5XX2yOExfM0cYelCirPQbC
         5yIKEhXwInGTpNUtlVGPU8j57key/GpDe7MbsGqepTvdp1g1dGZoH6LG/IqY/A1Q/KqN
         Mtbw==
X-Forwarded-Encrypted: i=1; AJvYcCVLvK4X1rHOiBPdV7h0FYR+JpgVdSYx1C/G+uxaaZ3JRoiPyVf9Tcx77MSEUIyW1OkoSWaZz1ob@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyqOmToWdnlxLjRFyd6+fVr8QPF4McIpzOxKmILdJUpWXuuTHfE
	wUawDZfUlfYWZoQgvMi63vRrbq3SIRCr8E9PBsnGwhB9hiMRMlzfyhDrhw==
X-Google-Smtp-Source: AGHT+IGmCn3bY4ts+P8JTwA/rsJAKU0Nsxr8VrlNLwvy5bFogE3DR+W58nWx8DTSPsxmKR+DDH5iUg==
X-Received: by 2002:a05:6820:1689:b0:5dc:99d3:d3bc with SMTP id 006d021491bc7-5e18eb63ee5mr1646040eaf.3.1725497599374;
        Wed, 04 Sep 2024 17:53:19 -0700 (PDT)
Received: from ?IPV6:2605:a601:aa57:7500:2ed2:f96c:ff7d:4041? ([2605:a601:aa57:7500:2ed2:f96c:ff7d:4041])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5dfa047b04bsm2596252eaf.5.2024.09.04.17.53.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 17:53:18 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------oz63ozVDlVuXIy3oh6lHnZdG"
Message-ID: <813dc3c0-dbac-44e8-b35d-f79bc6f9f335@gmail.com>
Date: Wed, 4 Sep 2024 19:53:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Wiwynn's CCLA Schedule A update 2024-08-29
To: Delphine Chiu/WYHQ/Wiwynn <DELPHINE_CHIU@wiwynn.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <SEYPR04MB7040A1467FC670199909ED8CFA952@SEYPR04MB7040.apcprd04.prod.outlook.com>
Content-Language: en-US
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <SEYPR04MB7040A1467FC670199909ED8CFA952@SEYPR04MB7040.apcprd04.prod.outlook.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------oz63ozVDlVuXIy3oh6lHnZdG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/28/2024 12:50 PM, Delphine Chiu/WYHQ/Wiwynn wrote:
>
> Hi,
>
> Please find the attached file for updated Schedule A of CCLA from Wiwynn.
>
Thanks for keeping it updated. I've uploaded it to the google drive.

Andrew

> Thank you,
>
> Delphine
>
> WIWYNN PROPRIETARY
> This email (and any attachments) contains proprietary or confidential 
> information and is for the sole use of its intended recipient. Any 
> unauthorized review, use, copying or distribution of this email or the 
> content of this email is strictly prohibited. If you are not the 
> intended recipient, please notify the sender and delete this email 
> immediately. 
--------------oz63ozVDlVuXIy3oh6lHnZdG
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
    <div class="moz-cite-prefix">On 8/28/2024 12:50 PM, Delphine
      Chiu/WYHQ/Wiwynn wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:SEYPR04MB7040A1467FC670199909ED8CFA952@SEYPR04MB7040.apcprd04.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="Generator"
        content="Microsoft Word 15 (filtered medium)">
      <style>@font-face
	{font-family:\65B0\7D30\660E\9AD4;
	panose-1:2 2 5 0 0 0 0 0 0 0;}@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}@font-face
	{font-family:Aptos;}@font-face
	{font-family:"\@\65B0\7D30\660E\9AD4";
	panose-1:2 1 6 1 0 1 1 1 1 1;}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;}span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}.MsoChpDefault
	{mso-style-type:export-only;}div.WordSection1
	{page:WordSection1;}</style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal"><span
            style="font-family:&quot;Calibri&quot;,sans-serif"
            lang="EN-US">Hi,</span><span lang="EN-US"><o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Calibri&quot;,sans-serif"
            lang="EN-US"> </span><span lang="EN-US"><o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Calibri&quot;,sans-serif"
            lang="EN-US">Please find the attached file for updated
            Schedule A of CCLA from Wiwynn.</span></p>
      </div>
    </blockquote>
    <p>Thanks for keeping it updated. I've uploaded it to the google
      drive.</p>
    <p>Andrew<br>
    </p>
    <blockquote type="cite"
cite="mid:SEYPR04MB7040A1467FC670199909ED8CFA952@SEYPR04MB7040.apcprd04.prod.outlook.com">
      <div class="WordSection1">
        <p class="MsoNormal"><span lang="EN-US"><o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Calibri&quot;,sans-serif"
            lang="EN-US"> </span><span lang="EN-US"><o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Calibri&quot;,sans-serif"
            lang="EN-US">Thank you,</span><span lang="EN-US"><o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;Calibri&quot;,sans-serif"
            lang="EN-US">Delphine</span><span lang="EN-US"><o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US"><o:p> </o:p></span></p>
      </div>
      WIWYNN PROPRIETARY<br>
      This email (and any attachments) contains proprietary or
      confidential information and is for the sole use of its intended
      recipient. Any unauthorized review, use, copying or distribution
      of this email or the content of this email is strictly prohibited.
      If you are not the intended recipient, please notify the sender
      and delete this email immediately.
    </blockquote>
  </body>
</html>

--------------oz63ozVDlVuXIy3oh6lHnZdG--
