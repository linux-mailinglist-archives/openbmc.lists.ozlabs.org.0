Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F20C291E737
	for <lists+openbmc@lfdr.de>; Mon,  1 Jul 2024 20:12:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Fguwd8zr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCYzM4rpqz3dRY
	for <lists+openbmc@lfdr.de>; Tue,  2 Jul 2024 04:12:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Fguwd8zr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22e; helo=mail-oi1-x22e.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCYyq5f3yz3c5q
	for <openbmc@lists.ozlabs.org>; Tue,  2 Jul 2024 04:11:46 +1000 (AEST)
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-3d55f198f1eso1691613b6e.0
        for <openbmc@lists.ozlabs.org>; Mon, 01 Jul 2024 11:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719857503; x=1720462303; darn=lists.ozlabs.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GaUYYkSuXHexRiyir+1BEeXE8STOEqF1S9Oq5okPME8=;
        b=Fguwd8zrWPgiE438F8AJDWywJMYBt8sj/Qk6yeOajRWF56ru11vZkVfMRK3J9PazGv
         lRvx9+rmf1z/qm4LpKxQinJup0HZcbZ46sEyPi5+4AQ5jY6u6cxPbTGi/+5pBuo4rHgn
         ctHd8djA4y2h/MQU0L41g2CYPyJOZ7POWWl0KobEC5wcaTb01kpcVBZKP/d49Zcb+EaR
         EXCP3Z0SkyqM5lVbMW50WWifLs9yUAcCECZ9AcdvalYPmloV+/+EtQmRCnnJd/yJ3zxA
         oOZIzutuZtjNz6lFORmmxUvs4GhBuJl2Btq2tajapXh6wNMTQYuWy07tOueopfvYqrmT
         Bakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719857503; x=1720462303;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GaUYYkSuXHexRiyir+1BEeXE8STOEqF1S9Oq5okPME8=;
        b=DDUs5VWe/R/Idz4aIcuFGkfxBtCV6rXvQfkRGrTqSKV6lZqULuwE2R+SR9FQgGv8Iq
         BfyajXcFf8kcgj1y9E4s7y5hYJtro8B+rkMLmGjcvPXfTkQ4lMtNNvEezcPN9kk00Ovq
         aqFMqviL69TYHQNK6VTpyya0suQ1kOmLmLklLwFnepOOnW/Sr3xomdobZRMhqj3tYW/j
         UgA/AMGyxUfrkwRbYUxm5gT3M4SfHo7HHXJ6hez+X7YxTe5mGbUn8yh7iE+l+MgAieJq
         lRMz9OZuOtiHVQddcEVytoAdhZCS9JpgGsTV1yb/KB96we2sXlATimRz2Yg2KeeT1bAe
         ypMA==
X-Forwarded-Encrypted: i=1; AJvYcCUYbE4/5W6T8oeGsaV2vYThF9hNOxSfml+m1/JkfbixjuO0JkbLGNDbG0Zh+LzpcI6zrt5DN9AcHE/aqrGcfjYzBO+MOLLu0zA=
X-Gm-Message-State: AOJu0YwIVy6F+hl1VLXUI7aPnPCwzH4ahCgZf/J9JOpmsLQP8y0nRuk6
	cvylVVe++wo2VvTAcNh77qIeedQt8IbvyOKcGDUgclDm0zPUyBW3
X-Google-Smtp-Source: AGHT+IGVIWWS+pvrByhKAjoFBPXuydrlk9BX7GcvgGUk33qP4qN1Ucy2X1i1Fs+N7cPEz+F2nNyUfw==
X-Received: by 2002:a05:6808:308f:b0:3d2:24d3:80f3 with SMTP id 5614622812f47-3d6b4de2410mr9074415b6e.43.1719857501901;
        Mon, 01 Jul 2024 11:11:41 -0700 (PDT)
Received: from [192.168.8.155] ([136.49.199.110])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d62fb41f77sm1450477b6e.51.2024.07.01.11.11.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 11:11:41 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------20WePqIAzVX4T820baD59TOy"
Message-ID: <70724047-1636-43fb-a9bc-b6ff33bf9c38@gmail.com>
Date: Mon, 1 Jul 2024 14:11:40 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Wiwynn's CCLA Schedule A update 2024-06-28
To: Delphine Chiu/WYHQ/Wiwynn <DELPHINE_CHIU@wiwynn.com>,
 "'openbmc@lists.ozlabs.org'" <openbmc@lists.ozlabs.org>
References: <SEYPR04MB7040DB409C982AC5EB4B2E95FAD02@SEYPR04MB7040.apcprd04.prod.outlook.com>
 <SEYPR04MB7040E7A8BA27EED2B853A18AFAD02@SEYPR04MB7040.apcprd04.prod.outlook.com>
Content-Language: en-US
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <SEYPR04MB7040E7A8BA27EED2B853A18AFAD02@SEYPR04MB7040.apcprd04.prod.outlook.com>
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
Cc: Chris Wang/WYHQ/Wiwynn <Chris_Wang@wiwynn.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------20WePqIAzVX4T820baD59TOy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

 > Please find the attached file for updated Schedule A of CCLA from Wiwynn.

Thanks for keeping it up to date. I've uploaded to the google drive.

Andrew

