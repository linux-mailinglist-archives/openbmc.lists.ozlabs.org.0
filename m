Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A7E3B3506
	for <lists+openbmc@lfdr.de>; Thu, 24 Jun 2021 19:50:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9njJ104Rz3091
	for <lists+openbmc@lfdr.de>; Fri, 25 Jun 2021 03:50:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=j46HZGuN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d31;
 helo=mail-io1-xd31.google.com; envelope-from=bjwyman@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=j46HZGuN; dkim-atps=neutral
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9nhx2L17z306r
 for <openbmc@lists.ozlabs.org>; Fri, 25 Jun 2021 03:50:08 +1000 (AEST)
Received: by mail-io1-xd31.google.com with SMTP id g22so9367542iom.1
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jun 2021 10:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=vIvp5jhVhiKjRxYQVD8HMzblb2G6Xvdh3OJm349TqgA=;
 b=j46HZGuN/FqzntP8mZvKF0GY5DZ3gIQnpzvYTqgr1inXZfYJLep7ARhWZlKzOZBYhW
 pI5xAkl5xZUVTiqdp8ZAIRcgp1XM5XCFTX8DasXBTQ84zXPkJsTvMPjZpGCrrHoJlm+3
 afZRom5OYj8p+397vqE1OOSxKfmTxpe5YqEm+1zBAI3R4yRd6iOBa9KER/1VAhj0OkhE
 R8AbcAtqyTEIqS9EGF6r5DbidarB9Z5+UlNsnrR2JKUvo5dG1en0kxRleFVyod1H09rv
 7PJybufYnNCHHTVx/ABhf0gxwnFo4MqxGsSyNZyCrYXoPs9C0WHYTxAe5/kvkQVQFCHi
 8RNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=vIvp5jhVhiKjRxYQVD8HMzblb2G6Xvdh3OJm349TqgA=;
 b=oq3bgpMPdgIiomQgu+pZC60NFPwtTdU2XfomzrSIByEb/na8T9WvBkz4KVEAmL/dlC
 KJ5BlRPTBXE3sCpK/B+o5XE9K4N6PZPqglvRSIpxi20XL8P1Dow/QR96DrivvzJp8x/v
 s7EOn9PTYN9Cfc8tTGlSR58kBUTBCcYOr96kjfKrglw/nHs/h+mhR7XkRQLdnffbkhB7
 PTE1WmmRhPluwmcFsU2LsK9IWyNmeD9XcORamdAl8WLnnd1DweGJaeGAuwb/VCsbFxBt
 /UXL1kHXUhZMTkwdm8ISaqNBYYKXN9e6nN9KBX1IlStkXSspFsqbmhNTw1ceyYJ5eehz
 oJrQ==
X-Gm-Message-State: AOAM5309/0NVZaIy5LEfjkrz1M4Yn/ao7bou0sXE9YwXfmO5rP6nVEx5
 VimP5aqd/tSecSwvLJ4HMoU=
X-Google-Smtp-Source: ABdhPJzxJOvLEOeOXhMMFGKgfn67K4BcoKpalQNuJDzd6w9s7ZfA/hnd+xT5riN4NwgnO6Z1CEM7Zg==
X-Received: by 2002:a6b:3b16:: with SMTP id i22mr5079292ioa.36.1624557003783; 
 Thu, 24 Jun 2021 10:50:03 -0700 (PDT)
Received: from [192.168.4.31] (199-48-94-117.rochmnaa.metronetinc.net.
 [199.48.94.117])
 by smtp.gmail.com with ESMTPSA id n17sm2246861ilt.16.2021.06.24.10.50.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 10:50:03 -0700 (PDT)
Subject: Re: [Phosphor-power] psu-ng: Add method to get PSU conf from D-Bus.
To: Chanh Nguyen OS <chanh@os.amperecomputing.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <SN6PR01MB4973940AAE8F62B61613C2BB95089@SN6PR01MB4973.prod.exchangelabs.com>
From: Brandon Wyman <bjwyman@gmail.com>
Message-ID: <7a434ef2-c15d-be17-e443-2eedf5fc3ed4@gmail.com>
Date: Thu, 24 Jun 2021 12:50:02 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <SN6PR01MB4973940AAE8F62B61613C2BB95089@SN6PR01MB4973.prod.exchangelabs.com>
Content-Type: multipart/alternative;
 boundary="------------D39B40108939505B6677D16F"
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
Cc: "spinler@us.ibm.com" <spinler@us.ibm.com>,
 Thang Nguyen <thangqn@amperecomputing.com>,
 "shawnmm@us.ibm.com" <shawnmm@us.ibm.com>, Phong Vo <pvo@amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------D39B40108939505B6677D16F
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit


