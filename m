Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2187292DB3A
	for <lists+openbmc@lfdr.de>; Wed, 10 Jul 2024 23:48:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LP+dCMZi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WKBLG5tb6z3fqk
	for <lists+openbmc@lfdr.de>; Thu, 11 Jul 2024 07:48:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LP+dCMZi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WKBKk0cZMz3cWG
	for <openbmc@lists.ozlabs.org>; Thu, 11 Jul 2024 07:47:36 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-70b3c0a00f2so215540b3a.3
        for <openbmc@lists.ozlabs.org>; Wed, 10 Jul 2024 14:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720648054; x=1721252854; darn=lists.ozlabs.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jpq8EI781p7O//2Ey7x1HrZ5IuK3PuBFg2OcBJVdORg=;
        b=LP+dCMZi29idaNlmLTHUNMOUqz+wTvINp5kxgAcP/ohsUis5TO6o93DOWYCy+13Fy8
         yy8be5ZXF28eCGx8DAu2qYoq3JFuY1/21rYyvdRLIZmsuXbpMuG/pTYPK9PLM1y9XMEq
         usgpNtFxNojURAqlGEYtPDY46JCL+hYCpA7P4tfHugQntIss874wMU/KXN1zHTWg8Keb
         qWZhoTpazlHTewz+g0YLsi61dxBiszamUvE48oN2eoRuOc5giAADhmZ9mDJ7B0q6tHtn
         iEb+hiIufUP5to/wSQOfF05KdWxhjtB1xHiDSAA7nqV/6MwEVQK2Rj/6fXI8L8oR1xiJ
         wqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720648054; x=1721252854;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Jpq8EI781p7O//2Ey7x1HrZ5IuK3PuBFg2OcBJVdORg=;
        b=mbBOevhPQGNt19T7L3ZwExrBk9CiagP5brpiJlGot25BUoqcwHiE31/PhGhj602y4Q
         KAjGTtaGvA0pIJIoqFZTAJcoWjmrqxMg/MSd7glf04194JcrFo0EZnGQoDhehK31j/k5
         IN/jXBJQk06e907Abxox8f0C8OkghRzdbuRRIJ3pPJrsQCd4N4gWRItWQyZAnHhCCRVr
         Af3r1RfK+gu1XTMIWilMK5JmbGcaczpmy7vPfuIpN3FwG7AdaeLi/1iGXPLUWew5nn3U
         xYpHAOfPJgTaarbKctWmkqA7c6T2yTqTqak785QSDCtNQs2p1CRgUtKZMDrs8DQVqUEa
         OYqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsnhzMYLHgYbwPv9p3YfRuTDL4tOVeMrNC+d5D83yq4uhRC3E8oyBf6yIg1ObQ+feuqHj6SmcqTQC2WBZrTkLNBKNt03i9FUI=
X-Gm-Message-State: AOJu0YxEHvjDhCGQe5taMveCik02oHSzY6Yxq2VSrBhE8PshfgwzO8HC
	iWvK48AOF6C09ZZn26R+s7TX8SxFvHH2mRPpATW7f4gcD0xDY2CoaXP5XHURr70=
X-Google-Smtp-Source: AGHT+IGjuhoUXCYxWxwJ3jqDMc72J3jV0q1LWpX9OkFuZnYzlhbl8iaV6w8Y2u0cajbfjNKfZvuh9w==
X-Received: by 2002:a05:6a20:1592:b0:1c2:8d33:af69 with SMTP id adf61e73a8af0-1c2983ba4damr8439398637.41.1720648053386;
        Wed, 10 Jul 2024 14:47:33 -0700 (PDT)
Received: from [192.168.1.160] ([179.8.73.75])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b43967415sm4282077b3a.110.2024.07.10.14.47.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jul 2024 14:47:33 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------0LWg4AtWIWZrNvDuMdinUaI5"
Message-ID: <80dbdcd1-9694-433e-8775-bde6fd1aea4d@gmail.com>
Date: Wed, 10 Jul 2024 17:47:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: FW: OpenBMC Dell CLA update 2024-07-02
To: "Brown, Michael E" <Michael.E.Brown@dell.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <DS7PR19MB5904D43702FFB9EDBF9CEEE0D0DC2@DS7PR19MB5904.namprd19.prod.outlook.com>
 <DS7PR19MB5904BDC524288E70D45252ECD0DD2@DS7PR19MB5904.namprd19.prod.outlook.com>