On 6/28/2024 7:40 AM, Delphine Chiu/WYHQ/Wiwynn wrote:
>
> Sorry, Revised to this attached one. Thanks.
>
> Delphine
>
> *From:*openbmc 
> <openbmc-bounces+delphine_chiu=wiwynn.com@lists.ozlabs.org> *On Behalf 
> Of *Delphine Chiu/WYHQ/Wiwynn
> *Sent:* Friday, June 28, 2024 7:34 PM
> *To:* 'openbmc@lists.ozlabs.org' openbmc@lists.ozlabs.org
> *Cc:* Chris Wang/WYHQ/Wiwynn Chris_Wang@wiwynn.com
> *Subject:* Wiwynn's CCLA Schedule A update 2024-06-28
>
> Hi,
>
> Please find the attached file for updated Schedule A of CCLA from Wiwynn.
>
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
>
> WIWYNN PROPRIETARY
> This email (and any attachments) contains proprietary or confidential 
> information and is for the sole use of its intended recipient. Any 
> unauthorized review, use, copying or distribution of this email or the 
> content of this email is strictly prohibited. If you are not the 
> intended recipient, please notify the sender and delete this email 
> immediately. 
--------------20WePqIAzVX4T820baD59TOy
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>&gt; <span
style="font-size:14.0pt;font-family:&quot;Calibri&quot;,sans-serif"
        lang="EN-US">Please find the attached file for updated Schedule
        A of CCLA from Wiwynn.</span></p>
    <p><span
style="font-size:14.0pt;font-family:&quot;Calibri&quot;,sans-serif"
        lang="EN-US">Thanks for keeping it up to date. I've uploaded to
        the google drive.</span></p>
    <p><span
style="font-size:14.0pt;font-family:&quot;Calibri&quot;,sans-serif"
        lang="EN-US">Andrew<br>
      </span></p>
    <div class="moz-cite-prefix">On 6/28/2024 7:40 AM, Delphine
      Chiu/WYHQ/Wiwynn wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:SEYPR04MB7040E7A8BA27EED2B853A18AFAD02@SEYPR04MB7040.apcprd04.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="Generator"
        content="Microsoft Word 15 (filtered medium)">
      <style>@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}@font-face
	{font-family:Aptos;}@font-face
	{font-family:PMingLiU;
	panose-1:2 1 6 1 0 1 1 1 1 1;}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;}a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#467886;
	text-decoration:underline;}span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Aptos",sans-serif;
	color:windowtext;}.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}div.WordSection1
	{page:WordSection1;}</style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal"><span lang="EN-US">Sorry, Revised to this
            attached one. Thanks.<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US">Delphine<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US"><o:p> </o:p></span></p>
        <div>
          <div
style="border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm 0cm 0cm">
            <p class="MsoNormal"><b><span
style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;mso-ligatures:none"
                  lang="EN-US">From:</span></b><span
style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;mso-ligatures:none"
                lang="EN-US"> openbmc
                <a class="moz-txt-link-rfc2396E" href="mailto:openbmc-bounces+delphine_chiu=wiwynn.com@lists.ozlabs.org">&lt;openbmc-bounces+delphine_chiu=wiwynn.com@lists.ozlabs.org&gt;</a>
                <b>On Behalf Of </b>Delphine Chiu/WYHQ/Wiwynn<br>
                <b>Sent:</b> Friday, June 28, 2024 7:34 PM<br>
                <b>To:</b> '<a class="moz-txt-link-abbreviated" href="mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a>' <a
                  href="mailto:openbmc@lists.ozlabs.org"
                  moz-do-not-send="true" class="moz-txt-link-freetext">openbmc@lists.ozlabs.org</a><br>
                <b>Cc:</b> Chris Wang/WYHQ/Wiwynn <a
                  href="mailto:Chris_Wang@wiwynn.com"
                  moz-do-not-send="true" class="moz-txt-link-freetext">Chris_Wang@wiwynn.com</a><br>
                <b>Subject:</b> Wiwynn's CCLA Schedule A update
                2024-06-28<o:p></o:p></span></p>
          </div>
        </div>
        <p class="MsoNormal"><span lang="EN-US"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span
style="font-size:14.0pt;font-family:&quot;Calibri&quot;,sans-serif"
            lang="EN-US">Hi,<o:p></o:p></span></p>
        <p class="MsoNormal"><span
style="font-size:14.0pt;font-family:&quot;Calibri&quot;,sans-serif"
            lang="EN-US"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span
style="font-size:14.0pt;font-family:&quot;Calibri&quot;,sans-serif"
            lang="EN-US">Please find the attached file for updated
            Schedule A of CCLA from Wiwynn.<o:p></o:p></span></p>
        <p class="MsoNormal"><span
style="font-size:14.0pt;font-family:&quot;Calibri&quot;,sans-serif"
            lang="EN-US"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span
style="font-size:14.0pt;font-family:&quot;Calibri&quot;,sans-serif"
            lang="EN-US">Thank you,<o:p></o:p></span></p>
        <p class="MsoNormal"><span
style="font-size:14.0pt;font-family:&quot;Calibri&quot;,sans-serif"
            lang="EN-US">Delphine<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="mso-ligatures:none"
            lang="EN-US">WIWYNN PROPRIETARY<br>
            This email (and any attachments) contains proprietary or
            confidential information and is for the sole use of its
            intended recipient. Any unauthorized review, use, copying or
            distribution of this email or the content of this email is
            strictly prohibited. If you are not the intended recipient,
            please notify the sender and delete this email immediately.
            <o:p></o:p></span></p>
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

--------------20WePqIAzVX4T820baD59TOy--
