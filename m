Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 165C71B172A
	for <lists+openbmc@lfdr.de>; Mon, 20 Apr 2020 22:32:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495dfm2hV6zDqXX
	for <lists+openbmc@lfdr.de>; Tue, 21 Apr 2020 06:32:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2a;
 helo=mail-qv1-xf2a.google.com; envelope-from=bjwyman@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=YE7oq2Df; dkim-atps=neutral
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495dcf04QPzDqf4
 for <openbmc@lists.ozlabs.org>; Tue, 21 Apr 2020 06:30:41 +1000 (AEST)
Received: by mail-qv1-xf2a.google.com with SMTP id q2so2458250qvd.1
 for <openbmc@lists.ozlabs.org>; Mon, 20 Apr 2020 13:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=lwkced5nQY56gcHd/piif/8XSaNr7k3E3EsMsDr1bTo=;
 b=YE7oq2DfwQYtt3oItjR5SWPYQEglsjbwwdmJkxGIMtAsZHTOmSC3ebsm3FeBIir6/T
 yu+StKU+HASnhUZD5/rhEhsLnRm2tScfYFdwtCZoXDiTcIRn/D0i22uHiBrWcfac8X1a
 3tpmc8bySAVk8D0bCKF4pkvkRXT9rkRmfcfnA4d4BugRGoTTIhCk+SydMhqMi3+uwA40
 gujzE8n58IBsomlyZsu5qE9MpFHZBDP5PR255k2wCUChSBHiSbe30YdvE8YtqyYCwP+I
 zRd4h2mbtKOjddpo1jv2SXI7UvnJkH5xeMtYifCtQZwdJxSDnJ1Hs1kBS7R0jefJIhIr
 tDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=lwkced5nQY56gcHd/piif/8XSaNr7k3E3EsMsDr1bTo=;
 b=uW8Isv6GmRX5ml6imrVdV4m2zHz7PYrvYijkQyWPVfw0tMhCwXZAH7LGE+UbJrZS6a
 XK3v+HHwHEvgfB7vNvl1x8xFnoFE0HnyDg6hPFpvNVRCnm3H7+yIfP/68geRp70hNd2L
 PEwDB2p2IOmHiARmjdL5GtizvQBtuv167kBYMxxgJQNcNCaIp0hd5QDI7m3N08j/NZV3
 nlJSvn6neltP34smoMe1lZlqFTU0NZhgS8a7UshH6FVL9hTdd7Ee7iK4KprCFJe+Y+LL
 O/yxtUhzRrBH3xnbAujbMBTgF4K7/wE0hiSe7piCp1FuBalHe2eN1OrOeFz8HG91i+BN
 ykyQ==
X-Gm-Message-State: AGi0PuZ4RdTcKDxATg2QSsUg55lOOTlUTDBZ0yeWD7U9YXk6Zp2EzUEt
 xc1CRO8M8nAN/2EiLB+3MunHVkk4
X-Google-Smtp-Source: APiQypIWz2CEz5SbnydkqRGt8UdZmUmySN/I7NAmB77DOBhtX+Cb7mcGy159owdeqHQoATp7+St8Aw==
X-Received: by 2002:ad4:4812:: with SMTP id g18mr17568847qvy.120.1587414636533; 
 Mon, 20 Apr 2020 13:30:36 -0700 (PDT)
Received: from [192.168.1.110] (96-42-251-64.dhcp.roch.mn.charter.com.
 [96.42.251.64])
 by smtp.gmail.com with ESMTPSA id c27sm300554qte.49.2020.04.20.13.30.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2020 13:30:35 -0700 (PDT)
Subject: Re: PSU (PMBus) fault monitoring / logging
To: openbmc@lists.ozlabs.org
References: <337b91ad1ac2401a982113f025564da7@SCL-EXCHMB-13.phoenix.com>
 <EF8FF2A3-2EA7-42F5-A568-9AE3389CDE2B@fb.com>
 <a02ac6a947854897a3b5069d9e7da7df@SCL-EXCHMB-13.phoenix.com>
From: Brandon Wyman <bjwyman@gmail.com>
Message-ID: <e03a6da6-3e3f-c037-9c28-7f50b5af2d38@gmail.com>
Date: Mon, 20 Apr 2020 15:30:35 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <a02ac6a947854897a3b5069d9e7da7df@SCL-EXCHMB-13.phoenix.com>
Content-Type: multipart/alternative;
 boundary="------------FD9B706D6F381516400F5469"
Content-Language: en-US
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
Cc: Patrick_Voelker@phoenix.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------FD9B706D6F381516400F5469
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

The IBM systems use an ibm-cffps device driver:

https://github.com/openbmc/linux/blob/dev-5.4/drivers/hwmon/pmbus/ibm-cffps.c

