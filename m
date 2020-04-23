Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C4D1B641E
	for <lists+openbmc@lfdr.de>; Thu, 23 Apr 2020 21:01:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497RVn4vS5zDr4M
	for <lists+openbmc@lfdr.de>; Fri, 24 Apr 2020 05:01:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82c;
 helo=mail-qt1-x82c.google.com; envelope-from=bjwyman@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Ay0zaxJ4; dkim-atps=neutral
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497RSP6bQbzDr4L
 for <openbmc@lists.ozlabs.org>; Fri, 24 Apr 2020 04:59:49 +1000 (AEST)
Received: by mail-qt1-x82c.google.com with SMTP id s30so5826760qth.2
 for <openbmc@lists.ozlabs.org>; Thu, 23 Apr 2020 11:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language;
 bh=DYynOZXqA74vwquhVIO/cj72myFYhwTbNtgjEEouSyA=;
 b=Ay0zaxJ4aOye96Sn2XlqkKAex7pqtoxX3ThTld99QO6FVlYkjYgXs3P4jdVPojF2fC
 NWYR2b6TxpvyrZN5zbyEEMFKRfSuOqPzuS/TswRjb96p3sAo3gSXWMstQSkedCcKbm5f
 YgroDUcWhXTrfOmPCyq7pIYV8XlSPLp7ojpywLpr8E0vXtuRjUxDNWVtwIRhkRhzwBTG
 5pVZd7PUlqkS9pirOowChQ8i6xCeZ6eqnjFDK4ljPCaqeiN+JM+QHlje/DhjVB10mhgR
 wF4Prq0iCreM+0Bi2MFvnVBR+OcaLn33Ub6lS1xY0EdfINnlg80UcKUF8hhpLMmYyo0i
 rwzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=DYynOZXqA74vwquhVIO/cj72myFYhwTbNtgjEEouSyA=;
 b=Gu4UILAJlbSFxyge6vgY0iuVPlMXvoCAYoqHvyOGs8tSuffaI7fjldHhLxbEPxJJY7
 gDXiW/tAh0hwKcrHhDI1TCtuaTE/LeU5rXZ7ptlS7QBb0qaLiFEjaVQ0ft8Ne1tfZJAh
 ACJBzKsRQWl+/zrcIdLIyzrQQlaGnYEgqtgtAeTg+Xc31iAYq9jX9kTRVIw8w9wnYEdg
 DmU+WlvPqkeaf6AFgPhbzUcJUNGi2utB0pYMWHAVWqSYeNZUYe1sHXHX80uqXotIcUwF
 dnhpXQBD9tzFddVMWizwelz6UUHeFUaa3Vx9NuG6sqMK6Z6Ha+RgfVLb9QnohB76LgdN
 RutQ==
X-Gm-Message-State: AGi0PuYB6ZqBIs9rokhSIvsTAfoZlgosqqkR7KJjXcaUI/pGeC2dFsDC
 Ez3z2lSHuobidaQvgQemYBaGM795
X-Google-Smtp-Source: APiQypJNBCVHPqh/uPPfU3qEdsFZWoKTAj+yfpl0zA3EbSowiL8GpjTKXPthw0Rj0w7ndl98Mz18Qg==
X-Received: by 2002:ac8:6f6c:: with SMTP id u12mr5475038qtv.103.1587668385253; 
 Thu, 23 Apr 2020 11:59:45 -0700 (PDT)
Received: from [192.168.1.110] (096-042-251-064.res.spectrum.com.
 [96.42.251.64])
 by smtp.gmail.com with ESMTPSA id 134sm2100807qki.16.2020.04.23.11.59.44
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Apr 2020 11:59:44 -0700 (PDT)
Subject: Re: about obmc-chassis-poweroff@0.target and obmc-host-start@0.target
To: openbmc@lists.ozlabs.org
References: <HK2PR04MB3826B62C70CC3C90D4F8E452FED30@HK2PR04MB3826.apcprd04.prod.outlook.com>
From: Brandon Wyman <bjwyman@gmail.com>
Message-ID: <f4d0755f-4eda-34cb-fb86-1ba2c36c1858@gmail.com>
Date: Thu, 23 Apr 2020 13:59:44 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <HK2PR04MB3826B62C70CC3C90D4F8E452FED30@HK2PR04MB3826.apcprd04.prod.outlook.com>
Content-Type: multipart/alternative;
 boundary="------------2C11846F924619E82A763E38"
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------2C11846F924619E82A763E38
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Does this help understand it better?


https://github.com/openbmc/docs/blob/master/architecture/openbmc-systemd.md


On 2020-04-23 09:47, zhouyuanqing8@outlook.com wrote:
> Hi，
>
>        About "obmc-chassis-poweroff@0.target" and 
> "obmc-host-start@0.target" how these two targets are called, please 
> help to answer, thank you.
>       I use the systemctl list-dependencies command and I can’t see 
> who is calling them.
>
> Thanks
> harley
>

--------------2C11846F924619E82A763E38
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Does this help understand it better?</p>
    <p><br>
    </p>
    <p><a class="moz-txt-link-freetext" href="https://github.com/openbmc/docs/blob/master/architecture/openbmc-systemd.md">https://github.com/openbmc/docs/blob/master/architecture/openbmc-systemd.md</a></p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-04-23 09:47,
      <a class="moz-txt-link-abbreviated" href="mailto:zhouyuanqing8@outlook.com">zhouyuanqing8@outlook.com</a> wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:HK2PR04MB3826B62C70CC3C90D4F8E452FED30@HK2PR04MB3826.apcprd04.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <style type="text/css" style="display:none;"> P {margin-top:0;margin-bottom:0;} </style>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        Hi， </div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
               About <a class="moz-txt-link-rfc2396E" href="mailto:obmc-chassis-poweroff@0.target">"obmc-chassis-poweroff@0.target"</a> and
        <a class="moz-txt-link-rfc2396E" href="mailto:obmc-host-start@0.target">"obmc-host-start@0.target"</a> how these two targets are called,
        please help to answer, thank you.</div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
              I use the systemctl list-dependencies command and I can’t
        see who is calling them.</div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        Thanks</div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        harley</div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
    </blockquote>
  </body>
</html>

--------------2C11846F924619E82A763E38--