Content-Language: en-US
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <DS7PR19MB5904BDC524288E70D45252ECD0DD2@DS7PR19MB5904.namprd19.prod.outlook.com>
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
Cc: "Pennell, Josh" <Josh.Pennell@dell.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------0LWg4AtWIWZrNvDuMdinUaI5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/3/2024 3:00 PM, Brown, Michael E wrote:

> Andrew,
>
> I see on the openbmc mailing list that you updated the corp CLA for 
> Wiwynn yesterday. I sent a Dell Schedule A update a little bit later 
> yesterday. Would you be able to update the Dell schedule A for us?
>
Updated it up at 
https://drive.google.com/drive/folders/1XIglQGetP9NSVXz2H9_J1PEXmb08gEix

>
> Also, is it possible to get permissions to update our own schedule A 
> developer lists?
>
Sure, if you have a gmail account I can give you write permission to the 
folder.
>
> --
>
> Michael
>
>
> Internal Use - Confidential
>
> *From:* Brown, Michael E
> *Sent:* Tuesday, July 2, 2024 3:48 PM
> *To:* openbmc@lists.ozlabs.org; Brad Bishop <bradleyb@fuzziesquirrel.com>
> *Cc:* Pennell, Josh <Josh_Pennell@Dell.com>
> *Subject:* OpenBMC Dell CLA update 2024-07-02
>
> Attached is a PDF for CLA updates for Dell.
>
> The original CLA was signed by my VP and me and didn’t include a 
> developer list at that time. This update adds our initial list of CLA 
> Managers and developers who will be submitting code.
>
> The additions in this file are:
>
> Michael Brown Michael_E_Brown@Dell.com – CLA Manager
>
> Alladi, Anoop Anoop_Kumar_Alladi@Dell.com;
> Arrington, Brian Brian_Arrington@Dell.com;
> Gilly, Kris Kris_Gilly@Dell.com;
> Maeder, Heidi Heidi_Maeder@Dell.com;
> Pennell, Josh Josh_Pennell@Dell.com  - CLA Manager
> Rasheed, Farah Farah.Rasheed1@dell.com;
> Totakura, Nagendra Varma Nagendra_Varma_Totak@Dell.com;
> Vadlamani, Mahesh Mahesh.Vadlamani@Dell.com
>
> Michael Brown
>
> Distinguished Engineer
>
--------------0LWg4AtWIWZrNvDuMdinUaI5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>On 7/3/2024 3:00 PM, Brown, Michael E wrote:</p>
    <blockquote type="cite"
cite="mid:DS7PR19MB5904BDC524288E70D45252ECD0DD2@DS7PR19MB5904.namprd19.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="Generator"
        content="Microsoft Word 15 (filtered medium)">
      <style>@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}span.ui-provider
	{mso-style-name:ui-provider;}span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
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
        <p class="MsoNormal">Andrew,<o:p></o:p></p>
        <p class="MsoNormal">I see on the openbmc mailing list that you
          updated the corp CLA for Wiwynn yesterday. I sent a Dell
          Schedule A update a little bit later yesterday. Would you be
          able to update the Dell schedule A for us?<br>
        </p>
      </div>
    </blockquote>
    <p>Updated it up at
      <a class="moz-txt-link-freetext" href="https://drive.google.com/drive/folders/1XIglQGetP9NSVXz2H9_J1PEXmb08gEix">https://drive.google.com/drive/folders/1XIglQGetP9NSVXz2H9_J1PEXmb08gEix</a><br>
    </p>
    <blockquote type="cite"
cite="mid:DS7PR19MB5904BDC524288E70D45252ECD0DD2@DS7PR19MB5904.namprd19.prod.outlook.com">
      <div class="WordSection1">
        <p class="MsoNormal">
          <br>
          Also, is it possible to get permissions to update our own
          schedule A developer lists?</p>
      </div>
    </blockquote>
    Sure, if you have a gmail account I can give you write permission to
    the folder.<br>
    <blockquote type="cite"
cite="mid:DS7PR19MB5904BDC524288E70D45252ECD0DD2@DS7PR19MB5904.namprd19.prod.outlook.com">
      <div class="WordSection1">
        <p class="MsoNormal"><o:p></o:p></p>
        <p class="MsoNormal">--<o:p></o:p></p>
        <p class="MsoNormal">Michael<o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <div><br>
          <p