There are some other power supply PMBus hwmon drivers, check the parent 
directory.

There were some other non-standard or MFR SPECIFIC items that were 
needed/desired, so those ended up being put in a /sys/kernel/debug tree.

This device driver was introduced for the Witherspoon system, and has 
had some updates since then.

The repository for looking at the STATUS_WORD and other PMBus 
commands/registers was called witherspoon-pfault-analysis, renamed to 
phosphor-power. I am not certain how that relates to the psusensor daemon.

https://github.com/openbmc/witherspoon-pfault-analysis

https://github.ibm.com/openbmc/phosphor-power

https://github.com/openbmc/dbus-sensors/tree/master/src

The hwmon specific information that Witherspoon used for telemetry data 
was updated via the phosphor-hwmon application:

https://github.com/openbmc/phosphor-hwmon

https://github.com/openbmc/openbmc/tree/master/meta-ibm/meta-witherspoon/recipes-phosphor/sensors/phosphor-hwmon/witherspoon/obmc/hwmon/ahb/apb/bus%401e78a000/i2c-bus%40100

https://github.com/openbmc/openbmc/tree/master/meta-inspur/meta-fp5280g2/recipes-phosphor/sensors/phosphor-hwmon/obmc/hwmon/ahb/apb/bus%401e78a000/i2c-bus%40400

On 2020-04-17 18:29, Patrick Voelker wrote:
>
> Thanks Vijay, that was really helpful.
>
> I’m specifically looking for how the PMBus STATUS_WORD and 
> sub-registers are monitored and represented in OpenBMC but it’s not 
> jumping out at me.
>
> *From:*Vijay Khemka [mailto:vijaykhemka@fb.com]
> *Sent:* Friday, April 17, 2020 11:07 AM
> *To:* Patrick Voelker; openbmc@lists.ozlabs.org
> *Subject:* Re: PSU (PMBus) fault monitoring / logging
>
> There are psusensor daemon who monitors these PSU sensors.
>
> *From: *openbmc <openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org> 
> on behalf of Patrick Voelker <Patrick_Voelker@phoenix.com>
> *Date: *Thursday, April 16, 2020 at 7:40 PM
> *To: *"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
> *Subject: *PSU (PMBus) fault monitoring / logging
>
> Is there a module that instantiates sensors for PSU PMBus based faults 
> after the entity-manager probes the busses and finds the PSUs by FRU
>
> I'm looking for the method by which the faults are monitored and 
> logged.  I see that there’s kernel hwmon support for PMBus but I’m 
> trying to understand how IPMI sensors and logging tie in.
>

--------------FD9B706D6F381516400F5469
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>The IBM systems use an ibm-cffps device driver:</p>
    <p><a class="moz-txt-link-freetext" href="https://github.com/openbmc/linux/blob/dev-5.4/drivers/hwmon/pmbus/ibm-cffps.c">https://github.com/openbmc/linux/blob/dev-5.4/drivers/hwmon/pmbus/ibm-cffps.c</a></p>
    <p>There are some other power supply PMBus hwmon drivers, check the
      parent directory.</p>
    <p>There were some other non-standard or MFR SPECIFIC items that
      were needed/desired, so those ended up being put in a
      /sys/kernel/debug tree.</p>
    <p>This device driver was introduced for the Witherspoon system, and
      has had some updates since then.</p>
    <p>The repository for looking at the STATUS_WORD and other PMBus
      commands/registers was called witherspoon-pfault-analysis, renamed
      to phosphor-power. I am not certain how that relates to the
      psusensor daemon.</p>
    <p><a class="moz-txt-link-freetext" href="https://github.com/openbmc/witherspoon-pfault-analysis">https://github.com/openbmc/witherspoon-pfault-analysis</a></p>
    <p><a class="moz-txt-link-freetext" href="https://github.ibm.com/openbmc/phosphor-power">https://github.ibm.com/openbmc/phosphor-power</a></p>
    <p><a class="moz-txt-link-freetext" href="https://github.com/openbmc/dbus-sensors/tree/master/src">https://github.com/openbmc/dbus-sensors/tree/master/src</a></p>
    <p>The hwmon specific information that Witherspoon used for
      telemetry data was updated via the phosphor-hwmon application:</p>
    <p><a class="moz-txt-link-freetext" href="https://github.com/openbmc/phosphor-hwmon">https://github.com/openbmc/phosphor-hwmon</a></p>
    <p><a class="moz-txt-link-freetext" href="https://github.com/openbmc/openbmc/tree/master/meta-ibm/meta-witherspoon/recipes-phosphor/sensors/phosphor-hwmon/witherspoon/obmc/hwmon/ahb/apb/bus%401e78a000/i2c-bus%40100">https://github.com/openbmc/openbmc/tree/master/meta-ibm/meta-witherspoon/recipes-phosphor/sensors/phosphor-hwmon/witherspoon/obmc/hwmon/ahb/apb/bus%401e78a000/i2c-bus%40100</a></p>
    <p><a class="moz-txt-link-freetext" href="https://github.com/openbmc/openbmc/tree/master/meta-inspur/meta-fp5280g2/recipes-phosphor/sensors/phosphor-hwmon/obmc/hwmon/ahb/apb/bus%401e78a000/i2c-bus%40400">https://github.com/openbmc/openbmc/tree/master/meta-inspur/meta-fp5280g2/recipes-phosphor/sensors/phosphor-hwmon/obmc/hwmon/ahb/apb/bus%401e78a000/i2c-bus%40400</a><br>
    </p>
    <div class="moz-cite-prefix">On 2020-04-17 18:29, Patrick Voelker
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:a02ac6a947854897a3b5069d9e7da7df@SCL-EXCHMB-13.phoenix.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="Generator" content="Microsoft Word 14 (filtered
        medium)">
      <style><!--
