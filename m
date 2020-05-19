Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E171DA108
	for <lists+openbmc@lfdr.de>; Tue, 19 May 2020 21:30:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49RQwH3rw1zDr6L
	for <lists+openbmc@lfdr.de>; Wed, 20 May 2020 05:30:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::736;
 helo=mail-qk1-x736.google.com; envelope-from=bjwyman@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NjrYdG24; dkim-atps=neutral
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RQnL3GytzDr2P
 for <openbmc@lists.ozlabs.org>; Wed, 20 May 2020 05:24:53 +1000 (AEST)
Received: by mail-qk1-x736.google.com with SMTP id 190so908428qki.1
 for <openbmc@lists.ozlabs.org>; Tue, 19 May 2020 12:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language;
 bh=x/mAc/kCNcXnhDgJ+ZGk6+0NanOlPvL9WLr2Cgjd4SQ=;
 b=NjrYdG24g7i+xX0foiyh+eDIUnkLWBzv6E8U90EQ+oNEcTvSlZM7nA3hOeM3Fa0W5O
 JECiBEDJfPDDHz9/ufXSRSy4iv4x1BV2r4jPKnMetklD8lWGx96T9M8xPDKlcSdylwaI
 OD7Zew1aJKCTjIZY2gAHisRQnWY43QvexxL/AvVhycxzRZs9EDBQvh3WSIdpn/frwVrB
 MlibxJidIJbmOZ7tbJ/z0wtfLk2rR8ILexPY8SQVLWnNzjdTJNXTElhmn7x3Okl2+Awf
 n/HeKGdNgf7eu77tUd4j77R8qdU8uQEgDEWK9L3a9UMNXMEsf9RlhkaKiD4Q/w/LeQSR
 3G/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=x/mAc/kCNcXnhDgJ+ZGk6+0NanOlPvL9WLr2Cgjd4SQ=;
 b=pFupIgckQwlmmcxpPzETvlwOKJsBVQtj99g0Dr5hSZM/6voFJ6fwfLHTkyDIkOlFBz
 Nn1o7ptuZkW7u7hrfJ22C3mVks5v+h4eL1sgkadV8EG8Wq7bc9qINjsINbD4TVp2j60k
 axMWwp4Dp8Lz3KDzsKBEaUgbevXgH3PeqeUKL8x+/FxOAzDhcGGmd9JAuNUkWk7gbw3W
 ZGPU9bIFNmF/chWW+VlaUxHJYv521vXEho1EzfhS4sOu8gU72kuVvt/ID/tHKXU6keMv
 U8WPAVIublVQVMkc0cxbQxyxfK7SlIimywpwTek4O0MNuU+r33fjgiRHkVf+Z6Ee5kJL
 hPsw==
X-Gm-Message-State: AOAM530NfKLrMMWJAdYPVX/g3k/jO5ZOdyzUlpPaWbnOGfJsQthgg/ta
 VOXM62lOzZZC5+2ihW59sw3zjHTVtrM=
X-Google-Smtp-Source: ABdhPJyH/MC71EWg56QFRmdEy+WFM4x6NoQagGJTpROFRBB1WmR7wPzsh3bWZRgBBmbD/rLreLPdMA==
X-Received: by 2002:a05:620a:4e5:: with SMTP id
 b5mr1092709qkh.254.1589916289032; 
 Tue, 19 May 2020 12:24:49 -0700 (PDT)
Received: from [192.168.1.110] (096-042-251-064.res.spectrum.com.
 [96.42.251.64])
 by smtp.gmail.com with ESMTPSA id n5sm337729qke.124.2020.05.19.12.24.47
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2020 12:24:48 -0700 (PDT)
Subject: Re: about i2cset tool
To: openbmc@lists.ozlabs.org
References: <HK2PR04MB38266B4510637846C7FAF9FCFEB90@HK2PR04MB3826.apcprd04.prod.outlook.com>
From: Brandon Wyman <bjwyman@gmail.com>
Message-ID: <28c93e52-3e69-79b4-69f0-c30d2422dbc2@gmail.com>
Date: Tue, 19 May 2020 14:24:47 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <HK2PR04MB38266B4510637846C7FAF9FCFEB90@HK2PR04MB3826.apcprd04.prod.outlook.com>
Content-Type: multipart/alternative;
 boundary="------------23673012E74F252B120DA913"
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
--------------23673012E74F252B120DA913
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2020-05-19 02:40, zhouyuanqing8@outlook.com wrote:
> Hi All
>
>     I use the i2cget to read the device data, but the i2cset did not 
> write the data to the device, and the operation of i2cset did not 
> report any errors.
>
> for example:
>
> root@starlake-bmc:/usr/sbin# i2cget 9 0x10 0x00 i 3
> WARNING! This program can confuse your I2C bus, cause data loss and worse!
> I will read from device file /dev/i2c-9, chip address 0x10, data address
> 0x00, 3 bytes using read I2C block data.
> Continue? [Y/n]
> 3: 0x02 0x32 0xcc
>
> root@starlake-bmc:/usr/sbin# i2cset 9 0x10 0x82 0x0101 2
> WARNING! This program can confuse your I2C bus, cause data loss and worse!
> I will read from device file /dev/i2c-9, chip address 0x10, data address
> 0x00, using read word data.