style="font-family:Calibri;font-size:7pt;color:#737373;margin:5pt;font-style:normal;font-weight:normal;text-decoration:none;"
            align="Left">
            Internal Use - Confidential<br>
          </p>
          <div
style="border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in 0in 0in">
            <p class="MsoNormal"><b>From:</b> Brown, Michael E <br>
              <b>Sent:</b> Tuesday, July 2, 2024 3:48 PM<br>
              <b>To:</b> <a class="moz-txt-link-abbreviated" href="mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a>; Brad Bishop
              <a class="moz-txt-link-rfc2396E" href="mailto:bradleyb@fuzziesquirrel.com">&lt;bradleyb@fuzziesquirrel.com&gt;</a><br>
              <b>Cc:</b> Pennell, Josh <a class="moz-txt-link-rfc2396E" href="mailto:Josh_Pennell@Dell.com">&lt;Josh_Pennell@Dell.com&gt;</a><br>
              <b>Subject:</b> OpenBMC Dell CLA update 2024-07-02<o:p></o:p></p>
          </div>
        </div>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">Attached is a PDF for CLA updates for Dell.<o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">The original CLA was signed by my VP and me
          and didn’t include a developer list at that time. This update
          adds our initial list of CLA Managers and developers who will
          be submitting code.<o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">The additions in this file are:<br>
          <br>
          Michael Brown <a href="mailto:Michael_E_Brown@Dell.com"
            moz-do-not-send="true" class="moz-txt-link-freetext">Michael_E_Brown@Dell.com</a>
          – CLA Manager<o:p></o:p></p>
        <p class="MsoNormal"><span class="ui-provider">Alladi, Anoop <a
              href="mailto:Anoop_Kumar_Alladi@Dell.com" target="_blank"
              title="mailto:anoop_kumar_alladi@dell.com"
              moz-do-not-send="true" class="moz-txt-link-freetext">
              Anoop_Kumar_Alladi@Dell.com</a>; </span><br>
          <span class="ui-provider">Arrington, Brian <a
              href="mailto:Brian_Arrington@Dell.com" target="_blank"
              title="mailto:brian_arrington@dell.com"
              moz-do-not-send="true" class="moz-txt-link-freetext">
              Brian_Arrington@Dell.com</a>; </span><br>
          <span class="ui-provider">Gilly, Kris <a
              href="mailto:Kris_Gilly@Dell.com" target="_blank"
              title="mailto:kris_gilly@dell.com" moz-do-not-send="true"
              class="moz-txt-link-freetext">
              Kris_Gilly@Dell.com</a>; </span><br>
          <span class="ui-provider">Maeder, Heidi <a
              href="mailto:Heidi_Maeder@Dell.com" target="_blank"
              title="mailto:heidi_maeder@dell.com"
              moz-do-not-send="true" class="moz-txt-link-freetext">
              Heidi_Maeder@Dell.com</a>; </span><br>
          <span class="ui-provider">Pennell, Josh <a
              href="mailto:Josh_Pennell@Dell.com" target="_blank"
              title="mailto:josh_pennell@dell.com"
              moz-do-not-send="true" class="moz-txt-link-freetext">
              Josh_Pennell@Dell.com</a>  - CLA Manager</span><br>
          <span class="ui-provider">Rasheed, Farah <a
              href="mailto:Farah.Rasheed1@dell.com" target="_blank"
              title="mailto:farah.rasheed1@dell.com"
              moz-do-not-send="true" class="moz-txt-link-freetext">
              Farah.Rasheed1@dell.com</a>; </span><br>
          <span class="ui-provider">Totakura, Nagendra Varma <a
              href="mailto:Nagendra_Varma_Totak@Dell.com"
              target="_blank"
              title="mailto:nagendra_varma_totak@dell.com"
              moz-do-not-send="true" class="moz-txt-link-freetext">
              Nagendra_Varma_Totak@Dell.com</a>; </span><br>
          <span class="ui-provider">Vadlamani, Mahesh <a
              href="mailto:Mahesh.Vadlamani@Dell.com" target="_blank"
              title="mailto:mahesh.vadlamani@dell.com"
              moz-do-not-send="true" class="moz-txt-link-freetext">
              Mahesh.Vadlamani@Dell.com</a></span><o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">Michael Brown<o:p></o:p></p>
        <p class="MsoNormal">Distinguished Engineer<o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
      </div>
    </blockquote>
  </body>
</html>

--------------0LWg4AtWIWZrNvDuMdinUaI5--