On 2021-06-23 04:11, Chanh Nguyen OS wrote:
> Hi B. J. Wyman,
>
> I'm using the psu-ng to monitor the PSU. I used the 
> */pmbus/*(https://github.com/openbmc/linux/blob/dev-5.10/Documentation/hwmon/pmbus.rst 
> <https://github.com/openbmc/linux/blob/dev-5.10/Documentation/hwmon/pmbus.rst>) 
> driver to support hardware monitoring for the PSU, don't use the 
> */ibm-cffps/*driver 
> (https://github.com/openbmc/linux/blob/dev-5.10/Documentation/hwmon/ibm-cffps.rst 
> <https://github.com/openbmc/linux/blob/dev-5.10/Documentation/hwmon/ibm-cffps.rst>)
>
> I don't clear why we fix to use the *IBMCFFPSInterface 
> (https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-power/+/38138/10/phosphor-power-supply/psu_manager.cpp#16 
> <https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-power/+/38138/10/phosphor-power-supply/psu_manager.cpp#16>)* ?

Yeah, that was sort of a short-sighted updated. That probably should 
have been something configurable:

https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-power/+/43018/8/phosphor-power-supply/power_supply.cpp#30


That is used to get the power supply information off of D-Bus, hopefully 
populated by the entity-manager service.

https://github.com/openbmc/entity-manager/blob/master/schemas/IBM.json

https://github.com/openbmc/entity-manager/blob/master/configurations/Nisqually.json


This should *NOT* be IBM specific, but I had some kind of blinders on 
when I wrote this.

>
> Thanks,
> Chanh Nguyen
>

--------------D39B40108939505B6677D16F
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-06-23 04:11, Chanh Nguyen OS
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:SN6PR01MB4973940AAE8F62B61613C2BB95089@SN6PR01MB4973.prod.exchangelabs.com">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      <style type="text/css" style="display:none;">P {margin-top:0;margin-bottom:0;}</style>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        Hi <span style="color: rgb(33, 33, 33); font-family:
          var(--header-font-family); font-size: var(--font-size-h3);
          font-weight: var(--font-weight-h3);">B. J. Wyman,</span></div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        <span style="color: rgb(33, 33, 33); font-family:
          var(--header-font-family); font-size: var(--font-size-h3);
          font-weight: var(--font-weight-h3);"><br>
        </span></div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        <span style="color: rgb(33, 33, 33); font-family:
          var(--header-font-family); font-size: var(--font-size-h3);
          font-weight: var(--font-weight-h3);">I'm using the psu-ng to
          monitor the PSU. I used the
        </span><span style="color: rgb(33, 33, 33); font-family:
          var(--header-font-family); font-size: var(--font-size-h3);"><b><i>pmbus</i></b></span><span
          style="color: rgb(33, 33, 33); font-family:
          var(--header-font-family); font-size: var(--font-size-h3);"><span
            style="font-weight: var(--font-weight-h3);"> (</span><a
href="https://github.com/openbmc/linux/blob/dev-5.10/Documentation/hwmon/pmbus.rst"
            id="LPlnk" style="font-weight: var(--font-weight-h3);"
            moz-do-not-send="true">https://github.com/openbmc/linux/blob/dev-5.10/Documentation/hwmon/pmbus.rst</a><span
            style="font-weight: var(--font-weight-h3);">) driver to </span><span
            style="color: rgb(36, 41, 46); font-family: -apple-system,
            system-ui, &quot;Segoe UI&quot;, Helvetica, Arial,
            sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI
            Emoji&quot;; background-color: rgb(255, 255, 255); display:
            inline !important;"><span style="font-weight:
              var(--font-weight-h3);">support hardware monitoring for
              the PSU, don't use the </span><b><i>ibm-cffps</i></b><span
              style="font-weight: var(--font-weight-h3);"> driver (</span><a
href="https://github.com/openbmc/linux/blob/dev-5.10/Documentation/hwmon/ibm-cffps.rst"
              id="LPlnk396586" style="font-weight:
              var(--font-weight-h3);" moz-do-not-send="true">https://github.com/openbmc/linux/blob/dev-5.10/Documentation/hwmon/ibm-cffps.rst</a><span
              style="font-weight: var(--font-weight-h3);">)</span></span></span></div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        I don't clear why we fix to use the <b>IBMCFFPSInterface (<a
href="https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-power/+/38138/10/phosphor-power-supply/psu_manager.cpp#16"
            id="LPlnk923907" moz-do-not-send="true">https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-power/+/38138/10/phosphor-power-supply/psu_manager.cpp#16</a>)</b> ?</div>
    </blockquote>
    <p>Yeah, that was sort of a short-sighted updated. That probably
      should have been something configurable:</p>
    <p><a class="moz-txt-link-freetext" href="https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-power/+/43018/8/phosphor-power-supply/power_supply.cpp#30">https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-power/+/43018/8/phosphor-power-supply/power_supply.cpp#30</a></p>
    <p><br>
    </p>
    <p>That is used to get the power supply information off of D-Bus,
      hopefully populated by the entity-manager service.</p>
    <p><a class="moz-txt-link-freetext" href="https://github.com/openbmc/entity-manager/blob/master/schemas/IBM.json">https://github.com/openbmc/entity-manager/blob/master/schemas/IBM.json</a><br>
    </p>
    <p><a class="moz-txt-link-freetext" href="https://github.com/openbmc/entity-manager/blob/master/configurations/Nisqually.json">https://github.com/openbmc/entity-manager/blob/master/configurations/Nisqually.json</a></p>
    <p><br>
    </p>
    <p>This should *NOT* be IBM specific, but I had some kind of
      blinders on when I wrote this.<br>
    </p>
    <blockquote type="cite"
cite="mid:SN6PR01MB4973940AAE8F62B61613C2BB95089@SN6PR01MB4973.prod.exchangelabs.com">
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        Thanks,</div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        Chanh Nguyen</div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
    </blockquote>
  </body>
</html>

--------------D39B40108939505B6677D16F--