/* Font Definitions */
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:"\@PMingLiU";
	panose-1:2 2 5 0 0 0 0 0 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal"><span style="color:#1F497D">Thanks Vijay,
            that was really helpful.<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#1F497D"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="color:#1F497D">I’m
            specifically looking for how the PMBus STATUS_WORD and
            sub-registers are monitored and represented in OpenBMC but
            it’s not jumping out at me.<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#1F497D"><o:p> </o:p></span></p>
        <p class="MsoNormal"><a name="_MailEndCompose"
            moz-do-not-send="true"><span style="color:#1F497D"><o:p> </o:p></span></a></p>
        <div style="border:none;border-left:solid blue 1.5pt;padding:0in
          0in 0in 4.0pt">
          <div>
            <div style="border:none;border-top:solid #B5C4DF
              1.0pt;padding:3.0pt 0in 0in 0in">
              <p class="MsoNormal"><b><span
style="font-size:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span
style="font-size:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;">
                  Vijay Khemka [<a class="moz-txt-link-freetext" href="mailto:vijaykhemka@fb.com">mailto:vijaykhemka@fb.com</a>]
                  <br>
                  <b>Sent:</b> Friday, April 17, 2020 11:07 AM<br>
                  <b>To:</b> Patrick Voelker; <a class="moz-txt-link-abbreviated" href="mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br>
                  <b>Subject:</b> Re: PSU (PMBus) fault monitoring /
                  logging<o:p></o:p></span></p>
            </div>
          </div>
          <p class="MsoNormal"><o:p> </o:p></p>
          <p class="MsoNormal">There are psusensor daemon who monitors
            these PSU sensors.<o:p></o:p></p>
          <p class="MsoNormal"><o:p> </o:p></p>
          <div style="border:none;border-top:solid #B5C4DF
            1.0pt;padding:3.0pt 0in 0in 0in">
            <p class="MsoNormal"><b><span
                  style="font-size:12.0pt;color:black">From: </span></b><span
                style="font-size:12.0pt;color:black">openbmc
                <a class="moz-txt-link-rfc2396E" href="mailto:openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org">&lt;openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org&gt;</a>
                on behalf of Patrick Voelker
                <a class="moz-txt-link-rfc2396E" href="mailto:Patrick_Voelker@phoenix.com">&lt;Patrick_Voelker@phoenix.com&gt;</a><br>
                <b>Date: </b>Thursday, April 16, 2020 at 7:40 PM<br>
                <b>To: </b><a class="moz-txt-link-rfc2396E" href="mailto:openbmc@lists.ozlabs.org">"openbmc@lists.ozlabs.org"</a>
                <a class="moz-txt-link-rfc2396E" href="mailto:openbmc@lists.ozlabs.org">&lt;openbmc@lists.ozlabs.org&gt;</a><br>
                <b>Subject: </b>PSU (PMBus) fault monitoring / logging<o:p></o:p></span></p>
          </div>
          <div>
            <p class="MsoNormal"><o:p> </o:p></p>
          </div>
          <p class="MsoNormal">Is there a module that instantiates
            sensors for PSU PMBus based faults after the entity-manager
            probes the busses and finds the PSUs by FRU<o:p></o:p></p>
          <p class="MsoNormal"> <o:p></o:p></p>
          <p class="MsoNormal">I'm looking for the method by which the
            faults are monitored and logged.  I see that there’s kernel
            hwmon support for PMBus but I’m trying to understand how
            IPMI sensors and logging tie in.<o:p></o:p></p>
          <p class="MsoNormal"> <o:p></o:p></p>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------FD9B706D6F381516400F5469--