Well, that is a bit odd. It looks like that just did a read, not a write.


Do you need to use the force access option? What is that 2? Should it be 
a word (w)?

https://linux.die.net/man/8/i2cset

i2cset -f 9 0x10 0x82 0x0101 w

>
> when I check the 0x82 reg，the value is not changed.
>
> Thanks
> harley
>

--------------23673012E74F252B120DA913
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-05-19 02:40,
      <a class="moz-txt-link-abbreviated" href="mailto:zhouyuanqing8@outlook.com">zhouyuanqing8@outlook.com</a> wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:HK2PR04MB38266B4510637846C7FAF9FCFEB90@HK2PR04MB3826.apcprd04.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <style type="text/css" style="display:none;"> P {margin-top:0;margin-bottom:0;} </style>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        Hi All</div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
            I use the i2cget to read the device data, but the i2cset did
        not write the data to the device, and the operation of i2cset
        did not report any errors.<br>
      </div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        for example:</div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        <span>root@starlake-bmc:/usr/sbin# i2cget 9 0x10 0x00 i 3<br>
        </span>
        <div>WARNING! This program can confuse your I2C bus, cause data
          loss and worse!<br>
        </div>
        <div>I will read from device file /dev/i2c-9, chip address 0x10,
          data address<br>
        </div>
        <div>0x00, 3 bytes using read I2C block data.<br>
        </div>
        <div>Continue? [Y/n]<br>
        </div>
        <div>3: 0x02 0x32 0xcc<br>
        </div>
        <div><br>
        </div>
        <div>root@starlake-bmc:/usr/sbin# i2cset 9 0x10 0x82 0x0101 2<br>
        </div>
        <div>WARNING! This program can confuse your I2C bus, cause data
          loss and worse!<br>
        </div>
        <div>I will read from device file /dev/i2c-9, chip address 0x10,
          data address<br>
        </div>
        <span>0x00, using read word data.</span></div>
    </blockquote>
    <p>Well, that is a bit odd. It looks like that just did a read, not
      a write.</p>
    <p><br>
    </p>
    <p>Do you need to use the force access option? What is that 2?
      Should it be a word (w)?<br>
    </p>
    <p><a class="moz-txt-link-freetext" href="https://linux.die.net/man/8/i2cset">https://linux.die.net/man/8/i2cset</a></p>
    <p>i2cset -f 9 0x10 0x82 0x0101 w<br>
    </p>
    <blockquote type="cite"
cite="mid:HK2PR04MB38266B4510637846C7FAF9FCFEB90@HK2PR04MB3826.apcprd04.prod.outlook.com">
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        <span><br>
        </span></div>
      <div><font size="3" face="Calibri, Arial, Helvetica, sans-serif"
          color="#000000">when </font><font face="Calibri, Arial,
          Helvetica, sans-serif" color="#000000"><span
            style="caret-color: rgb(0, 0, 0);">I</span></font><font
          size="3" face="Calibri, Arial, Helvetica, sans-serif"
          color="#000000"> check the 0x82 reg，the value is not changed.</font></div>
      <div><font size="3" face="Calibri, Arial, Helvetica, sans-serif"
          color="#000000"><br>
        </font></div>
      <div><font size="3" face="Calibri, Arial, Helvetica, sans-serif"
          color="#000000">Thanks</font></div>
      <div><font size="3" face="Calibri, Arial, Helvetica, sans-serif"
          color="#000000">harley</font></div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        <span><br>
        </span></div>
    </blockquote>
  </body>
</html>

--------------23673012E74F252B120DA913--
